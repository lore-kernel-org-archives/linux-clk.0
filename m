Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA0233A9E1
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577537; cv=none; b=S1oKbW+Kg3Ng8M3dfN5VYUzQ75qfHsC1Hs8JIXLSe1yAMG09t1pMLHLrHfuqA73t9G1u8JZDhL8E2yYJkwabBXis0JewnibJ12kjp+iURyhL7YzKm9qUViFhftOmTyntw822NktK+cgbzVDbU445i4aGbtPl2vBlHLyl8/Wqkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577537; c=relaxed/simple;
	bh=z8yTsxVkx/k/RrJ8QgerQthUrZKo0sMA8dhqUZa66go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoifilHIrrkT5xgtd7/XVE9llMFsLCdFuV28MGgSGUF93w94Zl6CDCWelHIPt1VzIP6CFJ+fy0TroCKKGmJr17fTfahBPlMAoE+skCYi0LK+p6CQHxblh/apiB3DcyJcFBH+FuA7/jHwz+GQq9stb3T5req1HOklwOpqSsmTfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHt2kup+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GGdi8hHn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHt2kup+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GGdi8hHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768577532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SWx/VS75C158fS4UOc4DRaIxzqXmwAPXxKRs4s78E1E=;
	b=IHt2kup+BbhAwCehm0J27ApdKgEhOYdbb8mrioltc2GlTMpakGkavY06ydLZfhs7MjwMwy
	ge2p8GnjmNn6ud03R4NWHNqvcp/VFzs3DnSwnn+CPjZbeTE4ylujrwbqDwrks0iHhAxMX4
	kRv70gDKdgS07CLC6PPtivWHLGarwT4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-a3bj-INdMC6sDcXNW-Qyog-1; Fri, 16 Jan 2026 10:32:11 -0500
X-MC-Unique: a3bj-INdMC6sDcXNW-Qyog-1
X-Mimecast-MFC-AGG-ID: a3bj-INdMC6sDcXNW-Qyog_1768577531
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so955455785a.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768577531; x=1769182331; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWx/VS75C158fS4UOc4DRaIxzqXmwAPXxKRs4s78E1E=;
        b=GGdi8hHnxQlUVSXterIzf5w8d7Pd1/dQ//iEVzuqACa6mlIuYntAoxW5nPvBFZcHvr
         3vY0VE5NP/UIlsiNQHn/u+Gk25vUaJ650VBb1APttq2SdaOOURKp/VC0QA781jQhZf5u
         CSxErx+vQp6JT/z96l6gvFXNWDR9w+Jgji3C2W7zPPSH/X3KqDMzLJX6HRgi+YjVG8fg
         lqHDtsAzioGeGD8fZ9WPGz18P5frvXljwghw6YW0GSqzjed8fgY+qQTBCOZ70rjVPfHu
         rToppKzCxVA/rU1DMReDisb8YWJmzaw2ZtnSv7uu0ia2+w/T4E6l+f9pF2q0dkBFN9xW
         1gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577531; x=1769182331;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWx/VS75C158fS4UOc4DRaIxzqXmwAPXxKRs4s78E1E=;
        b=B2/O0k26GVa6wetNzZyfyGEJfWPc+JKqBaDwN2LP22OQbWufvToU5f+m6YwEPfMgH5
         B3AJZcdR2DgujUKHeDmjdKVNtG+HgDE8QiZQV9BP4KSsRxpct7/2ZLPDK3/Dq0WvoJO1
         tRdWcUaNZdvQxW5SFd3LzLCr7MIymUKws/JVfgrPrSEbUCGHFmYQlTCFR40l7zX4KrT9
         ENOYPMgOz3hiFTz4akvHn1wT2/mGpWVvE5cweMZr2ID1L0eDW+9LEmhoB3kTbi05OxWw
         /cOUfXnOuqBCYv9bh/p0lPiq/WbA6CvF3jnGamcejWM80NWoVEDmlDe1uG/bhlp6iE+p
         6tzg==
X-Forwarded-Encrypted: i=1; AJvYcCWzE9lcsDdVyIWoLGqD47kTTZawbF+FBgDKafrJIJXCnAwRStfOlFi6W9iaX6mqPL+yStlRSd54ipE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgu0mcPRx92zi74r7sGDDNT90lQEDHenO1fpy9X5tbtJRdNxGT
	VN+4XOs69cghhjZySzfb7+Pp5C1NBQqFXMgzDd0/KeGs5zCMBYxhOaey8KbH7JpIIIPmGadYeSZ
	tWp0wkw/U777JdSj8upM94mrAphmvTCa6ObAC/MoMNJZHPt7m4Sjg1vHEbQ30mg==
X-Gm-Gg: AY/fxX7jnMU8cIqH3X75Bf8snIN9X0apHv0aFFhzoWPGS2+xjcDTykXzZmGtIt/LBg+
	KiBV3lZopqtlTIqTrZsZVIaYoeXAXUPD1dDRLN6XEhehngOdbBekMZrjxjVnzhdPke98fi1fVly
	GYNrtGAmawPbaFOn9sZAvbka9vP0QFVJgJf16JboiwdG4SrqKl6xKEhS+Wvp3SeUxxQuJbcEwl+
	KOauu4KoHTIT6No0mDfzbJNpuuQvSrebnRz7OVFBQZTj0BOhs9Hg1IGLzK6GQXs1VpYzPFJxOgz
	usf59YgNongAJ1pSCiDu/17YBd7831ePXbUxInrnXESroSiqv6gzTRUvaOQKfdjnPtBy9umHxHG
	k4nT+U28C5msVQq3fS3Y/hOT6Vw/1sqKrrj92ByyzXLzj
X-Received: by 2002:a05:620a:2a02:b0:8c5:33bf:5252 with SMTP id af79cd13be357-8c6a6963403mr407414385a.70.1768577529304;
        Fri, 16 Jan 2026 07:32:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8c5:33bf:5252 with SMTP id af79cd13be357-8c6a6963403mr407411085a.70.1768577528861;
        Fri, 16 Jan 2026 07:32:08 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ac960sm244476585a.4.2026.01.16.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:32:08 -0800 (PST)
Date: Fri, 16 Jan 2026 10:32:07 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] clk: st: clkgen-pll: Rename some variables in
 clkgen_c32_pll_setup()
Message-ID: <aWpZ9-2uea7_HGUP@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-3-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-3-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 07:38:42PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name.
> This patch rename the preceding `clk` to `pll_clk`.
> The rename is in preparation for cleaning up some memory leaks.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

