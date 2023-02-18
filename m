Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E1EC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 18:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjBRSdj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Feb 2023 13:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjBRSdi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Feb 2023 13:33:38 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EA5CDF3
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 10:33:35 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id nb7-20020a17090b35c700b0023058bbd7b2so1160549pjb.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 10:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdSlOABUXDOnyk+meHLPkKnSRDvSQB5azUWlVg5K0Ws=;
        b=WR4G9LwTNYw3FsVROmx2f2szhqt+aMI/Fh0pXJqQjv95Cg9jGxtYHlWhp1CYy2rS3O
         S++5vWov8xo0SYE1crAyxDqHnolbaCMzpWTVH9JIE/b0jkC7U73XIsWrzedZp43x8kLu
         Y8Tho4N0wwsSRVAl3b+ejPhqzUDMYRAI7hVrDSHr8HGSIXQjH1m5/0iy3L5dWT1JcBqq
         ypQQpO0zdqMOc1YDmP6qjFphv8031UpYLwBQAry59Oms6Xn6SYF5VFbwx+lk/p+Ag93P
         W4Myo/pt8q8LFBMTIXGHgRIzCCi384i19yboiyWhCBJhg4LbCRTa7iK9v281/DfDX18A
         3Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdSlOABUXDOnyk+meHLPkKnSRDvSQB5azUWlVg5K0Ws=;
        b=2YprvzuwbA32AC6tH4t9RPARfFZ74XZMmlR4aa1MuRMve2CJGoKvDo/OPCTP1kClag
         GvyDUGZ8RIZANgIYMggCdVhh2EbKOS6/82oDS4+2yOr3FxkeqEJZShqHxgJH2vKS282n
         ybPXgkWY0r57f1LaunugDT+4qjZZ8JkjggVb2IigQrHJTvRpQ9FknSvXdJBiMFQMOjVM
         j5Et+WFHkXvZS1IbtUSllb1x8B7fn2Rb+9kKkd43txQsFATaiFzij95+3ssJmyR1Zw7e
         3IgGiG7zdgw92IodVucyHCsEnpGvovbNs4/xPgG9l04YTzruZGUG+TSoZ8ztRH+02ME9
         fGGg==
X-Gm-Message-State: AO0yUKW2RYH1h5/hY2UznAIb4PZciWxdefPIyStNbQCZW+72TDsBVR/t
        pLDG2U29NC0rtWq/5qH7uKqW7g==
X-Google-Smtp-Source: AK7set8mks9ATRjJPpov69mSHOUoLOQ6En2xElAg1qfskRkaUzRjvcvpky66JqrPGHFAvJ/KAvpztg==
X-Received: by 2002:a17:902:f544:b0:196:6577:5a96 with SMTP id h4-20020a170902f54400b0019665775a96mr470313plf.30.1676745215107;
        Sat, 18 Feb 2023 10:33:35 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b00199481ac72fsm4939269plr.225.2023.02.18.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 10:33:34 -0800 (PST)
Date:   Sat, 18 Feb 2023 10:33:34 -0800 (PST)
X-Google-Original-Date: Sat, 18 Feb 2023 10:32:53 PST (-0800)
Subject:     Re: [PATCH] dt-bindings: drop Sagar Kadam from SiFive binding maintainership
In-Reply-To: <20230217180035.39658-1-conor@kernel.org>
CC:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, mturquette@baylibre.com,
        sboyd@kernel.org, tglx@linutronix.de,
        Marc Zyngier <maz@kernel.org>, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        sagar.kadam@openfive.com, sagar.kadam@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Conor Dooley <conor@kernel.org>
Message-ID: <mhng-5af14e38-3a1b-480b-be9f-922acbcad914@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Feb 2023 10:00:36 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Sagar's email listed in maintainers is bouncing as his division was sold
> off by the company. I attempted to contact him some days ago on what the
> bounce email told me was his new contact information, but am yet to
> receive a response.
>
> Paul and Palmer are listed on each of the bindings, both of whom were
> alive & well as of Wednesday so the bindings remain maintained.
>
> CC: Sagar Kadam <sagar.kadam@openfive.com>
> CC: Sagar Kadam <sagar.kadam@sifive.com>
> Link: https://lore.kernel.org/all/785425ca-4000-a7e4-16d6-4d68c91b158d@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer/Paul, as mentioned Wednesday, here you go!

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> ---
>  Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml | 1 -
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 1 -
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml          | 1 -
>  Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml    | 3 +--
>  4 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> index c3be1b600007..c79e752283aa 100644
> --- a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive FU540 Power Reset Clock Interrupt Controller (PRCI)
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>
>  description:
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 99e01f4d0a69..63bc89e13480 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -45,7 +45,6 @@ description:
>    from S-mode. So add thead,c900-plic to distinguish them.
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@dabbelt.com>
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 605c1766dba8..bae993128981 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive PWM controller
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley <paul.walmsley@sifive.com>
>
>  description:
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index bf3f07421f7e..0551a0d1b3df 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -8,8 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive Composable Cache Controller
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
> -  - Paul Walmsley  <paul.walmsley@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
>
>  description:
>    The SiFive Composable Cache Controller is used to provide access to fast copies
