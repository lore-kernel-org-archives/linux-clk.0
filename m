Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC803115AF
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900752; cv=none; b=rSEJRXf3es9BjDiSnQHJT45y4OZ1hL2wRLUAaM5scO5ltSlF/eV8hKOYpPlGIYbAVaUHeQ2F43o04je5hIzHDyBfZ7i3Si67cGLkREzJdIWEwOniQwVReZhtcfNIgxFf7OVqzKIJWqBS7rIIIAoNiQoOccWYen2VQAChOIWDHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900752; c=relaxed/simple;
	bh=NYbl8HJcgb3R5SVJ9GXGI/Jq2+mOIag8w0HzHBPHPoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+STfLx5nrawuab7FYIFuKRGgZndpzhbQ7zWlnjlr7YbvH0KSt8TddoKNYgpKjN1nMzWXDTWekcxmg9QRwlWtXD8QCIWOAPE5njtEpg9rZNHsdMHvqPZmaaKqPl7ZQxli+DZi7T3L8zUaFGgUK+ti6n8vaNcJ+lPR1mf+7aObR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso1256589137.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 01:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900750; x=1762505550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQVVX5c2GB+a2QgL3UYe6DKU+bmVaydohzEFkpxq/1c=;
        b=NK573R9AYVVlFv3vhLjfGMtqdfjLG8Mv6pHnbAL2Qh3W6/Xyp7V6NIjiZ5pu5insOp
         1HhJ/XOSMY2YPRgs0LSwlzshUqb4TDkNR89xxJFJZ0ACXj6oCN4w8wn8dizMYVz0q/rS
         WNa9tgsoWqR/JuXAxRnUD9uQkLR3Pax44QGpsI5p1raFrJIkoP1xhDjIF7yqQ5UgHnVo
         BeaDHujJzIU6Tc2A8vnac1Z4TqMGSd4U3usHmoUUgQX1n8mlMG4WvSF7i6vjVs+G6RmU
         GSMO09Uo5Ma5yyOrr/LY6rj7Fif1YAvELK1FBSn5QxrYObmzscwOhAwWbYSE7PxjUzFQ
         Z8ag==
X-Forwarded-Encrypted: i=1; AJvYcCX5yF0/glBlKJhnSubEuSrZ+MZEFN+7z0c5U8rxOJdGzyIql9Sm4k7VQTaxlaEFa+n0ikxhpu3rXug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRHfjVU8XFGVXVmmUoLpfbUvuGfWrX6QjgA2Kn+x/dgQ4sTIz
	p68xpEfLPqu9TR+wI0XLqbssRAzeyefoAzbD6a4HarY0Ded9wckBXDA2PXQYBlje
X-Gm-Gg: ASbGncv5KYF71us8cvtRfI1m56LJ/tunOrMkoWKETlCTdNHNyxTfuJOCv5bIHRU8tPj
	19R7VsV9JCffEZ6a7shhNZGm8BxW3t7DGp+iopNeQGXw2It3TPpR+OHOmb5vtPRT4RbK3mKkGrs
	w8e0QMikva+f341c9HHaQy8t5y8qAaV4qH9PKPoBFmNBHtWqzSFcPKq10mXupw1K3mSsLfNVSnj
	U4j1aIX5GC06Ap7VbP1pv540+tIj9LrRP+VBxOvF+LcQ5RD8NR3eKcLir0k/xDCdcyGVGglbm5w
	tm0/DuofOZD9Z2VPh7lsZpPaOwxhR9kpolcWxGFV+SHSwbwlj6CthLEsz45O5/CJ07VZqgTs2wY
	kuFhPncBFNpBZNsSkmv4XopI/pJeCltUFu2K/OHRsk0hcs5b6adkdvA/nV5FOksfODLuqrJw4Lq
	F2B15s6lNV+pWdkQG1R1KOWnACArfS/Y7mV11jww==
X-Google-Smtp-Source: AGHT+IGt4IKjhXVko1Oo8KvoKbCXr6dl6nofbRmz5DUhX5HTsbkxaaZAfE1lqDR1oJiKiXh/haJg4g==
X-Received: by 2002:a05:6102:f09:b0:59c:110b:d0e with SMTP id ada2fe7eead31-5dbb12f5b72mr671874137.22.1761900749612;
        Fri, 31 Oct 2025 01:52:29 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbb617acf9sm404644137.3.2025.10.31.01.52.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:52:28 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-932c247fb9aso958791241.2
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 01:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbPbwHw4olim0w09bG7VLJtVVkdpVqSXsXx/7yytrrt7PUfRBya5YFJDSCDG9PrNlntH0hzTZyjbE=@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38c6 with SMTP id
 ada2fe7eead31-5dbb136ecc7mr717064137.37.1761900747573; Fri, 31 Oct 2025
 01:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-6-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm5vGlc5XXZic8RvnXrZNNcCRnf0-7M9Km7uh4sqx0Aign1FjKoX2MZmow
Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote=
:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
>
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
>
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Platform Bus
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  A Simple Platform Bus is a transparent bus that doesn't need a specifi=
c
> +  driver to perform operations at bus level.
> +
> +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> +  instantiate devices connected to this bus. Those devices are instantia=
ted
> +  only by the Simple Platform Bus probe function itself.

So what are the differences with simple-bus? That its children are
instantiated "only by the Simple Platform Bus probe function itself"?
If that is the case, in which other places are simple-bus children
instantiated?

Do we need properties related to power-management (clocks, power-domains),
or will we need a "simple-pm-platform-bus" later? ;-)

FTR, I still think we wouldn't have needed the distinction between
"simple-bus" and "simple-pm-bus"...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
