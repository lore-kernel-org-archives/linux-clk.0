Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B0E2D0C8D
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468798; cv=none; b=QPM/z6S2670yGuRsJM+v70mdU4KC/t9EDre0t7F++HgRo4edYujgRwOGR9Zecnm0xQtP6bBhqb4U/4Lt+tjGWfFjKApw8myDq/ttnNTzBflVN+FP+DnfIRP6gIwu5/s5tfuNaVfrFpKouuHuOtOVbKDOtkUAZPrkort1O7kWowI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468798; c=relaxed/simple;
	bh=68MAtXNRMrOlaqudDNa6dyhIXhKNWKCJp2ZktqVgKfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHjkANctLPs/di2k4568r6samly48/vpkwncGzgcp8zhSZUFrjPlHZKrdTGrgnGp2Cbv98frzSkaz7osPA8/hIq8upO/Q6CjLMZmJEmkGK0arTMYukLx5UfJcLKTZhFwVp8gO9RVExaYQdf9+maeur304BhE/xwVX8Ud8WzW0wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mpA7MfC4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mpA7MfC4"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23633a6ac50so87587325ad.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751468796; x=1752073596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuxrgWn37wvxnmqKJavpfaOGptqxe8oR/pHOsdwVSXg=;
        b=mpA7MfC4Zt8G8Q2vqphc//2YrzrTFQPdfBMtdqUOf2tQ52hLWPE9XbULaLXAEquHkL
         uxyMzrOHQusOEk+1K2Ll635NnZ5zW/6ZemPEldrFtwIvArAy5EiwHANlxkeovsIUdjr8
         N5bfC2QAhN629IM7vgormxDklMpVpdalPQEcg9wYZzJXXQtKGvHUzS+sy//68RSJzd8z
         Da2jqfXgxTTGxCZfNyv6j+QnoEuZyqpnFCvOqA8tDRWh9SRqHbOy8TKGubZsr0HIFEdm
         ctJ9lT3tdw3Qja8sFzifAlDr1aeTisM7KHH3FDieuTugZBSH33MAVuINYUk1V5uogTeu
         O5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468796; x=1752073596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuxrgWn37wvxnmqKJavpfaOGptqxe8oR/pHOsdwVSXg=;
        b=rKlkc8zdXXwvMAKIgdeq5KVtoZ7bYVBqvXxceQxCWVX4Pn2D9eiwi4WLXyG7kcNBZW
         djBEPK93STAx77MB03uHZlzRkTht/d1N91Sg5c1tAYBOmxpcyNHoA9cTQbONTIo2/qKH
         GX5xM3JDIHGWaVXZc5BsAGbrYZsXF75MavCGZFtwiwxrXpYNQ8TC9Bw46JuNKAI+zzLG
         yUz0gzViQhMHiuoqiLxoLPd7yeJVtCgtUDhWUlC6x8H22D2+klnyilb9qZHGlSGnolZc
         8lQWQ3TgqPuwdLgT9VEMnxHXEMyvniSauxrECRrJKhsrIHOM+pjfeA5tja27WvfGgG/s
         VrNw==
X-Forwarded-Encrypted: i=1; AJvYcCVEACm4xfz8DOPIkTGzmaEAQuLNUaEAtSYeLDnjxvJrILR/cDpXXmNMvrT4Vza/eC1cF26HYcj14xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUgT4UAmT/bJIhD/V5NY/R/2KQeR1MYg6vW2oZ83laWB6xTE/
	DJDc9obasH5yhDWQGW4J1zJ/BO9OEmXZN4tJBgE1+61CsFOvX3rUJxv415iT+Ml55Ic=
X-Gm-Gg: ASbGncsstG6xk512JFtngH4v7OGpEBjkuMVU6bP19w+J+6hTwAn19WjY9vzpemAavEJ
	frn7X5ZFqrRZnKnYul+6uBRZc6By4v7SJBK7osKG5wd9+26gr7sM4W2KBldy2bRX9APExhi95de
	D3PTyh99arpNoXMIYz5S1k0ThoSliuCRZtnQuwEp3g2Vy1uS4DUSB4PyVjk4BPIdMV26Ak/f1tI
	xqVjSPki8hd+AOQSz0v4OXyubEqR3918cvuWV34wlOjwshq4+OIDa8+eixr3nSxgcuxrrcQqbqA
	v6PsXWLdO3E6N//N+0HT9oI6YwBdgkii002+VRu+i7YlBZrTm02uwdfOkfM6eeC9IW0X0A==
X-Google-Smtp-Source: AGHT+IEayU19ekj4WiD0uxOsXBOzhuBGyVO7ozD4bXpw7JPLUlbTFpVZ7FSEPPWrdW6ZBL27rOJyQQ==
X-Received: by 2002:a17:902:e78d:b0:234:8c3d:2912 with SMTP id d9443c01a7336-23c6e4e2a1bmr41479125ad.11.1751468796094;
        Wed, 02 Jul 2025 08:06:36 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba530sm130521215ad.200.2025.07.02.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:06:35 -0700 (PDT)
Date: Wed, 2 Jul 2025 20:36:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGVK7NxRdDIGRzNR@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
 <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>

On Wed, Jul 02, 2025 at 02:39:30PM +0200, Rafael J. Wysocki wrote:
> On Wed, Jul 2, 2025 at 1:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 12:20:55PM +0200, Rafael J. Wysocki wrote:
> > > On Wed, Jul 2, 2025 at 7:16 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > ...
> >
> > > >  static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
> > > >                                           const char *propname, const char *nargs_prop,
> > > >                                           unsigned int args_count, unsigned int index,
> >
> > > >         const struct acpi_device_data *data;
> > > >         struct fwnode_handle *ref_fwnode;
> > > >         struct acpi_device *device;
> > > > +       unsigned int nargs_count;
> > > >         int ret, idx = 0;
> >
> > > > +                       nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
> > >
> > > I think it should work the same way as it used to for the callers that
> > > pass args_count, so maybe
> > >
> > > if (!args_count)
> > >         args_count = acpi_fwnode_get_args_count(device, nargs_prop);
> >
> > But this is different variable.
> 
> Of course it is different.  It is an acpi_fwnode_get_reference_args() parameter.
> 
> > > >                         element++;
> > > > -
> > > >                         ret = acpi_get_ref_args(idx == index ? args : NULL,
> > > >                                                 acpi_fwnode_handle(device),
> > > > -                                               &element, end, args_count);
> > > > +                                               &element, end,
> > > > +                                               nargs_count ? nargs_count : args_count);
> > >
> > > And this change would not be necessary?
> >
> > This is not the same check as proposed above.
> 
> No, it is not.
> 
> It just makes the function work the same way it did before the change
> for the callers who passed nozero args_count and so they might be
> forgiven expecting that it would be taken into account.

But if we do like this, the expectation of
fwnode_property_get_reference_args() will differ for DT and ACPI, right?
I mean nargs_prop should take higher precedence than nargs.

Thanks!
Sunil

