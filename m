Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:55543 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbeGMKSO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Jul 2018 06:18:14 -0400
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-clk@vger.kernel.org
Subject: Re: [bug report] clk: mvebu: armada-37xx-periph: prepare cpu clk to be used with DVFS
References: <20180620201208.rzzc3lpu2lmyy4sz@kili.mountain>
Date: Fri, 13 Jul 2018 12:04:15 +0200
In-Reply-To: <20180620201208.rzzc3lpu2lmyy4sz@kili.mountain> (Dan Carpenter's
        message of "Thu, 21 Jun 2018 11:06:28 +0300")
Message-ID: <87r2k7bgf4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Dan,
 
 On jeu., juin 21 2018, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Gregory CLEMENT,
>
> The patch 9818a7a4fd10: "clk: mvebu: armada-37xx-periph: prepare cpu
> clk to be used with DVFS" from Nov 30, 2017, leads to the following
> static checker warning:
>
> 	drivers/clk/mvebu/armada-37xx-periph.c:432 clk_pm_cpu_get_parent()
> 	warn: signedness bug returning '(-22)'

Thanks, I finally took time to take care of it and I am going to post a
fix.

Gregory

>
> drivers/clk/mvebu/armada-37xx-periph.c
>    418  static u8 clk_pm_cpu_get_parent(struct clk_hw *hw)
>                ^^
>    419  {
>    420          struct clk_pm_cpu *pm_cpu = to_clk_pm_cpu(hw);
>    421          int num_parents = clk_hw_get_num_parents(hw);
>    422          u32 val;
>    423  
>    424          if (armada_3700_pm_dvfs_is_enabled(pm_cpu->nb_pm_base)) {
>    425                  val = armada_3700_pm_dvfs_get_cpu_parent(pm_cpu->nb_pm_base);
>    426          } else {
>    427                  val = readl(pm_cpu->reg_mux) >> pm_cpu->shift_mux;
>    428                  val &= pm_cpu->mask_mux;
>    429          }
>    430  
>    431          if (val >= num_parents)
>    432                  return -EINVAL;
>                                ^^^^^^^
>    433  
>    434          return val;
>    435  }
>
> regards,
> dan carpenter

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
