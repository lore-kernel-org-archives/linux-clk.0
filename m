Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108803B058F;
	Sun, 30 Aug 2026 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113527; cv=none; b=HD4WcJTcnvSFOdEvxv8hH9F3Mqg03RnFY2JDZYkl2/PkyNukcRvCSF3s5GGxrU/1b70fTg+zoqsv2aT0lrPhp4o/9kuY7SVOlzx+4HbN+bfSqhWstBAUN0S6H41hH3vI9y1+knhgVLVEzwbqVAi7/b63/uTnMwoTsjm9grERP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113527; c=relaxed/simple;
	bh=j67ld83gH2XJLzRBZYyBGsxZX/bLvVfdRgwPXzcQ1TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS8HWfWJWCA0dFn5qHkVatxAB5puuYCmpyhBfmq9Dssl106SzX7LrtD6LY6w87CYAXxGs3cfvz3/mn15syyGhKbEFrVTS5/f0QIauDGWfXyXx1rsH+HE3LiEdbdY7bO3iTNw6hxinuXHkCAmAU0uuNn1MFy3qnHu41mG1VtMwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=IUqju8Nu; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="IUqju8Nu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=63q7KWBMMKfdpLCByy632p3117VO9cL13L0VjuNmpXY=; b=IUqju8NuF+y1DWb4nUmKzJWfQ3
	N0m1q9iCHezmZbicx5R39zA2YYDvI2YBN56wDD/ArDPkJE3t8+HWIj8Dp1xagBj/TUiYg2DK8umVk
	6c/G3kXmtGtIDL5XnEyIaOlk1o7mFYNtKEZJ64oh9uug6TV6XriyCzelJ9k6F+eUX/EdXi8LwGaU7
	LYy26CgZD3ilHCtmFys5LmHLT8qIgHdkdELF1iJVnHxw3N2aaqcG+7oWQXKvL9dNSteXH3KokOJv1
	A44YcpT8KuXsp3Sv5f1owBZxpWmOGbPfpnwkEG1dLS3Mgyspau+SduFH6dZ9SwEzySSDXODSVWTwo
	2eLmUORA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0k0f-0000000AF5E-3gxL;
	Sun, 30 Aug 2026 20:12:01 +0200
Date: Sun, 30 Aug 2026 20:12:01 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, stable@kernel.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
Message-ID: <apRyccJsMjI8Qc4z@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, stable@kernel.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260830172925.3245444-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830172925.3245444-1-aurelien@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)

On 2026-08-30 19:28, Aurelien Jarno wrote:
> Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
> and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
> PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
> only the 2.2 GHz overclocking operating point. This causes the linux
> kernel to hang at boot.
> 
> Add the 2.0 GHz configuration in both tables to fix the issue. Tested
> with both k3-br-v1.0.5 (X100 running at 2.2 GHz) and k3-br-v1.0.7 (X100
> cores running at 2.0 GHz).
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: stable@kernel.org
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/clk/spacemit/ccu-k3.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> The related U-Boot change is available at:
> https://github.com/spacemit-com/uboot-2022.10/commit/274f664150dade144df265baf7dc8e15dd9cce52

FYI, this is the Sashiko review:
https://lore.kernel.org/20260830173644.193B21F000E9@smtp.kernel.org

While I agree we can fix the SpacemiT clock driver, we'll need to add 
this rate anyway, and it immediately fixes the issue. Fixing the clock 
driver is more work and this will take more time to fix.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
