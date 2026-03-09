Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1033B96A
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090967; cv=none; b=ik9pFxDu9ChsPDaUbCdpV/iRaKnNXc7M+IKdkQbvZGzJRYMlrBh/X5uZqfkd6HunG44L1amn90G1HpFp4xF3yVoVaovCk2YLfWwyOfhr/q33bEdlJjH/Og3+PW2LYN9BOjcvGuZIrEJiPEAQCOif+Yt0rWQnMr5yV7RF2y+Jcz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090967; c=relaxed/simple;
	bh=9mXjXVVxTe1P3tuZMnUde/SL8ghtHGQeRE1ObEba6ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaG/53w/Brb2yp7lGfHIDms4AKLpCG7mqBzGTo4UKPGZH8u4rXbwJR02iz2esANL4Uzb8g+y0krouahKYT1HbPhh7iL3l4ea+Mv0BWJ2cB+2NoJ+o0TXz0xrariWvlJxDU5QtYqqjVQzpl5FGqK0bYhihqF17IHDw1urKJk8DY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Au+7B/Ah; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJYvtcTQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Au+7B/Ah";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJYvtcTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773090964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQL1VhgKHAA+ngckVrAOEKHHkR+ETQSpB8jOYFzaBGc=;
	b=Au+7B/AhHSXIpO+R1vGP/OE/ykpX3CVW4rSCKdJZVCibkzAU/5TcTsao6VXGZHO0QPkFsc
	v/e1ouwE93nx6dgFfCRLo7fz1/gdfyE0d0Lt/UssDb0TtUTWAjxu+69OU6g2HXvEBfaAtC
	O2JXhOACdRZs5iIu/7Dp/newwEBC5jg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-1ZFSafgbP0y5nrUxA369Jw-1; Mon, 09 Mar 2026 17:16:02 -0400
X-MC-Unique: 1ZFSafgbP0y5nrUxA369Jw-1
X-Mimecast-MFC-AGG-ID: 1ZFSafgbP0y5nrUxA369Jw_1773090962
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a08e6cd15so498856826d6.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773090962; x=1773695762; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQL1VhgKHAA+ngckVrAOEKHHkR+ETQSpB8jOYFzaBGc=;
        b=cJYvtcTQnTGrI68peTgCWFaOMMU8EQjk736JFyG/4UaLWSZmsXc+f/JlVmb8iTh1BI
         59wBq+PEVmAtvVMkUkmOkAc933vS8H+iIdywxeO4a/oMifaqWEm0fAlPu5SsfCQ1JfMu
         S7M0KvXO+lqjCxgZVZRvhUbmWwCTjc0iJNCaAkHtqJf4UYEKNeLEzu9fV2CyhgPwGOu2
         uLkJaOoChFTGF8VCUz6TIyrp6DOug54li+D5x4rl43Vbvif6YKWV+WIeyUg7q0/i1Hdl
         Pxh6HuaTWaxoGhbtkllw6Ln8dKn90vj0XW9MFyfcgeLzxyaDp7PZ/awbrVPSzeQ8zpKS
         MzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090962; x=1773695762;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQL1VhgKHAA+ngckVrAOEKHHkR+ETQSpB8jOYFzaBGc=;
        b=rK80CRueqjHGe1CXk/9ju/vAZieeX/g2ZzwP9UxiLVdWNeiEnRozda6BS17L876KjW
         dbHynVmRoBZf6nNr+sCmdAtT4vs2lfx1GQDG4HBME8gjosa4JDtSQPhBCKHzew56Mrwd
         IRkmTGaRD7Or9mwleTtDNWlBDYvcFHAcwgUu0wfLgo2UPKQxsE4zguu/n1vBa+UTvthi
         ujuEadM6l+aNj4eYw6F4zOmxK5ApnSVfyuThmz7sNIPIF/n+MdQA3o5NUNsnUacmkmWS
         n0zrFsM0owxGMpluwpQb4xEGcwlEukSiLODHCAvkHwVoUl8IhBmq2aOJKzoSV7uuYlkX
         GdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+4CKCxgma4MWrwpS4UMNlQHBio3Az9u4EED0aV+C5f8FX+6Y8h7VjT1j3cVRT8Cg+m6mcpWsEW6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98WTJ+fz+GWnaYDfH27otj8B1Zu1CS4CtSnEh4pbwD4mBPbuQ
	KoDrFdxU5g3EeGz67evW8MY7gNumR2KolncShbMQeZGKLHyXy6x8cyfUoac3sIHSRU06fkQp+E8
	B8j9OqqxscQkx9hTzuygOGOykVNBcnUIB4/eYeOk+YbHtZARcQw3f4zPQ/M5Uag==
X-Gm-Gg: ATEYQzwuZdM43GcnN5BXMArG4RtgIfSyLjg+Hqg60rtETKbr+klTUx7JuRluKoq/QEX
	FFkOqj9cS+eahHNkiOzOwnSoUKLys9LC7zzRnwD9UxjZRGAz+jawH4fN6i+u3oi8PXVXjMnB5fb
	yhkbjEWze0afcSBaUEZyGfs/zlt3H/XwSeJYLg4D0rhBd1rp+8NXZzWUVKr1I/F0zgHdJplFWG3
	oD9DmH72b9n52a4Capz1lR3FvdhtBfwoLQTACVR1ClbmUpI1/ODvkvxxORIBaSH7DtWs/jlSWIQ
	G1azNAgGfnP52O1caVNS5qXR86EMUvXAjXkgU7JAEXGxEJ/dUmkrZLZFNHVD3eAL4goB53BfcKq
	FBIgsycqddqD+Lt0rIU0hxwrniJRq0Siu1zXXcx/CCYHS3+v3yZfJB1tI
X-Received: by 2002:a05:6214:c68:b0:899:eff6:6e73 with SMTP id 6a1803df08f44-89a30a1e8d1mr193817736d6.7.1773090962414;
        Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
X-Received: by 2002:a05:6214:c68:b0:899:eff6:6e73 with SMTP id 6a1803df08f44-89a30a1e8d1mr193817286d6.7.1773090962011;
        Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18140sm6725596d6.3.2026.03.09.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:16:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:15:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aa84jv9NkZnTgSLi@redhat.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
 <aa8pVqupeZr67bEd@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8pVqupeZr67bEd@x1>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Mar 09, 2026 at 01:11:02PM -0700, Drew Fustini wrote:
> On Fri, Mar 06, 2026 at 11:12:19AM -0600, Anirudh Srinivasan wrote:
> > Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> > of the driver covers clocks from RCPU subsystem.
> > 
> > 5 types of clocks generated by this controller: PLLs (PLLs
> > with bypass functionality and an additional Gate clk at output), Shared
> > Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> > Dividers and Gates. All clocks are implemented using custom clk ops and
> > use the regmap interface associated with the syscon. All clocks are derived
> > from a 24 Mhz oscillator.
> > 
> > The reset controller is also setup as an auxiliary device of the clock
> > controller.
> > 
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  MAINTAINERS                             |   1 +
> >  drivers/clk/Kconfig                     |   1 +
> >  drivers/clk/Makefile                    |   1 +
> >  drivers/clk/tenstorrent/Kconfig         |  14 +
> >  drivers/clk/tenstorrent/Makefile        |   3 +
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 870 ++++++++++++++++++++++++++++++++
> >  6 files changed, 890 insertions(+)
> 
> Hi Stephen, does it make sense for me to create clk branches [1] in the
> tenstorrent repo on kernel.org for Atlantis patches to go through?

I am not Stephen, but that's the approach that all of the other SoC
vendors use for the clk subsystem, so I would say yes.

Brian

