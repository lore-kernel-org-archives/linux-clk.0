Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
To: Phil Elwell <phil@raspberrypi.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <35172597-5b6f-852a-c598-f25eb1a46aec@gmail.com>
Date: Mon, 12 Jun 2017 11:22:37 -0700
MIME-Version: 1.0
In-Reply-To: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/12/2017 07:25 AM, Phil Elwell wrote:
> Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
> declarations for the BCM2835 AUX IRQs.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
};
> diff --git a/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h b/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> new file mode 100644
> index 0000000..8b9fc12
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> @@ -0,0 +1,20 @@
> +/*
> + * Copyright (C) 2017 Raspberry Pi (Trading) Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.

Can we consider another license for this file? Most Device Tree files
seems to be under the ISC license.

Thanks!
-- 
Florian
