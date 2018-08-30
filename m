Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38930 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbeH3QwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 12:52:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180830125013euoutp01fde74f0980349267ee6401d5e85133da~PqnQAA-wD1931619316euoutp010
        for <linux-clk@vger.kernel.org>; Thu, 30 Aug 2018 12:50:13 +0000 (GMT)
Subject: Re: [PATCH 03/10] clk: samsung: s3c2412: Use generic helper for
 handling suspend/resume
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?=
        <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 30 Aug 2018 14:50:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfP5zshtEsk81-0bM97jLYrDiW2BNg58Uf9pBz55bHZXQ@mail.gmail.com>
Message-Id: <20180830125011eucas1p2ac6ec1898971927237cc3cb0580255b3~PqnOf7I2C1196311963eucas1p2x@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180829155059eucas1p16fecde00348e0a2e6707aaf2a76320be@eucas1p1.samsung.com>
        <20180829155046.29359-1-m.szyprowski@samsung.com>
        <20180829155046.29359-4-m.szyprowski@samsung.com>
        <CAJKOXPfP5zshtEsk81-0bM97jLYrDiW2BNg58Uf9pBz55bHZXQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 2018-08-30 08:42, Krzysztof Kozlowski wrote:
> On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Replace common suspend/resume handling code by generic helper.
>> No functional change.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-s3c2412.c | 43 ++-----------------------------
>>   1 file changed, 2 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
>> index 6bc94d3aff78..dd1159050a5a 100644
>> --- a/drivers/clk/samsung/clk-s3c2412.c
>> +++ b/drivers/clk/samsung/clk-s3c2412.c
>> @@ -11,7 +11,6 @@
>>   #include <linux/clk-provider.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> -#include <linux/syscore_ops.h>
>>   #include <linux/reboot.h>
>>
>>   #include <dt-bindings/clock/s3c2412.h>
>> @@ -29,9 +28,6 @@
>>
>>   static void __iomem *reg_base;
>>
>> -#ifdef CONFIG_PM_SLEEP
>> -static struct samsung_clk_reg_dump *s3c2412_save;
>> -
>>   /*
>>    * list of controller registers to be saved and restored during a
>>    * suspend/resume cycle.
>> @@ -45,42 +41,6 @@ static unsigned long s3c2412_clk_regs[] __initdata = {
>>          CLKSRC,
> Did you try building without PM_SLEEP? Now this will be included
> always so you might have to mark it __maybe_unused.

Nope, there is no such need, because *_regs arrays are passed to a
samsung_clk_sleep_init() noop function not a noop marco.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
