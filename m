Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551730216D;
	Thu,  5 Feb 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283547; cv=none; b=SRdpSxk3l7Ili7eCFLJQ6svWxnYE//EYY0vr9f90bCeSm1WHPWj4LREo4JCIgK6sJ6t0n45Hxi+FsVkW/jovMKxAaSe9r7nUBZ1CnFcq3DM9Cjsem93ZZTf3qQclwdeEGV89rvQRf6CJ4RF6629lCNnzdNPgtrVv8q5oxI/e+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283547; c=relaxed/simple;
	bh=L342l1lGkleNHTukSL9PWnoU9lED8KcrpH6aDkUVB9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twtvbIfLweeho788KyLv6S11wgkuifHeeqGbLNGA8JDSyYisCywdJ09HvYMlSseTg8prJhhKHY+rweLPdzs4CCSTlD6eGOdesl0QkGizsishGJI+cLLa/BtnknfSmtkZb1VpFS/uhXiHU3UVNijshvh7w7yyqK6QJZ8kitkbw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+RkB7kG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+RkB7kG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EBFC4CEF7;
	Thu,  5 Feb 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283546;
	bh=L342l1lGkleNHTukSL9PWnoU9lED8KcrpH6aDkUVB9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+RkB7kG7TqrFVHproWgVJXCAvOSpZO+ur7YRmB4miXv0fHXWc7JmYxFFjcNNEbNU
	 VQw8WB6EJQoXC4u5Tp3T3rDnFrK6YMrL0ULpXN5HINjpYy2xqQrmhrWoaBusVgOuTq
	 z6MA+GK68izAo16RcRCiU6IU1CSYHI/M9LyXwli2gD/57Mp0M7kG6pybO9+gL3J9Zh
	 HNZLTeDDo546YFdF4lLWZnh1QcLO1b/6a4tcYzby3xiobspFF+JzfoIMvFFCwn9c4G
	 H9t+ZLrp/jENz8gq1gdhTI7DlMwyD4og0X1W2j+fTBeZgZQ7Ztt05avRGCGlOTailg
	 hSiGBsiConfzg==
Date: Thu, 5 Feb 2026 10:25:44 +0100
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
Subject: Re: [PATCH v5 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <20260205-abiding-dragonfly-of-success-5ff9bf@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-3-0922e43acaba@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-3-0922e43acaba@oss.tenstorrent.com>

On Mon, Feb 02, 2026 at 01:46:51PM -0600, Anirudh Srinivasan wrote:
> +MODULE_DESCRIPTION("Tenstorrent Atlantis PRCM Clock Controller Driver");
> +MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
> index 841516cbefd9..ff2c6a7c9a62 100644
> --- a/include/soc/tenstorrent/atlantis-prcm.h
> +++ b/include/soc/tenstorrent/atlantis-prcm.h
> @@ -21,6 +21,17 @@ to_atlantis_prcm_adev(struct auxiliary_device *adev)
>  	return container_of(adev, struct atlantis_prcm_adev, adev);
>  }
>  
> +/* RCPU Clock Register Offsets */
> +#define RCPU_PLL_CFG_REG	0x0000
> +#define RCPU_NOCC_PLL_CFG_REG	0x0004
> +#define RCPU_NOCC_CLK_CFG_REG	0x0008
> +#define RCPU_DIV_CFG_REG	0x000C
> +#define RCPU_BLK_CG_REG		0x0014
> +#define LSIO_BLK_CG_REG		0x0018
> +#define PLL_RCPU_EN_REG		0x011c
> +#define PLL_NOCC_EN_REG		0x0120
> +#define BUS_CG_REG		0x01FC

Why are clock registers added to a global SoC header?

Do not create system wide header with your entire register space. It
serves no purpose, breaks encapsulation and enncourages sloppy
programming liked drivers poking everywhere.

Best regards,
Krzysztof

