Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE02CE7A8C
	for <linux-clk@archiver.kernel.org>; Mon, 25 Sep 2023 09:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbjIYJGt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Sep 2023 05:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbjIYJGt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Sep 2023 05:06:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CD6D3
        for <linux-clk@vger.kernel.org>; Mon, 25 Sep 2023 02:06:41 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so5840583f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Sep 2023 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695632800; x=1696237600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81U+bAho6tv2ZGiC9bVpY2SK8WrqzTjp0FIVIQ6Q7Hs=;
        b=htM4xc4ePTiowBKwIB+Tjlnj/rQ1XQvuEts2NeicE9zvVrIWOlic0RYhiqCZJfolPd
         E5Z2CnkGwHdCHVBZtl4yhBhlmlSjSx1qjCPQGfHmcVNETwQ2ERgzYfiv3fHERSHY+xWk
         e6BrtZnmvmlmh5Wj1nHBpMoFX32JkANdKFH1gBJboiJvFduKbfYcbMd6YBRT31N2aKDA
         NGiBOelF/SBXtXYKs9MQ0UcNhO3DX0LcmeSCB68dI4q8FY6sEsEzwlYPPd9S9KG0QDMg
         MprcropNzmTTBvZJL4NdWwswYD0xqrO7KOGzInRcN1OxVcQLRD3Xq+bDdVZmYxMfJWQE
         1QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695632800; x=1696237600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81U+bAho6tv2ZGiC9bVpY2SK8WrqzTjp0FIVIQ6Q7Hs=;
        b=Wm8p+Z4Eba3Oy/dqBJYOT1kbYHXWgHkzw9p7d0kGKCGYwlL71mkglvA7Lch9AmMJGX
         4HDH8jQTMSIRmb3vfKFIjMyQal1EcqDZcUakimmPk6AL+Z8/62qyo3YrQoNtJf79mObz
         XL0mEjaD3MrJEiXgzmherJeZ2k0L7JxW2w8/kz9hptJ5f8Vl4amjkl/NglunWwo9I4iM
         F/ZoYB46b9Y2M0BIWRccQm4uwWeLyp/2/hfoRLZCtYrOXGtHgK9Zf2LGzrrG8TXz5lQ2
         iGpiyPTZwqm6e0nuM1pzO9lQzosP5aoebpFzvwtmT//abP5ZZirUvqFgWbgbQLdMr/07
         rLWw==
X-Gm-Message-State: AOJu0YwukUb+OsfwNJ6SspReDI8DoIv7af5EPP15KR3Sp3iqiHhp96Z+
        XDj/w8gSPCOuu69OoDaMHMZM7wwuJJL5NnsEY2Q=
X-Google-Smtp-Source: AGHT+IGUJgJsDCBH6bmCvUPLYKLjFd40iunFFF6Tx2JQZ53PhXz9k00Dk9bx7cNGJsP5xLR0sHi9yA==
X-Received: by 2002:a5d:4802:0:b0:314:3fc0:ba82 with SMTP id l2-20020a5d4802000000b003143fc0ba82mr5434290wrq.37.1695632800191;
        Mon, 25 Sep 2023 02:06:40 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u21-20020adfa195000000b00323293bd023sm2121244wru.6.2023.09.25.02.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 02:06:39 -0700 (PDT)
Message-ID: <cce93def-17f3-4ea3-a4d9-1c1773f90928@linaro.org>
Date:   Mon, 25 Sep 2023 10:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230923150045.1068556-1-bryan.odonoghue@linaro.org>
 <20230923150045.1068556-4-bryan.odonoghue@linaro.org>
 <2678d8a5-4101-4fc3-9f9d-cbe616eee131@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2678d8a5-4101-4fc3-9f9d-cbe616eee131@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/09/2023 09:51, Konrad Dybcio wrote:
> On 23.09.2023 17:00, Bryan O'Donoghue wrote:
>> Add the sc8280xp CAMCC driver which follows the sdm845 CAMCC lineage
>> with additional CCI and IFE blocks and more granular clock parentage.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/Kconfig          |    9 +
>>   drivers/clk/qcom/Makefile         |    1 +
>>   drivers/clk/qcom/camcc-sc8280xp.c | 3051 +++++++++++++++++++++++++++++
>>   3 files changed, 3061 insertions(+)
>>   create mode 100644 drivers/clk/qcom/camcc-sc8280xp.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 4b72e98eaa70..5ce6d888aba0 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -426,6 +426,15 @@ config SC_CAMCC_7280
>>   	  Say Y if you want to support camera devices and functionality such as
>>   	  capturing pictures.
>>   
>> +config SC_CAMCC_8280XP
>> +	tristate "SC8280XP Camera Clock Controller"
>> +	select SC_GCC_8280XP
>> +	help
>> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
>> +	  SC8280XP devices.
>> +	  Say Y if you want to support camera devices and functionality such as
>> +	  capturing pictures.
>> +
>>   config SC_DISPCC_7180
>>   	tristate "SC7180 Display Clock Controller"
>>   	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index a301b08dba05..8f66cefa9e57 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -68,6 +68,7 @@ obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
>>   obj-$(CONFIG_QDU_GCC_1000) += gcc-qdu1000.o
>>   obj-$(CONFIG_SC_CAMCC_7180) += camcc-sc7180.o
>>   obj-$(CONFIG_SC_CAMCC_7280) += camcc-sc7280.o
>> +obj-$(CONFIG_SC_CAMCC_8280XP) += camcc-sc8280xp.o
>>   obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
>>   obj-$(CONFIG_SC_DISPCC_7280) += dispcc-sc7280.o
>>   obj-$(CONFIG_SC_DISPCC_8280XP) += dispcc-sc8280xp.o
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
>> new file mode 100644
>> index 000000000000..fbb3fa39862c
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -0,0 +1,3051 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <dt-bindings/clock/qcom,camcc-sc8280xp.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
>> +	DT_SLEEP_CLK,
>> +};
> This enum here is so that
> 
> [...]
> 
>> +static struct clk_alpha_pll cam_cc_pll0 = {
>> +	.offset = 0x0,
>> +	.vco_table = lucid_vco,
>> +	.num_vco = ARRAY_SIZE(lucid_vco),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
>> +	.clkr = {
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "cam_cc_pll0",
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "bi_tcxo", .name = "bi_tcxo",
> you can use .index = <some enum member> here
> 

Hmm. I actually think I _removed_ those indexes from the reference code.

doh !

> [...]
> 
>> +
>> +static const struct clk_parent_data cam_cc_parent_data_0[] = {
>> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> also in these arrays
> 
> [...]
> 
>> +static struct gdsc bps_gdsc = {
>> +	.gdscr = 0x7004,
>> +	.pd = {
>> +		.name = "bps_gdsc",
>> +	},
>> +	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> HW_CTRL means "hardware controlled mode is always on", not
> "hardware controlled mode is available". Is that what you want?

That's what the downstream flags

drivers/clk/qcom/camcc-sc7180.c::bps_gdsc
drivers/clk/qcom/camcc-sc7280.c::bps_gdsc
drivers/clk/qcom/camcc-sdm845.c::bps_gdsc
drivers/clk/qcom/camcc-sm8250.c::bps_gdsc
drivers/clk/qcom/camcc-sm8450.c::bps_gdsc

etc

> Also, does this clock controller not take GCC_CAMERA_AHB_CLK as
> input?

it does yeah.

---
bod

