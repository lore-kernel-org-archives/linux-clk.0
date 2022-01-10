Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B335C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 09:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243228AbiAJJvL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 04:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243278AbiAJJvE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 04:51:04 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4143AC061748
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 01:51:04 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a5so21661340wrh.5
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XjI+RU6al+oJtSFSee741SP13qfOGtttOWkUcj1LQbs=;
        b=NJNPlDAKDl2C2HGO2BkBNbWyUWBNgBf4Oexcyn7jonBhZWZkxiVpbc9Y/lmcqGfeDu
         j6VC91aakYpMEYfH6wrbmBRAT+0i2jyghqDxaF+dAe2mbq5P2dlZrPD7jIJ7nx8kNGdj
         /fZJrxOXgDir2hBvS70ZyJ+z8SOQm2e5hvG2Zxusl+pptxOn+7a4oAPyunZml4It7xN2
         zmOgEIUPU/RrzsJXwGvx22joHp/70vWUmycVInyKYhqXnbiTlXWhIEaD0LS4j6U0Cw5x
         XWARprNFPcmfqfg7mti+cG0SJ+J3J2nqtHI8R4HTKdSjqY3sdRY+WQK8/aQ9HiooUlWv
         4HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XjI+RU6al+oJtSFSee741SP13qfOGtttOWkUcj1LQbs=;
        b=QnoLnRMgWeevj/Bw9hpDHLlA+1TqlGpeJW+2GyqepJsgeZqdwYEwBySMDWmJPb7sPA
         npzvSD3EMVzE3tZFluztwUnZhvjJHLoM23Hazj13Wz0Dwvef4fa7nP58VD4qxG4wUJu8
         7nnXdTsmyGv1dfeWn2kIwYIo0X7y5ZQivCHWS4aIpSRaWtLE5Y3pqIPdnJ0eRiNsVV/9
         mLB6R5VM1IEhwxVYDItyM3FiwVEoSEFSta3XhRXu9k4tg5F5WrEJlQWZFExj+vgwotqP
         4uf0j47Lo+x5OTlq9eL+y/aF0RMCXbnZx84Iu+edSgJnst6nNencKbqBdYPXABL4lhFB
         fJqQ==
X-Gm-Message-State: AOAM531GK2HGanF+g9QUEBAWwB6Inr8f4rqaYNkugKJTPdVV30YDbQai
        kub1JIVqPussAJkwO4j8OG2cZg==
X-Google-Smtp-Source: ABdhPJy64z5uatD6yk6wqa3/5nkEpQ5brCeZ12/zFKyWtXxSGP2vBqwJk7aMZd00MBcF6osrGLJ8kg==
X-Received: by 2002:a05:6000:c8:: with SMTP id q8mr2089490wrx.611.1641808262884;
        Mon, 10 Jan 2022 01:51:02 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id k33sm6296470wms.21.2022.01.10.01.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:51:02 -0800 (PST)
Date:   Mon, 10 Jan 2022 09:51:07 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4] clk: sifive: Fix W=1 kernel build warning
Message-ID: <YdwBi7uwH4NHi0GD@google.com>
References: <20220110065536.11451-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110065536.11451-1-zong.li@sifive.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 10 Jan 2022, Zong Li wrote:

> This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> Declare static const variable 'prci_clk_fu540' where it's used").
> For fixing W=1 kernel build warning(s) about ‘prci_clk_fu540’ defined
> but not used [-Wunused-const-variable=], the problem is that the C file
> of fu540 and fu740 doesn't use these variables, but they include the
> header files. We could refine the code by moving the definition of these
> variables into fu540 and fu740 implementation respectively instead of
> common core code, then we could still separate the SoCs-dependent data
> in their own implementation.
> 
> Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static const variable 'prci_clk_fu540' where it's used")

Okay, that's good.

My other comments still apply here though.

> Signed-off-by: Zong Li <zong.li@sifive.com>
> 
> ---
> Changed in v4:
>  - Rebase on v5.16
>  - Modify fixes tag
> 
> Changed in v3:
>  - Rebase on v5.16-rc8
>  - Add fixes tag
> 
> Changed in v2:
>  - Move definition of variable to C file from header
> ---
>  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu540-prci.h  |  6 +-----
>  drivers/clk/sifive/fu740-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu740-prci.h  | 11 +----------
>  drivers/clk/sifive/sifive-prci.c |  5 -----
>  5 files changed, 12 insertions(+), 22 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
