Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8524438471
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529461; cv=none; b=sR7Fl3lAADyUffVsDzO8HvpEzmskkFwo6WvfY3OAeyBue1aw7xINFHJGWLbDvIR3AjfMoz2qtvWAdYyaFQUeAT1oa4hzps/J5zyvLMpEFge+qf0Xap3HoUAHsFsgKlEOU0EUZMlfO0AF+GhTNL79cr8cIxVFNId8aTL49T+SC+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529461; c=relaxed/simple;
	bh=tz1PhZPqzbgRuWMGzhTLhnfvzEdK9DN68mDDZnu/57w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwIurvcbFdhv04bGEkoTzfwV+uIApgKSy+g3XXppSaK/XjcZ2onvhryHkbhz5ZWiL445dMIRWAvw2Ix0fwucAP2A86RyGjKatrwcICjZFMmeZ8BIY7/Dzgi/b6XqA5a+lRESCLGlal44rk8SnoDHMKnNFRiC9EPEoe1DW5r/n6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OW3qO8fb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QxdMqmBo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OW3qO8fb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QxdMqmBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783529446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
	b=OW3qO8fbKM/sApYx/A9l26ruVnL+hTHbbdGjCW6uUXfuHCD+OiMkNHfoSQfDrhk50OAk/f
	z+fBPLS98L03ZvfSAqi2WANwwI7tGFUYFJ2jb9+MHyX7ImzdTSTp2Sn8/T1c7ESdNiv6R9
	NlV5uWQJSMWS5j6uELtYRfxydkWUODc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646--uBqgUwRMCejMQ_ipTR79w-1; Wed, 08 Jul 2026 12:50:45 -0400
X-MC-Unique: -uBqgUwRMCejMQ_ipTR79w-1
X-Mimecast-MFC-AGG-ID: -uBqgUwRMCejMQ_ipTR79w_1783529444
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8068416764bso28160447b3.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783529444; x=1784134244; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
        b=QxdMqmBoCEUC1UkpXRE6QnRlPoUTt9Ic8Re/AOB0V9JyHqiUSztSq2WDtU3HlPi4bl
         00wtzv729k+7PYZxfshc42x7yWMukzRA06fh8KWUU+ocxWaSmUNl4maDU0BZabtc3lFx
         GRp0ogdwLGoy/DkQF6M5y0Tnt3DJxrHdw/Odad7HUe40MlRWq+Xt2YC3HKklJDsFRNDd
         2Z5PvM6b/0cBHh/az1TRVqbEafbbXnRb/uzdCEs40Tv8Mxoorf7oj+r1k3PEMs9uzCSr
         SS5E9N0Izp0k567XSZ4pgYrEbv75M25WQVMJtCe15KDvRKMWke7GbiYCQDfXkx5fqZ0M
         HbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529444; x=1784134244;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
        b=K8Hibdwh9qzy+TaT83l3atiSGD+qYwi0IFxSXQF6a6sf/Ov+J6d44MfJ93Kvlcj2+n
         gBgEVpUx2AVb7efyuWfTlzlVusXAa9M/X/hsyZKneS+q0NGTp/DN5ZYbx6et5vuCaLoC
         y9PedttcJAqN/GZKYTp4fzjQcsC5vUYe5rmoRq48fkzVAimTZW0A0ah1VDLtkBFx4DLV
         938H/QyYJOCtEKU+bt7PXudMEZsBCFKzzopNRL33Bmtei34P5XBDJsFZHYuUrK8d1XQ7
         IdznBmllSusupw1dMyRkGg6O6L9kI6NU5BlO6FQH2H5SD2tN4o42g8l9gLZOBzdMN9jL
         1eyg==
X-Forwarded-Encrypted: i=1; AHgh+RqZ40EyEyEebstQG4GM6MyuYNwXFx2njq8yUU00ZLEC8GyvHWoWsRUbUPmqUEloGJ8hyYzp/uVQSGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvjS51GuQcNKpgNOAydPy4/Pu4KzngGlu+NvFz86DZMz3v98Ve
	lKnEic/udWeYQdcNJh4cWj3rUwB3LgHqEODsyj/LQjc9w3hgIz9sJgQCINIDe2wMWwUPq2ZsrAj
	4O0mSWu43uD5WrR5uTmUD+xaCMkzBzBMiYRNa9os1plk5TP392bNjKOV5j9+zHg==
X-Gm-Gg: AfdE7clpmb4ZQudpTzl+HriaYVK75fhqBvEcR9eEtrKxEO1kg1QRWc2nOysNJ7jFBhh
	xRD5+2TeI8MxxA5ixvVAMlNiBQDwiNEX3/Svn0qt4lJSwlNHNXzTHugpSWmtTbtFZBrqAUh1ADY
	GX7o8ub7kRSfI2FQo+9moiq1nHlQdHVTij4GcX+9NiUck2obHXf5ZVv50xq52AZvEmIUA2MmxZF
	LlPznORBJO9y5ZSv7vJPm69kLljqgr3OhSZw8gcKNjJuUNWagluGby4/wEHA3wvywZ7ok/n0TOO
	A3BE7LM3M3Jm7vwadY7KN4gIOUC4s+Q4hEN9sBj/0qnRhBAKcow2T50q2edv9HakgKjqhV3Npo7
	QgPj7M+EN4OQ+RLFNOWD32/VJTLlsv1hkvjhgD1v//7uakA==
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866587b3.17.1783529444310;
        Wed, 08 Jul 2026 09:50:44 -0700 (PDT)
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866277b3.17.1783529443859;
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8143dfebd55sm86860117b3.0.2026.07.08.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:50:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
Message-ID: <ak5_4aTPwWPdczms@redhat.com>
References: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Louis-Alexis,

Thanks for the patch.

On Wed, Jul 08, 2026 at 11:18:59AM +0200, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch aims to fix a issue, detected by Sashiko
> during another series review ([1]), regarding the use of 
> mtk_clk_register_pllfhs function.
> 
> The patch is based on linux-next tree (tag: next-20260707).
> 
> [1]: https://sashiko.dev/#/patchset/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a%40collabora.com?part=6
> ---
>  drivers/clk/mediatek/clk-pllfh.c | 87 ++++++++++++++++++----------------------
>  1 file changed, 39 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> index aa95cd9197b3..7463aa35d7e3 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -197,6 +197,43 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
>  	kfree(fh);
>  }
>  
> +static void mtk_clk_cleanup_pllfhs(const struct mtk_pll_data *plls, int num_plls,
> +				   struct mtk_pllfh_data *pllfhs, int num_fhs,
> +				   struct clk_hw_onecell_data *clk_data)
> +{
> +	void __iomem *base = NULL, *fhctl_base = NULL;
> +	int i;
> +
> +	for (i = num_plls - 1; i > 0; i--) {

It looks like this should be i >= 0

> +		const struct mtk_pll_data *pll = &plls[i];
> +		struct mtk_pllfh_data *pllfh;
> +		bool use_fhctl;
> +
> +		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> +			continue;
> +
> +		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> +		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> +
> +		if (use_fhctl) {
> +			fhctl_base = pllfh->state.base;
> +			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> +		} else {
> +			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> +						    pll);
> +			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> +		}
> +
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	if (fhctl_base)
> +		iounmap(fhctl_base);
> +
> +	iounmap(base);

When use_fhctl is enabled for all PLLs, base will be NULL.

Brian

> +}
> +
> +
>  int mtk_clk_register_pllfhs(struct device *dev,
>  			    const struct mtk_pll_data *plls, int num_plls,
>  			    struct mtk_pllfh_data *pllfhs, int num_fhs,
> @@ -238,24 +275,7 @@ int mtk_clk_register_pllfhs(struct device *dev,
>  	return 0;
>  
>  err:
> -	while (--i >= 0) {
> -		const struct mtk_pll_data *pll = &plls[i];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl)
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		else
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	iounmap(base);
> -
> +	mtk_clk_cleanup_pllfhs(plls, i, pllfhs, num_fhs, clk_data);
>  	return PTR_ERR(hw);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
> @@ -264,38 +284,9 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
>  			       struct mtk_pllfh_data *pllfhs, int num_fhs,
>  			       struct clk_hw_onecell_data *clk_data)
>  {
> -	void __iomem *base = NULL, *fhctl_base = NULL;
> -	int i;
> -
>  	if (!clk_data)
>  		return;
>  
> -	for (i = num_plls; i > 0; i--) {
> -		const struct mtk_pll_data *pll = &plls[i - 1];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> -			continue;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl) {
> -			fhctl_base = pllfh->state.base;
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		} else {
> -			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> -						    pll);
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -		}
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	if (fhctl_base)
> -		iounmap(fhctl_base);
> -
> -	iounmap(base);
> +	mtk_clk_cleanup_pllfhs(plls, num_plls, pllfhs, num_fhs, clk_data);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);
> 
> ---
> base-commit: b3a87fbe738f19cbe19411cf749f3d8c09c04de4
> change-id: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2
> 
> Best regards,
> -- 
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 

