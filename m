Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85037F721
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223172; cv=none; b=UvnaVX3oSKw+gacuxHzfCdgiIlN37PCuLePG41L7J9JEGaO8e9HlCizyJDDM/lTllgee5jiTCosETXIB62L/T62cn2s68ArDGVhqIpMWTLh0n/QsmTmbSt1RlHAo96iXGXk01S1J+XI+uDksamjcRs3myqhyVE47Fv71SF0oC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223172; c=relaxed/simple;
	bh=+QO87KVJcXVWtp5OCGxQiPqy8tJ7A6wL9dyNda913JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8/vA1Y3k3YmzsFpbuinUmd9QrkqdgUi3TmCfKdbU/nNt+GsCQ2bkOhgfh1Fslyz9Qx89Y8ulOWhCXAnKJrmxOqMyoJAkUejcU2MoC9ohHcQ+tBrsMtYLYKgo3V9Tqb3Gwv1UB6eaYramrA5xiVyP/yW4a0vqyz3N0/4HNYTfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AxPJ/cnC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKKqKFtE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AxPJ/cnC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKKqKFtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782223170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQ9x8NWrux7PBvYE3t1qf1YpH0o3vvkHjjg5EqulJzY=;
	b=AxPJ/cnCTgJ4/Do5oVXAxENvGYkPjfBxPeddmcHZ0i01XUDCpAv1tD9jWSeiJo7cZUks0C
	heQRGYVXTKI2/+7c4DBoWK2VP8pPEuvTg4GsENcOepzNUxlu30GkNA8WfUCoLy58FOGkMM
	bpp816qhL9n2NNxaeqBUhCZyQ0Jn7PU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-Vrz2GYSWOqSBE3GjkiKi2g-1; Tue, 23 Jun 2026 09:59:27 -0400
X-MC-Unique: Vrz2GYSWOqSBE3GjkiKi2g-1
X-Mimecast-MFC-AGG-ID: Vrz2GYSWOqSBE3GjkiKi2g_1782223167
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddefc5be4bso105374786d6.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782223167; x=1782827967; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ9x8NWrux7PBvYE3t1qf1YpH0o3vvkHjjg5EqulJzY=;
        b=iKKqKFtEo5AmfsHlESi58VLqReHjEC/DRBXooLpp0kmok4T20ZNfIKmf1sMjnP6ciR
         m7E+oSiPqedXW6u0cVwPfM9DfkUxutkxfdWpWzcWYl4I/SuapXYUto/PHWc/veezbUhK
         BTxNCIsIJGAQMJmuxhOTO+LpSaotO3S54/rNdua+AY3wZo6LCYvOcz/APRsrojpr6sa1
         a7rX6IfBkJ5sVS6NLjoDsNI9EppbM/Pnc1/S548rIDK5wcuEpPY3jmk5in3nU+/P/lTw
         DZ7hflJZBK0ZbjDdkTu+5JvT4MJslcPKc/SeGjrygzWQShWjhbXFksMl0v86k6q68agf
         II8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223167; x=1782827967;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQ9x8NWrux7PBvYE3t1qf1YpH0o3vvkHjjg5EqulJzY=;
        b=ZrMKsOpF3F2UPqgmmKbeP+1NBlc1TQGGagwuvUjpVP/kNsHJ52BdljJ53Gqzk3lmvc
         q90FaoogCQG/bVVUC5d5LB2gqsw41YwYHEXTV5Utb1FzwufontDuM1dHscTJDz0VPQEy
         ypvP4CvosgCqiKo8aDAmClr2gdWn9Ra1IPxE/vY4Mi/9V1Vhfj1rPV4VceXtuFmR0zEW
         GU0Cd26nXjHJsl/2HKUJG/x71swdIW7R2IkQd5cq+L9TQx0swNFRSIXMDyITpSvIjkGa
         3ByDPDWQv3bR0ZvROQou+1KhwfYMa7fDgN67LMeJj2ZUm/uji38alpYACrmsZTZmqC7b
         iTtw==
X-Forwarded-Encrypted: i=1; AHgh+RoBDuOm5Qt3YRHcCo4nbDJ+YGaBL8jJHtfzJbitPtY3C1Re0V8yonGppgVb/mnzTH/Mx08encjn/PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLHSkVs4U332yfKENS8QMrMMIBl9aW0Gu2FitfF7r7nki+kev
	ZJcytBwwllXXS0ATDCPCFjbUaWnRu4eWrOm0fv00HdSE0g9ouX8njqHh4n5GovfSnmiN/lfwCnH
	BJQqG988Ax2UJKXnyI4ePVWZR1v4qnQ+Yl0WTbwzUHD3MLjw/mu9k4h0uQ39R1Q==
X-Gm-Gg: AfdE7cllCBSOAahGXO3bgiIjMv/v+fErVr+Ix0a9hBxr9BLotXibzEZWeLE4Ie0BbO0
	LKsVXwIOU/1T5fjzvUY1ncf6oRCu+Idnx7KHZZZlyaC0HLFWtKIAox7ZIVLJHvgU1m/YAq+fpmM
	ugsiiZ+UjwjksLz96C85S4O+Gg+RKMEfPKkHz7JrBrscyqvtutontRUVBEDtSMR1zo5ik2ypcLR
	qhZgNFn9ZgYEbZ3h6S8KLWGDSzY+j2WdVbJG3K21byRCFzZ5EsZGIObpDNXmgC7gs/MoVW2Dgou
	2o9bCML8YIM477z6SS9Hd8S3OnfI1W7JZhUca75iH1+IEwub/1eBRHxxOpmWVud/CKiLb/BpaeE
	I8KtXEQyJTd0/E6ArGndfHyn06Uh0AjO7EZsaLq6WZp3GTQ==
X-Received: by 2002:a05:6214:529a:b0:8e0:4976:c301 with SMTP id 6a1803df08f44-8e48912ce1bmr24841206d6.41.1782223166271;
        Tue, 23 Jun 2026 06:59:26 -0700 (PDT)
X-Received: by 2002:a05:6214:529a:b0:8e0:4976:c301 with SMTP id 6a1803df08f44-8e48912ce1bmr24839726d6.41.1782223164971;
        Tue, 23 Jun 2026 06:59:24 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f015805sm126048916d6.1.2026.06.23.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:59:24 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:59:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] clk: palmas: unprepare clock on provider registration
 failure
Message-ID: <ajqROjYdv28Yrqo5@redhat.com>
References: <20260623090738.13773-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623090738.13773-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Myeonghun,

Thanks for the patch!

On Tue, Jun 23, 2026 at 06:07:34PM +0900, Myeonghun Pak wrote:
> palmas_clks_init_configure() prepares the clock when an external control
> pin is configured.  If the subsequent of_clk_add_hw_provider() call fails,
> palmas_clks_probe() returns the error without dropping that prepare
> reference.
> 
> Unprepare the clock on that error path when external control is active, so
> the probe failure path balances the successful clk_prepare().
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
>  drivers/clk/clk-palmas.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
> index 39049f62db..ab9df2eedb 100644
> --- a/drivers/clk/clk-palmas.c
> +++ b/drivers/clk/clk-palmas.c
> @@ -265,8 +265,11 @@ static int palmas_clks_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo->hw);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
> +		if (cinfo->ext_control_pin)
> +			clk_unprepare(cinfo->hw.clk);
> +	}

The driver currently only calls clk_unprepare() on an error path in
palmas_clks_init_configure(). It leaks when the driver is removed.

I think the cleanest approach to fixing this is to convert over to use
devm_of_clk_add_hw_provider().

Brian

