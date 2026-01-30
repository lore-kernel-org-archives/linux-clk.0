Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915D32936B
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786084; cv=none; b=ZZCu3c1w1VTWL1noExEslk8DqMZOKQTYzZmlAj2ui6eiNEjMa2yklQA6JN3QaFBzmb54kEBgXM9/bLTapmdHOvntLGDGWQCcSpQ52+yPsyvKi9qy5mPksc0+kKOmuIz2p9gWwKrl0p+Id6XV75FcIWt6000jYF4/iZ+P0iOdxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786084; c=relaxed/simple;
	bh=ixVqgiNKWlgJlcIKmTWTDEQrvH4ksjQzpSZ+bGRd1qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHZh+QSQ7lm/TN1nyBfbUOueoPsmv8M3vhwbtda/3uAJLz/t+eJx/JOMwBHKIJbpANHhSDnyNI0gQr2teWO6Zj83FiBs7/S1zeb4fI7vqM1ZQWnfSo2mG2sfpyGLUMcaIga5v/6w1WOXLxbR7o4E9JHVQ6fdiV98W7floQzOX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c6a7638f42so311339285a.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786082; x=1770390882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGkx6eA6mbqfFwtrPFINFpkOa49uJ1Td/6euugAjzpQ=;
        b=ttZh98njkOBA3oLtjo4lWZml/w2ssHbDKELB0wD7RDWgm/c7mvO/e6nlonbNwheFzQ
         CX+Mm8kUMg7/erGFTwo9IJoL0apFPRiN4Kuo9Qbo10jvXIZtJ9U1PyEQzkEwaCS2aFJL
         /0A/GsDBrW//3bMSO/sQb2cCUbbxxXmKHrQzV9RIgASBENqoYeW1mpnI4Ma+iKJtaXFy
         lj6K79VZCzlQ1FJ/gf0pvvWL/3adxYZzMSMRAGYzxDaej3Mkc5OAMkpgZAivxTlaersI
         9KY7RUrgdoKIxpaRLs5Ib5QSmDRPjYTkQcsj+OQu7sXZGi2g9ZiTVZ4LAA8ZFuN9H610
         2Jvw==
X-Forwarded-Encrypted: i=1; AJvYcCW3hC2FrAOb7dgyC3nn6wAO3nZztZ9QFZ+Z6YSJ2FIsKGHGnDGQzaziEff8pQmDkXuUPQZTMTxU9CU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5kLvDjv4kk98NwJ4dHSP4z0SKUuJf3RMtuPix0Msylvz+zKpt
	v0fAfoFfCYJ3sII4SeNU5JcwyNg0pchNDeD4W5tdB9ICVQ+F1cmF/R9KCYat6l6Bwzs=
X-Gm-Gg: AZuq6aKNkSX5lnhlu0hHXFtAPUv9QvsOg+pb8QWvtqXTku678Yve0iheeJ8NMpEahVa
	1NBgG8PG0s7/nQF5YvRpNlvPRb8qGaxfPGGuCyYMKpwI/DxwNBb+ikg9HlrknU2JmJ2XdO1Pynz
	J14h69HUzBOYuhCyBjX6qfS/Fg7EIS2KnWWOpFXs017Z+cUEdXRTj23Ty9L6XRJmOqHDjOWDYcp
	DREJVua4+XObyDtNraXVhdLKxNNN2mZ/O4272Oa+RR6O+sbN2BvLA6rHqRTn6wXXCCFaUxL4sYN
	cDPfFMtmQeDyEESqm0nQnsw1JPjqFwg66L1pCkgSYxCFE74F1kjGcudq5OScP7cwGsNBzFtsUwn
	UV2N6tMYQMffr3+5VTVpRTr+y9m5TuX7ucnheMDi3o8AZ8Ty51ZAxJkJ/kCLJ4Ip1ktIMTg2z8s
	At9q/WMLdxI74auZ27/50q1mCDb+ce3rdVN/qawPj0PSDfKw/40FOg
X-Received: by 2002:a05:620a:7103:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8c9eb2d3d49mr428454885a.41.1769786081159;
        Fri, 30 Jan 2026 07:14:41 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b8ec20sm616140185a.19.2026.01.30.07.14.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 07:14:40 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c9f6b78ca4so59484685a.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJZbBX+/3nSNze1XmkxlfjlepJJevkSMgdLo2KErS/BwTNbG6O9N4g8uYFyVmlIqDTcc1/T9Xmu0Q=@vger.kernel.org
X-Received: by 2002:a05:6102:a4b:b0:5f5:7723:28ee with SMTP id
 ada2fe7eead31-5f8e249d107mr1020998137.11.1769785707020; Fri, 30 Jan 2026
 07:08:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-11-john.madieu.xa@bp.renesas.com> <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
In-Reply-To: <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 16:08:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
X-Gm-Features: AZwV_Qjr2oO3yVh97tvIdXRZ_5OwPpjHqcx_MNr99RIUg39FgQPjshWvCCZ7iVo
Message-ID: <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, claudiu.beznea.uj@bp.renesas.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Jan 2026 at 14:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 1/29/26 23:41, John Madieu wrote:
> > Program the class code register explicitly during PCIe configuration
> > initialization. RZ/G3E requires this register to be set, while RZ/G3S
> > has these values as hardware defaults.
> >
> > This configuration is harmless for RZ/G3S where these match the hardware
> > defaults, and necessary for RZ/G3E to properly identify the device as a
> > PCI bridge.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1054,6 +1054,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
> >   static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
> >   {
> >       struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> > +     u32 mask = GENMASK(31, 8);
> >       struct resource_entry *ft;
> >       struct resource *bus;
> >       u8 subordinate_bus;
> > @@ -1077,6 +1078,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
> >       writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
> >       writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
> >
> > +     /*
> > +      * Explicitly program class code. RZ/G3E requires this configuration.
> > +      * Harmless for RZ/G3S where this matches the hardware default.
> > +      */
> > +     rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> > +                            FIELD_PREP(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
>
> According to kernel test robot report on v1 this throws a compilation warning:

Yeah, in case of a non-const mask, you must use field_prep() instead.

> https://lore.kernel.org/all/202601152104.pV9uMS76-lkp@intel.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
