Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 4/4] clk: sunxi-ng: Wait for lock when using fractional mode
Date: Mon, 31 Jul 2017 19:18:28 +0200
Message-ID: <2215267.q3CNAWEAR3@jernej-laptop>
In-Reply-To: <CAGb2v66FAYtsp39+5Aj2oZfyo=O=R1GJ11w3-vmJOysezsvcYg@mail.gmail.com>
References: <20170730164150.26302-1-jernej.skrabec@siol.net> <20170730164150.26302-5-jernej.skrabec@siol.net> <CAGb2v66FAYtsp39+5Aj2oZfyo=O=R1GJ11w3-vmJOysezsvcYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Chen-Yu,

Dne ponedeljek, 31. julij 2017 ob 07:02:18 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Jul 31, 2017 at 12:41 AM, Jernej Skrabec
> 
> <jernej.skrabec@siol.net> wrote:
> > Currently ccu_frac_helper_set_rate() doesn't wait for a lock bit to be
> > set before returning. Because of that, unstable clock may be used.
> > 
> > Add a wait for lock in the helper function.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Can you provide a Fixes: tag?

fixes: 89a3dfb78707 ("clk: sunxi-ng: Add fractional lib")

As we discussed on IRC, it is safe to call ccu_helper_wait_for_lock() even on 
platforms where lock bit is not present, since it just returns without effect.

Regards,
Jernej

> 
> Otherwise this looks good.
