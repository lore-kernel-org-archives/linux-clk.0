Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:23171 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751205AbdGMDPx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2017 23:15:53 -0400
Message-ID: <1499915747.16278.30.camel@mtkswgap22>
Subject: Re: [PATCH] clk: mediatek: fixed static checker warning in
 clk_cpumux_get_parent call
From: Sean Wang <sean.wang@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <dan.carpenter@oracle.com>, <linux-mediatek@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 13 Jul 2017 11:15:47 +0800
In-Reply-To: <20170712231726.GQ22780@codeaurora.org>
References: <59fd4aa684632f1d9d2e7573a95bc42850e81690.1499701486.git.sean.wang@mediatek.com>
         <20170712231726.GQ22780@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2017-07-12 at 16:17 -0700, Stephen Boyd wrote:
> On 07/11, sean.wang@mediatek.com wrote:
> > diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> > index edd8e69..c6a3a1a 100644
> > --- a/drivers/clk/mediatek/clk-cpumux.c
> > +++ b/drivers/clk/mediatek/clk-cpumux.c
> > @@ -27,7 +27,6 @@ static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
> >  static u8 clk_cpumux_get_parent(struct clk_hw *hw)
> >  {
> >  	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
> > -	int num_parents = clk_hw_get_num_parents(hw);
> >  	unsigned int val;
> >  
> >  	regmap_read(mux->regmap, mux->reg, &val);
> > @@ -35,17 +34,18 @@ static u8 clk_cpumux_get_parent(struct clk_hw *hw)
> >  	val >>= mux->shift;
> >  	val &= mux->mask;
> >  
> > -	if (val >= num_parents)
> > -		return -EINVAL;
> > -
> 
> Yeah we really need to fix the get_parent() op to return a
> clk_hw pointer instead. Time for another migration plan...
> 

Agreed

Using clk_hw pointer as returned type is better

otherwise, core driver strongly depends on raw value from hardware  

which easily breaks core driver's logic

> >  	return val;
> >  }
> >  
> >  static int clk_cpumux_set_parent(struct clk_hw *hw, u8 index)
> >  {
> >  	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
> > +	int num_parents = clk_hw_get_num_parents(hw);
> >  	u32 mask, val;
> >  
> > +	if (index >= num_parents)
> > +		return -EINVAL;
> 
> When would we call this function with an invalid index? The
> framework should be making sure to only call it with an index
> that's valid. So perhaps this hunk can be left out?
> 

O.K. the hunk will be left out

core driver handles everything well when the appropriate number of
parents is registered.







> 


