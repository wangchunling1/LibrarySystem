package com.oracle.web.bean;

import java.io.InputStream;

public class DownLoad {

	private String filename;//页面传过来的文件名

	private String contentType;//文件MIME类型
	
	private long contentLength;//文件的大小
	
	private String contentDisposition;//下载弹出的信息
	
	private InputStream inputStream;//一个输入流

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public DownLoad(String filename, String contentType, long contentLength, String contentDisposition,
			InputStream inputStream) {
		super();
		this.filename = filename;
		this.contentType = contentType;
		this.contentLength = contentLength;
		this.contentDisposition = contentDisposition;
		this.inputStream = inputStream;
	}

	public DownLoad() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "DownLoad [filename=" + filename + ", contentType=" + contentType + ", contentLength=" + contentLength
				+ ", contentDisposition=" + contentDisposition + ", inputStream=" + inputStream + "]";
	}
	
	
}
