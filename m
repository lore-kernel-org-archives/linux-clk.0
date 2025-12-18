Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140C28134F
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084330; cv=none; b=tEnzcMoQ/Z5VziZUMcrpDZmkmNdHfxaDn1kpr31trcLCMIy7c3RRDtSE8qvgKG2V30bUBP5bKjG3jB12AFnxzi/d1mPqloq724YWbSIA2rReBSeABDMjx4KBCs3oFSO/Jdsy0ex4tvRBwEHXcDO7mE/4LUV5/tcZ/72SxoI7k14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084330; c=relaxed/simple;
	bh=Jku28IM/c1IYSHnKsavbvy9aaLBIgMj3F4YQHgrupho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq6Ihb7+usdCMYXbNRipdk7x3erR7/rme94LawiDIPbXZYCIaggqrXSGeil19PFQvSUP9+peHO3RJbG4nJkxJ2bkq2Juk6Wy7wEaTJBLGyjkQfCWPE+HtMw849gYOGYVhQza8idSINh3Jm4GCDk0FPeGcVLNsJvHAAvkJUojKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzOjmPrn; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzOjmPrn"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so914508b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 10:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084317; x=1766689117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=NzOjmPrn46f7eL94kTiu7+0zvL7EqcBFTL/HGLf3Rc6h3rBZjvJM5i3qCCD2fYrXy7
         eJklrOOWGmpDdYURm2bD9+/3PlBRsY8WKHCZ2GLGzwLcw74QlWuQ3QwUrvnoh8XgWay8
         gOij/Oftk04H9HcDeMjrum7Gp/tJMDS9TcpBQwDo75WutLi+yiY8j3WBiG0hbm0He5W7
         e9CpO9bAAOVDpz+N+io0xTJRBjOcs9kNkjAd+Z+kY0znjtSG4hOPaCJlbg1PV1xakEpj
         cFYP81lVX+QhyL2f1NFGqqWTbtem9suiHwzZLYFwy//KO+NJmpEmbUADkYq65Km/0XcM
         myZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084317; x=1766689117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=jFskh7sqJwouQ/fy/vqniCisaASqaD/E2tRHou/P0Ihdo6QcQfdh5oyMqKUpc55dwc
         bbLtarW4a/yhdom7UaePET+Km+VW7Rbz+lK4QF+4jRzT6ASWmTPbnF+hAssxlpjNhRIg
         aiMuGYu1u9i4Vo2Fp0GSMJMABPCmlsWdQkW0asxLNGAgrJ74XWhLFpJJ2tsXiRcQLhXK
         7wxERXOWWbvJB7471ZfhoOYbyKcpV725R38KWc6QGrrkk/QM8Et+OzL3D6Uy/MBL6vZv
         2JFUbMGB3ksvX9v+jd+8T7Jm/xLfASLdLDqTdiaUAiWxtnM9XoTHrDBtB/h0TTDUugkj
         WXNA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ydxm1FyuJBa1LYVdxqU5DPyxt97OXGTBMMzJbQ25BHGRD+hI4+AFIb049nIziq5+nPIsXOCSvM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBknIPAEGl7kHJfW3S54ac7lWSjip2/I+NLCnX2z6Nn+uyn9z
	ZCxnS6kdTsIcIqYDaSJalQbJKuL6OAfZ5td92lZ1To0oSYlf4INcQKMj
X-Gm-Gg: AY/fxX6EWbL92a43wzyWnl6nGFieZmaVgfzi8H6o+PzEpYBlMmGqqoOeV4tn6l8HNy8
	F/Y0b5B6JHGmTI9/7mYe0E3z1UiTV0R/LRFqtVukKvpjn76R7A6Rx7pJ7l/wD9HxV2KtgFzcXdD
	yAy2s3xUqzSv6AXaJ5k/O+CvcFlrPvbOHcP0HGB7BBVCbqBoxcC9gCwfPtonUlOZpwCOgAx4GNY
	25BEtNjxuYyfzf+wTDW3gPK56Oyk2sWkaNOoIQSx8CJftXoWExxtVohEjo4T5Qvd0fZsNbdTOrq
	i9hYasT6w7UraiwFDSI+JsfYWpUS2E5dTX68ekEKP7kuI/pLoiqUJgO+5//oVCcAaNDmHH4jDQj
	L79ieAZyWHZpY73a51eQTEmFXBrpNkd752Iz2y07fY/ZmiGLgEv5BbqZksBNjpC1GC74qNaYUqp
	whb2u0C3Sj0RqtcnynT46qsXLU
X-Google-Smtp-Source: AGHT+IFf3D0xeHaQPPXEeazhorZHgIgTwRHiyRuussKNgJjGtFBYIJhQUMgRhb/IHzjPiFdB5lKzgg==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr177764c88.26.1766084317443;
        Thu, 18 Dec 2025 10:58:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm299016c88.12.2025.12.18.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:58:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:58:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add
 microchip,lan9691-temp
Message-ID: <8462a516-4e8f-413c-813d-e7ff0e6eaa1d@roeck-us.net>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-15-robert.marko@sartura.hr>

On Mon, Dec 15, 2025 at 05:35:32PM +0100, Robert Marko wrote:
> Document LAN969x hwmon temperature sensor compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
