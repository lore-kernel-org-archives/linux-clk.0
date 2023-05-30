Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B5BC7EE23
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 12:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjE3M65 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 08:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjE3M64 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 08:58:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4191AE53
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 05:58:29 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51458187be1so7824516a12.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685451502; x=1688043502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tZ/CWWRhzFv4AUx7PeAsUKQAthRRG7iX6LhluPhso8=;
        b=fhMSzU0zIG+zrgA5AooIEwuldRbNN5bU/BcQz0bDjs49+J1JE8Ypo6iEi3Tk4DYoBp
         Kt8RU4R/R3FR+WUMj4eTbdWQfQzBLavDDpeM0H2Foqv4aroWYAsDKW5SXNxOG3zebzFE
         KcaVP05qsOp06RqqwPn79WiZmzIh0/isE2gKWsguNkqmEQd2wG2tDW7czRUT+tsLZR3H
         0P4sXxLcAsk5iSqc4N4HMH/S7X/mwzyCsZy8qwdXsKjrAzuZ0An3TZ9Q3anQRI2VlaYe
         U5F9yJDj3guqKIonPAVCbtPJgd13pxg+b5a89bfRl3qoZrMykehI8PCGQxtosmeOD7xk
         bbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451502; x=1688043502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tZ/CWWRhzFv4AUx7PeAsUKQAthRRG7iX6LhluPhso8=;
        b=aziZ+6wamC42mDbrQ6Xn5KzzlvmM58VpCzPBc8hDDUOjuEpbq+QRcsKYGuZwmMuExD
         MAv/v60I1JEYE9gni0mKWMEkWE2JZswW5tJ5Nl840QmtpOed7lPm+ymbxU0Q9/ASwJwR
         U/WQHPUZX+CJzyGGLCU0+LF4502JmRWT0wTFojMM7Q+5XvEncZe1Doa4L/EcKD1hDOnU
         zPISDG88kC9rtKQNSPYKI9ZTTTG7+MzkI71JC9k5o61hGNbrk4tlfU1WHtEUSnpQQR7L
         NwV03B4Ojr68yybGNLVoJ25rT1nUwX5qRYzX8eK62k9XQxpPBocvVuEgKoOjcWfoEFCp
         94AQ==
X-Gm-Message-State: AC+VfDyyFiWNDKMsxl9aR2Bg2Q9FtF77Ed3QMLyJggEN9sNjHrM+irCq
        xHfwyrOPN9B4WmN0iFPW4JYG5Q==
X-Google-Smtp-Source: ACHHUZ6tHhgbxxkwo5nLr9tb12tOL8m2CoGZFRqhgO6IbbrCp+3ZktaR4Oz2McNAxdmztZnG3KJ8CA==
X-Received: by 2002:a17:907:60cd:b0:974:216f:dc36 with SMTP id hv13-20020a17090760cd00b00974216fdc36mr1963849ejc.17.1685451501958;
        Tue, 30 May 2023 05:58:21 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id rv3-20020a17090710c300b0096f7b7b6f11sm7280614ejb.106.2023.05.30.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:58:21 -0700 (PDT)
Date:   Tue, 30 May 2023 14:58:18 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,msm8996-cbf: Add
 compatible for MSM8996 Pro
Message-ID: <20230530125818.yvzdycqt46n4dzo5@krzk-bin>
References: <20230527093934.101335-1-y.oudjana@protonmail.com>
 <20230527093934.101335-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230527093934.101335-2-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 27 May 2023 12:39:32 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The CBF clock on MSM8996 Pro has a different divisor compared to MSM8996
> and is therefore not fully compatible with it. Add a new compatible string
> to differentiate between them.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1786737


clock-controller@9a11000: '#interconnect-cells' is a required property
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8996-mtp.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb
