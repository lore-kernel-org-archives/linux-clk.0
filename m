Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05AD18DB26
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440631; cv=none; b=OY8QN3pQgxlIejW6NOX/vb/6Jbsx14tEIhBrxWPd+wI7xWBJ1o4Rz6GFkq2UIyRdaif8YjJQOVHet4fy5bUBwFH6GvW7g60Fh1XtAPaC1V8bHJsRQu6cczQT+vYQ22u6R1EB0QR3VHcc0bhuFGozHfchM3a6CFycEvB0iwaeHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440631; c=relaxed/simple;
	bh=xOBY9yy1BwvITSxKgaXO8hoGaEsJQxkIIOvURE5COUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGFU457idOjQdQBl0ZouwPyjphSn1WpVQRN8DiqGVcwHx+jQKWnCTDBlxfKZDzZ276lXLoP2TkROcukMu1TEMtwUtlubMw9Ul4omjlzULFivaC3q931u4Y4cOWlvD7JUNPxBCI11WdShqKDLaIMjciBtuJQTU/2+QdmEM+nTy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PSdP2q3X; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pmoL+3Bp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PSdP2q3X";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pmoL+3Bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768440625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHr8fzR9siY7kHK8auo6hhu8OpoWK5JbBKEhN8I4qKE=;
	b=PSdP2q3XNWSYB9hJy/sVoIeUh3Kxuoi1JkQGysYIPIm/TEY2dyWT6bI/uAQosoJzlbWVX+
	NlV2KoFpThPDP//a8RRfeV3KqXqiTdEkW/NC0+gMlflkqCB5aXSZkq2rMI63pEO4GQ/I0K
	6hWaASCS/KYo/qcP+J/4yjhh02tqNh0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-sJ3xS0lZNJavW9Cavez-Dw-1; Wed, 14 Jan 2026 20:30:23 -0500
X-MC-Unique: sJ3xS0lZNJavW9Cavez-Dw-1
X-Mimecast-MFC-AGG-ID: sJ3xS0lZNJavW9Cavez-Dw_1768440623
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so126559885a.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768440623; x=1769045423; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHr8fzR9siY7kHK8auo6hhu8OpoWK5JbBKEhN8I4qKE=;
        b=pmoL+3Bp2vJPeG0R4NPsypELgFC1ypojNPHmtu1EvnBLn1WT4lgjrJIZRHCZZsB7HV
         iWC+KMWs2RAQlz68sNH2UeLZg2YdgpJIQEWR4YUDoxmMppSjKye/Ql6LqMa2w9viq2Rq
         c60j+RNVpBw1EAjMiqrQ8Za+luuTairJhnLVAbkNYJcy3rLYmiW5FnvBLx1IdlRgoWFS
         HeTjkZbI8Ow+a+POeBgiiQ2TP+18664IPpyC5JtOcuyf51jD0mR3t72gx90TX+9/1cnm
         D+CFX3XCtd1BCd+SfCFjnA665Y5fcPJcCyefmPA8hPguV/9TApmDlVPE8vRAmn815j8i
         Toxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768440623; x=1769045423;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHr8fzR9siY7kHK8auo6hhu8OpoWK5JbBKEhN8I4qKE=;
        b=DvX3yRxe8r2W9FW9PkcWZy12wxKwnFO8xU9EtsoOzIWRgM6YY01Hy2FmmQZSqXsup1
         3hpG/No6/2m44pbNj5e/ERfe1AXRT+ZX/7F46LPnsDlY7IBmKQL2VhDhVpq4zCLo58Tl
         gNT/wCkk3CNDojKA+xCdohSadMrxmDsUUdjbw4Zc+I6QtYRuKSNej31Ivc/ZtbzcAgGv
         +Mzlb8dKV5krTmsB2ZXgPmGUASKY31FI+KfQAe5IfahJcPix0LYDbfS+4jHvxjYcPZJw
         Pepr54IaXIECsdmbCy6Jukw4l/Cga4nLYJp4HGTMfM5qVDxVuQ1+xOPyFSbyc/DS8U89
         F4aw==
X-Forwarded-Encrypted: i=1; AJvYcCWpZ3o9jhD0vcIDC/k057jbDfuOABASSO4dZ/tCl+TWiuJjEuFWJvbFpcnY+AS0tDX9vYkByF60SM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPegGP4cG+nu5Zmqok01yjv7H/5xTbMdWIU2ljxFQGQ4lLeVZ
	9iLM/7h+CvFUSBq6tDcJSjYqZR52FsC129tQnkgIRMYK6USm4hY0CSKNR/WhjS/gVY/hGl39BvR
	0tojd27HKI6QgOQDOBhvUPunAqS+Q8MCSqGjltGuOQfdxJ3dc78l8xkhwnwakrw==
X-Gm-Gg: AY/fxX7VoY08jcNZ4UmT5r7EC/WHZ1mK9h2YpWD5lksu+Q+dtUdlvZU8dLG0LV7PQeq
	Kq/F9C9PY3uh9092WBqFE5WEtTOs4bKyFtL0ELqR/iJBDc4WXyRveyJoPcwwfdnrnM8iIFIw4R5
	YU8ipsHW2BSIIz+2ZbnLE8nad4hz3vPy/Bo01mmTtlKI05H/ioHcetdfX4nWyENu+PrKri7bYb2
	VLY6B67K29bsyhXXfg2MHQo/Xn2Yvlhb96srcr8NPN97v0BacyXBYJNmi6I9KBQXg0tbyh1Uumi
	JHFsIDSNxXbNhHB4BhUdj052TqsMQUiJJP7+kA16UIH7geNvbzvikNHAsmfUkXsZVFDOgq5F2S+
	DiyPl
X-Received: by 2002:a05:620a:4153:b0:892:43af:ba4b with SMTP id af79cd13be357-8c52fb3ab81mr706529585a.29.1768440623256;
        Wed, 14 Jan 2026 17:30:23 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:892:43af:ba4b with SMTP id af79cd13be357-8c52fb3ab81mr706526885a.29.1768440622864;
        Wed, 14 Jan 2026 17:30:22 -0800 (PST)
Received: from redhat.com ([2600:382:851c:8241:679d:875:9f:9e57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b72649sm279629385a.34.2026.01.14.17.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:30:22 -0800 (PST)
Date: Wed, 14 Jan 2026 20:30:20 -0500
From: Brian Masney <bmasney@redhat.com>
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
Message-ID: <aWhDLNFtaoU7A-AN@redhat.com>
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Chuan,

On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> If we were to have two users of the same clock, doing something like:
> 
> clk_set_rate_range(user1, 1000, 2000);
> clk_set_rate_range(user2, 3000, 4000);
> 
> Even when user2's call returns -EINVAL, the min_rate and max_rate of
> user2 are still incorrectly updated. This causes subsequent calls by
> user1 to fail when setting the clock rate, as clk_core_get_boundaries()
> returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
> 
> To prevent this, clk_core_check_boundaries() now rollback to the old
> boundaries when the check fails.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..0dfb16bf3f31 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
>  	 */
>  	rate = clamp(rate, min, max);
>  	ret = clk_core_set_rate_nolock(clk->core, rate);
> +
> +out:
>  	if (ret) {
> -		/* rollback the changes */
> +		/*
> +		 * Rollback the consumer’s old boundaries if check_boundaries or
> +		 * set_rate fails.
> +		 */
>  		clk->min_rate = old_min;
>  		clk->max_rate = old_max;
>  	}
>  
> -out:
>  	if (clk->exclusive_count)
>  		clk_core_rate_protect(clk->core);

This looks correct to me. Just a quick question though to possibly
simplify this further. Currently clk_set_rate_range_nolock() has the
following code:

        /* Save the current values in case we need to rollback the change */
        old_min = clk->min_rate;
        old_max = clk->max_rate;
        clk->min_rate = min;
        clk->max_rate = max;

        if (!clk_core_check_boundaries(clk->core, min, max)) {
                ret = -EINVAL;
                goto out;
        }

Since clk_core_check_boundaries() is a readonly operation, what do you
think about moving clk_core_check_boundaries above the code that saves the
previous values? That way we only need to rollback in the case where
set_rate() fails.

Brian

