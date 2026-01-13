Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32622A4FC
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304150; cv=none; b=aVEiVPMCbHsmVRabbL9xUP/VJmLHHgoChnWV9ap1O81/gc80bol/Oyj+SWhG3UQDdGJ4LOvV/vIrDK+QI4R6UxXJcrkG5Ht9kkB50ZtH2zX+pHtB4r2me9o64f6Vb6MwVbbfbcBWnba+nIPL1OTr8x3znhaaan/cTBYP3WLqzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304150; c=relaxed/simple;
	bh=GhniXQQx5pz3sodmRh6+sRp7+YRRsdoq4CZz9gmkCwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ4MLn3dK7L9P552IbgB449XVg+wm6ieA+JWLiuETC3af1gyAqjo9EUGI+ZbwmIKoCDfICp2w+sxxsshZnCxOPmLvsNikuDNZ5PwbSxlkCpElSutCv5PDr0nRrhNfoG8/cByaWIZcL63OSJ/f8mDmexVWhDWXK6nxOhyu6cQ+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVe0EU06; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BirJaMY5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVe0EU06";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BirJaMY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768304147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
	b=iVe0EU06JAsvJi8qz38TsZrHi7CUX4gHXRDoG25GnOWDxGKSVhKlVauFGnoO92JIq2ktMx
	ZusthU+Dz0pnciV24eaA+LbVXfAbSbrOSmua1fRRI4wUYUGwz2+RANPt4M0rO11Skdt+Wu
	felOXyrva3yRIYWEQ9nDi5Ml4lGnYTc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-OGvgw9eONZuMWoUUgWZofg-1; Tue, 13 Jan 2026 06:35:46 -0500
X-MC-Unique: OGvgw9eONZuMWoUUgWZofg-1
X-Mimecast-MFC-AGG-ID: OGvgw9eONZuMWoUUgWZofg_1768304146
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b991976so193883876d6.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768304146; x=1768908946; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
        b=BirJaMY5ov7zyLiIBWC0YbVy+ZcEGQDAMvV49OggzMuu+615z/nfkk6W44c1uN7MWn
         kBI45cFneoNTq5iEVizik3poC9BvCDKMFjKp6bYwMTdrcJXj8u+EeNGoiBUeUNsIFYYC
         IZEskGlruMO2gI1D0vCcAHO07AxDHqsLK1O+l0z6uiYBPkCuVtsIhn47nE6VrV0WNy5S
         1czwpvovQbX6nxtIst2xRHZboTne4R2NNojTeCxZEjYPHciq4QG0BV/dCirrh1oFviYe
         UpL034xtYCoEDsoGndG4p6C7UnnUf1PWDj4NbZNMIPXe0uzdq3HGKVlsLCjL2svSYP6O
         Oz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768304146; x=1768908946;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
        b=JQwmgLUEbz4XpJZoFM/xHhnuxj00AJs5sHwHMZFRWaVA1OHFT3CJZMgMH3h7COLBNX
         vxYUshMvswmbC6E0hKWX2Ox9y4zj+88UGUUh9Jnb181lSPmmom+BlSKqwV2peJHb6I6W
         G49/69QpPyt9sL8Bby2NcaHMFWoG1HP5I5IHTU4A2DVFaga7MwAAZet09QdvPKIKdNBB
         P/Uv2hTVka0BODsP3ud7XcDvaVBHQnFvVWMwjB3l8QDE638GirN0YJIalJcpARIDLgwQ
         UZsvsZ9XaMea+YARELDIkqKQIFSopUv/5W++1VULygB7T/r4RstIjYIfKcDPMBkZ6zK4
         kxQA==
X-Forwarded-Encrypted: i=1; AJvYcCVcJErseluKeZcUBTejTcDNvU6+WY1qIhmx1bKTEl9DEwffxTBp0flDmWkwBSXWxmnDzY9YZS5pnIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDYbBnVkTJvTcu2E0jXpqzc+eLYkEapB983zE9P44Y37t8mt2
	zriRShHC3d4PaxWun1T/tPKtiD8BMyezzl9vPr7XxEOYKnkWxw+QKIe3++r0+mrPdLH98xzio7O
	skeFugthfguJ0ngzwpB7SdLSK4W3KHlbz5rCgpYqWuHGTSsMdZiLreUxVoEQdjg==
X-Gm-Gg: AY/fxX5DfqQJrNpKFpyxlhc8z5kn43Lkcz1EB+A5fPhd7wviLCHXHvYbhLiWdMK1G1n
	czyjC4xC270be0SfDCnPqAubBaKKpyzB05AI6r4mDZAP/ru6G3ioDCEb7IC22zNKPPRhhJESb7F
	Niu9XZlTUPzicXyExSuK+tHvBW0TB79+zQwjPOy7nr1K+XdVUKA+qNQ7DnlEQf0jMV9ddqzYXBF
	3az4ctiQiadXYFQqgvh9UI5T1CWj97psI29yihboq5H97t4TtUR40K6zD3Wm8RDEqCM0trN51cO
	zuBxgytFrYq7T88cok4UDlP/lRs0nm5MAgfz7YbboU4K3GM9ebGuAgBN1+twU1/YOV/6K6Nttek
	WZJId6Lzc6Zxfb4hayt9LzDsFTivIJdD537ymvKPufz8s
X-Received: by 2002:a05:6214:d0f:b0:88a:2f7f:e936 with SMTP id 6a1803df08f44-89084185816mr347411196d6.2.1768304146019;
        Tue, 13 Jan 2026 03:35:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzo0uppLbk/PCtIlWD/jdmbPhxx6qOCx3tl4mcCeMJFRw6/FZUdNL++K5+FCupwRFrHnhjTA==
X-Received: by 2002:a05:6214:d0f:b0:88a:2f7f:e936 with SMTP id 6a1803df08f44-89084185816mr347410866d6.2.1768304145542;
        Tue, 13 Jan 2026 03:35:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2833sm149831326d6.18.2026.01.13.03.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:35:45 -0800 (PST)
Date: Tue, 13 Jan 2026 06:35:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 16/16] clk: microchip: core: allow driver to be
 compiled with COMPILE_TEST
Message-ID: <aWYuD6koAp_rDJ29@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
 <176828328795.4027.16644210192638742005@lazor>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176828328795.4027.16644210192638742005@lazor>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jan 12, 2026 at 10:48:07PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-01-12 15:48:10)
> > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> > index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
> > --- a/drivers/clk/microchip/Kconfig
> > +++ b/drivers/clk/microchip/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> >  config COMMON_CLK_PIC32
> > -       def_bool COMMON_CLK && MACH_PIC32
> > +       def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
> >  
> >  config MCHP_CLK_MPFS
> >         bool "Clk driver for PolarFire SoC"
> > diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> > index 891bec5fe1bedea826ff9c3bd4099c90e2528ff9..ce3a24e061d145934c84843008efadc3b0e2cffa 100644
> > --- a/drivers/clk/microchip/clk-core.c
> > +++ b/drivers/clk/microchip/clk-core.c
> > @@ -75,6 +75,7 @@
> >  /* SoC specific clock needed during SPLL clock rate switch */
> >  static struct clk_hw *pic32_sclk_hw;
> >  
> > +#ifdef CONFIG_MATCH_PIC32
> 
> CONFIG_MACH_PIC32?

Ugh... :/ This compiles on arm64 since nop is a valid assembly
instruction.

I'm going to hold off on posting a v3 for now unless there's an issue
with one of the earlier patches. This patch can't go in until all of
the other patches in this series land in Linus's tree.

Brian

