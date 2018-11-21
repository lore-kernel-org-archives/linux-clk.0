Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE98EC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 13:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1E60214DA
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 13:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKRDfKqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E60214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbeKUXrl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 18:47:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730870AbeKUXrl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 18:47:41 -0500
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A815214F1;
        Wed, 21 Nov 2018 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542806001;
        bh=DgEK8STNvrN9S1qxPA0Kwp24Pq7GfaNxn8xYiyMPXAE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oKRDfKqVE3rQmZdzyHT1T96+rxZMQmIGpG3XoWWn6iUqJ1EFVo7D6I7KgxFzeShJU
         j7cFFC3UWKaJwPeBuuMkqoxHDZtKFcfD1BJsdpoPzmnz9g/lEYqs5ioRrMOmYG98BK
         mYg+IrgLolqtOxbro809YYQOHKIHgm/eo1mHgbh0=
Received: by mail-lf1-f41.google.com with SMTP id i26so3953816lfc.0;
        Wed, 21 Nov 2018 05:13:20 -0800 (PST)
X-Gm-Message-State: AGRZ1gLPRUfuTr0HwQ2gRVUDLpQLmZeMJ8fm59iLOSadv8TIw7yH7/rX
        X5Kg32116EVkWIgrJFuAQeHRhPd0i218Afujttg=
X-Google-Smtp-Source: AJdET5e0Wz5PKCHHHS/3q38x2/ESazRYmDIwy9GiVb5bPDfix0q/FGsaT0ogk5hGWT94zfoTC9FBrrH7g7Qq+lK4h8w=
X-Received: by 2002:a19:c396:: with SMTP id t144mr3645119lff.110.1542805998717;
 Wed, 21 Nov 2018 05:13:18 -0800 (PST)
MIME-Version: 1.0
References: <CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
 <20181121120509.18892-1-k.konieczny@partner.samsung.com> <20181121120509.18892-2-k.konieczny@partner.samsung.com>
In-Reply-To: <20181121120509.18892-2-k.konieczny@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 21 Nov 2018 14:13:06 +0100
X-Gmail-Original-Message-ID: <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Message-ID: <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
To:     k.konieczny@partner.samsung.com
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, kgene@kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Nov 2018 at 13:05, Kamil Konieczny
<k.konieczny@partner.samsung.com> wrote:
>
> Fix typo in imem sssx name and typo 200 switched with 266.

These should be two separate patches. Then the one changing parent
could go to stable.

Best regards,
Krzysztof

>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
>  include/dt-bindings/clock/exynos5433.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 751e2c4fb65b..24c3360db65b 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>         /* ENABLE_ACLK_TOP */
>         GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
>                         ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
> -       GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
> +       GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
>                         "div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
>                         29, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
> @@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>         GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
>                         ENABLE_ACLK_TOP, 25,
>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
> +       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
>                         ENABLE_ACLK_TOP, 24,
>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
> +       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
>                         ENABLE_ACLK_TOP, 23,
>                         CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
> index 98bd85ce1e45..87bb2b017143 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -156,7 +156,7 @@
>  #define CLK_ACLK_G2D_266               220
>  #define CLK_ACLK_G2D_400               221
>  #define CLK_ACLK_G3D_400               222
> -#define CLK_ACLK_IMEM_SSX_266          223
> +#define CLK_ACLK_IMEM_SSSX_266         223
>  #define CLK_ACLK_BUS0_400              224
>  #define CLK_ACLK_BUS1_400              225
>  #define CLK_ACLK_IMEM_200              226
> --
> 2.19.1
>
