Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-1-icenowy@aosc.xyz>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Feb 2017 15:56:30 +0100
Message-ID: <CACRpkdaGXbXDsrpN4-EY6C5OountFfU8JfbnhX+71GDVi7F0uQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] Add support for Allwinner R40 SoC
To: Icenowy Zheng <icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Feb 17, 2017 at 6:37 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:

> This patchset is an experiment to add R40 support to mainline Linux.
>
> As we have still no user manual for R40, the patchset is developed
> by reading the BSP source code and device tree, educated guess and
> try and error.

Out of curiosity: does the board support use the mainline drivers
as starting point? I.e. does it build on top of the community work done
by Maxime & others?

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
