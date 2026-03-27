Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2B2494ED;
	Fri, 27 Mar 2026 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596467; cv=none; b=FoH+I1xzOWCIfuOLdqQEyeYwVbV6RXeLgOYGSPAGRn8aWs4OtKDPVmL4xQOKo9onFOEXuvsDQpIQWs1sOyCjspKge9Zn6n6tEaYAmRAj6zCTs3OBTzoHNl0hOZvwAzoeaGeenyga8kNokpOYeBh+vckFPIaz5pR2SnNZjxYCAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596467; c=relaxed/simple;
	bh=MCVzKj0IwMKiyZBuXwlPOEx7tDkpVOQV0iBLV4nD+0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnL8NGzHuw5jrplMJHUhXFmPZDSGb5oQ/4jNMAtni/j6pdClo1wzWZ9Ov1hq0vHVIGhUhnieQRuL9bPqeU7/n85GtDtQ7yz67ibGvZI3H+t3JjK1qj2XW3ygn5a+qPM2ggUuQpKZSd9ADxzKA019JaW+Yz3s5FbAaUaiSeSNI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzR1m7VU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzR1m7VU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF35C19423;
	Fri, 27 Mar 2026 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596466;
	bh=MCVzKj0IwMKiyZBuXwlPOEx7tDkpVOQV0iBLV4nD+0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzR1m7VU+m3n7hqd0FwRCWj8NCiLUYdas3mWtiJjg4l2PnT9Qv6C5wNAGfA7eMPWl
	 GOpxUp5hJHh+walrfJIjJAVtxPY4AU3vi6OcO4IPoWsUyhnrlxHpoewAU5h5RlWROj
	 fZ6mUZVL2XNCVd7a0Wh3k4LK6X35KXZ0MXxdgxJQpkdfuAo1x2V3YubNatIUEX9CRC
	 WZMyvhmNtFpF7J0nIrkyoABiLAdK8HO8DZZFGgnbdj/A1F9iHoE+FGpSi9hWLi/7XV
	 hlUuTIdFaPNPQrTw2DMPrpjMJC92lqsf0NZMUa8KmaR9v7G5CVm0pSLpKijmwmkWOX
	 y28lUHMq15c+Q==
Date: Fri, 27 Mar 2026 08:27:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
Message-ID: <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>

On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
> From: Guodong Xu <guodong@riscstar.com>
> 
> Add the DMA request numbers for non-secure peripherals of the K1 SoC
> from SpacemiT.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

No changelog - neither here, nor in commit msg.

>  include/dt-bindings/dma/k1-pdma.h | 56 +++++++++++++++++++++++++++++++++++++++

So previous review applies, no? Was there such?

>  1 file changed, 56 insertions(+)
> 
> diff --git a/include/dt-bindings/dma/k1-pdma.h b/include/dt-bindings/dma/k1-pdma.h
> new file mode 100644
> index 000000000000..061748c177dc
> --- /dev/null
> +++ b/include/dt-bindings/dma/k1-pdma.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides DMA request number for non-secure peripherals of
> + * SpacemiT K1 PDMA.
> + *
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#ifndef __DT_BINDINGS_DMA_K1_PDMA_H__
> +#define __DT_BINDINGS_DMA_K1_PDMA_H__
> +
> +#define K1_PDMA_UART0_TX	3

abstract IDs start from 0 or 1.

Best regards,
Krzysztof

