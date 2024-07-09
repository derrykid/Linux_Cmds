<h2>查看與編輯 <code>crontab</code></h2>
<p>在 Linux 系統上，每一位使用者都可以自訂自己的 <code>crontab</code> 排程工作，若要查看自己的 <code>crontab</code> 內容，可以使用 <code>crontab</code> 指令加上 <code>-l</code> 參數：</p>
<pre><span class="Comment"># 查看自己的 crontab</span>
crontab <span class="Special">-l</span></pre>
<p>如果是系統管理者要查詢特定使用者的 <code>crontab</code> 的話，可以使用 <code>-u</code> 參數指定使用者名稱：</p>
<pre><span class="Comment"># 查看指定使用者的 crontab</span>
sudo crontab <span class="Special">-u</span> gtwang <span class="Special">-l</span></pre>
<p>若要編輯自己的 <code>crontab</code> 內容，可以加上 <code>-e</code> 參數：</p>
<pre><span class="Comment"># 編輯 crontab 內容</span>
crontab <span class="Special">-e</span></pre>
<p>系統管理者若要編輯特定使用者的 crontab 內容，同樣是加上 <code>-u</code> 參數並指定使用者即可：</p>
<pre><span class="Comment"># 編輯指定使用者的 crontab</span>
crontab <span class="Special">-u</span> gtwang <span class="Special">-e</span></pre>
<p>若要刪除目前所有的 <code>crontab</code>，可以使用 <code>-r</code> 參數：</p>
<pre><span class="Comment"># 刪除 crontab 內容</span>
crontab <span class="Special">-r</span></pre>
<div style="margin: 40px 0;"><!-- GTWang 文章 inline -->
<ins class="adsbygoogle"
     style="display:block; text-align:center;"
     data-ad-format="fluid"
     data-ad-layout="in-article"
     data-ad-client="ca-pub-7794009487786811"
     data-ad-slot="7302780695"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></div><h2>個人 <code>crontab</code> 設定</h2>
<p>在個人的 <code>crontab</code> 設定中，基本上每一行設定就代表一個要定期執行的程式，其格式如下：</p>
<div class="tldr-block">MIN HOUR DOM MON DOW CMD</div>
<p>一行設定包含六個部分，各部分的意義如下：</p>
<table>
<tbody>
<tr>
<th>欄位</th>
<th>說明</th>
<th>可設定的值</th>
</tr>
<tr>
<td>MIN</td>
<td>分鐘</td>
<td><code>0</code> 到 <code>59</code></td>
</tr>
<tr>
<td>HOUR</td>
<td>小時</td>
<td><code>0</code> 到 <code>23</code></td>
</tr>
<tr>
<td>DOM</td>
<td>日</td>
<td><code>1</code> 到 <code>31</code></td>
</tr>
<tr>
<td>MON</td>
<td>月份</td>
<td><code>1</code> 到 <code>12</code>，此欄位亦可用英文簡稱取代，例如一月也可以寫 <code>Jan</code>。</td>
</tr>
<tr>
<td>DOW</td>
<td>星期幾</td>
<td><code>0</code>（週日）到 <code>6</code>（週六），<code>7</code> 也代表週日。此欄位亦可用英文簡稱取代，例如週日也可以寫 <code>Sun</code>。</td>
</tr>
<tr>
<td>CMD</td>
<td>要定期執行的指令</td>
<td>任何可執行的程式或指令稿（包含參數），例如 <code>/path/to/cmd --your --parameter</code>。</td>
</tr>
</tbody>
</table>
<p>除了一般的數字之外，<code>crontab</code> 亦可使用一些特殊字元，每個特殊字元都有不同的意義與適用情況：</p>
<table style="width: 100%;">
<tbody>
<tr>
<th style="width: 17.2078%;">特殊字元</th>
<th style="width: 82.6298%;">代表意義</th>
</tr>
<tr>
<td style="width: 17.2078%;">星號（<code>*</code>）</td>
<td style="width: 82.6298%;">代表接受任意時刻，例如若在月份那一欄填入星號，則代表任一月份皆可。</td>
</tr>
<tr>
<td style="width: 17.2078%;">逗號（<code>,</code>）</td>
<td style="width: 82.6298%;">分隔多個不同時間點。例如若要指定 3:00、6:00 與 9:00 三個時間點執行指令，就可以在第二欄填入 <code>3,6,9</code>。</td>
</tr>
<tr>
<td style="width: 17.2078%;">減號（<code>-</code>）</td>
<td style="width: 82.6298%;">代表一段時間區間，例如若在第二欄填入 <code>8-12</code> 就代表從 8 點到 12 點的意思，也就是等同於 <code>8,9,10,11,12</code>。</td>
</tr>
<tr>
<td class="tcenter" style="width: 17.2078%;">斜線加數字（<code>/n</code>）</td>
<td style="width: 82.6298%;">n 代表數字，這樣寫的意思就是「每隔 n 的單位」的意思，例如若在第一欄填入 <code>*/5</code> 就代表每間隔五分鐘執行一次的意思，也可以寫成 <code>0-59/5</code>。</td>
</tr>
</tbody>
</table>
<p>由於 <code>crontab</code> 設定的欄位有點多，不常用的人通常都記不住，建議在編輯 <code>crontab</code> 時，可以將以下的註解貼在設定檔內，方便參考。</p>
<pre><span class="Comment"># ┌───────────── 分鐘   (0 - 59)</span>
<span class="Comment"># │ ┌─────────── 小時   (0 - 23)</span>
<span class="Comment"># │ │ ┌───────── 日     (1 - 31)</span>
<span class="Comment"># │ │ │ ┌─────── 月     (1 - 12)</span>
<span class="Comment"># │ │ │ │ ┌───── 星期幾 (0 - 7，0 是週日，6 是週六，7 也是週日)</span>
<span class="Comment"># │ │ │ │ │</span>
<span class="Comment"># * * * * * /path/to/command</span></pre>
<p>以下是一些最基本的 <code>crontab</code> 設定範例。</p>
<pre><span class="Comment"># 每天早上 8 點 30 分執行</span>
<span class="Constant">30</span><span class="PreProc"> 08</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 每週日下午 6 點 30 分執行</span>
<span class="Constant">30</span><span class="PreProc"> 18</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> 0</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 每週日下午 6 點 30 分執行</span>
<span class="Constant">30</span><span class="PreProc"> 18</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> Sun</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 每年 6 月 10 日早上 8 點 30 分執行</span>
<span class="Constant">30</span><span class="PreProc"> 08</span><span class="Type"> 10</span><span class="Constant"> 06</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 每月 1 日、15 日、29 日晚上 9 點 30 分各執行一次</span>
<span class="Constant">30</span><span class="PreProc"> 21</span><span class="Type"> 1,15,29</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 每隔 10 分鐘執行一次</span>
<span class="Constant">*/10</span><span class="PreProc"> *</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span>

<span class="Comment"># 從早上 9 點到下午 6 點，凡遇到整點就執行</span>
<span class="Constant">00</span><span class="PreProc"> 09-18</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span></pre>
<div style="margin: 40px 0;"><!-- GTWang 文章 inline -->
<ins class="adsbygoogle"
     style="display:block; text-align:center;"
     data-ad-format="fluid"
     data-ad-layout="in-article"
     data-ad-client="ca-pub-7794009487786811"
     data-ad-slot="7302780695"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></div><h2>系統設定檔</h2>
<p>除了一般使用者各自的排程工作之外，的還有一類的是屬於系統的排程工作，這類的設定寫在 <code>/etc/crontab</code> 檔案與 <code>/etc/cron.d/</code> 目錄下的各個設定檔中。</p>
<p>系統的 <code>crontab</code> 設定檔內容跟普通使用者的 <code>crontab</code> 類似，不過多了一個使用者名稱的欄位：</p>
<div class="tldr-block">MIN HOUR DOM MON DOW <span style="color:#CC0000;">USER</span> CMD</div>
<p>例如每小時以 <code>gtwang</code> 帳號權限執行一次，則可以這樣寫：</p>
<pre><span class="Comment"># 每小時以 gtwang 帳號權限執行一次</span>
<span class="Constant">0</span><span class="PreProc"> *</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">gtwang /home/gtwang/script.sh --your --parameter</span></pre>
<p>在系統的 <code>crontab</code> 設定檔中，只是多了一個使用者的欄位，其餘的設定方式都跟一般使用者的 <code>crontab</code> 相同。</p>
<h2>特殊排程規則</h2>
<p><code>crontab</code> 除了以標準的格式撰寫排程工作之外，他也有提供幾個常用的特殊排程規則，這種特殊排程規則都以 <code>@</code> 開頭，以下是每個特殊排程規則的說明：</p>
<table>
<tr>
<th>排程規則</th>
<th>說明</th>
</tr>
<tr>
<td><code>@reboot</code></td>
<td>每次重新開機之後，執行一次。</td>
</tr>
<tr>
<td><code>@yearly</code></td>
<td>每年執行一次，亦即 <code>0 0 1 1 *</code>。</td>
</tr>
<tr>
<td><code>@annually</code></td>
<td>每年執行一次，亦即 <code>0 0 1 1 *</code>。</td>
</tr>
<tr>
<td><code>@monthly</code></td>
<td>每月執行一次，亦即 <code>0 0 1 * *</code>。</td>
</tr>
<tr>
<td><code>@weekly</code></td>
<td>每週執行一次，亦即 <code>0 0 * * 0</code>。</td>
</tr>
<tr>
<td><code>@daily</code></td>
<td>每天執行一次，亦即 <code>0 0 * * *</code>。</td>
</tr>
<tr>
<td><code>@hourly</code></td>
<td>每小時執行一次，亦即 <code>0 * * * *</code>。</td>
</tr>
</table>
<p>例如每天執行一次，就可以這樣寫：</p>
<pre><span class="Comment"># 每天執行一次</span>
<span class="Special">@daily</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span></pre>
<h2>Email 通知設定</h2>
<p><code>crontab</code> 預設會將執行程式的輸出以 Email 送給執行的使用者，若要更改收件者，可以使用 <code>MAILTO</code> 變數指定：</p>
<pre><span class="Comment"># 將輸出寄給 gtwang（不論這個 crontab 是誰的）</span>
<span class="Identifier">MAILTO</span>=gtwang

<span class="Comment"># 排程設定</span>
<span class="Constant">30</span><span class="PreProc"> 08</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span></pre>
<p>如果不想讓 <code>crontab</code> 寄送任何 Email 出來，可將 <code>MAILTO</code> 設定為空字串：</p>
<pre><span class="Comment"># 不寄送任何 Email</span>
<span class="Identifier">MAILTO</span>=""

<span class="Comment"># 排程設定</span>
<span class="Constant">30</span><span class="PreProc"> 08</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span></pre>
<h2>執行 Shell</h2>
<p>若要更改執行工作的 Shell 環境，可以使用 <code>SHELL</code> 來指定要使用的 Shell：</p>
<pre><span class="Comment"># 設定使用 /bin/sh 執行</span>
<span class="Identifier">SHELL</span>=/bin/sh

<span class="Comment"># 排程設定</span>
<span class="Constant">30</span><span class="PreProc"> 08</span><span class="Type"> *</span><span class="Constant"> *</span><span class="PreProc"> *</span> <span class="Statement">/home/gtwang/script.sh --your --parameter</span></pre>
<h2>限制使用者使用 <code>crontab</code></h2>
<p>由於系統安全性的考量，我們可能會希望限制只有特定的使用者可以使用 <code>crontab</code>，這時候就可以透過系統的 <code>/etc/cron.allow</code> 或 <code>/etc/cron.deny</code> 兩個檔案來設定。</p>
<dl>
<dt><code>/etc/cron.allow</code></dt>
<dd>如果這個檔案存在，則只有被列在這裡的帳號可以使用 <code>crontab</code>，其餘帳號皆禁止使用，也就是白名單。</dd>
<dt><code>/etc/cron.deny</code></dt>
<dd>如果這個檔案存在，則被列在這裡的使用者都禁止使用 <code>crontab</code>，也就是黑名單。</dd>
</dl>
<p><code>/etc/cron.allow</code> 與 <code>/etc/cron.deny</code> 設定檔在列出帳號時，語法都相同，每一行寫一個帳號名稱。</p>
<p>如果 <code>/etc/cron.allow</code> 與 <code>/etc/cron.deny</code> 兩個設定檔都不存在，則就只有系統管理者 <code>root</code> 能夠使用 <code>crontab</code>。</p>
							
