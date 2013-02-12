# プロンプトにgit情報表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors && colors

zstyle ':vcs_info:*' formats '%s:%b' '%m'
zstyle ':vcs_info:*' actionformats '%s:%b' '%m' '%a'


if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    # zstyle ':vcs_info:git:*' formats '%s:%b' '%c%u %m'
    # zstyle ':vcs_info:git:*' actionformats '%s:%b' '%c%u %m' '%a'
    # zstyle ':vcs_info:git:*' check-for-changes true
    # zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    # zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi


# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-push-status

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
    }

    # push していないコミットの件数表示
    #
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        # if [[ "${hook_com[branch]}" != "master" ]]; then
        #     # master ブランチでない場合は何もしない
        #     return 0
        # fi

        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/${hook_com[branch]}..${hook_com[branch]} 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            # hook_com[misc]+="(p${ahead})"
            hook_com[misc]+="${ahead}"
        fi
    }
fi


function _precmd_vcs_info() { 
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    [[ -n "$vcs_info_msg_1_" ]] && psvar[2]="$vcs_info_msg_1_"
    [[ -n "$vcs_info_msg_2_" ]] && psvar[3]="$vcs_info_msg_2_"
}
add-zsh-hook precmd _precmd_vcs_info