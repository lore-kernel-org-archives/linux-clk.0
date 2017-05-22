Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:34399 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758897AbdEVN1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2017 09:27:24 -0400
Received: by mail-wr0-f172.google.com with SMTP id l9so38597116wre.1
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2017 06:27:23 -0700 (PDT)
Subject: Re: [PATCH] clk: meson-gxbb: Expose SPICC gate
To: Jerome Brunet <jbrunet@baylibre.com>
References: <1495457326-32659-1-git-send-email-narmstrong@baylibre.com>
 <1495459426.2344.1.camel@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <578eb358-60f2-e65d-1aaa-fece2d77987a@baylibre.com>
Date: Mon, 22 May 2017 15:27:16 +0200
MIME-Version: 1.0
In-Reply-To: <1495459426.2344.1.camel@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/22/2017 03:23 PM, Jerome Brunet wrote:
> On Mon, 2017-05-22 at 14:48 +0200, Neil Armstrong wrote:
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> I would prefer to have a short commit message here. With it included:

Indeed, sorry.

I'll push it with a short commit message and your Ack.

Thanks,
Neil

> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> 
>> ---
>>  drivers/clk/meson/gxbb.h              | 2 +-
>>  include/dt-bindings/clock/gxbb-clkc.h | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
>> index 93b8f07..cc7b35c 100644
>> --- a/drivers/clk/meson/gxbb.h
>> +++ b/drivers/clk/meson/gxbb.h
>> @@ -191,7 +191,7 @@
>>  #define CLKID_ISA		  18
>>  #define CLKID_PL301		  19
>>  #define CLKID_PERIPHS		  20
>> -#define CLKID_SPICC		  21
>> +/* CLKID_SPICC */
>>  /* CLKID_I2C */
>>  /* #define CLKID_SAR_ADC */
>>  #define CLKID_SMART_CARD	  24
>> diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-
>> bindings/clock/gxbb-clkc.h
>> index 3190e30..88da194 100644
>> --- a/include/dt-bindings/clock/gxbb-clkc.h
>> +++ b/include/dt-bindings/clock/gxbb-clkc.h
>> @@ -13,6 +13,7 @@
>>  #define CLKID_GP0_PLL		9
>>  #define CLKID_CLK81		12
>>  #define CLKID_MPLL2		15
>> +#define CLKID_SPICC		21
>>  #define CLKID_I2C		22
>>  #define CLKID_SAR_ADC		23
>>  #define CLKID_RNG0		25
> 

