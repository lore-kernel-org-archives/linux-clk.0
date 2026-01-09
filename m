Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45E2364043
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977108; cv=none; b=j+BOGzTANlgs7CgwXkHVLqu0SFLwR5v8mBb4+s+6lUhjdscYKK11N+lybRDv78o0dXiZKucN7Wb7+JpNVXTLVbN+xiazjM4+3FvqxVF0+h2VnLhg0XjpEoBeGDSkrnQVGClhK3i1HAQonaxRD8pTlVediqjBwkeDeyotNeF8hdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977108; c=relaxed/simple;
	bh=/WkJeX9SVl+NP6i/G2gXpvAGJ8Q/kdsTUTCLa7VTlXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfC6RmqmrPaEZ4xDUwjskxAnJgjGA3FCw/iArz8eS/Xv1R4EuwaFoSPs0pN2zdHxktIx7K1GZ/Xbu9gylQrp2xk0p+6z/Zc4OTFa9z6ZmlB/yR8ZMrqztJmSkU4kA58TmsILe3lwqw83Eubzc80VgcdNECQ/KaINPPxEBUScXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gE1auVHq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=toGDUd/a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gE1auVHq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="toGDUd/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767977105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1duzotOBj/YeFwe0pAdM8ORiHhNKNOy3JDRmC0bTNvg=;
	b=gE1auVHqwT2osFoFz0crtUywhI1JBbOdOYEGsllWjDuoqsR1Auqyk4uaWP9v6k+/NMoV/v
	FjoaiiUbPYpkuIA7VMwahU7sU8prX+Ui/bcXQSEpiANLdZjVL5YEeL++hmDxBLbjMcsxZg
	gljFZsEn+4iVf1Nr7SCP3HfaPhM1AB0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-WyJ02tg0MbWE-lilnTsh1g-1; Fri, 09 Jan 2026 11:45:04 -0500
X-MC-Unique: WyJ02tg0MbWE-lilnTsh1g-1
X-Mimecast-MFC-AGG-ID: WyJ02tg0MbWE-lilnTsh1g_1767977104
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0193a239so49893731cf.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767977104; x=1768581904; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1duzotOBj/YeFwe0pAdM8ORiHhNKNOy3JDRmC0bTNvg=;
        b=toGDUd/a9P3KJr13C7/dFibe/z7bqOC5xY+9x2+m/jrRJ5fovnHi+PO5ecyfRiLeMA
         MlcGPVAvXcVYE+ETSoCUg6mQ77W6uQ2vQF13zl/DVm3cOnnPa4jnjdLUwDh9gZcvuggm
         g19f9UbqLn2UJnvo02BHekZCOdgaG1Qx5/R1E0W6KwhtFtqL8E+w2yUBhBQEdvSvI58E
         h6ldDNFAwfErKd+iIDu0b06Mwb++t9Brs4ZJKQ74Cjp5FmozAfKKzK6WD12CqfQWd5Wt
         DXf5jVFMvJ38CFIoSZnCfhqLaPJ1qBL+ffNqTm73s/ZHzZrOgahjIQ1OmXacLFXLu6jd
         j8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977104; x=1768581904;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1duzotOBj/YeFwe0pAdM8ORiHhNKNOy3JDRmC0bTNvg=;
        b=KHCYDS/TN/XWnLYw9UKnPGhWV67wmf0mj3u0crwiFKb9gmG1A1xeSP1Hq1ES/heIJg
         uW2gVIkH14RxEQMijgc8R1BqlR4dlq13H85E/7liJ3OIO8ew27yEXoSHljoIGiLe6A4K
         4eR3W1usqlogjdt5DuUoOuO0d8h4JSAkdy80hwVVSbMnriEhn2bSVf0AwR8f9DKwtbJk
         DW75UaJey2KRPA33+ED6lAuJVolsITRgLdkyXLqAGt/YJmxZjl0LFqekmwPXAIVRtczy
         bHJ/0TpOWzepV0o5IIcerF0uCe9s9BT3VECWAbDf+Bh6KPnuxM8q73DK6Ztb76IWCh1B
         OH7g==
X-Forwarded-Encrypted: i=1; AJvYcCV3d3kCCuAiDoI4ZaN3wf1N5oF1aHkXP7Q2uu6L2YP0sX+1saPcla/ip/VqJ+szsVwSGS7DEw3TsIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytTHxlmz0ZZWti6qb7iyN+dlGGPFyvhOUx08U7qYYLLeTUQPl8
	InH8JMhZOFBeAazfdvctFT9dli10H+DbETb8j78caI+K7eHwqcPeb2nbIQdjHtcg/uxoCYkccJI
	duwazPLc9JFm9ADW2Gdt6yviO3B+Cn1rUmBBLe824tmCypUXWZyzPVRgoCc2Yvw==
X-Gm-Gg: AY/fxX5bXhHBkAjIVg/K4B44NIzG9uutBU9vnFiOssTovx1t7JORSJ9gl4Sq6kw2Ruh
	uDatr4gkmR11qmGiM5gzK9hT0+XilAoMcpFTYayO3GbAjnnJjKSiiVhkRKZhrPl6Z7x873xoJxV
	mBlZ0Ueiwb3wVHZJF3jUAMg08yR+To8A3QqN38Z4q5tsIdiLf5E46GigRRwZx4jmCCYNA7APXYP
	AChCYj9rL/ZHiYXs6traKbg5vlMXHM16KKEr7PtpEctjpTBJuzwlBjqwlba98Jo3sh2dJxVrASm
	BjZSPbrBIelsV6/RFZ/9oJK4XNuswsr6JHjMbsM6lX/B7tDpb2jbfQXnVZTu3ICAe1eH5aOghCw
	RlgzgHs4nE9lu3IRoUV0dU0o5BhcA2+lmpVhZpwpJ0dzD
X-Received: by 2002:ac8:5a93:0:b0:4ee:11bc:bc9c with SMTP id d75a77b69052e-4ffb4aee463mr160860861cf.74.1767977103999;
        Fri, 09 Jan 2026 08:45:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcqCRlAPdfWfvpxn6C31ilq+I8GiGAi5O2yYAnwoutJB6LcATzWK606rwaEJXqkrVxVT+flw==
X-Received: by 2002:ac8:5a93:0:b0:4ee:11bc:bc9c with SMTP id d75a77b69052e-4ffb4aee463mr160860481cf.74.1767977103575;
        Fri, 09 Jan 2026 08:45:03 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffc5f80d00sm27362811cf.11.2026.01.09.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:45:03 -0800 (PST)
Date: Fri, 9 Jan 2026 11:45:01 -0500
From: Brian Masney <bmasney@redhat.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
Message-ID: <aWEwjWHmxWQsxak3@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <aWA6rNLNqYfJKTzf@redhat.com>
 <baaaccab-3ac8-47ed-b4c5-13401d08228f@tuxon.dev>
 <CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 06:30:32AM -0500, Brian Masney wrote:
> On Fri, Jan 9, 2026 at 2:16 AM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
> > On 1/9/26 01:15, Brian Masney wrote:
> > > On Fri, Dec 05, 2025 at 02:46:26PM -0500, Brian Masney wrote:
> > >> Here's a series that fixes an issue with my round_rate conversion on
> > >> this PIC32 driver, fixes a minor bug, and allows building this driver
> > >> on other architectures with COMPILE_TEST enabled.
> > >>
> > >> Changes in v3:
> > >> - Mock out cpu_nop5() in the case of COMPILE_TEST
> > >> - Don't return -EINVAL in *_get_parent()
> > >> - Link to v2: https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com
> > >>
> > >> Changes in v2:
> > >> - Add new patch to drop unused asm/traps.h
> > >> - Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com
> > >>
> > >> Signed-off-by: Brian Masney <bmasney@redhat.com>
> > >> ---
> > >> Brian Masney (4):
> > >>        clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
> > >>        clk: microchip: core: correct return value on *_get_parent()
> > >>        clk: microchip: core: remove unused include asm/traps.h
> > >>        clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> > >
> > > Stephen: Can you just pick up the first 3 patches in this series? Let's
> > > drop patch 4 for now. I'm going to send to the MIPS maintainers a patch
> > > to move arch/mips/include/asm/mach-pic32/pic32.h to
> > > include/linux/platform_data, and update all of the drivers to use that
> > > new header.
> >
> > I'm going to take those though clk-microchip tree if that's good for everybody.
> 
> Sounds good. Thanks!
> 
> I'll CC you on the MIPS changes to move the header file.

I posted a series to linux-mips to move the header file. It includes
a variation of patch 4 from this series that enables COMPILE_TEST for
this driver.

https://lore.kernel.org/linux-mips/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com/T/#t

Brian

