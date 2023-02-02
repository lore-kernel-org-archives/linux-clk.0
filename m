Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C0BC61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 15:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjBBPhK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbjBBPgu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 10:36:50 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3EB79CB4
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 07:36:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t18so2090192wro.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4SCdiQNUp1vdTPbVGC7rojAZMjL5CcEHONPaTvlx+M=;
        b=DKxsY5Mm1hJbLh6dFB81BN4TqdUNtmMXFkkTR+0tv2wgV4IELONO+pKd7FpDGWevVO
         Tbuxyy+qHSloHeD7knsITw/rNTOZX+ZJHDPJV4l551ZJzBU3QyJwonMbLY+VAOIzmYmH
         AtnV0RBOo9J19dKT1XgO5W+NsSO7D3X9cxH0ojKawH6fu/N8Gz/VZ+zMu/NX+/365SA5
         3zdGYODvKztZ+LmGRldOB5afOyA54LP3RLtAhOJEP5wmAf/JwT/J8GrE8UDEQHo4jcGJ
         1x9bbqGGilR4mSGHRx5w3vB5c0vOcY1y1hh3XahvKZdV2NREln4OoNVbQT4Byo3uJdeo
         dLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4SCdiQNUp1vdTPbVGC7rojAZMjL5CcEHONPaTvlx+M=;
        b=61sLkkNcdpI3OC5++s67NDeaZewdjHgLW54Z9zoyJsXa/LDdj3BBoElz6kEV5hxpzV
         9hjTTObJx9bEBHfHiOo1nKZJfCp9EDe5ARb9xP+mMm1wi7kfSWyvv9feI5oAzFg+XN0q
         lAm9LEYbqfvm7svdxXmqDB5nOTZXITUKHuOnPHid/u0GQaq7hJPrOpAd5WQowsprRAJ5
         s3aUzXcHCbFrpl9SsldGnAd0Ge1Gi95TeEc1FRJ1z7ENq4ga8zZshKqeEgw1RGk6ycIV
         L5bq86oJMVEC/W/z9HdWqtST6/82NpEaCBhdfnuS2l+k4lNHOue2qCa1Qe7Z1UO6FUac
         GQHg==
X-Gm-Message-State: AO0yUKVQJUgeD2S3scN0WAPFqWTZEYqKMejjH2eYAxQy5uWlYB3Ocw21
        Oy6++GhRJW8PnHnnwxZrm0Il0Q==
X-Google-Smtp-Source: AK7set+dXX4n5wzK3ZiMPIbn7fONMSV5qv1A9RaQSJcv8zd4XajPSghDl3Ux2QntyamQxdx+oyyBYg==
X-Received: by 2002:a5d:4d47:0:b0:2bf:b4d1:af03 with SMTP id a7-20020a5d4d47000000b002bfb4d1af03mr5713861wru.30.1675352117264;
        Thu, 02 Feb 2023 07:35:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020adfe806000000b002bdf8dd6a8bsm19746658wrm.80.2023.02.02.07.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 07:35:16 -0800 (PST)
Message-ID: <3a346606-576b-ab89-78f5-5bbaca729090@linaro.org>
Date:   Thu, 2 Feb 2023 16:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/6] dt-bindings: mailbox: qcom: add compatible for the
 IPQ5332 SoC
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202145208.2328032-5-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/02/2023 15:52, Kathiravan T wrote:
> Add the mailbox compatible for the IPQ5332 SoC.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 943f9472ae10..8d8cd1bbe67e 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:

- items:
    - enum:
        - qcom,ipq5332-apcs-apps-global
    - const: qcom,ipq6018-apcs-apps-global

and drop the next patch


Best regards,
Krzysztof

