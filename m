Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:19555 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750730AbdAXJbq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2017 04:31:46 -0500
Date: Tue, 24 Jan 2017 12:31:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: marek.vasut@gmail.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: vc5: Add support for IDT VersaClock 5P49V5923 and
 5P49V5933
Message-ID: <20170124093133.GA28235@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Marek Vasut,

The patch 3e1aec4e2c41: "clk: vc5: Add support for IDT VersaClock
5P49V5923 and 5P49V5933" from Jan 12, 2017, leads to the following
static checker warning:

	drivers/clk/clk-versaclock5.c:235 vc5_mux_set_parent()
	error: uninitialized symbol 'src'.

drivers/clk/clk-versaclock5.c
   210  static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
   211  {
   212          struct vc5_driver_data *vc5 =
   213                  container_of(hw, struct vc5_driver_data, clk_mux);
   214          const u8 mask = VC5_PRIM_SRC_SHDN_EN_XTAL | VC5_PRIM_SRC_SHDN_EN_CLKIN;
   215          u8 src;
                   ^^^
   216  
   217          if ((index > 1) || !vc5->clk_mux_ins)
   218                  return -EINVAL;
   219  
   220          if (vc5->clk_mux_ins == (VC5_MUX_IN_CLKIN | VC5_MUX_IN_XIN)) {
   221                  if (index == 0)
   222                          src = VC5_PRIM_SRC_SHDN_EN_XTAL;
   223                  if (index == 1)
   224                          src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
   225          } else {
   226                  if (index != 0)
   227                          return -EINVAL;
   228  
   229                  if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
   230                          src = VC5_PRIM_SRC_SHDN_EN_XTAL;
   231                  if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
   232                          src = VC5_PRIM_SRC_SHDN_EN_CLKIN;

What about if both of these are false?

   233          }
   234  
   235          return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);
                                                                                ^^^
Potentially uninitialized.

   236  }

regards,
dan carpenter
