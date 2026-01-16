Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900662E0B71;
	Fri, 16 Jan 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554373; cv=none; b=trFR6sn6DvMZ9cM77VgYnoengDMVZAp9JlFL2FIIyfeV/Xm2Vaf/sbtvMWwWfZhX9sw8Y9Xw3HtV+Z7L2KVZfmR87BN4bbu5LfMFf7qKea4SyPxSG1YU8FNcdCBWyRU2VYbvFxR5JoaUnwQjzNBJ9tVWOUHe7O6ZWdcAFZsMZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554373; c=relaxed/simple;
	bh=le8Zgq0NLp5H0KZpWSKIGxlPn+iqhSKGcu3U97owM5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcOZ4ByyE6ZN4UD2wOFNEWJZ0IfhY4q7vh206NyuZpg6/dmSUfqZnus9dIt1jO8INmE2qOKiycgzxc97HX0vABQsW/bpElvpCDIkvj3jZ4GW0LiIgrh216UERBeNoJpevFnMQxg3OeIa1xVEsQcAqxPumN7sNDii+9FbboA1+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTIPOGS4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTIPOGS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9526AC116C6;
	Fri, 16 Jan 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554373;
	bh=le8Zgq0NLp5H0KZpWSKIGxlPn+iqhSKGcu3U97owM5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTIPOGS41uTKyeqT/qIxVxpkln1XbISxzwXitSSxGezwZ/lS3f6KqQ64ZTLUtoiVz
	 FXW1NcmDyjoIeQtLIbHuwLb5tlevf0K8mrJXugfRvfYGUmebGvl2OLE21f9mazm1Mr
	 jWd1SLLnZghdXxJymgTjZ98vX0I/LC7bpP32ETp53c5x8cI1MiHJ37iIgKsb8AUTY2
	 AJ/jqVfuDroIHhf77UqRKKul/sQi6401HbKvkCqV9nK7WKT3OAy7t+crNjUI526cwz
	 Rp40AUvNVChBT3cOUwIkv/VtVoFK8Dao+2F5NqDySI3sLx9tLbAUx1JzucmlzjnmM0
	 i67yfVHpMC5/g==
Date: Fri, 16 Jan 2026 10:06:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
Message-ID: <20260116-debonair-tangible-reindeer-debcee@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:01PM -0600, Anirudh Srinivasan wrote:
> Document register offsets used for controlling clocks in Atlantis
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                               |  1 +
>  include/soc/tenstorrent/atlantis-syscon.h | 38 +++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19a98b1fa456..4a2017d647b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
>  F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
> +F:	include/soc/tenstorrent/
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
> new file mode 100644
> index 000000000000..b15dabfb42b5
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-syscon.h

There is no user of this. Split your work in logical patches. Adding
unused header is not a meaningful logical split because it is unused.

> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_SYSCON_H__
> +#define __SOC_ATLANTIS_SYSCON_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/* RCPU Clock Register Offsets */
> +#define RCPU_PLL_CFG_REG 0x0000
> +#define RCPU_NOCC_PLL_CFG_REG 0x0004
> +#define RCPU_NOCC_CLK_CFG_REG 0x0008
> +#define RCPU_DIV_CFG_REG 0x000C
> +#define RCPU_BLK_CG_REG 0x0014
> +#define LSIO_BLK_CG_REG 0x0018
> +#define PLL_RCPU_EN_REG 0x11c
> +#define PLL_NOCC_EN_REG 0x120
> +#define BUS_CG_REG 0x01FC

Completely unreadable: missing any sort of reasonable indent between
values.

Why do you need to doicument register values and provide them to all
kernel drivers?

Best regards,
Krzysztof

