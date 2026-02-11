Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0455C30E0F2
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813449; cv=none; b=XbgjVpHLRYuhQaYhMT1g+LUx36CvLzsRxbrxXAKQ+l8216ukSWi2waLC82MjTZxgnJrsq1t8umNhWNC0DdskDF+L26zDr/VAhMq4QkPL+uwOpj9LQUkeupNkCfgDS+LHhCXViBh/urzr9kCGdl1fZ5cz6fTEDegzMj5sBsvkCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813449; c=relaxed/simple;
	bh=HjrP0WJhoRH3T59PubZchJ/ad4rEbKZ13ceB+7CVFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq29Q2HHg3x1eJGphpuxJx10lK9xezQeTz38au8vSU8bBrRNlcDyNQGZQ0e26bir+4lkbDFYybzdKKVaqKgdzvRRnodWxEyPFolipjXSmKNjePXbTjxo3Kb/lpMRSliXMnFB52hwePQ07iNKvEYZ1gngVihRqT0M2F5yJ1WFOoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2B1F497
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 04:37:20 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DD4C3F632
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 04:37:26 -0800 (PST)
Date: Wed, 11 Feb 2026 12:35:19 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linusw@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: vexpress-osc: Check return value of
 devm_of_clk_add_hw_provider() in vexpress_osc_probe()
Message-ID: <aYx3hyPHD5GbClYD@e142607>
References: <20260204063332.1791986-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204063332.1791986-1-nichen@iscas.ac.cn>

On Wed, Feb 04, 2026 at 02:33:32PM +0800, Chen Ni wrote:
> Return the value of devm_of_clk_add_hw_provider() in order to propagate
> the error properly, if it fails due to resource allocation failure or
> device tree clock provider registration failure.
> 
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete clock provider setup.
> 
> Fixes: 03cc105f2edf ("clk: vexpress-osc: Use the devres clock API variants")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/clk/versatile/clk-vexpress-osc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
> index 9adbf5c33bd1..2292fee4e423 100644
> --- a/drivers/clk/versatile/clk-vexpress-osc.c
> +++ b/drivers/clk/versatile/clk-vexpress-osc.c
> @@ -97,7 +97,10 @@ static int vexpress_osc_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
> +	if (ret)
> +		return ret;
> +
>  	clk_hw_set_rate_range(&osc->hw, osc->rate_min, osc->rate_max);
>  
>  	dev_dbg(&pdev->dev, "Registered clock '%s'\n", init.name);
> -- 
> 2.25.1
> 
