Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50936404B
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521844; cv=none; b=BCEsmdsa1IWRFi8nGquyHW7jwAdUf718x9AhIIfDqmauGfxKDubBs0rPZFmR3LyBr7Uxx3UTW4XM+DAdTmpxQn9hsz9Zy20j4uKyxW6x4ZOOd8o7s1E5SwVf+qILsIYs6PNLsNMUUrMcL5fJ7LZwntjsYAtq/XbTrgZALVXh8ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521844; c=relaxed/simple;
	bh=EaXaYua7o4ahXyCXfZzAWBelHiLbxOXKh9bHYpF/9S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/+f/nafDIO3j/MWMgl0WQHhsGXD6YqpG6ev4YYQRlUhEXP/BQMtqr9oJeOQIY8/OGKo8u+r4REMvFs/bFRKsB7hPwVZlk//0iUFAGy10j3II33zYcLQyFv3G5EjY5VW8S63XjTIyleeNWUFDBsRNdSXEGdeZIrJ5e5K1YJp/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEgK6tOk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uNLcGs01; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEgK6tOk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uNLcGs01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778521841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ofDBK4Z4CQaKLzXeuBDhGcCVh8gyfisonJllNsg6JRU=;
	b=hEgK6tOkDNd9siqt0UyUtyIpEUzsdkTacuL6uo8pHSdWZAB/eqonmGBTo0BXrQJY6JH3ls
	xHitjtyWZ+Oy2iT2u75Alqv+38DpLZsbRbK/DjsSTO4YkfMnstoK63fT9nzMWfsaOHXGi6
	XwqKyIH1bJquz58cbeJkXSynDQJXCCg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-0moTBgh5Og-VwXbb7xCn6A-1; Mon, 11 May 2026 13:50:40 -0400
X-MC-Unique: 0moTBgh5Og-VwXbb7xCn6A-1
X-Mimecast-MFC-AGG-ID: 0moTBgh5Og-VwXbb7xCn6A_1778521840
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b0312bb1dcso120891166d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778521840; x=1779126640; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofDBK4Z4CQaKLzXeuBDhGcCVh8gyfisonJllNsg6JRU=;
        b=uNLcGs01WERApYYruipjPhPDnoc8KIqGmUsD53qsmx4Rk1KZkY2fE2lRiQDMidKZ4I
         5kHCBt+Qaw4L6+sO8//KufX2JV7H+XWR4YOTWvkYOk46Z2YiIGUyb6nXv/WWj5zQ0whR
         jmxXSYYZkimglo2gcySb7q17b4LeM9RS7eg7afuHTbgwHniBapDNc5ZICChLnjEfDFUC
         CKXwMrxA9Xae6xDtfEsTcdi8ht18BT842XYylAzRXiNCj3b/Kbb49o+RqZeoQZLY70YU
         cjksPo1ypF31kKQZA2p49Q7zuqrcMNQCkQ00yMb3bEq+2QD5NnkIi374whI9j/GF2gKZ
         gdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521840; x=1779126640;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofDBK4Z4CQaKLzXeuBDhGcCVh8gyfisonJllNsg6JRU=;
        b=BTnfBbZjoHmIS5ANIEDYTgtJb9SOSE4IYTP+YOy8mrPMGK6migNyE509z9W4tDHwxW
         JVp4VydQKAu6X0wpeD2GRnsb4b5vCisUsWNgVwVXlcZAU83hNDICBdGYvWA2VhftG0Rm
         +XY5qH+bcdui8OF9ASRId7DdYffEAlvpxaqaQ3hhLESA9phHm1taDUYtuWlSGVpzGODN
         KUwkZP6fNYjNgEhc67qCtp+TOueaXfHjli66jWZ+oHhimczSkQaveck72UGwBYUnQwzb
         aEnXOoEeS6Jy51+O0jQUzZ01SN3EK+U3T5fkeYgpjUuUkEH8DYh144NOM2apXjvyydxv
         PQaw==
X-Forwarded-Encrypted: i=1; AFNElJ8DjZQRkHKjX2yV6ZkbcesvTC345FjL4/HBXJo6hNAit79zcWHYhNZtwTwXo5z4x+o6HzWB9xdkcWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6prGeEmzkpjN7dYmytod6ZL6hg8qF0XU8pPF8pBi8IEVCF/67
	aEGjlcmz4lnwSLLdS0w6JbzKNkhvbwa9MORrhUwyZsNBkJyGcOVfbjaafFvpz+6xVe192lqilk0
	mD5h+b5/Gvj2AuF+y0QhoPMRqBeJOLEaP8U7j29gIJZCMljwkEPtwGj3RKcmQ9g==
X-Gm-Gg: Acq92OEgcs4xGs9x01KovbMbdnVSfzZmOiPzMF9DpfFlj/V8G/pyDCLwwHyXyjCed14
	W+ybrdj2Pghmyzz4Yj79aOhvtpwvRQHXdZX+2DcVoLZllNeWAQXOi5SHsfJRSaHatirCjXXWWco
	5gim/c5attIYFuQkP5tN6laSRqCQYT4VlUd3KJeyAu4tzS5dUAg9EbE4OBND8/OONH9KgBkAkr0
	QbYh8oydRLKhXQGOdqIc9ulWFR+iTgmzxHkV0KkGQCBk1Pb3ya/F1S/30CgPbHbhPWEJ8YuP8Y+
	ZznzRTm07fNZW6Bl+CKbA80OxUHrlAsgljElCNENGBnpafv8mq8nKzhPqdorGfmRe22vSU9d6eQ
	2wpgk+G3yZWJ8da2skhB5PQZNh9c6uik=
X-Received: by 2002:a05:6214:76d:b0:8ae:61bb:95e3 with SMTP id 6a1803df08f44-8bc44ba4e17mr389085676d6.36.1778521840008;
        Mon, 11 May 2026 10:50:40 -0700 (PDT)
X-Received: by 2002:a05:6214:76d:b0:8ae:61bb:95e3 with SMTP id 6a1803df08f44-8bc44ba4e17mr389085326d6.36.1778521839492;
        Mon, 11 May 2026 10:50:39 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:2102:3d38:15e1:b99c:6000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e032sm99839816d6.32.2026.05.11.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:50:38 -0700 (PDT)
Date: Mon, 11 May 2026 13:50:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Min zhang <zhangmin2026@yeah.net>
Cc: Wei Xu <xuwei5@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: hisilicon: reset: Use devm_kzalloc to initialize
 hisi_reset_controller
Message-ID: <agIW7IZyDVFQd4pr@redhat.com>
References: <20260511053216.538035-1-zhangmin2026@yeah.net>
 <20260511170415.19848-1-zhangmin2026@yeah.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511170415.19848-1-zhangmin2026@yeah.net>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Min,

On Tue, May 12, 2026 at 01:04:14AM +0800, Min zhang wrote:
> Using devm_kmalloc() does not zero-initialize the allocated structure.
> Uninitialized members in struct hisi_reset_controller may contain garbage
> data, which can cause reset_controller_register() to fail unexpectedly.
> 
> Replace devm_kmalloc() with devm_kzalloc() to ensure all structure fields
> are properly zero-initialized.
> 
> Fixes: 97b7129cd2afb ("reset: hisilicon: change the definition of hisi_reset_init")
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Min zhang <zhangmin2026@yeah.net>

There's no newline between the Fixes and the other tags. Take a look at
'git log' and look at the other commits.

Sorry for the trivial ask, but it's important to keep things like this
consistent across the kernel.

Brian

