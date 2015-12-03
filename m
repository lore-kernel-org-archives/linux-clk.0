Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:56183 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbLCRh5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2015 12:37:57 -0500
Subject: Re: [PATCH v2 0/4] Add Cygnus audio clock support
To: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
References: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
 <5654FD46.30907@gmail.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>,
	Simran Rai <ssimran@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <56607DF3.4080601@broadcom.com>
Date: Thu, 3 Dec 2015 09:37:55 -0800
MIME-Version: 1.0
In-Reply-To: <5654FD46.30907@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen/Mike,

Do these clock changes look okay to you?

Thanks,

Ray

On 11/24/2015 4:13 PM, Florian Fainelli wrote:
> On 23/11/15 09:50, Ray Jui wrote:
>> This patch series adds support for the Cygnus audio clock based on existing
>> iProc clock support
>>
>> This patch series is developed based on v4.4-rc1 with full tree available
>> on GITHUB:
>> repo: https://github.com/Broadcom/cygnus-linux.git
>> branch: cygnus-audio-clk-v2
>>
>> Changes from v1:
>>   - Remove function prototype of a non-exist function 'iproc_audiopll_clk_setup'
>>   - Remove __init macros from all functions prototypes in iproc-clk.h
>>
>> Ray Jui (1):
>>    clk: iproc: Remove __init from header
>>
>> Simran Rai (3):
>>    Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
>>    clk: iproc: Add support for Cygnus audio clocks
>>    ARM: dts: enable audio clock support for Cygnus
>
> Stephen, Mike, do these clock changes look sensible to you? If so, could
> you also put the drivers/clk/ changes in a branch that I could merge as
> part of including the DTS changes?
>
> Thanks!
>
