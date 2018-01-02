Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:48738 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751386AbeABIav (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 03:30:51 -0500
MIME-Version: 1.0
In-Reply-To: <20171230113043.30237-6-icenowy@aosc.io>
References: <20171230113043.30237-1-icenowy@aosc.io> <20171230113043.30237-6-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2018 16:30:25 +0800
Message-ID: <CAGb2v67XbeyWDcCBjaVygSAHbAk25spRVkWAS3dAU6DbwkGzOg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/6] arm64: allwinner: a64: add simplefb
 for A64 SoC
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The A64 SoC features two display pipelines, one has a LCD output, the
> other has a HDMI output.
>
> Add support for simplefb for these pipelines on A64 SoC.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Dropped extra clocks.
> - Added labels to the SimpleFB device tree nodes as boards may have
>   extra regulator for display pipeline.
>
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index fb8ea7c414e1..d803c115d362 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -42,9 +42,11 @@
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
>
> +#include <dt-bindings/clock/sun8i-de2.h>
>  #include <dt-bindings/clock/sun50i-a64-ccu.h>
>  #include <dt-bindings/clock/sun8i-r-ccu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/sun8i-de2.h>

Nit: This isn't used anywhere. Please add it when DE2 DRM support is added.

ChenYu
