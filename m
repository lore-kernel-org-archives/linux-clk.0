Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9E21FF32
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530537; cv=none; b=Kj3fb7NuBNs4WxaQ6lMjA71ffHrrTOET/6NJfK7Q/upsF2NwrKXe613OkkAiDEsdiMAnPyTel9AsqaRHgWfe4gtuNLp0EyWp66sVWEoPQ48gdK8qagonVPt7qfnQ1U7qKjEftG1BO2YTExfmNJOSDlGDJcfMGEslvnRgAxsklfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530537; c=relaxed/simple;
	bh=CAzDFjhSAzbmD8Txu7d1pGievjGb5rkrE7JNed1lhig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnG/jrTK6NwS6E53ZxXjDft5BEx75VdDcs+NvIV46Nli3W5TQrzpgT+Y/tG31bQdGF6BKGff4zXXeW7ldzoHrxfZChUK4lsIAOZ/hWZdC6o4tyIcWZWAq6lF0Rutx+pAaMsilB1p8QDiK4lPNyFB5weTZBjQrf4uwhzG2O0RbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jSVXQt6c; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jSVXQt6c"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234c5b57557so46022625ad.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749530535; x=1750135335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=jSVXQt6cLqIWP2AdpnrUhsBreW4p2wU25oiaJN790VwdPuc+ze2tIRIQ7mDrgv6rFF
         uY/yfialTOt6CMMNQiGP1bxkV1VrWS+M0CvGPEHv1hoLmjuu4UbQXch4WTOB4uKXXn/W
         4rqK6PbVoPtqNUgi/1Ytoucsy9MD+ylnZY7NZjQfSYay1/yEGf6o4ahiE24XHg+SUmN6
         6Et8ze4Tz/BNL+qIQgD1qfSrrMmOm3fvD8fFpZUOsg/dtS76F1Yf7XQCOHSKqoO/lpia
         vXtXUBhWdqVe3PV8po5IUOGQqUzn/5NQp9qxvFsEDlfURhM/3wPsVoAFbCfrfQ7DJKfr
         +QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530535; x=1750135335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=LmesHvTh/8geQW/YLUJnzfzkXbAmZlFV0itHIGikW9usL30tNmFBcgd2VXSRYm7TBE
         JDPidSqQQf3cJBOUhAY03nVvQpoXcqblUr6EiXkPydG4DO5xyLn6Xv9exuzwhX7nxTeM
         8wXsL6hdUVpbZiGlaFPnEG3f5LFuPxLnX3v1gfZeQvqeVsZL9fRJP0Tsp3FXDLBrqDEK
         UfvYsPypa+48iz2zWjwZznd2SF2/d9IoEhDfKhasFUj7AYFCAz22lQDl2aS8cNzOECG4
         DM4SP9SSFSrqJNE6Gbuim7CLfbNBHp74znng/n9BjISWg7Hwy7Qb8i8+XHYttj37Fpe8
         vZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2qTmC70uTzPcDmmmn9OhkE1iIw2ziRExyU25MrVjkr0wuRoa6Oq6pCbouF5DOTM9jc1EhfcuqRGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vQjPyZMm7agm6DletUlOMW0XXZel2eRnflnHzw4GnO2OB92t
	sIevNtki/9OvpktCj3fvjxt8Bgl5vfUgWXUYHWAHpBZ1kz039HHoaRGqi0dKMnrsXBw=
X-Gm-Gg: ASbGnctIMZNKwmOK5coMRS6ChvZXX+U4KX/NBFdApuqo7PBO5ojpWgPcTjSKWhkuPL/
	55lw0ue3+qC02nPgAm6S731Axcen+o9IFH9aBuNeHbb4vdGbyOK6scSu+fiYITj7yxXX2oSEZ1x
	RE5/lT+LIMTYfomDhAPRnGoTUuHcL1JZr7CNOTEcHNYl8GKe/WBUxCCqWmjl3XBt0t4gKLeRBfx
	TZdgF8W1JIOv7Kl1aYfga4NXw7x3iqNenPkY4sevhMLQ9zX2fxrAxGfpfE1Wtjuu+0p1bCq9dTk
	l+xpAq+WpeTU3c96yy+bVo3C272IILA+t8LvQkCJ3mpsexihf9c5vpvdliZGcmhvNdwI7A==
X-Google-Smtp-Source: AGHT+IEkTU+gBcq13St9Qw/Wf0Um/jTGbpeL8M59SViyqMxrr/ADp4BVSyewhIKv47GXRKYXDjzYQQ==
X-Received: by 2002:a17:902:d2c3:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23601d2296bmr201118235ad.31.1749530535298;
        Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad3492esm1896875ad.154.2025.06.09.21.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:42:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:12:03 +0530
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
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aEe3m23wIDM1I-AH@sunil-laptop>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
 <aDbuABrlO30TIrx1@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDbuABrlO30TIrx1@smile.fi.intel.com>

On Wed, May 28, 2025 at 02:05:36PM +0300, Andy Shevchenko wrote:
> On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:
> > 
> > Currently, the interrupt controller list is created without any order.
> > Create the list sorted with the GSI base of the interrupt controllers.
> 
> ...
> 
> > -	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> > +	if (list_empty(&ext_intc_list)) {
> > +		list_add(&ext_intc_element->list, &ext_intc_list);
> > +		return 0;
> > +	}
> 
> With the below done the above can be optimized (hopefully).
> 
> > +	list_for_each_entry(node, &ext_intc_list, list) {
> > +		if (node->gsi_base < ext_intc_element->gsi_base)
> > +			break;
> > +	}
> > +
> > +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
> 
> Is this reimplementation of list_add_tail()? And why list debug is excluded here?
> 
Sure. Let me use list_add_tail() itself in the next revision. However, I
didn't understand the list debug question. IIUC, list_add_tail() is a
wrapper around __list_add() and doesn't exclude the list debug, right?

Thanks!
Sunil
