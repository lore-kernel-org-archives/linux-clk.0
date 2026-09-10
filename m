Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289FB48D860;
	Thu, 10 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045342; cv=pass; b=PhHQXqicnYH8+y57KbMM5XUUVptAcJismufSVZMcqHVZ3q3BcF6GxAKi0LluVKcyYwEsU0eI/b7Rh8+KnG7dQyWlnkPKfi2EzmPbx4bq4slLdbHuqdayyMA1aynsvU4oQbYYmiWg05R9Q8x5bjMd4eIX7Bj8KL5Hdem+OAtPa28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045342; c=relaxed/simple;
	bh=Ry9QkMDw/zkJ+YWqQ2iFcmSpH/1eNOCI1ejCIJpcBDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvrtfZfGs2bJ3Uz/gxNELBf5jHSLcDOHdKcD8isYBAGIWqm21M5IJBizR5mYch4lp71blhnhHY4xzgwttlRjwypm6SOJ5qqbhzg/sUOoY9s9bpvGAILAwatqH/iijL2ho/89tsAEH5RZZrnJMBvruf7v1fOTKqFexlnXqSLNmz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=ATru7tAn; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="ATru7tAn"
ARC-Seal: i=1; a=rsa-sha256; t=1789045318; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lHpaTgX2lR6byZhp3HNgrrg+eHsQoyKnpEOL3YjMpvnsDvc50yZBRpsUFirnmc3qQNzMBLtd4JF/+VyFIFaEEEvcyNStjT/dvbFKppFL3+VsOwdz5ibYeSnl//2mEY9Pg77ECz1T8ItGgeVP0uT+X6uJrfPWfUJvpGro2xi+8qA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789045318; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=45nffq/Zr2o5JdVjGW3q6mmCc+x5WnknLVPkYUCAZq4=; 
	b=M7pZyTw5EtUm8IBdgFL7EicITtLG3RKxLGTFXRICT3osAtIpgk4cQjURjZwvvhLIEDLN8QI0NIeV7kqjhSUiXUP8QhJRpBdo6M+b22se7hRcT1n3nQJG7C+GzmjXh3jlbjptcDpI/+zfvXNxISu+Yi2g6r7ocZtiQFxvysEO1hk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789045318;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=45nffq/Zr2o5JdVjGW3q6mmCc+x5WnknLVPkYUCAZq4=;
	b=ATru7tAnfYYtc0DMIMF6ID7+HJHOYpLIN/MZ6uzWOyq7Jhx+dbM2xD8jzSlLBZM5
	XMY3BB7iJvqxpMkHygNJRTo1N+miXigrshtfW+MbItPWjPx4sKbW5nYfRi4m57ACH/t
	HoL4nkg/jo8Pqs80yfNrFu/bOsZm3Z4vGFt9vdeU=
Received: by mx.zohomail.com with SMTPS id 1789045316428631.4804164269831;
	Thu, 10 Sep 2026 06:01:56 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:01:30 +0000
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
Message-ID: <aqKqKkXbTkcS-pnY@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External

On Wed, Sep 09, 2026 at 10:07:02PM +0800, Troy Mitchell wrote:
> CCF passes the selected parent's rate to set_rate(). Searching other
> parents at that point can produce a divider for a different source,
> making the programmed rate disagree with CCF's selection.
> 
> Restrict divider selection to the supplied parent rate and use the same
> rounding as divider_recalc_rate(). Track the best error separately so
> low-rate requests do not leave the initial zero-Hz candidate selected.
> Skip zero-rate parents and have determine_rate() reject requests when no
> usable parent exists.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index a8b407049bf4d..da3c5685d4f65 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>  	unsigned int parent_num = clk_hw_get_num_parents(hw);
>  	struct ccu_div_config *div = &mix->div;
> -	u32 div_max = 1 << div->width;
>  	unsigned long best_rate = 0;
> +	unsigned long best_delta = ULONG_MAX;
>  
>  	for (int i = 0; i < parent_num; i++) {
>  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
>  		unsigned long parent_rate;
> +		u32 div_max = 1 << div->width;

div_max should be invariant across iterations. Is there a reason moving
it inside the loop?

>  		if (!parent)
>  			continue;
>  
>  		parent_rate = clk_hw_get_rate(parent);
> +		if (!parent_rate)
> +			continue;
>  
>  		for (int j = 1; j <= div_max; j++) {
> -			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
> +			unsigned long tmp = DIV_ROUND_UP_ULL(parent_rate, j);
> +			unsigned long delta = abs_diff(tmp, rate);
>  
> -			if (abs(tmp - rate) < abs(best_rate - rate)) {
> +			if (delta < best_delta) {
> +				best_delta = delta;
>  				best_rate = tmp;
>  
>  				if (div_val)

Regards,
Yao Zi
