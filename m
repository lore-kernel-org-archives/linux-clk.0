Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5998EEC8741
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjIGPy2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242235AbjIGPto (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:49:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D995265
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:40:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31f737b8b69so559545f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101178; x=1694705978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGhxv+wLkUlJTnXgtlH4J46AYd9o45ySTLmRTKlekWI=;
        b=fvaH5bN4hD4PD0SQVTXGTd8DoCwXRQQgrHxEd12WDZpnopJqqvqIh5N4a3/bPkkMgB
         JpLHoLwo/spFrcgWL9p5TPRQfAtWw52rWdyUfIAlsvqyA68QXSFKxJTmqJY2C1roYPLu
         4nYBLg6cF95RPGPFq7NLoHcuOE0C/ZMOoxSNbUp1w9Tuf3mVHYcmhwXK1fj3jkaIhoW/
         i3EEgECUZGna6xEkZgTSjQQQhMJbHwFzVQXOs0XQHMKeyLkuw3mhzhJnfe2nBdDWSC+1
         Bms9z9EZkFLqAIHm6OlAwYIxO+hSMXrVWCdPFtop0ozgBGR8yHtB0S/y1pu4TFQzGFa5
         8uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101178; x=1694705978;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGhxv+wLkUlJTnXgtlH4J46AYd9o45ySTLmRTKlekWI=;
        b=YhWjgGDWS9Ndm07Bq1eYef4r7t5MrRis+1nwSkWO3GI+kFw0HXvtdctdU+sYr/ylrl
         KGjsigMxYM6wndfiDhurDqsvgQFDCzRZ+zw+tIujiKO2Kkt7Wol/EJZb4EoTA60hYC6d
         B7rJAt5UyXmjkbQTr+onGjxYq/k5uRUvsOql6nDwZaqN/SYhxK4+GbI4RHp9Mmhv+E2O
         vK9mc63nJBNGWML7CU3liZJmcBladgjUHw0WRPhkV3p/tmWErOPXavElLOwkywj9QMha
         //bN7ZJ9jAXHWqdYUKqgDlpic0aXKQIeOgcVRVunWDcSJxy7NHqu72uoedOl1rc7p6lv
         ghIw==
X-Gm-Message-State: AOJu0Ywnrk8IBhalzWUrHtUmeXTlA4LAz6Y01KyeJDdUWXZYBA8ILVIH
        4M5/YNCamF1wOLePwBygTW9tXfOXKOC5wqV9Cdo=
X-Google-Smtp-Source: AGHT+IHgZdZSiR//XinTA9Y8E8bS2xBu6CE90k9cVQP1rRMZIv9GSOKD+LJS0NcyLh090bkwtAQy+Q==
X-Received: by 2002:a17:906:19:b0:9a1:ec3d:8ffe with SMTP id 25-20020a170906001900b009a1ec3d8ffemr4567309eja.18.1694066647510;
        Wed, 06 Sep 2023 23:04:07 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id qx12-20020a170906fccc00b0099bd86f9248sm9922585ejb.63.2023.09.06.23.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:04:07 -0700 (PDT)
Message-ID: <2de8953c-f1c5-3c17-5c95-973ef550bc32@linaro.org>
Date:   Thu, 7 Sep 2023 08:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 08/10] dt-bindings: cpufreq: qcom-cpufreq-nvmem:
 document IPQ9574
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <e0f54a4b249f24b10d3dc21a0224718e46ebd158.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0f54a4b249f24b10d3dc21a0224718e46ebd158.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> Document IPQ9574 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

