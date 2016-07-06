Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-5-git-send-email-serveralex@gmail.com>
In-Reply-To: <1467741391-60534-5-git-send-email-serveralex@gmail.com>
Message-ID: <146776520074.35356.1068171268289036149@resonance>
Subject: Re: [PATCH 4/7] meson: clk: Add CLKIDs for DT binding
Date: Tue, 05 Jul 2016 17:33:20 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Alexander,

Quoting Alexander M=C3=BCller (2016-07-05 10:56:28)
> +#define CLKID_AO_AHB_BUS       91
> +#define CLKID_AO_IFACE         92
>  =

> -#define CLK_NR_CLKS            (CLKID_MPEG_DIV + 1)
> +#define CLK_NR_CLKS            (CLKID_AO_IFACE + 1)

Did you take a look at how I did this for gxbb? I like to limit the
number of clocks exposed in DT as much as possible. This is because a DT
binding (of which this header is a part) constitutes an immutable ABI
which shall only be relinquished when the Sun burns out and our solar
system dies.

Also, putting NR_CLKS inside of the binding is kind of gross, since the
binding doesn't care about that value, but the driver does. The GXBB clk
driver has two headers: one internal to Linux with the bulk of the
clks and NR_CLKS, and a second one in the shared DT header chroot that
only exposes the bare minimum necessary.

Regards,
Mike
