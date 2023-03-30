Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE661C77B60
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 09:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjC3Jjo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 05:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjC3Jjn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 05:39:43 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29D56EA9
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 02:39:41 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54606036bb3so178303217b3.6
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680169181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+KF3Ej0zA5vUsAy03E3uvbCGHCj2rR2h+cgAo56vcSY=;
        b=XMzC2GHrO/8LfQ2aF3jdBJuAoAavxiNQuWfxljRs8SSZB223Vy6gKXq8lIxlvbo5Rh
         61k6tYXlbAGXehWTjVPqLri1D03gVJoGcUXUOH3PsPIHJc/noOjuYYqooeFFg70dSNjo
         J8X8pl4w2xqanq7XlhVxGBqwbB39cp4zM3CYYGZ3A6180YwGKiXfkRrFVRSEeEMxllvf
         BH83sjDB5BmtIX7D/eKKrPxH3sAEqcldv4ha47iuHa7Z3Tf3JV7WlJnqKJ42NY0SShVq
         bO4jsOO7inoRCS2pNoUY+O3iSCI+0NqnrtUaX3tZobzpuU/fM2EXaflsdDLgvfQkpeRp
         b18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KF3Ej0zA5vUsAy03E3uvbCGHCj2rR2h+cgAo56vcSY=;
        b=3w8KdItj8d0pC9wTQWFCKcX2m6YG0bcwpsQXL0qat4JpTgSbdS5IIJnGlekno0clAi
         2DZz+dQILBgIKA0bb23fMgaNN1HUrHwmsVZ6tPHHN7g3+oSBe7+lWAlj6ratPgyyDFzA
         P7Sp2hFx+BXbGCrxmRBtf1zPRD4Qm8Az5LcrMTXN5LYAwqho/vRgLp72Tdb39gMcRIzw
         Gq9p8cWZ8inYwwaA4pUhE1i8Z6poVrVKLQkx2ATxqFKRMz1nWudF4uk8ib9uFYH25V+7
         0LesxOymrGPHoc1jjORMP67mInrT5ZQA/BRTQCxlLbVJCgmzt01Xk/mWaYUZOrmoJv5/
         tmug==
X-Gm-Message-State: AAQBX9cL7XEoIG2pqrwfDA4+sEpj4WWtRFA5s1i+P3vmVp72pleg4g91
        rqeCHwJhQtOUXE8TS2qC4INau0pG2oELbPSEGr6jwA==
X-Google-Smtp-Source: AKy350Y9NxPb3viIr2gzUpn3/4183c/Hd9fNIbqB/+mt9JjjNP5tyVonZiZsUTV2u+aJtwZ2ZC3uPbmUCiAJfBuAGXU=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr7051275ywk.5.1680169180845; Thu, 30 Mar
 2023 02:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680162377.git.quic_varada@quicinc.com> <cb8f2ba0ff39951aeada479ed3895d19c9f72617.1680162377.git.quic_varada@quicinc.com>
In-Reply-To: <cb8f2ba0ff39951aeada479ed3895d19c9f72617.1680162377.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:39:30 +0300
Message-ID: <CAA8EJprQhrqWo5s8hNq=z4DL=hw9wde4ZHHwb+JoKCMQk3rU7w@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: usb: dwc3: Add IPQ9574 compatible
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 30 Mar 2023 at 11:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Document the IPQ9574 dwc3 compatible.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v5:
>         - Restore removed constraints
>
>  Changes in v4:
>         - Update other relevant sections
>         - Remove constraints not applicable to IPQ9574
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a2aabda..8def6a3 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,ipq6018-dwc3
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
> +          - qcom,ipq9574-dwc3
>            - qcom,msm8953-dwc3
>            - qcom,msm8994-dwc3
>            - qcom,msm8996-dwc3
> @@ -242,6 +243,24 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq9574-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: sys_noc_axi
> +            - const: anoc_axi
> +            - const: master
> +            - const: sleep
> +            - const: mock_utmi

Is there any chance of using clock names that are close to the names
used by existing platforms?

I think this fits into the third 'if' bucket:

cfg_noc = sys_noc_axi
core = master
iface = anoc_axi
sleep = sleep
mock_utmi = mock_utmi

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
>                - qcom,msm8994-dwc3
>                - qcom,qcs404-dwc3
>      then:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
