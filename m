Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5919C571
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731073217; cv=none; b=D4JAurP9lB3VflC47HoZCTEvzaMfBz0CBvt5mTk1blzdxhpa7S4g/wCETJfGis8sk6P6Nbfh/zhfLs77M50bjGb6qyUQ9tDfNfnPCrvYoDMaBqr76DdAnwXJqW+eeKKU8IbI3JiXpI6idet1RB7pKq1/c43VBh0CrdGJvjfVHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731073217; c=relaxed/simple;
	bh=lmh0z8bq/zzGYs+/6YkGeLdY+DCKygDX5CUuwOJL7Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LD3/yMfZVzXjHIQYZS8Z4z6d9v5+caG97gEtQ/FKY8a/O2TIRcybs5UG0EUWqlqm6n7xStNtgGzKXPRbaPCKLjfhyevU8Ky2tFWllSsDRpehKw1AXtzakG+9O8oaO4L/EzcytdtVyZ4e4lHd9Iq94y98Qph57ui9zR4dHS35e/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=XV4zSLaV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="XV4zSLaV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so1743073a91.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731073216; x=1731678016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8ZJwvOeV6Ng8VTt9n6SG5cFjyqB7gKUP8OuA6z3DVg=;
        b=XV4zSLaVX4syObbS9WbCp4I3umSYoCGxQNrr0vue2VxPeMl5rpqPys7fgWYBfUvRdB
         7e945IqgRXWPDRdwIHYVvA97uEPayvsC8VAgDjcE5y44QE274r9FCdhLh9F4U5Yc+/fa
         HhnGcHnTz+hkl7cDkyQGeIAaYX3brzoPqcjfBbfgKAKl/d480Q0n8WbDi/r576S6UqXP
         kfUe5rH9fj/8jJM1f32h6qjK9LPTMuFthwAOsqxjJJavRGy4Frw6FnWPUfmBkyB56SLy
         sj3atY7dMOapipSoAcdHhLZx6sO5DlVJKDHwdIGFeGjQ9pZ23sJnZJvgS6Nlbt0nfPsO
         2gdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731073216; x=1731678016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8ZJwvOeV6Ng8VTt9n6SG5cFjyqB7gKUP8OuA6z3DVg=;
        b=GIYENtpRz4yhbtrjwoB6dcVFPTcvM30CMi9mxTYLNbl5KyaDrs2f26CDgKVuxP3ObS
         JQwTu631bkhlWK2frIg96jj1MKfsVM5yI6mQednDbtVkW4FZmBRBZ2dwlyvKdGuMDNt1
         vLGAuvY/4Qnh710cEF2711RIHZYBk+uLgnumvV2BVTrYzEt1N0N0+RN2ta88Ivi4i4lT
         w2cXyX/aLTeq3CXE0aSlN6P60aHtU9mmr0ZrOFbhqQCq95ex+oMbSXD1uPak8ciHHAlm
         i3a7Sm+darHHgL+fn0xCXeaN94A17OUfs846e7tKqSma3AhoLusybQ7EaE38pcuv2Q2l
         bUFA==
X-Forwarded-Encrypted: i=1; AJvYcCWU6cBD+n6jnsHvAVqhGxZXaEGItmPKXCc+CoIQifVeYjjPo25A98y2QJeKkTHSuCQa6BTmeMW1EH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyg8iWQLepUPP4ZK/VdxdAkLK/3uZ26rOB787sElGaqvVaMUF
	3tR5cwwmxgtUs/4c8eAmELpV3fDoqZs9uzlaaJ91zShRDcp5guDAuZqOcCcS8ODIThFFEWVCabI
	bSMATupQjXbtDlLkHhyEjnnPlMZmKASGEZOjlzw==
X-Google-Smtp-Source: AGHT+IG6OWkcSu6zPwaHqEtkBnsm7V//38o9bsGqJYwF50bdWilViY347QwXIH+QFKTXlm4Y8ftOczB4h+DcYu9T4dg=
X-Received: by 2002:a17:90b:1f86:b0:2e2:cba1:67c9 with SMTP id
 98e67ed59e1d1-2e9b1754e25mr3320320a91.35.1731073215604; Fri, 08 Nov 2024
 05:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108112355.20251-1-robert.marko@sartura.hr>
 <20241108112355.20251-3-robert.marko@sartura.hr> <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
In-Reply-To: <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 8 Nov 2024 14:40:04 +0100
Message-ID: <CA+HBbNFomosu+5_C0+6cqKcc3B9DFiXXPxexFYjY4ud2LmWqmg@mail.gmail.com>
Subject: Re: [PATCH 3/3] tty: serial: atmel: make it selectable for ARCH_LAN969X
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, lee@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 2:25=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> On 08/11/2024 at 12:22, Robert Marko wrote:
>
> A little commit message would be better.

Hi Nicolas, I basically reused the same commit description as for MFD
and else as all of the changes are
basically the same.


>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   drivers/tty/serial/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index 45f0f779fbf9..e6cf20b845f1 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
> >   config SERIAL_ATMEL
> >          bool "AT91 on-chip serial port support"
> >          depends on COMMON_CLK
> > -       depends on ARCH_AT91 || COMPILE_TEST
> > +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
>
> Checkpatch.pl reports some "DOS line endings", you might need to fix this=
.

Hm, I ran checkpatch before sending in verbose mode and I dont see
such a warning,
my Sublime text is also set to Unix endings, I also just checked with
cat -e and I dont see
any DOS endings.

Regards,
Robert
>
> >          select SERIAL_CORE
> >          select SERIAL_MCTRL_GPIO if GPIOLIB
> >          select MFD_AT91_USART
> > --
> > 2.47.0
>
>
> Once fixed, you can add my:
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>
> Thanks, best regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
