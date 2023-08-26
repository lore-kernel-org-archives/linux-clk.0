Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B1C83F11
	for <linux-clk@archiver.kernel.org>; Sat, 26 Aug 2023 14:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjHZO3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Aug 2023 10:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjHZO3c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Aug 2023 10:29:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A8D1FC7
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 07:29:30 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so390353266b.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693060169; x=1693664969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoHwOTKGuupL476rFcW8I642v+ujJo8hTqxA/kEoIVc=;
        b=yFKGic01iRVPyL4PsX55rDX8WIy7c6znpSM5R8aLe7RpP2VBqVwYhnRKZRjfQfvBkJ
         SVd9InmtFtKNB8srwsbuTS66sEYRqZ2KtjwaHberQH1SvHeqYDYW/Q6TGLRanL3NdEpb
         7xgifl+p3XTssLpg9RiB7OKGDuueJ1Sj1F0p2ydK+ELRu1bDqxbShFXVYfLJj+lK8uQr
         AdST1hMObcMpVt4oXJ6oZORjh560bj9PyOEnYSVbVCYSgA5iaSoglN7uekh1N5PIAu+m
         oCytOa8GlenkygJhgMH7P2sh+oUCPIeqhEhi3wRFZVx4BcSvzFvBV7QF6VG3YR9sfT4F
         YesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693060169; x=1693664969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoHwOTKGuupL476rFcW8I642v+ujJo8hTqxA/kEoIVc=;
        b=Wc3vctkisnPpMs3e6SoHRXIzXVTAdcNWV4g5Rf2C5Q4FYvLINKvqLPzJEy67DBLenC
         0/t5aVe1hP3fVHrkhvBn+Tg4SrdFbI7qo5nGEiAyk7S45VH+Vrg6EHdhrPXMPVXOxqdH
         Et05Z8OIzGFkAi4/A8agW/dpRA+wcOAb/HpcHVB6LwygatWIuN6RmH+fJA4g+ZtaDGdO
         aTs45C1/dZNuUVLT7P8vp2/1y8MICddD/sgwH+RBvsAs5XuMwdHjW9Aru8uK8yFszfjo
         BCVuUjwZJ9kadF0FisrIg9PpQ1Te6oiI1VcnyR/i6K7Jnk7ooho/4PeRVoNG/X6DiPXH
         RdJg==
X-Gm-Message-State: AOJu0YzWD+8B0cU2TbdOOiM2rjGzRxcEsYAQBIxan0XaQiX3GrotIENW
        ZRylCKgPQ3wirrwdctY8MSF0Xg==
X-Google-Smtp-Source: AGHT+IFFtNX5/1x+vPBsm+ndbnTzoPdNJBmv/tkhp3W8Qop5+BkHCGF+0A7SABanuHFJLm3T355oQw==
X-Received: by 2002:a17:907:7804:b0:9a1:914e:491a with SMTP id la4-20020a170907780400b009a1914e491amr19325263ejc.3.1693060169184;
        Sat, 26 Aug 2023 07:29:29 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id l8-20020a1709067d4800b009a1c4d04989sm2227595ejp.217.2023.08.26.07.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 07:29:28 -0700 (PDT)
Message-ID: <5847be93-68c3-95fb-1d3e-9678804b9a70@linaro.org>
Date:   Sat, 26 Aug 2023 16:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] clk: qcom: Add SM6115 LPASSCC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
 <20230825-topic-6115_lpasscc-v1-3-d4857be298e3@linaro.org>
 <a9d52cd9-845e-ff88-3c26-858cb6604e43@linaro.org>
 <CAA8EJprEnMjbKw2fbU1X7GV=ANARNhofSQh49Bdo1kvuOskbbQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprEnMjbKw2fbU1X7GV=ANARNhofSQh49Bdo1kvuOskbbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/08/2023 16:09, Dmitry Baryshkov wrote:

>>> +MODULE_DEVICE_TABLE(of, lpasscc_sm6115_match_table);
>>
>> Everything here is almost the same as sc8280xp one, so this should be
>> added to sc8280xp. You cut some boilerplate and additional driver.
> 
> We have been there. It quickly becomes a nightmare to maintain.
> Consider dispcc-sm8250.c

Because too much was added. I do not propose to keep all resets here.

> 
> But I agree with you, this code looks too similar. If we expect more
> similar lpasscc drivers, which provide no clocks, just several resets,
> maybe we can create a common generic wrapper and make resets lists
> corresponding driver data?

This would also work.

Best regards,
Krzysztof

