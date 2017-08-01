Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:37392 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdHALvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2017 07:51:13 -0400
Received: by mail-wm0-f41.google.com with SMTP id t201so12430432wmt.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Aug 2017 04:51:13 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] clk: meson: gxbb-aoclk: Add CEC 32k clock
To: Chris Moore <moore@free.fr>, jbrunet@baylibre.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1501504957-19476-1-git-send-email-narmstrong@baylibre.com>
 <1501504957-19476-5-git-send-email-narmstrong@baylibre.com>
 <37b45bd4-e3bf-1a1f-7b8c-fb1919042072@free.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <f757ce17-a4b1-123f-dd52-260d03e2913b@baylibre.com>
Date: Tue, 1 Aug 2017 13:51:09 +0200
MIME-Version: 1.0
In-Reply-To: <37b45bd4-e3bf-1a1f-7b8c-fb1919042072@free.fr>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2017 06:25 PM, Chris Moore wrote:
> Hi,
> 
> Le 31/07/2017 à 14:42, Neil Armstrong a écrit :
>> The CEC 32K AO Clock is a dual divider with dual counter to provide a more
>> precise 32768Hz clock for the CEC subsystem from the external xtal.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/clk/meson/Makefile         |   2 +-
>>   drivers/clk/meson/gxbb-aoclk-32k.c | 194 +++++++++++++++++++++++++++++++++++++
>>   drivers/clk/meson/gxbb-aoclk.c     |  21 +++-
>>   drivers/clk/meson/gxbb-aoclk.h     |  16 +++
>>   4 files changed, 231 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
>>
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index de65427..b139d41 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -4,4 +4,4 @@
>>     obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o clk-audio-divider.o
>>   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
>> -obj-$(CONFIG_COMMON_CLK_GXBB)     += gxbb.o gxbb-aoclk.o gxbb-aoclk-regmap.o
>> +obj-$(CONFIG_COMMON_CLK_GXBB)     += gxbb.o gxbb-aoclk.o gxbb-aoclk-regmap.o gxbb-aoclk-32k.o
>> diff --git a/drivers/clk/meson/gxbb-aoclk-32k.c b/drivers/clk/meson/gxbb-aoclk-32k.c
> 
> [snip]
> 
>> +static int aoclk_cec_32k_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                  unsigned long parent_rate)
>> +{
>> +    const struct cec_32k_freq_table *freq = find_cec_32k_freq(rate,
>> +                                  parent_rate);
>> +    struct aoclk_cec_32k *cec_32k = to_aoclk_cec_32k(hw);
>> +    u32 reg = 0;
>> +
>> +    if (!freq)
>> +        return -EINVAL;
>> +
>> +    /* Disable clock */
>> +    regmap_update_bits(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0,
>> +               CLK_CNTL0_IN_GATE_EN | CLK_CNTL0_OUT_GATE_EN, 0);
>> +
>> +    reg = FIELD_PREP(CLK_CNTL0_N1_MASK, freq->n1 - 1);
>> +    if (freq->dualdiv)
>> +        reg |= CLK_CNTL0_DUALDIV_EN |
>> +               FIELD_PREP(CLK_CNTL0_N2_MASK, freq->n2 - 1);
>> +
>> +    regmap_write(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0, reg);
>> +
>> +    reg = FIELD_PREP(CLK_CNTL1_M1_MASK, freq->m1 - 1);
>> +    if (freq->dualdiv)
>> +        reg = FIELD_PREP(CLK_CNTL1_M2_MASK, freq->m2 - 1);
> 
> s/=/|=/

Aww, thanks for spotting it, I'll post a v3.1
It still worked but was acting like a single divider...

> 
> Cheers,
> Chris

Thanks,
Neil

