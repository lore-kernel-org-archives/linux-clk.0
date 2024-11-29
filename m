Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23C155741
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900285; cv=none; b=CaHedRAyVBypY1/+xLGyL0q14YlfvJ4ddUxQmpz9Hc7jIT6N4PjtVoRrK59UvkKTgI6QzyzSM1LEzWOk23GQZFdbOt+XkKpcLXBwYUrsM7YzsZ5YpGiCnYqf9oI5fbjWpybSsolN/Q755sbsuMPKdHZtjyc5cQcq1BpzIR+5njc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900285; c=relaxed/simple;
	bh=u4VeqDNvTWRAhnRMPvx5ZxHgDaIe1hpfxIJoqfWrVgE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnQGshmNccKuX8V3SoQXakPV3+tJZN2yzuHEtdS7qjqyoHYcPXf3ggz0iP8THDsxTJwNACG28HMY5nRry+IFW7aGDOlRuWBbrYFAOGK4Maw652TumXvWLrIfsQDoRGlX8MyR6IxGCaDm2cIzJE8k6S3WBwel6NLyZ90Zn8PEVkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bDOwkwrp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bDOwkwrp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de035ea13so2173322e87.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732900281; x=1733505081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=bDOwkwrp57+hdJuQM2yuTXFuR2uJQz4KquU51t8PIHqO8eQiDyD9aQNlzcorNorPaT
         xp7YOLadRHiHqNeLg9IJY6J/ulFR/j/syM1NdPODXmEbzVOl5mUR/WOlAKf2q/W7pRWF
         OVISodhH2VoKdzyWp6LX1fXe+h47Uvf/jzI/K4qJMK0C/xvuS5ytvS7xf5oYa3VTLyd7
         VWtiSLzoTH2KjPpjC534rVGaPgyoky1fRIlQrXwp05orw95J08DpqUP7G6xtWuVpeMBw
         wDC8XOyxR1Qfs1jSuK0KTWCb5rsWjIdgrxuwVXnYBHN2hXoRrC0USPiYqn3iDJLpFYf4
         VHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732900281; x=1733505081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=cVZOZXL6F9uOgb9UefXRvkVqGpMCCXkaa54alKa1Su1//xb3UnRfcfIzy6AYAtTfUh
         +dEv3hVoX4xn+w8cB4kwk4j0kk35kC94CprIcQuIZRU2Xc83CWJyxwSQ6vsQ4CP6cWhe
         bMRA8NwopoTIAWcL1kDJ4Z5++GGgWQU+Hgtoauukxa2hT5bj1BSBTYtEk6aSqjSNK7IV
         e+y5PlzvSg+hhCyWY08nZmc0mxqnrDJ64YYV8lISA2N7mAxjeBDyHeDMXR/uCs1rsQqb
         nqqYLPzuTMoihw6kBbJNF721ZH5LH36MJIQ16cjkDnn7JVtoF0zD7/Re7SA12H9sM4YL
         v2ww==
X-Forwarded-Encrypted: i=1; AJvYcCVzM1W+gbLzIk+NuvI0eUh+9JTI2t5qfO1FQK4ZmCK56Qi8FHMBmlRmtY637hlywq4GHbCIEvt/Xx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD67xv7mH78Xhu1HduGUoMkqNWe6gTkbr2FqKvVnK8Itk4gemY
	uvEGpm28acZU/NVs4wtYB8Tr2/yPVcqpta9si/CjfTMDoKcLTm1wbxdU2v8LztA=
X-Gm-Gg: ASbGnctkdovqTyKnJx6mCC0Os93ms/b9AyYDc3VnCxWTe/yY80ZFctXgK2Oh12TqRhL
	ZR5p7YpNhhyxfLrCt65JckqkeEFZED/Pr71rp2H+FG1KhhKatHunboIKSo4ZbIPQ7/coWvwJ4pG
	tUzAQ3wxLQKRXzGX5VY9nJauVZazHrrGWUiUxj7hkLw/4Wp2ZdV3daIaDde729qZjBls+fosmuP
	lJy/0dTntYldeczHg4i03GK1UYRFldzx/4ot6s8KTXz3C8xDK7TEzj7e3qT4rDQPVi59xEQ06qd
	ginC8yTjhz7/6QzoUT+o
X-Google-Smtp-Source: AGHT+IHZ3oTCh7gVSsmHhrZ3fiOp7cXkhyrNMHuydkCIk2tz2qxDfVIno+QP7oK2bTxacMEqt16MJg==
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr8431697e87.57.1732900280754;
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e63a2sm192130166b.113.2024.11.29.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 18:11:53 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <Z0n12a6irbXQomdD@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
 <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>

Hi Krzysztof,

On 08:55 Wed 27 Nov     , Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:51:39AM +0100, Andrea della Porta wrote:
> > +  '#interrupt-cells':
> > +    description:
> > +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h.
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +patternProperties:
> > +  "-state$":
> > +    oneOf:
> > +      - $ref: "#/$defs/raspberrypi-rp1-state"
> > +      - patternProperties:
> > +          "-pins$":
> > +            $ref: "#/$defs/raspberrypi-rp1-state"
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  raspberrypi-rp1-state:
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +
> > +    description:
> > +      Pin controller client devices use pin configuration subnodes (children
> > +      and grandchildren) for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode.
> > +        items:
> > +          pattern: "^gpio([0-9]|[1-5][0-9])$"
> 
> You have 54 GPIOs, so up to 53.

Ack.

> 
> Use also consistent quotes, either ' or ".

Ack.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 
