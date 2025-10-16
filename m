Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B3212B0A
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601776; cv=none; b=CTkbGOtPOWJoj1S96p4LjImh50EqYpive+qPt8pfKyaU1B+mrKrtXwu72E/6WNpowM3TORCxEJfq/MuP/2uujthGUcN18VFa6su9lxLRODZWtR3R0QM16vMHafYb5AFrpZ9SWDhjFDcNu8MKlSPx9wiPOczkemfBUXidk1291Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601776; c=relaxed/simple;
	bh=1eGQTAnWNGY3mGah0Neq02H/T5/f9gtIvSd+fn8FW2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU1/dWW7FOFcG0/t+5WYrkFdzR8zQ2Iz3G4OgysCFGy2MGG40i+3XYLVL5aF+cxSRv9MW1eBrqww+o9Kzfsc4rNewp/Dx1BZ6y0Yj3aTCS0XCH6VB7bALqiDSMb9ZotM7GBMilKAYigA7F8XKydBFTEHLe/dyIvDoKTmYHaxi/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78e4056623fso6718956d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 01:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601773; x=1761206573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd9DhXGFTz7VluvF3CXaOYryMfT47ujx56ubcyYXsIw=;
        b=QK6riYhe4e5WTDzDVHd7bRKRxsdNQrg95t29nFxnz3eE6k6BYUhHXm6L0Y5sqGBLrc
         swhuSqTvT0J5rkC/5HzKQxPsCL3rsWYzz3/jCNxBJhYxweB4Xe6bz9vnfX5t2317vcE3
         JLWTwZFNpdJ78RHJcMTQvTVqKNA3UB/uzDK3m2FLpH7EX6z/mfW4OkAUTkDhdNT0tZsf
         s0b4z2BHvKFxF3exZSEAqRfdpnqfXX5pXMyFoo5ELQPQQMzrdaWNB0SImZJSjfhgVMqH
         OEdPf1QNni52NooAsFkc1pEx/fFZnW0VPNpXrqc8relYV8CBy2uczOEWpjhwm0gt44MY
         1rMw==
X-Forwarded-Encrypted: i=1; AJvYcCXR6QQKHPaPnUldw9ZkRK/IuTMMkiPf12tRJhO+sx9iCaZ3RwwTZnqNg8F38xjsCA5mipaHR9jtW8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxFp6ncFB/2vuJvwoREsIyvlMvTvfSsBgiWG4I+8GwSZ98qxK
	QVNeUHa1IwKOaBwsiQwwYlcBwDjHzjpfkt1jFhj8y5hu+HIzPkeVpNJmcv6ir+N8
X-Gm-Gg: ASbGncsQeHbHDFZOJdEyvsnIuJP1Hm+Vln0trOowj3gRBh9NUB7ZlIyRlSlClcPciyb
	20xO0rjhUoazBw/denZz0BntX6l4QBbBXUBIJs1rTWPlmWCaPosGDh07c49Y5F+ilA7gFMTszZI
	gU9tqLtwP6cqlm0iy/jwVIC4dA88A8cuBQ7YIzSo9aMLwTlKpyzVPrzQLcztcB2954/dEqmRNXJ
	K3RMKSEaLusyxeIhv1gs0oUSFZ6thhwLUPlLXEqag5GuHOmJRKSPL+WyVWUDsCyt0l5rUU3cYgc
	nOiWbsGZQQ1HDRB0lV0SMa3DOzQxZJW+QaGwLFl753muELW85JCn3sqVNMmiWgLzGG0JRHIDJ9T
	80/5ZXQN2lUuXbJEIF/Y/rf0U/MtirnVHJ3uskxlF0z8rkPLrugMAORXZjOqEnzShiPuxXSAAbg
	zlWTNTRv+zOGfUMZDCBnAM6SDXZVCjgo/F4t7o0w==
X-Google-Smtp-Source: AGHT+IGR3dpn5m9njhZoJZhqMNszajMYjAlASX7mpSmJENVPRujP8cfNznXa3DeA7vwEYYWpsLuW9g==
X-Received: by 2002:a05:622a:1807:b0:4e7:234a:ccf6 with SMTP id d75a77b69052e-4e7234ad21fmr195752961cf.44.1760601773378;
        Thu, 16 Oct 2025 01:02:53 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e88f3f2f0asm20762001cf.28.2025.10.16.01.02.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:02:53 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-81efcad9c90so8402186d6.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 01:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMFWQVqNIoxqgmAjv5+ogRlAwTS8/Wa06V+yOBPjPCYpjEwBk/swpNcleRbEESO1+dfnSWlsbtiRM=@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-5d5e23afcd1mr10705349137.30.1760601430958; Thu, 16 Oct 2025
 00:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
X-Gm-Features: AS18NWDjBoTWi0arzS-uHQaIyzTZ8PYUb4ECqZaEUF0sSO-4JEe-m7M7qjhxsvY
Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
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

Hi Rob,

On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Since you are mentioning mixed quotes, is one or the other preferred?
Shouldn't we try to be consistent across all files?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -129,7 +129,7 @@ additionalProperties:
>
>      - type: object
>        additionalProperties:
> -        $ref: "#/additionalProperties/anyOf/0"
> +        $ref: '#/additionalProperties/anyOf/0'
>
>  examples:
>    - |
> @@ -190,7 +190,7 @@ examples:
>
>              sdhi0_pins: sd0 {
>                      groups = "sdhi0_data4", "sdhi0_ctrl";
> -                    function = "sdhi0";
> +                    function = "sdhi0';

Huh?

>                      power-source = <3300>;
>              };
>      };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
