Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E8EC61D97
	for <linux-clk@archiver.kernel.org>; Sun, 29 Jan 2023 17:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbjA2Rmh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Jan 2023 12:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbjA2Rmg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Jan 2023 12:42:36 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03911EFD9
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:42:30 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m15so6600689wms.4
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=34Hkkbw634RC9Fbld7Eci9GLP2rbD+JaNfekHKUfXNo=;
        b=Dr1Q4ox+yEMCIIgQ6ygG+UKmdT2M6H8Da1GMcciWz/NuJ7KtwC3lYk8GEESwiQAiwB
         uFkaMt5WGrLzn4GlBD6OQRhy02mKdmH0IimIjGsWnxBvYSEPHdxt9Y0DpGaAN3nUIIAQ
         g9coapWPSNH2UgdEPLy7fXtwa2lovpiwbvWyRcasOXE4UohIQZTWYfsM4ZFV3mCyRbU5
         AvF8Rh9u+uA1O+2Mn0p6yHvzl+wFdNDK+xva6lhDXh/kM6ZfuasYa0St9j8EfsVUTiQR
         UK5Ii2gJSDD+apOAlvfdAw+OUcKntBCvUvF+pwjGPpbult9uHRKXW+0I1u0KLUM8kE1v
         Z/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34Hkkbw634RC9Fbld7Eci9GLP2rbD+JaNfekHKUfXNo=;
        b=aVAC8zKLIhh0ZZ1pa9c5RjzWFG67tPtNrVzopC5t7aMMCweKUn1Jl9QUZ1pCwdTVGZ
         iy00CH8ay36iTDkf9M9YEZFsYub5XyLhRrsf6RSoUBJk15kFs1I6JxYNQ2Ezdv3p1T75
         3nBouDOpBR2ZNEnkOKS0YNKgesdshNzkOrRgc7BwODELE7ipbtADJGbaWaJ+WhYxMbIr
         cbkKrvBlktmNfrjFH8L62Zs5kKoHgK2HJEsdD0mrVrVQ6eb4wCuM3x+L3BuR8vG58VAB
         1quqMPI08PELKXewTYX7FS44cW3mWcydxktkN8j51V7q0lf8RJbTEVbXAYDFLNFRMIX8
         M9hw==
X-Gm-Message-State: AO0yUKWzA+xlnnzBFDwSDJVwJVn4wJtX3ILwD5oH9QmfK17ls23ufkdZ
        T3M13IaPFCUpFAdp4SZldj2Yfg==
X-Google-Smtp-Source: AK7set/mvmGmVMpNZl6PzqdJ7LQUH9WapUEZ7DRqpjONCtidqEpb6FtGnwBdTrMaCUdhyh08//kGKg==
X-Received: by 2002:a7b:c8c7:0:b0:3dc:5a7c:f8ad with SMTP id f7-20020a7bc8c7000000b003dc5a7cf8admr285059wml.21.1675014149566;
        Sun, 29 Jan 2023 09:42:29 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm15922293wml.9.2023.01.29.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:42:29 -0800 (PST)
Date:   Sun, 29 Jan 2023 19:42:27 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1 0/2] ARM: arm64: dts/clk: imx: indentation
 permission whitespace cleanup 2
Message-ID: <Y9awA42VPpC9Ne8o@linaro.org>
References: <20230119085421.102804-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119085421.102804-1-marcel@ziswiler.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-19 09:54:19, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> 
> While further synchronising them imx device trees with U-Boot I stumbled
> over more checkpatch warnings. This series addresses those trivial
> indentation, file permission and/or whitespace cleanups.

Nitpick: The subject line should not contain "ARM: arm64:" prefix, as it makes it
confusing for maintainers through which tree the patches should be
applied.

> 
> 
> Marcel Ziswiler (2):
>   clk: imx6sll: add proper spdx license identifier
>   dt-bindings: imx8ulp: clock: no spaces before tabs
> 
>  include/dt-bindings/clock/imx6sll-clock.h | 2 +-
>  include/dt-bindings/clock/imx8ulp-clock.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.36.1
> 
