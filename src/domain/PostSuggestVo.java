package domain;

public class PostSuggestVo {
	private int post_type_idx;
	private int post_idx;
	private String youtube_url;
	private String thumnail;
	private String music;
	private String singer;
	private String lyrics;
	
	public int getPost_type_idx() {
		return post_type_idx;
	}
	public void setPost_type_idx(int post_type_idx) {
		this.post_type_idx = post_type_idx;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getYoutube_url() {
		return youtube_url;
	}
	public void setYoutube_url(String youtube_url) {
		this.youtube_url = youtube_url;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	
}
