Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988D412C0D
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277787; cv=none; b=c/qaB6MNPIFD8us9HJ2hZ3bv77zB2fp3jXuq2htc89xmTv4dOmawZg9pvmvwbS8DU2Td2dpyphcfG9DSJWtOyLZG5j5gLlEYqJPitWh5OU4LxqIBDXmBP4KBBPlLE/zjRk3VjB7iduCBvL7lVOqrWpL6LKfrOLkHFMdRHZ4uYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277787; c=relaxed/simple;
	bh=qrXIRZFdJBniWCU8VJvuUKRMxq4CJ7LwdmKsYq3i5G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qszx6zSBgwMlL2b90Te+uscCKjoHqzHxSudSzSmcstsYuS7IGZJV8NWaJnJehKJZxqoorZ6b51n2ii+t61XteQ1m4kfaCouUIqnd+O6Sy/DfnCIJnohxwsBmophl5Or6eF+bAoTJxSy/AONtvcg1JL5rXJQbVCOsDvOF4u7KAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfAaCSYt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N95dKTlT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfAaCSYt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N95dKTlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790277783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ut0W8EJcCupEWBHDQXwLOk3ZkvjvxuM4fNB2BlLxpCg=;
	b=BfAaCSYt+ypmEcDP6K7LFM9dDDoLgZxXilv2ATIqCQjF99rviIifvMH47T4vQSKXOxlyMS
	D+uWuTqt7x7nRJF3rCGH6Febkcr8U1mwTXhnkUHAoSeHQD9geI9CTYlxLGQdw71DM++hRX
	BcT0KwRO4rcLlpd2Bp9v3KrZnYVo8JI=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-8J6rBrk-PLydH_fDxrFrTQ-1; Thu, 24 Sep 2026 15:23:02 -0400
X-MC-Unique: 8J6rBrk-PLydH_fDxrFrTQ-1
X-Mimecast-MFC-AGG-ID: 8J6rBrk-PLydH_fDxrFrTQ_1790277782
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66f8a19cf9cso296444d50.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790277782; x=1790882582; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ut0W8EJcCupEWBHDQXwLOk3ZkvjvxuM4fNB2BlLxpCg=;
        b=N95dKTlTwt4kKn+VRlK4TwqkQewnnzX0KN7QPYd2gw3V8cevdRK+p7NKmi3p/4/FZx
         VSSPSoCJ8ZsLIgA5U690GDE0Gdd4okUdZIf7/BhJo336SPTyDjbqhzam8+qK8sA3Wz/l
         2lDfGYsc7x62RmVSA24Xo/IXDCzYJ8OPLu+MIM+/YVD8n1h3ajv7d1pSzEsFviFIZgmi
         W5bdu3raO8RNsryX5maPPmI4RuNhsdbyAEpMsVJLToedCTbkkU615az9TD5EUa7ngrbZ
         4h4QPfCUFDTdUlnIrF1NMx5540z/K20wWW5mT3HWqo7jYHA5skzXdCV6AB1VOIaerNUW
         Mw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277782; x=1790882582;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut0W8EJcCupEWBHDQXwLOk3ZkvjvxuM4fNB2BlLxpCg=;
        b=j7UTEdIaXj/ST8N8dunubQXoV9CLp202FUDQzC7gf1uWtW3xtUxHaqehPR3GRi3XWO
         +QKjWKevr7JkmMA1AZH8WxCTaOa/XDJAgVD0c8qSEy+DgRpKD9l6EXwhzgIG/A6pK86P
         11zlFXTURfX9Z2S5TTZP1pXFIGsDENTrKtKr08LjGgYcWVchfJYaEhQ8GzAU5UOcSHjs
         mO67SHVZYuUNTnQJO9DxedzTZ+2Vh2yvbfobjWC2bOg8QxLUgSEywGGtNHT8MJ5JXL2W
         Pd8upw6MHx+ogpaBy4crAgIkw/MIUqMThfUYamkhuOt2wcP8xTXqA5X40Ye67W2mX9wE
         Lghg==
X-Forwarded-Encrypted: i=1; AKwUvBz4zkbD7zNcakrkDqGR8lb5yR16wm9ZOMvgpmJqxetAxydjmpCHfxO3qgEqEUZuNqM8zcTxtxRI6xw=@vger.kernel.org
X-Gm-Message-State: AFuF++macAZ31uFPEcYCFmYXCym0e8rJuggqTCMXJy0zzOizHK80wB6L
	mHT6KGBjiH77Kz5aVn67XSw7w9L/OFst4PZIrxm1PVbjYbeNkXW8nBri1InlmfZ7sI3Mey+YLXq
	3YH6NmcxOGMGjeAqKZZr/9jtLahVWQrsxo6kVBRhCzXvCHLhnR79FuJfB/GiNzA==
X-Gm-Gg: AYBFou1sh7XHBbzN+HQr+E45RyKiUGvFzask5kfk+QDmWJYMxuFYx9vQsPJH3GGbGrJ
	2pBx/r/HIdWFSMI8XIn4ZIzOikBAMrnzuPkggyxK27vBTN7bDoL8D8VzKctfYpYYeCrthWb8yBH
	Gw7oBZATdIumTlP2sJw9JCD7azKh0vh34RhJE5BBPRnbDfsX+GZY/kw0PAiO0DSOzI+DU3d/RN8
	MgxGVODDdoFUGyiuUh7Fo6zxIZ9PZIOlpWlJA1bV4TH7SDSruCO1g5skU6Bq1Ghoq+wL7TBIBAE
	xA+GcB9KM2hQMhJS77oCnGiD5RIZvSEALPlUti/lhaXdFK8q+7H/hpJWiCMYuLQQyRd3xJbb1g=
	=
X-Received: by 2002:a05:690e:bc2:b0:66f:c1bc:87db with SMTP id 956f58d0204a3-672ed2b90a5mr1641070d50.52.1790277781897;
        Thu, 24 Sep 2026 12:23:01 -0700 (PDT)
X-Received: by 2002:a05:690e:bc2:b0:66f:c1bc:87db with SMTP id 956f58d0204a3-672ed2b90a5mr1641049d50.52.1790277781356;
        Thu, 24 Sep 2026 12:23:01 -0700 (PDT)
Received: from redhat.com ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ef31df6sm26520d50.13.2026.09.24.12.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:23:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:22:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	p.zabel@pengutronix.de, daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
Message-ID: <arV4kYRFHM0rW8Km@redhat.com>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com>
 <arG238GS8bMB6DkW@redhat.com>
 <0785235b-de06-44d4-9068-ec706eeba848@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0785235b-de06-44d4-9068-ec706eeba848@riscstar.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Alex,

On Tue, Sep 22, 2026 at 08:33:37AM -0500, Alex Elder wrote:
> On 9/21/26 5:59 PM, Brian Masney wrote:
> > On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
> > > Define a new platform driver that manages clock and reset signals
> > > within the TC9564 SoC.  There are 21 clocks, which can only be
> > > enabled and disabled, as well as 13 reset signals.
> > > 
> > > Two registers manage the state of the clocks and two others manage
> > > the state of the resets.  The registers are accessed via a regmap
> > > supplied by a system controller, which coordinates access to a
> > > region of memory that will be shared with another driver.
> > > 
> > > Access to the memory region is provided via a BAR on a PCIe endpoint
> > > function embedded in the TC9564 SoC.  For that reason, neither the
> > > PCIe clock nor PCIe reset can be manipulated by this driver (they
> > > are assumed always on and deasserted, respectively).
> > > 
> > > Similarly, control is not available for the I2C clock and reset,
> > > because the PCIe subsystem on the TC9564 relies on I2C
> > > 
> > > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   MAINTAINERS              |   1 +
> > >   drivers/clk/Kconfig      |  11 ++
> > >   drivers/clk/Makefile     |   1 +
> > >   drivers/clk/clk-tc9564.c | 366 +++++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 379 insertions(+)
> > >   create mode 100644 drivers/clk/clk-tc9564.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 66d0e7e65adcb..39346a5cd9a7f 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -27675,6 +27675,7 @@ M:	Alex Elder <elder@kernel.org>
> > >   M:	Daniel Thompson <danielt@kernel.org>
> > >   S:	Maintained
> > >   F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> > > +F:	drivers/clk/clk-tc9564.c
> > >   F:	include/dt-bindings/clock/toshiba,tc9564.h
> > >   TOSHIBA TC9564 PCI DRIVER
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index f9592fd9ec2bb..50efa10d48450 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -292,6 +292,17 @@ config COMMON_CLK_S2MPS11
> > >   	  clock. These multi-function devices have two (S2MPS14) or three
> > >   	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
> > > +config COMMON_CLK_TC9564
> > > +	tristate "Toshiba TC9564 clock support"
> > > +	depends on TC9564_PCI
> > 
> > select RESET_CONTROLLER
> 
> Thank you.  The reset and clock drivers were previously separate
> and the reset only became available if RESET_CONTROLLER was enabled.
> Combining them means I need this.  I will add it.
> 
> I also need to select MFD_SYSCON to get syscon_node_to_regmap()
> (or perhaps something similar, depending on the answers to my
> questions about the proper way to define the syscon).
> > 
> > > +	default m
> > 
> > default n
> 
> This depends on TC9564_PCI, and if TC9564_PCI is enabled I would
> like this to (automatically) be available (at least as a module).
> 
> Why do you recommend "n"?

There is no existing 'default m' or 'default y' in the toplevel clk Kconfig.
How about this instead?

    depends on TC9564_PCI || COMPILE_TEST
    default TC9564_PCI

> > > +	help
> > > +	  This enables support for the clock and reset controller embedded
> > > +	  in the Toshiba TC9564 (and Qualcomm QPS615) SoC.  The state of
> > > +	  clock and reset lines is controlled by MMIO to a region managed
> > > +	  by a system controller; this ensures access to the region is
> > > +	  coordinated between this and other drivers.
> > 
> > Rather than 'other drivers', outline specifically which other drivers.
> 
> I was intentionally vague at this point because the one other driver
> has not yet gone out for upstream review for this iteration of the
> code.  But I do agree with you, so I'll change this to say:
> 
>    ... between this and the XGMAC (stmmac) driver.
> 
> Then it will be correct without modification once that driver goes
> out for review.  Is that better, or do you suggest something else?

Yes that sounds good.

> > > +static const struct tc9564_clock_init tc9564_clock_init[] = {
> > > +	TC9564_CLOCK_INIT0(MCU, 0),
> > > +	TC9564_CLOCK_INIT0(INTC, 4),
> > > +	/* TC9564_CLOCK_INIT0(PCIE, 9), */
> > > +	/* TC9564_CLOCK_INIT0(I2C, 12), */
> > 
> > A comment would be useful here to outline why these are commented out.
> > Is the PCIE one comment out because of what's outlined in the commit
> > message?
> 
> Yes, that is why.  We are downstream of PCIe, and PCIe in this
> case depends on I2C.  So we don't want to mess with these two
> clocks or their reset counterparts.
> 
> I only provide this for the benefit of documentation.  If someone
> happens to see bit 9 set in this register, it means the PCIe clock
> is enabled.
> 
> Anyway, others have suggested simply removing these comments.
> So I'll do what you suggest, but I'm interested to know whether
> you would favor just deleting them instead.

I also think to delete these comments. Would it make sense to include
the comment in just include/dt-bindings/clock/toshiba,tc9564.h ?

Brian

