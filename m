Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA82DA76F
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883916; cv=none; b=Sd4hUJ3LF3qlf3dIQjXsjrs17KHplVMGuthKpJ3ArnBTea0wsovUopCsXvgmVDa7LThLuT7HCpZJXj7U1j3xhK+ym2dZltwbIkzMRZM9zghbSqphWj6pE60iyCygJT6Hw5UaZSwl6a69dHUuzq8rP4cA5Tytdz3fRPLUt/8e7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883916; c=relaxed/simple;
	bh=W3gJGhETv1i99hgZ4Qzxlq7+a/rqAi15n3RaJvZubfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfrE0LQvcEoPzTe2Zkrk0Izsrlf3ZyLp8iIewvgqLHsarMvJ2qqi8iGnIboQ9vmhZAZqz1rENtHC13myf2LsFIFK2mqNKBz8p24qAB+pNMPR4Sm+2N72UyGeN9UDqkyaIh443qaFmdpEhUh/mYo1Qj0cmgHHF4IpdllTrBi5uRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WoM6PqKc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WoM6PqKc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67845996252so195387a12.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776883912; x=1777488712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4vBmmJ5gC2QCrFlTLiSjZ3SPsY2SAKP5dBxbzswxUI=;
        b=WoM6PqKcFGAZijsVlYaTV7HUC2SjrXF6WfuOD7YDK++1HOLw0++InBBJO15E0r1t1M
         NsiZ4iwaOijfnO3ZwXs/vh8PMaG8RLBtlJuJyHSjUuWrMpkk5NeD/42ZFUjpZY4kxjbq
         MKMOyi64S2J3RRN8WHgdPOhfI8vw6I3q1IRJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883912; x=1777488712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4vBmmJ5gC2QCrFlTLiSjZ3SPsY2SAKP5dBxbzswxUI=;
        b=pzvnocPJPi5B+FOnzKEFBlBfaWF3j8GJ4aW5txf07d2bHprNHJmqTsYYbX57dWndlh
         N2Reh4mjkxGheIlsYsf+EiRq+AxKbI0yTTz1JQMPaTaFWO0NDFrksyEDfLkWQi095oZj
         8j2U93km7YEnjDlglJ1bN120aETibduQmBiGSCxhsymDNkSTtlsPvLG84DibljJzcI0S
         hs/LrktGYtAn2e0XaofGwpKfin0EoVtuul6/l5tGzbV75KyI8Tn0ClqZmNCDOdi5xY/w
         w6/hVRx2wJSuswRteWZ7t2TkTE0U0XjkY+HDrWmHPQUztYtOof8MO8Xacmbm6y0YGwMv
         z4Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9Cr1Hky+qBWIXIr1aXXBZTmI0nFG5nSS4yqUfB1UBS3jUTrmhQrzGRKdDzn2J28iVmsRnwM7ABDiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgfEiMV7ONGiSpnMrFtAO0cQ4L7O08sNYmZY25aPP9uRQCkqsD
	NNg0/563KVxUgjuBKEq6ivjnPDAX4G3YD/wAbn02FMmKAeVxjPW6DpQS9/Ww3awjwV6MFTtFTEq
	2NU2Btw==
X-Gm-Gg: AeBDieutROTlBK0lF3ZSdHSYWuJHqvHmnFJb1Bo4r1ECKqsabala92/hjYGrYeVZdBT
	SdwY2uKS7FVjtOuDPHWAGrjh60js6HAPaKpd3vq1RRaU5BhNt70ryW3+RW+7BJgZ9rjjGraybXf
	xzWnAzo+/qcVwy8UXrnlZtnUhMsxa4sEbIuiF8tT1doX5aCgVUc/3VImMouZWHgFs7RNuGlkUiC
	hHzHR9YnY3PzD4Fhiz8xsVN8C7shd4EZn7tT/AhfqkyX1v9uvEcJBL9+Z+mZhGJ+epuT4ougnvs
	K8We2V5/IzIhyA++bGDybxo7HjPih+acEWQTG6Ypo3VZ5xUwTtzDSQRUN1OG7ysEuwuEJZZQ9pk
	kw9aKK4ueNpzFZDKie5WzrC9U3/XqklBvFW8U43OEzS4YgiHxH3+yMKuMtxJ4kYwbEwldp7RNJD
	4F2TAC6fAQlVzqdiJ8/vIk0ymAaM6Q+Oi2xBom8cAAzofujv8U+M8vczHvW563D3lc1mOqPIf/
X-Received: by 2002:a17:907:3e1b:b0:baa:a2be:9e02 with SMTP id a640c23a62f3a-baaa2be9e2emr273877666b.40.1776883911920;
        Wed, 22 Apr 2026 11:51:51 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e54sm586928866b.9.2026.04.22.11.51.50
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:51:51 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d43e09de5so3305547f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 11:51:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BqAAiPc7VhSDHXzlNJYbMOxeBewP2pjh6CUWJPJwwHjbfucAbyIrs7QjA27CjYt9X/QPMlpsTxsM=@vger.kernel.org
X-Received: by 2002:a05:6000:2f8a:b0:43d:7a08:a5e6 with SMTP id
 ffacd0b85a97d-43fe3e073c9mr39087653f8f.29.1776883909243; Wed, 22 Apr 2026
 11:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
In-Reply-To: <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 11:51:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
X-Gm-Features: AQROBzAV3w_CPq4qi5veiP_uOv4VWrOsaTYpBbypDAKqTbu6jiZzeNsnLIn0Vds
Message-ID: <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Herv=C3=A9,
>
> CC Douglas
>
> On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com> wro=
te:
> > From: Saravana Kannan <saravanak@google.com>
> >
> > When an overlay is applied, if the target device has already probed
> > successfully and bound to a device, then some of the fw_devlink logic
> > that ran when the device was probed needs to be rerun. This allows newl=
y
> > created dangling consumers of the overlayed device tree nodes to be
> > moved to become consumers of the target device.
> >
> > Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> > Reported-by: Herve Codina <herve.codina@bootlin.com>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgy=
o8x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> > Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com=
/
> > Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.co=
m/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@g=
oogle.com/
> > [Herve: Rebase on top of recent kernel]
> > [Herve: Add the call to driver_deferred_probe_trigger()]
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Kalle Niemi <kaleposti@gmail.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers=
(struct fwnode_handle *fwnode,
> >                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
> >  }
> >
> > +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> > +{
> > +       struct fwnode_handle *child;
> > +
> > +       guard(mutex)(&fwnode_link_lock);
> > +
> > +       fwnode_for_each_available_child_node(dev->fwnode, child)
> > +               __fw_devlink_pickup_dangling_consumers(child, dev->fwno=
de);
> > +       __fw_devlink_link_to_consumers(dev);
> > +}
> > +
> > +/**
> > + * fw_devlink_refresh_fwnode - Recheck the tree under this firmware no=
de
> > + * @fwnode: The fwnode under which the fwnode tree has changed
> > + *
> > + * This function is mainly meant to adjust the supplier/consumer depen=
dencies
> > + * after a fwnode tree overlay has occurred.
> > + */
> > +void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
> > +{
> > +       struct device *dev;
> > +
> > +       /*
> > +        * Find the closest ancestor fwnode that has been converted to =
a device
> > +        * that can bind to a driver (bus device).
> > +        */
> > +       fwnode_handle_get(fwnode);
> > +       do {
> > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
>
> After commit f72e77c33e4b5657 ("device property: Make modifications
> of fwnode "flags" thread safe"), this must be changed to:
>
>     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
>
> With this change my DT overlays are working again.
>
> I guess keeping the FWNODE_FLAG_* names, but changing their values
> from bit masks to bit numbers was probably not such a good idea,
> as it fails to catch missing conversions...

Crud, I should have thought about that. :( Do you think it's worth it
to do a rename at this point to catch future problems?

-Doug
