Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5976EC76196
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 07:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjC1HHN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 03:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjC1HHM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 03:07:12 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2602681
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 00:07:11 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r11so45563314edd.5
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679987229;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4ch23DrQsWHOR9SnPpFPwEYN9EwYbqlOi9orjMDJe4=;
        b=Tny7Ck2ytQInZa88ltoENG417Ja1fscKtnD1GDs58pdSZJ/IVSj8/UsWVhNeSneUz/
         8YvgGJJ3lFeVdUuBAzBRD2Xfp17sBlzFfs8EAVLZTNvHohM3QBxlEeE6Xn/v+yU3cko1
         iqcF4ptefuOZmgRjRQRRo2iXBt3qxSgpGvfV99avSulHtgtTRLJkPR0I0F55i3u2MQeu
         ycRfn9Am0945hrqeNyx7mzanityt6clb2X+F2BG9N9Ru1iIdebD6F/Ofsl8ADVqpA+9/
         uoSABKgpQ8mEl+OkxRZ278vABaKXzskqEJtx3QxNF4U623FECciajm6w9Ey8wNStjRg6
         KyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679987229;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4ch23DrQsWHOR9SnPpFPwEYN9EwYbqlOi9orjMDJe4=;
        b=06rXsOVYoVA4phbg8ZTeBVgrea5v0sQvR3ylAujX46ezVCK5MifluBdJODXRhWXyFC
         STPo+HFcAMyfW3e2t4ruCDqxSy0bFCxc0HtNFPFkdDOsnhscLrBxXgzp/m9B7uAXojDo
         JxPg6ggLot0rwDcMAeZsfhif3sMx0Sr9xh7XsSdoNeYSQvdxSKvgdi/Xl/3/KEthS0rB
         ixNOvZDAQrtR0W7okQrTi/zrVJI1qY4E0X9QfvsQdwLOoB2NW/OzH+tNmyB9j+JK/61n
         YqhvalxyfxfmDbNvzzyvSuvcg9j9x5T8z0VVAX2NWeHsIH+4V5iERUiBQidHpwwr3eKi
         i+Vw==
X-Gm-Message-State: AAQBX9fNqzhZMSfwfgcQ6tHSUIKOa5e3YVUL3NNTxYhHrz4FYozCzSzh
        MR/O9KP7s7D5Nc2g6tgqtyqJ8g==
X-Google-Smtp-Source: AKy350bKhgmasZr9CpVxheey/53sUglV0Ce7vW/cC0O8O0yoA3cHNgz9FAmIy78efquiDIKZIIzJng==
X-Received: by 2002:a17:906:448e:b0:933:3cd8:a16f with SMTP id y14-20020a170906448e00b009333cd8a16fmr16877907ejo.75.1679987229556;
        Tue, 28 Mar 2023 00:07:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id q7-20020a170906b28700b00931c887372dsm14794198ejz.107.2023.03.28.00.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:07:09 -0700 (PDT)
Message-ID: <39356c59-7723-40df-08ba-cd563a7e066c@linaro.org>
Date:   Tue, 28 Mar 2023 09:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679909245.git.quic_varada@quicinc.com>
 <4a21defe3320eb11d0e43bc7f02b3168ecefd458.1679909245.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4a21defe3320eb11d0e43bc7f02b3168ecefd458.1679909245.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/03/2023 11:30, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v4:
> 	- Remove constraints not applicable to IPQ9574
>  Changes in v3:
> 	- Update other mandatory fields to accomodate IPQ9574
>  Changes in v2:
> 	- Updated sections missed in previous patch
> ---
>  .../bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> index e81a382..aa5b58c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy
> +      - qcom,ipq9574-qmp-usb3-phy
>        - qcom,msm8996-qmp-usb3-phy
>        - qcom,msm8998-qmp-usb3-phy
>        - qcom,qcm2290-qmp-usb3-phy
> @@ -122,8 +123,6 @@ required:
>    - clock-names
>    - resets
>    - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply
>  
>  additionalProperties: false
>  
> @@ -204,6 +203,28 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq9574-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: pipe

Isn't pipe the clock for child node?

Best regards,
Krzysztof

