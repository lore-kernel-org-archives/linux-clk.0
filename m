Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8FEC54EAA
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 10:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjA0K5d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 05:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA0K5c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 05:57:32 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8C5A244
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 02:57:29 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m11so4286145pji.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 02:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0aTkPI+ubuKbzX2JNdC/dWfilw1TCJxuUE5W+uV+LEs=;
        b=NmJUlnhgEI4JeSVj0TYtQdVtMz6iwCd816KUbIUK6n58sX6rOUMJNIZ/B/VfNCPHWj
         PcxjhADWi3Ygbjwx3GY8ANbKNK3vk674UfY/vw6JIMF4luoDAzl7IR4Rplx2Z3Yg81AS
         yeXTUhKbqVvuQr4vECpR0xNTMr9/1NVs/umGPV7IsgwaEUbrwcE2wbB9fEKTvRB1DXaZ
         HMFhwB0sL3n6WJR7tdLP4DsCDbPgBt7wE8bHawjfl5Tb1oYzw6L9ks5FM4CqjKRgAFTu
         H0ZXjcwvAG6B9TL3HlcU65eMOd6QQxjTd1bci3cUeJhn1lyCUoqrnZMAeerOglBKaJ4F
         5XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aTkPI+ubuKbzX2JNdC/dWfilw1TCJxuUE5W+uV+LEs=;
        b=4whdAswVTuEK9zk/1jI9tWB8ZCeJPfzioROrPFQpUMbautuK8nA9t1dUUpl7Q8+7kl
         W8VG9CAphqVAHYy+4vkBqC8Bkg2cASba0RXmiu291q/PKJeACDI4JrLFB+PqKJRSTNBC
         jHLx00zNzeZKVpsjjXVksnU9wwmjEK75j9dbChNFWkcTeJIMMF/2NU2dd6Yg93ataO8D
         kjv12MYYbzVk1AKq7eeWrpIq8GqFHWpSYudhDQuFeIi5YTUIfJJn2Bb9wwxXosPzkH0H
         cHXVgNEutM7YqIsLZSFekXZXG/RZ4csjFDqjWTqLnAnDQMAIxuXQjWDrdXjWFjotN3n+
         Lp2g==
X-Gm-Message-State: AFqh2ko1Ziu7BBOr8hSyhnNCZ6u0iwk2sH7c7EBSRTzRP9GDxBhoIv4y
        U/m0+Nu8MWCD9rOWbvQjwIxO+FO1pBDh60rqdPB7bw==
X-Google-Smtp-Source: AMrXdXvnzz3ZpnHx/XmGCd35q5P+zooYE94/XE7raSNlvHYRmWHeCfHv0OlsELoyqCIE6l7P5JjHb2a3omXLwYpk91o=
X-Received: by 2002:a17:90a:5102:b0:229:f71e:fe3 with SMTP id
 t2-20020a17090a510200b00229f71e0fe3mr3758143pjh.47.1674817049307; Fri, 27 Jan
 2023 02:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-7-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-7-quic_devipriy@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Jan 2023 11:56:53 +0100
Message-ID: <CAPDyKFqjiXp28M4uaBqvdsdwy_gtpV_K-nAJgZQJyQir-7orCA@mail.gmail.com>
Subject: Re: [PATCH V1 6/8] dt-bindings: mmc: sdhci-msm: Document the IPQ9574 compatible
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org, tdas@codeaurora.org,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 Jan 2023 at 15:17, devi priya <quic_devipriy@quicinc.com> wrote:
>
> Document the compatible for SDHCI on IPQ9574.
>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 6b89238f0565..5af61789a8c2 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
>        - items:
>            - enum:
> +              - qcom,ipq9574-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> --
> 2.17.1
>
