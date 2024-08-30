Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592B21C1AA8
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057121; cv=none; b=e4jqnUVr7NHIQi9bGgsqhmzppr6DZ9LqPGVt9p1l2vYy0Ky+2PflpQNZ2FcTFn3DuwCZEC5ep2v6mfTL+AaNO8D2CyZbndXGc7nGzeVQLMRgCPK6ELzvTPx4FysJIj4E8bzoU6+VeipV4GRnucD2FErdFssHDDvnDCl55RFG8Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057121; c=relaxed/simple;
	bh=hHzLblhbrXJK+/G9raoIs399iqss/9FXwR5tgGPtjHI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oM8JGKLQjMMt0s/yQ4BlfGHDUx0WAqwis3vmnFOa3EixMympW7cuSrfCJgnnnJAkRfxrzidwxQpRYH3pZiNChN2sbCsDOZwHFO1WQLFpjo/EAtL4xxwO+NAuYAAedIYqvVYXnxtS3KTVbdOnHdMqotLh2wAVyrAkgmoGDWAw2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IrI86eVD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IrI86eVD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533488ffaddso2978976e87.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725057116; x=1725661916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuOHjHN01pwLhTn870hGi0iyigFDRibUrDrwMdxDl98=;
        b=IrI86eVDg2/wYDZQDlPMxC9/wv3dhUk6p8jIbcb0ybgmlva31/PINL3i3+UDhiZqiP
         MVUt4Fnifkv1ske37BXvH3v9WBAxMv53Eztln2qqrTrxmE7TxOVdr4VbkqME4bEqNStj
         XO+R4S0AMifdsZEueHH8AQQOqlDtRL0RSGlvB78AgLE0v1OOyaVCmbnQufRuNt7kJAjb
         XD2k6NAJLCnHFEGStm/In2cnhT84ZannyVhPNt5lejbruB+WM/+h0En6qVZxkSW79teL
         JaKBuHDtxCuGT+YHO/ECn13UxmmJ/ult2z5vWtuSTBD62XlR8xS7WFBkjXdE+qNyppS1
         cx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057116; x=1725661916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuOHjHN01pwLhTn870hGi0iyigFDRibUrDrwMdxDl98=;
        b=wSlyEPAOwGSYPCiJ+2ld3YGOErBe55JVdNzmhKlaSP4ND2N102tJnlf6VVVtNSwT6g
         E0RhC1xdDg7Tuk+Neu03XicW6dgtiLUQaiSXvQAX43SbjPZ3sIQdNu3G3Z4e4f5eZe2L
         hjE8dgF1KqxeWMXLmquewiQyNi5cLf09ziD6jyM1R0bnhVwsqoQeZIOSRItctKXylkFT
         ysylh0IZHb3RG4DwaadYged/R6Rr3o617dZ/eJEgJvtDZz4pSuex7ykQdTGsdrIv26PR
         yv8qvC1uWiMfpQLUfly3DNgU6EMQuuYAC2MDh4S5wnfUREoBxuoY0zDLzqqCHnBBknSE
         9p8A==
X-Forwarded-Encrypted: i=1; AJvYcCXzp96Mz+dRGtIOPX9xgNlMzTpiCZAbV1RPEWDREXaOVPD63P4Lqms5gZkjnN2ITFXPHJ55f95zE7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrqna8U1XcsMbOdi32Is5IoevV866PAMLhPQ6MKIu7OE0dFcNZ
	t8CfgrLzv+M7d5SvlRNnwOJJ4kS+7CNhv9QNWua2ZoeoUYOHIGqedYca4zDFOgo=
X-Google-Smtp-Source: AGHT+IGclcXXmfEYFitTuWbyIOxJTqBHu8I4vUSw06+6AvY4Xvz0PRfaVlPP3p7/PlrqVhE+LPRQGg==
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id 2adb3069b0e04-53546b052fdmr2712927e87.15.1725057115910;
        Fri, 30 Aug 2024 15:31:55 -0700 (PDT)
Received: from localhost (host-80-182-198-72.pool80182.interbusiness.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f9esm260898466b.154.2024.08.30.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 15:31:55 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 31 Aug 2024 00:32:02 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH 10/11] net: macb: Add support for RP1's MACB variant
Message-ID: <ZtJIYsBa07nJE6os@apocalypse>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <775000dfb3a35bc691010072942253cb022750e1.1724159867.git.andrea.porta@suse.com>
 <cfysm2r6sswmvrch34pk5dx4wum3rohcxdla7i5qoh6vizgklb@pk5i7nzlnp67>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfysm2r6sswmvrch34pk5dx4wum3rohcxdla7i5qoh6vizgklb@pk5i7nzlnp67>

Hi Krzysztof,

On 10:49 Wed 21 Aug     , Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 04:36:12PM +0200, Andrea della Porta wrote:
> > RaspberryPi RP1 contains Cadence's MACB core. Implement the
> > changes to be able to operate the customization in the RP1.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> 
> > @@ -5100,6 +5214,11 @@ static int macb_probe(struct platform_device *pdev)
> >  			}
> >  		}
> >  	}
> > +
> > +	device_property_read_u8(&pdev->dev, "cdns,aw2w-max-pipe", &bp->aw2w_max_pipe);
> > +	device_property_read_u8(&pdev->dev, "cdns,ar2r-max-pipe", &bp->ar2r_max_pipe);
> 
> Where are the bindings?

As stated in the cover letter, this patch (and the dtb patch #11 for macb) is completely
unpolished and intended only for a quick test of the ethernet peripheral underneath
the RP1.  As such, it's not intended to be upstreamed yet.
However, your feedback is really appreaciated and will be used in a future patch that
will deal with ethernet mac support.

> 
> > +	bp->use_aw2b_fill = device_property_read_bool(&pdev->dev, "cdns,use-aw2b-fill");
> > +
> >  	spin_lock_init(&bp->lock);
> >  
> >  	/* setup capabilities */
> > @@ -5155,6 +5274,21 @@ static int macb_probe(struct platform_device *pdev)
> >  	else
> >  		bp->phy_interface = interface;
> >  
> > +	/* optional PHY reset-related properties */
> > +	bp->phy_reset_gpio = devm_gpiod_get_optional(&pdev->dev, "phy-reset",
> 
> Where is the binding?

Ditto.

> 
> > +						     GPIOD_OUT_LOW);
> > +	if (IS_ERR(bp->phy_reset_gpio)) {
> > +		dev_err(&pdev->dev, "Failed to obtain phy-reset gpio\n");
> > +		err = PTR_ERR(bp->phy_reset_gpio);
> > +		goto err_out_free_netdev;
> > +	}
> > +
> > +	bp->phy_reset_ms = 10;
> > +	of_property_read_u32(np, "phy-reset-duration", &bp->phy_reset_ms);
> 
> Where is the binding?

Ditto.

Cheers,
Andrea

> 
> > +	/* A sane reset duration should not be longer than 1s */
> > +	if (bp->phy_reset_ms > 1000)
> > +		bp->phy_reset_ms = 1000;
> > +
> >  	/* IP specific init */
> >  	err = init(pdev);
> 
> Best regards,
> Krzysztof
> 
