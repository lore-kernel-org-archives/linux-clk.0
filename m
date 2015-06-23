Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:35074 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752477AbbFWIWF (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 23 Jun 2015 04:22:05 -0400
Received: by wiga1 with SMTP id a1so98673371wig.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2015 01:22:03 -0700 (PDT)
Message-ID: <55891729.7070809@linaro.org>
Date: Tue, 23 Jun 2015 09:22:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Russell King <linux@arm.linux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH v3 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org> <20150622224832.GI22132@codeaurora.org>
In-Reply-To: <20150622224832.GI22132@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 22/06/15 23:48, Stephen Boyd wrote:
> On 06/10, Daniel Thompson wrote:
>> This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
>> series devices. It supports decoding the state configured by the
>> bootloader (PLL, clock select, bus dividers) and all the gates clocks.
>> It does not currently support the I2S and SAI PLLs.
>>
>> Relies on "Add support to STMicroeletronics STM32 family" v9 by Maxime
>> Coquelin: http://thread.gmane.org/gmane.linux.kernel/1961049 .
>>
>
> I applied 1 and 2. Looks like #3 should go through arm-soc at
> some later time?

Agreed (that is also the patch that must be correctly ordered w.r.t. 
Maxime's patches).


Thanks.

Daniel.

