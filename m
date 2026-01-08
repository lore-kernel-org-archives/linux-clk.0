Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41BD2BEC41
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914285; cv=none; b=gFhshVQIDHMebbD1SmH/7Zz60Y21srI/K3lQdLTJEQYmXFueCNRvkolm68v/p1ZU3z3zVqHAmN/zExxWg1u9zJnlcPwtQOz0EIDkO0BimLtfkhAWF8snDWMqYHnUMt+9k1Hp6008MsZjFpQajnaSMj2qKTrhL33zT4lfi6e0Mh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914285; c=relaxed/simple;
	bh=NTPOJkiysZJtVEyt4iEXQb3heX+UVL0KUCdqfCPolZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4YHBuO0NRio78jYJQHtDlP5L02u7pcNE/eBPNsVnsElaj4po2BliDSP/GJwSytY2L9nNodSZ9LqPh4hRGIx2koJBHjVZYC9WAsWPYk9rHx9kucTQRUg8OW+KVY0N9z7wJiylnTlURauWoqi0YFHyoND9DcHCnKtfGSrLWQajwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dnhv0hoG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHE7bG22; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dnhv0hoG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHE7bG22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767914282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XmkhR6d23VB+MBS3bmm1gqOxsKykbeYeimHuXpLEvDc=;
	b=dnhv0hoGDFBELj0v00vBBo33LfeSAiYg2rN2s/kEPh7rNQU+n5grwTSRvFI9NUl3D3tKZH
	DfceCpGIk2gw6RkRypOT62pvN0tx4vWLMmh7AaK07IpjUzFkkIabCwpqvZUESwCT+r9shI
	ucrKh1GS5TzXkGZEtGPpESOPVsF3NHE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-6QGhXG4uOUejiiSITWRbVg-1; Thu, 08 Jan 2026 18:18:01 -0500
X-MC-Unique: 6QGhXG4uOUejiiSITWRbVg-1
X-Mimecast-MFC-AGG-ID: 6QGhXG4uOUejiiSITWRbVg_1767914281
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39993e5fso92388196d6.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 15:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767914281; x=1768519081; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmkhR6d23VB+MBS3bmm1gqOxsKykbeYeimHuXpLEvDc=;
        b=cHE7bG223KSJ5jO91UR2yzSlPXR5LARF535hjZq3FV3GEXluLK649fS6fWBYYMuX9z
         JEve4GuLU34U07tpjpTsx6UuCcvwjS9W9GbHH13qUvaE8M6p77pXshcOSXWtqsMyyKsC
         ytjfUV9XwNOghlWD69L9pr/5rfRi3mBUmkyDpFY3EU22xtHlOUcLSBhSDnAORgrMh7RG
         asEUd6DnkA9miYiQJlimHVZfgCmkmoViFc5VTx4p1mg7HBvb6agHBR7RVLyJ7cyNwy5j
         5om22eWNxLe1BVs88Ybfwdp8fNyqteEyZkTIDrpFUtWbggaybYNMqlSyTBzbbnfa8WRy
         5g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767914281; x=1768519081;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmkhR6d23VB+MBS3bmm1gqOxsKykbeYeimHuXpLEvDc=;
        b=Aar8jPQCoUwjjahTY0634tQMCVE6xqYefOKPgB1Yz3DJntLktJY3rziOSbrfWG9O0n
         3TMlmwGey7jh8HgQ62xFsS76y7osAvTxylyx2WYvDIhfe6hBTvynG6hfK8x1JG46/ekA
         m9AvwM9AeCpa3milKcwTkmHIgGJTnBi8WrMfJl2Wy3U4n68HXyrMyhEtop96takIrX1j
         rLQoxan21uTKQzmaMJfxP1wrDZrWJHTIyHWc2VTbllwuknzjfvVpyTYX3b820VOfvKz1
         ekknJ9+6RilBe5ZEfBaH6qFZeByCc5iMxUjjW3YyqtrUQTTITucmlmHKJiyd3p0qlwmk
         AYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcow6CC9TTx2sGl848RYQsyEJ2jMKk397cM3/61pbE9Z4/FwmYFjfXQHnABd1XSUkBngeLUht4VIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZWJiMuOgph7L9//mmeOTREmryJRVMCWrNfUTtyN2p88OYDKN
	+kKtMMIKqWRxdVyxJFwXOOqFr3ioDzRaug9TJc8wSm4Owhq12Nq2o7i9wXGBBCZ2epU/yVr+uHI
	0E+7bLGmV8EG69w/nHV2p41sUv8BfBI7Gc9XCVTIJafwkxs4GANI9R9QqFNCSnA==
X-Gm-Gg: AY/fxX4oLjofLU1pLXlF0qzO+iOiFV+0k5va2wGsjBEIR4WvVrvoOD/ftTQSP9zlIZL
	u/JM2g67ADkoMNCGo2dy+Vp9c70UvdSz2ZEa++abFpPSg+LF9N+i2tLZrJtBswox+47Dt5kfRdI
	7UzGne33LUV33icZwFzQwtFH4b9D+b6LlbbKLTSJSPkPniZ68hZvXDoBLSe+8tYkFdk27eZ6NJr
	mEfRx3e2q4LlWmmwaece8sBLpFto+LSdai9BZaq+1gsqx+1kWA5BlKsnIaPcUKvsr7cTOxkwb69
	qZR/mU2gVjFWLIj81ymnEtv6mqiHZ1eYCRFtrROrloOEHz6eJ0j7jVHRIXFncSvdirWYwTK4dnM
	sHkK7oTk=
X-Received: by 2002:ad4:5aed:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-890841b430bmr111176966d6.27.1767914280803;
        Thu, 08 Jan 2026 15:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiAMx2ilPAG+6O2GSLEnHORK3xHLY/Vgkrq55ZG7qozx5/LKhCSFXT6oYJmD7gtqTSNdJ6Qw==
X-Received: by 2002:ad4:5aed:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-890841b430bmr111176656d6.27.1767914280404;
        Thu, 08 Jan 2026 15:18:00 -0800 (PST)
Received: from redhat.com ([2600:382:850d:c75b:2aa0:b08c:d81b:f52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm62576156d6.2.2026.01.08.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:17:59 -0800 (PST)
Date: Thu, 8 Jan 2026 18:17:58 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: drivers/clk/microchip/clk-core.c:915:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <aWA7JkZAIGFpAeVZ@redhat.com>
References: <202601070531.yJ4x70yl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601070531.yJ4x70yl-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Jan 07, 2026 at 05:52:23AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> commit: 7d85cd8730ab7701a1cafd0db0d7b6b1f6cfbb91 clk: microchip: core: remove duplicate roclk_determine_rate()
> date:   3 months ago
> config: mips-randconfig-r113-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601070531.yJ4x70yl-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/microchip/clk-core.c:915:10: sparse: sparse: Initializer entry defined twice
>    drivers/clk/microchip/clk-core.c:919:10: sparse:   also defined here
> 
> vim +915 drivers/clk/microchip/clk-core.c
> 
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  910  
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  911  /* sclk with post-divider */
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  912  const struct clk_ops pic32_sclk_ops = {
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  913  	.get_parent	= sclk_get_parent,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  914  	.set_parent	= sclk_set_parent,
> e9f039c08cdc9b Brian Masney         2025-08-11 @915  	.determine_rate = sclk_determine_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  916  	.set_rate	= sclk_set_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  917  	.recalc_rate	= sclk_get_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  918  	.init		= sclk_init,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  919  	.determine_rate = __clk_mux_determine_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  920  };
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  921  
> 
> :::::: The code at line 915 was first introduced by commit
> :::::: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c clk: microchip: core: convert from round_rate() to determine_rate()
> 
> :::::: TO: Brian Masney <bmasney@redhat.com>
> :::::: CC: Brian Masney <bmasney@redhat.com>

I posted a series last month to fix this issue.

https://lore.kernel.org/linux-clk/aWA6rNLNqYfJKTzf@redhat.com/T/#t

Brian

