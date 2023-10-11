Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696A9C46CA1
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 21:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbjJKV4W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 17:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbjJKV4V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 17:56:21 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EC7B7
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 14:56:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c9c496c114so62985ad.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061379; x=1697666179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=OpZFEaUYEfgGhOBnIu2+My1gL1CE8z23QBVCFuCCTtMLHt2ToC4Joik3IsFsfHhLfM
         gOgBU0APmziLP6eSfDbf5BRi/ZufILzKl61KfyXZVRtp1HRiDHuUz/RFTnFOrh8MhC4J
         E50uMGtqZ6qrz2tNo8oDwM+x3iyawETKjdbTDreQkzbAJ9ygdA/8Llb7/G20/KKDmYCM
         5yGnLk/Be/iiQX8axZhke4YT7/GU04w01+h+4tuJ/i3v076CAQy9szf3h0yx/7/eLut5
         Pbu6Xy5VES/kM2X5KpPlGnedoIArgCGlHrfdLWw8/U7wDNGSQ3ZxeLli93J0BKbjOdg8
         wLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061379; x=1697666179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=nsgd0opq+KW76rGoZzigKKd/v1Ie4ZSTxEx9rEbez5xbm+fYzeAgeaSJ5HUFDddMxb
         vjUZ/H3/Ixy1wcL54kUrSjeKnavRkb5j1YewUOHzAWeGdN6dPiyHLisFdhD913Kh1vXK
         2ynJy+2kIooQalgUWtgWNA7HkScFrc4fgXmAAC7MJZu2U5ntBpj8Ygn9Z4xcOgmnZ5T7
         bi3oMyr+Ri8KgHL4WhFMXdjIWqgrmdGS2O4v8Vqf3bPrydObS4YX4bnBklSBZ/0u4KlJ
         g0ppixQ6U03gIbCm/0MzXHC3oxNcoPnleU6KDAdPvDH252hiytMMcO5RwettrCYoSaUb
         oYUA==
X-Gm-Message-State: AOJu0YxtMOT453kxOSGY8pYwmaRt1bvyd9vaH+0xAzxJnmkxm5+2N5bj
        UR+4yiyvhfaol8+N9lNT4/lOIA==
X-Google-Smtp-Source: AGHT+IH0cLMnt++OxXQaz5pgZY6kHmQMxAtk4c0SyB052nIznwOmmp2huLT7DDHY0oMZldy8+AbXOQ==
X-Received: by 2002:a17:903:18b:b0:1c6:ec8:4c82 with SMTP id z11-20020a170903018b00b001c60ec84c82mr303280plg.23.1697061378736;
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id bt12-20020a17090af00c00b0026b12768e46sm383180pjb.42.2023.10.11.14.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:56:14 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
Message-ID: <ZScZ_sllcdyS7tCi@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-20-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Add the Google Tensor SoC to the arm64 defconfig
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
>  CONFIG_ARCH_BRCMSTB=y
>  CONFIG_ARCH_BERLIN=y
>  CONFIG_ARCH_EXYNOS=y
> +CONFIG_ARCH_GOOGLE_TENSOR=y
>  CONFIG_ARCH_SPARX5=y
>  CONFIG_ARCH_K3=y
>  CONFIG_ARCH_LG1K=y
> -- 
> 2.42.0.655.g421f12c284-goog
> 
