Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957325A331
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040242; cv=none; b=h4DSeWckaOVI0PcY+v4E3ZeOPsj32jfyvDDmQdlCRLe+N1/uXFNe2RbxPs7F1YFTnc4PeIyPgxpvbg2ZeAyuXFdw6H1bMzglHnWoqbgX/CFJMOZ9Ca31Vj5zugKZa1epCUvZ019xfAzvuqvpCAisuY50F9cuMH4gHAzqh94aZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040242; c=relaxed/simple;
	bh=JhLyS8OlAvaLP9r7KbQp2hC6ezEHKIzbqXNmUbZHJpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nc5mbRL6Al6c3oNWIWB2qp/POD9EPzh0kHRDDZgDIlLRdeXeqelJObYZUTwEsCGXVFjPfKxzX9UPvoepzjB6+oGsckKQIhGMfHzbdlv4seg40+bexdL7lCVaUDPPerjf7LCssBu8Qj7nDg+Do/eoMLzWC3g1LAkSfigpRcCkSTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D1Uaidzq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D1Uaidzq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7411f65811cso3515288b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747040240; x=1747645040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc3CqNV/8Mi2zP04knLd5VAdkGEl8lYzJxAs+HQXCEQ=;
        b=D1UaidzqpoK8gIulW9n1/Bsx8Ekb5WoxuQhpfF1z5uBRux3hsCDFNo7zNHYqBGDgZl
         CeuQ1ux0KNKMYNODDa+mV5+KkseMK8cJpdf7QNhrawYkjidcIVpNH1BdKcuohzpkUbhW
         H6OPN+E6uxWcZ8TiyAaooZbZvVbgrPO/+dx6xiqDCUywjer71y4j6E02z++N7wVyozLc
         Tu2vclbwMDZawKoou3vuUNFLo2pZL/r2FZn+y7dZuGppA3bis57GWmW3mZGVoFrEc6sn
         UPAYt6fOdNkIMqa8bLneDh4oVgiKEsxVpti/1u+LdyY14pvc+1BrWXQ0IAfzDtVRFeGy
         7kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040240; x=1747645040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc3CqNV/8Mi2zP04knLd5VAdkGEl8lYzJxAs+HQXCEQ=;
        b=UD7COHUcktuQd1bMI42LYToIZNg+5xo0B57J/MuChKUluRGWb6VIHWoP3+23EswF6r
         xzl9EbCsGeB5qQtcyo4a7AmEXKhVN/uAAkj55PnT7Rs9votPn1xeaPhkbz3v3lBhzNIy
         EyU6pcj9lwS500L8riTpRMHsJS8K1PS8R2Yv7mR7c86ZVHYAVZ9d1VhVFJNZzPCdQ827
         dH7KxkzyP7qLWMnVemEdGrLTRBOvkOHwIkvLPBK4fYCz0QIEdayhFBZ8KwOTSEdIge6j
         eWnUOGec+5s4nQURGzCAAysEPyAXUGEHUkxaGQq77UbVmo0crEYPDaBVI6ylesqi787p
         h1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWLghjVdnCa8F1Xf4gKMGQNu1b8JkD+8E5ucQ2WlGkEEPPHpgaEr8XgeDrxYiTXKIUixthhF6as2lY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6Tji3RzSCG5oGGt3T6R6uAnbl8eGCFeg6wDLLm5o2LTWNM7a
	oLChcv76YOZBrqZPv/17l7hIgekOLwAWHR32BL6h3b+cxvkFJDJHQVUxSNfXFXo=
X-Gm-Gg: ASbGncucSYB2I0vY+yuQxTiATvW79GrXhx8AQuI4xqbnLimVHRHwYU6vNz4+HuQZA7b
	1Ifp87ShGgqU2X98lMsRC+2QykiDBq+Jkcvqc1m7CTlXyC5oQViju6U2Q22H5hJe0JkuWU/vHTr
	DoJ9hunXdWLvYApCUecwR3jid7Az/0kATeZWygMDOYpsbY7zCK2Ofm7e5cFWdHwQydtcyJhmG5L
	vzn0QqRddXWyt97TtTEXSE33LY34W96UNa1sD40BhmZoACLfz/WPWMi4iLh3622JatnS1hqPyhc
	hC3NnnfYVAFN6hRgujUZXTqoI6OADn0HoyYuRS8oLb93b8x3zCL8+QsCk10=
X-Google-Smtp-Source: AGHT+IFWgBjdZaW68l9bQibLY9baPAwDqAl5/2YWyRVkP0+/oKFF3fyXGC7vyJbnIM52riOnSv7fSQ==
X-Received: by 2002:a05:6a20:8792:b0:215:d4be:b0ad with SMTP id adf61e73a8af0-215d4beb697mr3485599637.28.1747040239872;
        Mon, 12 May 2025 01:57:19 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b29casm4459423a12.28.2025.05.12.01.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:57:19 -0700 (PDT)
Date: Mon, 12 May 2025 14:27:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCG34XoERpmESesO@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
 <aCGzFVXFBVRbMUKz@sunil-laptop>
 <aCG1kqi2w2EUKWyO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCG1kqi2w2EUKWyO@smile.fi.intel.com>

On Mon, May 12, 2025 at 11:47:14AM +0300, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 02:06:37PM +0530, Sunil V L wrote:
> > On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> > > On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> 
> ...
> 
> > > > +#ifdef CONFIG_ACPI
> > > > +	if (!acpi_disabled)
> > > 
> > > Hmm... Why do you need this check? What for?
> > > 
> > When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
> > cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
> > missing something.
> 
> Yes, just check that the companion is NULL, rather than the above.
> 
> 	struct acpi_device *adev;
> 
> 	adev = ACPI_COMPANION(dev);
> 	if (adev)
> 		acpi_dev_clear_dependencies(adev);
> 
Ah Ok. Sure. Will update.

Thanks!
Sunil
