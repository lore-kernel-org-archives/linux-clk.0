Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 12 Sep 2016 10:37:03 -0500
From: Rob Herring <robh@kernel.org>
To: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH v2 1/3] Documentation: dtb: xgene: Add PMD clock binding
Message-ID: <20160912153703.GA26444@rob-hp-laptop>
References: <1472863255-32337-1-git-send-email-hotran@apm.com>
 <1472863255-32337-2-git-send-email-hotran@apm.com>
MIME-Version: 1.0
In-Reply-To: <1472863255-32337-2-git-send-email-hotran@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Duc Dang <dhdang@apm.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, lho@apm.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 02, 2016 at 05:40:53PM -0700, Hoan Tran wrote:
> Add APM X-Gene clock binding documentation for PMD clock.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---
>  Documentation/devicetree/bindings/clock/xgene.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xgene.txt b/Documentation/devicetree/bindings/clock/xgene.txt
> index 82f9638..e6e12ae 100644
> --- a/Documentation/devicetree/bindings/clock/xgene.txt
> +++ b/Documentation/devicetree/bindings/clock/xgene.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible : shall be one of the following:
>  	"apm,xgene-socpll-clock" - for a X-Gene SoC PLL clock
>  	"apm,xgene-pcppll-clock" - for a X-Gene PCP PLL clock
> +	"apm,xgene-pmd-clock" - for a X-Gene PMD clock
>  	"apm,xgene-device-clock" - for a X-Gene device clock
>  	"apm,xgene-socpll-v2-clock" - for a X-Gene SoC PLL v2 clock
>  	"apm,xgene-pcppll-v2-clock" - for a X-Gene PCP PLL v2 clock
> @@ -22,6 +23,15 @@ Required properties for SoC or PCP PLL clocks:
>  Optional properties for PLL clocks:
>  - clock-names : shall be the name of the PLL. If missing, use the device name.
>  
> +Required properties for PMD clocks:
> +- reg : shall be the physical register address for the pmd clock.
> +- clocks : shall be the input parent clock phandle for the clock.
> +- #clock-cells : shall be set to 1.
> +- clock-output-names : shall be the name of the clock referenced by derive
> +  clock.
> +Optional properties for PLL clocks:
> +- clock-names : shall be the name of the clock. If missing, use the device name.
> +
>  Required properties for device clocks:
>  - reg : shall be a list of address and length pairs describing the CSR
>           reset and/or the divider. Either may be omitted, but at least
> @@ -59,6 +69,14 @@ For example:
>  		type = <0>;
>  	};
>  
> +	pmd0clk: pmd0clk {

Needs a unit address.

> +		compatible = "apm,xgene-pmd-clock";
> +		#clock-cells = <1>;
> +		clocks = <&pmdpll 0>;
> +		reg = <0x0 0x7E200200 0x0 0x10>;

Lowercase hex please.

With those,

Acked-by: Rob Herring <robh@kernel.org>


> +		clock-output-names = "pmd0clk";
> +	};
> +
>  	socpll: socpll@17000120 {
>  		compatible = "apm,xgene-socpll-clock";
>  		#clock-cells = <1>;
> -- 
> 1.9.1
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
