Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340EAC433E6
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0EB6239A1
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbhAHLPg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jan 2021 06:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbhAHLPg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jan 2021 06:15:36 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D94C0612F8
        for <linux-clk@vger.kernel.org>; Fri,  8 Jan 2021 03:14:55 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id z12so3475741pjn.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Jan 2021 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iDPzHwkjsTkAD1Mw6MWGrS58dCqLiAXWEIlIfgXIsz0=;
        b=H+cAe7WRpd5OceyKAkBLVVK3lWt0NmaFOfNVrKpUD7w5kNqrFpsAuPUP8axFspVRkH
         tv/CQ38zUF3CLl4A516dqH9ZcVZtY0PO+vlU2OGdJzBG4Jytg2PK1Jc5PIVfvPIkaJ+F
         qL0aGActIFb7ShvkBEWopm+Szp+xFBspbKiUneyrwdUZBoFsZQTYdvjaPh3bfahAJzJ2
         2HpFYKteLXXN1jDKmSipRWkNPeq8l1C/cjiRPMPTR29GWAa7ZNzqCN4gywlDApcyz9DC
         CDw12P6gRhNgJEi8MCxHwnr/M3ozKycT3lqKvulsLsCUwsJi84nD/YHIypmarMV8OgXY
         RQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iDPzHwkjsTkAD1Mw6MWGrS58dCqLiAXWEIlIfgXIsz0=;
        b=A9H0VvggIaEMubwSdOb2axmGMRy+c4Q5VkKOxkKIH/ugzQa2PenuD2bNChDvEl7cGd
         vdh7mpIwMNulD4ARtcGhQYEAUiPS/BD3xKu9bVhlkViX92a+jMXEw+AlfbB8uQnj0Jc1
         jKtXUZd7pIGHsBhNd1bQTkkQpisCup4Tk0hbCWHR0G9pDahx9KuKiEJsOzAga0jbVLy3
         b/qke8bKbemrJKiFTXRjs4mYiqreO9Z0ZOUu2SiuFayLaqQIvPjxqQGpTKmJY0y0C4jk
         Z/9rIFFnNx0qF0v6M3WU4uxpw1E9RbM1hXw2/tlpqoYID29PbQCN1cDPGxV90GepBL1k
         6tRA==
X-Gm-Message-State: AOAM530HvbX8YBKyA7m6i6aoxTs4/F/jQJfMUnOkXkDCORNo+ycHn3Gz
        QIY/ORLkpG6r5hOWGLxAROwi
X-Google-Smtp-Source: ABdhPJykxqlj1kTzfUydKgsPfFlM4j0Zz+C4wHy/9kI8sjN1024WhAXsPIlo7pUMSzjC0B6pabFphw==
X-Received: by 2002:a17:902:7596:b029:da:b7a3:cdd0 with SMTP id j22-20020a1709027596b02900dab7a3cdd0mr3353005pll.14.1610104495148;
        Fri, 08 Jan 2021 03:14:55 -0800 (PST)
Received: from thinkpad ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id p22sm9635613pgk.21.2021.01.08.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:14:54 -0800 (PST)
Date:   Fri, 8 Jan 2021 16:44:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, viresh.kumar@linaro.org,
        ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: Add A7 PLL support
Message-ID: <20210108111448.GA74017@thinkpad>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
 <20210104081125.147300-5-manivannan.sadhasivam@linaro.org>
 <a880d96f-d879-52d0-48ff-cbcdb88a3f29@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a880d96f-d879-52d0-48ff-cbcdb88a3f29@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 04, 2021 at 04:30:11PM +0100, Konrad Dybcio wrote:
> Hi,
> 
> could you explicitly state in the probe function (or just in the driver in general, as there's not much more?) and the config structs that the target SoC is X55?
> 

The compatible says it...

> A few more SoCs (MDM9607, MSM8x26 and some others) also use what's known as "A7PLL" downstream, but all of them have a separate configuration for their specific PLLs, which aren't compatible with each other.
> 

Yes, but that difference can be factored using the SoC specific compatibles in
future. The idea here is to have a generic A7 PLL driver much like A53 one and
use SoC specific PLL settings.

Thanks,
Mani

> 
> Konrad
> 
