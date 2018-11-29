Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81932C04EB9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 23:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F99D2146D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 23:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CELcnGMT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F99D2146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbeK3KtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 05:49:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbeK3KtV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 05:49:21 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E21892145D;
        Thu, 29 Nov 2018 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543534926;
        bh=o73hjQIZPGyO2O1oulT/2vPE1udMDy4LKCfmyw4uNJI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=CELcnGMTGFyqyKmBNSMFKPc3A58rYcZu1STowAGNvmMdA39RK+PrzS+Nqy1ovJafu
         9fW/H6LxutSwP2lyou5I65ctA5vt6i85Myt1LPVm9c8YfZAT7nXSTx9edPAPTV72U2
         c+Ebx21GgFdRWLMCKuSZtRL0ntkIg7j4EaMFmGo4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181129155134.19141-4-k.konieczny@partner.samsung.com>
Cc:     linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
 <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
 <20181129155134.19141-4-k.konieczny@partner.samsung.com>
Message-ID: <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
Date:   Thu, 29 Nov 2018 15:42:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kamil Konieczny (2018-11-29 07:51:32)
> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.
> =

> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---

Fix the subject of this patch please. It's not arm64: or dts:

>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt=
 b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> index 50d5897c9849..4e4352bf5a0b 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are li=
sted below.
>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
>         };
>  =

> +       cmu_imem: clock-controller@11060000 {
> +               compatible =3D "samsung,exynos5433-cmu-imem";
> +               reg =3D <0x11060000 0x1000>;
> +               #clock-cells =3D <1>;
> +
> +               clock-names =3D "oscclk",

How about just osc? clk seems redundant.

> +                       "aclk_imem_sssx_266",
> +                       "aclk_imem_266",
> +                       "aclk_imem_200";

And what is 'aclk'? Also redundant?

> +               clocks =3D <&xxti>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +       };
> +
>         cmu_g2d: clock-controller@12460000 {
>                 compatible =3D "samsung,exynos5433-cmu-g2d";
>                 reg =3D <0x12460000 0x0b08>;
> -- =

> 2.19.1
>=20
