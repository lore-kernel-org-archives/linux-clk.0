Return-Path: <sboyd@codeaurora.org>
Message-ID: <55440EDA.4030905@codeaurora.org>
Date: Fri, 01 May 2015 16:40:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
CC: mturquette@linaro.org, dianders@chromium.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alex Elder <elder@linaro.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 kernel@pengutronix.de, Zhangfei Gao <zhangfei.gao@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Chao Xie <chao.xie@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Andrew Bresticker <abrestic@chromium.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Barry Song <baohua@kernel.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Viresh Kumar <viresh.linux@gmail.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@st.com>, emilio@elopez.com.ar,
 Peter De Sc hrijver <pdeschrijver@nvidia.com>,
 Tero Kristo <t-kristo@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pawel Moll <pawel.moll@arm.com>,
 Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
References: <1429735986-18592-1-git-send-email-heiko@sntech.de> <1981330.kGUrTurMy5@diego> <5543E79F.2080400@codeaurora.org> <22709390.NTAlubMgNB@diego>
In-Reply-To: <22709390.NTAlubMgNB@diego>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/01/15 15:07, Heiko Stübner wrote:
> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>
>>> Instead I guess we could hook it less deep into clk_get_sys, like in the
>>> following patch?
>> It looks like it will work at least, but still I'd prefer to keep the
>> orphan check contained to clk.c. How about this compile tested only patch?
> I gave this a spin on my rk3288-firefly board. It still boots, the clock tree 
> looks the same and it also still defers nicely in the scenario I needed it 
> for. The implementation also looks nice - and of course much more compact than 
> my check in two places :-) . I don't know if you want to put this as follow-up 
> on top or fold it into the original orphan-check, so in any case
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks. I'm leaning towards tossing your patch 2/2 and replacing it with
my patch and a note that it's based on an earlier patch from you.

>
>
>> This also brings up an existing problem with clk_unregister() where
>> orphaned clocks are sitting out there useable by drivers when their
>> parent is unregistered. That code could use some work to atomically
>> switch all the orphaned clocks over to use the nodrv_ops.
> Not sure I understand this correctly yet, but when these children get 
> orphaned, switched to the clk_nodrv_ops, they won't get their original ops 
> back if the parent reappears.
>
> So I guess we would need to store the original ops in secondary property of 
> struct clk_core and I guess simply bind the ops-switch to the orphan state 
> update?

Yep. We'll need to store away the original ops in case we need to put
them back. Don't feel obligated to fix this either. It would certainly
be nice if someone tried to fix this case at some point, but it's not
like things are any worse off right now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
