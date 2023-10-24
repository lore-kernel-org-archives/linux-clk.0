Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9036C00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 09:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjJXJkM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 05:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjJXJkL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 05:40:11 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D2E10C2
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 02:40:07 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso36484505e9.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698140406; x=1698745206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5f7lk/sUG2K+sQIa3tjkVyEh0bsGlRfNvy9ZFNdKNY=;
        b=QTQWkmhc0BqLIA8qDMKzNV2MkliYchZ7Dxm897HUywGCxC6j1/b4focsMmuvLrL8PN
         TPChlrWSht0h/dOBDIxH6gl092z6jR/R4HGSp6S+WChgS/XoiKQPozVztn0SBb45GXup
         rMmiTJa5HJ/CjvaqQfDzIsgrMLzvgesglTxeNPv3ScBwUJGKu3Uli7AvoCkaxFBefguZ
         HGFnWh+IWNEtazj99eEbtJGSMw9QQLm2ONhy3arCjh78WB5t3loK74+LsbB/cSDetIWm
         OjciaiQGT79d/r0Ss7chH0bDBfdrpIT5HcLtanr82JCIGfw9+5WKrSKfBR2Amy5fMUXe
         j4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140406; x=1698745206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5f7lk/sUG2K+sQIa3tjkVyEh0bsGlRfNvy9ZFNdKNY=;
        b=U2FHmVl81O4JXu8U8ILNOL2x+a0d/QoSymVtGNf/WNnvunowca7BZXSN8BikwOmIW2
         v7/tuS8f4kfLgDsy6ggeGeJOIDlCgtvfG+/RblHcTYE1Hotljtwp7ndaP44EMwn+1U0u
         sjKaClHqgfrxdrG8hoRY/08VHbCr3tmD4OOnpusnrMGVXHKoMR/iBtna4ezLnNY/tZ1k
         dlR6uyJt538rz+BFoYSX42UFzJvrBSWhWYtUDNs/aux+VxFhLcGPuW8Mo3yiAfxO23ti
         sHi/LDeK0xLyy2aDC6xrgTOgdW89KB4ZvYboDUiCO92kCRMnzelETLDHBdwfivU1Pday
         07hQ==
X-Gm-Message-State: AOJu0Ywel5B4yuonCweCpKlNxgnICS7XjC6wQZ9zTvPJlKDuy/ndBrfI
        0N9syUm2ANYDpQwcCRPJLh34Eg==
X-Google-Smtp-Source: AGHT+IE5TFlYkZdpsRZM+iH9l+SKXhZgWmaMXLLCnEWvyFWT59f5AvnVu7eLhTN1BnA5As6Hb9uDhw==
X-Received: by 2002:a05:600c:3109:b0:408:5bc6:a7d with SMTP id g9-20020a05600c310900b004085bc60a7dmr6475543wmo.19.1698140405732;
        Tue, 24 Oct 2023 02:40:05 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c1d1600b004042dbb8925sm16576200wms.38.2023.10.24.02.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:40:05 -0700 (PDT)
Message-ID: <866d5582-a4e2-4b98-a291-6e41939bd9f3@linaro.org>
Date:   Tue, 24 Oct 2023 10:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, quic_tdas@quicinc.com, robh+dt@kernel.org,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231023153821.189331-1-bryan.odonoghue@linaro.org>
 <20231023153821.189331-4-bryan.odonoghue@linaro.org>
 <aef93a48cf270d5078ccdc39d95113a4.sboyd@kernel.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aef93a48cf270d5078ccdc39d95113a4.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/10/2023 01:34, Stephen Boyd wrote:
> Quoting Bryan O'Donoghue (2023-10-23 08:38:20)
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
>> new file mode 100644
>> index 000000000000..0631bd5fad57
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -0,0 +1,3048 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
> 
> Is this include used?
> 
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
> 
> Should be mod_devicetable.h instead?
> 
>> +#include <linux/of.h>
> 
> Is this include used?
> 
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/pm_runtime.h>
> 
> This got included twice.
> 
>> +
>> +#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>> +
>> +#include "clk-alpha-pll.h"

You're right, I didn't scrub the autogen headers.

Update sent as v3.2.

---
bod
