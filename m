Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B46EB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 14:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjGFOnN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 10:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbjGFOnM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 10:43:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2145C1725
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 07:43:11 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991da766865so101490366b.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688654589; x=1691246589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zpgn6iSuWrCXKezGMf/Zxaf2wMmCxdcMK5CeZXEZSLg=;
        b=XWEXOuyX6RWkOxaDnGGHMmWUgc8wi6rwc60EwRR30PkCkJXoRMK1yHbsgcQX75izR6
         wjmGFIqpuqwnXhOi71LNqr6Q/RWfSY5gTRPo8dObLV8emq7AmMKRrXfkgwW+r4N0Ve07
         etyPt7ptircC9KOprGHQBcRhS8lBcVQ0PbZdD6R5DzQ5M4qUMD8xAC1AKzQSfYP6c1WQ
         DfaRBVfbI1z1fmEMQBzHClnt7N6DS+LjrvQ1cH2L+c01QdW3P20wuDeyvUDYPqNVsDFn
         GlcpUHOs0x04eTh5V+HW0aHKjmRP/Kej2UIp0eTHKRoUE/2uV9SWcVgEK3JZug+rztWH
         Cizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688654589; x=1691246589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpgn6iSuWrCXKezGMf/Zxaf2wMmCxdcMK5CeZXEZSLg=;
        b=VNszDf0MNqFTNJf6nnPARVT20KXkCy8jcLtnTZt3Tsof3hjF8nn4MKadUeTBt6oOx2
         lSP+iKGk4KIZKRvlXPn9dH9vwytKTIzsPumH6jQz63+zD3wR1OdrghStyA8ZDmfNWE1c
         z0VqQ9pvgengRF8S207/q6DdZwqemuHDUWDgwDiKRtFRa/7zqtdmqKpCOH68ZeDS1bZf
         eEIbUnfJTJLyhZ9XuxtjavjDtSPxQYvXmCIf6yeHQqPTtu1P31bgO7ZKf8PPkEGTrfF4
         nDkeg7vr6uWj78WTTybjVttXe6138RB/SryI8EVAaAJ9ySLmOENGHLXzHPuYzeysb2eB
         obYQ==
X-Gm-Message-State: ABy/qLaCwm06XakYxDW7Uwv1NIF0I3yJTfNUhLceXTwrunqybe/NBKXu
        7oVqu41DF9q5ZIKrp9KYWnf0Lg==
X-Google-Smtp-Source: APBJJlH3MnPPwy9StiGpw5jz6H+mjF7DKDHDia6Kd3eazyvjRgS9LpGZqroclo54wqJ9pOk5+rqTcg==
X-Received: by 2002:a17:906:3f03:b0:991:f28c:54ea with SMTP id c3-20020a1709063f0300b00991f28c54eamr1915056ejj.41.1688654589662;
        Thu, 06 Jul 2023 07:43:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id xa20-20020a170907b9d400b00993004239a4sm881663ejc.215.2023.07.06.07.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 07:43:09 -0700 (PDT)
Message-ID: <58c2a2e9-6766-b456-3e64-6cfc4105f3e7@linaro.org>
Date:   Thu, 6 Jul 2023 16:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/7] soc: qcom: socinfo: Add SoC ID for SM7125
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230706124339.134272-1-davidwronek@gmail.com>
 <20230706124339.134272-5-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706124339.134272-5-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2023 14:40, David Wronek wrote:
> Add the SoC ID entry for Qualcomm SM7125.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

