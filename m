Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7736A008;
	Fri, 27 Mar 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596636; cv=none; b=kod2f/Qrd1IKzOnsv39EI1yBaeDxs8T87PFDQctCyESVrbqC8QINkBLlufl9Xo4GRtiIIz3+YtJSguSojcb8RUqz8HVRb73G6PR63q6K8YUTQ3h/r5yj2K+Hslwdhc42uuMD1DZqysFZeoERhceNLLEjG9eA9WezdYdXgjvmajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596636; c=relaxed/simple;
	bh=Nhd4cukWDVjhukk+y+jGGeey4ytNdYgdQ3woWAlYkmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBtzHtxB4bdQY94FLX0vlMYO5Q6c+sjaOH+XXBG60yGtoJXglrbpivOjsaqui2u3ONeI7vxoDUwQphX9kpOCCAkylF6NcyiLJXpBHDc+bnH6D41iq5pPJGI6NBjqao14RwK1BU+0NiGgtr0m3q5E4Yo8RML++DTnoRahpf/i8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CD5kpQKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CD5kpQKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB64DC19423;
	Fri, 27 Mar 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596635;
	bh=Nhd4cukWDVjhukk+y+jGGeey4ytNdYgdQ3woWAlYkmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CD5kpQKplHtxUMkwh4qNh5ubCb+ekeCi+qMhmdW1hCwzBbHTMJh6ObRgztqu1hpD2
	 dHtsCYBHEr4o1AkbmeeWNQeLw1/Nwb6GE6TA1X4Dw0zY6cmabMamS8mkPN6B9V99k9
	 SpJh3NdbwgKAElQUPv0iTSR2naNIiaJLtYinIr2RnS4wyxfV/vf9FQzHUT1wiNdVbR
	 wJwnGY3k6tK7EuZyQ1z43FqBxwl+brHEMJcVl/eMYS9+wIcKNYGvunCpSveFYWJuxO
	 qqO7HHpI/9qJ5m8j9rtBWzTgsJZWmzxi+3eWVTWbLx3LEocQXm8wivxCG2Qizdm73e
	 Cncg2qzUbAjMQ==
Date: Fri, 27 Mar 2026 08:30:33 +0100
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
	linux-clk@vger.kernel.org, liyeshan <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
Message-ID: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>

On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
> From: liyeshan <yeshan.li@spacemit.com>
> 
> Add device tree binding header for SpacemiT k3 DMA request numbers. This

Why?

> defines the DMA request mapping for non-secure peripherals including UART,
> I2C, SSP/SPI, CAN, and QSPI.
> 
> Signed-off-by: liyeshan <yeshan.li@spacemit.com>

Name looks close to login name?

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/dt-bindings/dma/k3-pdma.h | 83 +++++++++++++++++++++++++++++++++++++++

I am already confused what is happening in this patchset - so which
device are you adding? K1 or K3?

>  1 file changed, 83 insertions(+)
> 
> diff --git a/include/dt-bindings/dma/k3-pdma.h b/include/dt-bindings/dma/k3-pdma.h
> new file mode 100644
> index 000000000000..05541a9a9973
> --- /dev/null
> +++ b/include/dt-bindings/dma/k3-pdma.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides DMA request number for non-secure peripherals of
> + * SpacemiT K3 PDMA.
> + *
> + * Copyright (c) 2025 SpacemiT
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#ifndef __DT_BINDINGS_DMA_K3_PDMA_H__
> +#define __DT_BINDINGS_DMA_K3_PDMA_H__
> +
> +/* UART DMA request numbers */
> +#define K3_PDMA_UART0_TX	3

This starts from 0 or 1.

Best regards,
Krzysztof

