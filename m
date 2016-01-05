Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:19182 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128AbcAELpA (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jan 2016 06:45:00 -0500
Date: Tue, 5 Jan 2016 14:44:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: vz@mleia.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: lpc32xx: add common clock framework driver
Message-ID: <20160105114452.GA31494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Vladimir Zapolskiy (and other clk devs as well),

The patch f7c82a60ba26: "clk: lpc32xx: add common clock framework
driver" from Dec 6, 2015, leads to the following static checker
warning:

	drivers/clk/nxp/clk-lpc32xx.c:1019 clk_mux_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/nxp/clk-lpc32xx.c
  1003  static u8 clk_mux_get_parent(struct clk_hw *hw)
               ^^
  1004  {
  1005          struct lpc32xx_clk_mux *mux = to_lpc32xx_mux(hw);
  1006          u32 num_parents = clk_hw_get_num_parents(hw);
  1007          u32 val;
  1008  
  1009          regmap_read(clk_regmap, mux->reg, &val);
  1010          val >>= mux->shift;
  1011          val &= mux->mask;
  1012  
  1013          if (mux->table) {
  1014                  u32 i;
  1015  
  1016                  for (i = 0; i < num_parents; i++)
  1017                          if (mux->table[i] == val)
  1018                                  return i;
  1019                  return -EINVAL;
                        ^^^^^^^^^^^^^^
  1020          }
  1021  
  1022          if (val >= num_parents)
  1023                  return -EINVAL;
                        ^^^^^^^^^^^^^^
This obviously doesn't work since this is a u8 function.

I looked at how this was called to see what we should return on error.
This is called from __clk_init().  It tests for negative error codes.
Ooops.  Also there is no static checker warning for that but I will
create one.  I'm not sure what to do here.  I bet the correct thing is
to convert all the get_parent() function to return int.  Another option
might be to add documentation, but I feel like in the kernel int returns
are self documenting and that's the best option.

  1024  
  1025          return val;
  1026  }

regards,
dan carpenter
