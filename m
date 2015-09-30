Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1442915603.24403.2.camel@mtksdaap41>
References: <1442915603.24403.2.camel@mtksdaap41>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Wed, 30 Sep 2015 22:47:42 +0800
Message-ID: <CAGS+omDcsFXZ2AkS9tma_q+MRnsdDmit-nRXLWAcowRTNgXC=w@mail.gmail.com>
Subject: Re: [GIT PULL] clk: mediatek: New clocks support and fixes
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Pi-Cheng Chen <pi-cheng.chen@linaro.org>, linux-mediatek@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On Tue, Sep 22, 2015 at 5:53 PM, James Liao <jamesjj.liao@mediatek.com> wrote:
> This is a collection of new Mediatek clocks support and fixes. These
> patches come from Joe [1], Pi-cheng [2] and me [3], including clock
> support for subsystems, CPU, GPT and some minor fixes.
>
> [1] https://patchwork.kernel.org/patch/6777041/
> [2] https://patchwork.kernel.org/patch/7174721/
> [3] https://lkml.org/lkml/2015/8/10/194
>
> ----------------------------------------------------------------
>
> The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e8100fde:
>
>   Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)
>
> are available in the git repository at:
>
>   https://github.com/jamesjjliao/linux.git v4.3-rc2-clk
>
> for you to fetch changes up to 74219612bb7e25e64409171acada05d9949228f2:
>
>   arm64: dts: mt8173: Add subsystem clock controller device nodes (2015-07-09 12:58:14 +0800)
>

Will this be pulled for 4.3, or is it now destined for 4.4?
(sorry if you are receiving a duplicate email, the previous had HTML
and was rejected by the lists)

-Dan

> ----------------------------------------------------------------
>
> James Liao (9):
>   clk: mediatek: Removed unused dpi_ck clock from MT8173
>   clk: mediatek: Remove unused code from MT8173.
>   clk: mediatek: Add __initdata and __init for data and functions
>   clk: mediatek: Add fixed clocks support for Mediatek SoC.
>   clk: mediatek: Fix rate and dependency of MT8173 clocks
>   dt-bindings: ARM: Mediatek: Document devicetree bindings for clock
>     controllers
>   clk: mediatek: Add subsystem clocks of MT8173
>   clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS
>   arm64: dts: mt8173: Add subsystem clock controller device nodes
>
> Joe.C (1):
>   clk: mediatek: add 13mhz clock for MT8173
>
> pi-cheng.chen (1):
>   clk: mediatek: Export CPU mux clocks for CPU frequency control
>
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |   22 ++
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |   22 ++
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   22 ++
>  .../bindings/arm/mediatek/mediatek,vencltsys.txt   |   22 ++
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |   22 ++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   37 ++
>  drivers/clk/mediatek/Makefile                      |    2 +-
>  drivers/clk/mediatek/clk-apmixed.c                 |  107 ++++++
>  drivers/clk/mediatek/clk-cpumux.c                  |  127 +++++++
>  drivers/clk/mediatek/clk-cpumux.h                  |   22 ++
>  drivers/clk/mediatek/clk-gate.c                    |    2 +-
>  drivers/clk/mediatek/clk-mt8173.c                  |  370 +++++++++++++++++++-
>  drivers/clk/mediatek/clk-mtk.c                     |   36 +-
>  drivers/clk/mediatek/clk-mtk.h                     |   24 +-
>  drivers/clk/mediatek/clk-pll.c                     |    7 +-
>  include/dt-bindings/clock/mt8173-clk.h             |  106 +++++-
>  16 files changed, 916 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
>  create mode 100644 drivers/clk/mediatek/clk-apmixed.c
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.c
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.h
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
