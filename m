Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:38141 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751AbbFZKxg (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:53:36 -0400
Received: by wibdq8 with SMTP id dq8so14254102wib.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2015 03:53:35 -0700 (PDT)
Message-ID: <558D2F2D.4020803@linaro.org>
Date: Fri, 26 Jun 2015 11:53:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: linux-clk@vger.kernel.org
Subject: Re: clk: stm32: Add clock driver for STM32F4[23]xxx devices
References: <20150626103110.GA350@mwanda>
In-Reply-To: <20150626103110.GA350@mwanda>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 26/06/15 11:31, Dan Carpenter wrote:
> Hello Daniel Thompson,
>
> The patch 358bdf892f6b: "clk: stm32: Add clock driver for
> STM32F4[23]xxx devices" from Jun 10, 2015, leads to the following
> static checker warning:
>
> 	drivers/clk/clk-stm32f4.c:271 stm32f4_rcc_lookup_clk_idx()
> 	warn: buffer overflow 'table' 3 <= 3
>
> drivers/clk/clk-stm32f4.c
>     258  static int stm32f4_rcc_lookup_clk_idx(u8 primary, u8 secondary)
>     259  {
>     260          u64 table[ARRAY_SIZE(stm32f42xx_gate_map)];
>     261
>     262          if (primary == 1) {
>     263                  if (WARN_ON(secondary > FCLK))
>
> Is this off by one? >= instead of >?

This one is ok (FCLK is a valid value for secondary when primary is 1).


>     264                          return -EINVAL;
>     265                  return secondary;
>     266          }
>     267
>     268          memcpy(table, stm32f42xx_gate_map, sizeof(table));
>     269
>     270          /* only bits set in table can be used as indices */
>     271          if (WARN_ON(secondary > 8 * sizeof(table) ||
>
> This one is definitely off by one.

Agreed.


 > Also it might be easier to read as:
> 		if (WARN_ON(secondary >= 64 * ARRAY_SIZE(table) ||

I guess the thing we want to be clear is that we are comparing against 
the number of bits in table.

Maybe just "BITS_PER_BYTE * sizeof(table)" achieves that best?

BTW... you're happy for me to send a patch on this (with a Reported-by:)?


Daniel.
