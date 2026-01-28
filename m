Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEA352FA9
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606794; cv=none; b=iM7visQnvuwtNL0vf+iEvVBpBw65a8qzgvfmmNJ0rWdOfGZr0GcoQXX2zC4O4DGXOYRkbtZ+8XTQ+Gyy4e4jXq4BIetY+Xtm5Uek1BmnSsy1ZcIaGY81wXPY8Da0fUcyAIMV8nHsc4yBsNHi/XWObvqP8dFDYYWfi/C1EzYgpU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606794; c=relaxed/simple;
	bh=najxUKo+YLQ9QkcyxlqBzG7yVQhZ/HB8dlDFLbLU/lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGREq+i7v+GsGJuQsHdBS7ZiNKq25k2jZoMsa7ZLBCYnE7iy8ZPTV1o/geWAZAS8pPMtYk+tsYtgIqse4P2ILGF68p1AfDui7L2cEeMt8dl/7lVsP8Nu+ZbDT8jkbiz7IHNhzLUfeddrskNoA/7i6+Y92BVru3j2HgKTaOLW3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHX4IE22; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIrCNZO+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHX4IE22";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIrCNZO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769606792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=;
	b=FHX4IE22GIm7ABW9GBvmxeO4c63//2z6nmXR3LGhap/qvlPr/GN3POf5K7OTkvDBoalUm2
	O/liUfJpEzh7HNkhGlxijEHhiRlgyhhgckAizeYtQFhGaDWicz1gGfoQhR4+YWdfFTBxNu
	N3+SExxpm2DF80v1gTak0ohJRY/051U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-uvKD1XjhO4K7bO1MNXMlZg-1; Wed, 28 Jan 2026 08:26:31 -0500
X-MC-Unique: uvKD1XjhO4K7bO1MNXMlZg-1
X-Mimecast-MFC-AGG-ID: uvKD1XjhO4K7bO1MNXMlZg_1769606791
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so135293585a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769606791; x=1770211591; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=;
        b=hIrCNZO+L1MO6Tn+RZovPeIdeXTrwtQaiq+mp37EyBkPe3pDEoJqrQ9mD65ULUjN1e
         N6cEhZBT/FP8t/3XdswVpfIycqG4E+yY3unSBuc0jAx22nkypUauiMeVMeiSc2qKWmBw
         ts3OixXOtTy3/7bSm1DOAguUpMkZQfdmlODlC+fYRQKz76wM/3rfOJeTLiDSzg7GhmuP
         TefOLx67JXU6w4ufdW4r2o48T38Ipe+LjFIhqfrsahp7T3Bp41hklroKGnDUEth/9Mhd
         76D/7bN2EnkhzileZC4CJbR1BA0nS9hcoppyj3j7a4S4ySm1ZSATwOR0Yhx41pWfeqEH
         SsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606791; x=1770211591;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=;
        b=iznuIfjPlGZCqljW/tokg3XGHxNV1Smlnl0VcXScloXI5ElBON+IeQ8hhJROR7iari
         g8DpiIiZu/8/zn0UBqNd+3TN14hKzK2crpNlFjJXJh62sLEUGMCvwdqCN1T0RttIG15O
         a0osnCBA2nHD0EIPp5/TnMiK7rSdrJxBY3mUa/3MVkaWVD1DApI1mBTFXpIaC4elNazK
         NSHswRBt2T6Kh+zB9Itj3nSPdgEQww1SSD8S1avr/vAqGtcaXAFUimG44qp7ng9aIg6R
         qCx21Z5/8mW664mVDcF5rkuGN0w4eehdRyVi7wKeXpg9r9CtDwIq0wUfci9LlEVJz21n
         eyAg==
X-Forwarded-Encrypted: i=1; AJvYcCWk6uCuVDZCGgp0HCoqNey1bfQDK+mMZ2GnJP/CkYWXAZjYgMGm43knh4cwQvlQZ/yk+bu8yMzwt28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyttVTBkkoIfS+qXvjojVT0Jinfr5dktue/DUfMENaFJRbzCAAe
	MVrzLHCHsFeG1XQ4TccxlRJnGh8eCV/MmD06KzF1QoZWzm+QgwZCgL0p+2AHI36BnV4uu3CHWa+
	p+rDfRNuq//vK7LX8O6w2gyA7km0Lgb/51jZ8zBKOIiPVjr13z31t8AJcDn6ukw==
X-Gm-Gg: AZuq6aLqxN8pJqmbBJICPWUoPTZ3wLDXX3a/KZPQsgTLXG1zQslnLAK93cSe7mfOeRR
	woqPs9p2qgd531rn28R+kT47P1cCHPnx2IGBUjJvysxYRhW1fgG4ILlRDVUuSOrJOkE4AFTIaLU
	KoNnxuzntv3xU3WHzSEO9RtwX91XXC/z9uYxsP9MtFlI+/oakChzGcmNcQuARH02M7OYUwDSic5
	BJYR6Z4q2/l0hgYmre1AO+EEmv6oSpZpAtL90JSfbiTtgqZsx/7jMUQ+sZ/QVzVzck3rMas0+lQ
	rkr/KJ3zGTWPqbYVvnPzopyaD/murC8k+exLpjehMgyeV4sSWvZ+3xx15HO3umkQk59cVicntiF
	yKGsvYS8iGpOASiz8yBZyBbhA7HSG/2rPiIzploc6pIwO
X-Received: by 2002:a05:620a:404d:b0:8c7:7a3:501b with SMTP id af79cd13be357-8c70b868c0dmr598544085a.26.1769606790679;
        Wed, 28 Jan 2026 05:26:30 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:8c7:7a3:501b with SMTP id af79cd13be357-8c70b868c0dmr598541085a.26.1769606790291;
        Wed, 28 Jan 2026 05:26:30 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2cdbbsm176902885a.28.2026.01.28.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:26:29 -0800 (PST)
Date: Wed, 28 Jan 2026 06:26:26 -0700
From: Brian Masney <bmasney@redhat.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ASPEED clk updates for v6.19
Message-ID: <aXoOgltiXIfIgX8T@redhat.com>
References: <OSQPR06MB7252BF7364580CADD7D3F6928B91A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252BF7364580CADD7D3F6928B91A@OSQPR06MB7252.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Billy,

On Wed, Jan 28, 2026 at 07:43:01AM +0000, Billy Tsai wrote:
> Hi Stephen,
> 
> Please pull the following ASPEED clock driver updates for v6.19.
> 
> The series includes:

[snip]

> - Reorganization of ASPEED clock drivers under drivers/clk/aspeed/
> - MAINTAINERS updates for ASPEED clock drivers
> - New ASPEED clock driver support

This changelog needs to go in the tag. Currently only 'ASPEED clk
updates for xxx' is in the tag.

> 
> The branch is based on v6.19-rc1 as requested..

Looks good.

> 
> Thanks,
> Billy
> 
> ----------------------------------------------------------------
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/billy-tsai/linux.git tags/aspeed-clk-for-v6.19-rc1

We are on v6.19-rc7 right now. This should be for v6.20-rc1.

> 
> for you to fetch changes up to dc345e213f16d3ae5dce01bb0002e46bc4eaff4c:
> 
>   clk: aspeed: add AST2700 clock driver (2026-01-28 14:58:47 +0800)
> 

[snip]

> ----------------------------------------------------------------
> ASPEED clk updates for v6.19-rc1
> 
> ----------------------------------------------------------------

Between these dashes is what will appear in the commit log when Stephen
merges this. Include the detailed changelog here of what changed.

Brian


> Ryan Chen (3):
>       clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
>       MAINTAINERS: Add entry for ASPEED clock drivers.
>       clk: aspeed: add AST2700 clock driver
> 
>  MAINTAINERS                            |    9 +
>  drivers/clk/Kconfig                    |   13 +-
>  drivers/clk/Makefile                   |    3 +-
>  drivers/clk/aspeed/Kconfig             |   21 +
>  drivers/clk/aspeed/Makefile            |    4 +
>  drivers/clk/{ => aspeed}/clk-aspeed.c  |    0
>  drivers/clk/{ => aspeed}/clk-aspeed.h  |    0
>  drivers/clk/{ => aspeed}/clk-ast2600.c |    0
>  drivers/clk/aspeed/clk-ast2700.c       | 1055 ++++++++++++++++++++++++++++++++
>  9 files changed, 1091 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/clk/aspeed/Kconfig
>  create mode 100644 drivers/clk/aspeed/Makefile
>  rename drivers/clk/{ => aspeed}/clk-aspeed.c (100%)
>  rename drivers/clk/{ => aspeed}/clk-aspeed.h (100%)
>  rename drivers/clk/{ => aspeed}/clk-ast2600.c (100%)
>  create mode 100644 drivers/clk/aspeed/clk-ast2700.c
> ----------------------------------------------------------------
> 
> The patch series can be reconstructed from the mailing list with:
>   b4 am 20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com
> 

