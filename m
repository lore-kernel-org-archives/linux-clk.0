Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 18:31:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>,
	Geng Ren <geng.ren@spreadtrum.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V1 3/9] clk: sprd: add gate clock support
Message-ID: <20170620013130.GI4493@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-4-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170618015855.27738-4-chunyan.zhang@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/18, Chunyan Zhang wrote:
> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
> index 8f802b2..333e2b2 100644
> --- a/drivers/clk/sprd/Makefile
> +++ b/drivers/clk/sprd/Makefile
> @@ -1,3 +1,3 @@
>  ifneq ($(CONFIG_OF),)
> -obj-y	+= ccu_common.o
> +obj-y	+= ccu_common.o ccu_gate.o

Can this be built as a module?

>  endif
> diff --git a/drivers/clk/sprd/ccu_gate.c b/drivers/clk/sprd/ccu_gate.c
> new file mode 100644
> index 0000000..3d27615
> --- /dev/null
> +++ b/drivers/clk/sprd/ccu_gate.c
> @@ -0,0 +1,102 @@
> +/*
> + * Spreadtrum gate clock driver
> + *
> + * Copyright (C) 2017 Spreadtrum, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "ccu_gate.h"
> +
> +DEFINE_SPINLOCK(gate_lock);

This variable name is not very unique for debugging lockdep
reports. Probably needs 'sprd' in the name.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
