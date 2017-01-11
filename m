Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170103151629.19447-4-icenowy@aosc.xyz>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-4-icenowy@aosc.xyz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jan 2017 16:24:43 +0100
Message-ID: <CACRpkdZaAz6JBovLAYAx4mmv1PwrMeKN36ip2HM4S0u3dH2Hwg@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: sunxi: add driver for V3s SoC
To: Icenowy Zheng <icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 3, 2017 at 4:16 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:

> V3s SoC features only a pin controller (for the lack of CPUs part).
>
> Add a driver for this controller.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
