Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C3622D78F
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540075; cv=none; b=lyMWD16FHgSKyZeShnAxpSVtfB2dsDGiPylTgbgMbHs6T/XnIM9sWRpmDMLPRll32AZTqqEV/dIn8NsW2lV8awYdDGVowoSGKrE88BdT2L0DN1vnmOspcePtBpUxlhmGQn3//wrf76e4PaBuM4V//G83HyEBHnr6LuSD0MmEOXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540075; c=relaxed/simple;
	bh=9Um7uqVayv1y9jJFqULzHKt3MEGzxLbLkz23BHaitvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUKYKRtPsobjku/k2YNaRuO54oZ6NFrto0oufzqq7y+Ey+l04TMu6E8OeitVaPQNdTuJkm+meyyo1S83z14LT4hQxkD/z5HYfU8QfByguLCRgRLo6al1eVdeXRYoeK8XGVq6NbM5xOnNAb6DxbVpF2fxNhdg2s5Xm/VcqDmRpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XsywZlyF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XsywZlyF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234bfe37cccso95873295ad.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751540073; x=1752144873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=XsywZlyFZKDwUjRTunWPaMQwmKfQIjlzjqhqMs2eLfuv79cc9CIu/BAOs4yJmruXaD
         5ztuQUrvRkFL7ZAawFO90LoW+h8TavRg5CzQG1pfOqo0IusW2IMivbJRH5Zvu+smQLg6
         KxUq+pTXMQFXXGU72hipZUFB9eMR3yoAbYSKoR//9rKWG/0NB94qmMSmfhYFbiyb/xKG
         xd1T1h0RgelmR+PAR4b2WKuU2efv3cQAXqMavOKaqhO6AVfHYi+0R/vIidaj3BoUGhxO
         xhu628Bny1QzZ481DpjTr5kUXw5axzJinK3MRsJ1w0fwG/hMJjFN6p3eNZ1yn78SEmwz
         aN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540073; x=1752144873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=Hoav0VoHlnpc5UJjPq4ok2klDi8cv1O6jqnuGG3KU6GCseuCnHoWwEpDclS2C8jOpE
         zMZ6Gd5ehaWjFDfRiwt9vkp13r/A1h0r3BHXBaK3adxFLikDv4VXGM54uQXFWlEuug/b
         Cphs25syXukRkVH9jtzzIeGIPCOVZP0WU6tW10OuHKYVKpYfi52tS/y3FK2WeWbsSoPL
         aY3tftWsLgRb3YLPxhhJgDgoNUxrNgwzcniIE4X/6YvhEFvpeIoYislAD3iNRVfRh0bO
         xx6KZy2PHrw1hmd0nT3mRzErBOxjNKXIbTyrmeFzfZb/kpP0+NBg1Ehn8Z+cKgW3gzG3
         q5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO+0IF+HCfyDze3ySmeZxMX1BUnEIXPVScAWRSaO+tCsh74YFrjQABP87OlwwAnWk2T4NIreSAJ/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqJx6l9GDaxLTSWJ70VaySygGrQahuPCo34CyDLCkQdPBFava
	WRu9Qg2XpoakF36eZkrNryQbTpWWo522T/ubj6P/+NAB69+PD07hhps+VdbUTxzUCYA=
X-Gm-Gg: ASbGncu06GmGVzRL4xaezPXYCtPgsgUw1QKAOq92/50CoNpuY5ITuUh6K4Wu08j83Iv
	RmRXIzs92HwvJJohN3cwgjz0BovZILu8jK6dhEo656lUCLzRXDuRh/bnlm0llMmJQViKpfER75z
	tLzAHv9AUkyFH7fo7nTabqd3/odVj2lNzLQ8dzaYC8WVx5FDAUEJ9tT/32G+P86pYjPf8Zr+f5f
	oQFKxOEwNqR1pYWaUeUftsthIq51iMhfBishuYsSZAcFRDvm+XV/nXrdWEJleb3JWL6vEbt6yeT
	L6mq4RJnmaPPlGLCdToOloxIzQ6qm5/EYZr7D+Up8kSivn7a/hjVWrhQ5OZugKtW48ssYw==
X-Google-Smtp-Source: AGHT+IFq25HTQ9QEIhNCp27zmZLx97EGsAxug71BXz+j7RxWXx0ck3JUwKi8dLTS3DtAE17Jq1LekQ==
X-Received: by 2002:a17:903:2307:b0:234:8a4a:adad with SMTP id d9443c01a7336-23c797fd795mr34397665ad.26.1751540072871;
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b9344sm158881255ad.192.2025.07.03.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:24:18 +0530
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
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGZhWlxxQG0Z8awP@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
 <aGUl_S9irfhlHmy2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUl_S9irfhlHmy2@smile.fi.intel.com>

On Wed, Jul 02, 2025 at 03:28:45PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> > mailbox driver.
> 
> ...
> 
> > -		if (dev_of_node(dev))
> > +		if (is_of_node(fwnode)) {
> >  			of_msi_configure(dev, dev_of_node(dev));
> > +		} else if (is_acpi_device_node(fwnode)) {
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> Actually you don't need to have the if-else-if if I am not mistaken.
> The OF does almost the same as it's done in the second branch for ACPI case.
> How many MSI parents this may have?
> 
OF already has a well defined interface to configure the MSI domain. The
mechanisms existing today are different for DT vs ACPI to find out the
fwnode of the MSI controller. So, it is done differently.

In RISC-V case at least, there will be only one MSI parent.

Thanks,
Sunil
