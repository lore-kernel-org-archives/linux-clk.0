Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CED28C2A1
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512923; cv=none; b=KCAdbSlXe1Pd6op5Hp5RHdvZaEXKiAV7ogHCUkZr4WaUFqZ3uijihCa6r1ixOLruuxxjYpGy63BjdbX5OvVYJip1JLJrUb+CrKIWhobRC8q5e7qeJdgbIus7cTBZ0aYVF4zN4YFGFs1poJI93xC9xAiN523TsSFSYzyXMQyUqSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512923; c=relaxed/simple;
	bh=JcObBeha8Q7lx5nQxRfs8PB5PmhguEGDFefL6Zg9qz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut6WTkkIjiOQaCyw99nAqghqx6CDWURW+RwE6CWLBvCJbkLIsnaGYuO6xkOT1hzl8Mb00pOoi7ub9uslWq9qyZ6qNjSynS7p4nPg6DyD5tDjfnV7SyYCua6zMkbfkbtgWqmHjCVKp+WedbIgpAMf/KSjLJzP0xwDjgyCn6vpTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cs4Q7JZH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oQ0P6syO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cs4Q7JZH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oQ0P6syO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
	b=Cs4Q7JZH8uqPgnNJrVI55Dk1K3iG6zMfv7L05tkQRDq9Djm6VyWhcZ61JpddAgbK8IX9bh
	rcGTLOx5NKSrFHw1raFtrJOjcmYGVhw/M/zND43jgKvd7R9YPEMO0xTh8x9p7PRjVdzeVI
	TGl+7JRUED9p3/xdfAgiDG7z0RqWYXE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-Z2esa8aNMvGuz9RmwarGpQ-1; Mon, 11 May 2026 11:22:00 -0400
X-MC-Unique: Z2esa8aNMvGuz9RmwarGpQ-1
X-Mimecast-MFC-AGG-ID: Z2esa8aNMvGuz9RmwarGpQ_1778512920
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso48918181cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778512919; x=1779117719; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
        b=oQ0P6syOa7P9aQjs9BwOpNjT/MFAlnmu0QSKTF2d+mtEQ01gUswnTCvSRWBa6lAr00
         ENptrEFACNkXP49wa04FK7Q9PNNTdbmXfzlwgNxdiQKKL7hrX+kcqoFB+pbRsMg2enCj
         rzxLIlIeFx1GEO+g8vp0zTWxZ64O4EJR/zMT45NAYf8YKXwK19eroyGbjZp+UOmnnXwG
         sozPpLVhD85CuqZD4JmhFNXmBS3Tow/zJCIwx3/8fyDqc7Bskdr4Fo3kKZr6Vd3EANOJ
         GAV6tarVIWe5sAtgzTR85NgqhOow1mGzuYKGbFfh5djb/Dixf5IoBLA6s4uDMdVMEGCO
         Alsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512920; x=1779117720;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
        b=Y2KjqU4quMMhNLywngmVtekEhqQIYX5kDfsQAGQRvqDpn0xeVBLZiSAhVBhTGpMT1z
         WdyMmYgte4IFs7BjF/Z8pBkLGbPbu9SLy/w8UpyFlqKnJa039h50KfonxLqa8bAVv9uS
         zB1ZUa4z7gDXQJZn3j9pcI44jZmsCL9hPsRssJcw4Zf0KmcwXZHLmISVRLm+x6ciJxbM
         /Wzc0u3BWV/ud/A6+egqmsJT2Ms1B5K9iXzGr2XQXEQ/OgMfc/SaRkTIl2GmHwBYoTa4
         Q+my3GRxm25G0m1WgOafTCO6l3jMHRAVaUSBSOJCnOvqYm8ORiYzWPCoDopJVK+uVeNp
         M47g==
X-Forwarded-Encrypted: i=1; AFNElJ/JksSUFvJuNHjdFRBjRhYIAMcQF4v1wfAab6Lry71gou0EogqRLUdzynHzVfUmlbwhxkUMSRt3ptE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLi36ydDZXm8RSOohVABaanXb0rLse24VUgok9Q3ELPCDCdmju
	qnZnpsHKigA74DrT2n4L0gp/rM5FXkXN8Or+mbdUykwlasIWMnJplijvOq6q654N1C3ynW4CJm6
	R/tu/0gOd85MDcU4vMI8gdkOYMP6d1HtBwJDIWRXBsK4aHEfV5uudi3/A18ZAlQ==
X-Gm-Gg: Acq92OHWXzIxRRHdmRcXYLkMsXh/lx/rPLhPxmrJgJCmXTdlt43ouKrAIRB/QR0A/ym
	Gg3B5jF3kQ3y+bIaSfyc1W87nLTjP8NfEgt+USKT3Wx6sggJttwM6/clKL+YzjgF0LcfHN+8HlD
	cu8RydRD0sLqrYxx3/nfkW5OmrlOGb4z8AN8/94hIxzd2EAXJDldBSLY0G/c6tUpyVESOFrqrO8
	t0QWr2OH2TjnpwsG/4ry/q0buf7cuJbbRQgXSrtR5oLN4P+KLyNfP9dVEh29uhT+Jk67c6LIrO0
	5iVFwYmN3REpZS9T+ljoFfzBD9w4SFTHy1LQe8e69tEbLVcYtCD0t+uMr399buQFS9oMHFbycSX
	uhXEnCGkyj9mLxh17vtF3LnTVPsWkWC94XE/KMvKrRnOLs9f5PTeGZ5dpHc0Yzq+D8y0=
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224792271cf.16.1778512919572;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224791581cf.16.1778512919063;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm96450396d6.14.2026.05.11.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:21:58 -0700 (PDT)
Date: Mon, 11 May 2026 11:21:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
Message-ID: <agH0FMzku3QRlB50@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:28PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> In the A9 design, the PLL reset signal is configured as active-low.
> 
> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
> is active-low.

This flag isn't in the patch. I assume that you mean
CLK_MESON_PLL_RST_ACTIVE_LOW?

Brian

> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 5a0bd75f85a9..8568ad6ba7b6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	unsigned int rst;
>  
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		rst = meson_parm_read(clk->map, &pll->rst);
> +		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
> +		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))
> +			return 0;
> +	}
>  
>  	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
> @@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  		return 0;
>  
>  	if (pll->init_count) {
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +		}
>  
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
>  
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 0);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +		}
>  	}
>  
>  	return 0;
> @@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +	}
>  
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 97b7c70376a3..1be7e6e77631 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -31,6 +31,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  /* l_detect signal is active-high */
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
> +/* rst signal is active-low (Power-on reset) */
> +#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;
> 
> -- 
> 2.47.1
> 
> 

