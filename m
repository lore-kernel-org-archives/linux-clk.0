Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE428642D;
	Fri,  9 Jan 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946213; cv=none; b=t6QRy/ygKUnAddCYZUi3ciaZYX7L/sNPMw6ArNEoDN+H1zB06LZWCZrZ27OBcy0Df61ooHXwYu21RO3T5WiBX1sxX1Z5Mb4smytqWhQP/P1yXYGc2A3o/vDBnmNkjXpJhe3wg8FN1FxFkcl6xTVpCtJ1RQpQrx+ooyGak1QRgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946213; c=relaxed/simple;
	bh=t/E7bKZ+u/vdPJTBp/1yUrD65ZcPdr1jOsuXNAVd5uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uiwnh4Zg1+RhxggRvp2GhTbz7hL+CovHPhtwZuR2D1qYsqyEnk+jur3XrOqHYZfLzZaPo1oFpXxYSuEdwtD+XdTuiIuQMDQD6al8PRdEstK9wvRamQ0Tfp8q5gURXcAZd5a3eYnVFglo6jKcc9Cn63kaglsg9gCD0Lj4Yw2a8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=khnjaE9e; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=FWIm4lCP; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="khnjaE9e";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="FWIm4lCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767946210; bh=t/E7bKZ+u/vdPJTBp/1yUrD65ZcPdr1jOsuXNAVd5uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khnjaE9eSEq0AVmiTfWRsMEERo9YbJYPVsBBdp/zEizvxFQWhPWK4i3wv01L87T+F
	 KDO2h7mRaoy2NMaz8ilOkgy4PiKwcw+gaifEjvbmWcN1yqfsLjO1l9b9RFQx+qpKJK
	 O3WFUrx0wuzS8lAi1vSyy9cDee4+Hu4t0tbdFgKq0H8GRY+uw/XGPyWAf1+drdi3Fi
	 gwHNjpl7+sl8LQDyRtdE9e3Fd86Bhfkm0ePLAJZetxOScEf+H3/qIEFptXhOoTAazu
	 60HUbzEHg7XpLNq84lev0zipzmhOWhL1jlwmBPD9IJyq/pFh2N/Q/EU/MLkHAWNI0z
	 iubSFF0m2mV6A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0D62D3EB34F;
	Fri,  9 Jan 2026 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767946209; bh=t/E7bKZ+u/vdPJTBp/1yUrD65ZcPdr1jOsuXNAVd5uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FWIm4lCPRFPUrO32qC58RZ105QCWyu7VBOPCx7+xwuV8HDPQTc2HCFLrRYCyBRrbe
	 cnzV3tZF/VSt+j0SanatHNMqPJBnhyfxZE0pSlE6eb9zqEguOG5hFVCFjC6AN4gXkS
	 i2rhnhlDFM2Cm5aKXvr4e3rj6pMqw93x5JdM1WXyLVNrs6BBLgbekwPDhwrhPGsMws
	 v981/Fc+fPNwvyxD71PNp8PRMCkRFEFS6sm7gFChaMz2WSfBH/lsChNM/6Oov57b0W
	 Hlxr5/WOdre1KtmG1OQFdGglbz1Jnq2OQY8Rwq2JYuZznBRqEyLcLhYoiRZXEdW08O
	 QBbgrISzIweyw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 8D6A73EAC0F;
	Fri,  9 Jan 2026 08:10:09 +0000 (UTC)
Message-ID: <4e69222b-8e26-44d8-8e09-379e7f4c7d55@mleia.com>
Date: Fri, 9 Jan 2026 10:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/27] clk: nxp: lpc32xx: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260109_081010_069918_D0411628 
X-CRM114-Status: GOOD (  17.62  )

On 1/8/26 23:16, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>      req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 0879768df240 ("clk: nxp: lpc32xx: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Vladimir Zapolskiy <vz@mleia.com>
> To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/clk/nxp/clk-lpc32xx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
> index 23f980cf6a2b59ee1c93a2519fe5188d251fa12f..ae2fa5341a2e4fbe5f2d3ef9a6cf9e9d75180d59 100644
> --- a/drivers/clk/nxp/clk-lpc32xx.c
> +++ b/drivers/clk/nxp/clk-lpc32xx.c
> @@ -975,10 +975,8 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
>   		return 0;
>   	}
>   
> -	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> -				       divider->table, divider->width, divider->flags);
> -
> -	return 0;
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
>   }
>   
>   static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
> 

Tested-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
