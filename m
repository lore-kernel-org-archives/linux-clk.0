Return-Path: <SRS0=7bnF=UX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D44FC43613
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 07:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E83602089F
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561362608;
	bh=NUTTLothhzzOC0j5vETDOOEWK+MUpP+R2scD8KdK/uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AAT9NPYts8+WPprT/n7KgMt0jLneZLsV1ELlbERThoUw8awW2Cca6BLZrwTyCaSIx
	 dwjXZms3TJ4qTiezug6wDSPy8ahZruoqxS8OEO/O6LQVsnyPsn7tLokIdvDwPVYxKX
	 5oRXwWUFfvrzuitvq3Zo+8fwL5vJDeMLLIRPmeag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfFXHuH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 03:50:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726807AbfFXHuH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 03:50:07 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A1482089F;
        Mon, 24 Jun 2019 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561362607;
        bh=NUTTLothhzzOC0j5vETDOOEWK+MUpP+R2scD8KdK/uI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BXuHjSgHZJKxpUdzMa11Wo38NxGuIWwnrrv60gbZ5/K+HOSGQq11oqhRlNTEL24vq
         Q34eihSka8mFMqZ9Wx0aOwJTxCMUrkSql1oyThwmGTq/zrNqBOht+ichGirmtkBE95
         kU1YDEPUVASPDm9F1qjIJvg9GWKmC9NOObhx/FeI=
Date:   Mon, 24 Jun 2019 13:16:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
Message-ID: <20190624074657.GX2962@vkoul-mobl>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-2-vkoul@kernel.org>
 <20190617043734.GH750@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617043734.GH750@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-06-19, 21:37, Bjorn Andersson wrote:
> On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:
> 
> > We have couple of instances in the driver with unnecessary
> > u64 casts, drop them.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 0ced4a5a9a17..b48707693ffd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -832,7 +832,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> >  	int div;
> >  
> >  	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
> > -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
> > +	div = DIV_ROUND_UP_ULL(parent_rate, rate) - 1;
> 
> Afaict DIV_ROUND_UP_ULL() will first add "parent_rate" and "rate" and
> then stash this in a unsigned long long and do the division. So what
> happens if parent_rate + rate > 32 bits on a 32-bit target?
> 
> (Shouldn't there be a cast of (ll) in the macro to ULL?)

Agreed, though DIV_ROUND_DOWN_ULL does it correctly, right fix would be to make it:

#define DIV_ROUND_UP_ULL(ll, d)         DIV_ROUND_DOWN_ULL(unsigned long long(ll) + (d) - 1, (d)) 

I will post that as well..

Thanks

-- 
~Vinod
