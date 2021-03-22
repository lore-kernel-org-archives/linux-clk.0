Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E63C433E1
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 05:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7B461972
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 05:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhCVFAd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 01:00:33 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:43122 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhCVFAV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Mar 2021 01:00:21 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 12M506qh007078; Mon, 22 Mar 2021 14:00:06 +0900
X-Iguazu-Qid: 2wGquhALsFCrmuMV6D
X-Iguazu-QSIG: v=2; s=0; t=1616389205; q=2wGquhALsFCrmuMV6D; m=HlwWokMknzqrHrYo3zQyYsR8nPHE5mwCDeGN4hY7aUg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1111) id 12M504ns004364
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Mar 2021 14:00:05 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id B5C78100093;
        Mon, 22 Mar 2021 14:00:04 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 12M5046q003935;
        Mon, 22 Mar 2021 14:00:04 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
References: <20210316090540.973014-1-punit1.agrawal@toshiba.co.jp>
        <10d60612-2ee4-2fac-888e-6a2262f39469@xilinx.com>
        <87r1k7sss3.fsf@kokedama.swc.toshiba.co.jp>
Date:   Mon, 22 Mar 2021 14:00:01 +0900
In-Reply-To: <87r1k7sss3.fsf@kokedama.swc.toshiba.co.jp> (Punit Agrawal's
        message of "Mon, 22 Mar 2021 13:42:52 +0900")
X-TSB-HOP: ON
Message-ID: <87mtuvsrzi.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Punit Agrawal <punit1.agrawal@toshiba.co.jp> writes:

> Hi Michal,
>
> Michal Simek <michal.simek@xilinx.com> writes:
>
>> On 3/16/21 10:05 AM, Punit Agrawal wrote:
>>> When booting the kernel on zynqmp based platforms such as Ultra96v2,
>>> peripheral drivers such as that for the sdcard depend on the presense
>>> of clocks.
>>> 
>>> Enable the clock driver if it's dependencies are compiled to avoid
>>> building an unbootable kernel.
>>> 
>>> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
>>> ---
>>>  drivers/clk/zynqmp/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
>>> index 17086059be8b..14e4f5c55525 100644
>>> --- a/drivers/clk/zynqmp/Kconfig
>>> +++ b/drivers/clk/zynqmp/Kconfig
>>> @@ -4,6 +4,7 @@ config COMMON_CLK_ZYNQMP
>>>  	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
>>>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>>>  	depends on ZYNQMP_FIRMWARE
>>> +	default ZYNQMP_FIRMWARE
>>>  	help
>>>  	  Support for the Zynqmp Ultrascale clock controller.
>>>  	  It has a dependency on the PMU firmware.
>>> 
>>
>> I am fine with it but I think we should fix also that depends on
>> ARCH_ZYNQMP. ZYNQMP_FIRMWARE already depends on ARCH_ZYNQMP that's why
>> it is redundant here.
>
> Sure - let me send an update converting the depends to a default.

Ah I misunderstood what you were suggesting.

I'll add a patch on top to drop the ARCH_ZYNQMP dependency (and move
COMPILE_TEST to ZYNQMP_FIRMWARE).

Thanks,
Punit

[...]

