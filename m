Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A101C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 16:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiBXQ3J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBXQ3J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 11:29:09 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7EA192E19
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 08:28:38 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id p15so3259908oip.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UtvGHwpTPxnNK4df830HsbQ5tqR9fciM9/AXkb63doE=;
        b=ezsfkKAm3SoATQ8pbdZnOmKRIPKE6xVK9TxybTM5YRuqZBED0GKI+NSlQKXYJNU6a9
         wUhfHlw1PQYC9gUeoQbyNVCKCxFtT6ARNpmAz0vNLaysBNBKvGynHBIoc6aFC6oIQenf
         fLbC9wytOC33ipG/dDymdMC8C962u/ItTirw3NV39yarM02FPLSk0q4W8hk6vJYIcQT6
         xXB7Sp+1WoiBxpxytz/VKqSH8llpk12Q0WCpLXGFQd/aV+63jfag7c029qhb0DFsjE4z
         Kj3OqWnAVTlniXK45mmZO5L3RoNpOtjKeX7D8Fa12mJX5E4hxgutUXHVapL7kAQm5u9I
         LuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UtvGHwpTPxnNK4df830HsbQ5tqR9fciM9/AXkb63doE=;
        b=bi7XmfGFdxEDT/tUAO4ukE4DbnrKbNgcR+DhEd3bXVMpHLNFGoDPG+WCcpR5pObxwY
         p/CrND4KyMq+IdgMfxUQVnMmm8m63Zwz1WEETHEKV46ybSeVI/ZZtcPvF8wt710DE2M0
         Nit7wHieLMwSRz21mXDUzrdXMrvVlnPyfo89zp6tFsa64blhrjalUnaEZvifoYAmU35w
         i8wHNCH6Gjq/BrbVP5hKYl48zfc5+6hHo5FdUA2BuW/8+pLSUdpVTMiAOmTmV5u0+RzH
         h5bwlkcte++ZXcByqOJS/syK0MwaTxlT1JKExzyGtXvl8j03/AStWxawyHpEMQlnJ+62
         hSlw==
X-Gm-Message-State: AOAM532iY1tjYJq/40PAwv14us5MStTY+m7NBineLG/FuOgWTOkcUmFh
        aib7vpmKd73TK2E/4h0FNm3SrPheFDayDA==
X-Google-Smtp-Source: ABdhPJyLngbnCzXVfVhLUeGhokc4vEYxVcUw8ZYCKRZ1+I+U+Abro1TlFcBGQ9rXJ+VjKw2M1RmFmw==
X-Received: by 2002:a05:6870:4410:b0:d3:1505:36c8 with SMTP id u16-20020a056870441000b000d3150536c8mr6822284oah.300.1645719214522;
        Thu, 24 Feb 2022 08:13:34 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id g18sm1365629otp.17.2022.02.24.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:13:33 -0800 (PST)
Date:   Thu, 24 Feb 2022 08:15:32 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/16] clk: qcom: gcc-ipq806x: drop hardcoded pxo and
 cxo source clk
Message-ID: <YhevJB2nY/X6sWnS@ripper>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-8-ansuelsmth@gmail.com>
 <YhcAdq4ouQenhn2f@builder.lan>
 <YhepQc3k8l1g5NZ/@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhepQc3k8l1g5NZ/@Ansuel-xps.localdomain>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 24 Feb 07:50 PST 2022, Ansuel Smith wrote:

> On Wed, Feb 23, 2022 at 09:50:14PM -0600, Bjorn Andersson wrote:
> > On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:
> > 
> > > We now define these clk in dts. Drop pxo and cxo hardcoded in the gcc
> > > probe function.
> > > 
> > 
> > As noted on the previous patch, this breaks booting with existing dtbs.
> > So I would like to split this with 1-2 releases in between to avoid any
> > problems.
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > on the change though.
> > 
> > Regards,
> > Bjorn
> >
> 
> Should I change this and register these clks only if they are not present?
> 

The .fw_name will match against clock-names to resolve a phandle to
e.g. &pxo_board and if not found should fall back to matching by .name
and finding these clocks. So I don't see a conflict in keeping them
around.

Once we know that the dts change is in place I think we should merge
this as is.

Regards,
Bjorn

> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq806x.c | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > index f6db7247835e..a4bf78fe8678 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -3119,23 +3119,14 @@ MODULE_DEVICE_TABLE(of, gcc_ipq806x_match_table);
> > >  
> > >  static int gcc_ipq806x_probe(struct platform_device *pdev)
> > >  {
> > > -	struct device *dev = &pdev->dev;
> > >  	struct regmap *regmap;
> > >  	int ret;
> > >  
> > > -	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 25000000);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 25000000);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	ret = qcom_cc_probe(pdev, &gcc_ipq806x_desc);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	regmap = dev_get_regmap(dev, NULL);
> > > +	regmap = dev_get_regmap(&pdev->dev, NULL);
> > >  	if (!regmap)
> > >  		return -ENODEV;
> > >  
> > > -- 
> > > 2.34.1
> > > 
> 
> -- 
> 	Ansuel
