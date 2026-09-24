Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA5E4AA1F3
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272326; cv=none; b=n6jI500Gs/aNRAkbtDz1slPdxVZ/Oi1vuxSu8MRyNBtXKULEwhp74wneu64yuONhjQer0XvgIXOgypeFjcRFmh8kGLs08SF1Usla1NbpttVzNSBfglB6DC9KdV5X4K0eFLPQvF2cu5fhWGE+y/JVC44UQZFh5jKHmGSDN5Cq8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272326; c=relaxed/simple;
	bh=lqKZKprNseAnNL68Qm48AJ7YdmaWNYaS2rikkdTye3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWd4xMd7ahM6V1RCHW/Eh4qfJ/MCTA39CJB2pIn6Gkzo3Vkh5shCuOCNEyDsKLXyI7CHMb3uFP75wC1obpZml4u1m2OAXbLMRTez+AVc7H68A37WWMK4haJBLx/vavco2OGy39hWgKK8mA4S5LTRHUR3Vxf1s2IDHqPNXfhB8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=W3UYRyOC; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="W3UYRyOC"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so810177b3.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790272322; x=1790877122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=W3UYRyOCCUlfR0V5biCtyvIzeSt5vDf1cLOJTqVxGVFnoVgrKUzh/iTPbVYY2E4iH+
         c1LBhX5O3jOWkQOlEV5j5QP8UVBsmxWRkNtS9FEyzRD2XoCHUoGD3ivl7qlXxll0sunT
         TIo9VkdQAIysfSjAy3fS2M2VoSjjIPO4lnc+x208YFjFIM4hqA5NekPSSLvmguQKflih
         hwb+1R1HhyaljVZMoxX6YheUdVBGODPCpBJKxyaw9yD2pe1qRaCbT3x37MY6Z32+7w7R
         I4N8gNPnWdlYNDqbJ03bC391I/zY5+CS5HKdRx4wr3pR0BhARyfU596xwnWVbhDLlEFF
         cW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272322; x=1790877122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=f2bqtPp1O0pHP/Z26L5Go5dFiRfc7oZZnAsQTTNDsftLUsyCIejdw2QyRIitvQgIgw
         vEZbn81sqMb+RcOOdn4v6+w4qJiH7yOmA4gVEbzbcTyex34sy32aWXH8h20N2gr16Wqc
         Nhf+tocPpoopVQJQicE/rO/puInxQ75ZD7ZWuh/+DfnqqPx+DWBYoAQH3WrbYY/zdNoj
         +7w2KkY9ZeGZgCQpwFCufGX/DMltTdo5MrGfqYV0YBQRZ/Vl4/9pAj6QQ1E5684PAh0t
         LRK5WNJRwQiWaMuX3nwWxGy7uvnHzG0D8IuXCmazVkj0QY1xgAqOCUpcnp1o3f9JLs7v
         ysew==
X-Forwarded-Encrypted: i=1; AKwUvBz8lgsmFN4wYXGS9yvBLLOIf+7eMQ9Umxxplbzch9dADjnrrj9ogtsOH1i/KQknyDJee5Osl5PztRk=@vger.kernel.org
X-Gm-Message-State: AFuF++ngK7/3DHERWlYv+OCGPvvlElqOTd/o8jr300f2b4Tyrz7HquQ2
	X0/fAXtu5zaAlJVrn2jDQ/rB/1bD5BHjXjosIrbB5kbMqqjpZSRQp/Lui93BVS80uIM=
X-Gm-Gg: AYBFou1kCwhqlwzd4SsdVG1hv9Hkr5k937++4Rmzgx1xZk7yIKCarl1LPWE6w/UUCWE
	Vi6EZoDbn4wdmfXkLyHNePwSv2nPbI8TFBNDJUhHDYKRc4JntFFtXEDg4htsNCW8dW/TufLtt10
	sPCXFRLDK6YrD9NjPJ5/9sMkM1wIqNO/BE+k3WKMIfe440uh/KdGmAqVSK27QyjCg321oP4PCiz
	lqzq9Sd0BI48SxLDeuuPagfsoosKJK8UUPW8YGSKiUR+y5vOLmaB3W0F99brff/bPm+DeTG71DD
	98WeiPmpJv3MqBz6pCbjmIkf0mChiSZBBG6fAIS6+1cSv4gT7uWnu4ybTezI3/angSLQdD7kDP7
	Bbr0/osVzrrRIeHUtUTAqYZSOO8Y5lHwyDhX1asEt69xCKSLj2BJhs8fCcrUvvfM8ZmdKDQGgyl
	QvzED/SyDxzBdQfCuaMscayi16dSpx7rahCpb0WzoBV0O3hJXhxswemJ3EZdYvpCBISbAQO5sG2
	hxkEusI9WZgDbDZovTgg/M7NNP2N9mpiwggfMYRCfjy/1sW
X-Received: by 2002:a05:690c:312:b0:882:27d8:8ca6 with SMTP id 00721157ae682-8a64d9f08b4mr26331337b3.53.1790272321920;
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86106b298sm165627b3.46.2026.09.24.10.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:51:42 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <lv37wl3d5oonioc562vl25hs5yfytqpi3qlmxk6c27tmjbvqrb@msrlsxkbisji>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924083439.461769-1-peng.fan@oss.nxp.com>

Hi,

On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Thanks for the fix.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7dae..854b9c48816f2 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
>  
> -	if (enable)
> -		return regmap_set_bits(gate->common.regmap,
> -				       gate->config.reg_offset,
> -				       gate->config.enable);
> -	else
> -		return regmap_clear_bits(gate->common.regmap,
> -					 gate->config.reg_offset,
> -					 gate->config.enable);
> +	return regmap_assign_bits(gate->common.regmap,
> +				  gate->config.reg_offset,
> +				  gate->config.enable, enable);
>  }
>  
>  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> -- 
> 2.50.1
> 
