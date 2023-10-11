Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD02CD6E54
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 10:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345729AbjJKK0H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 06:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbjJKK0G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 06:26:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8265B7
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:26:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40566f8a093so61376565e9.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697019960; x=1697624760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vz9dCTUAJHMkFUSxm9pCk3ylD/I/tndawRxu31ITP+g=;
        b=NbroL8VydLiF/5U4EpkKQ4StM5WWEKQ35TLnXoAKraN3kIydq9kiZUazLDgb7GXc53
         ws3SVH8R7oOqfIhjow3dpzQTzGS4NoH97txFgFCCp7TEdTS6TSI20tnxwkMuI+BQzujV
         ufO1yBUTKCRp7XXzKxpTeEKKyxyZUEstXvB0/Ji2hRz2QmEMGjX3/4Ry0BZMb5lo5IoF
         D/zBmMwmY1+BryQG9juaGKG3+Y7/iuh1LNk3OmcEOCCQ15mK+aG+X5aXFTbn77JKsaVK
         u2lem2HO369VCMEBkOyKvgmLQAoPct7EupxjWnR4Lkl+NmNtNjHhcHbMm47pFll9EeDs
         zHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697019960; x=1697624760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vz9dCTUAJHMkFUSxm9pCk3ylD/I/tndawRxu31ITP+g=;
        b=IChJSbchT5O8DKiFNTOKgEaq7sR6pD+8J5IqsTkxtRtmDY4fmeYJF8sl2KzCT1PKGY
         K+h/a9IihDk8g1WZ7nEyLsAlVIslPOPw6tnnXwvQiVNZxuqBq0+nPVtcH4m7/3FF0Nc6
         kp1MZ0A4npyS+SAKhxuPTb7axUrO9w+I+ZJwP1MDgJtQlVksk/CyuWjhGOFP3dMmRtrO
         ME0G6ofD5df2tyvfUg0TmO05Qu6xr5w1IJf1tGCDqUJLBl3OxEwtOP1FZEVkTmpezWXj
         jRkx1K1QCJXuEPn3fNl0+lKIWid4XjT0VrqMFlXPL6IzSI4az0iPTfgMD5NPhu3oevIp
         G/rg==
X-Gm-Message-State: AOJu0Yz9SjUdjek4Z5UUlQbr0tbZ1pkRkcxHb18EWDEi4kxsWsFjtfRv
        1gReRhU6i31gnwrgDMIwP4wM3A==
X-Google-Smtp-Source: AGHT+IHg9KTXtScFiRCbZ8fBRugfwTlzviYfywyydhnaZBwWrCVCnC/2QxDGezuFnwgYpHW1pqa8WA==
X-Received: by 2002:adf:ef91:0:b0:31f:f1f4:ca8b with SMTP id d17-20020adfef91000000b0031ff1f4ca8bmr16588499wro.40.1697019960263;
        Wed, 11 Oct 2023 03:26:00 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j16-20020adff010000000b0032008f99216sm15058111wro.96.2023.10.11.03.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:25:59 -0700 (PDT)
Message-ID: <10bcb0cc-19db-4914-bbc4-ef79c238a70d@linaro.org>
Date:   Wed, 11 Oct 2023 11:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] clk: qcom: add clock controller driver for
 qca8386/qca8084
Content-Language: en-US
To:     Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230923112105.18102-1-quic_luoj@quicinc.com>
 <20230923112105.18102-5-quic_luoj@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230923112105.18102-5-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/09/2023 12:21, Luo Jie wrote:
> The clock controller driver of qca8386/qca8084 is registered
> as the MDIO device, the hardware register is accessed by MDIO bus
> that is normally used to access general PHY device, which is
> different from the current existed qcom clock controller drivers
> using ioremap to access hardware clock registers.

"nsscc-qca8k is accessed via an MDIO bus"

> MDIO bus is common utilized by both qca8386/qca8084 and other

commonly

> PHY devices, so the mutex lock mdio_bus->mdio_lock should be
> used instead of using the mutex lock of remap.
> 
> To access the hardware clock registers of qca8386/qca8084, there
> is special MDIO frame sequence(three MDIO read/write operations)
> need to be sent to device.

"there is a special MDIO frame sequence"

"which needs to be sent to the device"

the following indentation splat from checkpatch

CHECK: Alignment should match open parenthesis
#2071: FILE: drivers/clk/qcom/nsscc-qca8k.c:2004:
+		ret = __mdiobus_write(bus, switch_phy_id, (reg | 
QCA8K_REG_DATA_UPPER_16_BITS),
+				upper_16_bits(val));

CHECK: Alignment should match open parenthesis
#2131: FILE: drivers/clk/qcom/nsscc-qca8k.c:2064:
+static int qca8k_regmap_update_bits(void *context, unsigned int regaddr,
+		unsigned int mask, unsigned int value)

total: 0 errors, 1 warnings, 2 checks, 2162 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0004-clk-qcom-add-clock-controller-driver-for-qca8386-qca.patch has 
style problems, please review.

Once fixed

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
