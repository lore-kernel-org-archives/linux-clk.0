Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:37212 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754292AbeFUIGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jun 2018 04:06:50 -0400
Date: Thu, 21 Jun 2018 11:06:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: gregory.clement@bootlin.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: mvebu: armada-37xx-periph: prepare cpu clk to be
 used with DVFS
Message-ID: <20180620201208.rzzc3lpu2lmyy4sz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Gregory CLEMENT,

The patch 9818a7a4fd10: "clk: mvebu: armada-37xx-periph: prepare cpu
clk to be used with DVFS" from Nov 30, 2017, leads to the following
static checker warning:

	drivers/clk/mvebu/armada-37xx-periph.c:432 clk_pm_cpu_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/mvebu/armada-37xx-periph.c
   418  static u8 clk_pm_cpu_get_parent(struct clk_hw *hw)
               ^^
   419  {
   420          struct clk_pm_cpu *pm_cpu = to_clk_pm_cpu(hw);
   421          int num_parents = clk_hw_get_num_parents(hw);
   422          u32 val;
   423  
   424          if (armada_3700_pm_dvfs_is_enabled(pm_cpu->nb_pm_base)) {
   425                  val = armada_3700_pm_dvfs_get_cpu_parent(pm_cpu->nb_pm_base);
   426          } else {
   427                  val = readl(pm_cpu->reg_mux) >> pm_cpu->shift_mux;
   428                  val &= pm_cpu->mask_mux;
   429          }
   430  
   431          if (val >= num_parents)
   432                  return -EINVAL;
                               ^^^^^^^
   433  
   434          return val;
   435  }

regards,
dan carpenter
