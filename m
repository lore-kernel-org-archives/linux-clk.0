Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:43534 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbbFZKbV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:31:21 -0400
Date: Fri, 26 Jun 2015 13:31:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: daniel.thompson@linaro.org
Cc: linux-clk@vger.kernel.org
Subject: re: clk: stm32: Add clock driver for STM32F4[23]xxx devices
Message-ID: <20150626103110.GA350@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Daniel Thompson,

The patch 358bdf892f6b: "clk: stm32: Add clock driver for
STM32F4[23]xxx devices" from Jun 10, 2015, leads to the following
static checker warning:

	drivers/clk/clk-stm32f4.c:271 stm32f4_rcc_lookup_clk_idx()
	warn: buffer overflow 'table' 3 <= 3

drivers/clk/clk-stm32f4.c
   258  static int stm32f4_rcc_lookup_clk_idx(u8 primary, u8 secondary)
   259  {
   260          u64 table[ARRAY_SIZE(stm32f42xx_gate_map)];
   261  
   262          if (primary == 1) {
   263                  if (WARN_ON(secondary > FCLK))

Is this off by one? >= instead of >?

   264                          return -EINVAL;
   265                  return secondary;
   266          }
   267  
   268          memcpy(table, stm32f42xx_gate_map, sizeof(table));
   269  
   270          /* only bits set in table can be used as indices */
   271          if (WARN_ON(secondary > 8 * sizeof(table) ||

This one is definitely off by one.  Also it might be easier to read as:

		if (WARN_ON(secondary >= 64 * ARRAY_SIZE(table) ||

   272                      0 == (table[BIT_ULL_WORD(secondary)] &
   273                            BIT_ULL_MASK(secondary))))
   274                  return -EINVAL;
   275  
   276          /* mask out bits above our current index */
   277          table[BIT_ULL_WORD(secondary)] &=
   278              GENMASK_ULL(secondary % BITS_PER_LONG_LONG, 0);
   279  
   280          return FCLK + hweight64(table[0]) +
   281                 (BIT_ULL_WORD(secondary) >= 1 ? hweight64(table[1]) : 0) +
   282                 (BIT_ULL_WORD(secondary) >= 2 ? hweight64(table[2]) : 0);
   283  }

regards,
dan carpenter
