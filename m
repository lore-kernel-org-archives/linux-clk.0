Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Message-ID: <55658201.5090208@linaro.org>
Date: Wed, 27 May 2015 09:36:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
MIME-Version: 1.0
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>,
 Andreas Farber <afaerber@suse.de>,
 linux-clk@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [RFC PATCH 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <CALszF6BTu_8SCE9hEiLYuvQg8J9eG5xktaVV7_LvnG3r20+wtw@mail.gmail.com>
In-Reply-To: <CALszF6BTu_8SCE9hEiLYuvQg8J9eG5xktaVV7_LvnG3r20+wtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 26/05/15 17:41, Maxime Coquelin wrote:
>>   2. Allocating ~80 clock components appears to fragment memory enough
>>      to prevent busybox (.text is ~300K, non-XIP) from running getty.
>>      I have to use "init=/bin/sh" to avoid OOM problems.
>
> Yes, I reproduced the same issue while testing your work.
>
> Could you try with:
> CONFIG_NOMMU_INITIAL_TRIM_EXCESS=0
>
> It solves (hides) the problem on my side.
> You can eventually setting it once booted to 1 via procfs.

That works for me too. Thanks.

Incidentally switching to SLOB also reduced the problem for me. It was 
OK whilst I had ~20 clocks (and debugfs) but not enough for me to run 
with all the clocks registered.


Daniel.
