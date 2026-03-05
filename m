Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2075221D96;
	Thu,  5 Mar 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716796; cv=none; b=PuhgkHVfQJ9vDbO/wFEMD8+WMxNErdJjWl6cRNdL4+6p6OzSg3QCoFng0v137Ozw41FgXpJeZ4l7g8kLnJYuk4rFhuC2OT8UaCa8/YradH37OrFqM0ICrtTkK2FN/zcni5iwhkjg4EprrebG9Cvgf4ncY9+57tzVIiL+fTKVXkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716796; c=relaxed/simple;
	bh=2b6ErHbmsNp6ReRrw9T/1LHYX0rELD4FEX/8EiAMxiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF/s8TB1C2781w76Y+p6PNxFgfqjpR1m9bVTdjQT4kgbKkDLo4Wa3yTAnwq2Aapam5dHjetjsUGvqEqpw9CXSFTOYoGxptxrn3an1S6hW66xKUMNKwPiOvuVpgF0No7OQu14nrK84xAW/8OBOGwAiT0RECApToc/97MPIi+3poc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jszM+s9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jszM+s9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30848C116C6;
	Thu,  5 Mar 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772716795;
	bh=2b6ErHbmsNp6ReRrw9T/1LHYX0rELD4FEX/8EiAMxiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jszM+s9veUVm+q8AzGoj+JgCcGNarYbGIpIDz/iQaCbiWWGX/aL6yBdKzx+RcpjWq
	 8tRHL3WXG/FyGYMfI43PZdoOljnANTwy5Sg9/K2SjMo5H/eWet3Py8wV/lDTdURheL
	 6iXXAfmPCKdAIkQwd3rcsJhFqKBXekgiEQyin0qKp3/6Al9GDyl33U7J5xj5alxJrZ
	 yFxcGaw0OqYHAj+XZtoDrWhEftts66Ie1SjcZEP2/pyUCTwl+zaz7vNmdxoYEdmMCP
	 EfQ8KNVfuM5PdV7uiV9Bzj6z2ox7FcX0NWhOVHbrTkxJ+pSa3a9XXN1l9cj/Aimh2A
	 94CObXLLHbSGQ==
Date: Thu, 5 Mar 2026 21:19:52 +0800
From: Yixun Lan <dlan@kernel.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
Message-ID: <20260305131952-GKA302167@kernel.org>
References: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>

Hi Shuwei,

On 20:46 Thu 05 Mar     , Shuwei Wu wrote:
> Fix inverted condition that skips frequency change trigger,
> causing kernel panics during cpufreq scaling.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

Thanks for catching this..

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9578366e9746..a8b407049bf4 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -73,7 +73,7 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
>  	struct ccu_common *common = hw_to_ccu_common(hw);
>  	unsigned int val;
>  
> -	if (common->reg_fc)
> +	if (!common->reg_fc)
>  		return 0;
>  
>  	ccu_update(common, fc, common->mask_fc, common->mask_fc);
> 
> ---
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> change-id: 20260305-k1-clk-fix-25b101c88459
> 
> Best regards,
> -- 
> Shuwei Wu <shuwei.wu@mailbox.org>
> 

-- 
Yixun Lan (dlan)
