Return-Path: <t-kristo@ti.com>
Message-ID: <554CA0F4.6010305@ti.com>
Date: Fri, 8 May 2015 14:41:40 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
        =?windows-1252?Q?Heiko_St=FCbn?=
 =?windows-1252?Q?er?= <heiko@sntech.de>
CC: <mturquette@linaro.org>, <dianders@chromium.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Boris Brezillon
	<boris.brezillon@free-electrons.com>,
        Alex Elder <elder@linaro.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Stephen Warren
	<swarren@wwwdotorg.org>,
        Max Filippov <jcmvbkbc@gmail.com>, <kernel@pengutronix.de>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Chao Xie <chao.xie@marvell.com>, Jason
 Cooper <jason@lakedaemon.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Andrew
 Bresticker <abrestic@chromium.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Barry
 Song <baohua@kernel.org>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Viresh Kumar <viresh.linux@gmail.com>,
        Gabriel FERNANDEZ
	<gabriel.fernandez@st.com>, <emilio@elopez.com.ar>,
        Peter De Sc hrijver
	<pdeschrijver@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Pawel Moll
	<pawel.moll@arm.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
References: <1429735986-18592-1-git-send-email-heiko@sntech.de> <1981330.kGUrTurMy5@diego> <5543E79F.2080400@codeaurora.org> <22709390.NTAlubMgNB@diego> <55440EDA.4030905@codeaurora.org> <554B20B4.3040003@ti.com> <554BAC8A.1010307@codeaurora.org>
In-Reply-To: <554BAC8A.1010307@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 05/07/2015 09:18 PM, Stephen Boyd wrote:
> On 05/07/15 01:22, Tero Kristo wrote:
>> On 05/02/2015 02:40 AM, Stephen Boyd wrote:
>>> On 05/01/15 15:07, Heiko Stübner wrote:
>>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>>>>
>>>>>> Instead I guess we could hook it less deep into clk_get_sys, like
>>>>>> in the
>>>>>> following patch?
>>>>> It looks like it will work at least, but still I'd prefer to keep the
>>>>> orphan check contained to clk.c. How about this compile tested only
>>>>> patch?
>>>> I gave this a spin on my rk3288-firefly board. It still boots, the
>>>> clock tree
>>>> looks the same and it also still defers nicely in the scenario I
>>>> needed it
>>>> for. The implementation also looks nice - and of course much more
>>>> compact than
>>>> my check in two places :-) . I don't know if you want to put this as
>>>> follow-up
>>>> on top or fold it into the original orphan-check, so in any case
>>>>
>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it with
>>> my patch and a note that it's based on an earlier patch from you.
>>
>> FWIW, just gave a try for these two patches on all TI boards I have
>> access to.
>>
>> Tested-by: Tero Kristo <t-kristo@ti.com>
>>
>> I didn't try your evolved patch though, as you don't seem to have made
>> your mind yet.
>>
>
> Thanks. Can you try the evolved patch? It's in linux-next now as commit
> 882667c1fcf1, and it seems to at least break sunxi boot. I'd be
> interested if it broke TI boards.

Just tried it out, boots fine on all these:

   : Board           : Boot commit                    log
  1: am335x-evm      : PASS 4.1.0-rc2-next-20150507   am335x-evm.txt
  2: am335x-evmsk    : PASS 4.1.0-rc2-next-20150507   am335x-sk.txt
  3: am3517-evm      : PASS 4.1.0-rc2-next-20150507   am3517-evm.txt
  4: am43x-epos-evm  : PASS 4.1.0-rc2-next-20150507   am43xx-epos.txt
  5: am437x-gp-evm   : PASS 4.1.0-rc2-next-20150507   am43xx-gpevm.txt
  6: am57xx-evm      : PASS 4.1.0-rc2-next-20150507   am57xx-evm.txt
  7: omap3-beagle-xm : PASS 4.1.0-rc2-next-20150507   beagleboard.txt
  8: omap3-beagle    : PASS 4.1.0-rc2-next-20150507 
beagleboard-vanilla.txt
  9: am335x-boneblack: PASS 4.1.0-rc2-next-20150507   beaglebone-black.txt
10: am335x-bone     : PASS 4.1.0-rc2-next-20150507   beaglebone.txt
11: dra7xx-evm      : PASS 4.1.0-rc2-next-20150507   dra7xx-evm.txt
12: omap3-n900      : PASS 4.1.0-rc2-next-20150507   n900.txt
13: omap5-uevm      : PASS 4.1.0-rc2-next-20150507   omap5-evm.txt
14: omap4-panda-es  : PASS 4.1.0-rc2-next-20150507   pandaboard-es.txt
15: omap4-panda     : PASS 4.1.0-rc2-next-20150507   pandaboard-vanilla.txt
16: omap2430-sdp    : PASS 4.1.0-rc2-next-20150507   sdp2430.txt
17: omap3430-sdp    : PASS 4.1.0-rc2-next-20150507   sdp3430.txt
18: omap4-sdp-es23plus: PASS 4.1.0-rc2-next-20150507   sdp4430.txt
TOTAL = 18 boards, Booted Boards = 18, No Boot boards = 0

TI boards do not have any orphan clocks.

-Tero
