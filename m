Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3417181334;
	Sat,  4 Jan 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735984737; cv=none; b=Ox33cr+K6DusPVZW6gHzq5Ba3lTgqyIbM+1/mlJ7Wt2RwfaK2B4h1E84v0ENMq+wfVDS6SPFoTJxj9NU2LWUUqbt8lkgipCtnKNEuJfGtlTGPd1A8Rr88p1madKZPiJEgNP1bwCBizLpgkIVreNDry0hqe++jbnQyxsDoJ4VhDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735984737; c=relaxed/simple;
	bh=AwdFx98pEAireyoVzCdRMZVDpZ9o6J75X9n8rzgDT3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n006PcJbXNIerQFX73Y/MZ2GEd78vqAp8hpv3zqAlwzmT017NOfCIKPOlApv/mVME7WO5YwkSRKivcQO86g1AUw+8nxvwZFH0yCOLw5CBL55+52CfiA3qerF2eUFawmObuoXOBQJDKC7XDvKrutHru7Snd2IZ5zXaionTgL5WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTlL+k2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTlL+k2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E7CC4CED1;
	Sat,  4 Jan 2025 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735984737;
	bh=AwdFx98pEAireyoVzCdRMZVDpZ9o6J75X9n8rzgDT3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTlL+k2MwomgUMaU/dvTC+jGQZiN0GJKrKzlG0A2DIczkSuvGaUO7OH28utdkBoVW
	 EBXrTMN9AJMWbqb3L5bqF2wnEhQX+M9/RSgmHLbAmgDDYfM8mwjx3Hk4cKFsFjkooi
	 ZifboexBvb+XKgPqcrLxH0cPV6s88iaBjnPGcZJyaCWgTOPZIlT08wqHkvbtj2fgcJ
	 RdQ0yJT5Car4UQytaSVSyXZEiGa6lM2CrL+w02LBKeA3xPs7uRlggkPrHffmXBtvuN
	 RoKY6TkSubUchOxOLJIbgJj2aYzO1MyTfAVOFIYCUGb5Z/Hd2MMKz37oCs+F2abbGR
	 95j2C2tYiLOhw==
Date: Sat, 4 Jan 2025 10:58:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-3-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103215636.19967-3-heylenay@4d2.org>

On Fri, Jan 03, 2025 at 09:56:34PM +0000, Haylen Chu wrote:
> +#define CLK_PLL3_80		32
> +#define CLK_PLL3_40		33
> +#define CLK_PLL3_20		34
> +#define CLK_APBS_NUM		35

Binding looks fine, thanks for the changes, but now I noticed this
define.  Please drop. Number of clocks is rarely useful as a binding and
usually leading to ABI issues.

Same for all other clock controllers below.

Best regards,
Krzysztof

