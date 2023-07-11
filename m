Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE726C001B0
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jul 2023 10:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjGKKrC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjGKKrB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jul 2023 06:47:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634B8E75
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:46:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fba86f069bso8815811e87.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689072417; x=1691664417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G2QCPO5qYJSFYYMmReBO6Vbw5wgGsf85elL+w0M7HA=;
        b=ZdwnaGV99mbFcQ2MmcdZ8aPTzU/rWHB6kmIpJH6y3ydgQ0I1i1mYo6uRVBcJiC23aB
         RoH4MHqOzn0F/3a5x/39IsHlI2kmsixfzBIJlWdZR8HM0jUNa8zNYGSmcJagAxKPYAXF
         2aTyxTPaXPPhmU1tHAsFMDrzH7j3oXZYs2KXM0ZceO78B3Y9hGAcQEhvW0vbZVoVa4Nu
         rLFQgf/cLPk9BUzFgVPdXQIrV1erREr32nyUvu/8cwPFD7TG2BJLo1cEe6kdUM/Ii+wb
         niW56vrmySHbRKIzBvB0MPWD3a3IbpMkUAHN+j4gPij7BuwShaLiGb+5loVnF4+p8Gwd
         7WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689072417; x=1691664417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G2QCPO5qYJSFYYMmReBO6Vbw5wgGsf85elL+w0M7HA=;
        b=BuhvkoNaGtX7/IRtUsFuWv6bWPoF/ETR+rbCAwt+IE1bHWwNDfl0+2Qf7NcBi+qlEi
         3kw4rFOulb43xFsKdRXjgUqPdKy04gnweAlt3NYIZOYVqnEqiVq1Mj4VCoZP7zqV5ClA
         Jjj+1k/HEAirPFKgy79I2UkzHZdck4suCf3nKHuVKqmLeMSGUKpGBm4xv3buMte3CkYM
         s1n848PLd3+G1ve44gaZ3Lg7cujmyz6+0ffzWU/dC5UJxeeoiV5iOHDTTqMbn6R5aaDF
         krVoWsQZm+8qmLX6JC5xCgZPN6crc6Fb6WpkHqeDsbCAhyX10Gtoriq6MPCy3Q/0FS85
         4UHw==
X-Gm-Message-State: ABy/qLZLS1BYGu4ZFCY1M0/cQbra9LkOETqtF3q4SGEo6KNDgdGAQhy/
        F2XbLmvAp6TNH0qOTdlPa8QL2Q==
X-Google-Smtp-Source: APBJJlGGtOSmaBuFLF6puXF4cKfrRVCjXBB9xwyZodKGt6AJk2t1G49mfDFJEjOY4VLOAen1V5DhFw==
X-Received: by 2002:a19:7714:0:b0:4fb:8953:bb8 with SMTP id s20-20020a197714000000b004fb89530bb8mr11290246lfc.50.1689072417450;
        Tue, 11 Jul 2023 03:46:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e12-20020ac2546c000000b004fb96e2b3f3sm268066lfn.165.2023.07.11.03.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:46:56 -0700 (PDT)
Message-ID: <49e24e0c-978b-6249-1ecc-bd485f5f90de@linaro.org>
Date:   Tue, 11 Jul 2023 13:46:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/6] clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL
 support for ipq9574
Content-Language: en-GB
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230711093529.18355-1-quic_devipriy@quicinc.com>
 <20230711093529.18355-2-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230711093529.18355-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2023 12:35, Devi Priya wrote:
> Add support for NSS Huayra alpha pll found on ipq9574 SoCs.
> Programming sequence is the same as that of Huayra type Alpha PLL,
> so we can re-use the same.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 12 ++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |  1 +
>   2 files changed, 13 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

