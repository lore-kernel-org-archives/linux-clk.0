Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110F1C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 02:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiDMCyN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 22:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiDMCyM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 22:54:12 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042153884
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:51:53 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id k10so793232oia.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HVH7QAhZQB3tg5B5cSKsQRo5YTnVdUYXR/8k4eeHpb8=;
        b=BFfQqJtXcBpAOHK6q3+PfT6Vgeqp3P9SBAApVncmmxq1KFjC/2ONP+RWb9k1ntzk8z
         j5QbZd9rzEPOYSj/vGO/2mEs6QNGpzApmDra/GfX6ml3aOUwhpvqmszU3V3DbpysYqdD
         OxV28cSIOQuSw3SicfYHSKHU3dKatUQvKUvXHtnzqpVSVvIYRjWuoJm5hKvXLOSGyjvX
         1PXqInK1npNQMJxoY64XjEQij6wOJAsKUR+wv5svp/HQfMrWshOGymonGIhSEGMFQDSy
         5YzSDw3H+295t2EBWO9KWSZrzPMsrDtB9NhvQIlPE5ilpEAuoJqTw2a0WvyDm2kYYfcS
         ibkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HVH7QAhZQB3tg5B5cSKsQRo5YTnVdUYXR/8k4eeHpb8=;
        b=7pRAqxklhoctIEESwwbXtihLIU6cKCyeNg2eizMHFdp4mrRdxbq0LRqD2nwHbRwPuq
         B59M3gy+IXREpxy/JFRdS0lBHdzVghZsJudW1BGope1GkIxuCXbOOKlf0ehR4MPv+CTW
         2aHFE0/bIZp6sZMFemcq7AZu4UtMOhOvL9Mjvws2m/ssJt7P0pgEejONFckUsJTFXR55
         4rhbTNqyPmZD0mKq7FYrgvIkD0F3K0tGMrxR/JXbjsNUXGxW/oLFIRqdLzE5g5vs1Ry7
         23PqTLJtbYaWIq4/IW1cjNWifT/xn+Vo4mHNcgVr0m7NB9e53CkAzhucTttGciAY0c8A
         DDXA==
X-Gm-Message-State: AOAM530QC8PYxLXJekSrXcML5obMLhvi9CFo4XGF+HzI4NCus23tO+qT
        k93JTXJojx/ThOJB3k872s0t+A==
X-Google-Smtp-Source: ABdhPJwU80osdz4iRKvX1GLyQTFHMYsg1auB0Qa2q6sWvsEq+gM/08tDznpKsJBqB3dND5znwKo9XQ==
X-Received: by 2002:aca:df03:0:b0:2ef:895e:7373 with SMTP id w3-20020acadf03000000b002ef895e7373mr3136939oig.177.1649818312373;
        Tue, 12 Apr 2022 19:51:52 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id r81-20020acaf354000000b002ecf46e8016sm13083003oih.51.2022.04.12.19.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:51:51 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:51:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <YlY6xYvy+Zzo9Bmm@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114252.1636683-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114252.1636683-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
[..]
> +static struct pll_vco lucid_evo_vco[] = {

const

> +	{ 249600000, 2000000000, 0 },
> +};
> +
> +static struct pll_vco rivian_evo_vco[] = {

const

> +	{ 864000000, 1056000000, 0 },
> +};
> +
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3E,

Please use lowercase hex digits throughout the patch.

> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x32AA299C,
> +	.user_ctl_val = 0x00008400,
> +	.user_ctl_hi_val = 0x00000805,
> +};
> +
[..]
> +static struct platform_driver cam_cc_sm8450_driver = {
> +	.probe = cam_cc_sm8450_probe,
> +	.driver = {
> +		.name = "cam_cc-sm8450",
> +		.of_match_table = cam_cc_sm8450_match_table,
> +	},
> +};
> +
> +static int __init cam_cc_sm8450_init(void)
> +{
> +	return platform_driver_register(&cam_cc_sm8450_driver);
> +}
> +subsys_initcall(cam_cc_sm8450_init);

Camera isn't critical to boot the system, so I think you can replace
this with just module_platform_driver(cam_cc_sm8450_driver);

Rest looks good to me.

Thanks,
Bjorn

> +
> +static void __exit cam_cc_sm8450_exit(void)
> +{
> +	platform_driver_unregister(&cam_cc_sm8450_driver);
> +}
> +module_exit(cam_cc_sm8450_exit);
> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8450 Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0
> 
