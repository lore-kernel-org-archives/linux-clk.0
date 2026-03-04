Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECA390CBD
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611723; cv=none; b=mSMf66ej83+7BthsA4Sdfv5dZlW2YRs+38/QsksXYAVwg0Zdf/ALAwW7NGE97yYB1MENTMpq59mVzzrbrvAlyUeXrAgTjZWZog5DctsHxtGtiyBePrS10FOF5C0i8gkvwcHXoyOonJvu/PcvNG7yunv1yj8Q8aqx3VSvLm6LjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611723; c=relaxed/simple;
	bh=SCl11TbcKKgrDpz8AOKo3E9AzwfTwHh0/Z5vfzDPinw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpdMnIbdjNN51B3/D/2pkjvnKJ2CTUigvk8WCuiEufVYgsJbsA08zrEjZxE7KzP2Gl66Rqn0bqWNIMr8yfpLVluvZfdLUvYxPlre7o5FEA8c8o/IpcxhDet9MLSTyT5LDFfJNUQsq55lO4QHkOXCnfnrK7p0dIRiP2WDFyPI9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgMJc9/v; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgMJc9/v"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3597fea200dso2617854a91.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611715; x=1773216515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=;
        b=KgMJc9/v7e8TyF0l45KxWaYpiGQiHHdHaHh99F+sQOVf7pnj0jMqVkxoryAXv4vup4
         XQJheuqy6Bxicnv+xPE75cY/aZ5VIUGTBYLsN1yQwwimsf0Pa6A4bFkAy5bPdTvpUoMo
         qssc5eEPe6UlxisuAkkqhdbFA5RRP11tMk5dw6pFiyS+mOg4Dqxsaq9t7SXFgio+jYmX
         qGbcWQ+qNAicdFeo9FE6D3S97FcwyfH2x2VRTAa+F/Kxooe3FWp4A9cp47WLmDPdoGLl
         oPOxqY98YA42YhCUFlG6EDYiJBQTpHuwVjCs2A9vjNo9BeakWAoQ75r/m4a1BovurIJf
         jDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611715; x=1773216515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=;
        b=GYiw2cdp3KbAUJBSzvOPVJ7Din7nUDTlBO1d76O/FmMlRzOB0hnu85Wu5zxab47Qjh
         2L08KiY5uqOcDa5FAN2mDebpa2QMEYgp2H/43kPA2id41swgFJdAmApryg7Q9eQjoXTp
         tckM41eeHiZERHAqfzKGr3V2X21P2j0pdwhmgL5rFqRH+VXoafJbAzpEgulAOERizmxe
         aqxZVAR/pHZxa2f2ARGTNiaBCxkvd06TpFjbHKoxSK+A0hyRTpsgUym+CWCXF46P1w1L
         Tl2CahB+OM97h06kijCq+/gY+AJd0UFWX0J+2n1B73W8Tgfc65aYCz3Zz7cHfT8rIg0l
         AO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsdmXXoNq5+b+LesFXEDXd0CDzRmbWIN1r5ibah1sQ9HtwWUxBXc15EfkimZnRZ38xSz3Dme8DaUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9FRpUpdlGZYQvo8SDV3mTzXb2LIXTaRlg9d3v1+HJ0zynhezE
	VhJkd+J58BYUW1m0qt5vWMuTNODXLcPV3EgCTdQqRTrsd++1gPZ8yZg7
X-Gm-Gg: ATEYQzy4P+Lfx38etfZ2v42cvGbtRvI3V/N7qowysP2P/XN738wnXV9+44zRf+NJlZ5
	RPoy/kfRqxnvxm3k1gf/98diIn8yZUqmF6kLA3YJ7kBCuzdwfHTH40045/KS1It3Tr5cbRQqZf9
	6khbC3hLUUGCPJISzXJ99xVtJAO/sflQGBz1SHnRfGu/fgMb3z/2I0f0XASUZxHXFkDbFavgvm5
	+j7rr0zpXRz2bJIxDS4jEhrO/1/JRJ2H3Bdspgj0DcBft04rajSYV1NPcxjq8VWiT9IeRhYOdZ1
	bbP7fNVgykXktFzv0MfYzOYeboCOgAblzdRTURvDsp4412ZqYHIAj9yLn2e6SKnorHoQwZSuaNU
	Q15wOUmrzaMma87y2t0LPZDS/YdFeFcq3Sj6hipQeZ56tN4dx98i64QDj6oPd3u5tVRAHmQ1Aq9
	j+gB/t5XRwtDZYbpbdpRbOCVxRZpL/h9+dYTL6TlA=
X-Received: by 2002:a17:90b:2fc8:b0:359:8e1c:542 with SMTP id 98e67ed59e1d1-359a6a3c1ddmr1261053a91.18.1772611715477;
        Wed, 04 Mar 2026 00:08:35 -0800 (PST)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm4504552a91.16.2026.03.04.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:08:35 -0800 (PST)
Date: Wed, 4 Mar 2026 12:08:25 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <aafoedMHhKNuEwFE@DESKTOP-TIT0J8O.localdomain>
References: <20260303190948.694783-8-cjd@cjdns.fr>
 <20260303213723.GA4075286@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303213723.GA4075286@bhelgaas>

On Tue, Mar 03, 2026 at 03:37:23PM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 03, 2026 at 07:09:47PM +0000, Caleb James DeLisle wrote:
> > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > registers unconditionally. If the registers are hardwired to zero
> > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > gets created.
> > 
> > pci_read_bridge_windows() already detects unsupported windows by
> > testing register writability and sets io_window/pref_window flags
> > accordingly. Check these flags at the start of pci_read_bridge_io()
> > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > window is not supported.
> 
> BTW, I'm still interested in the details of how we got here.  It
> shouldn't be too unusual to have a bridge without an I/O window or
> maybe even without a prefetchable (64-bit) memory window.
> 
Hi Bjorn,

I'm fairly new to the PCI subsystem, so please correct me if
any of my understanding below is wrong.

Regarding the I/O window check: I only hit the issue with the
prefetchable window. The I/O window check was added per your
suggestion in our earlier discussion, since the same logic
applies. Neither downstream device (MT7603, MT7663) has I/O
BARs, so I haven't been able to test that path.

The EN7528 SoC's PCIe bridge does not implement the optional
prefetchable memory window , the registers are hardwired to
zero. The downstream device (MT7663 WiFi) has 64-bit
prefetchable BARs.

The problem is that pci_read_bridge_bases() reads these
registers without checking pref_window. With both base and
limit hardwired to zero, base(0) <= limit(0) evaluates true,
creating a bogus [mem 0x00000000-0x000fffff pref] window.
This makes the allocator believe the bridge has a prefetch
window and route the prefetchable BARs through it. But since
the hardware can't actually forward through this non-existent
window, the device becomes unreachable.

This patch skips the register read when pref_window is not
set, so no bogus resource is created, and the allocator
correctly falls back to the non-prefetchable MMIO window.

As to why this hasn't surfaced before , I'm not sure. It may
depend on whether pci_read_bridge_bases() gets called on a
given platform and whether the downstream devices have
prefetchable BARs. But I don't have enough experience with
other platforms to say for certain.

Reagrds,
Ahmed Naseef

> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > ---
> >  drivers/pci/probe.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..4eacb741b4ec 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
> >  	unsigned long io_mask, io_granularity, base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->io_window)
> > +		return;
> > +
> >  	io_mask = PCI_IO_RANGE_MASK;
> >  	io_granularity = 0x1000;
> >  	if (dev->io_window_1k) {
> > @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
> >  	pci_bus_addr_t base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->pref_window)
> > +		return;
> > +
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
> >  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> > -- 
> > 2.39.5
> > 
