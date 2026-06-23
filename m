Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A734574B;
	Tue, 23 Jun 2026 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782193292; cv=none; b=vCeoE+g8uheUJgeHScNOd+feu5Zx2rZEPNaZQHX3+Q9hCb1H3zYQzCkyrhPE2uBV7hQzV4VRYwMFv0zbBUyUtjG7BryP8fokDv2MObryckI1k1YDylqzsOotN930yzZiIGGmMiDJR7LSGAnsnIbDdO+ntVqFlKY60B4xS6C97Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782193292; c=relaxed/simple;
	bh=rlUGgG8la12dhvk5dTmShiyslO4u/LVZD6v6PyOhp7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+VC0fV8tJFP6CCEGDYn4TGQEosBZ5+gPa87/2W0jihluALBnMyZYRjZygQqm5BfLJ07hScNjUBvcHXstbpVaSB/ycrpcrdgNommOVyRTQs4/Yy3+AKC6DgaZvf67GtjXT5UckEM2nw35lXGP4fYPUo+ZB19tlLZ9gHX9haX0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAMeygWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAMeygWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F18A1F000E9;
	Tue, 23 Jun 2026 05:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782193291;
	bh=UsklUiDfmK9iaunr/gPFUp7u6fnB/rBKqPmk8gmUckE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAMeygWbsv7CpFdY5KyofiGjr0H8WL2rJO65QchDYVO5+FyXHcw+iy4knsory8B3t
	 fje9IlAFmpI7t+WMLUi8sUo4NGX92JBEKzqrWdp5MoeOlCJqcyTV9PF70Rwf4k+WOa
	 RT0aPtoVm18rOmK5Uq84dRse73WN2oclNQw6LKZeS/73jolM6j6GpxBmplojJCTQ2B
	 aHy+36as+uHS64EuZ1/BayQm83wyDkWypDUx06hdUiXLjc/QmAgwZCc8udt/WVsfaj
	 s6gxX8iMDhWi92XzGkYdVVITjBQ39X/M+WSxgPrufegEhPBykVwxDA181A96sKcNn8
	 AgbGW3kbT2Eiw==
Date: Tue, 23 Jun 2026 07:41:27 +0200
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
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260623-influential-space-inchworm-17a7ea@quoll>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
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
> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

