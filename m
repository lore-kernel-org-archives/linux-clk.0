Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3687CC3DA71
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 09:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiLSJOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 04:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbiLSJNc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 04:13:32 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77311FC
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:30 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id n6so2747914ljj.11
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9wZ7wdsyu+BSbKq1sblZFj5sTqaF3b2C3AeLhpxvQc=;
        b=bEEi1FjcFq4Sb7j7F3hfqK9koSj3TRus0GHArhLQHNvJY3waSRzpQiStJnD8W8U0u+
         9pPT6sUh1GwODLOl03OIFi3Ey2GYnukCb2j+LJjxIQp/0C2n5mRDsiwGz4YFkKZHoKCG
         aLVWw15MeB5vlqXH2oRmk7oI6YExIl7PKhXfNnnX98vn1aahNQmcwC1jhKjE45NzVJzD
         ep5lsbAIPqpaBi9C8r0md6CRIeewadrcl8t798rTLpLNbm5wTpbG9bg/80RATOtJcraC
         HjzeX967mliyMKf2xwpeZGnafscZ/5wyGtGWlIjnlZH+EbCkqmeY76MyPqQS6dFFB/iz
         5VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9wZ7wdsyu+BSbKq1sblZFj5sTqaF3b2C3AeLhpxvQc=;
        b=WxKX5Z8VlqOG5CTF8P4VIRdh4sKoCi72ep0D6Mhnz/8QDEm9AC7gXngk5WU9UQNpF6
         AEnS9zNidQVZmEFCryoLbPJgQ5GQ03Zkkyq2igFIe0DbH3XFE39Cwh8cXUE6tGmhzGEH
         P2wFDRQGSWNbEmTwuHuG8nxXlhwJWDjL4H+chYmKBX9aN7cUc62yicneKAY/sNf+Tdt4
         S7dnqaVAvjeS0nP5FBRxfI8wfcebRR7u8Xf0HelR+PdoYiCMKgiFNVCyYXk8Zi4iwMx3
         hXc7YSkWEjDmHBrNu+IS4nz7jFyWKiV76GIVnV665xZIKec6Jfrsc3tSvdNJExyphul0
         dbkg==
X-Gm-Message-State: ANoB5pmSEbmiuXj2aCnLn+TPxO1g6zD0EYeLW2rlVLinu2mitFhYZEvx
        Z3N6vf7rthMkEFJhDn8oxVzS2A==
X-Google-Smtp-Source: AA0mqf5tLkCPq34JLgVHqZ2jLa1fJotOTZ09Mx3C6cEZj/tIdSFTAN/RVlEVNulIltGaJkRR8PYvMA==
X-Received: by 2002:a2e:a814:0:b0:277:4be:ae38 with SMTP id l20-20020a2ea814000000b0027704beae38mr11081258ljq.7.1671441208865;
        Mon, 19 Dec 2022 01:13:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bj27-20020a2eaa9b000000b002797892025csm707046ljb.137.2022.12.19.01.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:13:28 -0800 (PST)
Message-ID: <a813d8dd-25e6-1255-8b3b-e79649401957@linaro.org>
Date:   Mon, 19 Dec 2022 10:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] dt-bindings: clock: qcom: gcc-qcs404: add two GDSC
 entries
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
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221217001730.540502-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/12/2022 01:17, Dmitry Baryshkov wrote:
> On QCS404 platform the Global Clock Controller supports two GDSCs: MDSS
> (display) and OXILI (GPU). Add corresponding indices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

