Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A963081CB
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819463; cv=none; b=au2XvdzefheO5v2rGluWab0zSBZ6NFFuddyCL2ZWnGan5eBE8bYd73puT3ovf8rMl53fRykl62Q4p1G3vDVQF3+aqawWNTCODQ8xw+BqfMMhaJ3n8I4cp+bJevz2t581j3oqWv5kDdIhnk8yH0ibHDjbUifcQDESW+n+SpheQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819463; c=relaxed/simple;
	bh=OH2KPRJdRKeC88rqgAwfnEjC2ko5FrnD5JbjS71ojBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivmOI9cOH+gBuqhCgswnlCYUWrWp+HAgOCtPss6lZaCIEHCVAJEx3TTse8yseYErncNK8cM2FDOXuIltY6NF/CiGTBBjQOOriRZGJVewqjVI73wJwOAWkHH7WNHpXH5PUpqBeVAYD2msgxK2YGZaw9cvlHrhdD48FRRL6As7030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3mFPCMw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3mFPCMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756819460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
	b=A3mFPCMwMMlT2R5+LSlhtM0I3jJ+M0HwqeeYbo+K72HiPx7iInnaZnhhQAnLK4NqTDhfd9
	vxFhvty47BvGd0JXKerENTam3LnwruWD7grlv5O1W9Aq9J0TGbYSU5RLBoewCClMCNZjIB
	DPTO8obfQK8HglfnRH0Uci3wQ8j7ByE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-fMreodqYNrGTCNR2f8egiA-1; Tue, 02 Sep 2025 09:24:19 -0400
X-MC-Unique: fMreodqYNrGTCNR2f8egiA-1
X-Mimecast-MFC-AGG-ID: fMreodqYNrGTCNR2f8egiA_1756819459
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ddadde46bso93059686d6.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819457; x=1757424257;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
        b=PIbi/rt+HUr20l8zYVdo2hE1CEShaWzuAQr320kwIcsSSnijmTs/jcP/xsAmMEuWQF
         Tz5GvaiqWLoD+/8/9DCQ+DAkItQo0AT0UX2FzgIRh4ZsEQgP3owBzg9phJm++rvcvUCu
         svXVnygSpjO7uX8ooWIbdeloUfkLg1ZNsoYC/ACUOddXzajfkvrf11l5RWXu/UwvoV3f
         sTPUnSck3z6sBIULuoLrgc6kBJHDPYlVXYejK4hssK85iVJIx4UDQYtg+6y6E8t4Y4dd
         hnmZuiGh8jO+gILYwL6L5xU+U7JGwaeG6mvZHyh6kAq2ieQmV7DznTlz0F7amPvN7wWu
         NbTw==
X-Forwarded-Encrypted: i=1; AJvYcCVdJqLxAUjH77/WN7JS18opumhKzsRjSdWnJOXIl0y4iNLD9I6uCfQFJiNtCZ14AVxz/gIW3ybnCgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydF5P7kU7QOqyFBC//30bWkr6BEv59akbnvTJeIx6S1xro/Fu1
	fw0IK24+c0jej4hj6NSd4tX+nR2PdrsWnGZxC/fe61IwUuYLg+wKNZQeQwl4zi7WpTQ9P7GQhRs
	3WDK/7VpmHgUNXjpjk12SgcejiWwHr1JjO+rAIjlKKBtiejHFHixzoc6fpJAkEA==
X-Gm-Gg: ASbGncsagCFADf2fbKUtFBBRpOAJ7V2f7Hcak9nSGrrGLowQQZxuY142w7TWKX+W8ox
	8EIY/obi3MSvExRoe0f1RS9b7KGkANRVjsKrlFinq5DScZu43V3EZX5HeT0+CH+mQe3BPFCvC45
	aaghYY+AdYWG4aMbh8PNmQvHk6hm1958Fw8zwQ1ScIX0GlaSCZx2frx9VXRfAE1haO6k06dCzha
	hgycB7avakmEjbS7zB2GyY6P1I2+K/6UIJI+Ab4ZCfzFXPN/o2Lhwj57oZXSPdVEH3pSB6/OXXQ
	uHutafD0XDBY7kJBOx5koG1pWjmvTojIPy3wziQIE/b3rGnXmOY2h+4c4sE=
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45372506d6.12.1756819456917;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2gpj5sDjHqMalc6nLErCXydSa307HuH4gEcNe0djbjrEuBMYzkPHUoJgDAmOWEyhdUzjogg==
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45371836d6.12.1756819456245;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
Received: from x1 ([2600:382:7727:a6e4:b49a:a295:b546:7faf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720acdff0dbsm11654266d6.18.2025.09.02.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:24:15 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:24:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com,
	sboyd@kernel.org, geert+renesas@glider.be, linux@armlinux.org.uk,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aLbv_FmJV8xV8hpR@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
 <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Geert,

On Mon, Sep 01, 2025 at 11:46:34AM +0200, Geert Uytterhoeven wrote:
> On Tue, 26 Aug 2025 at 13:52, Brian Masney <bmasney@redhat.com> wrote:
> > On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> > > On 8/25/25 20:05, Brian Masney wrote:
> > > > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > This series disables clocks that remain unused after resume.
> > > > > This is necessary when the resume process is done with the help of the
> > > > > bootloader, as the bootloader enables various clocks when returning from
> > > > > resume.
> > > > >
> > > > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > > >
> > > > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > > >
> > > > Do you think that other boards would also benefit from this change? If
> > > > so, what do you think about putting the call to register_pm_notifier()
> > > > inside an __init block in clk.c so that this same change doesn't have to
> > > > be implemented across various clk drivers?
> > >
> > > Yes, that was my other approach I was thinking about. I wanted to see how
> > > other people consider this version.
> > >
> > > > Alternatively, if this is board specific, could this be fixed in the
> > > > boot loader so that the clock that's not used by Linus is properly shut
> > > > down on resume?
> > >
> > > As a result of your request I did some more investigations on my side, I can
> > > say that, yes, in theory that could be also handled by bootloader.
> > >
> > > I can drop this and try to do it in bootloader, if any. Please let me know
> > > if you still consider this (or the variant that implements it in a generic
> > > way) necessary.
> >
> > Personally I would go the route of fixing this in the bootloader for
> > this particular platform.
> >
> > If this issue affects other platforms, particularly across multiple
> > SoC vendors, then I think it would be worthwhile to have a discussion
> > about adding this functionality to the clk core.
> 
> How would the bootloader know which clocks are not used by Linux?
> And why to offload this to the bootloader for resume, but not for boot?

If the bootloader is involved with resume, then I assume that it's also
involved with suspend as well? If so, could the boot loader save the
state of the 3 clocks on suspend, and set them back to that same state
on resume?

How widespread is this issue? Does it just affect this board, or is it
common across other boards?

There are some longstanding issues with clk_disable_unused that Stephen
talked about at Linux Plumbers almost two years ago [1]. We'll have to
wait to hear back from him, however I suspect he may be reluctant to
expand the scope of clk_disable_unused even further given the existing
issues.

[1] https://www.youtube.com/watch?v=tXYzM8yLIQA

Brian

