Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02282126C0F
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730028751; cv=none; b=Ww6qA7ddveUWrbCnszuDNmjyaSAgBk20UMutRruMC11xIo6lAPIFn5YP54jb0ib9DO0ITnKDh+8rRahQSSRYXwFguTwPwxFv4pqVw6fNJrdz/eYA27o4a/mGiK66QHa13OYFjRSMYKiTVQmRBARGyWAlJFrUz/CvhoTgk0VcadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730028751; c=relaxed/simple;
	bh=kTHkP+pw95v9Q9sC8dmhm0Y1Njg3SQZdvxggj1A8yUM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9hho3aM544iobIqL6hyYJMuCzfW+KysCt8X+xIWmv8Rk8GWIwv1WUQQmoKKO7snrzMcGR6EjSywp0+cekia4GBUdDlKzertq7j4J8yCsczoPtK/++276pd/7b1SBHTdUos/2g2oW0AD5/yxnyfAOlrJgdqZ9A8JyoeJ1OqBmw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gm9iBTrl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gm9iBTrl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9acafdb745so622950766b.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730028747; x=1730633547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU0MCV0TeQuQC16GsgNJVVDz80GIbnmau4vhLNXnG6c=;
        b=gm9iBTrlAdFDgy6nGIsU9gmysckxtx356qDlT7/Kzgt2lKJzc1bhT8X0vvyxuBWed2
         tVB2zce4+tAi3zdCsoZ50YVE6pRXNs3j5eDl4QtJneyHvU1CeC9k333Lcb793rbYK3T4
         4NtigsNVAtzgNeRxhyzsybcnQRH/VZSwVwH1skjThuu/x8C2qbNZHnhETImDVk7fdoF9
         StA593+iCtSXNtM6zpCA/OGDQ/4oTdrK6PzS3DDMYJwOGgzWIQ5iYwLr02XS330/J+J/
         nc2F+WFb23uALjJkB4HBg/rxmNNRZV7W/qjusuQiFKLkXsoMLBT8iVirjCHfCIh+3CYa
         FSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730028747; x=1730633547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU0MCV0TeQuQC16GsgNJVVDz80GIbnmau4vhLNXnG6c=;
        b=BClbOjChgMfcsl4rcuOI5/tw+m8qicWbzVRo6inqMhxcDjU+eFbO+LNU2+tp80DMDK
         s4j8Jf3NqLj8eCsLEab1wMMr2ay6cx4jezcGDhTJS6tS1HXl2pbLUsDS/LzQdYcxoIKt
         FkNjielcaOfHXa9DLsrNIFtJtBERl/X6jldvKPDUry/x0b6Tr69ZjvVmnrDjtLHVC2k1
         z/7/MElKdVd5dEMTHvpu0PrODf3bZiAbiELwSf1pRX4f3KEI2bw9c4964YjfYTuVgl7u
         wZWqDDH4nV4sVhu5IY/85q8FTtLJD1chPKX53mnOFnempne+1mFpZJy9p2n6BS1fWGhi
         Td/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnVvKZJYURUin2BS5ZfUlMrcV6KcSM0KGSROLOdjcy6XhgnE84vh609OyUn54aSRyMOJFCyA/u4jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysmykHzybPrjRQLUSWgdfgDQtGEoEFcC2aIqn/0Dt3b4RQAnBK
	z+Cy8mLJP7H6npMXF4htS36yW5hijSeTMAgd5EDELNrt8koj0JGtutbkqPjMTTI=
X-Google-Smtp-Source: AGHT+IGFhxYKhcZGmct80kmOogS47m5N8se2XFqf8zdUkxnrd0dqlLKBimSbOYXFuOLdT6TQJTi2mw==
X-Received: by 2002:a17:906:f592:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-a9de3612eccmr487030466b.15.1730028747291;
        Sun, 27 Oct 2024 04:32:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0292c2sm269235466b.69.2024.10.27.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 04:32:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 12:32:50 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 09/14] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Zx4k4giM86vW7g0c@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <199a4994312b120c73c95fa368954ad5a2a8aee6.1728300190.git.andrea.porta@suse.com>
 <CACRpkdb1muovPmKoUw=Q5sNXj3bsCt84LcKVDSLY09_5_1rXZQ@mail.gmail.com>
 <a1b72875-6224-47b9-bc68-bcc66343bf46@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1b72875-6224-47b9-bc68-bcc66343bf46@gmx.net>

Hi Stefan,

On 12:08 Fri 11 Oct     , Stefan Wahren wrote:
> Am 11.10.24 um 11:03 schrieb Linus Walleij:
> > On Mon, Oct 7, 2024 at 2:39 PM Andrea della Porta <andrea.porta@suse.com> wrote:
> > 
> > > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > > Add minimum support for the gpio only portion. The driver is in
> > > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > > support where the gpio part can be seen as an addition.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > This is a nice driver and I find no issues with it, what causes
> > an issue is gpiochip_set_names() as pointed out by Bartosz.
> > If you can live without the names you can remove that part for
> > now and we can merge the driver, then you can add the names
> > later when we sorted out how to share that function.
> I raised the concerns about missing gpio line names in the first version
> of patch, without knowing the real efforts.
> 
> So I'm fine with Linus' suggestion, because I don't want to delay the
> upstreaming effort unnecessarily.

Perfect, thanks.

Regards,
Andrea

> 
> Regards
> > 
> > Yours,
> > Linus Walleij
> 
