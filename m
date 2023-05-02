Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDC2C77B73
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 06:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbjEBG74 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 02:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbjEBG7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 02:59:53 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1433719B0
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 23:59:52 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94f6c285d92so671868966b.3
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010790; x=1685602790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DW2PDnB/a4GBq3xwg2xVlm3Rx3gcG7ZL6JpL2EdisVk=;
        b=xjstnW1MhSH9xeyYTH8/rwRvI0E2oy4J378rdrNaZN4KaXOKgWIZiEjYB39J/NPG3l
         viuRQl3QSmjJSKqeDtavFzAFMiU1x3IQtQJfpyNwbJNm/PCEb0poY6VsbQlfAfdNz7OY
         nTc2a86IQ4oGvsDTzNNBM+nrIyf2o84PR8Es01kR3j9hKCkMMT+R7RPNj1SEx+/88BC4
         djhM4eSMEsG9/GVKwVmUKXAY2hVa1TUN04eSOz2aJhokCNomn7DZEF4wON2Au/5zDsVX
         nhraKmgFHVLyDrGeWLGLiywGEQF7T5LCWK91t5Ewk8amLhNXkQqq+agMldMYoeGn0zfd
         1heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010790; x=1685602790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW2PDnB/a4GBq3xwg2xVlm3Rx3gcG7ZL6JpL2EdisVk=;
        b=WtCBVJmOFMOobacmNANmYOTHK48gQZIGoEeZq5IEqWrLLdoTaYg6gKn1Ve49jsVzIW
         +WgshYW8Xqkxk9dc+9/rwMeTWZk1wfcMZYKcn6oofGy5UJ21MthGGjiaBElETYNS1LHS
         e9/3jA+2m4E1QzA4qQWvxgIhIkONIv6J4BC5fkdnmAGrKTjHlKm7fUZSolI+EkKXSQma
         yj2vPCMyKsPzQmoeG7fJl5CXshg6+C3wV7GaVLK7yERc0VB7EuLraQbnb/XrUlAFoT/2
         w8rzgIHMSZmmjrvctyNjE8A2hlhZPhH710SkYG7+/AOztANkr6pMp3PqIk9avpi4EkvZ
         yS0A==
X-Gm-Message-State: AC+VfDxzWJ8Mf8TxZ0nLqFA1Lvb+QsSuzqdWPsghFJySKuGPHUHN4hm3
        7SJuG3X3Ps0mdXoXz/3Ucl2NHQ==
X-Google-Smtp-Source: ACHHUZ5gJWuRuYwXpuStHz2MNXThfg91bKu7gXAVukYjt0mTT70RrG0+fDw01YPxlIk827PQzA1NQg==
X-Received: by 2002:a17:906:fe05:b0:955:34a5:ae46 with SMTP id wy5-20020a170906fe0500b0095534a5ae46mr14123624ejb.77.1683010790500;
        Mon, 01 May 2023 23:59:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id x3-20020aa7cd83000000b004fbf6b35a56sm13020285edv.76.2023.05.01.23.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:59:49 -0700 (PDT)
Message-ID: <9d6c70bc-3807-edb3-560b-21f9ced7895a@linaro.org>
Date:   Tue, 2 May 2023 08:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 03/10] dt-bindings: clock: provide separate bindings for
 qcom,gcc-mdm9615
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501203401.41393-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> The global clock controller on MDM9615 uses external CXO and PLL7
> clocks. Split the qcom,gcc-mdm9615 to the separate schema file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-mdm9615.yaml      | 53 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 --
>  2 files changed, 53 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> new file mode 100644
> index 000000000000..ca26d69ccb07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on MDM9615
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>

Please update the email/entry. Maybe to Taniya Quic's email or to Bjorn?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

