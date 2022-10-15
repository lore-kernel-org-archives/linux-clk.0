Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E5C43217
	for <linux-clk@archiver.kernel.org>; Sat, 15 Oct 2022 15:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbiJOPOh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Oct 2022 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiJOPOd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Oct 2022 11:14:33 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076DE1054A
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 08:14:28 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id w3so5411040qtv.9
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWtY9IbWt5il9NHyrw2WEzVDhghebg1APkZsyDdBupM=;
        b=Ekt7K3DLeH5An4km8nCETBo6O+2kpYAzQPq9HK44a8q44AwYn7d1xBTlsHsnITEELr
         LIbmbmJIfp7W9ZJre3SuVrpDXKpSA2o4Z+nEEVrpyJ8kJGzEyf5eienFpYH4e8MrIaoa
         Bv8V9dV+XD88iG23T9SNbHWyWI6pMNG18PmwwyIIaSWdHJKiDbJ3BUkirC+5OFbN76ZQ
         BJvLQYy6j855izl+3z+1aS7JniqE8q05n48e9FJI0BdAwKuBo+Ok4171iKofjfAdj593
         ZwGEuiPJlv6/+4ELnllepdoL36zBEEZy70G8TJQqMUIBKdoWznEEKqrfulH/xeommql6
         L0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWtY9IbWt5il9NHyrw2WEzVDhghebg1APkZsyDdBupM=;
        b=YQlaSxZ3pvJinm2pq0vPuV/59zwXIsAledEIOtvYNNP+GxCUzZGcJSFdOoAFiw/8Kg
         aQ6BvqeshbwAMC5SRjqOZM+klr7UWCI/TZ0N+Zs1lG4o1+sMNj41J6BAs2xlq0+YddPg
         60/KJy6cKc0OhnAXn1c+iP6HyNhdUb0ayhPA4NXfLwYsQFpZrB2cXu/wXgByQ18Pjz3Q
         J23N7t5qcXu/YC6fieyZ7uoRh2t8RWofRiIU5qomadZ9gHH+oJI/lQ+22ssyKyivr7U1
         aWjDzcKtGgEhXPAtbsaWKCsJKGNnA9Ks7TCfDyfpQTyjitFdxisiqHqliqwP71EnpY+w
         hp7w==
X-Gm-Message-State: ACrzQf26bfVHi1PNdEktCzdyKUmtkth0dPhhiAPmU/0NR4RQ1sUCAf8b
        uOkzSc3Yx5Ne6FjCjRL0iuXjEw==
X-Google-Smtp-Source: AMsMyM7zH6DUMjoJWle+jyy6K2jNqugp2kdak+DoDBE1/iIesC19EcK38vi18d/rr2qIolI5TUyCEw==
X-Received: by 2002:a05:622a:178e:b0:39c:c9ac:b4ad with SMTP id s14-20020a05622a178e00b0039cc9acb4admr2332516qtk.82.1665846867179;
        Sat, 15 Oct 2022 08:14:27 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id i9-20020a05620a404900b006bc192d277csm5192263qko.10.2022.10.15.08.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:14:26 -0700 (PDT)
Message-ID: <19a408cb-995a-4729-dac8-ac8891909d84@linaro.org>
Date:   Sat, 15 Oct 2022 11:14:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 6/6] dt-bindings: qcom,pdc: Introduce pdc bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221014221011.7360-1-quic_molvera@quicinc.com>
 <20221014221011.7360-7-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221011.7360-7-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2022 18:10, Melody Olvera wrote:
> Add compatible fields for QDU1000 and QRU1000 pdcs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index b6f56cf5fbe3..68a80e1c77c5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -26,6 +26,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,qdu1000-pdc
> +          - qcom,qru1000-pdc

Un-reviewed.

Bindings do not match your DTS, so you are documenting different
hardware then upstreaming.

>            - qcom,sc7180-pdc
>            - qcom,sc7280-pdc
>            - qcom,sdm845-pdc

Best regards,
Krzysztof

