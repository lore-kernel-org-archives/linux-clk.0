Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE7CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 02:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbiGSCjL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Jul 2022 22:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbiGSCjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Jul 2022 22:39:07 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E7026566
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-f2a4c51c45so28808157fac.9
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wm/d7g9+Kn3JB5OGUKlcMYsTmYkIW1B3SgCJ+oJ3vPY=;
        b=qj+zm++BHUM19KuCYUWWGC9VksbbnkAY2Yoll9PG/f71LMcHVsVacpzH+ZJ8/rLpcx
         PcbhY+WSU6tmQCXl6m4z9IZcvrzlpUhVHZSuq8JhaMOSm7Ah+q+v52xxyx9BiQRbTcRN
         qzCFOwxpPNMqHX0dURrkwnM6OHvSJBSzVqR3u5yPRufyidgGW8QKucaqvvPJsjE/TF/L
         /d9vxXX9w++niTY41HYrIMTKAr1ocB7COLldmtw50NA8ijMPCwD+w3dOwNb9C9DnTHH2
         mkOa/AGa6wb6o1YNNEJNi+tu02kVBmMeU2RJWt5UwRNIK50wkYJ4naM0PqYMyl5fgPgl
         ZaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wm/d7g9+Kn3JB5OGUKlcMYsTmYkIW1B3SgCJ+oJ3vPY=;
        b=ggF0ubQ+6oqCI6Lz0vgOBTg3obQthaVwgZUL56Tm5KR2xFBQAYjgfSEaXQhyiBrISZ
         fdepEVFcfz4Zouhsp1FS9eYcufAEL4ci8PQRvIFp1dfzP1dML8g1iSNpeNfkXcbEDihI
         XxR6zG6C6oQ+1rLhDeniOc9NzSqds86NrJuCNaBGcQyPJ+HPHRJGHK4IROn1uvirfVaM
         BcmcFItUJ7xK2ifGAnih+ltaR0jMl46GH8e46zYs8v1+tqNEnsd00Rt9HccSzM3ZXAk8
         PYFaPEyo4WZLsLtiv/TF/U2iveLDog9XDPwmBMcFUVLrgpvTOl41Q5VRtHuD3rqc739h
         74xQ==
X-Gm-Message-State: AJIora/MnzRN8P7Rc/M+8XDZ6p6lWpKlYbX+0QlYxCAA1zobD8JR+IFL
        nl6JKgsyuUiLPJsSXj+0AUqHnw==
X-Google-Smtp-Source: AGRyM1v9rzKtUFZreXzWZUMZg6qf4gz5UAJnvdDhJcDD7UtLWZLNDCLDmHphVGWEwgqoLgSXjbs7kw==
X-Received: by 2002:a05:6808:654:b0:33a:66b8:a7ef with SMTP id z20-20020a056808065400b0033a66b8a7efmr6406262oih.108.1658198346055;
        Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m3-20020a9d4003000000b0061c34f86b31sm5765168ote.5.2022.07.18.19.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 19:39:05 -0700 (PDT)
Date:   Mon, 18 Jul 2022 21:39:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: a53-pll: convert to use parent_data rather
 than parent_names
Message-ID: <YtYZR9tsfNw8OwvO@builder.lan>
References: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 19 Jun 20:06 CDT 2022, Dmitry Baryshkov wrote:

> Change a53-pll driver to use clk_parent_data rather than always looking
> up the xo clock in the system clock list.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/a53-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 329d2c5356d8..f9c5e296dba2 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -127,7 +127,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>  	if (!init.name)
>  		return -ENOMEM;
>  
> -	init.parent_names = (const char *[]){ "xo" };
> +	init.parent_data = &(const struct clk_parent_data){
> +		.fw_name = "xo", .name = "xo_board",

This used to look up the globally named clock "xo", now it picked up
"xo_board". If this is intentional, could you please update the commit
message to cover this part?

Thanks,
Bjorn

> +	};
>  	init.num_parents = 1;
>  	init.ops = &clk_pll_sr2_ops;
>  	pll->clkr.hw.init = &init;
> -- 
> 2.35.1
> 
