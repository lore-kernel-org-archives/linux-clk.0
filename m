Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA643225775;
	Fri, 16 Jan 2026 05:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541255; cv=none; b=o78p9EGtI3aWIFwrXvS+rsjjubSpEDnP9LqbiABKukQ42xmBOG/qMn6I0PJLVudEsh+TPDLCs9QNfwBBx5n3g8aOPJHucOp1wRBXyqr9GSTeexJw509YGuLfSi7esRJlzQxC5kRwlcUqTimnAl3hUs0QL4my14DF7f3bxtYg8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541255; c=relaxed/simple;
	bh=DTf0sFPARXBUzVNF830ArBxXls9z63UypUbrXvLzkQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxoHPrfxCso66zClElXHlkBWPZ83s/uiKxfXGKZov62rN6CtAp/6VbSfakVHS+lLxEl6uBVgrGdkq3QgHqPKvuJxg+E/zIGJJGzkZ91cUUSEWpEz466qXf2GNEFORDNb0cn10WQ+lzSq4Iu2lkIBhbvm5Q6E/nYJ52mvBtMSnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnLEXDt+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnLEXDt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DC0C116C6;
	Fri, 16 Jan 2026 05:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541255;
	bh=DTf0sFPARXBUzVNF830ArBxXls9z63UypUbrXvLzkQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnLEXDt+LR4q7hSpdBzokWnEHw6mWMVj4qBBhoz/yoNkF9UbuPREatcMZVCURJA6o
	 LiJx6Zq83fPhMJUHPSdZuO3wmYLF780EN3BJendmfPACeSSHPQaKlxYXktohZb4MG+
	 qU7y0is5WmOmoQ0hnP7z6+giDqEmuiw133LQpgA4zR4lB8M5Fbyck7D1NcTw4f5Y8R
	 SXJyuPEhON8ixbTxQrLpmSCaNCP48zxkvLMyz/ijM2X+3u1DjJI7tt7wAYQiu8aL6M
	 9F6QxB24alXuVmZ6giRc9A4vdL9lUKXbmZ0M5bleDcv7oMI+zXn0Un+NWle71ECkUy
	 dhPbqVPvVey0g==
Date: Fri, 16 Jan 2026 10:57:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 04/27] clk: actions: owl-composite: convert from
 owl_divider_helper_round_rate() to divider_determine_rate()
Message-ID: <gn56qksoznzuexepv27wfn44xyow3nqzsy7gv7jjvty2orfmga@53xsfbu2guy4>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>

On Thu, Jan 08, 2026 at 04:16:22PM -0500, Brian Masney wrote:
> owl_divider_helper_round_rate() is just a wrapper for
> divider_round_rate(), which is deprecated. Let's migrate to
> divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: "Andreas Färber" <afaerber@suse.de>
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-actions@lists.infradead.org
> ---
>  drivers/clk/actions/owl-composite.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
> index 00b74f8bc4375a8f42e9b54c7bf1affe91e1074a..9540444307d6c960af200ec13e7c60abd47ffc85 100644
> --- a/drivers/clk/actions/owl-composite.c
> +++ b/drivers/clk/actions/owl-composite.c
> @@ -57,15 +57,10 @@ static int owl_comp_div_determine_rate(struct clk_hw *hw,
>  				       struct clk_rate_request *req)
>  {
>  	struct owl_composite *comp = hw_to_owl_comp(hw);
> -	long rate;
> -
> -	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
> -					     req->rate, &req->best_parent_rate);
> -	if (rate < 0)
> -		return rate;
> +	struct owl_divider_hw *div = &comp->rate.div_hw;
>  
> -	req->rate = rate;
> -	return 0;
> +	return divider_determine_rate(&comp->common.hw, req, div->table,
> +				      div->width, div->div_flags);
>  }
>  
>  static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்
