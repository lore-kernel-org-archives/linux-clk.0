Return-Path: <sumit.semwal@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170808155707.GA19636@kroah.com>
References: <CAO_48GHvyUD7vD1qJP=41Wt0nyeiyhoCpVSYL-v-jbU_dd1Sgw@mail.gmail.com>
 <20170808155707.GA19636@kroah.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 8 Aug 2017 21:49:24 +0530
Message-ID: <CAO_48GH29NsWgrq2Z_8STHWGoEQ=8jWryge1JFvqUcygxg0VuQ@mail.gmail.com>
Subject: Re: Request for inclusion to stable-4.9
To: Greg KH <greg@kroah.com>
Cc: mturquette@baylibre.com, Viresh Kumar <viresh.kumar@linaro.org>,
	Leo Yan <leo.yan@linaro.org>, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	"# 3.4.x" <stable@vger.kernel.org>
Content-Type: multipart/alternative; boundary="001a114621c8ada5410556405303"
List-ID: <linux-clk.vger.kernel.org>

--001a114621c8ada5410556405303
Content-Type: text/plain; charset="UTF-8"

Hello,

On Aug 8, 2017 21:27, "Greg KH" <greg@kroah.com> wrote:

On Tue, Aug 08, 2017 at 09:05:03PM +0530, Sumit Semwal wrote:
> Hi Greg,
>
> Please consider commit
>
> 9a881bc55d7b: clk: Hi6220: enable stub clock driver for ARCH_HISI
>
> for inclusion into stable-4.9; without this, Hikey's cpufreq driver
> doesn't work, and the cpufreq kselftests fail on it accordingly.

How can it "not work", all that patch does it enable it by "default",
you can always change your .config file to enable it successfully,
right?

Of course. I meant "doesn't work with default defconfig"; having it enabled
by default just makes it a little easier to test in a CI loop - we could do
that in the CI scripts as well, so apologies about the noise here.


thanks,

greg k-h

--001a114621c8ada5410556405303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Aug 8, 2017 21:27, &quot;Greg KH&quot; &lt;<a href=3D"m=
ailto:greg@kroah.com" target=3D"_blank">greg@kroah.com</a>&gt; wrote:<br ty=
pe=3D"attribution"><blockquote class=3D"m_1777527394077629454quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"m_1777527394077629454elided-text">On Tue, Aug 08, 2017 at 09:05:03PM =
+0530, Sumit Semwal wrote:<br>
&gt; Hi Greg,<br>
&gt;<br>
&gt; Please consider commit<br>
&gt;<br>
&gt; 9a881bc55d7b: clk: Hi6220: enable stub clock driver for ARCH_HISI<br>
&gt;<br>
&gt; for inclusion into stable-4.9; without this, Hikey&#39;s cpufreq drive=
r<br>
&gt; doesn&#39;t work, and the cpufreq kselftests fail on it accordingly.<b=
r>
<br>
</div>How can it &quot;not work&quot;, all that patch does it enable it by =
&quot;default&quot;,<br>
you can always change your .config file to enable it successfully,<br>
right?</blockquote></div></div></div><div dir=3D"auto">Of course. I meant &=
quot;doesn&#39;t work with default defconfig&quot;; having it enabled by de=
fault just makes it a little easier to test in a CI loop - we could do that=
 in the CI scripts as well, so apologies about the noise here.</div><div di=
r=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"m_1777527394077629454quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks,<br>
<br>
greg k-h</blockquote></div></div></div></div>

--001a114621c8ada5410556405303--
