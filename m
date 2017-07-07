Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:40911 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752392AbdGGJxs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2017 05:53:48 -0400
Date: Fri, 7 Jul 2017 12:53:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: sean.wang@mediatek.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: mediatek: add missing cpu mux causing Mediatek
 cpufreq can't work
Message-ID: <20170707095331.s7zlvk5hbqwgngld@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Sean Wang,

The patch 1e17de9049da: "clk: mediatek: add missing cpu mux causing
Mediatek cpufreq can't work" from May 5, 2017, leads to the following
static checker warning:

	drivers/clk/mediatek/clk-cpumux.c:39 clk_cpumux_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/mediatek/clk-cpumux.c
    27  static u8 clk_cpumux_get_parent(struct clk_hw *hw)
    28  {
    29          struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
    30          int num_parents = clk_hw_get_num_parents(hw);
    31          unsigned int val;
    32  
    33          regmap_read(mux->regmap, mux->reg, &val);
    34  
    35          val >>= mux->shift;
    36          val &= mux->mask;
    37  
    38          if (val >= num_parents)
    39                  return -EINVAL;
                        ^^^^^^^^^^^^^^
Doesn't work for u8.

    40  
    41          return val;
    42  }

regards,
dan carpenter
