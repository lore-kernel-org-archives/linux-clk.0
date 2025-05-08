Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FF1F462F
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739646; cv=none; b=nMksdJmVjXHTdGHK+U6a/g27BizzMSqDSvBZtMFxuoyhDXEQgzWCxIYbTr4rYWzDQXTvre0Hj0bgnruZXCX8t2CGtZXVLcsNetZ0rTTwUu0gZd/itXtLWIIc/i6M3nxQUlxAUNFqJTy+qsRzdXfhYFWgxP8clxTe/wEnc4I3vhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739646; c=relaxed/simple;
	bh=fCzAeA+bsdzOPRTHwXZH+gYz6BbrIA210lvJ88aZzEk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coAKlATUIymiqfJx4IA6fMGG2S+C3lxxAxNkijJmQhZ/OqglS9V51F1VgnTU7xa0W3cXNweLt2zaKrLs5F427OpTGzCIH5/c1EIGklITs5Hy5CZMtq3djGpbw6ex6zN0ZtMkGKrak4zU6SXRDiPUjUzRFq4idKPpI96Ihc6K05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aQUaSnwq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aQUaSnwq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso240186066b.3
        for <linux-clk@vger.kernel.org>; Thu, 08 May 2025 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746739641; x=1747344441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=aQUaSnwq9CZ+ghu5lwdeZf3CVaUza4v3M66f/vZsmQa2M4eBHo78p2Jf3eswNRTbYk
         LO229eIjv6aeOXdg+wor6Ma7aiBPLMTYki2Z8gqg1cWK4WHZH6HOAhb8C8LVWDwi1qkh
         x4ALBKyO0iGrgQtFDzHZ5tDZYOHxTFRgAwuBnsRTSAuOIf4XQ1qF47P+Y32ZFY0j4vWs
         9WRJGmUKMG8udAvmbA2jd/+d8nQe0sW46lMGiv1KkmYvey8HOvTri/wvlqJhG20noN91
         P26uEVOWal5F6SzgCyetReQCISBrvoYKFTznR+Y1qV7JNn9VTwEC7hqJpi01q/NedTTI
         XSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746739641; x=1747344441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=au4BpTwGzKGmnCojWaMNRVwWM4236RewQ5oXk0aqNICXNGaoy+xMyNj3MHcXVIgDDY
         xl2+mKdfkG3M+B6vaNsnf3ww/C7Sy40PtlVOvuXwiqWonlHIZkqrPRfLLpsKmQQZ5pJE
         wnnkD3H7U9M/JZT7aKxshWyUPtQEzASRqkUhUomaNBl5FIkWLc5o+rnZrBtekOQwV6Fx
         eUUKKLn9Ygz6J0uIFodeSPncx//r2pkpUcvv7wssUf7SG2xenuvuQhQ0BlIZxPuoDhYi
         zI4zcU7envo85lDvknTwLLD7ujyatHN9Zj+uKW49bIkHx5PGTkMx8Hpn63i4Pi6JGE1i
         OziQ==
X-Forwarded-Encrypted: i=1; AJvYcCX03g3Xb0P5E13CAkwOFRWaX2q7Xg/xBdZdj68AOTnclwn4bWfW6cO+7vnqmVTxaKzBqP2fxk/4ez0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+NEFc4vlFnFSL5n3AcakfqBeyOF9byQOa7OBWJW5nEvgfniL
	X5FkyH+9EkG4WUR1gccqVvg2u2dRaVvvAmjvuSWos4UY8Vg+vGYcqT0fBjGFLWE=
X-Gm-Gg: ASbGnctZSeslMDZmqHkxN4z//CZyi0+s5cVo5t17zuz0zVit6h0z9EyEasSx6yeosns
	VrFu+mN7PySUB0hWlSMV+yKbZhkfrXu5ggVEk4sLVeSnpacrdh9niZsQs2+YnI5eHRXlcdHDYv/
	+kfkpveCukMg0NqQMR5xvRDXbYi0EDMiuTUTr175fVW8qOhb8XlQXN+YRmFjgpTxhFKFmx1rlPg
	X9OO8gMjRxXByfH0qAw0Y2g7g/tAyW4zBSLtIvtx1ABjmztPmnsNFLUATKBFIusQNH3Ua7TcVZB
	Q97gVRUeDgo41/P8YsLuWEqdWTUlE1w8hRwPYfXWrQE5gtRteLv2GDImpMR2LDFEemrKjDk=
X-Google-Smtp-Source: AGHT+IGwowNKNf6YdL0s+pZvYQ6xsCLedq0Pezu/34sukHINlGhsBSD9rVYZ5MZsMsdJMGy3cL3uig==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr115728366b.3.1746739640793;
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm46249766b.17.2025.05.08.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 23:28:48 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Phi l Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
Message-ID: <aB0iEHqYmNxXQd8c@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
 <a61159b7b34c29323cdc428bb34acfa1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61159b7b34c29323cdc428bb34acfa1@kernel.org>

Hi Stephen,

On 13:01 Wed 07 May     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2025-04-22 11:53:13)
> > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > new file mode 100644

...

> > +
> > +       /* There must be a gap for the AUX selector */
> > +       if (WARN_ON_ONCE(clock_data->num_std_parents > AUX_SEL &&
> > +                        desc->hw.init->parent_data[AUX_SEL].index != -1))
> 
> Why is there a gap? Can't the parents that the clk framework sees be
> 
> 	[0, num_std_parents) + [num_std_parents, num_aux_parents + num_std_parents)
> 
> without an empty parent in the middle?
> 

The pos 1 in the parent index array is used to select one of the AUX clocks. 
Besides this, the index maps directly to the value that should be written in hw,
avoiding remapping. It's possible to use a numbering scheme like the one you
proposed, but in this case we need to complicate the code adding the renumbering
where the index is written in hw.

...

> > +
> > +static const struct clk_parent_data clk_sys_parents[] = {
> > +       { .index = 0 },
> > +       { .index = -1 },
> 
> Why is there a gap here?
>

Same answer as above.

Many thanks,
Andrea 
