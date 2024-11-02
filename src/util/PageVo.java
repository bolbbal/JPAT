package util;

public class PageVo {

    private int startPage;
    private int endPage;
    private boolean prev, next;
    private int total;
    private int realEnd;
    private Criteria cri;

    public PageVo(Criteria cri, int total) {

        this.cri = cri;
        this.total = total;

        // 페이지 당 항목 수에 따른 실제 마지막 페이지 번호 계산
        this.realEnd = (int) Math.ceil((double) total / cri.getAmount());

        // 현재 페이지 블록의 마지막 페이지 계산 (예: 5개씩 페이징)
        this.endPage = (int) Math.ceil(cri.getPageNum() / 5.0) * 5;
        this.startPage = this.endPage - 4;

        // 실제 끝 페이지보다 endPage가 클 경우 조정
        if (this.realEnd < this.endPage) {
            this.endPage = this.realEnd;
        }

        // 이전, 다음 버튼 표시 여부 설정
        this.prev = this.startPage > 1;
        this.next = this.endPage < this.realEnd;
    }

    // Getter 및 Setter
    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getRealEnd() {
        return realEnd;
    }

    public Criteria getCri() {
        return cri;
    }
}
