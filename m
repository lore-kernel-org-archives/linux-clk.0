Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:45681 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751666AbeCOJUF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Mar 2018 05:20:05 -0400
Subject: Re: [PATCH] clk: rockchip: assign correct id for pclk_ddr and hclk_sd
 in rk3399
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: heiko@sntech.de, dbasehore@chromium.org, briannorris@chromium.org,
        diander@chromium.ogr, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <1521104071-19595-1-git-send-email-hl@rock-chips.com>
 <18794d71-ec37-7af4-3de6-7a43a5c66010@rock-chips.com>
From: hl <hl@rock-chips.com>
Message-ID: <df78009d-924f-6b9c-6bf6-f1f69d162708@rock-chips.com>
Date: Thu, 15 Mar 2018 17:12:01 +0800
MIME-Version: 1.0
In-Reply-To: <18794d71-ec37-7af4-3de6-7a43a5c66010@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,


On Thursday, March 15, 2018 05:01 PM, Shawn Lin wrote:
> Hi Huang,
>
> On 2018/3/15 16:54, Lin Huang wrote:
>> Assign id PCLK_DDR to pclk_ddr, id HCLK_SD to hclk_sd, so we can
>> assign frequency for them in dts.
>
> I'm curious under which condition that we need assign frequency for
> hclk_sd?
We may set CPLL frequency higher than 800MHz, with that we need assign clock
to hclk_sd, otherwise it will exceed 200MHz, since we use the default 
cru register value to get hclk_sd for now.
you can check
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/956678/5 

>
>>
>> Change-Id: I6c4d15d37ddabe4ed34e2351cf26e660672ae9ee
>> Signed-off-by: Lin Huang <hl@rock-chips.com>
>> ---
>>   drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3399.c 
>> b/drivers/clk/rockchip/clk-rk3399.c
>> index 6847120..a29c99e 100644
>> --- a/drivers/clk/rockchip/clk-rk3399.c
>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>> @@ -670,7 +670,7 @@ static struct rockchip_clk_branch 
>> rk3399_clk_branches[] __initdata = {
>>               RK3399_CLKGATE_CON(9), 7, GFLAGS,
>>               &rk3399_uart3_fracmux),
>>   -    COMPOSITE(0, "pclk_ddr", mux_pll_src_cpll_gpll_p, 
>> CLK_IGNORE_UNUSED,
>> +    COMPOSITE(PCLK_DDR, "pclk_ddr", mux_pll_src_cpll_gpll_p, 
>> CLK_IGNORE_UNUSED,
>>               RK3399_CLKSEL_CON(6), 15, 1, MFLAGS, 8, 5, DFLAGS,
>>               RK3399_CLKGATE_CON(3), 4, GFLAGS),
>>   @@ -886,7 +886,7 @@ static struct rockchip_clk_branch 
>> rk3399_clk_branches[] __initdata = {
>>               RK3399_CLKGATE_CON(31), 8, GFLAGS),
>>         /* sdio & sdmmc */
>> -    COMPOSITE(0, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
>> +    COMPOSITE(HCLK_SD, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
>>               RK3399_CLKSEL_CON(13), 15, 1, MFLAGS, 8, 5, DFLAGS,
>>               RK3399_CLKGATE_CON(12), 13, GFLAGS),
>>       GATE(HCLK_SDMMC, "hclk_sdmmc", "hclk_sd", 0,
>>
>
>
>


