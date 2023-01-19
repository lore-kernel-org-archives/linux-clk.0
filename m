Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420DBC6379F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjASLmA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjASLlg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:41:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6A864D82
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:41:33 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1037065wmq.5
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYOvjlwl0WXMSXebaPJNqoXn/q1ZOrj7Uib9J48klEQ=;
        b=yl4OrnSWHlPfUgVPfr5hiJP9JWFPRsMmIfXFh3YlCX18cvMdAHZHlEHIFeiT1zNI+o
         5pc9Q/OD6q6GGXTq4QcZJcCtQXeeudouPIgyV5zbfctTrsx/VO7HzyTUXfxmZON9Hx5N
         ziUGp4gL3XqtcmhqXg+CX+B4A+7quujnscDCjbRUHy3oP67R5hv2lqnNbXH91AYKRzL4
         yWVmkDP3QvWWDknr/cy0EHb53vBWl7hnXvuXk1jW7ikXr9+dNzGpTOfY+rzc6GodHkNU
         ZOt2WIJaj0CzzIF1HICs2HqbIWteg8TBUslBtALh2b/bSJ7zUkDj3esZh12jMtT/8MPn
         af3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYOvjlwl0WXMSXebaPJNqoXn/q1ZOrj7Uib9J48klEQ=;
        b=BaHwgofGnFGDY6d2xWsCOlWK7G7HKWDLsD6i1Xovxsw1nSFZXfGkPkKLrrMEtDRbGp
         +4ZlBMuYUPTk0XckjQyPtpljHCk87ZjN1USChvcD9eUAcIihjfveC/2af7NrqysCXadw
         COQgyl825C+PG32d4m0zFXnRmqi1F8dP1N1HABzzbMsPSC9o9LMFlqEZQ4aFF3ZGJXId
         UMIzfRPjIq5VavkaWIZq90jfiTYrrAeBz1c/ciIUVdnG5pccqyG8O1NXhVGsw3N+nf3K
         HVDACew0udwdiOwsOMaowdLScUAVEFhYmpVDvYtZIfmWH4XBWXfzHzvhvq4WF0pvuGSR
         869g==
X-Gm-Message-State: AFqh2kq2sST1qNEu7SWgMDcyQV2HmIRPOKGoQhszOUQytIHiQ1M1BRAL
        xjICzwdqMP152hmVabjXQLD2Aw==
X-Google-Smtp-Source: AMrXdXtHS6SvxwK9iV2AcI3FUA0m9DIgiWWO1JNfk7dLWG5HCW/LpgsoUXY0pOzd42qR+dmaFQJqpg==
X-Received: by 2002:a05:600c:601c:b0:3d3:4f56:62e1 with SMTP id az28-20020a05600c601c00b003d34f5662e1mr9937262wmb.27.1674128492381;
        Thu, 19 Jan 2023 03:41:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c218c00b003d9ddc82450sm4433678wme.45.2023.01.19.03.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:41:31 -0800 (PST)
Message-ID: <daecc5f8-026b-c72d-8c26-5580ae32b4cb@linaro.org>
Date:   Thu, 19 Jan 2023 12:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 4/7] dt-bindings: mailbox: qcom: add missing platforms
 to conditional clauses
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
 <20230118132254.2356209-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118132254.2356209-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2023 14:22, Dmitry Baryshkov wrote:
> Add missing platforms to the conditional clauses selecting whether the
> clocks/clock-names properties are required or whether they must be
> omitted.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

