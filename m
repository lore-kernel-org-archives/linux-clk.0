Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A269221D98
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521843; cv=none; b=qO1LwmDv+M+7bbkVGXk3EFkFxATchWV9Wkf6CXkkmRKPdD+n9pF2YAoGOOxlOv4lUzlce+AK6nC1LOo6LEdKDfUhdHx/qvMAeVwuYNQYly5Ev6+1s/Uymsu+0/MV5JWx0cUXl9Vqer0DSDw1lM8eHlEi13iAC+vWzdv6o/o323w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521843; c=relaxed/simple;
	bh=Yve1y1r49ecQDnwvQsVX/ck6yFvbc6vKX1qjrxYEKpI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtSegItn0ew+Jx/OX8XXVuvYCi0KDGbzLeU1GcsItHVR9xdqlgShXNb84uu5ieH6yCZPDulHoL6L1rdzG42yzXCrFHpjukqCXhrrldaFJbErQLSBw7K7PZ+6CeNdynnqExzqZnykzVTLNMH8bZX7a+KYMymhDwphmEXNwRHsG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V7sr5hko; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V7sr5hko"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89ee255easo143485266b.3
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748521840; x=1749126640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suszitiSJbZS8iWXXXVjI9GrivMQ+RVo/o+nLw7sB/M=;
        b=V7sr5hkoBzvHJosQbML2fvSaGT8F1aWaY5uwjPFVi73sxMDGwi0WvH3AByv2TZOb8k
         /2yWOtPohAsyoflr0uMYnffj2u7p4ujuqVxt36PQcLKh+retBoJPLEnqS8KvcGfoYk9b
         g2FhbWcDjepAbrUJrzGlQGo0cl1D6Lu2Yxe4jFcbCZydWb8m1EsyMnBk9Yho/9PzQHQp
         8OzMvtatqE95YuoDfyXM/kXDB+2Xg4TnMLPK77oEuTK5MIiRID9z0bi/tUnNy96Ygxao
         olB+OvBVgypYJhHXYpU5w1KOtF0UEeoqWVa+t262MPDyujWyR6QhU6vsqqZ/bUPDwT/g
         /n8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521840; x=1749126640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suszitiSJbZS8iWXXXVjI9GrivMQ+RVo/o+nLw7sB/M=;
        b=wD6J8XPTalC4UiKajvcmqh8y4mwuBiyAqoNv0qrLan84iUbROLPqRJY9KCJBztzzdV
         eUl3sKi/UWIyimJTHrdCjer7+PXHFWaig5q745BRisMuiljTH/QHSjgARgbgFnM6DbPm
         MJk2OgR0cevg5TMuNvPcxBUZff/PDODBErIKmK+CPTZ4rWkPwtHXgwxeeGi6C4N1E5Zz
         Tfg9mU+NxSg529O7ZjW68/N3tBXo8YO5Uacvj9Hn/q+qsa+HaLA/iMZ4qONY/MgkBLfY
         Y1yKIoH2JSgpKhwJObP36XB/+I1y6boJi3xI9FK3yn6HyZ9TIASD5fGSM1y5bHdcw7kr
         +m6g==
X-Forwarded-Encrypted: i=1; AJvYcCXySwACZQJJB2/YGpVJ8j6kjliq8Z0gQ5sAVxWnsumNZI14/t74vbEUwshDKBcnXnmqTgq96L9TBus=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiakbcVvpU6iulTfQFWx4xoC2kptrZzAwK2Jyz/fJNwFz3PTjk
	K3mxroC+wAsVlEndBFsw35czltBqwVcp1ZHMKwZ0p8GjYvRU3IKtj/zkO8DREoTtyKk=
X-Gm-Gg: ASbGncuihiAn2COuSMb8ZJLj5fwxVhkCD3S1WVIVMwujt80pD3O1+VwdGKLDC4SVf9R
	EvTlz9Dhclw9HcmgjJc0Pfg2YCMLp+MZ09pD5Z/m52IJpN0iCq3/40F8aJ4ZR/bIGl+Z0To16w0
	ZP6Y8fmajwPkpaxqz4Ja6h03vH9j8NAuHLWiNiO6OKa9LU0lEm4wtSIhIZOhUzvC7DRcXG2iErS
	0lZKtZp31OHRqU9TNA8TQ4j2uwk0ka20NIe0KmPDeq8zThXkZ+txBG/AATPJJkZQY5iHFJj/4OB
	AidjXbEHHjTUECfVvFASXLzdY7qDegXnq3iR2vhonCCIG/6C3Kz2Fvqs54aycojy0QsliNik3uL
	XewE4oGxb2cAjDF2DMzwKog==
X-Google-Smtp-Source: AGHT+IGh83QJllCl4ga2r5TeFVA+yFVEjbebpA/nYkqIF9yNbUhm17ow5NrnSrfH88Ym8gPqVxFW9Q==
X-Received: by 2002:a17:907:1c21:b0:ad8:adf5:f7f2 with SMTP id a640c23a62f3a-ad8adf5f9camr383908066b.31.1748521839767;
        Thu, 29 May 2025 05:30:39 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d850d88sm134258766b.77.2025.05.29.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:30:39 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 14:32:14 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v10 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDhTzqMLM5wR09y2@apocalypse>
References: <cover.1748516814.git.andrea.porta@suse.com>
 <2025052908-goldmine-ramp-b865@gregkh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052908-goldmine-ramp-b865@gregkh>

> On Thu, May 29, 2025 at 01:23:35PM +0200, Andrea della Porta wrote:
> > *** RESENDING PATCHSET SINCE LAST ONE HAS CLOBBERED SEQUENCE NUMBER ***
> 
> Then it needs to be a new version, not the same one please.

Sending V11 in a moment.

Thanks,
Andrea

> 
> thanks,
> 
> greg k-h
