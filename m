Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58830CDA9
	for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925286; cv=none; b=KWrgaQjFVF/XJxTAGfBEe2YF1aP5Tfbb8jF6m2PFW0aAKHwxAH36bJe+LKM+MwE5LSs6HFZj9RnqF8roEeq/S0X4z7lR9/ZmZb5l1Fom2uN/tC6odt3XR++1L+42+9Dx5aktQ+A46JV9Qaa6nDlp7xXIhdfvantztyz8J3urfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925286; c=relaxed/simple;
	bh=OAlcXf06DqHeZITyuCm4u2rX3/A0ukQKXd0VUmaqUFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAC1/+kZLyrFUuV46vNtI+NW+Ft96n3pti1cU3pq6g7NKvACLsYkBQjuiOn3IUIPrD+RS5i1nxOGq718VsikrCK9R7dtYjBrys8/iqGW3aXrUYljCeQz0cWkMOEA5qcCaOdiPltnFYZFtgbHrARfC3S/ht8IuV6Tf92lgfYziYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mslIJ0xr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mslIJ0xr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so1949162a91.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765925284; x=1766530084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=mslIJ0xrAhzmiKSaPb3nzjQtnaE9rX7U2T0bp77mFddjSm/iVgmicZuxn/hN+tywTT
         Nlg4ekOthBrCWoh+J7m9Lxyg/+OWSlxWLt3GKvCOk5TUNEpEFspFVnayrPN+CYzU8Tzy
         To4vlk9GmpJZzG/0hvRTJlVsKfxmWPHU9yTmI4ySc9Ygpu52o+8drKiAYIeQpUAmlN8n
         K0Mw9MJvW+M2IFC0IMgev2nl0cnvO7ClWCIqw7QXNvnAZoZ+Lqx8ztN/iADl8g4jaOEP
         l/KCYBh9Y8sL4bdpAFGknV39xum9LbKL8gpTQMazrKHTCi7Ffi6x60bhqGYrAsgLG/Gg
         LxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925284; x=1766530084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=UeBvp/xTnPnN4JDMHAYZWxYx5uYeYYg4iWieiyxDqIJCq5mWr+sdbkaRBVpT63ehs5
         zzgtjMQqQxMlujQ83SfgrQzSNVAoGHOs8bQUWfe9A2Cml3FUci8fffNEWRygD6wToouX
         AuXllEDMhrtF7NGs3+wNvEk1lSMVW/XKlZOT478r3lI3p5Fjvrmu6ti2DL23UIT8rqnu
         32d9+o71BXQ+d+yFqxQ9pjUNnH4Rgoe+kYJe37t7cWVv/txAHm7DQFmnZl4pnsFRrOOf
         nfuxs8aLwQVqhmtJBwYa0QVNtVMPtGtx/9H+k/tDJHSz0MxksUN3kYVrOR7op51wQb0h
         WPjg==
X-Forwarded-Encrypted: i=1; AJvYcCW6MN78lOOK+bYG0ESsr4JJQfCQbpHZ6Fco8PsSRimAeCHUSFbRKJ3c84aRCbbhe+9ld6bYkfhA1Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBCAnDhiUTUg77Ue1suWjNwvh6NMf0ljE94ebgyWURT+EKTOw
	x/J2u7W6+ZzJDdUGF4TvAcMYtaSEZ3w5crn1HZ2j/ekEOUJIqvhJANBv
X-Gm-Gg: AY/fxX7sOzd1qop8Cf9YQ25F6+LZe6MaLrSCdUdt4qI65qbERccFxdICkioQe7KOXPB
	dY/Y/I6l1lkptn20MVbDIQinqic1ir5o+fkxKBUWJuIQcEaNiilKYDDx2QXJ0k3n3O2RTWsv2Wr
	Af8FjD0SLHb+Lt7NqTHUaY3b7IoLRTzBI8G6h3zOH1Vfgxg9BgRuXUykNInra8996XNeJOBZE/Q
	oWnGCHFmwQOsBV3iE30zpL7g9um3/+JjkAmAxBsIMpve/chOO6GprWe0YBXVqTolw1rmYeJ4pz9
	LauFsteZEnTL9tZ5lcpnA2naghuDDIx0MTUcQ9KaF7pH+vkxAoYoY+l4SK6/3TzuBSJtr1TmkWp
	aNK23TQnbXph6TEZKokedtpzDLKKFVw9YjXDfcFFCf90Isc80Ag93wsBuX6E9sb5HCLYQEe5BKa
	ayeCKaf+/wrQ==
X-Google-Smtp-Source: AGHT+IGpN9v1EcQ6pUGv0/ADFBj6VB7V4djHe72YLpgDuXNgYHZwaOdWyf2CzcAfbqYS8D3JmbWdkQ==
X-Received: by 2002:a05:7022:619c:b0:119:e569:fb9d with SMTP id a92af1059eb24-11f35484a3emr12886397c88.12.1765925283458;
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm39814598c88.7.2025.12.16.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Date: Wed, 17 Dec 2025 06:47:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, 
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <aUHgy0jzZk-oSUuO@inochi.infowork>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <20251215221202-GYA1903981@gentoo.org>
 <20251216144845-GYC1903981@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144845-GYC1903981@gentoo.org>

On Tue, Dec 16, 2025 at 10:48:45PM +0800, Yixun Lan wrote:
> Hi
> 
> On 06:12 Tue 16 Dec     , Yixun Lan wrote:
> > Hi Inochi,
> > 
> > On 07:29 Mon 15 Dec     , Inochi Amaoto wrote:
> > > For build spacemit common clock driver as a module, the build
> > > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > > build will fail.
> > > 
> > > Add these missing hints, so the driver can be built as a module.
> > > 
> > > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > looks good, thanks
> > 
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > 
> On my second thought, since all functions only used in spacemit clock
> driver, how about using symbol namespaces? please refer the doc
> 
> https://www.kernel.org/doc/Documentation/kbuild/namespaces.rst
> 
> or check drivers/clk/meson/ for example..
> 
> -- 
> Yixun Lan (dlan)

Good to know, I will change this in the v2.

Regards,
Inochi
