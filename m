Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F017A2FA
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765930727; cv=none; b=ZyOzzO2wTjTCE/dzcielw2fJV+md/dAQ2w/ChbCJJFU1xwlkD9qnKoZmXDLIqom8fReiefW56z1FPpksHe9fSUoo2mtDYDJqZrsvRkO0FixoKcM8TKrlWxVDrkhsAOlExOQGD55hRJh9Hem69hiz2VRkY7n3qKld9FIQd62ZnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765930727; c=relaxed/simple;
	bh=Hca14eaABhLrQr5Jn0FiLluqtSz8Gtu8ITf8855oBG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGEgBiVF4SV0eBVW5diPrZwEC5SqdLKqkYcieBGDEctO2bS5Yu9s3jcVFQjAMF+QFVALi0vAoLfLQbFwsEDCAeLsw41KYfZDrlBBXr+scyRQdbR3MQEFPvKg/rXB1OIE+nJ26Lz5awzjACykEX+fxCsCHjuUep6ERop+j1j71zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F0A70340C98;
	Wed, 17 Dec 2025 00:18:43 +0000 (UTC)
Date: Wed, 17 Dec 2025 08:18:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251217001833-GYE1903981@gentoo.org>
References: <20251216233514.646263-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216233514.646263-1-inochiama@gmail.com>

Hi Inochi, 

just noticed, you failed to CC to the mailing list
please increase patch version and send a v3 next time..

also please see my comments below

On 07:35 Wed 17 Dec     , Inochi Amaoto wrote:
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
> Change from v1:
> 1. Use EXPORT_SYMBOL_NS_GPL to export clock ops
> ---
>  drivers/clk/spacemit/ccu-k1.c  | 1 +
>  drivers/clk/spacemit/ccu_ddn.c | 1 +
>  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
>  drivers/clk/spacemit/ccu_pll.c | 5 +++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 4761bc1e3b6e..1f42b8045bf3 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
>  };
>  module_platform_driver(k1_ccu_driver);
> 
> +MODULE_IMPORT_NS("SPACEMIT_CCU");
the name should be ok as long as no collision and unique, but..
I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"

>  MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
>  MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c

[snip]...

> index d92f0dae65a4..893af23c6b25 100644
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
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "SPACEMIT_CCU");
> +
..
> +MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
how about name it more generic? you don't know whether any other clock type
will be added in the future, so
  "SpacemiT CCU common clock driver"

> +MODULE_LICENSE("GPL");
I've got a comment [1] from Ziyao in the review of K3 clock driver
that suggest to distill the common probe function, which make sense.
So, I plan to have separated ccu_common.c file, with this change,
it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
into that file

It might takes some time to get there, as I now got a weird panic/hang
issue with that change..

Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]

-- 
Yixun Lan (dlan)
