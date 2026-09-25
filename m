Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4F4A0922;
	Fri, 25 Sep 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344235; cv=none; b=jpdDls7WHhtsUxfLFenkzbnyI7K6IPJYNprOqCo+N5/8ROBNVngzqXzC+t1zxXkGbAN3qA9pC4mnWfblJ3s54Cj+BMS4Gld0wi0gr2DC4Av68YjKkTdXziDAxpJBTGhsmHEuRA7AewZ9iZ3GY40nvyzBerLYHDlBV5gKo0odib4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344235; c=relaxed/simple;
	bh=aFZMlh61mEvJ/kczoJkVisSOkT0f0h2WaCnMW5ue4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z80p3zzkUIKJtdDdZbD3OG0wOQqg/H+FNdfh59VhSrHsdssiscQpGvho23Dhd10NXkysym4UTfIrHFpihjr0JjKffhbTCNwhy3R7n+WROLsWG5dlzqVeRDtsizFjBLVVTgH1IVrzqycOhwAz+TN2mj5n16exbZX4SvjgwwtZoAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZd1E6Hr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZd1E6Hr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EDD1F000FF;
	Fri, 25 Sep 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344233;
	bh=l5HrPMFttueHbpUIya9uBiX/PZZkmM38WSrfLSn9brY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZd1E6HrpoGBnyagR9Du6Qlmtj3q4Pae5yANR7j9QB8uWHUMSV9ZZQLJgTBugvI29
	 a/MtYs8jSETHzHTog1Wk7d+Wf3RPIJSltHKlP2ajb6h55ACJ1PEqmjaPUamfZKpeII
	 ItwkkI9kh3ApQCyTJO3t6R38M+zBtyXIu45QNusZUsx6FFmF/r1eGO+7nles4EYrpG
	 Wq/PfFickSOF0INE7jY1uywVqddSI649revGo2DXCQDrZYNvWBRR8S1xGRb3qrhzUk
	 2H8RJgOMIqsZOnnvzAAY+th0ZRRixoNMXzkgExglLafRxcewzOUkgvKreDvabHWhbq
	 BbtW1Cp+KX0Yg==
Date: Fri, 25 Sep 2026 09:50:31 -0400
From: Brian Masney <masneyb@kernel.org>
To: blaze <1466528493@qq.com>
Cc: kernel@esmil.dk, hal.feng@starfivetech.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: starfive: jh7110: Fix clk reference leak for
 pll0_out in jh7110_syscrg_probe()
Message-ID: <arZ8JwLVP-WeKjIw@x1g10>
References: <tencent_0D58C9974B2D7889109BACF393650FFD8706@qq.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_0D58C9974B2D7889109BACF393650FFD8706@qq.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi blaze,

On Wed, Sep 09, 2026 at 12:43:31PM +0800, blaze wrote:
> In jh7110_syscrg_probe(), the handling of the three PLL clock outputs
> (pll0_out, pll1_out, pll2_out) follows the same pattern: clk_get() is
> called, and on success clk_put() is called before setting the pll entry
> to NULL. However, the pll0_out branch is missing clk_put(), unlike
> pll1_out and pll2_out which correctly call clk_put(pllclk).
> 
> Additionally, when clk_notifier_register() fails, the error path returns
> without releasing the clock reference, leaking it.
> 
> Fix this by calling clk_put(pllclk) after clk_notifier_register(),
> matching the pattern used for pll1_out and pll2_out. Placing clk_put()
> before the error check covers both the success and error paths.
> 
> Fixes: cc46f7c9edc4 ("clk: starfive: jh7110: Add PLL clock source support")
> Signed-off-by: blaze <1466528493@qq.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 0000000..1111111 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -432,6 +432,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  		priv->pll_clk_nb.notifier_call = jh7110_pll0_clk_notifier_cb;
>  		ret = clk_notifier_register(pllclk, &priv->pll_clk_nb);
> +		clk_put(pllclk);
>  		if (ret)
>  			return ret;
>  		priv->pll[0] = NULL;
> --
> 2.43.0

This patch is malformed and won't apply. You should consider using b4:

https://b4.docs.kernel.org/en/latest/contributor/send.html

Brian
