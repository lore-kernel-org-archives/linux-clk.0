Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E55642BEB9;
	Tue, 28 Jul 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239265; cv=none; b=EYkIc7tdEkizjZHnPRLHuVE4bdkP5clioNrG7ZOOwjrzOqRT9z0mxmdUHOLV6y6ruzpWjVn7zFndBCY5A+tZews3p3xsfMbRecoPWm0W3wPY210lp6RK3rogAqzs9YfUVw3peGPVSelclA279dS+fmWQG8DRhAmfoTMvdnhq5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239265; c=relaxed/simple;
	bh=b/ihtlr15K8JVnOlUyfmiUPDlP+8E/XJpgR0li8qucg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIR7SDr8e4M6vmPLFmzQqqVnpHa+0L0BRQo8f03HYBHv3PST5KWC6+kV86vAZw82iUb097m3SKlr0havt3n+fjzC4uhgVu8gGWAiLBR+j0P1HMe/7mMWhb0GLaI4S8aCWn0CotWRTmJRrsC3KkOdf0CXFAMOXGGw1Tkt7yYF0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etQeWE0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etQeWE0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77761F000E9;
	Tue, 28 Jul 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785239263;
	bh=d1kX/2BkcFPx00SzT9s8BBrA//d/t9d2pxkdmPH02XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etQeWE0ZOjyJqTVlDWQbq5PZbsEw/jGbJ7o2iN1SX7Zhy7Mw8DMzIKD21YRPN2+rX
	 CPKcV5T306U77NWVVkYX0UGW9TZY854Ob9JfRUKw7iXsqnOTI7TMcU9g3hlbIlPc16
	 3vPDw8C2G7usSz4BQ0R1/HDJW1UJe/DdgxPhF2SHX66DijysZcsVeJlULzXVKEcjQk
	 Q/r/gMf0FlR1A+o5y5loJQCisFASow3ORcjosHXV8pw14gfL2OWtbDPcc9beRDjEVa
	 W19rBW41tBBVGXXTun5OUKXBKEzkRph0lHTKUbCVh2UMCWC5RtN0Yc0Nu0qU9lqjzx
	 EPtrqPNcP1ehQ==
Date: Tue, 28 Jul 2026 11:47:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and
 divider rates
Message-ID: <20260728114739-GKD76518@kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>

On 00:26 Fri 17 Jul     , Troy Mitchell wrote:
> The K3 i2s clock tree was modelled on the K1 layout but does not match
> the actual K3 hardware topology, leading to incorrect clock rates being
> reported and programmed.
> 
> Three fixes are provided in dependency order:
> 
> First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
> match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
> added. This prepares the header for the clock topology corrections that
> follow.
> 
> Second, the clock topology is reworked to reflect the real hardware:
> the common i2s_sysclk DDN at MPMU_ISCCR1 is renamed from "i2s1_sysclk",
> an implicit 1/2 factor (i2s_bclk_factor) is introduced before i2s_bclk,
> and the dedicated i2s1 clock path (i2s1_sysclk_src MUX + i2s1_sysclk
> DDN backed by MPMU_ISCCR0) is added. CLK_MPMU_I2S1_SYSCLK keeps its
> existing ID but now refers to the real per-instance i2s1 clock; no
> in-tree user references this ID so the semantic change is contained.
> 
> Third, the per-instance i2s sysclk DDNs (i2s{0,2,3,4,5}_sysclk_div)
> are corrected to account for the hardware-internal 1/2 factor by setting
> pre_div to 2 instead of 1, so clk_get_rate() and clk_set_rate() report
> and program the real hardware rate.
> 
For the series, looks good
Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Troy Mitchell (3):
>       dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
>       clk: spacemit: k3: fix i2s clock topology
>       clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers
> 
>  drivers/clk/spacemit/ccu-k3.c                  | 31 +++++++++++++++++---------
>  include/dt-bindings/clock/spacemit,k3-clocks.h |  3 +++
>  include/soc/spacemit/k3-syscon.h               |  3 ++-
>  3 files changed, 26 insertions(+), 11 deletions(-)
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260615-k3-clk-fix-i2s-5e278a472061
> 
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)
