Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:9351 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751129AbdGHGjz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Jul 2017 02:39:55 -0400
Message-ID: <1499495984.16278.13.camel@mtkswgap22>
Subject: Re: [bug report] clk: mediatek: add missing cpu mux causing
 Mediatek cpufreq can't work
From: Sean Wang <sean.wang@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <sboyd@codeaurora.org>
Date: Sat, 8 Jul 2017 14:39:44 +0800
In-Reply-To: <20170707095331.s7zlvk5hbqwgngld@mwanda>
References: <20170707095331.s7zlvk5hbqwgngld@mwanda>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Dan, 

	thank you for reporting the defect, I will handle this int next days.
	Sean

On Fri, 2017-07-07 at 12:53 +0300, Dan Carpenter wrote:
> Hello Sean Wang,
> 
> The patch 1e17de9049da: "clk: mediatek: add missing cpu mux causing
> Mediatek cpufreq can't work" from May 5, 2017, leads to the following
> static checker warning:
> 
> 	drivers/clk/mediatek/clk-cpumux.c:39 clk_cpumux_get_parent()
> 	warn: signedness bug returning '(-22)'
> 
> drivers/clk/mediatek/clk-cpumux.c
>     27  static u8 clk_cpumux_get_parent(struct clk_hw *hw)
>     28  {
>     29          struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
>     30          int num_parents = clk_hw_get_num_parents(hw);
>     31          unsigned int val;
>     32  
>     33          regmap_read(mux->regmap, mux->reg, &val);
>     34  
>     35          val >>= mux->shift;
>     36          val &= mux->mask;
>     37  
>     38          if (val >= num_parents)
>     39                  return -EINVAL;
>                         ^^^^^^^^^^^^^^
> Doesn't work for u8.
> 
>     40  
>     41          return val;
>     42  }
> 
> regards,
> dan carpenter


