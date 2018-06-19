$(document).on('turbolinks:load ajax:complete', function () {
    var iScrollPos = 0;
    var isLoading = false;
    var currentLoadingIcon;

    $(document).ajaxComplete(function () {
        isLoading = false;
        //読み込みアイコンを隠す
        if (currentLoadingIcon !== undefined) {
            currentLoadingIcon.hide();
        }
    });

    $('.messages-list', this).scroll(function () {
        var iCurScrollPos = $(this).scrollTop();

        if (iCurScrollPos > iScrollPos) {
            //スクロールダウン
        } else {
            //スクロールアップ
            if (iCurScrollPos < 300 && isLoading == false && $('.load-more-messages', this).length) {
                //さらに10個のメッセージをロードするトリガーリンク
                $('.load-more-messages', this)[0].click();
                isLoading = true;

                //会話ウィンドウの読み込みアイコンを選択して表示する
                currentLoadingIcon = $('.loading-more-messages', this);
                currentLoadingIcon.show();
            }
        }
        iScrollPos = iCurScrollPos;
    });
});