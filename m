Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C209370D6B
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886984; cv=none; b=FKeFL08iat9tJdCE+pocziLWjc2/X4oi8vGIWcA0V3A79hMujkD2JrAY0zXxvy+mNisR+/y45ZquAON5FuOxJAqGZOxdA9azK7A83hYZn0EvrhHpKAO6dUWkWA9JhhvnbBbpeqi3vB05t1Cgf77UTu19fcduQDj0sCi6dW7FZIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886984; c=relaxed/simple;
	bh=1jDHS3//SVF2/A/vC8oT6/lwq+kdzpM3dPjKRF+cWNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1N/EZa4IR59a17S44gKNTQ2G9aNYpMFY1zF/OYjAmuAL1UiSWoazCt0Z5SQF8BXGozA9F3JxUNAsU5HSB3UcilHNhn1VIZLOqnV/c/vNMC6/GPp6FXJFq1oLtb9yBTpC47egLcuIIXdEecfmrum+eCe2ukNl8fktW+NJhptKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pn/n1kzH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pn/n1kzH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b936331786dso762499866b.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776886981; x=1777491781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=Pn/n1kzHo568pFIr1V3yQUwnjJy8aZhDNt2AlJFjU2saAluu4LcgM7YBZU4NCaE2c7
         JtNADN/Jf1nbQ8eUtX1qacjcV5XUkmFkk6VMJGi6EQcw+H53ZsQ5oarDWtAkJozWOdGs
         ZMlZy4UpiHnY6OkYumPjRLA8pLBX/wfQaG80U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886981; x=1777491781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=AQwvOOFfL95Drr5jsEfCVLNOFBa/sVR23O9AZeFVnvg94d7H8JdnNewFKb6w2PPuCP
         gNLKfQDEnJxKvjZH5XNSK3uoXZEMzNX6xhUo0UYaJdYynFUp5DT2S2J+FWeXPAypUcA0
         UUbivd6EpJK4VNQSAq+MBo4rSIRFtcqKD+fQuIy8DzI7G8HQxB5NKsmQ/z85if6DY/Qk
         lmJ0WEjXoksaZJs6tS1Kk1no8YMSygH7h+1Qe/+Z1ovaeQ+UBXt4fI8KfshNN8so5U3r
         BcmA47Iva/hOXt7XUjziS5dCZkhwZk8EVFEOPQBQ/WJaHqH7S9bR5UXoAy7HMRM6EBEv
         ZM2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9KVbq1/Izz2b6xXbA3XeZhL54SWy/8K8iB4YlAQi2QVmndkzMR87+HMocFqV7+Hhtja/IqBAh35Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgRHpWBqsz5CuzPd86WP+wRHKoIpr9LhDwjEXgGm2KSxdu6OT
	/6beokczh8MwmabAxC+B844rl0jC+WcwV7FANGsN07y4GTnZtEAaIGDXr54ds61y45c7vGiC9xi
	vA2Wsl6l6
X-Gm-Gg: AeBDietgmrGNO3zSaZaeCnoX7/c1lTWrOcnVP5t1Y3x6huUhOA5Kj8vRSBbv8c7kdjx
	/jmRgkx57KDdu6QVWsM6/R6Ujo+TLynuYwKnDXYZalGt6pGhNkPA2NEVPgtj3VTpBx6EdOi4nMu
	TRqpieHKq7Tx+T2lHFo9YFiIClPwVGRnlhH0jmKHBdfSwB6i0mj/+hhHLkxkgTBZqUbsf1up4ZF
	ABHn54nqMlCMge+kGXbUd+knkf7WBV/o5+VlMkW44upP20GdN7k+RD7U12Kr2nIee0YNavex17T
	vjS6rfR2q7uDUyc4EntNQ+oh07tPqY9rPRi1YwBJTeC4RTQrkey0c86e5ZvwVrSiKzWLB5/g50/
	4iker0CAuLUPCQCLV8wQGek2P/nKRIEM3o6ImlCrk9H0PrpDwwGc1qAQQIfAmfORBzD16nvuBGS
	DVVIBXoQdyjg2jw9ImJQBBqQF5QUnsj2SkYZN88vADqQtLqksA7HOoiR1SaSCA+eiWE/dnzwos
X-Received: by 2002:a17:907:980e:b0:baa:13eb:86bc with SMTP id a640c23a62f3a-baa13eb990emr393775366b.1.1776886981089;
        Wed, 22 Apr 2026 12:43:01 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba6366452c6sm447776366b.11.2026.04.22.12.43.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 12:43:00 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so666542366b.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 12:43:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OJL3zjs8AQVeq6ns/PSTKWRap+Qe3mvrO6uLSjHTKRFhjizpqW5Qlsn6D/yy3s4rF/zODPeiHn5A=@vger.kernel.org
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr122645615e9.27.1776886533988; Wed, 22 Apr 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com> <aekg_IELc65BFrWp@ashevche-desk.local>
In-Reply-To: <aekg_IELc65BFrWp@ashevche-desk.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 12:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
X-Gm-Features: AQROBzBA2DSdR2HBaIYSKp4MrG-iWYSiPDxUw6OYCOPyJYNxN20LzPXgyZNheJI
Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Herve Codina <herve.codina@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 12:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> > On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com>=
 wrote:
>
> ...
>
> > > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> > >
> > > After commit f72e77c33e4b5657 ("device property: Make modifications
> > > of fwnode "flags" thread safe"), this must be changed to:
> > >
> > >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> > >
> > > With this change my DT overlays are working again.
> > >
> > > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > > from bit masks to bit numbers was probably not such a good idea,
> > > as it fails to catch missing conversions...
> >
> > Crud, I should have thought about that. :( Do you think it's worth it
> > to do a rename at this point to catch future problems?
>
> You can try locally with allyesconfig / allmodconfig and see the outcome.
> If there are missed cases, and their amount reasonably low, I won't bothe=
r
> in this case.

I believe I caught all of them at the time of my CL, but the problem
is in-flight stuff, right? I think the problem Geert is pointing out
isn't something I missed in my original patch but rather an
interaction between my patch and this in-flight patch.

> But for the future it's kinda rule of thumb to rename when
> semantics changed.

Noted. I've certainly done that before, but I didn't think about it in
this case.

-Doug
