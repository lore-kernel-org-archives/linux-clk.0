Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC63DCD86;
	Mon, 27 Apr 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309944; cv=none; b=dT4yROo94bNRRe7RFZoOv8Xtu13KmEqkYSw8X56tqS5woS36ccWOamBbtrIPekYFla+8YwcQxJITEoifMVaZ6XxnpVNI4ZolULSePOBwjibiG/i/qIoUqzbfv7al+2sc72ScWgivEPcZxCr3mdYoELTloccoQD//qUAg19SFbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309944; c=relaxed/simple;
	bh=x0wHrDndajbvYbniFczkxqF+4dEPk/mWr4CD3Z4w7Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHtUrWHisQLOdEQ9WU3hKZP6fl2BLu6a7F2O3m9q5Ek9E4t+jp4cvdVGb3/dzOXBhJiD1rIe71fzB0i7u6ePfTqKASp968TRE56bFdbZk57n7gcvHxRhcP0UEctSG4UXG0sjNagdajibpfexxYAh1ljiiv7LZyUZ47Ni9283KVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLvDgVCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLvDgVCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928AFC19425;
	Mon, 27 Apr 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777309944;
	bh=x0wHrDndajbvYbniFczkxqF+4dEPk/mWr4CD3Z4w7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLvDgVCcWK8XkASGaMG6D+dTQdb5LsQFRLnhywkX+UtFXNR7mv6vJAiVl/MotnIhg
	 Q/h5dkQxyt/Jwt5obJMOZQ/WkNWLU1a1TWMhFqf1LMMxcC+6JRtY+Xfn5Bt5Bo67Vz
	 X3xgesHl9UEBuUg4GhVOzui8Gq8TLiOx1mciTcmpORucvT3pwE1bZvxtQ7ZBQ+yg/R
	 D9fp7fZtypiZ7shEovNeh2AzLJ7ZOpRRvhBj/WSYdRGNZ/FvPnQirdi8IRrVyWyh7W
	 ziLhFAklzFy6NEGEhVBBi0tZJawZpFQRTAyccuySUbLyggMFc2M4LadkHH9pQiG5Tx
	 gkHIwyIEHKgCg==
Date: Mon, 27 Apr 2026 12:12:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop
 disp_cc_mdss_mdp_clk_src from getting parked
Message-ID: <ae-YlXZAuWqgPd-c@baldur>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>

On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
> 
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> 

Wonderful, thank you!

> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Could we attribute this to one of the commits that changed the parking
behavior and get a Fixes: here, so that we could pick it for -rc?

Regards,
Bjorn

> ---
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..cd45bedf2649 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> -- 
> 2.54.0
> 
