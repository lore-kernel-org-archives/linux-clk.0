Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1722EB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 16:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjFNQnO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjFNQnL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 12:43:11 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337422689
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:43:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-519274f7b05so981410a12.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686760986; x=1689352986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYxZyCq/Gi1HReykhrZJhQ1TogVgVoGsHy6LMM70L8w=;
        b=FIuBtH75LaI9ryaFI5mUy3gYiBMBakvXdP6X6Ekvml1P4vgJTz7YdUbY4a/Wp7SiNA
         noNFfrZK3LCbd1LaxblbkvU3S9quAs5U4u2L7zkXZG9CVwMc2kDitIe6X70OfAaAanov
         77cEY6ZLUsFYpJgredh1jHzjZZxI9oJ44pOMZ+1xieFMGyqvTK6Ah20uqTIEIEYuztUL
         w3nfY7ZUSXK1vB25NHQC4oLNm+fuDmTD6c03R44iH32aosVgHZoB+xohijBHPneBMlrF
         kIFNXCtRkWV0e/7LnBiXEin0WYCS961zBIns0D8x/m1zg5+t7l0/I01ZFPxOea8sLePQ
         28yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686760986; x=1689352986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYxZyCq/Gi1HReykhrZJhQ1TogVgVoGsHy6LMM70L8w=;
        b=MEEW6MEr43LLB79q2VUIaAn47gx9PNz6rxJKgHFIUVngeqb7Dr0dsL10m1AJq9nJ61
         6X6g6l4RuYoDo2MC76yzKxwgxmaX2omt2NC77f/uCT4pR3LwxGNHu2G8WDKF7TUNm8vW
         U4dsxxXkKHOhj4Yqo6ycuJNzfWSI8a89HiWAkiFndBLJnUcFz7sJ3DbOOxJAErGcM5P/
         CUAGkBryK24QOEtsJw/3/Q/ksLvkgsDB9TwAQsgdDbr9/yW0qaghNDzqgRCxul8F1Qqk
         XFahGBoJiE9a9uG5LZ4eunG26VSuz5ICFC9Y1Jf6YOYZMbqP30AL4UTAFEj+PALgm70Y
         On4Q==
X-Gm-Message-State: AC+VfDwSEPIzk6iaNNZCmPTDD8OBuNiCZUt7lZZHi+mhbN2hMKXP6dK5
        yqdoXz6F8hbUnJbGLA4elxAVgQ==
X-Google-Smtp-Source: ACHHUZ42yJBCaEfV+oEONTiEyCMpQDPxB+8Mz3jsy4GV3UBDckUu0IrqOZ2cT1BdD0r/sqSYm5xdGw==
X-Received: by 2002:a17:907:3e9f:b0:976:c9a6:4857 with SMTP id hs31-20020a1709073e9f00b00976c9a64857mr20032169ejc.57.1686760986667;
        Wed, 14 Jun 2023 09:43:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u16-20020a1709064ad000b009828e26e519sm255352ejt.122.2023.06.14.09.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:43:06 -0700 (PDT)
Message-ID: <c8573d08-d4e2-41a8-f0b1-e1d7a0c9ce17@linaro.org>
Date:   Wed, 14 Jun 2023 18:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/22] dt-bindings: interconnect: Add Qcom RPM ICC
 bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
 <20230526-topic-smd_icc-v5-1-eeaa09d0082e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v5-1-eeaa09d0082e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2023 12:22, Konrad Dybcio wrote:
> The SMD RPM interconnect driver requires different icc tags to the
> RPMh driver. Add bindings to reflect that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  include/dt-bindings/interconnect/qcom,rpm-icc.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/dt-bindings/interconnect/qcom,rpm-icc.h b/include/dt-bindings/interconnect/qcom,rpm-icc.h
> new file mode 100644
> index 000000000000..2cd56f91e5c5
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,rpm-icc.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
> +
> +#define RPM_ACTIVE_TAG		(1 << 0)
> +#define RPM_SLEEP_TAG		(1 << 1)
> +#define RPM_ALWAYS_TAG		(RPM_ACTIVE_TAG | RPM_SLEEP_TAG)

Where are these used? I don't see any DTS in your patchset. Did you send
it separately?

Best regards,
Krzysztof

