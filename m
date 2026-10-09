Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141C430302;
	Fri,  9 Oct 2026 06:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526228; cv=none; b=YbGmGvNR2cpliOxoS41WPfJpkToAgf29Sdc4CTOLuj8eoZ3P3p4LEWJlt/CDQQuXQaxGWMbvoSahcCZTjRm3m1E75oSuA375eA2uOKFiuQlxYamtClTInvjNmGNVvfZu+l62TDycd9Y/lPXk41AVZR45zdhy+mANbBkWtQgp6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526228; c=relaxed/simple;
	bh=/UfbsjqzDY6VeeP2gUInuXeu+5cK5tmhqvo9/j9H7WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndOQiS092H6YNKsNFTyFNooBRl/Hy3TiUE4/js2YLqjBcDfDRjNAv4cTNgRgrzJ9xvh96DqektD/gnWN3yy244LsYP422Vh47UZzaVtBpHbe5G3+7Qk+bGV4/CrFLXh35fFwYoIlD+URPLQGFWqDdupKmMf+Vev4IE7d92rbz04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnvZgk0x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnvZgk0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701F21F000FF;
	Fri,  9 Oct 2026 06:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526225;
	bh=9QrbgLJlJB9Qt6Mk85+69XrHJzKoUGmt4nkY0QTog5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnvZgk0x3anRi4HJIiM5vnuWn5XkEYRAfheAVzWXOHOS2F1P/Gfdj4+j7s/RGkWr1
	 ONzyzm5Hs+JOvtmZMdDE/MVStCIqOARIopB7USDHskOjFPTl6xzYw1NuFDzjthUnYi
	 QesQ+pTzuGyi/OyvSGlIOtFosmYFD4XDQkg9J4LT4JPqtgSddMgIbu4xD/K1vRvB5H
	 epZZqDHiO6qfmg4gt+Bu7H3G6bS0k6VfjlCRdYcfGuU5jHVVxq0RQ+qbYu+hWoo557
	 aVEVT/8DEJ8OSq19UQM89c6oKivooqVpA3HemLpRjCqJ3Csw3R6DHZjVoHWxdH+8HV
	 4g/JjhcmKyEog==
Date: Fri, 9 Oct 2026 08:10:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: =?utf-8?B?QmVub8ODwq50?= Monin <benoit.monin@bootlin.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, =?utf-8?B?VGjDg8Kpbw==?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH] clk: eyeq: release OLB mapping in eqc_early_init() error
 and success paths
Message-ID: <20261009-reliable-mule-of-feminism-adcb7f@quoll>
References: <20261009032636.3059201-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009032636.3059201-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 11:26:36 +0800, Haotian Zhang wrote:
> eqc_early_init() calls of_iomap() to read the early PLL registers, then
> returns to the caller without ever calling iounmap(). The mapping is not
> stored in any structure, is not devm-managed and is not carried over to
> the platform device, so it is leaked on both the success path and every
> goto err path (early clock probe failure and of_clk_add_hw_provider()
> failure). The early clocks registered here are all fixed factors, so they
> do not keep the mapping alive.
> 
> Release the mapping with iounmap() before returning on success and in the
> error path, initializing base to NULL so that the allocation failure path
> taken before of_iomap() does not unmap an uninitialized pointer.
> 
> Fixes: 25d904946a0b ("clk: eyeq: add driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/clk-eyeq.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




