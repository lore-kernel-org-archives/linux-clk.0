Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Richard Genoud <richard.genoud@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180313152702.21070-1-richard.genoud@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>,
 stable@vger.kernel.org
References: <20180313152702.21070-1-richard.genoud@gmail.com>
Message-ID: <152149322220.242365.11252668841166595824@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: mvebu: armada-38x: add support for missing clocks
Date: Mon, 19 Mar 2018 14:00:22 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Richard Genoud (2018-03-13 08:27:02)
> Clearfog boards can come with a CPU clocked at 1600MHz (commercial)
> or 1333MHz (industrial).
> =

> They have also some dip-switches to select a different clock (666, 800,
> 1066, 1200).
> =

> The funny thing is that the recovery button is on the MPP34 fq selector.
> So, when booting an industrial board with this button down, the frequency
> 666MHz is selected (and the kernel didn't boot).
> =

> This patch add all the missing clocks.
> =

> The only mode I didn't test is 2GHz (uboot found 4294MHz instead :/ ).
> =

> Fixes: 0e85aeced4d6 ("clk: mvebu: add clock support for Armada 380/385")
> Cc: <stable@vger.kernel.org> # 3.16.x: 9593f4f56cf5: clk: mvebu: armada-3=
8x: add support for 1866MHz variants
> Cc: <stable@vger.kernel.org> # 3.16.x
> =

> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next
