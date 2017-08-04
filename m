Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66jK+iAbKVsv6=4tb0470KBdwU+AHjWDnWwKKTY+U+W6g@mail.gmail.com>
References: <20170723102749.17323-1-icenowy@aosc.io>
 <20170723102749.17323-6-icenowy@aosc.io>
 <CAGb2v66jK+iAbKVsv6=4tb0470KBdwU+AHjWDnWwKKTY+U+W6g@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 4 Aug 2017 12:09:22 +0800
Message-ID: <CAGb2v67LWirnWuQzzkNx4MU6Z-pERJBr6vcVfdoddFwLC=FXoA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 05/10] clk: sunxi-ng: h3: gate then ungate
 PLL CPU clk after rate change
To: Chen-Yu Tsai <wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 26, 2017 at 3:14 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>> From: Chen-Yu Tsai <wens@csie.org>
>>
>> This patch utilizes the new PLL clk notifier to gate then ungate the
>> PLL CPU clock after rate changes. This should prevent any system hangs
>> resulting from cpufreq changes to the clk.
>>
>> Reported-by: Ondrej Jirman <megous@megous.com>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> Tested-by: Icenowy Zheng <icenowy@aosc.io>
>
> This is missing
>
> Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")

Applied for 4.14 with the Fixes tag and Stephen's ack.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
