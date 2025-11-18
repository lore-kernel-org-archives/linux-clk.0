Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150582DCC06;
	Tue, 18 Nov 2025 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446334; cv=none; b=PAhp0nj+uKM/LNCLbI73iOmFdrtCPh3pFLBZGC4iDc3iDQMseyNAOv8iGpBTtUFfbgB2g5s2RLqrdaYu7vulkXeLgOXtPh4HNH/hks82EoUA2SU9nbIqy9jTzWRDAH73h8H1IXdk6TT5SBDQQEjMUyvXm5IvUZsXv7Zyzn+qVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446334; c=relaxed/simple;
	bh=O5o7AICh3o7Ww3407LSqZ3eeo6vXkoE83XVtMZ24sj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdApoFU4/Z3Jyhx9juD51kZ9Wxv1ma5tvZcf+6YqEgNtF2Pza2oqifblmthlS33RXc04Eqt9d53NORL9FxArnBZ0pabzHI/PAAhKdQmp/FsiqeMW9AlBDlOVdoXYlDZWe2Q7K2gUKu4lWlNFNH29VP3qMSXsVEGSV8+u4e90UGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=CH8kzZ+O; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="CH8kzZ+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446324;
	bh=PefOPp4VRN+tiPLuOqhHsJ3+bwsd1zdz/20vvYEKS0Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=CH8kzZ+OXTHPP0+rxn+tX7o0j0lWxSzPzcPf1YgXFRb10OgkoJlUTef3BMaxzxsHz
	 Pjla6o5729p7WCCOAfVPaU0jDg0QpEYt+7ou/WhigIadoqPizP/dGooCSlnHVHZQGl
	 a4PqtzAmToBe4I1bSLJeiyyRg+xSeVw2kDpiMVsI=
X-QQ-mid: zesmtpsz1t1763446322t85fbca92
X-QQ-Originating-IP: sxHPH0siHuAz7N4YRiuNuWYFwBSXTUAYWAJuNFM67cE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:12:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3589277169008549396
EX-QQ-RecipientCnt: 13
Date: Tue, 18 Nov 2025 14:12:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Charles Mirabile <cmirabil@redhat.com>, linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, dlan@gentoo.org, heylenay@4d2.org,
	elder@riscstar.com, troy.mitchell@linux.spacemit.com,
	inochiama@outlook.com, Yanko Kaneti <yaneti@declera.com>
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
Message-ID: <6C924033633588A2+aRwOMF9uafe2dl5H@kernel.org>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OE2SNMSfMbmO6p2EiMMnV1R8w3oZZE7ZxkB3Ht5O8vWwaXZ4r3bMuSQR
	Nnj8CftpY4QPsCCGsM9L7DJuKDyyNBDs0aYgPa/YnG+ya658xws3WBf2JvFQUaEB1hR0Say
	ax7MNjYdDMILorFflKXYQNHqbKWY4vHlll42UV6+xcp4gTZ0xd9jKJqlq+UfI6qwTEhAjYa
	7cLG+K3dhULA4RuswG5dz8lIJroq4YocWDu9/lSmLxNNQs5RFxYpvnE8PDgxo8gCnxYbAit
	NPkYhQECi65Ic6rA2Y9cjHuKUWWi8fRTYbIVLlB6BMyG8n0fhfx/B4drVE3PkPpthQasYtG
	rzYm4RdoFbXhRJ15kbtTEerXmcnXL9p3QefG4JZrXBZcGqJuWD/L65VYjD0OByB82+3ABAk
	4f0wFHuLjGm9uJLoGfxdX38TCHlQdL6xB9iRgd9+PYi1EqIlxj7p7pBqXcSee1tnwIQSXGC
	yAtj43t1bzjqOOc8rCPMLZLhq6iDo15i7f1LUkQBeXuH/WqedMWdMjc0IeeekH1l8zKkr3C
	1n4LDzq/Yf2NwJi8fpALBspMg7UpXyRUpcyBmbsG/pNo5o/WHK7HHEX6JoI4MxeTjDClFXs
	4l0n0OyQghre8WK65yI99gDWqIUaDwSgSqNr+7f0loWei3HmruDJM0hybOn68Y5vvQ6Tncm
	K1QdqF0VkXySu+vWf6YHnh7GXWVpiiHeZYMXcZK1NoxfyOPPWwuLTDsKoRg/2iU3tvMVw/f
	pCSmc/xtAQNfvVpS7N+enGbIGY8bRqM2PSqPkmkuU32nbWOeKL3WLn41PeDQ40x7sYm5Xwx
	qUMRJ6AYgGYja79sQprMZehoaU1KhF6WlfXFE0Mxb/uZ/V9wyauOjWiyv21lAIvxuLNPS71
	9HRfT/cXX33eqywat7YqXGRkedQ8xDzgqpcbzPJ5kq9PI1aXraD4ois9p8s36gxBDIK9HoJ
	GgAcmVF5SLjs/+DogCbI1vDF3Qk5Yz3rb/Eefk1IB70F+GB80FtkAIj9Frs+u3WILmqlu50
	OKw4gXMe37RJQAgdE5nKLXFPT9ps4pYYvKag243A==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Mon, Nov 17, 2025 at 02:03:29PM -0500, Charles Mirabile wrote:
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
> 
It sounds very reasonable. Thanks!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Tested-by: Yanko Kaneti <yaneti@declera.com>
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
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
