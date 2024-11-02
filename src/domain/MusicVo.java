package domain;

public class MusicVo {
	private int music_idx;
	private int singer_idx;
	private String music;
	private String lyrics;
	public int getMusic_idx() {
		return music_idx;
	}
	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}
	public int getSinger_idx() {
		return singer_idx;
	}
	public void setSinger_idx(int singer_idx) {
		this.singer_idx = singer_idx;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	
	
}
