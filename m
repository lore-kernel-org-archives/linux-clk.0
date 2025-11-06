Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B623717F
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418863; cv=none; b=aiQHkzylfm/aK+WwEOVLpJE49A3Hp/wUbJveGXEGrsHNm+lBLnPeNRXHflEnFJmEZeaTSmyeolTwmhbbYE0dvwq/6fkX+G/HSJapslzIlJliEBtdLoBrTvmb3CF+2t3hpywGpfn/7ltkZQui2IaIaghcoSLbK29hW7N9t0IUIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418863; c=relaxed/simple;
	bh=r4WI112XNVPvAwbD+KTwJYuTD4uzGIUEVqXtqMZFfmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkXIdHsfH9ACyZFyOA9fKzhpOVs7hMocSxJ8G1i2apXgmJzrDilWQiuKq2WXDE1Kb4LSL3EgGHMSv52KTZzQZ+L3hF7A+Nfb3uefgzGNlIBT7ugssWPGoaRQ9KBpOPCebZi4dKrzX7ryIjIgj9PPCuoPKXtSwiVjHMwTMrmtEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5d96756a292so1630092137.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 00:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418860; x=1763023660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdhdbS5PtOsV4kjxfjLI8puwF2f4n5VCEZc3tH68S6k=;
        b=gvcz4zWx0+IQDM4TG1BedB9vJnoOluhV0zMtPFWJQgyXhWgBdQaiipsjPuH7sujvEg
         ChTk5IXU8niujL+MqsK8p7xvOAs51A18TPCiT+pdG1yTYKKNy5e1iWMb0Zgy+Vu8fWpD
         u4XEW/ZfTWA+EaLfimHSocj6akajUw9JBlFBBiWAO0wch2u/EJCXt2uRqRKuseigyu0F
         TP47Z8m5fXn5BpiQEVbzTU27yl2pgeb3zr63THvNKkmiuZxzPQi1Nw61X/eD14DYBqPz
         yOok65OtCxvOm0ScBHVygcC+eAvBZSgj4AnW//Jj7g3dqaCrdQxhLm7qOy/O3RFbYxT6
         BqIA==
X-Forwarded-Encrypted: i=1; AJvYcCXMpSEAsqBYpYOhSKcTMctTSIoWNUMuucX/tM9LVV2rj0i2RiFJwbdjtiMNSOZcqKk9CxjLE4jYeSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOuxbEUUxAg31/7ZXm/D7DwS2ia8d+penz3f5SUYnomy2czW3
	pxIfxxYGMxqM+9Q86WFYPD2bBrCf67atHKqr8y5DMnxi0XvjqsLXy8FM5VcM4XZu
X-Gm-Gg: ASbGncvJakyjUxxxY5VFAgwd3Yuek/h749//GtsvKdKGpDE/tTdZpmfu/128OGuS67n
	sNByDnewicIbipb02pzFRte4CUWfkdeN/wl7dDRcFKPvZKK4NOCfoYXo5WuVsz9qT2N2vG8ebYh
	5YklVRKyJzcp8oC83NRJELSOG5mPy3kDqPLn/TCFjft0cae2LV6Gu/gmcEnzisODG2zaSeAQenZ
	0z+kq7rQSaIWZoKXJRU4WvH8USBcGEc3v5hDL6IVYFHowXRnUIgxCdlay1GCXXtNhuJVOfZp9/w
	6DNSWS6k0PjYpTXP00TiRsJzRXf8udTqCOzF/vGWcTruiSqc7RAbdxSvqrlc7gv7iu0YmMh8Qbl
	pCedSDBDCf/ApSMHfQoP5Vbu4h2Y5LDFwrQkqKyTaIOKnbVstFmT7dqiSKspNb0jUAvfAIbCiaD
	yUBnqt8KEq1kegs0QqHlwUZ7fl+m4/u6n8X53+/x/g3MFilAB/
X-Google-Smtp-Source: AGHT+IEoiiApdL1+I83n3lrWm0NLbDaiijIvkNf/32NIUYP8WCG0jmiI9OeGOEkn2NvLywqPsCgz2g==
X-Received: by 2002:a05:6102:a4d:b0:5db:ecac:5800 with SMTP id ada2fe7eead31-5dd9fe293cbmr889998137.19.1762418860563;
        Thu, 06 Nov 2025 00:47:40 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d06f94sm807514137.1.2025.11.06.00.47.39
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:47:39 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9354847e338so433430241.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 00:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAnllBqOTBxPfPpHacGShDzaQ7wW93GAxOOv0zWaIVF2tZ7/X2KDgQpXQFNK1UgXW4l+ShU0UUQmQ=@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5dd9feef219mr849186137.18.1762418859485; Thu, 06 Nov 2025
 00:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 09:47:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
X-Gm-Features: AWmQ_bkMn9K93ASfX-CEwYoeGvJMeNWd5c5VED4d6zuDLnmC2ge-cRo7TaazeRI
Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

Sorry, I still had outstanding review comments I hadn't sent yet, as
I hadn't finished my review yet.

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - It lacks the time capture functionality
> - The maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - It requires two reset lines instead of one
>
> Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> the binding accordingly:
> - Allow "resets" to contain one or two entries depending on the SoC.
> - Add "reset-names" property, but make it required only for RZ/V2H.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v2 changes:
> - Added "reset-names" property and made it required for RZ/V2H.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

> @@ -61,6 +63,39 @@ required:
>    - power-domains
>    - resets
>
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-rtca3
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: VBATTB module reset
> +        reset-names:
> +          const: vbattb

Please add this property to the example at the bottom, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
