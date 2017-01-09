Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170105220823.5ai4yvcblmzmaey2@lukather>
References: <20161226162518.5367-1-icenowy@aosc.xyz>
 <20161226162518.5367-2-icenowy@aosc.xyz>
 <20170105220823.5ai4yvcblmzmaey2@lukather>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Jan 2017 15:47:35 +0100
Message-ID: <CACRpkdbZkJcPDquhspVcp6R01h-oJ13_YiShiQC7i=d2bZBfSA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drivers: pinctrl: add driver for Allwinner H5 SoC
To: Maxime Ripard <maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 5, 2017 at 11:08 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Dec 27, 2016 at 12:25:13AM +0800, Icenowy Zheng wrote:

>> +builtin_platform_driver(sun50i_h5_pinctrl_driver);
>
> This also looks very much like the H3. I'll post a patchset during the
> weekend to avoid duplicating those drivers. This was initially done
> for the sun5i, but it very much applies here.

I have applied Maxime's patch set from today.

Icenowy, please investigate the direction taken by Maxime
here for future revisions if needed.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
