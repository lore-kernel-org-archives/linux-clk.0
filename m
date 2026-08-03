Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6A40A940
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763751; cv=none; b=VwGVbs/7edxZpQe7184DyBSIBNqxgqyeM3SifBdyfYbc21gaSc6niLQb1nAy5+d0Htk0qLige0P8jCb7HyG4QCjNvCyCzwtX54jXg+gZ81/pZRfhooWjba1KgZ8SGA/I6OiGetkn7NYxXT4zJ5SP16ueZCrRoQGpmyOk0rrrm40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763751; c=relaxed/simple;
	bh=rt6cpLyEfLztXWT5RtkrHWdxHGWl2vr2vrgJc6Px0Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/uyQKjbRvEoZiF82J2QbY4XeL+TDQhrzQXMUl1ufCgujOVPTVFw79C5ck+AHCkD4FnhCvP2r4vN9uqCHTJJMUUypt52K+v6ZfzE6m1wtUu2LpRWdmwWgryH4FpXEuJL9nj+1JHv4XKeIgFpJkg7JabrFgGr6Zfv9TkH70x1D/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHcLeE3N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r1vTWRoh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHcLeE3N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r1vTWRoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785763746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdgp9gIIOAfbXbEpWUgB8/qfQM0ZVMZfTtpI1Q0lJU4=;
	b=eHcLeE3NQxgkb/KozsggjAwa4dx/pCKH86DCLbj83ZXrUKlZMSX8pJet9nNegRaa8ugoMt
	Mq5kcNrsjv6hoE82kvl2xaLS2iu0s7mVmtjxcExyK4KKtTr581pG/VjMLSNo0nTYuaIU2U
	fK6Ta4+upkXbj7nDspfEy9v4/KIoD+c=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-n7egSDczN7KxP2KKUfZTqw-1; Mon, 03 Aug 2026 09:29:00 -0400
X-MC-Unique: n7egSDczN7KxP2KKUfZTqw-1
X-Mimecast-MFC-AGG-ID: n7egSDczN7KxP2KKUfZTqw_1785763739
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6bb29581so122845457b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785763739; x=1786368539; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdgp9gIIOAfbXbEpWUgB8/qfQM0ZVMZfTtpI1Q0lJU4=;
        b=r1vTWRohjkAnSFYC9Bv90N/gg0Wqzm0YcBwvp7/4ECoux3OV5OJs2K2CXc1Bhnevdw
         YLlqMzYJK3IEUA2BtpNnwo5DHD3Gos0JHPyXgYGgEp8b6HrCQ2SU0SBD6CQkNFBWQnlC
         Vhb852GR9fazaixGCNunpiMU0YXOBHIuweA/5iTmD1YBMJbEbjVozOnWG3vbG90tslAy
         L5c0OMYZ3Xl15H2BOc2F5YCIFd/14w5IIqXvofaHt5Cz3kQxgKIC8bX4EfVIjVU1AVE4
         f43nMtFZ8FcjxW69o7z/3P0/odfkoVqacQE0csVNPVqzRUxfKk6KW80hk0PezyUKxZRD
         woxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763739; x=1786368539;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdgp9gIIOAfbXbEpWUgB8/qfQM0ZVMZfTtpI1Q0lJU4=;
        b=Id4USd4W9EGrBOc8RB5frB02aZCSfifKCGYnbNGuJODs2PCEzHNrDSvKl9mh3jnknl
         d9HK+6zOrQ6dX6CjYnK528FEysI5d0gfHjBVaKVp8e4XArfHzuOS1ROzh7jZdX3lMQSQ
         +TstafeiAhTOznCtCK50ZZlTPk0NrKwXl8GOMLMMUZuDUZ5f16aM8HC7zGTHmzfbOXcs
         saWQW70diGjFbl/iaCZMhyC12LW6MLCzd0HZABge2dnuvnbznLTmNT8qTbSHs2IXd5Xv
         b6vpeI7mYS7E7sXIJh69rFbFquQy4WBPonfv/6O3iQRleCKXCP+yqipfuNtHMO3E+1Vx
         yn9Q==
X-Gm-Message-State: AOJu0YwDPrIv3gzqb0lg62NvYCWAhsto5DlrzcOMqmaOywXYu8nd6psW
	udFXMFzDlZ82FzhwsmL12YWK9Q1Lb08Stv6UZ5MBHYsQizXl+px69v7fAyCwNcg/zkXOJ2F9100
	nC4lXLnxAIDjrtzsrcxYEBGOEx17dLnXsgG7UyiHAuZZRGEJ2P7i24Ct4Kw/WvQ==
X-Gm-Gg: AR+sD12DLsjQCVQLCp8Qe1tPKe/CkBC7/4QamBdKKGJ/F2fYSn+jR+CeMSbF/4DfO6l
	OSEjlhFsECKUusa4z2L8cXbbVfqsPty66nqgitYEcMK/s0sAqIqvTodyPCmRHvzFYO6vsDIGLLF
	mqqVO8UUnY9yRVxBxuB5+MsrWVI7YWt8JhdA/YgUNLYgnzDXM2m1bH9tCN0mlGlRLONobO/DTVS
	/ew97DJYQ6fm1wQBpeBXpnofrBrYduPEIzYI1Va1D2Hallf1VZUXTaY0KwX9bILj9u9yHLlEQGW
	gSSzsmHtA4ie7VCSxuycICcLFY2DAXslYdCNliy/7U0lKE8PN2dy+vApU2daHh0NhQ6aYt/xApK
	WOSMSRaPlICuUSXwcjqscfgrPkEWeEU0I3Q0=
X-Received: by 2002:a05:690c:9981:b0:81e:8577:d044 with SMTP id 00721157ae682-81fd4c3a213mr122859567b3.35.1785763739397;
        Mon, 03 Aug 2026 06:28:59 -0700 (PDT)
X-Received: by 2002:a05:690c:9981:b0:81e:8577:d044 with SMTP id 00721157ae682-81fd4c3a213mr122859327b3.35.1785763738931;
        Mon, 03 Aug 2026 06:28:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd164474sm55597127b3.48.2026.08.03.06.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:28:58 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:28:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v1] clk: devres: fix cleanup in
 devm_clk_get_optional_enabled_with_rate()
Message-ID: <anCXmGAFMnBl4dIt@redhat.com>
References: <20260801111637.304590-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260801111637.304590-1-work@onurozkan.dev>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 02:16:34PM +0300, Onur Özkan wrote:
> devm_clk_get_optional_enabled_with_rate() registers its cleanup action
> before setting the clock rate. If setting the rate fails, it attempts to
> disable and unprepare a clock that was never enabled. This issue was
> spotted while reviewing "rust: clk: add devres-managed clks" [1].
> 
> Register the cleanup action only after successfully preparing and enabling
> the clock.
> 
> [1]: https://lore.kernel.org/rust-for-linux/20260706-clk-type-state-v5-3-67c5f326a16c@collabora.com
> 
> Fixes: 9934a1bd45b2 ("clk: provide devm_clk_get_optional_enabled_with_rate()")
> Signed-off-by: Onur Özkan <work@onurozkan.dev>

Reviewed-by: Brian Masney <bmasney@redhat.com>

