Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22165C7EE31
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjFAKHR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbjFAKGq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:06:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921EE10C7
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:04:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso717507e87.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613871; x=1688205871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeHc+jG+m56fAT2cyxvpIH0tMCx5a8BOREVUFG4XTMI=;
        b=INxaPgpCe9KuJsQOnoJz+VFNdPcccZJ2DFxXWrTF6SeXGpiNH+lt/wIkU4wAnKNG/o
         1wBX2RjxsP4mjU39DHUugIHjM9gbzto6nUhCgCTvCD/wJI8m4vNw31An3MFUtnq6tYwT
         mIZMkAsOM5jbSo1rDFY6Tvx7BcR5RBpAHT0eEmFx1ITB62QX4kvtlz5K7lmV2aT9zLRI
         zXycqtqbKzoIg+uBuAN8snyPn3CZ2tbqz6zYOEOzzP5l6SKU08lQK6GdnIGIEVviQp4y
         Jkm5QK3EMykN+IdwQ4kwu8vsk2QmhenIvcx1634A7htRRous9UMYXZfp2wwu5XDva/X+
         9tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613871; x=1688205871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeHc+jG+m56fAT2cyxvpIH0tMCx5a8BOREVUFG4XTMI=;
        b=C3GGlKerDfT7GZKlpaDwuHhygpoHxX8/2kRxHtHv4di1Vv+mpST3wNH+V9iLOFoAKe
         5nPlLIzoGheQowkhQHMzZiiWmPLGZQY/05gPiJkyeYiBgTD89O6wFEEdQOKkMr3kG6S9
         SeTzFz1dhV4ZA+da0eOiZYKvja39HhUc3pTXO20wYOkSzvs4LgkpDdy7PyT8r/3ArbMu
         X/IFJC3Chq9iBXY7iqbZIsNOd1mZ2b34vzB+Jzl+/OeLxpNNasFTVuRV5eh6KZxGJIzu
         wtY1QJTkzJNXp+R8G4tZBylVwQ7tTMWbkVvkQm1sv9hJFCekw7AS805IQSsUpSmHzEnY
         FXrQ==
X-Gm-Message-State: AC+VfDyaEjSAqJa8t2E60qLe30taiBY+ZntymzNsGLMCrqT0kQGF6wBG
        nfUKR8eVql+6r1facUEYBJN1iw==
X-Google-Smtp-Source: ACHHUZ4Pr9WOKQ79SOiXxrjrbMqiiA08wotLBujtnD2APInyfPz0DOIOsx2r+C/yaAEfhnZ5X1KR5w==
X-Received: by 2002:a05:6512:38c7:b0:4dd:9f86:859d with SMTP id p7-20020a05651238c700b004dd9f86859dmr1105152lft.13.1685613870855;
        Thu, 01 Jun 2023 03:04:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x22-20020ac24896000000b004f37aac79f4sm1023147lfc.185.2023.06.01.03.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:04:30 -0700 (PDT)
Message-ID: <04ca2cc4-6084-723d-e783-34b3db469271@linaro.org>
Date:   Thu, 1 Jun 2023 13:04:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/20] interconnect: qcom: Define RPM bus clocks
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-10-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-10-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> Add the definitions for RPM bus clocks that will be used by many
> different platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/Makefile         |  2 +-
>   drivers/interconnect/qcom/icc-rpm-clocks.c | 66 ++++++++++++++++++++++++++++++
>   drivers/interconnect/qcom/icc-rpm.h        | 13 ++++++
>   3 files changed, 80 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

