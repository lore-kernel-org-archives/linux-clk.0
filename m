Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E73D324B3E
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616854; cv=none; b=J96B2G440MCeMLK5tsU5IN6fmZZV90xBClQ3DRUPWhTPeOR1zY20gJ6iGhgtyVrWylMlR+w9Rb/4st8DU1GPGQpO3/yjbQedJhAzZxjf9wiR1j0u7ioLjmofectqZQco/tbU9p0spEixfhNmd3EET1jRgBLw/pQEWcSIYmkyMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616854; c=relaxed/simple;
	bh=Qljm2z2l5uF20OnzQWwo+pu0aWLXVl3TFALx6BWruW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXqPlNIVBhxuv5jCI1cnBvw8Qsdn6uaAAclZEY0A0APG8O7F5Qg886Xl23QXB6lyL+Gty7Dm/ENgj4VKrR8D0CIuYS2Gh/F3dRb5KQFRG5j5uM5OKXnMYyJwhdq81pd4N/xjLewbJZ1ju1pbXVoOKW1V39XPwzyz99430TxtXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-863fa984ef5so141546085a.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 05:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760616852; x=1761221652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3GThzLUFjGbl3VuQITKYi7/BLSw+ups+ZHEY60Y/84=;
        b=Q3rBElF4CkaDHZxQxAnNakZWtKg8Xa54PYayVVtNdP9Jfo33Wm227hrERNvJ6XaWLw
         ApT+9ZgHR3j0/HJu/E2NVpyribQzf8yrqz0xbXCVnc4OMug4dRrvpmJHn+/bUVy/CU5f
         mD9YM87h+mQ45prVCx06Sjx6Rl9BTG4ar2h34Ih991gUHC/+D+5V0v/g61bq43SV6S55
         6r08FZkFRn2jPJR2ufLnPbB682KULjrzW0YR2c5Ier+WmybUysRdwCMjcomNSyMFGwbN
         5c6xAwxfqytxtbHm4PaIDQYAxus2gMYeeDlr2+8PUcY2Lu6D0oyi3bQADU1IX3y4sYly
         6UMw==
X-Forwarded-Encrypted: i=1; AJvYcCWYOIS7yIWRf+5BVVt3g4my1wEvONgTT2ttaE6VdyHma2RZ0TDfxwiwzKIj5r9DOG/ENJNlXUcK4O4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznXhzIK0DtbWIcTotP39xzeGgPb+JSqQn+yOMorF9B1Taknb7J
	3C6ujg8x9MmhujDsrTkQR+y75/ab7WvEf0TI9xu4jbc3y+qIyLqB/O14TBsz27rI
X-Gm-Gg: ASbGncuCszlNRaW0+ejjeoAlILB3gPzbgXflzRis14fDM6ip4NzaqB4zy4vzadwjAuB
	eF+cA+cl9df1e13//IkRHZh00EiEguyWfXd6GeMjMIkdfM/MZ+Uj2qwLvCdyMh2r0+/Qh2CWKw1
	Q/kshkb8Yy+Xp3K912caTGR+CScO/Ci8e9DM9aqx/ZPFJqMXfXyyklky3RW/4Q5ffE/nvLIwQ9q
	Od09vXrvn3SkkntEtfOQUkcHj33zCPoe/VHwHzuTER3l+yAh//V+wU3+ePyhOvKpl3HK54g+NTa
	/LvaXMAvNuZbAwDD3CW6D3ldpFkHyLtXCvpjvkgcKCXE35HF/IsiX160RQN4tlVpSyNKKEoUGdz
	2i0n16wfNdBN5uenIIeUTk5zjzTMFa3ekzMXG139e2pXV1eIl3D+w61MToa68eVvpwZybt5G5CU
	SgaIotWSc/NLr0FXdscpj5Ihw36MCoC2ZS808FTp8L9doJ4f8UvCk4
X-Google-Smtp-Source: AGHT+IF8NHMBKzmOG/ciCo7TR2Icu1Ec14812J/x2FpEQYmGWj8E7Meg7snUoqZHhb8l1BRXbX3XrQ==
X-Received: by 2002:a05:620a:6914:b0:811:76d4:6d4c with SMTP id af79cd13be357-88351de7e2dmr3822297685a.10.1760616851460;
        Thu, 16 Oct 2025 05:14:11 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f3803b27dsm184078385a.37.2025.10.16.05.14.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:14:11 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-88fca7a60cfso89311785a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 05:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1LqXDh6Fc3NecWt4HIOFmiOC/ihkgjp7GKIDHUBhyYSumZ7TOoOFUD6qAJbczalz+z4Yxjkx1BS8=@vger.kernel.org
X-Received: by 2002:a05:6102:6c2:b0:4fb:ebe1:7db1 with SMTP id
 ada2fe7eead31-5d5e220448dmr12281536137.12.1760616407229; Thu, 16 Oct 2025
 05:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
 <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 14:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
X-Gm-Features: AS18NWBH0cbPp0cJrT4sY267e4E8JBEuMEr4tkAtjK9DVXEqfelKr3ZBbd1AYGI
Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 16 Oct 2025 at 13:46, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote=
:
> > > yamllint has gained a new check which checks for inconsistent quoting
> > > (mixed " and ' quotes within a file). Fix all the cases yamllint foun=
d
> > > so we can enable the check (once the check is in a release). Use
> > > whichever quoting is dominate in the file.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > Since you are mentioning mixed quotes, is one or the other preferred?
>
> I have a slight preference for single quotes.

OK, so outside human-readable descriptions, there should only be double
quotes in property values, i.e. on lines ending with a comma or a
semicolon.  Sounds like that can be scripted, or validated by scripting.

> > Shouldn't we try to be consistent across all files?
>
> I don't particularly care to change 915 files. And if the tools don't
> enforce it, I'm not going to do so in reviews.

Fair enough.

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
