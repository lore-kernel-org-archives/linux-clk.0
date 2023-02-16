Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97B2C636D6
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjBPKmC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjBPKmB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:42:01 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4055456A
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:41:33 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id bw10so1200558pfb.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0rrWxTzpbtETHK3Hkgr5LIb/67SKcxDrfYtkzpOwuc=;
        b=nQJeJ22JV2n/fpi1/NUDAJ2rXMOFYks9S8hpTREWDX4VJP9vXEodroOmDf17ahZSIX
         8ycgpDQUWbk7SIvITav6Vz5QoOaP5AAOfk3D1T5Vdg3FVtZ2aWAaMi0zFAaNsoAexQZ/
         QED9EJswXgIK39BriNgjiqovDwP15cTsKST/dx0MiQ8scDlg64hkvoX616M3u1CgqkNP
         J9dHBW7TvGfproY8ZzOXgqCa0/QsR8F9vtZYxN7dJMe71l7WAYrswL+UULc4/crOkIZM
         XVHq/yrwHCwfRlNgF+pwWqT6jWW0dPTstybVJk5V+l9zJb+jfSfwU4PK78jpe85OsuAa
         3F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0rrWxTzpbtETHK3Hkgr5LIb/67SKcxDrfYtkzpOwuc=;
        b=Uhy+Vn1jNnj/Sg1vb7OxPNw+YGCbvPsr48E4KcZHfnkggARytqz6D32kzBcvLjcDKR
         cT0MbCQTw17Fy317Z5hmlS1gnr6nrlpeF0FtUjtb4GRBuX2VwUIpLekOYT+S5tPGFFlf
         Bq6l74UTVfNbcZ9kpavtl2Q07oKQsRRv8IvCKXRBnD1AnxgTFkvkNaRuQhOi4/iCwEts
         Z1X3G+EXDi2FtQkDnADw2M99rZZWy8XG0nrfZDJjNTfdtgZ1lk6oVRe9QywuUNOwg295
         SgLFW62Ra8GSjpCozJhWAxhYZbQ1J80FtgSEiYOWKvw3+TQM3GFn9q5K+0a0KF3aEuOD
         oCHQ==
X-Gm-Message-State: AO0yUKUQb7ZDRyH7D+mc1uy1mzprU77Ss8KK/iOLx+vUuYqotL+hlHzk
        6YMmARNmMDanFhvewccaa9FLZu1ag5n0j8SlKrDsdw==
X-Google-Smtp-Source: AK7set/+bmK0NZ4RTQRaKp9brGd56H3O3Zv/QM5e9bIHL1lfW2h78IQbaZJvseuYS0KgrhmwF/dZL2hMhTds6c8huFw=
X-Received: by 2002:a63:b955:0:b0:4fb:9719:318a with SMTP id
 v21-20020a63b955000000b004fb9719318amr712399pgo.74.1676544091107; Thu, 16 Feb
 2023 02:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20230214162325.312057-1-robert.marko@sartura.hr> <dcdd0a62-8d1f-d9b1-6137-34d9e68313a1@linaro.org>
In-Reply-To: <dcdd0a62-8d1f-d9b1-6137-34d9e68313a1@linaro.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 16 Feb 2023 11:41:20 +0100
Message-ID: <CA+HBbNHmDeBBBc31OayTjegi4KrAgqOiRLQscorENjqg3dEa3Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clock: split qcom,gcc-ipq4019 to
 separate file
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 16, 2023 at 11:16 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/02/2023 17:23, Robert Marko wrote:
> > Move schema for the GCC on IPQ4019 platform to a separate file to be able
> > to allow passing XO and sleep clks directly to GCC.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/clock/qcom,gcc-ipq4019.yaml      | 53 +++++++++++++++++++
> >  .../bindings/clock/qcom,gcc-other.yaml        |  2 -
> >  2 files changed, 53 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> > new file mode 100644
> > index 0000000000000..6ebaef2288fa3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,gcc-ipq4019.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Global Clock & Reset Controller on IPQ4019
> > +
> > +maintainers:
> > +  - Stephen Boyd <sboyd@kernel.org>
> > +  - Taniya Das <tdas@codeaurora.org>
> > +  - Robert Marko <robert.markoo@sartura.hr>
> > +
> > +description: |
> > +  Qualcomm global clock control module provides the clocks, resets and power
> > +  domains on IPQ4019.
> > +
> > +  See also:: include/dt-bindings/clock/qcom,gcc-ipq4019.h
> > +
> > +allOf:
> > +  - $ref: qcom,gcc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,gcc-ipq4019
> > +
> > +  clocks:
> > +    items:
> > +      - description: board XO clock
> > +      - description: sleep clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xo
> > +      - const: sleep_clk
> > +
> > +required:
> > +  - compatible
>
> Aren't the clocks now required? Will it keep working without them?

There are not required, this just allows passing them but the driver is
still using global matching until in patch 2 XO and sleep clocks are converted
to use parent data and in patch 3 they are passed via phandles to GCC,
however, even then global matching by name is preserved in the driver
as a fallback
to keep backward compatibility.

However, I see your point, after parent data conversion they should be
required by
schema as that is preferred over global matching.

I will wait for some time for feedback on other patches and then send
v2 that includes
that change.

Regards,
Robert
>
> Best regards,
> Krzysztof
>


-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
