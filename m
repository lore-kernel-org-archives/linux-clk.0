Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E90D424671
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211844; cv=none; b=V3/YnYs2AD1uwJRQs1CmJGv7LERi+HnphEsSdBhxyIgNKezLIXH2j897nNLNua9wMDhj5RXexn1DNb/Qmc/v/oKHVPn/hufRQdKJ91zs4Y5IU28oDdwo8V/70NF6LzP8DDPrGct2vqGQATzMe/cmTZ9f7Oi1S7PRcVrbsm2r4nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211844; c=relaxed/simple;
	bh=feR03yqekQEo+Zds89bk3LTU1v0JcC9FSph94t/3VWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hn4CjgPc8HoEKMP13ulKIiIwWYOkj4ytAh9kIi8UHsrqG0xNVR8STlhVSfcVaNLO6tgPDW8iqZagFjOF/oO5CnQt4SqTazHv6zlIIAeGSBSrcoBV3bhIUl7LVVLL305KpSSfG3CJScOyHjkNrkOtag2oRg9j0ZMprkjDaDI4mSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNOy2AEL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAYaNEtU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNOy2AEL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAYaNEtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784211842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
	b=jNOy2AELoBZBLSPWPR8nRmeSm0pfVrfRTrBa5TFFNkeCn9AKSGyY6Xo7wFigdYLwJySzg2
	ZoFUm1FZPiMpe0F/JH9+KtNEZA9+EgTAUCeWKNz+TVWCRYOrZ44Va9HoocAL/lN1Hc0nzl
	Rf+gK+BcVx9QQ7oYZJ1J0crPyo6rr1g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-egQtzw1JN0m--iynRZxqJA-1; Thu, 16 Jul 2026 10:23:59 -0400
X-MC-Unique: egQtzw1JN0m--iynRZxqJA-1
X-Mimecast-MFC-AGG-ID: egQtzw1JN0m--iynRZxqJA_1784211839
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so110745366d6.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784211839; x=1784816639; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
        b=NAYaNEtUV1b5QSDPXHANVY17NWStbPr1AhcG69gHuJxU6WS80/bTl2jNiwkKpjQC0w
         YRsRsKkvg5tUN3KodDPv/9dvD2V5pGsPbN30p47baUdQsa5m8/rpL037QoBw035Zs+dC
         1DG8HuBYeXg9Ny01/Z0nem5rqohZWj7A35bk8pOrq4UTzg/MmBlHztrTqp1Zp1RyFDH0
         1lrQjO1A5V/AMiz15ZMtV50LuIxk9W5hnweEnJ+l38wInLEKOtIu5c2He3QfZA+25NYI
         jluoedOLT9ro5hMsh3t+rpCKt//3sr/3jJZUMSkPUMvnofGm4/JP7AAEw8k4biW8J4n9
         6iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211839; x=1784816639;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
        b=igRAHelh+djqWKG5Cpl8zs0FsDhnaveXWEJp+n5xAXq2uIkHdQwDiVc9mBVkBf+Zfx
         PCkvv34kTShMH3FywHHsb1pfDSdvy31afZygDZoXb18fdBSZ2eP9YrqmXteKI8xTpgXZ
         fWknUINrDvxVpTSHo39YigCs0S6i3/RsxXcB2HjkXstQJYgMRnRlBdQGt77Z3wXEmpmR
         olqZ+WYS3AGCvmutJphtw51sAWks+e+fTDga+v0rzigkBN12KX2C2n269gB02L1FB1A+
         j5thN3Uf4hB7Uiw2dedmOMYNsotr/J19HZvEr7lM9TO2XNuJwFuLiX+9t/yVPIhTwEdf
         Cahg==
X-Forwarded-Encrypted: i=1; AHgh+Rqj1vEsbALEIhJoDFzyYnlU+pv81UBWX5PbQLtqhglAnuKZSG7cFitRedJfRdJdm49S5zcU4gMlGYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKTsFRdN7gFqDL2v9raZrCOawR+2hF3yuLMObQqQIr1bfolBv
	siPGpgD5Xvwahcdbzs389WasEeg31y1LN7xhkBAAzjfpTRKu8ieTsskmdYnivz6SlGNU8mtH/Or
	+AlVWt484PK/pbS7v3Ya0hIjXjN7+TTLpB8EHd5H1QRHRK3a+8iQVeM9rFa/mEQ==
X-Gm-Gg: AfdE7cknHDkC5oXcIzTTRhFLiKjUHQBoXE8iWEuzGwq3TxR3Gjbcpz8Xj8OhqRE8zhm
	P+siK6ljlAb36y+gCugJeE2P/XeSF7Hgw+YW25pbi4I0PqrBhGQfxd+yegQDUW4/15jgQlyavfZ
	g+DvHloq6XWDjxR8CeNLfW03A4K40w6N4cz2+3+O+OMM4YeKDGcM1IwaCf0w+9s2EDIkQ/9yNz6
	JlDvxs9zJ6dCYSo0I0zaNRsmCL3S0wFbUAFT9lYxboFHPCcHkorSFju81NqevAD8PBh0GU+2jLf
	IcG0D9BZP8hLDMTIazs8bBALASAV9nvU/cXsBIOWtvuq6pSJXurecgqenQ46k1yw0hNQFAI=
X-Received: by 2002:a05:6214:2025:b0:907:31a6:c24f with SMTP id 6a1803df08f44-90758de66e0mr96749986d6.41.1784211838890;
        Thu, 16 Jul 2026 07:23:58 -0700 (PDT)
X-Received: by 2002:a05:6214:2025:b0:907:31a6:c24f with SMTP id 6a1803df08f44-90758de66e0mr96745136d6.41.1784211833656;
        Thu, 16 Jul 2026 07:23:53 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-900a7f8f5d6sm206225996d6.15.2026.07.16.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:23:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:23:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: Re: [PATCH] clk: document that clk_get_parent() returns NULL
Message-ID: <aljpdw6_0tEDF87a@redhat.com>
References: <alZaumcBpsRS9tyS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZaumcBpsRS9tyS@stanley.mountain>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 06:50:18PM +0300, Dan Carpenter wrote:
> The documentation in the clk.h file says that clk_get_parent() returns
> error pointers but it doesn't.  It's also not consistent with the
> comments next to the clk_get_parent() implementation which say that
> it returns NULL when the clk is NULL.  Update the comments so they
> are consistent and accurate and say that it returns NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

