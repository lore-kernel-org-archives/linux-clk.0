Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4228382
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 08:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038670; cv=none; b=HAhvqwL/XCmQ6Xpml7ljkWzbCADzyAc7pmZCWMtf9/GTdVwWUetRjWyejFrEipkG2TxH9GUU9bKBKNcHG9wxiZB7glwtEFRxJtnU3wcON6nFr4vZdunEJhEdhx/Yzwz3jtcSJPt210MiQF3cAFEMkJLdOBpZH3vVyQZyVeqjpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038670; c=relaxed/simple;
	bh=VbIsCmNofx1yYvLRGUCQKtW0w8/8EizRNsmeIZAEhcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKgJhaMydGLo6jA1LoE89Wv9J1/jhROgKYcWkH8RTxTiaO6QAZ15J8PgSuDPU66zQ6cyaqMk3dolE2ilQtvDKvTfqNA/1VEU7vaLUZDP5cPKMsdxbMBf41hDfqNptz7z0pkuOA0oRahfHD9sjkZLNEHb0rYviQXsYoMQGFkO1w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=N987vsIX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="N987vsIX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30c35ac35dfso3019083a91.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 01:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747038668; x=1747643468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzzZU6pvyYy7YIZ/GFIFCMgtFSutDNrqjC/VQVHvmcs=;
        b=N987vsIX6LpBw0SS18D9yiW/8DRwzA6CgPE+ns/F5ohGEQ29zi6a83pTaTqflqioeG
         KS+Fak6H8zfA7f8xR1JhZHXDdSP8xAbqUtZAPre+sASSwZ+9AuLXYHO1XIHeZQLbW9dg
         zTtjur3pdhurmiFcWOfeWzznqU6/cvXmTsTZDb9bkIpZrfsBX7KOPeGZBN/czeZyaGne
         dU2ArzdeEJFNNXudyH+HEKMC2NZSGbRX5rFULJWFkmlR0pbD2O9axXYMeDF6WIBJp/RP
         0/yJayE3Vnk2CILa7XIFZsFHwHIZfMHEk2TiLj4q+ZcbyWQeL+329VBwyyjLmy58J/+f
         klgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038668; x=1747643468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzzZU6pvyYy7YIZ/GFIFCMgtFSutDNrqjC/VQVHvmcs=;
        b=jy7sJtBcKTSdWUiB894bofu87q0yNw+TsKzYnv8fmPrAmBDrFTiHA5tjJQL4lVlX2D
         a9gvyInA0/yQbjcqqqBfxbwfv4xq/Oiz9ofKp7HoImUPtotRKZvlEjbD4XgQnaEMHWzA
         qJmC9XIRv2SYNRd0tZ0fLd3LN7e4gFO/g5mZrMLSWkKqOWfTWdz+iRUjMLW9LOwZrEa6
         RdSxQq9jjupBbBwb1FxiE8M2NW0mmHv/cvjachpI9Qf9ALhQ8XL8mQ0TwOlnY2lcwnXK
         ImMFbRdkssntye6dEjr3FL9XsVa9xOq8XFo82hegyXyMq6cahbvpb7st+OFQADeZ+Afw
         habA==
X-Forwarded-Encrypted: i=1; AJvYcCVnUrh5bCLs+Gg1zW4YMB4EPbBxnMOxZ+rublzNx2Sq+EHoTKPUF3nhI6Rfj8zPxx+Br0ExS/+wFag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgx3J//Xjea8vxref7REascDjLUs5aYaC1S5Odov+45OiS72q3
	nNAhvk1x6Z36vhBwvbihx42jYuzIAjfqn9+D4hc77KXMfK2Jc0hfsPLVj+H4A20=
X-Gm-Gg: ASbGncugQj4eQpnNhJaKv9aFfpqbD/1Zow1UBKFQlzjOjnAJSgz4BAqqzh/fLBZeFwa
	qtNQVXFuIUuvzZeKtik2zMQ4h+bEIq/hPtsR02FrfaKH0Qs7Wn+pPyLes3rekZcKG+bX6H/cbUo
	hW3pd+/E4Jk9M1djmBHAALZ9R3tac4uVQA1a7yHbzjOsWQ6j5klCOMY7rPi8gwnaCTo9X08AYNv
	LBo/IuSNGcuS2pt+8g+OdMTXFvksq9XvCvxL61HPHTA8NA0GM1JrtARuQWNgvAdNcDXp5Vid0z0
	TsfXXlC05syxe42YnXENIK0yk/G6rZIvcf5p22KFuI9DV30fOQjdGWZperk=
X-Google-Smtp-Source: AGHT+IGHNaTbk9KHcwLFc1JRN2apw3Jv/AHhjSrIdSWvDZ8yqVhUcJckbF0S8Q0geEc46Wby78RCbQ==
X-Received: by 2002:a17:90b:3945:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-30c3cefe5c1mr22528948a91.14.1747038668235;
        Mon, 12 May 2025 01:31:08 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe21a6sm9135565a91.31.2025.05.12.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:31:07 -0700 (PDT)
Date: Mon, 12 May 2025 14:00:54 +0530
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
Subject: Re: [PATCH v3 15/23] ACPI: property: Add support for cells property
Message-ID: <aCGxvuHwd7TzfDOS@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-16-apatel@ventanamicro.com>
 <aCGgZPJUQdAnWa-z@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGgZPJUQdAnWa-z@smile.fi.intel.com>

Hi Andy,

On Mon, May 12, 2025 at 10:16:52AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:31PM +0530, Anup Patel wrote:
> > 
> > Currently, ACPI doesn't support cells property when
> > fwnode_property_get_reference_args() is called. ACPI always expects the
> > number of arguments to be passed. However,
> > fwnode_property_get_reference_args() being a common interface for OF and
> > ACPI, it is better to have single calling convention which works for
> > both. Hence, add support for cells property on the reference device to
> > get the number of arguments dynamically.
> 
> You can reformat above to make it deviate less (in terms of line lengths):
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects
> the number of arguments to be passed. However, the above mentioned
> call being a common interface for OF and ACPI, it is better to have
> single calling convention which works for both. Hence, add support
> for cells property on the reference device to get the number of
> arguments dynamically.
>
Sure. Let me update in the next revision. Thanks!
 
> ...
> 
> > +			if (nargs_prop) {
> > +				if (!acpi_dev_get_property(device, nargs_prop,
> > +							   ACPI_TYPE_INTEGER, &obj)) {
> > +					args_count = obj->integer.value;
> > +				}
> > +			}
> > +
> 
> > +			if (nargs_prop) {
> > +				device = to_acpi_device_node(ref_fwnode);
> > +				if (!acpi_dev_get_property(device, nargs_prop,
> > +							   ACPI_TYPE_INTEGER, &obj)) {
> > +					args_count = obj->integer.value;
> > +				}
> > +			}
> 
> These two seems to me enough duplicative to have a common helper:
> 
> static unsigned int ...(struct acpi_dev *adev, ...)
> {
> 	// define an obj variable?
> 
> 	if (!nargs_prop)
> 		return 0;
> 
> 	if (acpi_dev_get_property(adev, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> 		return 0;
> 
> 	return obj->integer.value;
> }
> 
> Yes, the nember of LoCs most likely will increase, but the point here is better
> maintenance experience.
> 
Makes sense. Let me do it in the next version.

Thanks!
Sunil
