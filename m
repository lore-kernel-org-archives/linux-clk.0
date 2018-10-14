Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A264C7112A
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 20:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 128EC2086A
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 20:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2krKmfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128EC2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbeJOEDi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 00:03:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34527 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbeJOEDh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Oct 2018 00:03:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id y10-v6so12642161lfj.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Oct 2018 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Jc7fZ4IAwRm/8V+dfbExXyTYzbiNsgj/Mb0R5mMrfM=;
        b=f2krKmfAOC97PIRJ7Y18xuzCBswZdjEXtSUjIFsAno9Ycz9bUBKlIIO9hUGd8h0BL7
         SOCN9TJ52WYt9BqeiTRQzx93cKavxydARcsODfQdf8jlVLST2E7tmyFHgxES1fkt0coE
         EXFOow4jFEzHexg5rDVe0i08LotXHd2ZtR8RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Jc7fZ4IAwRm/8V+dfbExXyTYzbiNsgj/Mb0R5mMrfM=;
        b=MbaN/GKzug2os9GWakKcZ+s1hZJZlXxtNCPjOiGPWnl0VNmcTlzsFiTKvN2cn93q/8
         IS1RVp2nJAM332ITjbH1ICeqMWK49cbpSoxQmokE9zCKBE/7aOLkr7nfODwHlZIK5t0m
         cCFtnp35qACZr2MchDsP8+WVPc1XVEThiheTO3/MyEnhJb7Or4DfKiTOA2eOuSjp/s8T
         qcLI94sENt6WwmWYgrEOHozdj80cZco8IZ+/mYD1gbM0QCPSUIHCR1CMNloV/UEkeQ9i
         76a4FnxNhn/whkAfJ1crLl/F0IxGRRHc9PcVNpiowSHATepBl/h+JPVgrD/kKB1v5L5b
         tn3w==
X-Gm-Message-State: ABuFfoh/EoPu6ZHHV2WXBq1KE6Q8iM/0EC5rcCDIrXmQXFaglZtAvrE4
        NUZVLOHym5XStJ5gwuhS+YDFlw==
X-Google-Smtp-Source: ACcGV63+8L02/a6p/cGLx88Wq0Sy0q9e9UG0tiEvqG/7rKQsLA5SOmfsSU9IennlM/X20sO5zwEtVg==
X-Received: by 2002:a19:645e:: with SMTP id b30-v6mr8156386lfj.5.1539548485263;
        Sun, 14 Oct 2018 13:21:25 -0700 (PDT)
Received: from centauri.lan (h-229-118.A785.priv.bahnhof.se. [5.150.229.118])
        by smtp.gmail.com with ESMTPSA id m131-v6sm972912lfe.38.2018.10.14.13.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Oct 2018 13:21:24 -0700 (PDT)
Date:   Sun, 14 Oct 2018 22:21:22 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, ilia.lin@gmail.com,
        bjorn.andersson@linaro.org
Cc:     Ricardo Salveti <rsalveti@rsalveti.net>, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, will.deacon@arm.com,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 3/8] clk: Use devm_ in the register fixed factor clock
Message-ID: <20181014202122.GA13473@centauri.lan>
References: <20180614215358.11264-1-ilia.lin@gmail.com>
 <20180614215358.11264-4-ilia.lin@gmail.com>
 <CAHYQr0rR=mcV-SxZFW+5M4CTUaTv_f_bruyq91HiGP6sqUZ3Yw@mail.gmail.com>
 <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 12, 2018 at 03:08:17PM -0700, Stephen Boyd wrote:
> Quoting Ricardo Salveti (2018-09-14 11:53:02)
> > On Thu, Jun 14, 2018 at 6:55 PM <ilia.lin@gmail.com> wrote:
> > >
> > > From: Ilia Lin <ilialin@codeaurora.org>
> > >
> > > Use devm_clk_hw_register instead of clk_hw_register
> > > to simplify the usage of this API. This way drivers that call
> > > the clk_hw_register_fixed_factor won't need to maintain
> > > a data structure for further cleanup.
> > >
> > > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > > Tested-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > ---
> > >  drivers/clk/clk-fixed-factor.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> > > index a5d402de5584..8e39bda8e596 100644
> > > --- a/drivers/clk/clk-fixed-factor.c
> > > +++ b/drivers/clk/clk-fixed-factor.c
> > > @@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> > >         init.num_parents = 1;
> > >
> > >         hw = &fix->hw;
> > > -       ret = clk_hw_register(dev, hw);
> > > +       ret = devm_clk_hw_register(dev, hw);
> > 
> > Not sure what is the current state of this patch-set, but this change
> > breaks drivers calling clk_hw_register_fixed_factor with a NULL dev
> > (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a valid dev
> > for devres_add to work.
> > 
> 
> Yep. Probably better to just have a driver register the clk_hw structure
> itself with the clk framework vs. trying to get it right here in the
> generic type registration function.
> 

Hello Ilia, Stephen,

As you know this patch series is needed to get DVFS working on msm8996.

Ilia, are you planning on submitting a new patch set for this, or would
you prefer if we submitted a new patch version for you?

Looking at this patch series, this appears to be the only outstanding
review comment. Stephen, do you have any review comments on this series?


Kind regards,
Niklas
