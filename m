Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37291DFF0;
	Thu, 18 Dec 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043514; cv=none; b=YJl1awM+qTsP+0UbuPiEEvsjVns+92WYVDv1BuJwikFPi0+RpmLU0YCH2V/y9l7dA3mDNzlXo3gJhluHa+UQJvSOAjd2+THGyw1sP3Donf2+OeOZkXY6sUz/U9bibRKt0Qhhfpt7oCtTeWllf+YSx71Il5PXjQNJJPZqnlXg0qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043514; c=relaxed/simple;
	bh=sRgfXaQuFlOWGGsUFkXlWrcFv4yUxkFPAAiCdLTWVoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+Z4HHJI+gtOuRFBjiC/goe1zsNnGhYUEnsCuwYkNjVk+HbiQQcOUODHui55U5pTxokVSuy4vs1nRafkVTl+OuBqGS0fNvB4TGJBCtcKIThXLwa3bwPJ0dIxBStNxAIB9lUX6uxhkCt4oWaRof8UmPX4b+jVcyG4weBynj9H7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84644340D96;
	Thu, 18 Dec 2025 07:38:29 +0000 (UTC)
Date: Thu, 18 Dec 2025 15:38:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251218073818-GYA1939847@gentoo.org>
References: <20251218004227.221861-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218004227.221861-1-inochiama@gmail.com>

Hi Inochi,

On 08:42 Thu 18 Dec     , Inochi Amaoto wrote:
> For build spacemit common clock driver as a module, the build
> process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> build will fail.
> 
> Add these missing hints, so the driver can be built as a module.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c  | 1 +
>  drivers/clk/spacemit/ccu_ddn.c | 1 +
>  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
>  drivers/clk/spacemit/ccu_pll.c | 5 +++++
>  4 files changed, 16 insertions(+)
> 
[snip]..
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index d92f0dae65a4..7389202c4831 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/math.h>
>  #include <linux/regmap.h>
> +#include <linux/module.h>
>  
>  #include "ccu_common.h"
>  #include "ccu_pll.h"
> @@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
>  	.determine_rate = ccu_pll_determine_rate,
>  	.is_enabled	= ccu_pll_is_enabled,
>  };
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
> +
..
> +MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
> +MODULE_LICENSE("GPL");
can you creat a separate file ccu_commom.c, and put above change there?

the reason I request this is that I'm trying to refactor the driver and
will extract common code into file ccu_common.c, with this coming change,
it's more proper to do this adjustment, which will avoid future code movement, 
refer the link [1] of the review of K3 clock for why I'm requesting this

to Stephen, if you have no objection, I'd hope this patch can be taken via v6.19-rc2-fixes,
and then I will do other follow-up clock patches on top of it, I can send a PR for this fix..

if with above change, please add my R-b
Reviewed-by: Yixun Lan <dlan@gentoo.org>


Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
-- 

Yixun Lan (dlan)
