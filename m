Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28FC38CFE8;
	Thu, 18 Jun 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770755; cv=pass; b=UJv6Ka9z5gPGw3m0am7uRl8YyJVz6Ch1EoqOpYGCPllHbijlDQ5OqDnTir7AkLoymAyzQgDDAPKLn2+YrH+QfGBqFofUHy//IRi2v4NCkReRBCXGMg+KzFi+HJqlCKG/S+6Ti1/E0ceWJXGd8DBAr/k54Gob20+HLcP+oS+OI0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770755; c=relaxed/simple;
	bh=3wewoHGjeqOAkJRKndF4OFdzJe7sNBDsbBePRRj7Vio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5UFeqs8neWKgf+MbGjwpkDH7321qVMuBenva7qEY+sQ3S+nxbni3qXRZ9TRugWt3+sboEPHrDSVy5i7Ac9Tzy8Y2Ve/PbwL1UOUhKL/NkFvo/78Eq88cxTG40CV9Q5b3GWSPzF/PDKDL/UD+ROePaYtvmYDHMKGxoJoYhoKuM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=cg2HDsHi; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="cg2HDsHi"
ARC-Seal: i=1; a=rsa-sha256; t=1781770742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C5OF1KcblCgAbzEMOs6fJKsEO4vWR4bQsnmG5LBm2PSS/OXhyZVKGNIK3wQ1/l+qKcy2QB8PcKOsWJYN3fhT39A9NkJmufvKWRGuVQcNLnd0HyK5/1B4rc3t/Yjvphw5r5oPSiNsh6u/oJXmvwuvPt15d6Xe4EsdC3nfoJXyOuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781770742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5BJImhEJ6EW74MMZhPQZoPhZhLYghDyrKI8n6oUPg8U=; 
	b=a2EJsHRJSgrrNJkYVNpjwo1Vthv46usiydZQxgVckCjIJ0b9yURX1gTLNNfCTmIjDQMGGfBs4fG15hBemWDKMnd11Cnu3/UQ/rqOFKYuvBatNgyM0G48FmvNIPtbZVecnn0IJNlpKAAI97b+IjzXbLovew3F8cyXcanoSegCoto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781770742;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=5BJImhEJ6EW74MMZhPQZoPhZhLYghDyrKI8n6oUPg8U=;
	b=cg2HDsHihqkcwyzq+WQdQ20X1wodRLpiBQ2Fz1p8aTGeU4Re+S/XQGbntNsSTylq
	LNvuGAnkSDh4XJ+2Ji6lUd1cYef8YC9UNliyjDJaGzWntCsFFrj9Qq+2itSXliWmCk/
	3U84U1enI7h8CWiX9oIWktfgG2km7mo70p8h8+iA=
Received: by mx.zohomail.com with SMTPS id 1781770739779267.5548719522228;
	Thu, 18 Jun 2026 01:18:59 -0700 (PDT)
Message-ID: <2eda17d5-298a-421e-9460-ef32a65e50d2@zohomail.com>
Date: Thu, 18 Jun 2026 16:18:51 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: canaan: Clear rate fields before reprogramming
 dividers
To: David Carlier <devnexen@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618045030.12581-1-devnexen@gmail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260618045030.12581-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: zu0801122798565b00ab176dc49c4574bf00006aa5af34f0f7fb8b9c5507f3a7f43bf46172e40a5a637b483a:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/6/18 12:50, David Carlier wrote:
> The rate set_rate helpers perform a read-modify-write on the divider
> and multiplier registers but only ever OR the new value in, without
> first masking off the existing field. The first write after reset lands
> on a zeroed field and looks correct, but any later reprogramming leaves
> the old bits set: the field becomes the bitwise OR of the previous and
> new encodings, corrupting the divider or multiplier.
>
> Mask off each field before writing the new value so reprogramming a
> clock to a different rate produces the intended register contents.
>
> Fixes: a7b7c7c6c016 ("clk: canaan: Add clock driver for Canaan K230")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/clk/clk-k230.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> index cfc437038e4e..f34a3e6d3bca 100644
> --- a/drivers/clk/clk-k230.c
> +++ b/drivers/clk/clk-k230.c
> @@ -2227,6 +2227,7 @@ static int k230_clk_set_rate_mul(struct clk_hw *hw, unsigned long rate,
>  	guard(spinlock)(rate_self->lock);
>  
>  	mul_reg = readl(rate_self->reg + clk->mul_reg_off);
> +	mul_reg &= ~(rate_self->mul_mask << rate_self->mul_shift);
>  	mul_reg |= ((mul - 1) & rate_self->mul_mask) << (rate_self->mul_shift);
>  	mul_reg |= BIT(rate_self->write_enable_bit);
>  	writel(mul_reg, rate_self->reg + clk->mul_reg_off);
> @@ -2257,6 +2258,7 @@ static int k230_clk_set_rate_div(struct clk_hw *hw, unsigned long rate,
>  	guard(spinlock)(rate_self->lock);
>  
>  	div_reg = readl(rate_self->reg + clk->div_reg_off);
> +	div_reg &= ~(rate_self->div_mask << rate_self->div_shift);
>  	div_reg |= ((div - 1) & rate_self->div_mask) << (rate_self->div_shift);
>  	div_reg |= BIT(rate_self->write_enable_bit);
>  	writel(div_reg, rate_self->reg + clk->div_reg_off);
> @@ -2287,11 +2289,13 @@ static int k230_clk_set_rate_mul_div(struct clk_hw *hw, unsigned long rate,
>  	guard(spinlock)(rate_self->lock);
>  
>  	div_reg = readl(rate_self->reg + clk->div_reg_off);
> +	div_reg &= ~(rate_self->div_mask << rate_self->div_shift);
>  	div_reg |= ((div - 1) & rate_self->div_mask) << (rate_self->div_shift);
>  	div_reg |= BIT(rate_self->write_enable_bit);
>  	writel(div_reg, rate_self->reg + clk->div_reg_off);
>  
>  	mul_reg = readl(rate_self->reg + clk->mul_reg_off);
> +	mul_reg &= ~(rate_self->mul_mask << rate_self->mul_shift);
>  	mul_reg |= ((mul - 1) & rate_self->mul_mask) << (rate_self->mul_shift);
>  	mul_reg |= BIT(rate_self->write_enable_bit);
>  	writel(mul_reg, rate_self->reg + clk->mul_reg_off);

Good catch. This fix is correct and necessary -- without masking the old
bits first, reprogramming the clock rate would leave stale bits in the
register and result in incorrect divider/multiplier values.

All set_rate paths are properly covered.

Acked-by: Xukai Wang <kingxukai@zohomail.com>

-- 
Thanks,
Xukai

