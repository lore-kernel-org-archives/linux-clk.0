Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 17 Mar 2017 10:13:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Guodong Xu <guodong.xu@linaro.org>,
	John Stultz <john.stultz@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	mike.leach@linaro.org, Suzuki.Poulose@arm.com, sudeep.holla@arm.com
Subject: Re: [PATCH v4 1/7] coresight: bindings for CPU debug module
Message-ID: <20170317161335.GB20435@linaro.org>
References: <1489762943-25849-1-git-send-email-leo.yan@linaro.org>
 <1489762943-25849-2-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489762943-25849-2-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 17, 2017 at 11:02:17PM +0800, Leo Yan wrote:
> According to ARMv8 architecture reference manual (ARM DDI 0487A.k)
> Chapter 'Part H: External debug', the CPU can integrate debug module
> and it can support self-hosted debug and external debug. Especially
> for supporting self-hosted debug, this means the program can access
> the debug module from mmio region; and usually the mmio region is
> integrated with coresight.
> 
> So add document for binding debug component, includes binding to APB
> clock; and also need specify the CPU node which the debug module is
> dedicated to specific CPU.
> 
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../bindings/arm/coresight-cpu-debug.txt           | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> new file mode 100644
> index 0000000..f6855c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> @@ -0,0 +1,46 @@
> +* CoreSight CPU Debug Component:
> +
> +CoreSight cpu debug component are compliant with the ARMv8 architecture
> +reference manual (ARM DDI 0487A.k) Chapter 'Part H: External debug'. The
> +external debug module is mainly used for two modes: self-hosted debug and
> +external debug, and it can be accessed from mmio region from Coresight
> +and eventually the debug module connects with CPU for debugging. And the
> +debug module provides sample-based profiling extension, which can be used
> +to sample CPU program counter, secure state and exception level, etc;
> +usually every CPU has one dedicated debug module to be connected.
> +
> +Required properties:
> +
> +- compatible : should be
> +	     * "arm,coresight-cpu-debug"; supplemented with "arm,primecell"
> +	       since this driver is using the AMBA bus interface.

This description needs to be refactored - see my comment from an earlier post
for more details.

> +
> +- reg : physical base address and length of the register set.
> +
> +- clocks : the clock associated to this component.
> +
> +- clock-names : the name of the clock referenced by the code. Since we are
> +                using the AMBA framework, the name of the clock providing
> +		the interconnect should be "apb_pclk" and the clock is
> +		mandatory. The interface between the debug logic and the
> +		processor core is clocked by the internal CPU clock, so it
> +		is enabled with CPU clock by default.
> +
> +- cpu : the cpu phandle the debug module is affined to. When omitted
> +	the module is considered to belong to CPU0.
> +
> +Optional properties:

s/properties/property

> +
> +- power-domains: a phandle to power domain node for debug module. We can
> +		 use "nohlt" to ensure CPU power domain is enabled.

The "power-domains" property is to take care of the debug power domain.  The
"nohlt" is to make sure registers in the CPU power domain are accessible - both
are independent from one another.  As such the description for this binding
shoudl be:

"a phandle to the debug power domain".

Thanks,
Mathieu

> +
> +
> +Example:
> +
> +	debug@f6590000 {
> +		compatible = "arm,coresight-cpu-debug","arm,primecell";
> +		reg = <0 0xf6590000 0 0x1000>;
> +		clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu0>;
> +	};
> -- 
> 2.7.4
> 
