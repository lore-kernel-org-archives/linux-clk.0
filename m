Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26B35DD14;
	Thu,  5 Feb 2026 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283625; cv=none; b=Gr6ft7TAJOtmczfj7Ky1NeFv3WQ+LxQhhsXFE+zfVtJipQzNjVALwDgiQ1Gaunoxx64LedWuZt48zqwby3xT5MvHgIx5W64tgzunBjK8e98ZhgTY+8YPnFeLYfQg+pcUrdMt+CzAVWiUxVCB6EmYxt6+OkFLJ2+dkh5rCfQ75kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283625; c=relaxed/simple;
	bh=DGof05aujWusFuoWzBv6el8fSgip16IGW5oJeX1ExKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6sKez0TD8thZoiYfUSQP0yRTXLE2RPHZn+wK7L6aPHn45ij0WLh7AdINjbu0rgr01AoXng1hDPKWWY3WWO8HgkJX83/Q2TqU7twAAlf6aT3nM52iMRoQzWbLZqJ/fqyodkx9N4n7cMHJGgPtbJVciUlRNR/2oqlutSN7Z8DjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdQw+2ex; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdQw+2ex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED0FC19425;
	Thu,  5 Feb 2026 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283625;
	bh=DGof05aujWusFuoWzBv6el8fSgip16IGW5oJeX1ExKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdQw+2exsqc2y6a5j3HsPv2q8hOgKtcMmpXoyzBRv9gybgYADL84pKQyPwQXl5Ziq
	 ekVSlvvYuyD3XW9enrFkC7gHDVgyKzLL9Cfh1b8uyrNWQspQcJhVmxF2Dw0zi5ylaY
	 wnOPXfp5ydKSKHe0d4MP98mOfLFsySm6A5+4whZ0rkS1+kg5lMEyUaaxK+ucjS9lCR
	 otrBjbkZOumLQepBXTo2iUC++vgWjd/tewgp0e9JLc/Xa/ojBCdioTp2HF9tRpLYhZ
	 6OTJdDEtBr1Z1dzblzGvhotp31urQyIcjSHIkY9NCQhJ+bzxRmpuZ1knRdtHCqkSik
	 iqvtsNlDaDMzw==
Date: Thu, 5 Feb 2026 10:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
Message-ID: <20260205-spiffy-bizarre-doberman-184d2b@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>

On Mon, Feb 02, 2026 at 01:46:50PM -0600, Anirudh Srinivasan wrote:
> diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
> new file mode 100644
> index 000000000000..841516cbefd9
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-prcm.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Shared definitions for Atlantis PRCM Clock and Reset Drivers
> + *
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_PRCM_H__
> +#define __SOC_ATLANTIS_PRCM_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +struct atlantis_prcm_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};

Drop, there is no driver-wide user of this.

> +
> +static inline struct atlantis_prcm_adev *
> +to_atlantis_prcm_adev(struct auxiliary_device *adev)

Same here.

Do not add symbols to headers which nothing uses. These are private to
the driver so they must stay ONLY in the driver.

Best regards,
Krzysztof

