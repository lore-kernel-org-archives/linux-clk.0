Return-Path: <khilman@kernel.org>
MIME-Version: 1.0
In-Reply-To: <554BD33D.7050907@codeaurora.org>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
	<1981330.kGUrTurMy5@diego>
	<5543E79F.2080400@codeaurora.org>
	<22709390.NTAlubMgNB@diego>
	<55440EDA.4030905@codeaurora.org>
	<CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
	<554BD33D.7050907@codeaurora.org>
Date: Thu, 7 May 2015 17:27:22 -0700
Message-ID: <CAMAWPa-ZtEzdzcO3c2D3k3JAvi+8zVzb0s1xSqUA-LQDz-EB4w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
From: Kevin Hilman <khilman@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kevin Hilman <khilman@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Mike Turquette <mturquette@linaro.org>, Doug Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Sascha Hauer <kernel@pengutronix.de>, Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>, Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
	Peter De Sc hrijver <pdeschrijver@nvidia.com>, Tero Kristo <t-kristo@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>, Olof Johansson <olof@lixom.net>,
	Tyler Baker <tyler.baker@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 7, 2015 at 2:03 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/07/15 08:17, Kevin Hilman wrote:
>> On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.org> wrot=
e:
>>> On 05/01/15 15:07, Heiko St=C3=BCbner wrote:
>>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>>>>
>>>>>> Instead I guess we could hook it less deep into clk_get_sys, like in=
 the
>>>>>> following patch?
>>>>> It looks like it will work at least, but still I'd prefer to keep the
>>>>> orphan check contained to clk.c. How about this compile tested only p=
atch?
>>>> I gave this a spin on my rk3288-firefly board. It still boots, the clo=
ck tree
>>>> looks the same and it also still defers nicely in the scenario I neede=
d it
>>>> for. The implementation also looks nice - and of course much more comp=
act than
>>>> my check in two places :-) . I don't know if you want to put this as f=
ollow-up
>>>> on top or fold it into the original orphan-check, so in any case
>>>>
>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it wit=
h
>>> my patch and a note that it's based on an earlier patch from you.
>> It appears this has landed in linux-next in the form of 882667c1fcf1
>> clk: prevent orphan clocks from being used.  A bunch of boot failures
>> for sunxi in today's linux-next[1] were bisected down to that patch.
>>
>> I confirmed that reverting that commit on top of next/master gets
>> sunxi booting again.
>>
>>
>
> Thanks for the report. I've removed the two clk orphan patches from
> clk-next. Would it be possible to try with next-20150507 and
> clk_ignore_unused on the command line?

That doesn't help.  I tried on cubieboard2 and bananapi.

> Also we can try to see if
> critical clocks aren't being forced on by applying this patch and
> looking for clk_get() failures

>From cubieboard2, there's a few that look rather important:

[    0.000000] Additional per-CPU info printed with stalls.
[    0.000000] Build-time adjustment of leaf fanout to 32.
[    0.000000] RCU restricting CPUs from NR_CPUS=3D16 to nr_cpu_ids=3D2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D32, nr_cpu_ids=
=3D2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] clk: couldn't get parent clock 0 for /clocks/ahb@01c20054
[    0.000000] Failed to enable critical clock cpu
[    0.000000] Failed to enable critical clock pll5_ddr
[    0.000000] Failed to enable critical clock ahb_sdram
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (virt).

Kevin
