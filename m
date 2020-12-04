Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AA1C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Dec 2020 00:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8564B22224
	for <linux-clk@archiver.kernel.org>; Fri,  4 Dec 2020 00:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgLDAG7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 19:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgLDAG7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2020 19:06:59 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7C8C061A52
        for <linux-clk@vger.kernel.org>; Thu,  3 Dec 2020 16:06:18 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id k3so3567004otp.12
        for <linux-clk@vger.kernel.org>; Thu, 03 Dec 2020 16:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jVsiot8Y1A046lL18k/UOo07aqMmS1df6VhZY+TySxc=;
        b=xtyhAKYScBg0oa61H3UpkZ+gwuq/eRBTNYXRQ/raewLzXKt/Zr4XW1bJb5BUEBtogN
         DNXa+F1syfTPU4figu57df/xPjKJOSYsicMV8NW9HEm2mujdehIsi4N05/WFQPskNr8l
         x+ebglCl7vqW7GzfYmHmmNIg5Jv4cCxz9YonCpVHM601/ngTbo56DXBugETILuhWtBsd
         pLih91zGwtH+AVt0HIV9HyMaUDaSwkun80zdU1yZp4MvsYYw0otLYhun87ySxfax4g+P
         HdhwXZgWnbD6BGr7lblaKoS5+W+c9D6tnNUBQFOKpC/MDW7nSUBpIv44BSM/5mLLyJ+N
         PqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jVsiot8Y1A046lL18k/UOo07aqMmS1df6VhZY+TySxc=;
        b=dFWW8DZOVb+Qtj4qsCw92Z0MnzsSI/A9btyX3ljyj65FqZaI0ibrQKIK2aq17tW1DX
         vUN0g0qIO0Aa37uS8nWWxj/Z1Yeya9ODc2t27+753uhXYx2t0pqCx92DqlzD6vZRFW7O
         HuflgP/W/3JbNSetgz9SPF+Mvpkb5h28x5Y+nTQpLQIBHFEsgcayknB6Pkn/NjWRxZ0l
         +tSnKFpGzTFJ4rkuPqKaiznmf4cthSqyVdblVgs6OfykNhPizBRSdgwml1+3TvMTFDtk
         vOOis8jq18xm3YT2fJ2X87/dN34yWtlpFE9LUC4mTKm1EHb+wjrM3AT4KNetvZAgFCbh
         +pgw==
X-Gm-Message-State: AOAM530EPqY0BrysetfZK/UaiGWlg1E6kIvwO9vpiS8jD4KVu1sPf8LI
        WETVCfG8wmft3yztSGV2Mqaupw==
X-Google-Smtp-Source: ABdhPJwQWWSoAqrs9pA1uzrM5WPFnN8NTlNcTYAh8mVHw3DLvRWAqlV8o+StC4xBzLxbaDAWU7YKaQ==
X-Received: by 2002:a9d:410:: with SMTP id 16mr1448961otc.315.1607040376660;
        Thu, 03 Dec 2020 16:06:16 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m81sm241191oib.37.2020.12.03.16.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 16:06:15 -0800 (PST)
Date:   Thu, 3 Dec 2020 18:06:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH 5/5] clk: qcom: gcc: Add clock driver for SM8350
Message-ID: <X8l9dRfo7qdRTAMe@builder.lan>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203070241.2648874-6-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:
> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
[..]
> +static int gcc_sm8350_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&pdev->dev, "Failed to map gcc registers\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
> +	if (ret)
> +		return ret;
> +
> +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> +	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
> +
> +	/*
> +	 * Enable clocks required by the i2c-connected pm8008 regulators. Don't
> +	 * register them with the clock framework so that client requests are
> +	 * short-circuited before grabbing the enable/prepare locks. This
> +	 * prevents deadlocks between the clk/regulator frameworks.
> +	 *
> +	 *	gcc_qupv3_wrap_1_m_ahb_clk
> +	 *	gcc_qupv3_wrap_1_s_ahb_clk
> +	 *	gcc_qupv3_wrap1_s5_clk
> +	 */

Isn't this a workaround inherited from the downstream control of
regulators from within the clock core? Does this still apply upstream?

Regards,
Bjorn

> +	regmap_update_bits(regmap, 0x52008, BIT(20), BIT(20));
> +	regmap_update_bits(regmap, 0x52008, BIT(21), BIT(21));
> +	regmap_update_bits(regmap, 0x52008, BIT(27), BIT(27));
> +
> +	return qcom_cc_really_probe(pdev, &gcc_sm8350_desc, regmap);
> +}
> +
> +static struct platform_driver gcc_sm8350_driver = {
> +	.probe = gcc_sm8350_probe,
> +	.driver = {
> +		.name = "sm8350-gcc",
> +		.of_match_table = gcc_sm8350_match_table,
> +	},
> +};
> +
> +static int __init gcc_sm8350_init(void)
> +{
> +	return platform_driver_register(&gcc_sm8350_driver);
> +}
> +subsys_initcall(gcc_sm8350_init);
> +
> +static void __exit gcc_sm8350_exit(void)
> +{
> +	platform_driver_unregister(&gcc_sm8350_driver);
> +}
> +module_exit(gcc_sm8350_exit);
> +
> +MODULE_DESCRIPTION("QTI GCC SM8350 Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.2
> 
