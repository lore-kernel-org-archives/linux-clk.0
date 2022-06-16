Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820FDC43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 05:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350136AbiFPFwp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 01:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFPFwo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 01:52:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E52BE01;
        Wed, 15 Jun 2022 22:52:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D08A3B82168;
        Thu, 16 Jun 2022 05:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7779BC34114;
        Thu, 16 Jun 2022 05:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655358759;
        bh=bskXTTjyKgejJA17Oke/RhOOSiiK/upZrY71XXGLk9A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OiwglHYxHE+c3rW1vx0jo6DkqGW85cPKI//Z8fjjNQxnaOfiCh+ARwfBY/CTN1Mtz
         k6JlgUbIiK9T3TqPDOhtWLtmg8qyga2WkXkdQuEgEuqgh9A+eEOfWNk07yZsAZ8NSq
         cH8zFvBKXoML1w6YJM/oOKlOWd7fuJWWwd13tf4wF2/lfqvmlz1h5QEq2sjQqvNL0o
         SlyCbW1CyNBbtUT1mGCPuHkVyt3z/Ar3P0rbx+KoRAF/Mo28BxIPe0T4WdMzqeA8jx
         JUYJY/XjV/evXEJ0VjSctobj5oKj5cGF1NBDM4QMmcjX4PQRkQrXFLB2286drZqMcY
         Qt6asjyc3kZ9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220603080019.2251764-2-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080019.2251764-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 15 Jun 2022 22:52:36 -0700
User-Agent: alot/0.10
Message-Id: <20220616055239.7779BC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-03 01:00:18)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> new file mode 100644
> index 000000000000..49a2781df60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
[...]
> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    clock-controller@ade0000 {
> +      compatible =3D "qcom,sm8450-camcc";
> +      reg =3D <0 0xade0000 0 0x20000>;

Looks like reg property should just be <0xade0000 0x20000> to pass dt
checks.

> +      clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
