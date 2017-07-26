Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:39254 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdGZHPH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2017 03:15:07 -0400
MIME-Version: 1.0
In-Reply-To: <20170723102749.17323-6-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io> <20170723102749.17323-6-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 26 Jul 2017 15:14:43 +0800
Message-ID: <CAGb2v66jK+iAbKVsv6=4tb0470KBdwU+AHjWDnWwKKTY+U+W6g@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 05/10] clk: sunxi-ng: h3: gate then ungate
 PLL CPU clk after rate change
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> This patch utilizes the new PLL clk notifier to gate then ungate the
> PLL CPU clock after rate changes. This should prevent any system hangs
> resulting from cpufreq changes to the clk.
>
> Reported-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Icenowy Zheng <icenowy@aosc.io>

This is missing

Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")

ChenYu
