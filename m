Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A00C04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbiI1PZ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbiI1PZ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:25:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F925C95E
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:25:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bq9so20366279wrb.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=sVNyuzRgaSSQwgseP126CfP3izP7hy9ohzvNsbujhrg=;
        b=cilbfysYS+ncpRMyRxeUJxXOm0CzTzrBK5dmXNwIXWrGnOLsGrW06CYNB2exX3B5kg
         VvB6v/x+NRjsDWlD/1sQL+gIYff2qHhaLnkDDvq5BCmyS0YOE1x4dV/g/w96aeetc9mc
         Nn4Qtp4wTiAItL4OciqGC2rcu8co+ny/VNzvuaLoZUcuUegzRVCXqFofv6MPmJwFGgp9
         WkElTEQMLzQuCHvRijeDKMV6iFGaCO7+xR5Vq+oBULZVcV+5Mzc1JepzSBOuZigIe7xw
         Bd+hHr0QzjjjKIo5YPwATQ6sulvCfrc3tS/vXZ6ZaZHaslcTlzIG0UUj2zIkQ5MsWhLi
         SETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=sVNyuzRgaSSQwgseP126CfP3izP7hy9ohzvNsbujhrg=;
        b=oZsvxmhAxyZMA0YTNKaH+H6hSDas/7/RAgw/SRve4kJtFGsYGY4ba/PkDWdzPGJ4Jh
         31VwBsk+0LKErrjhfHQY0lyrtdH3qbaM55ghM7Fwew4t8KHdQEu9RMcaMcqRa2ijCshB
         FjmN9ixKO2141v2RmDqA+T7SuKrTWaoLZP8l57Y1G7bmrEfmzvBMzD3B5u7XvvnM/XGd
         9A2XVOGGxhqG66U3GewII3aSPPzeaomlo8KWKmK9jl71fsLYON9IGCBsM1aHoPtpzxm1
         86phvKvortuGMsEE6b6PdY3TSLEPsRZEJUpiNJrldwPbuMdWLy7hERE+I4J2xl+9vPDr
         0wQw==
X-Gm-Message-State: ACrzQf0SIgzaG7mtdsYUBysj+WSb5s1FrINTwOEf2W9PmVB2pCZz85ek
        fpVjSjSHUbcS4lwkm5jOk3eqog==
X-Google-Smtp-Source: AMsMyM6MNSpnQW/Nh1Cc4LSOfvIBsHuohxqaQ5D8lBUirHntyTODnDPH9kIRrPwuyzclo9gY8k5UMQ==
X-Received: by 2002:a5d:6ace:0:b0:22a:f444:2ad3 with SMTP id u14-20020a5d6ace000000b0022af4442ad3mr20759187wrw.21.1664378707239;
        Wed, 28 Sep 2022 08:25:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c3b1100b003b476cabf1csm2890964wms.26.2022.09.28.08.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:25:06 -0700 (PDT)
Message-ID: <3f277f7d-401c-efd4-9885-7b128d6ef66a@linaro.org>
Date:   Wed, 28 Sep 2022 17:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/11] clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-7-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220928145958.376288-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/mmcc-msm8974.c | 74 ++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 37 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
