Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B618C908
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433358; cv=none; b=iVU3FgQs/Sq03yKGL1CygoX0f4VHixaXWHtREaxYtCw74a6xdfHHryBh4vCdoTZHMbrRmLDxNYtE0nYzZ1jd3B9vaGyk0u1euuFokdsD5oPnri3mOQZmhVFAAuFwk3Wg62z/JH6PXRgQJjUw1/LsW2mK8RlOx1t/MBvBwxTQU6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433358; c=relaxed/simple;
	bh=VPZAtg08Wy5/FG+Kj/wTZuQQZpFnItvR2PIwTa5Vc/I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxdDQO4RTVBBVxwNodgUXlQSKJcaRtWtdtzN8Vq3OEaboI6hlE6/CsUIhu4o40CraSSmFmMnCxGGGy+VjOyECcVFy0CFfVHY51ReOyPk1r1aGAytvBau8KB+5ObCY5e7gGxSTn2FsH6V50TnPBkPOIaLN2kOTEeN/mktBmlZycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fXIE0q43; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fXIE0q43"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so2156664a12.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724433355; x=1725038155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5kboO0j45Is859BAgD4iFoFAta2hgxS6Xgur8E+680=;
        b=fXIE0q43JG/afuGoJEo+1ZFmAZyWLPTmqGuQgqMJ/4lFrRm0qZuHBzQqU5pb+FghpW
         h9I+J8sE1cbOerZ1XocD/Dsjwv0sbkDb32VVtnF1twJKGQ21qxpF9uoorvT2sCcHwf+f
         E68DXoobn8xvzK4zt9C+WC6FwLmWrhsoMdKaO9jWeCLyYa4VSPEBQifovEROjvrizcCJ
         zdYaEmq2IsAmQ6sS1DHygrF7Deu/CD1RCjMmo5B0fHQbG3J5ndKE/SQDnbvlvUfpdMbU
         1mEq6JtTvaicqO++blC68QVaO4O2PyziwJPlE3P24TJ8Dfy6CkEplcuE68KAAQANAHAi
         nrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433355; x=1725038155;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5kboO0j45Is859BAgD4iFoFAta2hgxS6Xgur8E+680=;
        b=aX5xz/U4ubQolDJN602ibj7Qpb8Y/oyw1J6FcRp22Z6ktamFJvZWSstZ2vT6MrSLkM
         Dx/RpsGZ4U2zEwi0aAq38zFQWP6p4J0Nj8VhkzxpAfY57frKB0gpAv0heXb+30YtBa7A
         NH+qdwyThvBfABrbcJnIKJsxkiDK/AiGOO5E7z3+uA1pYnD56cY2davWsgWTO5/b5iJ4
         /AHpmcVuK4MKAVoGBmDTI2eKeEIqXeN/uBjuwdHZ2Y2g64EkXc/jiTfqSlwciuRGFD6P
         PPW1wUPkkt/Epodea7T3JcIZgZBlikLaqzslz27RdmEXeKf9zqdKo+N/nBm2SmghIGMK
         ge9A==
X-Forwarded-Encrypted: i=1; AJvYcCUpR2VeIx9KzbE9axeHMtuS50L3tEbz9tM83MD2D+LpI8yNjznAMsVUuB/jCSS2JAmN4z9KOg2N5wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIgKYr/mldDilmgr/phnNwagexIlD+LtSVq6WFKxArYfkDgEy
	+2w+QYDEB+syf4pIn14GIC+xhSsCQ01RNytkHqd26eJkZvO5Cj/hMldA+kAsg8U=
X-Google-Smtp-Source: AGHT+IGi+ju94qIZV+5dh+FC4edd1LJS/Rb5jnDSsIsgwxHk/+itiIP1aidxM/8be626D3wcbLPt/A==
X-Received: by 2002:a17:907:2d0a:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a86a54f142dmr198119466b.58.1724433354052;
        Fri, 23 Aug 2024 10:15:54 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4862e8sm287339466b.173.2024.08.23.10.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 10:15:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 23 Aug 2024 19:16:00 +0200
To: Simon Horman <horms@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <ZsjD0C8oYmUi5I7n@apocalypse>
Mail-Followup-To: Simon Horman <horms@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
 <20240821132754.GC6387@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821132754.GC6387@kernel.org>

On 14:27 Wed 21 Aug     , Simon Horman wrote:
> On Tue, Aug 20, 2024 at 04:36:09PM +0200, Andrea della Porta wrote:
> > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > Add minimum support for the gpio only portion. The driver is in
> > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > support where the gpio part can be seen as an addition.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> ...
> 
> > diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> 
> ...
> 
> > +const struct rp1_iobank_desc rp1_iobanks[RP1_NUM_BANKS] = {
> > +	/*         gpio   inte    ints     rio    pads */
> > +	{  0, 28, 0x0000, 0x011c, 0x0124, 0x0000, 0x0004 },
> > +	{ 28,  6, 0x4000, 0x411c, 0x4124, 0x4000, 0x4004 },
> > +	{ 34, 20, 0x8000, 0x811c, 0x8124, 0x8000, 0x8004 },
> > +};
> 
> rp1_iobanks seems to only be used in this file.
> If so, it should be static.

Fixed, thanks.

> 
> Flagged by Sparse.
> 
> ...
