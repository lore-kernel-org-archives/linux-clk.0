Return-Path: <jacobchen110@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com>
From: =?UTF-8?B?6ZmI6LGq?= <jacobchen110@gmail.com>
Date: Sun, 13 Nov 2016 00:02:20 +0800
Message-ID: <CAFLEztT+mCNqxKnaHYKYwKPPwiBH9fxJEcKAzio6oV0oW81eGw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add basic support for support for Rockchip RK1108 SOC
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, robh+dt@kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-clk@vger.kernel.org,
	briannorris@chromium.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-gpio@vger.kernel.org, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

patches 1-5 on rk1108-cvr-v10 board.
Tested-by: Jacob Chen <jacob2.chen@rock-chips.com>

2016-11-03 20:26 GMT+08:00 Andy Yan <andy.yan@rock-chips.com>:
>
> RK1108 is embedded with an ARM Cortex-A7 single core and a DSP core.
> It is designed for varies application scenario such as car DVR, sports
> DV, secure camera and UAV camera.
> This patch series add basic support for it, which can boot a board with
> initramfs into shell.
> More new feathers will come soon.
>
>
> Andy Yan (4):
>   pinctrl: rockchip: add support for rk1108
>   ARM: dts: add basic support for Rockchip RK1108 SOC
>   ARM: add low level debug uart for rk1108
>   ARM: dts: rockchip: add rockchip RK1108 Evaluation board
>
> Shawn Lin (2):
>   dt-bindings: rockchip-dw-mshc: add RK1108 dw-mshc description
>   clk: rockchip: add clock controller for rk1108
>
>  Documentation/devicetree/bindings/arm/rockchip.txt |   3 +
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |   1 +
>  arch/arm/Kconfig.debug                             |  30 ++
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/rk1108-evb.dts                   |  69 +++
>  arch/arm/boot/dts/rk1108.dtsi                      | 420 +++++++++++++++++++
>  arch/arm/mach-rockchip/rockchip.c                  |   1 +
>  drivers/clk/rockchip/Makefile                      |   1 +
>  drivers/clk/rockchip/clk-rk1108.c                  | 463 +++++++++++++++++++++
>  drivers/clk/rockchip/clk.h                         |  14 +
>  drivers/pinctrl/pinctrl-rockchip.c                 |  27 +-
>  include/dt-bindings/clock/rk1108-cru.h             | 308 ++++++++++++++
>  12 files changed, 1337 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/rk1108-evb.dts
>  create mode 100644 arch/arm/boot/dts/rk1108.dtsi
>  create mode 100644 drivers/clk/rockchip/clk-rk1108.c
>  create mode 100644 include/dt-bindings/clock/rk1108-cru.h
>
> --
> 2.7.4
>
>
