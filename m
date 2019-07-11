Return-Path: <SRS0=Aryr=VI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2A7C74A35
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 15:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF50E21537
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 15:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh1L7+Va"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfGKPGq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Jul 2019 11:06:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45369 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbfGKPGp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jul 2019 11:06:45 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so3067423pgp.12
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2019 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bReqO5jQsSZW0F1H8jewwqywC8kIWjwq+tdThkdVeG8=;
        b=Yh1L7+VabKoUHQqB4kt31tOafvZr+g3eGc9hP5fd0NVfMPiLQYXaS94RiZbN4lfZiA
         IaJicDs9h2XrbKFSTvjnJNG6WkpMjwFZUtk5s7CNpfZQFbGq5nfrz14zlB1/nwitf359
         rCALpWMCR3WC+9zXqWiJFWkzbKgCryjCEiVRN5FmVrdbVDqHAlYZKJ82lmNgJ5hgXKZM
         QgPnYyaEv76c2eIVIjoYsb8UbUHsF+85K01LmfXY7vnrT1TXTbxCr9ianxN/Da00Dmcf
         SL2yoc4aNxBQhpKWjDZSpJAosQI+ee78EvxWZa1qmnJh57m7zH77y+eZ/cHTL83T2C1a
         rIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bReqO5jQsSZW0F1H8jewwqywC8kIWjwq+tdThkdVeG8=;
        b=nUhhjwMLkzGs6+VlshqaTTbDkCVRYPDnqp+SBsodIVZM1uDM8Tno7QmtCM2TP7f9y6
         bO0dhwzyQBIXXuj/nl5TdsZNqtuic0D0cNKFKsWjTYCerrNT++hKJCqqLtgdrDR56Z3M
         g2vt6K2cMAYHNqDS0ZMtkHz8CkvH4hASV6cqe7a3xhCnQELd7y0IBC7nd8XsLOeAFytq
         SvODGAIe/P0TxQ4stVenQubdcinqxEP4+r4qcxL9mU8ZdS9RbRe3T8LGUHnOjZt9xTLd
         1hK8mu5RqYP+7xDxfpKJm3Dp6vZDps5rNoNBWQdzY7pC4LoSieVjHM/bjbPFVeP+B4A2
         XvXg==
X-Gm-Message-State: APjAAAUOnXR2g3AiVcSQlvzXMyqClFbH3seaUQy0+Hm0PxDOdUo8a2cp
        NrtpwOAL0MSBzSjfruVa54BzSA==
X-Google-Smtp-Source: APXvYqwybLYOQpq3m9ZZk/ESBRLmFo1YB4gta01w60F59LdyqKZ9l3cDqUd7fLdFctGzmcEuIAr9ZQ==
X-Received: by 2002:a17:90a:2343:: with SMTP id f61mr5470666pje.130.1562857605136;
        Thu, 11 Jul 2019 08:06:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l124sm5866595pgl.54.2019.07.11.08.06.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:06:44 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:07:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 07/14] clk: qcom: hfpll: register as clock provider
Message-ID: <20190711150754.GH7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-8-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-8-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Make the output of the high frequency pll a clock provider.
> On the QCS404 this PLL controls cpu frequency scaling.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/hfpll.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index 87b7f46d27e0..0ffed0d41c50 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -53,6 +53,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	struct clk_hfpll *h;
>  	struct clk *pclk;
> +	int ret;
>  	struct clk_init_data init = {
>  		.parent_names = (const char *[]){ "xo" },
>  		.num_parents = 1,
> @@ -87,7 +88,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  	h->clkr.hw.init = &init;
>  	spin_lock_init(&h->lock);
>  
> -	return devm_clk_register_regmap(&pdev->dev, &h->clkr);
> +	ret = devm_clk_register_regmap(dev, &h->clkr);
> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +					   &h->clkr.hw);
>  }
>  
>  static struct platform_driver qcom_hfpll_driver = {
> -- 
> 2.21.0
> 
