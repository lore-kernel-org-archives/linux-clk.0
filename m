Return-Path: <pombredanne@nexb.com>
MIME-Version: 1.0
In-Reply-To: <20171207125715.16160-3-chunyan.zhang@spreadtrum.com>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com> <20171207125715.16160-3-chunyan.zhang@spreadtrum.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 7 Dec 2017 14:25:04 +0100
Message-ID: <CAOFm3uEuftL5HuRvg+huPkLHEYUAVQzkGfZD0Ksd00Z+e41P=Q@mail.gmail.com>
Subject: Re: [PATCH V7 02/12] clk: sprd: Add common infrastructure
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>,
	Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Dear Chunyan,

On Thu, Dec 7, 2017 at 1:57 PM, Chunyan Zhang
<chunyan.zhang@spreadtrum.com> wrote:
> Added Spreadtrum's clock driver framework together with common
> structures and interface functions.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

> --- /dev/null
> +++ b/drivers/clk/sprd/common.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Spreadtrum clock infrastructure
> +//
> +// Copyright (C) 2017 Spreadtrum, Inc.
> +// Author: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

Thank you++ for using SPDX ids!

Acked-by:  Philippe Ombredanne <pombredanne@nexb.com>

-- 
Cordially
Philippe Ombredanne
