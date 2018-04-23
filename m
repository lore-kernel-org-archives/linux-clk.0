Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:40004 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932178AbeDWRuD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Apr 2018 13:50:03 -0400
Received: by mail-ot0-f196.google.com with SMTP id h8-v6so18190049otj.7
        for <linux-clk@vger.kernel.org>; Mon, 23 Apr 2018 10:50:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1524472409.4026.10.camel@baylibre.com>
References: <20180422103339.32608-1-martin.blumenstingl@googlemail.com>
 <20180422103339.32608-2-martin.blumenstingl@googlemail.com> <1524472409.4026.10.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Apr 2018 19:49:42 +0200
Message-ID: <CAFBinCCKde+42PXzak8nuGEGTxwrvOVV7KDeoD1RkV_DjMdDOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] clk: meson: meson8b: add support for the NAND clocks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On Mon, Apr 23, 2018 at 10:33 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2018-04-22 at 12:33 +0200, Martin Blumenstingl wrote:
>> This adds the NAND clocks (from the HHI_NAND_CLK_CNTL register) to the
>> Meson8b clock driver. There are three NAND clocks: a gate which enables
>> or disables the NAND clock, a mux and a divider (which divides the mux
>> output).
>> Unfortunately the public S805 datasheet does not document the mux
>> parents. However, the vendor kernel has a few hints for us which allows
>> us to make an educated guess about the clock parents. To do this we need
>> to have a look at set_nand_core_clk() from the vendor's NAND driver (see
>> [0]):
>> - XTAL = (4<<9) | (1<<8) | 0
>> - 160MHz = (0<<9) | (1<<8) | 3)
>> - 182MHz = (3<<9) | (1<<8) | 1)
>> - 212MHz = (1<<9) | (1<<8) | 3)
>> - 255MHz = (2<<9) | (1<<8) | 1)
>>
>> While there is a comment for the XTAL parent (which indicates that it
>> should only be used for debugging) we have to do a bit of math for the
>> other parents: target_freq * divider = rate of parent clock
>> Bit 8 above is the enable bit, so we can ignore it here. Bits 11:9 are
>> the mux index and bits 6:0 are the 0-based divider (so we need to add
>> 1). This gives us:
>> - mux 0 (160MHz * 4) = fclk_div4 (actual rate = 637.5MHz, off by 2.5MHz)
>> - mux 1 (212MHz * 4) = fclk_div3 (actual rate = 850MHz, off by 2MHz)
>> - mux 2 (255MHz * 2) = fclk_div5 (matches exactly 510MHz)
>> - mux 3 (182MHz * 2) = fclk_div7 (actual rate = 346.3MHz, off by 0.3MHz)
>>
>> [0] https://github.com/khadas/linux/blob/9587681285cb/drivers/amlogic/amlnf/dev/amlnf_ctrl.c#L314
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  drivers/clk/meson/meson8b.c              | 54 ++++++++++++++++++++++++
>>  drivers/clk/meson/meson8b.h              |  3 +-
>>  include/dt-bindings/clock/meson8b-clkc.h |  3 ++
>>  3 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
>> index 2c4ff6192852..3f726ff73261 100644
>> --- a/drivers/clk/meson/meson8b.c
>> +++ b/drivers/clk/meson/meson8b.c
>> @@ -639,6 +639,54 @@ static struct clk_regmap meson8b_cpu_clk = {
>>       },
>>  };
>>
>> +static struct clk_regmap meson8b_nand_clk_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = HHI_NAND_CLK_CNTL,
>> +             .mask = 0x7,
>> +             .shift = 9,
>> +             .flags = CLK_MUX_ROUND_CLOSEST,
>
> Maybe you have seen it already, but there was a problem with this flag, it was
> ignored. Fix should land in this cycle.
>
> https://lkml.kernel.org/r/152389589448.51482.15489333464741262913@swboyd.mtv.cor
> p.google.com
yep, I've seen your fix (thank you!) so I decided to re-send this

>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "nand_clk_sel",
>>
>
> [...]
>
>>  /*
>>   * include the CLKID and RESETID that have
>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
>> index dea9d46d4fa7..434d7ba63801 100644
>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>> @@ -102,5 +102,8 @@
>>  #define CLKID_MPLL0          93
>>  #define CLKID_MPLL1          94
>>  #define CLKID_MPLL2          95
>> +#define CLKID_NAND_SEL               110
>> +#define CLKID_NAND_DIV               111
>
> Nitpick: Could put the bindings in separate patch ?
> It makes our life easier if intend to push a DT patch using them in this cycle.
OK, I'll split the patch (even though it's HIGHLY unlikely that the
NAND driver will make it anytime soon..)

> Also, do you need to expose the divider and the mux ?
I think only the most specific leaf (= gate clock) is needed, I'll
keep the mux and divider in the private header file

> Apart from this, patch looks good to me.
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
thank you!


Regards
Martin
