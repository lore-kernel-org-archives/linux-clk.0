Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C949C742A7
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCIAue (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjCIAuV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:50:21 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5495499C2A
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:50:12 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id by8so215030ljb.7
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678323012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gj6M8LTT3Uy5owTIXcvfrHSdcPzP2cHKgmz0Ok2mm3U=;
        b=l8P8GVXKDZtKAmRCS5NgablkhlkND/P0Y7yfXSOJ5UUK2scYFkB3hWJWM1Rux9yamh
         WOVEAudP63ITYWlQdeDKvx+NBUbiyur8L5yKQCE4euc3SjDS5y3VPEIJXyHNEN45LKT1
         yKrQS4ECJFRHew4trSVK0YycYArUiFfLBP7IhH0CUOkGZl/xryiNDu7TF8MENphdpggv
         pwF6vZI0VgdgP/znUjZD4gv8bTYUkarbqv2BsKqEUHBga84U/MfeSoMV00IPpeHhZqcl
         XnlgwAFOX+tdURG9yOoiLr1uiiQFs2XZAUKWLbghzn6ESX3D3Lp8iMrXESQKk4S5wwlx
         bWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678323012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj6M8LTT3Uy5owTIXcvfrHSdcPzP2cHKgmz0Ok2mm3U=;
        b=pRyPnaZ2JvO8fmDlpFql6WBBTjGGwJ/20WEVuuugdSZCiK9uXEN9TR6mqsdnqTzF1e
         t/eZhqm4zoY5EHnxV5nHmao4wds9JLWpauKw3dvRgphegEvsVbD2D4+sc5CHoHSZpAfz
         YeD8MplM7vDGiI7KaQ6Zsro2eio/k7mmdP3U1hoRM/2hXQ8Ks8Ax0N3205oV4KJz4MPs
         r6DUwvqWJ4dMaoK3oNz7mYCdg5/92UkU0QkahjFlrpEjtlwNQkNiWXq37dR11rn6RG6t
         u7bGqmx4bEJdBbHogT08oe29I7Tq126szOE2Tm4CxlsLd+1u80HPqOzkwX/vOgLVMsIv
         9vNg==
X-Gm-Message-State: AO0yUKWNvo18iHo/LE6myntqoAzAvzo1B0y33oSg6c9LSISa0SCiJHpM
        3c7a4uBbqh3whZ8QDN4pBJec5g==
X-Google-Smtp-Source: AK7set+OWTKFNn4nZkpqlH5XG0e2BTmSXWMHfiAxMDvd4QwPZ3wtrg0pObrrPIXgxEH3Rf1LX8t+5A==
X-Received: by 2002:a2e:9f03:0:b0:295:bcfb:af2a with SMTP id u3-20020a2e9f03000000b00295bcfbaf2amr5156044ljk.52.1678323012355;
        Wed, 08 Mar 2023 16:50:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020a2e8e22000000b00295b6bdfdfdsm2760026ljk.4.2023.03.08.16.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:50:11 -0800 (PST)
Message-ID: <668b950b-60c2-a8a8-722b-197b50de7139@linaro.org>
Date:   Thu, 9 Mar 2023 02:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 07/14] clk: qcom: smd-rpm: Make
 __DEFINE_CLK_SMD_RPM_PREFIX accept flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-7-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-7-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), make the
> __DEFINE_CLK_SMD_RPM_PREFIX macro accept clock flags for the active-only
> clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

