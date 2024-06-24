Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A540BE5
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219933; cv=none; b=tLShDYBT/pnMGR9p2lwnx+MZWa1nG9YijI+hcWM2Zn0aSZxg7cdtOsJwK5DDgS3Fi9bRct1EZKl3riWIiU1+VKAEwIuXO1/WemtCQbaLKc0d2DYkT0P5uoN0k1KFtJ6MwKJkheDRQ5CQGiQTNBuFJF/ymrsLiVXPjE7C4KOK+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219933; c=relaxed/simple;
	bh=y3HVBK/bRtl4XQzsyLB6r9HO/3l+Qjcw4dVPw8dtz3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDzXEEr84+gDjVPFPAEsoE/RdHymMbmd9cNPgfbvT1Obwvl5g6gF0XBzf0hQ7gcWRHWccuYyhvk4GDgqZFtD+hMC3y9wgEk/rRsdL/O6VdGYjo9FFPOxQ3t8m+xtgWxnp6Pqg15oHfwUQN2w+u+Wwn9l8rMLSyAt3kjg2seAVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bfc7Dx6L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bfc7Dx6L"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso33833465e9.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219930; x=1719824730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eX7dckm9u+f+lO2ZsVHDkfJuiV4Rz3AqkMPKl5tZVVE=;
        b=Bfc7Dx6LRgvKXjlOpwTz6T9LyJfJPNWUPvyu4Uv/fasKRpyaZg1uv4vup2Xlbq1Tl8
         c/qu3AxC9XA6G7fkPV/pDg+y3qOg65m5v7e4OZr1LRrL4JEPFrKM8EAAV8bbKc1D1K1V
         YlWqsy+ZOzpD1n3T9IgRYui+4XtCXhcSV7cJbKDdB+AMSB3swOk0pRxwZqiqiQ9t9vkV
         y5Co2nzKi8HShxIisRNs3dAO0C3TvLDhxFXpNVpEivSpRxySwwZn1efibqU6HpYAvMvl
         zk1af92qiOdc+AVsPIL176ip9qwiFdu0LeVTmtkeHF8bHLeD6l2jvJ0NHjWK2NpJu4vi
         091Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219930; x=1719824730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX7dckm9u+f+lO2ZsVHDkfJuiV4Rz3AqkMPKl5tZVVE=;
        b=AypGqtneKVaHdTBifyPU7OMK0B/kTjQyWuidDAEStkBUVDors5wlGc9piYlbEt5am1
         RP5ujEz0O1DPB8jggPrw1BhqwaB+1gROpXvAMU7T8m/agKZ6FG1duj/vbk+2LMNgF7g0
         3hSfTEfTo1X5E/qL78QyB2NkVGixnEh7MboRjki1QhLRKiJDgRstNFYiKl2M3XzorWjM
         /uEKJ3kQIRbmEG0RS5A2hMdHoDaGR4so5zOXnhh1k6dt1xJzs5PfxOLgNpPFQjYOeQe1
         2fxBh3zloUi7poaqX2oEuY2uWyXcrbScM6kgOzCLbrGKkp8+FIfWOlZonyFR1+fvYf6d
         /kVw==
X-Forwarded-Encrypted: i=1; AJvYcCWFpkk2R1GcnKbAwtkeghbb+bXcHOFgoowGN2Z5tkLqKuFBsiW+m0gQpzcDWZ1JZp99pKBAj4aE79YbpeNQ+7sfmonIctRtKEYS
X-Gm-Message-State: AOJu0YweNVgdx3BMvNV2GZcpsDwdZHl6OOseLQOrHP2a+HJHKjLL4Vaa
	35R+Z1W/HKXPqNtvFv/EpI/UrVs14mcKXUriD0H26DcIBUspxoGSPo1REJYkRCU=
X-Google-Smtp-Source: AGHT+IFCAyqdfSpwc+KusHgg6PUb11/WZSWULyobNuTMHB2rRr+sqQCcDWWC19uzTo3m9BDnUqC8tA==
X-Received: by 2002:a05:6000:1847:b0:366:ead3:37cd with SMTP id ffacd0b85a97d-366ead33bc6mr3176993f8f.28.1719219930407;
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6da6sm9400270f8f.12.2024.06.24.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:05:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: imx: composite-7ulp: Use NULL instead of 0
Message-ID: <Znk22OwMJ7oKDLXo@linaro.org>
References: <20240624024351.488492-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624024351.488492-1-peng.fan@oss.nxp.com>

On 24-06-24 10:43:51, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Address the sparse warnings "
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse:
> Using plain integer as NULL pointer
> "
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V1:
>  Since the orignal patch is still in linux-next tree, so not add fixes tag
> 
>  drivers/clk/imx/clk-composite-7ulp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index db7f40b07d1a..8ed2e0ad2769 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -82,7 +82,7 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
>  	val = readl(reg);
>  	if (!(val & PCG_PR_MASK)) {
>  		pr_info("PCC PR is 0 for clk:%s, bypass\n", name);
> -		return 0;
> +		return NULL;
>  	}
>  
>  	if (mux_present) {
> -- 
> 2.37.1
> 
