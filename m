Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE13CC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 15 Oct 2022 13:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJONGQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Oct 2022 09:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiJONGP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Oct 2022 09:06:15 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AE640BC8
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 06:06:14 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id s3so5288665qtn.12
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBNDWb/PUcfIBjVY7nryISHx24x9THNIcQMhnCQu8a0=;
        b=psYq027JfEzzbK4E60x4LX4q7Vhlj2I1XUKQAilBWc+ExEOX+Zwp5+IksHLho0owp3
         mb+leoQnlfmj+GZuwy6Ju444R43BH2cCaiwPHJJ7ddBvMxkCbSFEM4KMHuVygaVBVzGw
         FFPdK72zr8DgmsR0B99ka8AItcsp9GI7/Qlcjh0hRPgWDDkyWn9as7+SneS2ZdIrnCMZ
         SeLe1/k3r55lkFwSZNFjQrWhDZCGy2ptjn+AgfcGgmaCCSZ3ERNdVLvNEBt0HFSANG1u
         AwqZABH/VnA9Q4WBKXfsWqQTwwntiIQRZcOBVgcb6uT3zE59w5qNU+Rirg5xDdXpk8dW
         a3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBNDWb/PUcfIBjVY7nryISHx24x9THNIcQMhnCQu8a0=;
        b=b064whJL8Eluy+lOCzER+plxVtZcFP/vwNcMscEzKO7lm5PZI1LIazlx42WoniHz+W
         tguGLLeqm52Aoi1wSYT9655jz0deE5XwnxA4K+yxLNReJgPVyZd1L03Mm/KGxtKV0Hqf
         arH6LeZTCUjnpcou258afMBHDwOm385KAS7gm260s2B032GtYy1ksqoQnWTnW1HxhKB1
         qQYkH2Vf6IL8dhggBKWlIXYgVvhIuE3J9O97PYQHwkZuKU51d9NrSpj9LUGushoKCoUT
         J6qg0ALXGVA+Z6NOqQbx8BTJXb/wYC1cIFZu4A/Hh7LE0E64Qz4NB3IIpef0JpFlvDAq
         wd/A==
X-Gm-Message-State: ACrzQf1lhBanRJaTeJ1iHvLaHj8Np0Cw/3cizOH5J7KKBKTEwdcMMsUj
        tE4VAolyrB1i3A4s+/3CYlqOLg==
X-Google-Smtp-Source: AMsMyM68XCtlhc18qhR76sv5R8jMSEOf9gyOaszHbt0cP995dakcvcmIUwSNr07yseUpSAV9CGhYtQ==
X-Received: by 2002:ac8:4d4a:0:b0:39c:d99c:dbce with SMTP id x10-20020ac84d4a000000b0039cd99cdbcemr1774966qtv.511.1665839173409;
        Sat, 15 Oct 2022 06:06:13 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id fe13-20020a05622a4d4d00b003994bbe91bdsm3897889qtb.60.2022.10.15.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:06:12 -0700 (PDT)
Message-ID: <c8f33e83-1329-e549-d739-24b33f8633ba@linaro.org>
Date:   Sat, 15 Oct 2022 09:06:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: clock: Convert qcom,lcc to DT schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221015090946.448820-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015090946.448820-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/10/2022 05:09, Luca Weiss wrote:
> Convert the text bindings for the lcc to yaml format. Doing this showed
> that clocks and clock-names were not documented, so fix that now.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../devicetree/bindings/clock/qcom,lcc.txt    | 22 -----
>  .../devicetree/bindings/clock/qcom,lcc.yaml   | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
> deleted file mode 100644
> index a3c78aa88038..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,lcc.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Qualcomm LPASS Clock & Reset Controller Binding
> -------------------------------------------------
> -
> -Required properties :
> -- compatible : shall contain only one of the following:
> -
> -			"qcom,lcc-msm8960"
> -			"qcom,lcc-apq8064"
> -			"qcom,lcc-ipq8064"
> -			"qcom,lcc-mdm9615"
> -
> -- reg : shall contain base register location and length
> -- #clock-cells : shall contain 1
> -- #reset-cells : shall contain 1
> -
> -Example:
> -	clock-controller@28000000 {
> -		compatible = "qcom,lcc-ipq8064";
> -		reg = <0x28000000 0x1000>;
> -		#clock-cells = <1>;
> -		#reset-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> new file mode 100644
> index 000000000000..03c99435d342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,lcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Clock & Reset Controller Binding

Drop "Binding"

> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,lcc-apq8064
> +      - qcom,lcc-ipq8064
> +      - qcom,lcc-mdm9615
> +      - qcom,lcc-msm8960
> +
> +  clocks:
> +    minItems: 8

Drop minItems

> +    maxItems: 8
> +
> +  clock-names:
> +    minItems: 8

Drop minItems

Best regards,
Krzysztof

