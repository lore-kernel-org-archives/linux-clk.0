Return-Path: <sboyd@codeaurora.org>
Message-ID: <554BAC8A.1010307@codeaurora.org>
Date: Thu, 07 May 2015 11:18:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Tero Kristo <t-kristo@ti.com>, =?windows-1252?Q?Heiko_St=FCbner?=
 <heiko@sntech.de>
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
 Ulf Hansson <ulf.hansson@linaro.org>, Pawel Moll <pawel.moll@arm.com>,
 Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
References: <1429735986-18592-1-git-send-email-heiko@sntech.de> <1981330.kGUrTurMy5@diego> <5543E79F.2080400@codeaurora.org> <22709390.NTAlubMgNB@diego> <55440EDA.4030905@codeaurora.org> <554B20B4.3040003@ti.com>
In-Reply-To: <554B20B4.3040003@ti.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/07/15 01:22, Tero Kristo wrote:
> On 05/02/2015 02:40 AM, Stephen Boyd wrote:
>> On 05/01/15 15:07, Heiko Stübner wrote:
>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>>>
>>>>> Instead I guess we could hook it less deep into clk_get_sys, like
>>>>> in the
>>>>> following patch?
>>>> It looks like it will work at least, but still I'd prefer to keep the
>>>> orphan check contained to clk.c. How about this compile tested only
>>>> patch?
>>> I gave this a spin on my rk3288-firefly board. It still boots, the
>>> clock tree
>>> looks the same and it also still defers nicely in the scenario I
>>> needed it
>>> for. The implementation also looks nice - and of course much more
>>> compact than
>>> my check in two places :-) . I don't know if you want to put this as
>>> follow-up
>>> on top or fold it into the original orphan-check, so in any case
>>>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>
>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it with
>> my patch and a note that it's based on an earlier patch from you.
>
> FWIW, just gave a try for these two patches on all TI boards I have
> access to.
>
> Tested-by: Tero Kristo <t-kristo@ti.com>
>
> I didn't try your evolved patch though, as you don't seem to have made
> your mind yet.
>

Thanks. Can you try the evolved patch? It's in linux-next now as commit
882667c1fcf1, and it seems to at least break sunxi boot. I'd be
interested if it broke TI boards.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
