Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E20C282CD
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 04:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEBE520863
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548822975;
	bh=VACextXI1iE0qYsnU/GmlVTvE3GP4x07sT3zSbrCPTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e2t3ckQfoMoNl0SB2O6me8b0kPwU4u3c4I+mS/9poRxKOa2h0TsMYXAHOJYAgsMNw
	 TRyOgeY7MN/QVvGeM9EIgt6VU6eMAhsEFQZ+HVfpnLkvFV/J2tmlk80Wna3rPHe/81
	 c2SUD8oQyYY0IcaKweYQwza187UmwAHQKiZ5FAZk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbfA3EgP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 23:36:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:36502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728356AbfA3EgP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jan 2019 23:36:15 -0500
Received: from localhost (unknown [122.178.236.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE39420863;
        Wed, 30 Jan 2019 04:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548822973;
        bh=VACextXI1iE0qYsnU/GmlVTvE3GP4x07sT3zSbrCPTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tjV4scvUKDnoO0b9UycjCNCV6Lh2EbUko5vXIF8t3xhcq2MmycYIYSCUx5z12SXyO
         qvjWGqqEqTcR9QxE5YxyO5JGdHRnEiKskRS4cEQ4O01gP/MaMHm32XZLJ7BV+ZOyzJ
         WxlNAhdMH8XR4RiUHirN0zNansQVd6Lini+SgYhc=
Date:   Wed, 30 Jan 2019 10:04:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Khasim Syed Mohammed <khasim.mohammed@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: clk-rcg2: Introduce a cfg offset for RCGs
Message-ID: <20190130043443.GD4635@vkoul-mobl>
References: <20190128115359.30039-1-vkoul@kernel.org>
 <154880173887.136743.11486618909610624058@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154880173887.136743.11486618909610624058@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29-01-19, 14:42, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-01-28 03:53:58)
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index e5eca8a1abe4..f06783c20688 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -140,6 +140,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
> >   * @parent_map: map from software's parent index to hardware's src_sel field
> >   * @freq_tbl: frequency table
> >   * @clkr: regmap clock handle
> > + * @cfg_off: defines the cfg register offset from the CMD_RCGR
> >   *
> 
> Please remove this extra line here. Also, shouldn't it say offset from
> CMD_RCGR + CFG_REG?

Sure but I dont like to mix so will send that as a separate patch :)

and will update the comment too.

> 
> 
> >   */
> >  struct clk_rcg2 {
> > @@ -150,6 +151,7 @@ struct clk_rcg2 {
> >         const struct parent_map *parent_map;
> >         const struct freq_tbl   *freq_tbl;
> >         struct clk_regmap       clkr;
> > +       u8                      cfg_off;
> >  };
> >  
> >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 6e3bd195d012..106848e3313f 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -74,7 +74,8 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
> >         u32 cfg;
> >         int i, ret;
> >  
> > -       ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > +       ret = regmap_read(rcg->clkr.regmap,
> > +                         rcg->cmd_rcgr + rcg->cfg_off + CFG_REG, &cfg);
> 
> Maybe we should define CFG_REG as CFG_REG(rcg) and then do the math
> there?
> 
> #define CFG_REG(rcg) (rcg)->cfg_off + 0x4

Sure that looks better

> 
> >         if (ret)
> >                 goto err;
> >  
> > @@ -263,17 +268,20 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >         if (rcg->mnd_width && f->n) {
> >                 mask = BIT(rcg->mnd_width) - 1;
> >                 ret = regmap_update_bits(rcg->clkr.regmap,
> > -                               rcg->cmd_rcgr + M_REG, mask, f->m);
> > +                                        rcg->cmd_rcgr + rcg->cfg_off + M_REG,
> > +                                        mask, f->m);
> >                 if (ret)
> >                         return ret;
> >  
> >                 ret = regmap_update_bits(rcg->clkr.regmap,
> > -                               rcg->cmd_rcgr + N_REG, mask, ~(f->n - f->m));
> > +                                        rcg->cmd_rcgr + rcg->cfg_off + N_REG,
> > +                                        mask, ~(f->n - f->m));
> >                 if (ret)
> >                         return ret;
> >  
> >                 ret = regmap_update_bits(rcg->clkr.regmap,
> > -                               rcg->cmd_rcgr + D_REG, mask, ~f->n);
> > +                                        rcg->cmd_rcgr + rcg->cfg_off + D_REG,
> > +                                        mask, ~f->n);
> 
> Ah the MND registers also move. Wow that's so sad. Do a similar thing
> for all these too?
> 
> #define D_REG(rcg) (rcg)->cfg_off + 0x8
> etc...
> 
> All just to make things fit on the same number of lines as before! We
> could also throw the rcg->cmd_rcgr part into the register named macros
> to make things even shorter. It was mostly OK when it was just adding
> the offset to the base, but now we have another offset so I think we can
> roll it all into the macro so that we can just read "regmap_read
> FOO_REG" and ignore the rest.

Correct that will make it neater, will do so

-- 
~Vinod
