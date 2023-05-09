Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5808C7EE23
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 17:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjEIRmF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 13:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIRmE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 13:42:04 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FB230E5
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 10:42:01 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9659c5b14d8so1004794666b.3
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683654120; x=1686246120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgSfezJnFheHWxl/J/jtAx9CEBA9nZXTq9vupUNGWSQ=;
        b=lRC7iU5SK3AyepBwA/3/NM8aYtocWUOdo7lkdukNvXDY4Jytb85mFREGFNsTrtQ8+j
         szziW02hihhrpUODgNheXG3gP74Z8t+sHnn0Eb2icPma5NcrzR5G2rYx+NUOeKP52tEG
         WIJLi6DQSmFhy59cZx8SugPE+sfAaRzkNp5K/qL3umIoGqQGjgJuPXKcn0BDXRCVBqX2
         5LMf+vPOpJ/BnboXLCMwO0/mL1b5jyE1uYGfXMzdaR2AcPgbi9SQzOlnFQIdKYq1hVG9
         jYH+NA48cM96FtvteXPLLgUkYc5Cuk6oeXCP2bfYAG/k6DeHLlFW356ohpQvYXETL/AI
         LEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683654120; x=1686246120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgSfezJnFheHWxl/J/jtAx9CEBA9nZXTq9vupUNGWSQ=;
        b=T7mAoVhjaLDi3fX9Xg6SPuxHZDzflC8ayjCphzwXIriBk/H2MRQvhhOkA6CGqzdbm1
         HLBF1DoxBNwKrZ8GfILLoavobJMFMf4l91y1zwM2w6AY4sDD/2o9Qmf34R2wVEw3PUBO
         7Krq7i46NxjwGo+O9/BfqYOTisUSB/+zfu4f+SN6qrXV/hD2KRmrzgduKWAcfl+ONQad
         0p34yz9eX51COTXy78YBZ9Xi9LoUATQmjoXjCUvrtulTtFW7RnKE+KNk3h9/xWLo5/4O
         XLUI8ubuss4tpsIgtjlOPoqkltKOTMHfZPOfKmAN+v9Su7vup+uu3bcCYCGU9lCf+PWL
         eMQg==
X-Gm-Message-State: AC+VfDxreYsIr0sqsQdfFCYgOnG9rdWHDFixL/3hhGjoM2EpjMXP1jIz
        MEhY5Dg2/4W0XEjrp6Kxx6dKrA==
X-Google-Smtp-Source: ACHHUZ7eebYnB6rhiI+xoinXTZKwvRZJY07rLy5XPSTfTbZWrjT1idLyIRNVuDPZtkAUIN71D6Aavg==
X-Received: by 2002:a17:907:6d20:b0:969:e304:441d with SMTP id sa32-20020a1709076d2000b00969e304441dmr3709171ejc.4.1683654120430;
        Tue, 09 May 2023 10:42:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906328d00b00969f44bbef1sm960264ejw.89.2023.05.09.10.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 10:41:59 -0700 (PDT)
Message-ID: <254dcea1-636a-550d-59ae-5889ffe49f6c@linaro.org>
Date:   Tue, 9 May 2023 19:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 07/13] Revert "media: exynos4-is: Remove dependency on
 obsolete SoC support"
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
 <20230501195525.6268-8-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501195525.6268-8-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/05/2023 21:55, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit 2d41a0c9ae51ac363d107f2510022106e7234b33.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  drivers/media/platform/samsung/exynos4-is/Kconfig     | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-core.c | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 2 +-

Subject:
media: Revert "media: Remove dependency on obsolete SoC support"

I assume this will go via media tree. If not, let me know.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

