Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D552517AA;
	Fri, 16 Jan 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541040; cv=none; b=OJwfknjLiI9k/sRf0wUkXP2DyWpppMtcZyT1UOA3cIZmQRtmyTr5rcUWBsy5jZjggN2EvTH0ZRxQF+KQ2IC9zoV6oI5yt7i1RghtQ+pOfxoCcdvg4hod9eYP6wgXZtgrtpUHbmHppqXvfcPuKDl3zZfsWaDXPjCDqHccvUtapy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541040; c=relaxed/simple;
	bh=BQu3mpLQG6eHjs8ydYktrN0gAodUMDTO76Ji6LqLCD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqSKORGbj/Kw2ukDT+TWd5AcVGHXE19chbKMnRlLKLl1sA0EInHgfkrrfSTp4SuReF/ywvkMJbiVPL5nTb9PEDQ8ZJj1m76dDw9FfZiekQ2dKMnUUv2hBhobAU9o83o5QSiAtW2YjSwkpS0uEpeV5Iz225Vq4IMluCTpFuOcoI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6z0ZKUm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6z0ZKUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B19C116C6;
	Fri, 16 Jan 2026 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541040;
	bh=BQu3mpLQG6eHjs8ydYktrN0gAodUMDTO76Ji6LqLCD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6z0ZKUmK2HQkrIu5eLrl4KEqF3mVgSTqyeR2lhV8gVZm4hh8I/7Xfy5qy2rbzvkG
	 OizGRaU4TBYdUERLOrKUP0XeCDQ0LfRmxOTMxvDnsZlkMCWll5SDRkXUKEBGTtpIvs
	 e0/sKTc+teBN9yDHETda+8U40mZXeFsL7HP92GchywAp1doYYd+fkOzgqANWUYlcKU
	 nn0nCHKVk1gEh9SBrppajDOfJX+IDXx//RDL7bFuXgpVo6uwmWXYm2UaH6qV//uGji
	 PlKJLmU+WBMoqsb07Eo0zyusNpuiKzl9ysr5syjbpgvI/LiLjks0Nz2Dzz3Kndg1YK
	 Tn1YuL6HqnUnQ==
Date: Fri, 16 Jan 2026 10:53:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/27] clk: bm1880: convert from divider_ro_round_rate()
 to divider_ro_determine_rate()
Message-ID: <qwefkxof64ndorzghf6itii532ntbafzpqxvpn5lb5eolwikho@s7zenouizofa>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>

On Thu, Jan 08, 2026 at 04:16:24PM -0500, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cf1d95fa0c64 ("clk: bm1880: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-bm1880.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index dac190bc6e19a6dd4be413ea52d41f74934a1aa9..536df8e828eab83fbd3812135139c703aa7a1ce3 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -621,12 +621,8 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
>  		val = readl(reg_addr) >> div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		req->rate = divider_ro_round_rate(hw, req->rate,
> -						  &req->best_parent_rate,
> -						  div->table,
> -						  div->width, div->flags, val);
> -
> -		return 0;
> +		return divider_ro_determine_rate(hw, req, div->table,
> +						 div->width, div->flags, val);
>  	}
>  
>  	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்
