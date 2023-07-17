Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB2EEB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 12:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjGQMWE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 08:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjGQMWD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 08:22:03 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E3FD8
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 05:22:01 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3141c3a7547so4202964f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689596520; x=1692188520;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMAA88M8Z/93RtoRIAUU64QloDepHPouDJtQ0xvz1Fs=;
        b=wrEsWogMJQ2JL4V9KZL9DLxBxHrwZnxlc4BXb0izdLzR97PaMJ1ff7C5ZFusnrABJ/
         +uZ+9C5XFUfQulRJw/cgor17YzV7Y/oyVZDPlU5k1SHEjgOgBmCgjnVn6HX20XKXcWyP
         AbowoNdENYpfWRNXApsxt3E+vjQw+eK6bYD5vOyxCvgU1ANCJJl4hgnfZXAJGT4LCEKE
         Q8uo8LafdGVuZ6D5f9TQmBt5fSTwtSRMyK1VKyhXQt8B5sKraXii66qGP+zqzH3ELcRA
         Jcikmqlrk2KMJ5yg9EwQijrtPWP4Fc5kRa4++r7yZNz/jPOxFpBkLuAFex8GN6TUy9bY
         fhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689596520; x=1692188520;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMAA88M8Z/93RtoRIAUU64QloDepHPouDJtQ0xvz1Fs=;
        b=fpt2mmzx+uH5cpvbuHIoCXr9E8bdD3WkcewZkFpFtol+IEUjHWPFjM9+NKqmoZ8Cwx
         sz3hyDKq1fJo2swI2sLdx2Nz3dLTY3zD3r9UjUKVDqEjajmxOY0XENfW59uJOgMaG+e6
         Q3RP5ygk6KeOAVr3Crx9lOK0y8w0nyDNdyo4zwAD+y7RwAgXa9avwyhHUEg95F4Uz0sl
         9Q0LjAhHSaYAhyW2mQrLZQvpLwQ+br9ovnhORCEBeGHAnLqRsHXaw8NNbeHObjLJhcOw
         Y5fGNW8FWlZbKjDmwPOXimQ5xAYGv6VN/KcdVJmSZ947FG5Z1XBkZcqTEtF+0F6i09DE
         ZM+Q==
X-Gm-Message-State: ABy/qLYsVWNtcTwgpi3fz2JlD0tSKzTncqD3tqPbWl5CFd+48C2hKdOc
        i/tKwN2lL+PmtF8hSM5TWEi7WQ==
X-Google-Smtp-Source: APBJJlHLY6alj/T5BQnCm2wWxdtVAEKgFNKJX00IQJAWpV69kXciH127Aofl6aZo/pJHb9Yb9ACnrw==
X-Received: by 2002:a5d:4c41:0:b0:316:d887:624a with SMTP id n1-20020a5d4c41000000b00316d887624amr9821491wrt.15.1689596520155;
        Mon, 17 Jul 2023 05:22:00 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id y18-20020adffa52000000b00313f031876esm19040691wrr.43.2023.07.17.05.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 05:21:59 -0700 (PDT)
Message-ID: <dce349df-e3e6-7976-3b02-f5eac275b4ce@linaro.org>
Date:   Mon, 17 Jul 2023 14:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 01/19] clk: meson: introduce meson-clkc-utils
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v2-1-38172d17c27a@linaro.org>
 <1ja5w1xrly.fsf@starbuckisacylon.baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <1ja5w1xrly.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/07/2023 14:03, Jerome Brunet wrote:
> 
> On Mon 12 Jun 2023 at 11:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Let's introduce a new module called meson-clkc-utils that
>> will contain shared utility functions for all Amlogic clock
>> controller drivers.
>>
>> The first utility function is a replacement of of_clk_hw_onecell_get
>> in order to get rid of the NR_CLKS define in all Amlogic clock
>> drivers.
>>
>> The goal is to move all duplicate probe and init code in this module.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Hi Neil,
> 
> checkpatch complains about the MODULE_LICENSE()
> 
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> #185: FILE: drivers/clk/meson/meson-clkc-utils.c:25:
> +MODULE_LICENSE("GPL v2");

Damn, sorry for that

> 
> I don't mind fixing this up while applying if it is Ok with you.
> 

Yes please, I'm OoO and won't be able to send a v3 soonish.

Thanks,
Neil

>> ---
>>   drivers/clk/meson/Kconfig            |  3 +++
>>   drivers/clk/meson/Makefile           |  1 +
>>   drivers/clk/meson/meson-clkc-utils.c | 25 +++++++++++++++++++++++++
>>   drivers/clk/meson/meson-clkc-utils.h | 19 +++++++++++++++++++
>>   4 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 8ce846fdbe43..d03adad31318 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -30,6 +30,9 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>   	tristate
>>   	select COMMON_CLK_MESON_REGMAP
>>   
>> +config COMMON_CLK_MESON_CLKC_UTILS
>> +	tristate
>> +
>>   config COMMON_CLK_MESON_AO_CLKC
>>   	tristate
>>   	select COMMON_CLK_MESON_REGMAP
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index d5288662881d..cd961cc4f4db 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   # Amlogic clock drivers
>>   
>> +obj-$(CONFIG_COMMON_CLK_MESON_CLKC_UTILS) += meson-clkc-utils.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
>> diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
>> new file mode 100644
>> index 000000000000..9a0620bcc161
>> --- /dev/null
>> +++ b/drivers/clk/meson/meson-clkc-utils.c
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#include <linux/of_device.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include "meson-clkc-utils.h"
>> +
>> +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
>> +{
>> +	const struct meson_clk_hw_data *data = clk_hw_data;
>> +	unsigned int idx = clkspec->args[0];
>> +
>> +	if (idx >= data->num) {
>> +		pr_err("%s: invalid index %u\n", __func__, idx);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	return data->hws[idx];
>> +}
>> +EXPORT_SYMBOL_GPL(meson_clk_hw_get);
>> +
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> new file mode 100644
>> index 000000000000..fe6f40728949
>> --- /dev/null
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#ifndef __MESON_CLKC_UTILS_H__
>> +#define __MESON_CLKC_UTILS_H__
>> +
>> +#include <linux/of_device.h>
>> +#include <linux/clk-provider.h>
>> +
>> +struct meson_clk_hw_data {
>> +	struct clk_hw	**hws;
>> +	unsigned int	num;
>> +};
>> +
>> +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
>> +
>> +#endif
> 

