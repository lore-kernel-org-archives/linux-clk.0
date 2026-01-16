Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E720C00C;
	Fri, 16 Jan 2026 05:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541084; cv=none; b=Lvq4SLLSgHMQ72cQXsTw51izIkIV0OmsUN0+V96KzikrsUYtjOCrPF4w9xyCRLk6VvRaPFlSkNSrx4x+0qC6mDX+VyWc448jztqQi7EIKCP1aJdwt2vGBbSaN31HFdvPj415yLxGZDUxZ6lgGUArfpFUHzMD94lWX45iNXtv4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541084; c=relaxed/simple;
	bh=NwY3QX/TS1dlEYZQJV31aR1WN3dHki8xFOUrGHfMi6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq7xrc7g2ABosTKahw+zmeAU2/SgUsLJTWDW8owAnZVtiT0nD8wiyxIFDgkNqXcOffn/rHbEt+UrdY9rPxs0K1WNWC8EE6IhhV0My5xaXwNcRl6eqIW8go/P6kT5WVpSgOVMLO9I9zURnSaC1+abnGtj0XtqqaKVmAirP9q9M2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loCaNHbo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loCaNHbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B9EC116C6;
	Fri, 16 Jan 2026 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541084;
	bh=NwY3QX/TS1dlEYZQJV31aR1WN3dHki8xFOUrGHfMi6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loCaNHboE8fDkZPiXWADlD0VM0xF9KyhTmq4U9vDE2o64pjkC7hsuxg+evz4rh8q4
	 F62lfwwMCgyWclcTyhgYoYJyYA/aL6hDKdsqmuvdBZewGAcayBwv8iEybcRTVPKnXx
	 4eKimeqoN6vmem+bRqSwq3ZT1uOIAedQc7SyQY1oPqPfbkI3T87j24FElfxKUWik95
	 HdNX5W5nVOPrTkrVDDfF2QHw98CGAUHOAXEVaErEX5Y5pEdwI+30qED8/vbmQrOm6D
	 QodD3KF2hGBbkG2+bg5Y8FmeN6TvZiK+Sw6s41hXylKuwboG5IrkHcgqTeZpkSs32p
	 WF8tST/Rl2taQ==
Date: Fri, 16 Jan 2026 10:54:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/27] clk: bm1880: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <lst5lt4gkjzfj2ozajukmyaozw7xeees63v6omimkvbn7xzgcl@7omzhb45ddlr>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>

On Thu, Jan 08, 2026 at 04:16:25PM -0500, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 64613d7fb42f ("clk: bm1880: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-bm1880.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index 536df8e828eab83fbd3812135139c703aa7a1ce3..1bdceb36fa87e8250c10a7fc0791379e1533bb38 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -625,10 +625,7 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
>  						 div->width, div->flags, val);
>  	}
>  
> -	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> -				       div->table, div->width, div->flags);
> -
> -	return 0;
> +	return divider_determine_rate(hw, req, div->table, div->width, div->flags);
>  }
>  
>  static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்
