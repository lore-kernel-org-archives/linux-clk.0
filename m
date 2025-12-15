Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49C2153E7
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798600; cv=none; b=J+xnQ+OdE1TYbdMZwYZZTIukRdSRE28bCGqQe6M8MQR2CFAtHT/08EybjoXFOCIt73ib2HtDuAkZtmnSUsWJCk7TLz6Qaxt3U9gRHIjCywQCsYC6yTEASYE5XLz3uL6Z37JFkrgutoijOhniWdRORcSTXWVcolbUaMZSnLEAdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798600; c=relaxed/simple;
	bh=8K5CQGNJve1RW39NoSUfaSDkqaJ3UQVV/VleCfTk9x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5YJe7wDIMgunK9/PY9XSq15fKfkju9xm6YUkNK0Me5WrYpd3X8YTpTuppyyu/MEQtJZzQvLZ0If9/ETxuWVjPCSs4DX8rJ4d8JTZD5kgVijrzpD6nksSsXQeftmK/HmaFdLWhsn/ISMLk397hahw64F8ZvT7qQQ4FcsLyEzcCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=VwyGvywQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="VwyGvywQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso6005453a12.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765798596; x=1766403396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=VwyGvywQGp1uMScnX1vlpHce6SV2NoXE/I2TmQo+qJiFufjCa7dCX02s0Z/MCDCNN+
         1rHF6lmg1nY84K6oQTjyMOuRi2AgLCv3V6O5RLCiI0PAFJQcGpxkFpWqLD9MI8Sc1GuV
         NrTBzTgGLqtuKFzlUYrIofbnmMOueyf/heQhGpBOTdpxyZTldQwuj/4bhB5FpXyVl4PJ
         KA4Ue24LdKM08COAAdoJJGxHzyHbuRswh1HSA1xkSun99A9lawP0mTi8QEzvP5zXEnyI
         8Mi3aZuAPYs9CViWk/U6/h7K2imxo/eKm5e35a+282FxjEper6auPCj4sBzfqlaREd+m
         JhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798596; x=1766403396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=uIR6qwmQ5SwcK5tchQqqFvi+wm8dAwG2oPAS5GtQczJMGORuaBfjjj7Bwy3oJTUwic
         tW6Qqus3bS0FHNuTw1qHfA9aNyOQwN1nprfh3NXRdlmsD1TgHnPZcmDUz3jjnZtnc1XG
         CiyQG2/7KQzzZbQYXrXMQRMWiwV8+zTssNDJ7+y6Zwvdz67HuL2+HEAE7ZkvyTluhU6B
         p7lKvUTRjq+Imqqed2DJeN65cWK+KkeTyCXIwglfDJB1CUW1FDGiEACV5sIhQQk/N8SJ
         CcYc+CvIC0b6/dqF3gEMCQkj5a+x6HHJUiUqanCAARsol2bumgcrwqpCHSkDRt26Eirb
         fQyg==
X-Forwarded-Encrypted: i=1; AJvYcCUZJJdx/hgXDbCmJRZNUOk+SSYMCMpxPUFehCmz1UVKb0VG4rcxBekaQVc/q3OHwqsKfPHrdHxOqk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YywVhU3jDS3nOTCA8HhwBEdudHVO2Gl82s2yc2IPV+597pWaigY
	gzaI9ecvYcUPlR7YUUX+ugnVbT4B8n1qgG75ckLPRPyAlaZ+FyD5UJV9iwvgHGMVsG6lgxY45SM
	TTJ9LeK80hZTy7FU3t6cXOlS+fnMBMtUgYqa+DJKc9w==
X-Gm-Gg: AY/fxX6Z7x4KIV8iOKkup8aRntWjYxMADx6g+VKjge/XL6B4Ix3z6nnVkc6pZSZ9HDJ
	1vaIoM1cpFfGWDJ14m969/TN+3mvAN5pdh5r++ZpG3tWMZT3GI/xjOBltgNytRwC5WyE24ex210
	xSnFIj4oeB4RmLYKuXtQubRnlWdsSJL/KEGeX+Ch214ZSIRRLguvkaIY1C3HEghfTh/AEO0Z1vm
	r+7Bp5AZvk5KpJIvlC5N8KZhJ3VSuK/qAM0y0WmcZzZVtJu9JUqbrvL+7obwO1p1mx70R+/
X-Google-Smtp-Source: AGHT+IFe8rw0qhWAiH0mQoOljUOiqcSqb5gRs5qS5m8hogOLlJs+w47H8LQqQzDIOFZ44fMZWWGRbbSWXqIYIq4YXXE=
X-Received: by 2002:a17:907:9628:b0:b73:8798:3be6 with SMTP id
 a640c23a62f3a-b7d23665c4fmr1116568866b.24.1765798596197; Mon, 15 Dec 2025
 03:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr> <20251203-splendor-cubbyhole-eda2d6982b46@spud>
In-Reply-To: <20251203-splendor-cubbyhole-eda2d6982b46@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 15 Dec 2025 12:36:25 +0100
X-Gm-Features: AQt7F2oZT8D46ks79tXEN44Gcwk4DCt-08YRdCse_jKqK0ZpniHWAPSwJLfDHCc
Message-ID: <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 8:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> > Add support for Microchip LAN969x switch SoC, including the EV23X71A
> > EVB board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  arch/arm64/boot/dts/microchip/Makefile        |   2 +
> >  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>
> >  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>
> The majority of devices in this file are missing soc-specific
> compatibles.

Hi,
I missed this before.

The majority of the devices are simply reused from the AT91 series, so
I thought it was not required to
update all of the bindings to add the LAN9691 compatible.

If that is required, I will do so in v2.

Regards,
Robert
--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
