Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777764E633;
	Mon, 11 Dec 2023 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKH4TrH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2B6C433CD;
	Mon, 11 Dec 2023 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316935;
	bh=9m905vifP5HBvlgj99tWmhjIICwDtm6qjhVzOXp83xE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GKH4TrH6FHRI5gusQzMsH77d3V0M3/itnmYsCdzAx+dn1nw/4WbOlHYi0LzDb9tKY
	 sLsi/JApn1pyOIg9VcT/J/Pq4ky/wPwCgwkEaQ0vBnEOdD5MqebGzG3KTvHRH1XF7n
	 v8aetIeM0ToBiMywzmbi+WFfbF7m5Qcu+25d3qs7ur8NpKH1NGW9+MncmDckM9BKrX
	 Xa7Js63x95/+ofEgKB7x0ALARN1UYr4Qrqz9I5PiRgWXzvN44V3H27OBdO0+CFUDdi
	 /f/3QMgXRcX58PvXgEgowUSgZ8CBQi2XwRhRgLblHMamY6je8noBxUmywf7Xdda49M
	 2Va6TC7iFE5nQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50bffb64178so5618942e87.2;
        Mon, 11 Dec 2023 09:48:55 -0800 (PST)
X-Gm-Message-State: AOJu0YxSgS73nZNTjhr6q3Sg19bQkBEvYoC3SPJ6zv1ppVrDE4sY9AYN
	K23j5WllYpw/dpAX0rdafn962d3/RO+qodsBEg==
X-Google-Smtp-Source: AGHT+IGn2Rj6s+Pbjh0z7FeFihgdozANftzWs+gyFN8lbLgY/Y4lXq/BTUcWCIB7vqtgGxnTT8kVxLnjDCJS1W5wJa8=
X-Received: by 2002:a05:6512:3156:b0:50b:f279:c9b with SMTP id
 s22-20020a056512315600b0050bf2790c9bmr1990684lfi.61.1702316934101; Mon, 11
 Dec 2023 09:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB495376DBED8EE897FE11A2B7BB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953C7AC3FEEDE191FA0845ABB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953C7AC3FEEDE191FA0845ABB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 11:48:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1y3mdfzLwr3sdeOGkRHaEPJo0Gr=g4Y6dAX=5AfTdfA@mail.gmail.com>
Message-ID: <CAL_Jsq+1y3mdfzLwr3sdeOGkRHaEPJo0Gr=g4Y6dAX=5AfTdfA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: sophgo: Add CV1800 series clock controller driver
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
	Liu Gui <kenneth.liu@sophgo.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, qiujingbao.dlmu@gmail.com, 
	dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 2:37=E2=80=AFAM Inochi Amaoto <inochiama@outlook.com=
> wrote:
>
> Add driver for CV1800 series clock controller.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/C=
V180X-Clock-v1.xlsx
> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/C=
V1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> ---
>  drivers/clk/Kconfig                    |    1 +
>  drivers/clk/Makefile                   |    1 +
>  drivers/clk/sophgo/Kconfig             |   12 +
>  drivers/clk/sophgo/Makefile            |    7 +
>  drivers/clk/sophgo/clk-cv1800.c        | 1574 ++++++++++++++++++++++++
>  drivers/clk/sophgo/clk-cv1800.h        |  123 ++
>  drivers/clk/sophgo/clk-cv18xx-common.c |   76 ++
>  drivers/clk/sophgo/clk-cv18xx-common.h |   85 ++
>  drivers/clk/sophgo/clk-cv18xx-ip.c     |  894 ++++++++++++++
>  drivers/clk/sophgo/clk-cv18xx-ip.h     |  266 ++++
>  drivers/clk/sophgo/clk-cv18xx-pll.c    |  465 +++++++
>  drivers/clk/sophgo/clk-cv18xx-pll.h    |   79 ++
>  12 files changed, 3583 insertions(+)
>  create mode 100644 drivers/clk/sophgo/Kconfig
>  create mode 100644 drivers/clk/sophgo/Makefile
>  create mode 100644 drivers/clk/sophgo/clk-cv1800.c
>  create mode 100644 drivers/clk/sophgo/clk-cv1800.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.h
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c30d0d396f7a..514343934fda 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -499,6 +499,7 @@ source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
>  source "drivers/clk/socfpga/Kconfig"
> +source "drivers/clk/sophgo/Kconfig"
>  source "drivers/clk/sprd/Kconfig"
>  source "drivers/clk/starfive/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index ed71f2e0ee36..eeae7ae93f89 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ROCKCHIP)         +=3D rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)       +=3D samsung/
>  obj-$(CONFIG_CLK_SIFIVE)               +=3D sifive/
>  obj-y                                  +=3D socfpga/
> +obj-y                                  +=3D sophgo/
>  obj-$(CONFIG_PLAT_SPEAR)               +=3D spear/
>  obj-y                                  +=3D sprd/
>  obj-$(CONFIG_ARCH_STI)                 +=3D st/
> diff --git a/drivers/clk/sophgo/Kconfig b/drivers/clk/sophgo/Kconfig
> new file mode 100644
> index 000000000000..d67009fa749f
> --- /dev/null
> +++ b/drivers/clk/sophgo/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# common clock support for SOPHGO SoC family.
> +
> +config CLK_SOPHGO_CV1800
> +       tristate "Support for the Sophgo CV1800 series SoCs clock control=
ler"
> +       default m
> +       depends on ARCH_SOPHGO || COMPILE_TEST
> +       help
> +         This driver supports clock controller of Sophgo CV18XX series S=
oC.
> +         The driver require a 25MHz Oscillator to function generate cloc=
k.
> +         It includes PLLs, common clock function and some vendor clock f=
or
> +         IPs of CV18XX series SoC
> diff --git a/drivers/clk/sophgo/Makefile b/drivers/clk/sophgo/Makefile
> new file mode 100644
> index 000000000000..a50320764200
> --- /dev/null
> +++ b/drivers/clk/sophgo/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_CLK_SOPHGO_CV1800)        +=3D clk-sophgo-cv1800.o
> +
> +clk-sophgo-cv1800-y            +=3D clk-cv1800.o
> +clk-sophgo-cv1800-y            +=3D clk-cv18xx-common.o
> +clk-sophgo-cv1800-y            +=3D clk-cv18xx-ip.o
> +clk-sophgo-cv1800-y            +=3D clk-cv18xx-pll.o
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> new file mode 100644
> index 000000000000..8176ee672190
> --- /dev/null
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -0,0 +1,1574 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of_address.h>
> +#include <linux/of_device.h>

You probably don't need these 2 headers and the implicit includes it
makes are dropped now in linux-next. Please check what you actually
need and make them explicit.

Rob
