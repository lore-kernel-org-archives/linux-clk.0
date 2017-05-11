Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-11-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-11-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 15:44:54 +0200
Message-ID: <CACRpkdYg7jLymwi14BMJ3p6oeOwjt+PLzQFC1S8e01v9dtw3=w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: dts: sun8i: Add board dts file for Banana
 Pi M2 Ultra
To: Icenowy Zheng <icenowy@aosc.io>, Eric Anholt <eric@anholt.net>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 4, 2017 at 3:50 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
>
> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
> form factor and position of various connectors, leds and buttons is
> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
> as the latest Banana Pi M64.
>
> It features:
>
>   - X-Powers AXP221s PMIC connected to i2c0
>   - 2 GB DDR3 DRAM
>   - 8 GB eMMC
>   - micro SD card slot
>   - DC power jack
>   - HDMI output
>   - MIPI DSI connector
>   - 2x USB 2.0 hosts
>   - 1x USB 2.0 OTG
>   - gigabit ethernet with Realtek RTL8211E transceiver
>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>   - SATA and power connectors for native SATA support
>   - camera sensor connector
>   - consumer IR receiver
>   - audio out headphone jack
>   - onboard microphone
>   - red, green, and blue LEDs
>   - debug UART pins
>   - Li-Po battery connector
>   - Raspberry Pi B+ compatible GPIO header
>   - power, reset, and boot control buttons
>
> This patch adds a dts file that enables debug UART and MMC support.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Eric put a lot of time and effort into naming the GPIO lines on the
other Pi board.

So please follow the good example and name the GPIO lines on this board
like in the other rpi boards, should be something like:

&pio {
    gpio-line-names = "...", "...";
};

This is very helpful for users.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
