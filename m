Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8A43DA4C
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529581; cv=none; b=QeV/yqgbDfCXP4Mib4mVB230IaBbXqQc/KX5PZqEgkKu1i4mD1cJag4bVVVwYgNhHt8D9Ovrxd/MN0C78sd4FD5sJ3SmJ1fowudJCbYH14YbTgIMZ7yKSJ3UKlUP8h0LTL9hFg7hHuFZVLD69jNBmG0FENq5TSNsPYMX9kzA4zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529581; c=relaxed/simple;
	bh=ahFVzm/pHP34qDXNZCB90GnFKvBTrr8Ghtixl2Baw4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPaLIWDbtdANBYc8ZxWBixxoJlFNMHVRGDwuue0WrVRf+sGOvuKb01QQvThqoZqSHdKgqu/H0mjk8R+FLXAhcA64AgoaeW3PXAzfElOUCLCwmTgI7WnOAQNTyZhcmL3UHhsgxdp965COaUFGm+OelNLOFgrESll3fHYYgAg3lEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fc3lBYtp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUvBhOK7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fc3lBYtp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUvBhOK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783529574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fkm5WUQgDiCqhtYtBp+OiJIKsSElXb8Y9+10KW5dz4A=;
	b=Fc3lBYtpDeYmzgR43pQ7orDMxZRh3ke3hjCHsxW8r1l/53xg0zHlLgTAzKlLEtQtGbtVXQ
	ALFq2v8feVdLuNKdHPV/fHIEBjTaPjohLUVsau6Q970TowOTlFdjTlmWYAEBazNE3WJ3SK
	bPN2LPezRUGGubd0LWO1T1H/jb9uuI4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-4k25GOdQNb67tg7jAjdL3w-1; Wed, 08 Jul 2026 12:52:53 -0400
X-MC-Unique: 4k25GOdQNb67tg7jAjdL3w-1
X-Mimecast-MFC-AGG-ID: 4k25GOdQNb67tg7jAjdL3w_1783529573
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8001bbd2f36so31805547b3.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783529573; x=1784134373; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fkm5WUQgDiCqhtYtBp+OiJIKsSElXb8Y9+10KW5dz4A=;
        b=eUvBhOK747dAuqxRSSuDsyYTur2M2l6cNtcw3sA11qp++0BOxeGwbC2pu3DrZl+U1c
         Lg7i1gFA16XD3VohaaEZclD+lKvxnBPUf7oJUS5esFUby5p0OUkgRJfBtBU+SDu0tawy
         ctwWp0fQER2WFZZAaQj5JdVQ/fp8PSrhVkDyLKk/LhqI6E4GLUu+rYLHPWNZjk/UzIgS
         77FlDG1KaCxhv/4gqoAY1ZnJSgv16BP3d/uBUQWMYESTjJanFkk3xntOibu8MAk4uiPn
         Dt8jhF5lSu4TbXICSQWmDPmkXHv57MnvZb/DFKyjcMpthIDcT0TWULbHDHdN/ok3ypqB
         a0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529573; x=1784134373;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fkm5WUQgDiCqhtYtBp+OiJIKsSElXb8Y9+10KW5dz4A=;
        b=Pzyb9uB3Qi6abw5C8T+pSKpLqAmDT3j5GH0BTbsgC/GYnJ8vhgXFlfMztftZQtffDN
         9Ie169dw+VkLiAZ41t70EhgPJi5/ZWZNdHLM/xN5tiy8OXsIt8v2GSVdQx/o71+Ez5bz
         IECjeBPCSVdO5SQ2QOK1F8eFhu1KXUUXX7D64wT/AWYlIedl7Gld7W2OlO0vejIENUTw
         f91ysTGFR3EFSm//fiWVR8uLg9LEyAjklq2xWvs67hpuADRKGbe87i+Z/MXDuckY6XSi
         f59KMlU+IPnQIT1fluprXSk6fN7Ihqi/IAVCVmeBK/Ny1rFjVPdSVYS8UIM2Mgm87aRy
         D9BA==
X-Forwarded-Encrypted: i=1; AHgh+RqPGMDRsebKIqTWbR4WBFd3Ce1jUOWQ66ht4mXPUB+VRx9SAl9ejnte2kZxiIyIzqwuAh5Id5KpfAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXefahhZGx8zZrmT+NfRcndRRuQWghCeTEuix9y6Vdt0q4L/So
	nROvVS7tBBAdjC+K1/omZUhjAjctbzXMaqKJm9ORO/dbY+qbpJfrC65QkLKQwsIq6LL/VGAUzQR
	RTdc6CE76QLxpr1FZIgJDye0DuH3M/Yt0GE/Dsw+8Xizj0sF+m3Xw6Ch9Lj/MEQ==
X-Gm-Gg: AfdE7clVCRlGG1bT4u1ce/W02covduJRGd29oNtjOnQhDXKL/Oj32Vs+H+K4MopPb+g
	Q414PX24vIJrqoufkLSPz6k0I07Nfm2CkLFuVcztF5ey1pmMARu+S+/ERShChMWyZOYuPTUaWpU
	sLWKLSNilkflRK8PQvMMZ0lFj17QLdqqq3lEsfyo3CzeAGh6BxMOIMijnumrLXpKL5GfOwqYp7H
	AU+FwUB+ehI03r8AetMNClGR1gl0F4EnNU0JmjBHD10QIe/9Ciqko5vQr2wZR/kJowMaXN2lqEl
	U4Gx1t2dJKq1eGIEP2pBRP3mFPpJFy02A66ZrC1Pr7F+oHaN/RcWKvFA5J1H7DtQsLDMSUktsdo
	TljrXcbzScw4wO9PnphbUDxSMF+/qjuPcG5tfIiXR5mWK5Q==
X-Received: by 2002:a05:690e:4401:b0:667:8b91:2447 with SMTP id 956f58d0204a3-6679f29b98amr1841316d50.94.1783529573066;
        Wed, 08 Jul 2026 09:52:53 -0700 (PDT)
X-Received: by 2002:a05:690e:4401:b0:667:8b91:2447 with SMTP id 956f58d0204a3-6679f29b98amr1841286d50.94.1783529572418;
        Wed, 08 Jul 2026 09:52:52 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a20208sm2369797d50.14.2026.07.08.09.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:51 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:52:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: en7523: reset PCIE HB on init for AN7581
Message-ID: <ak6AYe5ZZrzyf1UB@redhat.com>
References: <20260708084045.8380-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708084045.8380-1-ansuelsmth@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Christian,

Thanks for the patch.

On Wed, Jul 08, 2026 at 10:40:44AM +0200, Christian Marangi wrote:
> It was reported that PCIE HB should be reset for AN7581 or some instability
> or link training issue will be present on warm boot scenario.
> 
> Reset PCIE HB on clk HW init to handle warm boot problem with PCIe.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d3..c450d89bfa96 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -57,6 +57,7 @@
>  
>  #define REG_RST_CTRL2			0x830
>  #define REG_RST_CTRL1			0x834
> +#define   REG_PCIE_HB_RST		BIT(29)
>  #define EN751221_REG_RST_DMT		0x84
>  #define EN751221_REG_RST_USB		0xec
>  
> @@ -853,6 +854,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
>  	val = readl(base + REG_NP_SCU_PCIC);
>  	writel(val | 3, base + REG_NP_SCU_PCIC);
>  
> +	val = readl(base + REG_RST_CTRL1);
> +	val |= REG_PCIE_HB_RST;
> +	writel(val, base + REG_RST_CTRL1);
> +	val &= ~REG_PCIE_HB_RST;
> +	writel(val, base + REG_RST_CTRL1);
> +

Sashiko has a question about whether or not a delay or a flush is needed
between the writel() calls?

https://sashiko.dev/#/patchset/20260708084045.8380-1-ansuelsmth%40gmail.com

Brian

