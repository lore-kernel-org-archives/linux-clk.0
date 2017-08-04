Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66bFjcB6CwNM+QDAqUxETqE6XX1UWKwqM_XAt6dOsjhLA@mail.gmail.com>
References: <20170723102749.17323-1-icenowy@aosc.io>
 <20170723102749.17323-7-icenowy@aosc.io>
 <CAGb2v66bFjcB6CwNM+QDAqUxETqE6XX1UWKwqM_XAt6dOsjhLA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 4 Aug 2017 12:10:22 +0800
Message-ID: <CAGb2v65z32ykkn8nw3ez7SrAkxDUofvcpFb+Y18VMZqgGmZ31A@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 06/10] clk: sunxi-ng: allow set parent clock
 (PLL_CPUX) for CPUX clock on H3
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

On Mon, Jul 24, 2017 at 11:10 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>> The CPUX clock, which is the main clock of the ARM core on Allwinner H3,
>> can be adjusted by changing the frequency of the PLL_CPUX clock.
>>
>> Allowing setting parent clock for the CPUX clock, thus the PLL_CPUX
>> clock can be adjusted when adjusting the CPUX clock.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>
> Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied for 4.14 with the Fixes tag and Stephen's ack.

ChenYu

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
