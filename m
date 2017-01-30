Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-2-icenowy@aosc.xyz>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-2-icenowy@aosc.xyz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jan 2017 16:13:50 +0100
Message-ID: <CACRpkdY=+wAVZtWjeW+jKq_s+YX17L7xUeZ14_sAyd8KCm6+kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drivers: pinctrl: add driver for Allwinner H5 SoC
To: Icenowy Zheng <icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 26, 2017 at 4:48 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:

> Based on the Allwinner H5 datasheet and the pinctrl driver of the
> backward-compatible H3 this introduces the pin multiplex assignments for
> the H5 SoC.
>
> H5 introduced some more pin functions (e.g. three more groups of TS
> pins, and one more groups of SIM pins) than H3.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v2:
> - Fixed interrupt banks. (There's one more GPIO banks (PF) that can do
>   interrupt handling on H5)

Patch applied with Maxime's ACK.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
