Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="g7CWAWM7"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188351723
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 05:12:58 -0800 (PST)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 803E13F0F8
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702041175;
	bh=K9zgZeSUkIRgWWjMY0ssDLpumUX4eiD6JCn0PCUYG1U=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=g7CWAWM7LE9NDgp2iKsRf2J/mJ4VMrzl2ALULKIIOlaUq0QL3AuCpp8Mc7/KuLKGq
	 CVFqMrDV5eY390FzA/fbciqRTAHZhYg1XHD9SJBedYokhXOuh59qgWTbRNRNgyVZOx
	 vhWvHsON3ixKlsEccpdL53XFEX+ZJZEmyq+CFSI/LlR1DSSiE/SbmyHW/cTOsHWQmq
	 fFl+bT62l3Kzrg7cUpaVwKx/omysURH0qUjoAv05MDmCLvtBmQdFXJubGTaI3yHTnB
	 Y190X4LFM/VyKQ2nYYt38a6h0suow/AFwMxpLvilzME7R+1qDKNchC1hzx1wyNSzBS
	 7WRnbQo7aKCUg==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42592a3a6c9so24349171cf.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2023 05:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041174; x=1702645974;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9zgZeSUkIRgWWjMY0ssDLpumUX4eiD6JCn0PCUYG1U=;
        b=ms5a4j8OAwwmDovAj4QNCtGVYtAdpTmyjtuZd9CDEwTMQN+8tKJVbaBORh9RrORiGd
         s+DQ3aKBuH9syPIHZ30ajP4xJfTgXX0ohSLNx0pWI4MCudmzH3iH8t/EZ+Yiwih/9srQ
         7Vv3gFxQtVjGPH0zQImRo8PH2EBdrg13jmAhwJTaLydeDVQgkqTXVuPuqqIloQ64UmjG
         iTeKd+xfSpvtB5jxvE4uInEmzaPbpgkAC0NUNQJWhmu/oWZlbLyvXtNXs0YK01Vw9Im9
         2A7wj/ahojyWhQ3dq6tJuPNlWWmcpRb8DFZ8k1PhxmVjspZwtjFxsGU9bKsLnVF7Z52K
         T2iw==
X-Gm-Message-State: AOJu0YwjvTg9R/f3cCnKSY/s5nGeHFK2OgKi+mw+wX16CID8Ht5zdTn1
	LcIB2EU0l3f7THTI8ANhQN9N054+zkf6zsPiWHflo1iWcI3+kePmVEfp5XwHARVVZk7F1HtlRdO
	s6lO0aileSJdf5aZh9K69cWeGxrLoX+RV+iZKozne1OKohJ5QqDTtmw==
X-Received: by 2002:a05:622a:44d:b0:425:4054:bc5e with SMTP id o13-20020a05622a044d00b004254054bc5emr1204024qtx.58.1702041174445;
        Fri, 08 Dec 2023 05:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMDwD1ffbD4BKzlSumuMZD3sOD+sywLn2kwgwb+azE8LEIA/r3L2mxNLPHVXDnFbuSkerKtd9gx6pjrsRIO9Y=
X-Received: by 2002:a05:622a:44d:b0:425:4054:bc5e with SMTP id
 o13-20020a05622a044d00b004254054bc5emr1204009qtx.58.1702041174155; Fri, 08
 Dec 2023 05:12:54 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:12:53 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-2-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-2-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:12:53 -0500
Message-ID: <CAJM55Z8uDFH1cmNdqLBy3sdF5ddxA5N1Mf_oeOmEiDg0z03AHg@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] reset: starfive: Rename file name "jh71x0" to "common"
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
Content-Type: text/plain; charset="UTF-8"

Sia Jee Heng wrote:
> StarFive JH8100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the "jh71x0" naming convention are renamed to use the
> "common" wording.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c              | 2 +-
>  drivers/reset/starfive/Kconfig                              | 6 +++---
>  drivers/reset/starfive/Makefile                             | 2 +-
>  .../{reset-starfive-jh71x0.c => reset-starfive-common.c}    | 4 ++--
>  .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 6 +++---
>  drivers/reset/starfive/reset-starfive-jh7100.c              | 2 +-
>  drivers/reset/starfive/reset-starfive-jh7110.c              | 4 ++--
>  .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 4 ++--
>  8 files changed, 15 insertions(+), 15 deletions(-)
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (97%)
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (75%)
>  rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (81%)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 3884eff9fe93..6e45c580c9ba 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -14,7 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include <soc/starfive/reset-starfive-jh71x0.h>
> +#include <soc/starfive/reset-starfive-common.h>
>
>  #include <dt-bindings/clock/starfive,jh7110-crg.h>
>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index d832339f61bc..29fbcf1a7d83 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
> -config RESET_STARFIVE_JH71X0
> +config RESET_STARFIVE_COMMON
>  	bool
>
>  config RESET_STARFIVE_JH7100
>  	bool "StarFive JH7100 Reset Driver"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select RESET_STARFIVE_JH71X0
> +	select RESET_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7100 SoC.
> @@ -15,7 +15,7 @@ config RESET_STARFIVE_JH7110
>  	bool "StarFive JH7110 Reset Driver"
>  	depends on CLK_STARFIVE_JH7110_SYS
>  	select AUXILIARY_BUS
> -	select RESET_STARFIVE_JH71X0
> +	select RESET_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> index 7a44b66fb9d5..582e4c160bd4 100644
> --- a/drivers/reset/starfive/Makefile
> +++ b/drivers/reset/starfive/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
> +obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
>
>  obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
>  obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-common.c
> similarity index 97%
> rename from drivers/reset/starfive/reset-starfive-jh71x0.c
> rename to drivers/reset/starfive/reset-starfive-common.c
> index 55bbbd2de52c..dab454e46bbf 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Reset driver for the StarFive JH71X0 SoCs
> + * Reset driver for the StarFive SoCs
>   *
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -12,7 +12,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/spinlock.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-common.h
> similarity index 75%
> rename from drivers/reset/starfive/reset-starfive-jh71x0.h
> rename to drivers/reset/starfive/reset-starfive-common.h
> index db7d39a87f87..266acc4b2caf 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -3,12 +3,12 @@
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
>
> -#ifndef __RESET_STARFIVE_JH71X0_H
> -#define __RESET_STARFIVE_JH71X0_H
> +#ifndef __RESET_STARFIVE_COMMON_H
> +#define __RESET_STARFIVE_COMMON_H
>
>  int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
>  				   void __iomem *assert, void __iomem *status,
>  				   const u32 *asserted, unsigned int nr_resets,
>  				   struct module *owner);
>
> -#endif /* __RESET_STARFIVE_JH71X0_H */
> +#endif /* __RESET_STARFIVE_COMMON_H */
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
> index 2a56f7fd4ba7..546dea2e5811 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -8,7 +8,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  #include <dt-bindings/reset/starfive-jh7100.h>
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 29a43f0f2ad6..87dba01491ae 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -7,9 +7,9 @@
>
>  #include <linux/auxiliary_bus.h>
>
> -#include <soc/starfive/reset-starfive-jh71x0.h>
> +#include <soc/starfive/reset-starfive-common.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  #include <dt-bindings/reset/starfive,jh7110-crg.h>
>
> diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-common.h
> similarity index 81%
> rename from include/soc/starfive/reset-starfive-jh71x0.h
> rename to include/soc/starfive/reset-starfive-common.h
> index 47b486ececc5..56d8f413cf18 100644
> --- a/include/soc/starfive/reset-starfive-jh71x0.h
> +++ b/include/soc/starfive/reset-starfive-common.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __SOC_STARFIVE_RESET_JH71X0_H
> -#define __SOC_STARFIVE_RESET_JH71X0_H
> +#ifndef __SOC_STARFIVE_RESET_COMMON_H
> +#define __SOC_STARFIVE_RESET_COMMON_H
>
>  #include <linux/auxiliary_bus.h>
>  #include <linux/compiler_types.h>
> --
> 2.34.1
>
