Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16116223DEF;
	Wed, 15 Oct 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535199; cv=none; b=lnjIGLimXlmhJWB1RE4RdrpdNkYB1S9MKvDdwbICNCEmH+gZRSr6ovVyrCf7VN49Khc8H7a8Wb/KbwFFtKxgdPIFbPZeWTzETI8Fqe/3bOBbwHkwP+0gSPHCk3NMIC2g0Z9tCBWibZ03QBmrZcb/Q7TA/rzjS7ahr1igXYsvCT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535199; c=relaxed/simple;
	bh=3fz9KGNaQakjQB6EQzIxoVQtqjKXznasDpV8NOPgPuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHKtg9wj13BPTC/+2FWO7rU32Oh4xcOHb2/ad8VqJ1TRGxYZKOzYxFmE0mBgCFCNIQuUw1cJE/j6cb/h+sutze/YLjyrCZTLbsfDD+nVByyG/b5I6hiWDJU7K1uqiw8wDb5Pvefb34FEPw3oVZKWlIdTYl5xYr8ATw6KVFJRhvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rz/cv0jG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rz/cv0jG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559D5C4CEF8;
	Wed, 15 Oct 2025 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535197;
	bh=3fz9KGNaQakjQB6EQzIxoVQtqjKXznasDpV8NOPgPuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rz/cv0jGa6pcHdPzjjI1OM8wpBajf6uLdiwhQUjIwwa/08P9M/cr0zt05mHYbGzUK
	 pap+MlEKcpQWolJ4vJYl77nEIi6aTDGVnrh2/dHbbz3AB2m0+CbqmYAeY+/43BXpAZ
	 nU1X0VzsbhDXvWvb/CKzy8DN1iM2qdMPqTvgWUXtZpeACYkz/ARmZBjUtMmi47peiv
	 HIbrkj584SyBB/tJYeQz/7Z2SJNMV281XhoF3xnBSGApzpfCfHsZEX+wQ2luvZxRhO
	 0qSJOTwfU95lhsoyRTxgYH8XXrdMTpt8r/jKCwtEGVd66+lDNjniYl0p3IppvQ0rca
	 pdMbGAjZ42upQ==
Date: Wed, 15 Oct 2025 08:33:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
Message-ID: <20251015133315.GA3263713-robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-39-marek.vasut@mailbox.org>

On Sat, Oct 11, 2025 at 06:51:53PM +0200, Marek Vasut wrote:
> i.MX95 DISPLAY STREAM_CSR includes registers to control DSI PHY settings.
> Add dt-schema for it.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../imx/nxp,imx95-display-stream-csr.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> new file mode 100644
> index 0000000000000..61153120c9378
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx95-display-stream-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX95 Display Stream Block Control
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,imx95-display-stream-csr
> +          - nxp,imx95-master-stream-csr
> +          - nxp,imx95-mipi-tx-phy-csr

'-csr' seems redundant.

> +      - const: syscon
