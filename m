Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF7FC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 22:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C48A61220
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 22:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhHXWiX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 18:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhHXWiW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 18:38:22 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B053C0613C1
        for <linux-clk@vger.kernel.org>; Tue, 24 Aug 2021 15:37:38 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i3-20020a056830210300b0051af5666070so40613533otc.4
        for <linux-clk@vger.kernel.org>; Tue, 24 Aug 2021 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1lJfH4wOJMmxE0ajatpSxG4P5pBAHDcGb2+cRaSL28E=;
        b=ywFDc+LPrrWaukM9IgOlHwuhqaHHnTjzR+ePdmB+lZAfbkzLwyDnVF3GQSdi4e5Bk9
         E9oVUkHx+9mKjyWts6mvt30KoTW7g4x/AuP2K8Bakf+N8Adg7h83Uoyr+xX5qDnCvNim
         5UfehGbbTR34atM9vlo00eBNTRE/Xyvkrvyp+rjXNnMs8p6/2OGxDGYpIeM/4WY2yUNV
         clVyJXtCzG2eVgprJxzl/XasP7yfKhdSyH75j2PC6DboMs4VydMC6bSYvGydtmP5MFGI
         rA83yNQD9nHSRfJpVTAS0GW2vEQbCSwsb2J7roq6U83daiWnUwDsfo624ng2mybgdi0Y
         jZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1lJfH4wOJMmxE0ajatpSxG4P5pBAHDcGb2+cRaSL28E=;
        b=hrpmQw2lHyzCt7s0Aa8CaOtaPq+UwZpnwmZYmaIMH0QdRtp3DxAWOWdv7K8WB3HpyY
         in+dhF9LWtt0ucqK1ENTzzIyi4+VNAlbZXs0Jeo/4US4RfLYvo58g74nWppVHH18FkdY
         M5JOkfN6xzKGKopz3v29Fcpy+DxtlvZgrPJOlojtHed56+OV5dj8HLf2/CVtbwSqBkXI
         RFDsdYal5sFRQQ+YmNystlv19jMwcgs85L/UZhPxoOKcwaTVckQkNeFVkZYdOkyaBwEu
         xu5gkZ01sMHOsGp6oHnKlxyL2j2+veNZsZB9fEbsX9CGIQ3Fq9Zl03mPQ2RcjimhK7rV
         BGDA==
X-Gm-Message-State: AOAM5302Qh8/kpiCSCfuOmx9DTDxc5H1DtNCVh2HXM2YrX/S3wgF3RQp
        81ffnlBOqLaD7vgrSKuU9aBFrg==
X-Google-Smtp-Source: ABdhPJw5Ma9QotdP5zqVWblvun23nSYXRtkobA/qBDoVv82DX73Jz4Ic+V298jXD/ocNulCAHb9mRg==
X-Received: by 2002:a05:6830:44a4:: with SMTP id r36mr7064745otv.107.1629844657267;
        Tue, 24 Aug 2021 15:37:37 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w15sm4525430oiw.19.2021.08.24.15.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 15:37:36 -0700 (PDT)
Date:   Tue, 24 Aug 2021 15:38:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
Message-ID: <YSV0/bFiPgY3fjPF@ripper>
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 24 Aug 13:46 PDT 2021, Marijn Suijten wrote:

> Hi Bjorn,
> 
> Thanks for this cleanup, that's needed and much appreciated!
> 
> On 8/24/21 5:06 PM, Bjorn Andersson wrote:
> > Using parent_data and parent_hws, instead of parent_names, does protect
> > against some cases of incompletely defined clock trees. While it turns
> > out that the bug being chased this time was totally unrelated, this
> > patch converts the SDM660 GCC driver to avoid such issues.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> On the Sony Xperia XA2 Ultra, bar the necessary change in the 14NM DSI PHY
> driver commented below.
> 
> > [..]
> > -
> > -static struct clk_fixed_factor xo = {
> > -	.mult = 1,
> > -	.div = 1,
> > -	.hw.init = &(struct clk_init_data){
> > -		.name = "xo",
> > -		.parent_names = (const char *[]){ "xo_board" },
> > -		.num_parents = 1,
> > -		.ops = &clk_fixed_factor_ops,
> > -	},
> > -};
> 
> 
> Removing the global "xo" clock makes it so that our 14nm DSI PHY does not
> have a parent clock anymore, as the clock is called "xo_board" nowadays
> ("xo" in the position of fw_name is, as you know, only local to this driver
> because it is named that way in the clock-names property). We (SoMainline)
> suffer the same DSI PHY hardcoding issue on many other boards and are at
> this point investigating whether to provide &xo_board in DT like any other
> sane driver.  Do you happen to know if work is already underway to tackle
> this?
> 

As far as I can tell most other platforms doesn't define "xo" either.
E.g. according to debugfs dsi0vco_clk doesn't have a parent on sdm845...

Sounds like we should update the dsi phys to specify a fw_name and
update binding and dts to provide this...


Does this cause a noticeable regression or it's just that we have a
dangling clock?

> >   static struct clk_alpha_pll gpll0_early = {
> >   	.offset = 0x0,
> >   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > @@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
> >   		.enable_mask = BIT(0),
> >   		.hw.init = &(struct clk_init_data){
> >   			.name = "gpll0_early",
> > -			.parent_names = (const char *[]){ "xo" },
> > +			.parent_data = &(const struct clk_parent_data){
> > +				.fw_name = "xo",
> > +			},
> 
> 
> I wish we could use .parent_names for a list of .fw_name's too

Afaict specifying "name" in struct clk_parent_data is the same as using
parent_names. But I'm not up to speed on the details of how to migrate
the dsi phys.

> > [..]
> > @@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
> >   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
> >   	.clkr.hw.init = &(struct clk_init_data){
> >   		.name = "blsp1_qup1_i2c_apps_clk_src",
> > -		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
> > +		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
> >   		.num_parents = 3,
> 
> 
> How about using ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div) now?
> Same for every other occurrence of this pattern.
> 

I omitted that because it felt unrelated to the change I was doing, but
it could certainly be done.

Regards,
Bjorn
