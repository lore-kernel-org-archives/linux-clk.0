Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4296C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 05:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96B3B2389B
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 05:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhAUFs6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 00:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbhAUFsT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 00:48:19 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76477C0613D3
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 21:47:35 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 63so594389oty.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 21:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=So7n4CXW5rfKosTBs+wAYGz48ULvBM4ktYJXBciZ7Dc=;
        b=glVhYP4Hu5qOk9XNH1PetEtPf065rkp8x4wHsjwwkBo4jfTlVvwx0U706YM9o7PlR5
         jBrl2ZnGv2+mtCQkUqkUbXZF4jOYpgKTK2w7nMqOyAM8r6+C9uGiL6L7PejsYpWlskc2
         q7bRCXo5M6tg2AdAtkq3kPcJJlp5mg9D018HK5w39x3c5b2FQ+XvbzDfx2nhkaQKN8II
         9q5JFrFOlXnCOUl+EcPlaDaq8s3YIFMhhugXN/b6aDSNjT53LFqi2QKTJk0CSWfd6Sp+
         9bv7f5wxXfKVh3XEBLOxQskKVuqy6fLBVHSHXIblh64umV+rQT8/x5vdGUxi1rlE07DA
         +XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=So7n4CXW5rfKosTBs+wAYGz48ULvBM4ktYJXBciZ7Dc=;
        b=YlyF5dSjL9BWAUEBcoNJsvPAJoavEDvRth3ESFj5VtxO2NsZjGK19gg+v+2ZuSee5L
         /kmPX0BjVItjbeHs99CgSQEA5fdc/zdZMxHsuWVXh3lmgYEN8uonhD+cXeUzDrUZ11vQ
         Z4I3oyR8IayfaKj8WGBzuI7bouf8uyjN5V9ys4etcVrl8d13RKs/+7n6dflOMNAM2GXo
         eelRWE5qHpuudzGcNZbIdWVOIN6DC1iQTiMi1+5PBG8/amH5x0SN9F9uNaSBqQGrRedn
         y3rtiIFsvTix+PHW8Fq1jMr7o1sD0k+jl6Od7s2jXnWJ94AlOSFaVIrCGMlSz66CQv4h
         tyOg==
X-Gm-Message-State: AOAM531LCcFuW/DL0HPMafen4mEtEB/r6A1Umol6eeRYq6XMJt4PoZ+v
        jHbWANqRWBas3q8iPIHCjkqPDg==
X-Google-Smtp-Source: ABdhPJysvLoMeu7qgenoO6uU13klsr+b3S9kAO++BSTs7ZLhpyiB2MkpLh7oktSJj0YYNOZnAM70Iw==
X-Received: by 2002:a9d:611b:: with SMTP id i27mr4298758otj.352.1611208054744;
        Wed, 20 Jan 2021 21:47:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 67sm79061ott.64.2021.01.20.21.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 21:47:33 -0800 (PST)
Date:   Wed, 20 Jan 2021 23:47:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SC8180x
Message-ID: <YAkVdOmy0MTeRQhz@builder.lan>
References: <20210120223556.1610214-1-bjorn.andersson@linaro.org>
 <20210120223556.1610214-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120223556.1610214-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 20 Jan 16:35 CST 2021, Bjorn Andersson wrote:
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
[..]
> +static struct gdsc emac_gdsc = {
> +	.gdscr = 0x106004,

Seems like I missed squashing the fixup where I subtract the gcc base
address after migrating these from the downstream dts.

As written the platform doesn't boot.

Please let me know if there's any other feedback before I respin v2.

Regards,
Bjorn

> +	.pd = {
> +		.name = "emac_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
