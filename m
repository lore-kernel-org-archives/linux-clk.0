Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org,  carlo@endlessm.com,  victor.wan@amlogic.com,  jerry.cao@amlogic.com,  xing.xu@amlogic.com
Subject: Re: [PATCH 7/7] arm64: dts: gxbb clock controller
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
	<1465518774-26924-8-git-send-email-mturquette@baylibre.com>
Date: Tue, 14 Jun 2016 12:01:26 -0700
In-Reply-To: <1465518774-26924-8-git-send-email-mturquette@baylibre.com>
	(Michael Turquette's message of "Thu, 9 Jun 2016 17:32:54 -0700")
Message-ID: <m260tbsigp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Michael Turquette <mturquette@baylibre.com> writes:

> Add the clock controller node for the AmLogic GXBB machine.
>
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 832815d..3badfab 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -174,5 +174,12 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
>  		};
> +
> +		clkc: clock-controller@c883c000 {
> +			compatible = "amlogic,gxbb-clkc";
> +			#clock-cells = <1>;
> +			reg = <0x0 0xc883c000 0x0 0x3db>;
> +		};
> +
>  	};
>  };

minor nit: could you put this under the (recently added) hibus node (at
offset 0).  See the DT in my for-next branch for reference:

https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/log/?h=for-next

Thanks,

Kevin
