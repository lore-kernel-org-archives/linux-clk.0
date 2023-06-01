Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2CFC7EE29
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbjFAKQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbjFAKPW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:15:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E698E7E
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:13:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f3b5881734so716566e87.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614387; x=1688206387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXouGOXkpoQ3tdmDcT3qz0S4YzawGIkT1hXliFzcQPw=;
        b=P11YRFapqhQ6yAR93ejqCZFsdjz15vcOsO2jcUkeGYUTHsMVapscWwLormxHbvTf4e
         MAoPrF2UnO+F3Tm6/dCaSuU4VyEra4PAtPGa1uqXeT3xjCcBWN6o8/rP1a0zIkRw7cYt
         fiENQ2KkHt2PlpSaDxNHX5nkf6FE56USHGJT8eZ1pTaFYFOmgZGhHt7okKE8LMa4x9EN
         fscwWatmRgLjLnSxg9MiCHd4k5RqN2/GprFAVWo0fe8cCaMgvhnBf0TtDLQscq7aBs+S
         T5BCiFiU1W9vsclUwUBuQl30Xezc2db3M/4iOppbX1qVzwcgqUM2d/sK3eMpLfm/B4+A
         lHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614387; x=1688206387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXouGOXkpoQ3tdmDcT3qz0S4YzawGIkT1hXliFzcQPw=;
        b=Tc36poNJTT3qGpWr5pIlIefKTXFeCWfVmM26Jxlhmhn5owq6b8P1O2D48tpohkXBXP
         28RyoDoWZOIsRQqsOb7/6kIHrUZimDDc4pw6xohR3lM5Bynh//h8WVL626R3AWoY7paK
         Ip5ye0Q2Ncw4yw42GWCEJ+8rmhSYziM8VFqre58ixIaV7N8XsTJv4EgxL+cLqHIQBohe
         s1Hu69J09Y1n1LEI5BKJGxHivN5wS6Yk4meFgl85f+f9Zm7oDIhJjiJD1aKlTSexpyyx
         eXebcPUX9wcBQ1wYrANtBpMH/2mpUddqYyF26voPDcX/VDWA1bDL5sB1XVf1/eO2GBZh
         0dMg==
X-Gm-Message-State: AC+VfDwfTgfvfJ3RBRAI5xuy/rvXKFk5bDLsGhUXNF1FmpCRGLGB+nYN
        nG2QHE5FNBLhLWJu5sxU4/7QQg==
X-Google-Smtp-Source: ACHHUZ4m9ck0bizOwU91YmOZb84i7iGLIr5Hf82qDYtxipuuCkGEX83LQV/Cng1E87Whj3s2lw53Vw==
X-Received: by 2002:a05:6512:21a7:b0:4e8:4a21:9c92 with SMTP id c7-20020a05651221a700b004e84a219c92mr1102114lft.4.1685614386683;
        Thu, 01 Jun 2023 03:13:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y24-20020a197518000000b004f271790d6csm1033816lfe.136.2023.06.01.03.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:13:06 -0700 (PDT)
Message-ID: <f2403ae6-aa8c-b53a-2e24-4f158fcc85c7@linaro.org>
Date:   Thu, 1 Jun 2023 13:13:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 18/20] interconnect: qcom: icc-rpm: Fix bucket number
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
 <20230526-topic-smd_icc-v1-18-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-18-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> SMD RPM only provides two buckets, one each for the active-only and
> active-sleep RPM contexts. Use the correct constant to allocate and
> operate on them.
> 
> Fixes: dcbce7b0a79c ("interconnect: qcom: icc-rpm: Support multiple buckets")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

