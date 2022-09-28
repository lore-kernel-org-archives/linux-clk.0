Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CD2C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiI1PFt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbiI1PFs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:05:48 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E9F3ED40
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:05:47 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso1170650wms.5
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LbkiTn2AAWuuc6hV3bxP0WyO4RfSlFoBB5RRyBhKRLQ=;
        b=Od4C1bLx1Yl3Hz1HqnUnvOL+CIUbylDRF341Sr1tz74+sJKO+9rAULiR7NPW7hyipZ
         VTab/cPzacGT1fmJD5KvIZ9ZtbAn+yWCjmiZSOBFXPr/s0GtDMmwo6M1QrDPgkk+b7L6
         t+vKGQGUBmtCYFVWkUoptgsRh+VcRFPoOI0JBXuuQjMVvPbAgEESwsbCqtx8zQty41YZ
         XaBMm5Wh3kom2H1VeMvQBChgapUMiovWpcSVGiRG8Udn4dYWQ8rDbI7RvAdrACcSfisS
         QN9MWjTUgASv7pnioG6a+7EOA/ULIGSJMOp+ex8QXjolUYFj/fr3TZT19ilvBPVwzIE2
         8z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LbkiTn2AAWuuc6hV3bxP0WyO4RfSlFoBB5RRyBhKRLQ=;
        b=tc2dsk7aOyMtpe1jNywgC3t7Ze8GQs7MACkq3C6icpnApL1kcxZWvXrN+BJ+yRl/hU
         oli9RhH8QL3+ApbU1wwQ4FIjScpGSWHSuxnauoTNd+P7wIg+VLtzEq7DPDDWwj7ZcH1Y
         gn1d/HnjSigWXTVy8TwKTrPenMXyQMYhRMPMDWh4/yzLOQ0t0x5Lwf+p71uNSHh/sBos
         pZ5//C5n5xHXIeBQJfD/REMnY5nMHQ0utJSd7v1u3iBn8ykJZBhUNmPYH7b4PitkiHqc
         9udTjXNk9nY/HxcR8g/NLvSh35K+MDnykX87QIr7JorEJicc3/bFghVuEW8Qz8UjSDZZ
         uzSA==
X-Gm-Message-State: ACrzQf1CM9xGjUOfIZVTvWI/2tZLCjRSgWNMaFkyWwQyNS8FoKwT3+0o
        EoQqME9g2ctPXFTIJQJMqsIWag==
X-Google-Smtp-Source: AMsMyM4K0lTNM9cpGRumIQstlHDzumN0c1uVyJVGDQHeRJexGeR7LIBt+gRTfzXJUPQqpWvp8TNPHQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id g11-20020a05600c310b00b003b4c618180dmr7221013wmo.25.1664377545649;
        Wed, 28 Sep 2022 08:05:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d5441000000b0022cc0a2cbecsm4072327wrv.15.2022.09.28.08.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:05:45 -0700 (PDT)
Message-ID: <cd9a50f4-ff42-a87d-bcea-0af0509cb592@linaro.org>
Date:   Wed, 28 Sep 2022 16:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to
 qcom,gcc-msm8916.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 15:56, Dmitry Baryshkov wrote:
> The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
> controller requires the same parent clocks, move MSM8939 GCC compatible
> to qcom,msm8916.yaml

I'm not sure they are _all_ the same but definitely agree the two trees 
are so close they should live in the same file.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

