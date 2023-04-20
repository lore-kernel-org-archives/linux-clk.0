Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606F7C77B73
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 10:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbjDTKhJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Apr 2023 06:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbjDTKgL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2023 06:36:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11CC7A89
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 03:33:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso467960e87.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681986823; x=1684578823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Km7fYpP6TW/v//SsQT00GnyneejX9uUDDOVhZE5n5xI=;
        b=omq6USS+6wPohpA8a0n0uXqurlRJCRBlTGmxbfed9VYsZHD6xxp8Z7lnZYfHm7JF1I
         Ugpb+KXIro1kjq1OfPs/dZ6amfgct3ZJMGypRTpYuXvYKpOIUql260eVCSIMUrd5WgjY
         +GpYIVfVvePMUmhYkvkT1o0AGpbnHfyTNjN1ZFAiNSBto9kJZJW3xqHauaSmXBWxOxlo
         rINiyoQlHMS/gGmDujvisgk8WaJgXNBaKbfyRczEyQWAOV7mmXi7kLfxPt5NCz2a8A6d
         zoE+048Nw6BlGD5ThUmW0JyZND4vPI5ZFOpBhYp+4uCOfMUTcCFM6P7YFbN2ZP+Y9nF3
         thDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681986823; x=1684578823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Km7fYpP6TW/v//SsQT00GnyneejX9uUDDOVhZE5n5xI=;
        b=XU0Jq30CAbVSZSnJgior1LTFdn51XW/8U7EcmXDJTbmFtOOVl1x96j3uuicITA3Mfi
         EVmb0mLjEZh09AM4y229bg1QnkBZzRxGmVazcxBoLSX6sHEMlA1JWxzH8038Wp1cXdCb
         hRSy6H1o4GgUIcnDQtK+Ft0aJIpO5uZImUvJYyHiMa2TduqL8izWbyAZoFozVdjNoUxU
         Lqf0P2+A+W73evDSYWPeSS635MxhCRoJPoQ2JdZGbDvDsZoswEBk3vtbQq3DTjGoGsbq
         Avb9deYEsDCjghCeWWoHHLobz8L/USBeM+FBUZ7flZOTg3f5rMzYQL+O65TVAa962ekG
         NVWw==
X-Gm-Message-State: AAQBX9e4qeK2q0hZLxE1CgbFbneSpb5SrNSkYhkLWZm3hEcrnZsoS71D
        bI1fIxgyATxx/hjXVzmjceA1jQ==
X-Google-Smtp-Source: AKy350bbg9I6ZBPxb4VonvL9ujTQrhDttBE9Pxlis6/qvpG/a5zlxV4mrfqhjY4IdvKCqIzishwMyQ==
X-Received: by 2002:ac2:5444:0:b0:4eb:2529:cbb2 with SMTP id d4-20020ac25444000000b004eb2529cbb2mr445613lfn.49.1681986822894;
        Thu, 20 Apr 2023 03:33:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n1-20020a2e8781000000b002a7e9e4e9dcsm190172lji.114.2023.04.20.03.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:33:42 -0700 (PDT)
Message-ID: <2c4d7635-4b59-fcbd-133e-984205379e11@linaro.org>
Date:   Thu, 20 Apr 2023 13:33:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/2] clk: qcom: Introduce SM8350 VIDEOCC
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v3-0-0e404765f945@linaro.org>
 <20230413-topic-lahaina_vidcc-v3-2-0e404765f945@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230413-topic-lahaina_vidcc-v3-2-0e404765f945@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/04/2023 15:53, Konrad Dybcio wrote:
> Add support for the Video Clock Controller found on the SM8350 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig          |   9 +
>   drivers/clk/qcom/Makefile         |   1 +
>   drivers/clk/qcom/videocc-sm8350.c | 552 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 562 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

