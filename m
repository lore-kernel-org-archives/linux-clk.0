Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAADC48BDF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30C7161406
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhFJOgS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 10:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhFJOgR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 10:36:17 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8247C061574
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:34:21 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id k22-20020a17090aef16b0290163512accedso5587453pjz.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6NoG4kcVr4onmC8GwKi74Fb0Au47jb6GQBPdI6ViJks=;
        b=hb+gFlMZ5lsfye5orD2HfDm69xWdh0ImWNrad0GfmspEQe/MBdHf3Bdn/pBUdOTIMz
         vJgQTkk6IKqPDE90d3GqXyh2lMetjiVYCHaV3koKdOWnzzgID5ZwFFkHT+ZPX+IB4CRY
         pr3dfjU5mxgGZ6w4+rjHvKSGJTz66UdEwz0sLR7CbGHIgFF9Ym2QTPX2/GfUF6D8DPss
         P5BIPLEtBNrVMVFTSElQ8fkBu7PASbQnkln+1NhijjL2ZqG9AHFg0BgVQZkSQhqzgSiZ
         VTYSdElUzNXQ+Edo5gyAV9Pb5duRU0lNkY4AGZLZZQYR/ytYXMkQjCTeZICrqj64Nehu
         zhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6NoG4kcVr4onmC8GwKi74Fb0Au47jb6GQBPdI6ViJks=;
        b=eiUgv84j/l5JvaUmg4pctEcgmyPvohBk0FYGBSDTQ5E6Oa3+b0dZgA/Jbwd1w5cO/1
         wtRnCzg2BYLB8U4/5CwFuJYsaolaOQqY32QkXv2GsxQdAb7qEX2RVFD9408lP/+NFkyn
         NAYgIg1CdcWSDV1HpVzdi01ZQ8Btd7gdTLjtv8iY/mTWCf7UQQkOt0J8AWYkJlT5HGVN
         FuAqIc5JtbOvvOlX5sPmvwO7H2IsFhDdxZ3G23m7HDuoZ49fZtxv/RC3xuYt2yDeNaYV
         +muLjztMxC56SQuepUIxVrGS4FE2mMkXSRts4lZ0sKBtjJhIdQmF89bF1lO8lYlu1WvF
         +k7w==
X-Gm-Message-State: AOAM531n6lWZ80PnNftWu/WG1+q43otp5C7Lf9Csyb4Af2Khh/5XeUwZ
        px1VB3A+7ln1YK0gVXanxzxH
X-Google-Smtp-Source: ABdhPJzbF7Z0yYFRdKQ/8/O7a/ocykejjMhtwCjk3txcAfux7Dj9U26puqA3/fd1ViStsxX6YI8mJw==
X-Received: by 2002:a17:902:d917:b029:107:eca4:d5b4 with SMTP id c23-20020a170902d917b0290107eca4d5b4mr5063870plz.79.1623335661194;
        Thu, 10 Jun 2021 07:34:21 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d9e:80ad:d341:9a16:2c5c:2249])
        by smtp.gmail.com with ESMTPSA id o133sm2804262pfd.49.2021.06.10.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:34:20 -0700 (PDT)
Date:   Thu, 10 Jun 2021 20:04:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: actions: Fix AHPPREDIV-H-AHB clock chain on
 Owl S500 SoC
Message-ID: <20210610143413.GC315240@thinkpad>
References: <cover.1622119892.git.cristian.ciocaltea@gmail.com>
 <107776b4a4e752ef83b143114d2baf52bf8c4107.1622119892.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107776b4a4e752ef83b143114d2baf52bf8c4107.1622119892.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 27, 2021 at 04:16:42PM +0300, Cristian Ciocaltea wrote:
> There are a few issues with the setup of the Actions Semi Owl S500 SoC's
> clock chain involving AHPPREDIV, H and AHB clocks:
> 
> * AHBPREDIV clock is defined as a muxer only, although it also acts as
>   a divider.
> * H clock is using a wrong divider register offset
> * AHB is defined as a multi-rate factor clock, but it is actually just
>   a fixed pass clock.
> 
> Let's provide the following fixes:
> 
> * Change AHBPREDIV clock to an ungated OWL_COMP_DIV definition.
> * Use the correct register shift value in the OWL_DIVIDER definition
>   for H clock
> * Drop the unneeded 'ahb_factor_table[]' and change AHB clock to an
>   ungated OWL_COMP_FIXED_FACTOR definition.
> 
> Fixes: ed6b4795ece4 ("clk: actions: Add clock driver for S500 SoC")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
> Changes in v2:
>  - Reverted the addition of the clock div table for H clock to support the
>    '1' divider (according to the datasheet), even though the vendor
>    implementation marks it as reserved
>  
>  drivers/clk/actions/owl-s500.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/actions/owl-s500.c b/drivers/clk/actions/owl-s500.c
> index 42d6899755e6..257923bd5386 100644
> --- a/drivers/clk/actions/owl-s500.c
> +++ b/drivers/clk/actions/owl-s500.c
> @@ -153,11 +153,6 @@ static struct clk_factor_table hde_factor_table[] = {
>  	{ 0, 0, 0 },
>  };
>  
> -static struct clk_factor_table ahb_factor_table[] = {
> -	{ 1, 1, 2 }, { 2, 1, 3 },
> -	{ 0, 0, 0 },
> -};
> -
>  static struct clk_div_table rmii_ref_div_table[] = {
>  	{ 0, 4 }, { 1, 10 },
>  	{ 0, 0 },
> @@ -186,7 +181,6 @@ static struct clk_div_table nand_div_table[] = {
>  
>  /* mux clock */
>  static OWL_MUX(dev_clk, "dev_clk", dev_clk_mux_p, CMU_DEVPLL, 12, 1, CLK_SET_RATE_PARENT);
> -static OWL_MUX(ahbprediv_clk, "ahbprediv_clk", ahbprediv_clk_mux_p, CMU_BUSCLK1, 8, 3, CLK_SET_RATE_PARENT);
>  
>  /* gate clocks */
>  static OWL_GATE(gpio_clk, "gpio_clk", "apb_clk", CMU_DEVCLKEN0, 18, 0, 0);
> @@ -199,16 +193,25 @@ static OWL_GATE(timer_clk, "timer_clk", "hosc", CMU_DEVCLKEN1, 27, 0, 0);
>  static OWL_GATE(hdmi_clk, "hdmi_clk", "hosc", CMU_DEVCLKEN1, 3, 0, 0);
>  
>  /* divider clocks */
> -static OWL_DIVIDER(h_clk, "h_clk", "ahbprediv_clk", CMU_BUSCLK1, 12, 2, NULL, 0, 0);
> +static OWL_DIVIDER(h_clk, "h_clk", "ahbprediv_clk", CMU_BUSCLK1, 2, 2, NULL, 0, 0);
>  static OWL_DIVIDER(apb_clk, "apb_clk", "ahb_clk", CMU_BUSCLK1, 14, 2, NULL, 0, 0);
>  static OWL_DIVIDER(rmii_ref_clk, "rmii_ref_clk", "ethernet_pll_clk", CMU_ETHERNETPLL, 1, 1, rmii_ref_div_table, 0, 0);
>  
>  /* factor clocks */
> -static OWL_FACTOR(ahb_clk, "ahb_clk", "h_clk", CMU_BUSCLK1, 2, 2, ahb_factor_table, 0, 0);
>  static OWL_FACTOR(de1_clk, "de_clk1", "de_clk", CMU_DECLK, 0, 4, de_factor_table, 0, 0);
>  static OWL_FACTOR(de2_clk, "de_clk2", "de_clk", CMU_DECLK, 4, 4, de_factor_table, 0, 0);
>  
>  /* composite clocks */
> +static OWL_COMP_DIV(ahbprediv_clk, "ahbprediv_clk", ahbprediv_clk_mux_p,
> +			OWL_MUX_HW(CMU_BUSCLK1, 8, 3),
> +			{ 0 },
> +			OWL_DIVIDER_HW(CMU_BUSCLK1, 12, 2, 0, NULL),
> +			0);
> +
> +static OWL_COMP_FIXED_FACTOR(ahb_clk, "ahb_clk", "h_clk",
> +			{ 0 },
> +			1, 1, CLK_SET_RATE_PARENT);

I think you swapped the flags between "ahbprediv_clk" and "ahb_clk"...

> +
>  static OWL_COMP_FACTOR(vce_clk, "vce_clk", hde_clk_mux_p,
>  			OWL_MUX_HW(CMU_VCECLK, 4, 2),
>  			OWL_GATE_HW(CMU_DEVCLKEN0, 26, 0),
> -- 
> 2.31.1
> 
