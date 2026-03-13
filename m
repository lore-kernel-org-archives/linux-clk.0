Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552D32ED32
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395055; cv=pass; b=cebUe4D2fMKPDu9sIuvKVfrbtb2Y0S7ZpGtfYIJt+GyUrqMztuQrT5uLt00sCUFyqXkj8BpxWDlu8CmxfVjw9FJkMSk9bJliYGWTnHr+dUMM25POHqO3fWRr+o9BWOxkrFGWMiOMXcXHX/D8sfyylvIMI51ZW30pxvaqpu8TBX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395055; c=relaxed/simple;
	bh=a4PkyDJIX7KyCPscZwhkhXLXTwGONJMI97/AnswuOLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNhCfYu0te5rT3smnSILya2p9pwPy3GU5pH4Ig+dcchzUVoe3+9YFF0n5bnpzrX9fdLLTbhhZwUCxU3LowfDL4288M9pgNkk/E7BsS1yptsPn8gqra6kmYKFKvqtFiGdqrLLXc8wBOQzqvBkb10ETtKPAl2wl+BeLe2xNH/xEFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVJB0EpM; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVJB0EpM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so2670126e87.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395051; cv=none;
        d=google.com; s=arc-20240605;
        b=eX3wNSYClKZLtH+r80Z2Ihx702PYJ3sfv8xM3HmMLbJjEmAYiGEhVfvIB98g5AooSu
         TO8D52YbRWptVWA7IPjs+ZRTGW18AB8yY/mTOHAZfrtcRk80sVTtzrBksJl84TEfHeBd
         su8ov1R5SG+UcA6deMziKyS7jF+irHebO6bmhm0XK9fvyJfAhj+VfqMOq2PMthbqwYQl
         1dDSnQXIqqVPgbPcjWaGsBEU+BR2pEg4TF9YN67AzFzE6aUnTVuN+rgbP612X3jbRDuT
         3V6OVYg8h1UpePEMqK0JYLs8gck9HisI+WKm+RA37n7Ffj5bG/R8QOc8cOXJnPWqcgC0
         5hpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        fh=pTCEMZ3opeHdfw6He5N2pYCKYKS83d8sWJTTqRIDv58=;
        b=LrL4BCs6Qhbnwd0FFvIOj3UbDfNHpQFQCCWpMErrOogfBy1bB/JH6AGkun/N4Cq4hh
         5mrq3mX3ceWy0IMI9fCb4h9ysPl7t3lZa4NjhIhL4PCLqWcdl7LuSTBkMWWTy+2V51DE
         bv9t15Za/7hz1ZQ0YGIVet9i4WdLei2tJPNdPTWP+TLbXI8ZYsCRB6yJGJocXNXYEwzl
         q7+ddGq796FTvgUx1m9/C2psPFt6xpviR4OkXEh0rlJBFbERt9NThTXZkD1EtXpa8Tdr
         YMUHUATgzmpyH1/uWGDFqVcz6eD1DnUZ/xyGKgLn2S+Pt41Be34smq7M4sfNaE7wkB8y
         Uzaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395051; x=1773999851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=CVJB0EpMEVa6sLzbpbpZgC6oxzg2jOtTdosOr5xZNtsl8bsqrxagaYbJB1fdwaFsDi
         MU38WYuy9AWHvdgCpCuHaIpr0k74xYGQOeELdWDSwcfyzs8cqYkIXiRIRrqyxiibpEVP
         wMrz3HxyzbyPSSjmSzWbKbBJgizyZo+BgjwH4r+2CXA44MTS6E41EE0YnfUJRp2yUitr
         rl9LQ9jslbZWwEoeHXtCnBIpFBQl7bMUoyyvJJ1DVrzW8G12l73vTupZQjGfuJkAAf20
         jQIIgy05OQGFnn5ib4SoM+EKD7qPNjwSuIvoucoWtcAxJOQaShYcNfKbcoRIEG60ZMKr
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395051; x=1773999851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=OXSrGntga9O/ubcTWbrLSg+EvE88kR9L0tOwqzgfoZar99GfLDeId1OssuYSfz8vy2
         jRbop07oqqDOdEe5dwjhvseUMXJ7APuZcET4erVDBS3wBNOcyU74mpIjLOp/+16TanCS
         7K4CAkJh27eAL6A6XjCkdTODUOA71r9DDoCOYctk1hF1zsO7Nn9GboR/3ag4ulZraD1q
         7HnO45htGfaRse+gyXvRMmwgwoZau8zj/uws1BKKKPXeHraqIL7uVlftz5i2ritT3Uaj
         QXVcJef/qFHmQpkQZ8WJW1VF9uHw/WhAwEDPCIjJNWKafCrpWGH4rvD6lMxHx2OrUF3Z
         fOsw==
X-Forwarded-Encrypted: i=1; AJvYcCUHaYLwkY4NPM33sGGAa0+UFP4J5ParGyvYdxjkjLVWqL+MOoGbzuSJBVqa5/SX9FNUckICVuBWz20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnQsIx4dFb0BR+s19QMbuMyxRzr5bvbHX6uXvQznDhxuWLah8
	bDLB5yxTOGGcVvjDFVXk+nHxIGQBgDhxs6LNVJP8O7nhdiCEIBFVD9E7ipqTb7XRzqbK4SqBhaA
	U7d4IU6ElYuaqIKA7UAwEMXkvl9lZiakDQs7aHfdmfw==
X-Gm-Gg: ATEYQzzQgVdds+9FAqNbGaMYyspWEQxpaUXeIRgPAh7624sEVjMsDpki5yXaRQl96Bv
	wUSyJra7qFSR+a76241RMwkSsEwWSGls8ISaYqmvXPSQt2HWNj0bftKUZtN9kDuu5At2ebhvWbP
	DxVYCMI5XBshdsQLn9GrNVJQhDO7Cw0x8bCQC/172sEYT/N9Q2cVAeK2YeZ7Hb4LxTHEFZdj5ig
	1ZszO0j6GCuw+6g6cswkgugDgMgQbi8R4DDo+65veN1vI3f2uva13ymuoCs92+eF3V9Otl+HFNk
	zfwvGPSM
X-Received: by 2002:a05:6512:1589:b0:5a1:381b:fae2 with SMTP id
 2adb3069b0e04-5a162b0d32fmr863539e87.33.1773395050576; Fri, 13 Mar 2026
 02:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-3-herve.codina@bootlin.com> <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
 <2026031242-debug-aviation-19b8@gregkh>
In-Reply-To: <2026031242-debug-aviation-19b8@gregkh>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Mar 2026 10:43:33 +0100
X-Gm-Features: AaiRm535RzzFrlMRqNsLHd1XM8yzn674dd-38MKB2CsmserIvJfHsK0fUYGtRYw
Message-ID: <CAPDyKFpX3A3r4s72PNjBz5QaZUsq1xaGhn5vXwegue7Tyh_Zew@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2026 at 16:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 04:03:42PM +0100, Geert Uytterhoeven wrote:
> > Hi Herv=C3=A9,
> >
> > On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> w=
rote:
> > > get_dev_from_fwnode() calls get_device() and so it acquires a referen=
ce
> > > on the device returned.
> > >
> > > In order to be more obvious that this wrapper is a get_device() varia=
nt,
> > > rename it to get_device_from_fwnode().
> > >
> > > Suggested-by: Mark Brown <broonie@kernel.org>
> > > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aY=
SV=3DiEkKPNbNOccYmA@mail.gmail.com/
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > FTR, one more user of get_dev_from_fwnode() appeared in commit
> > 9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
> > in reset/next.
>
> Ick, that's going to make this hard to land anywhere.  This is a rough
> series, perhaps it should be split up to make it easier somehow?
>
> thanks,
>
> greg k-h

I fully agree with the above. Renaming the function isn't necessary
for the $subject series.

I suggest we simply drop this patch from the series - and if the
renaming really makes sense in the end, we can deal with that
separately later on.

So withdrawing my ack from this one.

Kind regards
Uffe
