package cn.yzw.myblog.service;

import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service("sensitiveWordService")
public class SensitiveWordService {


    private StringBuilder replaceAll;

    /**
     * 编码
     * <P>
     * 在读敏感词汇文件时需要用到
     */
    private String encoding = "UTF-8";

    /**
     * 替换字符窜
     * <P>
     * 用于替换敏感词汇的字符窜
     */
    private String replceStr = "*";

    /**
     *单次替换的敏感词汇的长度
     */
    private int replceSize = 500;

    /**
     * 敏感词汇文件
     * <P>
     * 此文件放在资源文件的根目录下
     */
    private String fileName = "sensitiveWord.txt";

    private List<String> arrayList;

    /**
     * 包含的敏感词列表，过滤掉重复项
     */
    private Set<String> sensitiveWordSet;

    /**
     * 包含的敏感词列表，包括重复项，统计次数
     */
    private List<String> sensitiveWordList;

    /**
     * 移除敏感词汇
     *
     * @param str 需要过滤的字符窜
     *
     * @return 过滤之后的字符窜
     */
    public String removeSensitiveWord(String str){
        SensitiveWordService sw = new SensitiveWordService("sensitiveWord.txt");
        sw.InitializationWork();
        return sw.filterInfo(str);
    }

    /**
     * 拦截信息
     * <P>
     * 过滤掉敏感词汇的方法
     *
     * @param str 将要被过滤信息
     *
     * @return 过滤后的信息
     */
    private String filterInfo(String str) {
        sensitiveWordSet = new HashSet<String>();
        sensitiveWordList= new ArrayList<>();
        StringBuilder buffer = new StringBuilder(str);
        HashMap<Integer, Integer> hash = new HashMap<Integer, Integer>(arrayList.size());
        String temp;
        for(int x = 0; x < arrayList.size();x++) {
            temp = arrayList.get(x);
            int findIndexSize = 0;
            for(int start = -1;(start=buffer.indexOf(temp,findIndexSize)) > -1;){
                //System.out.println("###replace="+temp);
                findIndexSize = start+temp.length();//从已找到的后面开始找
                Integer mapStart = hash.get(start);//起始位置
                //满足1个，即可更新map
                if(mapStart == null || (mapStart != null && findIndexSize > mapStart)){
                    hash.put(start, findIndexSize);
                    //System.out.println("###敏感词："+buffer.substring(start, findIndexSize));
                }
            }
        }
        Collection<Integer> values = hash.keySet();
        for(Integer startIndex : values){
            Integer endIndex = hash.get(startIndex);
            //获取敏感词，并加入列表，用来统计数量
            String sensitive = buffer.substring(startIndex, endIndex);
            //System.out.println("###敏感词："+sensitive);
            if (!sensitive.contains("*")) {//添加敏感词到集合
                sensitiveWordSet.add(sensitive);
                sensitiveWordList.add(sensitive);
            }
            buffer.replace(startIndex, endIndex, replaceAll.substring(0,endIndex-startIndex));
        }
        hash.clear();
        return buffer.toString();
    }

    /**
     *   初始化敏感词库
     */
    private void InitializationWork() {
        replaceAll = new StringBuilder(replceSize);
        for(int x=0;x < replceSize;x++)
        {
            replaceAll.append(replceStr);
        }
        //加载词库
        arrayList = new ArrayList<String>();
        InputStreamReader read = null;
        String path = SensitiveWordService.class.getResource("/").getPath()+fileName;
        File file = new File(path);
        BufferedReader bufferedReader = null;
        try {
            read = new InputStreamReader(new FileInputStream(file),encoding);
            bufferedReader = new BufferedReader(read);
            for(String txt = null;(txt = bufferedReader.readLine()) != null;){
                if(!arrayList.contains(txt))
                    arrayList.add(txt);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
            try {
                if(null != bufferedReader)
                    bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if(null != read)
                    read.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 有参构造
     * <P>
     * 文件要求路径在src或resource下，默认文件名为sensitiveWord.txt
     * @param fileName 词库文件名(含后缀)
     */
    public SensitiveWordService(String fileName) {

        this.fileName = fileName;
    }

    /**
     * 有参构造
     *
     * @param replceStr 敏感词被转换的字符
     * @param replceSize 初始转义容量
     */
    public SensitiveWordService(String replceStr, int replceSize){
        this.replceStr = fileName;
        this.replceSize = replceSize;
    }

    /**
     * 无参构造
     */
    public SensitiveWordService(){
    }
}