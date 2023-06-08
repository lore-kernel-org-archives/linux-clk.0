Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D44C7EE23
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 12:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbjFHMyb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbjFHMyT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 08:54:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550CE3595
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 05:54:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30c4775d05bso403310f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 05:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228831; x=1688820831;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=InHp6AifXEpwXcgGbkL/ZV2RrHkvo9FL6i2UTJDIYB0=;
        b=ZDjW0Q9l7x0hBg8+IHtZmugU5k8Uhxr0Z9a1ve4J80evELnmIGFQaDnNTpcJ5LE646
         6pbpXJBkG3cBIAArHd3A/B6DMypdAlO2PN7LS2gj4wFM8sHjKiMEnlUUcjRCqdOQSnhJ
         4zGEOroi5yZoza7oi/5wQ/5aZQGMl4SYWTMMwDy3HW5tsCXKLAeVuf3tYURFOu5NGEkQ
         aA401kfru6nO4tuPIQg8GWuuMPlgd2SAO5ncTbb+fxRXUPNpWhHnIJyuZvlQf+cqR3Mt
         2yjuXzd4mWaNOTbs7uC8WbK63VkzZHyNnuTZBouRXe6WQPeuCAE0Qe0SXqVlWzuLxiy3
         9abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228831; x=1688820831;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InHp6AifXEpwXcgGbkL/ZV2RrHkvo9FL6i2UTJDIYB0=;
        b=IRnoGyWzheAVGg45domAysTsmIjKG9+/9e4bd6mNQNy2yNnaFRb3KV9brZ7G+5qmP6
         kOFgGoS7yX0D5ONcaxEgi9NMQh71kE/628ct4NuNjDrU785eOtdfr3DP5G+vdFLiH7w2
         mOsfplfhu3hpeq2w6uQZj5WhbcWloYiRpKdIpOY/bRUfLjHnXfzCCMeR6Nm0KJoB/yVj
         2e1aUAZrAl8fO3gdwhDSzwVLKsl1PlNja2CgrhF2IA7LNVmTZrfTf1OSs4gwWTFNeNvM
         XnC+kyr5ywqgGStIxOuWmCG8zLkI0WyMSdi2KLyER/lHgYpGmQTB9d+YXXF1+zG3ENWt
         JOVw==
X-Gm-Message-State: AC+VfDwDb1cyRDfwoGNFCdHG75SYNGl3PcD4+8/LT5AXS5Zg+SG0q9j7
        0FgXDE4Uhznkf5YXEzawMx5/3Q==
X-Google-Smtp-Source: ACHHUZ4oTgD6qat4+DrFYAq8xQnBw9gvkPPJOGVWwaYbnjBxuMA8auBmgKC3Rag8MC3HsFQv4HIigw==
X-Received: by 2002:a5d:590e:0:b0:30a:e81f:ef32 with SMTP id v14-20020a5d590e000000b0030ae81fef32mr7200688wrd.13.1686228831681;
        Thu, 08 Jun 2023 05:53:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6? ([2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003f7cb42fa20sm1906181wmg.42.2023.06.08.05.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:53:51 -0700 (PDT)
Message-ID: <638206ba-e2da-bb8e-a2e4-138af84648b4@linaro.org>
Date:   Thu, 8 Jun 2023 14:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/18] clk: meson: migrate a1 clock drivers out of
 hw_onecell_data to drop NR_CLKS
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
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-3-9676afa6b22c@linaro.org>
 <1jlegu9l5d.fsf@starbuckisacylon.baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <1jlegu9l5d.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2023 14:45, Jerome Brunet wrote:
>>   
>> +struct meson_a1_pll_clks {
>> +	struct clk_hw **hw_clks;
>> +	unsigned int hw_clk_num;
>> +};
>> +
>> +static struct meson_a1_pll_clks a1_pll_clks = {
>> +	.hw_clks = a1_pll_hw_clks,
>> +	.hw_clk_num = ARRAY_SIZE(a1_pll_hw_clks),
>> +};
>> +
>> +static struct clk_hw *meson_a1_pll_hw_get(struct of_phandle_args *clkspec, void *clk_data)
>> +{
>> +	const struct meson_a1_pll_clks *data = clk_data;
>> +	unsigned int idx = clkspec->args[0];
>> +
>> +	if (idx >= data->hw_clk_num) {
>> +		pr_err("%s: invalid index %u\n", __func__, idx);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	return data->hw_clks[idx];
>> +}
> 
> I'd prefer to have a single struct type and and single custom
> callback for the different SoC please.

Sure, I've written a common code for that, but I have a hard time finding
a proper naming for it... so I choosed meson-clkc since it could have
more common helper code for duplicated code over the clk driver:

===================================><============================================================================
diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 8ce846fdbe43..9070dcfd9e71 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -30,6 +30,9 @@ config COMMON_CLK_MESON_VID_PLL_DIV
  	tristate
  	select COMMON_CLK_MESON_REGMAP

+config COMMON_CLK_MESON_CLKC
+	tristate
+
  config COMMON_CLK_MESON_AO_CLKC
  	tristate
  	select COMMON_CLK_MESON_REGMAP
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index d5288662881d..13c6db466986 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -1,6 +1,7 @@
  # SPDX-License-Identifier: GPL-2.0-only
  # Amlogic clock drivers

+obj-$(CONFIG_COMMON_CLK_MESON_CLKC) += meson-clkc.o
  obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
  obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
  obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
diff --git a/drivers/clk/meson/meson-clkc.c b/drivers/clk/meson/meson-clkc.c
new file mode 100644
index 000000000000..fa98b9d09011
--- /dev/null
+++ b/drivers/clk/meson/meson-clkc.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include "meson-clkc.h"
+
+struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
+{
+	const struct meson_clk_hw_data *data = clk_hw_data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return data->hws[idx];
+}
+EXPORT_SYMBOL_GPL(meson_clk_hw_get);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-clkc.h b/drivers/clk/meson/meson-clkc.h
new file mode 100644
index 000000000000..e3bad2aa17eb
--- /dev/null
+++ b/drivers/clk/meson/meson-clkc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __MESON_HW_CLKC_H__
+#define __MESON_HW_CLKC_H__
+
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+
+struct meson_clk_hw_data {
+	struct clk_hw	**hws;
+	unsigned int	num;
+};
+
+struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
+
+#endif
===================================><============================================================================

If it's ok I'll send a v2 using this.

Thanks,
Neil
