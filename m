Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1A3446B6
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059175; cv=none; b=g59iHBSpYquVoWJs2cRiog9GKBaokvKn1YiI3Q6KHfyCgxOGqZ216jZBCvCWPuumxrnmVVv8VMzm0PVYnMqZq9chg7XlGwNLWEFy1cm0SYuf5c7CPsOnftw0wTHwvsK23ehtf+Y+cXuRBo+TdA7pf+G8GFM7jPYGZ3OZdgurkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059175; c=relaxed/simple;
	bh=TZQzPSiGDNCv5qBWhfnzrl+Ay61u5D0p4fYSm07IRoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hN/nigLCr270UUMF/XGZrZ3VWgrzOdqjzmznqgfki0I6NroL0yA40EbzUjJTwZ0MEcuPY51ilEn0ypYk/Fw+NKYKqEAbeB3eacxi9pCQRBjXBwvMCCwGXPkYFCYw679iOnMEP6Z59VPgNitAo1qAKFjTM4ZsLpY3Rir2xBFGw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d28dV64M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qKiFNVg9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d28dV64M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qKiFNVg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772059172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qq9pdpmWkOLhriAWwhv/V6AaKGdTO3kZZdfGEa7a/D4=;
	b=d28dV64MthYamstEXVd6NV7Jr2Af0GOz+X3IzTAFgXJ5IimNoXzLvH9H/fifOewlMAjCkb
	xUJVG60us66U4ZjLXn+BHMINQ8L/6g92/2yL35SVCJR6wosnizxYFdvaEn2zx68kD5GKRm
	fx690D8Dbj6obnqGYwy4mDl+Q61GUew=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-AVypaZusOGWx1IBDQld7Wg-1; Wed, 25 Feb 2026 17:39:31 -0500
X-MC-Unique: AVypaZusOGWx1IBDQld7Wg-1
X-Mimecast-MFC-AGG-ID: AVypaZusOGWx1IBDQld7Wg_1772059171
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-794b74a8b2bso3234337b3.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772059171; x=1772663971; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq9pdpmWkOLhriAWwhv/V6AaKGdTO3kZZdfGEa7a/D4=;
        b=qKiFNVg9NeH4pFePN4L+eAlrLjJR97nXgBcz0l8Lz14NKaUXsageOJIkSM3nu0dCky
         CvHPJefrnt11tm/AJYeSCnJ1JNRh3YI/0wm8i91Z31b52dA7c9RCE8svR7PPPFcN3pA4
         2sHRNRJccnAVA8dawOCc8H62E79LmiEm02oRVh177lS11KTqH3iyej0IxHPBzrzDC2PO
         7FcGDkIRzM67QSi2ZjAFXBIczzSvda8QeXfifHdSJytnIM9BuEBFztd2GvAX8I8A4Z6i
         RrTFQbWmT+PUHm9DNguXoOzZdlo9z/5iBelWKT+O97meznerkCATh85mMc1JYJf7askZ
         C9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059171; x=1772663971;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qq9pdpmWkOLhriAWwhv/V6AaKGdTO3kZZdfGEa7a/D4=;
        b=Hda8HOBWTgffE2GYCxhWWg6SpPxz6eWWbmoAC+5Jn/EBE6WW0tPN1m6cuKxuLQedXv
         ZiIPH6U4U/nv/+1yvBELtX4NY7ChpG+8BEqc84Or3PfUCGMGXJVDbHVY2MYRPGkqfZHK
         Pp7RTUyhrLQGXaI2FMuSfvd326CL6Mb6v3eA4l/W62w/vFKYTALxtnX65m7zbcNQA0Sf
         h/9BwDeYzAK1zVg7swrN91Xr/A8c4j7irUcBh6FH5cG8d9HQM8inOo/9zWRWMgY9AUnc
         a/SKGVCX2OpqxW6i44eKbSR9lS9BLMFUhB7zxVTvnp/mg3qNeBngcjM77CivQzXhpgs/
         3bCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAiliAiISS1++b2iZr+zjcueNdv7r5zlbaakb5pqow/vE6H31Z4jHxHYzkP3vA79AqOVs9b3WADFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWXhXSIChTRErw3b8WjlRiUZCPydf363V8qq++ILsw7vptspa
	QrnMhez19h7DXbAtup+oaGpYc4OPklaX+/bZlGMQrFkcT8A/qelgC13JJ/WGirHngGcBb7cQ0l/
	QeUHq768fRvqpY2ngfIO/hbFYiArDoYqoj+BdDD2DGOVYL8tl/Py6Db9h2eo3kVVC8pl96A==
X-Gm-Gg: ATEYQzzSxQFfRpok43SaAt92eDoFluoQ8HzOV0WYhROyGByevOxsw01gMcgG+8c6+Pf
	bkHz5SNvOCJ7hPIrsEXflfLfEDFTC5hbBOyPiZLVYYY6rYLAYN/Sa1aHkpIMuaUDyOjTQ9NS0X+
	L7JQsWmALiR+cElH3SwFzMZhx4gJm8dVmmaAdDjirox1outHSHgr6KMTfi1PjBbpDcrPqmFO3Vg
	66TY4+JqLG6vcLSStRI8BiQB+Aa8NpeQ1HFA3jrU36eHrzj1m9y5jD/PF20X0jPnMJuTdCl1eiZ
	ZmthIrFG5fkTZeLJByAEf7OfH9pwsVtjKMjWz6ymdFhLKcB0I8XHoVNy/7OuUpP5USrayU1LsX4
	2AAy2Uq3l0ha8a93iagw=
X-Received: by 2002:a05:690c:6909:b0:798:6715:616d with SMTP id 00721157ae682-7986ffcff70mr21312017b3.63.1772059171186;
        Wed, 25 Feb 2026 14:39:31 -0800 (PST)
X-Received: by 2002:a05:690c:6909:b0:798:6715:616d with SMTP id 00721157ae682-7986ffcff70mr21311777b3.63.1772059170832;
        Wed, 25 Feb 2026 14:39:30 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c7e223sm903487b3.43.2026.02.25.14.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:39:30 -0800 (PST)
Date: Wed, 25 Feb 2026 17:39:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: hisilicon: reset: Use kzalloc instead of kmalloc
Message-ID: <aZ96IGrGxz8Opka2@redhat.com>
References: <20260224021912.54365-1-shawnguo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224021912.54365-1-shawnguo@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 10:19:12AM +0800, Shawn Guo wrote:
> With commit c721f189e89c ("reset: Instantiate reset GPIO controller for
> shared reset-gpios") in place, the call sequence hisi_reset_init() ->
> reset_controller_register() starts failing on Hi3798CV200 Poplar platform,
> due to the new check added by the commit above.
> 
> 	if (rcdev->of_node && rcdev->of_args)
> 		return -EINVAL;
> 
> The failure is caused by that hisi_reset_init() allocates memory for rcdev
> without zeroing it out.  Fix the issue by using kzalloc instead of
> kmalloc for memory allocation.
> 
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

