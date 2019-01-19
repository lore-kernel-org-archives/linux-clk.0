Return-Path: <SRS0=Arik=P3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800CAC61CE8
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 12:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40FD62086D
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 12:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cELXwCwN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfASMkr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:40:47 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41990 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbfASMkr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Jan 2019 07:40:47 -0500
Received: by mail-qt1-f195.google.com with SMTP id d19so18223168qtq.9;
        Sat, 19 Jan 2019 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=8upAs74lN4X2yZCfFfhLRSwyeNJWC0TqR9FE7KoN6dQ=;
        b=cELXwCwNIzWuvvOn0SJNopZsybkJ8l5NbYcOAqNFRP7IK99A8Jfk7/hEBg1144ODf/
         fcpZfakL/q1FZuYk95bi5SituP+vWE/eeWnkDwoPlAjFIZbOJ925xqv/aM9g5P3gJha4
         EIQ3J1iONP5Xwysi7xbFt7WTy3jt1ZxvI+I8ivoSgiqVLrHJs8jQ3jmpDU2k5n5uWgnL
         XAwUYtHBvfFMnVxZiU7KmtZNJL/9eltZ32GpuP/kNr/NUbGVX2KjkODNb1huq2oJEFw+
         BCIbEFg0dM6gKcRdUOY7bMxVpqZwD6nYiy8NdupQSklXcs2d+VCCqeewCjneccnpal7G
         I66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=8upAs74lN4X2yZCfFfhLRSwyeNJWC0TqR9FE7KoN6dQ=;
        b=sqoYU4xZHFbhgbyasUoXbHXGPqiAOq+44Q1ml4QgWBsMn74arj4rSUuKIbuVXGULDr
         iy9O+k2SgmDrdDHewU85cmfe3yJ4VJ3nOfHjs8kbqfHKxHfm2S7VY+gaBWLyaz0Ests5
         OfU/GZQx5p4J5xSmpomgHUt6T15mDpKw4E7J7ZPQUXFM/QFjurWTSkZ5Rz1oSQfc1Iob
         aHmTBRBxgGRNn44Vat4mECPdbVgqUyLYejqDvKJNH8KeF8fDnw4Q2awppIWIgPbomXIs
         i8Z7A/J4h3Zng50zidPUfD7WLdVsTo+XynNUUTc8VHuWxyIcCCK7f0N+jeCl3QBtUibQ
         Hblw==
X-Gm-Message-State: AJcUukchOJA7cS1KcNFthvDqOKjcsychjppxMdCwWDrQXnIbbPctMjmI
        Bp7ISVYB4Mz3IU+1c5Szw+LiirtkrstYiWDvQqqAFzfS
X-Google-Smtp-Source: ALg8bN4/AsHjTyyFQ8DwVFbg24f472XrZ7uEfYJVPrqkmoDVNXU63Ox/9egb9qruwTpIA2C/k7AIbt3jTqcXXxGAxmk=
X-Received: by 2002:a0c:9deb:: with SMTP id p43mr19392886qvf.107.1547901645946;
 Sat, 19 Jan 2019 04:40:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
 <20190118131639.17578-1-k.konieczny@partner.samsung.com> <20190118131639.17578-5-k.konieczny@partner.samsung.com>
In-Reply-To: <20190118131639.17578-5-k.konieczny@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
From:   Chanwoo Choi <cwchoi00@gmail.com>
Date:   Sat, 19 Jan 2019 21:40:10 +0900
Message-ID: <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Kamil,

This version only adds following two clocks without that other clocks
be included in imem block.
- CLK_ACLK_SLIMSSS
- CLK_PCLK_SLIMSSS

Usually, the users only refer to
'include/dt-bindings/clock/exynos5433.h' in order to get the supported
clocks. It means that if there are different between the clock list in
'include/dt-bindings/clock/exynos5433.h' and the supported clock list
of drivers/clock/', it make the confusion for users. So,
'include/dt-bindings/clock/exynos5433.h' have to define the only
supported clock ids.

Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.

Best Regards,
Chanwoo Choi
Samsung Electronics

2019=EB=85=84 1=EC=9B=94 18=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 10:17, =
Kamil Konieczny
<k.konieczny@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Add DT bindings to describe imem clocks for SSS (Security SubSystem) and
> SlimSSS in Exynos5433.
>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5433.h | 55 ++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings=
/clock/exynos5433.h
> index 87bb2b017143..cc6153a0b5f7 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -1406,4 +1406,59 @@
>
>  #define CAM1_NR_CLK                                    113
>
> +/* CMU_IMEM */
> +#define CLK_ACLK_SSS                   1
> +#define CLK_ACLK_SLIMSSS               2
> +#define CLK_ACLK_RTIC                  3
> +#define CLK_ACLK_XIU_SSSX              4
> +#define CLK_ACLK_ASYNCAHBM_SSS_ATLAS   5
> +#define CLK_ACLK_ASYNCAXI_SSSX         6
> +#define CLK_ACLK_BTS_SSS_CCI           7
> +#define CLK_ACLK_BTS_SSS_DRAM          8
> +#define CLK_ACLK_BTS_SLIMSSS           9
> +#define CLK_ACLK_SMMU_SSS_CCI          10
> +#define CLK_ACLK_SMMU_SSS_DRAM         11
> +#define CLK_ACLK_SMMU_SLIMSSS          12
> +#define CLK_ACLK_SMMU_RTIC             13
> +#define CLK_ACLK_IMEMND_266            14
> +#define CLK_ACLK_ALB_IMEM              15
> +#define CLK_ACLK_XIU_IMEMX             16
> +#define CLK_ACLK_AXIUS_IMEMX           17
> +#define CLK_ACLK_ASYNCAXI_IMEMX                18
> +#define CLK_ACLK_ARBG_TX               19
> +#define CLK_ACLK_BTS_ARBG_TX           20
> +#define CLK_ACLK_SMMU_ARBG_TX          21
> +#define CLK_ACLK_GIC                   22
> +#define CLK_ACLK_INT_MEM               23
> +#define CLK_ACLK_XIU_PIMEMX            24
> +#define CLK_ACLK_AXI2APB_IMEM0P                25
> +#define CLK_ACLK_AXI2APB_IMEM1P                26
> +#define CLK_ACLK_ASYNCAXIS_MIF_PIMEMX  27
> +#define CLK_ACLK_AXIDS_PIMEMX_GIC      28
> +#define CLK_ACLK_AXIDS_PIMEMX_IMEM0P   29
> +#define CLK_ACLK_AXIDS_PIMEMX_IMEM1P   30
> +#define CLK_ACLK_SROMC                 31
> +#define CLK_ACLK_AXIDS_SROMC           32
> +#define CLK_ACLK_AXI2AHB_IMEMH         33
> +#define CLK_PCLK_SSS                   34
> +#define CLK_PCLK_SLIMSSS               35
> +#define CLK_PCLK_RTIC                  36
> +#define CLK_PCLK_SYSREG_IMEM           37
> +#define CLK_PCLK_PMU_IMEM              38
> +#define CLK_PCLK_ALB_IMEM              39
> +#define CLK_PCLK_BTS_SSS_CCI           40
> +#define CLK_PCLK_BTS_SSS_DRAM          41
> +#define CLK_PCLK_BTS_SLIMSSS           42
> +#define CLK_PCLK_SMMU_SSS_CCI          43
> +#define CLK_PCLK_SMMU_SSS_DRAM         44
> +#define CLK_PCLK_SMMU_SLIMSSS          45
> +#define CLK_PCLK_SMMU_RTIC             46
> +#define CLK_PCLK_ASYNCAPB_ARBG_TX      47
> +#define CLK_PCLK_BTS_ARBG_TX           48
> +#define CLK_PCLK_SMMU_ARBG_TX          49
> +#define CLK_PCLK_ASYNCAXI_IMEMX                50
> +#define CLK_PCLK_GPIO_IMEM             51
> +
> +#define IMEM_NR_CLK                    52
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
> --
> 2.20.0
>
