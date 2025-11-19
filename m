Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E182F066D;
	Wed, 19 Nov 2025 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538248; cv=none; b=d94yOuwAhhVMxINQe3ASxebbBv5t8UpHwcDPqQPtV5IPEUqTQ6GIxxA0aS1tUGAsIccxbgrMMjrn9Stixg6vr5LsLSQbzUjcxspYvsHYXihNq8mSYEGhDSWTeNRqTXbPqcVC+4v5LFwyT4swzd8SJM8n2MmrL4ealwFkrXuSReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538248; c=relaxed/simple;
	bh=SXE3nXw7XOrEOQ/b+5rPODGnW8nNIRQBjWRoQoB8Khc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/nr61uLA8OSpoNoXD80R3tNpWLlWidLgVl6dEf1y1HcpdMV5PReVwmnKFI9TZ8SUo6am5L0C4+gTDm3vnFRpjf3yiWQtRspu4KcAMxo6FN238PZzWBnletTPpAXLmrAiU0LWN+oQjjncHVg5cjDNDqnZ89rog1M0oUmpKn3dBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCSA4//x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCSA4//x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636B3C19423;
	Wed, 19 Nov 2025 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538248;
	bh=SXE3nXw7XOrEOQ/b+5rPODGnW8nNIRQBjWRoQoB8Khc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCSA4//xIK7UVtJpvWGoPLClWBxjWjuWZOCmnragDxeurIuDXTnLOBmQ6OnK4i+Kk
	 QwmoEs1y4CJ0hzYArjE4EF7r3zskOasHAcqh12O9uaIBAeGoR4gTJA/mbjCBq647QH
	 lajHRYs9YoBQcGeBUuS5FCmc3jNux/FTYZdcErsgLkyIOU0vxMe1k5+lPG5z3hcngB
	 4PTuVE92g4Tdu4N4qbvcETNlbfngQdGmx8AuhahuIzS9BpqVgPWBVdeqeN4epXTfvt
	 Ww03LwVLn77urpcEPcHifbk+MwEKz6GCo6HjfRPlhr4WQyeLsuoLSP5oxtfCt7fthg
	 0ylOPs1752GhA==
Date: Wed, 19 Nov 2025 08:44:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, Frank.Li@nxp.com, hongxing.zhu@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx95: fix hsio_blk_ctl reg map
Message-ID: <20251119-speedy-delectable-hawk-93fade@kuoka>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
 <20251118074055.2523766-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118074055.2523766-4-xu.yang_2@nxp.com>

On Tue, Nov 18, 2025 at 03:40:55PM +0800, Xu Yang wrote:
> The HSIO block control register map should be 0x4c010000~0x4c01FFFF.
> Correct the start address and set length to 0x100 for available
> registers.
> 
> Fixes: 3c8d7b5d2bed ("arm64: dts: imx95: add ref clock for pcie nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 1292677cbe4e..21c9df445be0 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1774,9 +1774,9 @@ usb3_dwc3: usb@4c100000 {
>  			};
>  		};
>  
> -		hsio_blk_ctl: syscon@4c0100c0 {
> +		hsio_blk_ctl: syscon@4c010000 {
>  			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> -			reg = <0x0 0x4c0100c0 0x0 0x1>;
> +			reg = <0x0 0x4c010000 0x0 0x100>;
>  			#clock-cells = <1>;
>  			clocks = <&clk_sys100m>;
>  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> @@ -1844,7 +1844,7 @@ pcie0: pcie@4c300000 {
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> -				 <&hsio_blk_ctl 0>;
> +				 <&hsio_blk_ctl IMX95_CLK_HSIOMIX_PCIE_CLK_GATE>;

This is unrelated change, nothing explained in commit msg. Please do not
combine independent changes into one commit. Non-fixes with
fixes either

Best regards,
Krzysztof

