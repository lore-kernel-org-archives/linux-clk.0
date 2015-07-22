Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:17176 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756684AbbGVN2M convert rfc822-to-8bit
	(ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 22 Jul 2015 09:28:12 -0400
Date: Wed, 22 Jul 2015 14:28:09 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 6/8] arm64: dts: add SRAM, MHU mailbox and SCPI
 support on Juno
Message-ID: <20150722132809.GG14923@e106497-lin.cambridge.arm.com>
References: <1433760002-24120-1-git-send-email-sudeep.holla@arm.com>
 <1433760002-24120-7-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
In-Reply-To: <1433760002-24120-7-git-send-email-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 08, 2015 at 11:40:00AM +0100, Sudeep Holla wrote:
> This patch adds support for the MHU mailbox peripheral used on Juno by
> application processors to communicate with remote SCP handling most of
> the CPU/system power management. It also adds the SRAM reserving the
> shared memory and SCPI message protocol using that shared memory.
> 
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi   | 31 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/arm/juno-clocks.dtsi | 23 +++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index e3ee96036eca..f8069a98da25 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -17,6 +17,18 @@
>  		};
>  	};
>  
> +	mailbox: mhu@2b1f0000 {
> +		compatible = "arm,mhu", "arm,primecell";
> +		reg = <0x0 0x2b1f0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "mhu_lpri_rx",
> +				  "mhu_hpri_rx";
> +		#mbox-cells = <1>;
> +		clocks = <&soc_refclk100mhz>;
> +		clock-names = "apb_pclk";
> +	};
> +
>  	gic: interrupt-controller@2c010000 {
>  		compatible = "arm,gic-400", "arm,cortex-a15-gic";
>  		reg = <0x0 0x2c010000 0 0x1000>,
> @@ -44,6 +56,25 @@
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	sram: sram@2e000000 {
> +		compatible = "arm,juno-sram-ns", "mmio-sram";
> +		reg = <0x0 0x2e000000 0x0 0x8000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0x2e000000 0x8000>;
> +
> +		cpu_scp_lpri: scp-shmem@0 {
> +			compatible = "arm,juno-scp-shmem";
> +			reg = <0x0 0x200>;
> +		};
> +
> +		cpu_scp_hpri: scp-shmem@200 {
> +			compatible = "arm,juno-scp-shmem";
> +			reg = <0x200 0x200>;
> +		};
> +	};
> +
>  	/include/ "juno-clocks.dtsi"
>  
>  	dma@7ff00000 {
> diff --git a/arch/arm64/boot/dts/arm/juno-clocks.dtsi b/arch/arm64/boot/dts/arm/juno-clocks.dtsi
> index 25352ed943e6..64af7370815a 100644
> --- a/arch/arm64/boot/dts/arm/juno-clocks.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-clocks.dtsi
> @@ -42,3 +42,26 @@
>  		clock-frequency = <400000000>;
>  		clock-output-names = "faxi_clk";
>  	};
> +
> +	scpi {
> +		compatible = "arm,scpi";
> +		mboxes = <&mailbox 1>;
> +		shmem = <&cpu_scp_hpri>;
> +
> +		clocks {
> +			compatible = "arm,scpi-clocks";
> +
> +			scpi_dvfs: scpi_clocks@0 {
> +				compatible = "arm,scpi-dvfs-clocks";
> +				#clock-cells = <1>;
> +				clock-indices = <0>, <1>, <2>;
> +				clock-output-names = "vbig", "vlittle", "vgpu";
> +			};
> +			scpi_clk: scpi_clocks@3 {
> +				compatible = "arm,scpi-variable-clocks";
> +				#clock-cells = <1>;
> +				clock-indices = <3>, <4>;

Subject to you addressing Mark's comments regarding the indices values (maybe choose
a different property to show the fact that the index is actually an SCPI index
rather than the clock's), you can add my

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Best regards,
Liviu


> +				clock-output-names = "pxlclk0", "pxlclk1";
> +			};
> +		};
> +	};
> -- 
> 1.9.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

