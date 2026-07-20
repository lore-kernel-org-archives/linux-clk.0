Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D77E432E75;
	Mon, 20 Jul 2026 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559984; cv=none; b=qQrCdKkOiaJxpEvIuVjJervLT9yry2pKtuoC8J81F8eZfjPTSt8LBYTDKWptMOgIOOYeRl3uTyW26S7jV0bgktWrQFhVRDj5dXyGI9XWjQnFMSoW0yEHv61uu/uUY7DwJVXBG1T2bJlWprqhhe0sa9JklKjvJJlPwuz+vmfBxQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559984; c=relaxed/simple;
	bh=/QIDt4LDCYGQcnJdj1Dx87jsIpu4s/yJXTsEwMTLmgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikoKyl1Kodthc2WPCyc6wUz0gZFsrdBk8p6A+Wma3lNbJbjRBUcD67XVY2v7ypr4EM54IFcSkQadDd1btWIHeaVknpFcMfClQexqHZO6N/lLmNC6yZn+L2MRa8uRkvr7sbX0kJ10xupz4zDnjvqTykr7Gwo/qDOzNFsCP+JcEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L3cegZmA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L3cegZmA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6FC7289;
	Mon, 20 Jul 2026 17:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784559922;
	bh=/QIDt4LDCYGQcnJdj1Dx87jsIpu4s/yJXTsEwMTLmgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3cegZmAnmCW2CNzqSdb2q8JVLanloll2EzhTtVk1ic2L5aFlHGrajBqIGJFe1rcy
	 o4Gglr/L8bi13h+aJFHIxGtpZw8MLBGC0YWlR4sXY5TASofRax5yZxxlsavmlyo/KX
	 82TdkU5WQOKXYQu8cuHOZcQY2WO2YdW846QVrbfI=
Date: Mon, 20 Jul 2026 18:06:20 +0300
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
Subject: Re: [PATCH v13 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260720150620.GA26742@killaraus.ideasonboard.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
 <20260720-csi_formatter-v13-2-4dc9a80e4cfd@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-csi_formatter-v13-2-4dc9a80e4cfd@oss.nxp.com>

Hello Guoniu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 05:59:47PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v13:
> - Add Reviewed-by tag from Frank and Krzysztof
> 
> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
> 
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
> 
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>  
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...

-- 
Regards,

Laurent Pinchart
