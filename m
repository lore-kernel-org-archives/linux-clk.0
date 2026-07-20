Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7240431A59;
	Mon, 20 Jul 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559971; cv=none; b=mGRCt6iVA2hJAACl7qv3hpstZnSqE+1VsPAT7pDP5rJMzITiLLGAogDEtuXa5Obd9khzRF7LVMPk58Y3mkwZwUHBMNEil72QOfYJAFCWM5rft0fCSx29BEJEFMSUPog5Ogt7UGyBqFzrUVhVJaKTYjI2LFTXQRLBZgcvjfXg6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559971; c=relaxed/simple;
	bh=kx2U3JzsAJE/W0InIkz6dN6aTr44P0qWHwoMKu4ZJ68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8aVrcGRIfkyad2JQ585+OPLsusLrPdtQLSGOhRuuPcFimZzVtR8tBgY+cQ9YCdrWn0TCM/XHRNTITE3ejyoxYsiVsD+aQD7XvlibFu6wf50WBycL9yc4ml60+zc+YO93SvEovQqzOiUY0fJ/bJsruKY5DQ8bh7VFX556t/dXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bXYdBR+5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bXYdBR+5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51D76289;
	Mon, 20 Jul 2026 17:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784559908;
	bh=kx2U3JzsAJE/W0InIkz6dN6aTr44P0qWHwoMKu4ZJ68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXYdBR+5FvG2b17Bc1D4J6FIL6CHtumZ4wPEVZMShKSWykoXKiyfHvqCbS55s/PTF
	 pHHB7qyYt0BykwdCGAtjoE1rBL9qt0OiNR+pIw1PYattdRLbczEcUM5KdZFDLfI9Lh
	 t/ojktcf4tAd2pLuBoOD1ZkVe9IrmFwiYWALWriQ=
Date: Mon, 20 Jul 2026 18:06:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v13 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260720150605.GA27524@killaraus.ideasonboard.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
 <20260720-csi_formatter-v13-1-4dc9a80e4cfd@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-csi_formatter-v13-1-4dc9a80e4cfd@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 05:59:46PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v11:
> - Add Rb tags from Frank Li and Krzysztof Kozlowski
> 
> Changes in v10:
> - Drop syscon parent node from example
> - Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
> - Add description for reg property
> - Add space after formatter@20 before opening brace in example
> - Enhance the port description with more detailed information
> - Delete the blank line immediately following the endpoint in example
> 
> Changes in v9:
> - Use direct node instead of syscon wrapper in example
> 
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml
> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
> 
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> new file mode 100644
> index 000000000000..58c4e1cc056b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX95 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> +  and non-pixel data from the CSI-2 host controller and reformat them to
> +  match Pixel Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +    description: Register offset and size within the parent syscon
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port, connects to ISI input via Pixel Link (PL)
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
