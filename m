Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B019E97B;
	Mon, 22 Jun 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111016; cv=none; b=ofsLFa3DjAEN3jzYah04yYIrhG4uynCb4zrVjek0j6GMU5mz+1hx3/p9YgN4m/u8ql735wrhNn4ySOryaUzIpY7PXYzxl7bI8DDsmgbABV/kjf9QdY1x0OG+hugHs4mHo3HBGVNx6CePh76JH7mpS6Llrjh1ZZi7PqY4LVWjME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111016; c=relaxed/simple;
	bh=5H6XifqywxaAVV0/hryS5+1Nj+z6wQMhvhSJ1VE9Pns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvYkX05CgdWxMIndfc7AHDntPNU1Rj5s//7TbcEnLZKaQ99tcN6qThqS8SzhZGIJHulljrI8UOPOqefxzWNoyYeiUEcx7dSTMHDYnfK8UmmBBDkrBQK2cxcZ6Shoh3XVY7lCSwWkG2hdreSxCuMskoEahBgF4NJw3/Gcto87YCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUcvahCn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUcvahCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785621F000E9;
	Mon, 22 Jun 2026 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111015;
	bh=AE2b1Rn9vfLTVVEPttskMNsAr+Hsn4NycpgaiI4qn4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUcvahCnIwwrZZImhiv+n854ZNgVM3ko57w5UawDsEJw9uDSwM9HmPAATwWErihCq
	 jUjjCdGQm1PXwPIb4qnXJtwCx2oqAq87rDONcpjikE+lySWRd+B04d7QG16qigsmwP
	 Iue0i8UvcYNi5oL7NaiuN+ss/HrxE4u3kMREz+cStYhgGR22bac4G6Sok7ZF1LIABS
	 K+oCXUq2eBFyxCw8RlqiBiq+/u8KKWn+kI4UAWiE7k+dk+UC01hS0K0hG0RqIFTL9T
	 EU9w3TV365xKIdkBTvMps6J3KLXI029V6czi311N2pscDdQ6vDvHz09zyUWU3GUvYk
	 gSezYnub6rKtA==
Date: Mon, 22 Jun 2026 08:50:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 3/4] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260622-independent-meticulous-skunk-4fb221@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>

On Thu, Jun 18, 2026 at 05:41:37PM +0800, guoniu.zhou@oss.nxp.com wrote:
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
> ---
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
> 
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 64 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 534fa219d9f9..b4d0a7670fac 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -46,7 +46,27 @@ required:
>    - power-domains
>    - clocks
>  
> -additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      properties:
> +        '#address-cells':
> +          const: 1
> +        '#size-cells':
> +          const: 1

These should go to top-level. In if:then:else: you only narrow them,
e.g. you disallow for other variants (": false").

if:
then:
....
  required:
   ....
else:
  properties:
    '#address-cells': false

> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$':
> +          type: object
> +          $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#

This as well should be in top-level and here you only disallow it for
other variants.

You can avoid cross-tree dependencies by using compatible style:
https://elixir.bootlin.com/linux/v7.1-rc6/source/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml#L41


Best regards,
Krzysztof

