Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E864DF59;
	Wed, 19 Nov 2025 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763511003; cv=none; b=eCJwk8qvy5BwebBSvhr8e6hZ4wvWJuuCbw/itV9ILko7gMrrfEc4619q5pCULn/uM/YKuJk6jDJUtec3C5eK+CO/gCsioV/IYtHKrnV4AH0iWiAzAluIeD77Kt8yUaycK7FtPJovCGdISfTs9EA4AxKUaRXFrx3E1PH3u8XPuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763511003; c=relaxed/simple;
	bh=ZwJHdTYoleJ2V0+G9g4xBSgA2sFNLtkvSZRJR34fvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDyUC9xh7YJ1Ww9G3h5wMhO6pyYbbU7wYZ9eQehkwrDvwp1Ved8hC45zwKA17Msoa/r4p7tWEAMoeEmpEM5vK7ETw1KKNlXoozcwEDN6+Mahb6X+J7PwYAhodtOmfKN0IefZ6ybcgDi6TwgfH18R2aIndWWGLyph33NBpUnTg1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B384C340E31;
	Wed, 19 Nov 2025 00:03:36 +0000 (UTC)
Date: Wed, 19 Nov 2025 08:03:32 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, heylenay@4d2.org, elder@riscstar.com,
	troy.mitchell@linux.spacemit.com, inochiama@outlook.com,
	Yanko Kaneti <yaneti@declera.com>
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
Message-ID: <20251119000332-GYB1726554@gentoo.org>
References: <20251117190329.1337250-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117190329.1337250-1-cmirabil@redhat.com>

Hi Stephen,

Could you take this patch directly? or let me know if you want me to handle

On 14:03 Mon 17 Nov     , Charles Mirabile wrote:
> When booting with KASAN enabled the following splat is encountered during
> probe of the k1 clock driver:
> 
> UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
> index 0 is out of range for type 'clk_hw *[*]'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(lazy)
> Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022
> Call Trace:
> [<ffffffff8002b628>] dump_backtrace+0x28/0x38
> [<ffffffff800027d2>] show_stack+0x3a/0x50
> [<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
> [<ffffffff80022100>] dump_stack+0x18/0x20
> [<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
> [<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
> [<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
> [<ffffffff80b79e6e>] platform_probe+0x56/0x98
> [<ffffffff80b76a7e>] really_probe+0x9e/0x350
> [<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
> [<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
> [<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
> [<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
> [<ffffffff80b76296>] driver_attach+0x26/0x38
> [<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
> [<ffffffff80b7836a>] driver_register+0x52/0x100
> [<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
> [<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
> [<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
> [<ffffffff81401c60>] do_initcalls+0x170/0x1a8
> [<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
> [<ffffffff811f7534>] kernel_init+0x2c/0x180
> [<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
> [<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
> ---[ end trace ]---
> 
> This is bogus and is simply a result of KASAN consulting the `.num` member
> of the struct for bounds information (as it should due to `__counted_by`)
> and finding 0 set by kzalloc because it has not been initialized before
> the loop that fills in the array. The easy fix is to just move the line
> that sets `num` to before the loop that fills the array so that KASAN has
> the information it needs to accurately conclude that the access is valid.
..
> 
> 
One blank line is enough
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Tested-by: Yanko Kaneti <yaneti@declera.com>
> 
Drop, no blank line between Tested-by and SoF
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index f5a9fe6ba1859..4761bc1e3b6e6 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1018,6 +1018,8 @@ static int spacemit_ccu_register(struct device *dev,
>  	if (!clk_data)
>  		return -ENOMEM;
>  
> +	clk_data->num = data->num;
> +
>  	for (i = 0; i < data->num; i++) {
>  		struct clk_hw *hw = data->hws[i];
>  		struct ccu_common *common;
> @@ -1044,8 +1046,6 @@ static int spacemit_ccu_register(struct device *dev,
>  		clk_data->hws[i] = hw;
>  	}
>  
> -	clk_data->num = data->num;
> -
>  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>  	if (ret)
>  		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> 
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> -- 
> 2.51.1
> 
> 

-- 
Yixun Lan (dlan)
