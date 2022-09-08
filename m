Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07F3ECAAD5
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 11:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiIHLIK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 07:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiIHLII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 07:08:08 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52DECCD4A
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 04:08:05 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z20so19447836ljq.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nl/gX4imOToZho5UFDxzEpyUWNGOIGDYdp1e4bXjgB4=;
        b=j4lsWoDPctiBxd4wxmRuYGfMFJUNfe6PRsJpgILjez06ENaILpJhI0wLm4tSj63ChR
         bn8gyjis9Ciho+TYSJQXe2wUPMtVdJfD8Ml1WXBz/oGvhv+A3BE6U9xT23Deze2FeuSM
         aijopf1+NZPC+3ITBTtV6ovL9q1psr0hV/POn30nqhXjWbnRfnuvXEoxJaiDGoOx5FSp
         DTKWwvcNO8r95D55qJF++4jWV5OeP8ne/6BQto18dLkiQza9+Ec08uxjjVzhUfgXj9De
         8sDhZzDvmgQTHxpeK/0mi9VtAazViATWUiPMdDyQYWjlFRUntnuRxmLoqmtgfolfO5uv
         8/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nl/gX4imOToZho5UFDxzEpyUWNGOIGDYdp1e4bXjgB4=;
        b=uhwRzpkZpxxw2QvMSi8+xP76759+NJezM/sWaxijI+qeTfNd7t4kg7AZuzAXliMsa5
         n9rsu718jrfpQOzBjNs8qvPwXK1CfzhzK5I2NI7UDaA45e1MvcwHzEcOjTI/4M0TdxQ3
         KfedafWfB3eYmLPH7TQtmRrqreU/EOxRnkgrAnkPckrcWxBfYBLODN1nj90A65FBHnX2
         Jxn5wVUsaWY+DzVVuTRPXSbqMDCzZPWGIsjSoOMN0fa58Sp5eIdCumb1rMfPKiKFPhAm
         +ri6op47Mq1eNXIr1UdpMuLpqmY7SM+3bnd60230q/Y3LQdaeA8YBsZE2ke5cFzato3X
         CCcg==
X-Gm-Message-State: ACgBeo3Fjzqa8pw9O8h49msYTInr3rdxQjGRm5xWGEb952s7OfVlHi2n
        dqllHSZ6dekA2udSNtEHmaKNLQ==
X-Google-Smtp-Source: AA6agR6a67h3FkF7g5VWCRuxJI82Pbb2Odo+CPi7d5MSQ24A3s8wKjqKWAGxCHM/STfol0ZZgMU3wQ==
X-Received: by 2002:a2e:9b91:0:b0:26a:ce59:c517 with SMTP id z17-20020a2e9b91000000b0026ace59c517mr2037370lji.181.1662635284068;
        Thu, 08 Sep 2022 04:08:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b0049488c97d39sm2985477lfq.212.2022.09.08.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:08:03 -0700 (PDT)
Message-ID: <ba44cf8a-a4d4-3f8e-91ab-43002b73c312@linaro.org>
Date:   Thu, 8 Sep 2022 13:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm845: use device tree match data
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tdas@codeaurora.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, caleb@connolly.tech,
        jo@jsfamily.in
References: <20220907223927.139858-1-mailingradian@gmail.com>
 <20220907223927.139858-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907223927.139858-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/09/2022 00:39, Richard Acayan wrote:
> This driver will support more than one SoC's set of clocks, and set of
> GDSCs. This behavior would be unclean with hard-coded static variables.
> Support it by grabbing clocks, GDSCs, and BCRs in the match data.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
