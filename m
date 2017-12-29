Return-Path: <pombredanne@nexb.com>
MIME-Version: 1.0
In-Reply-To: <20171228135634.30000-7-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net> <20171228135634.30000-1-paul@crapouillou.net>
 <20171228135634.30000-7-paul@crapouillou.net>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Fri, 29 Dec 2017 13:55:12 +0100
Message-ID: <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] clk: Add Ingenic jz4770 CGU driver
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Linux MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Dear Mr Crapouillou-Cercueil-Sir,

On Thu, Dec 28, 2017 at 2:56 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> Add support for the clocks provided by the CGU in the Ingenic JZ4770
> SoC.

<snip>

> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -0,0 +1,487 @@
> +/*
> + * JZ4770 SoC CGU driver
> + *
> + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later
> + * as published by the Free Software Foundation.
> + */

Do you mind using a simpler one-line SPDX identifier instead of this
fine but clearly crapouillish legalese boilerplate? Unless you are
trying to turn the kernel in a legal compendium, of course ;)

This is documented in Thomas doc patches. This would apply to your
entire patch set.
Thank you for your kind consideration!
-- 
Cordially
Philippe Ombredanne
