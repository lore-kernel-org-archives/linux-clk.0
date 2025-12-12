Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE832D9488
	for <linux-clk@vger.kernel.org>; Fri, 12 Dec 2025 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534156; cv=none; b=a2Jh8TirZP52gALsAzh0XCO7zBtEZJWybSeGFT/ZwbgCwyzZh+6CWgV0+351EPx57jq3XL3KsESq280eEMOgtz3hjG5oznp7FkqsZoPRMoRr3RNKJyPxSqJScFe5AdKHAiEvb4ACvB3KaATuBZXtvRu8/1IRP+z1kP4krB2XDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534156; c=relaxed/simple;
	bh=+CgqYVH9orNZOCijPAUqc+h3PhteR2BDiAlkPl93y2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEoInPe5xRXjzQ0q+CtRTgreLlohB8vKspUjrgw9V/03W0n5QVP+eciBTSeYuS0GB65WqNhoV0JAwAH2tEXpz0UBqz2dhgI95pL5H4NbHn7zeLfMzWmZgLHMhzGlUp+SjedEB4lvb0dAcEWYX1tMTRo9PIQ9nmuCrEh15Reox2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Zy5C2mH3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Zy5C2mH3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7633027cb2so171723066b.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Dec 2025 02:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765534153; x=1766138953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=Zy5C2mH3YV3kmR8lWvRj8ihyBacWLyf8HZzakMAOQgEjFKxqUOQMQLlRSmB8qVh1R0
         W2M9hL6vEtna1D83xuWy5rYzO9keo72jTylMimmImti0eu6FonAXHdCIlGm76sYGZEw0
         /UKwjUsaUGcvqx17waTIfbZDmDlfhilMEraLQChb5RzE2/6hVEhJdpsr1BrNTz6+QEp1
         sGYGKWrwh0XaTtvs1nw3ZILQWbcmRUxOqkY942oB0YsTRQ67W/DIdAg4vOF5tbsDXhE6
         oghjsaETf666NTM5iqFHV7DDklMqNaD9uqQRn9XTTrZCjIe1y9xVVOX0JaTG00j4RH44
         cXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765534153; x=1766138953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piKeicldVFohFnPgSVyUwsQHuUt89125myGk5tf25V8=;
        b=vTYzZEmiyXqAAxCOUox0SJ+crsI9Pln3XrqHdwq7p5yZ2GMdluzwqPKBUxfHuH0KTp
         /pZbiVy24B3p2E7LnqRkv8suOQo+fNDCu6V7LKYN2bIS812wCzI8vUhSHDA/jw6TBEfC
         xP9gHChYZN+82xtnfAGMcWNsFBgFl5ABsNu9QIZdvHw9ydjWXxrPwZIvoazkNaF71bwW
         zzqP8wt6Lv80v040rxB34CBHTjxd7sGGG7sFQWa+vOn/1vnOW+AM82PEDa6u/5ngra9J
         pHyGUiMCksgw74Bj8AjDHA4oS2XfvXRFyX8HoqW7lMl401q1moIIHxiG0U0J4xO4at0f
         6hyg==
X-Forwarded-Encrypted: i=1; AJvYcCWKOCC0h7t3mQ2C8oA/o75ELgaExtvBmAuEMUM7b+VeYXeIDT/Xdq97w/KmnN4TjN4E/2oKkZnUx0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5xPdQCo4M1jokR9LxKV4HWABJjz7aVX8UzBksTW3dTnI9dgE
	9I0zAQMCiD1d30wnExoAAG3u5O3PPpNQsC5Ge4Tm8rtJSTZRVxI4UDJ1FgLm5rznoVBTEqXmzGK
	oG9tDdX3hD1Mas6uboravSKJIJukbXqJF+RFwHEndGw==
X-Gm-Gg: AY/fxX4Au647skSxP/RiQh/APA2d4PSNT6opyaa5KPFQyBxq7Q7/1Qz9gKEyyinU9ZK
	V6RXPDQ7hIWcy65Yik6g9fs+YbFvha9p+GEJw9+RBkq+u/7BpuuDaTutY/z5RbKsf0cKQ33kzEl
	MbZJDh+qCrLb9n1clJV90YZOADdGu0CnTaKwxHn1hHNtrf2YWelAkq7SoMG70cYaJ892xcUj2Z0
	TqkK64Hg/C+t4U5iCbyVFDh2JUVMVZAFsC7peYOCvB8nBLxa1PuG+WoWxsSBvl/eUiqL1I=
X-Google-Smtp-Source: AGHT+IGu9UDsKSPu1wQCEy9ZSntpZSOo/9V+U0kQrHcNkQAxG5oPTpTaMv6wXo2k7lZ0/X2pNnXrjg4sARyaZrNmc5Q=
X-Received: by 2002:a17:906:f5a9:b0:b76:8077:4eaa with SMTP id
 a640c23a62f3a-b7d23618a6dmr134378366b.6.1765534153256; Fri, 12 Dec 2025
 02:09:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr> <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com> <20251208-absolute-diploma-6575729ab43f@spud>
In-Reply-To: <20251208-absolute-diploma-6575729ab43f@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 12 Dec 2025 11:09:01 +0100
X-Gm-Features: AQt7F2qi9N_ckMGJFgowBcvF34rbB96zRSF2oUqF51CXmoKh0Qd3rJ2sqP-K-eQ
Message-ID: <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
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

On Mon, Dec 8, 2025 at 6:10=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> > On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > > Microchip LAN969x is a series of multi-port, multi-gigabit switches=
 based
> > > > on ARMv8 Cortex-A53 CPU.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++=
++++
> > >
> > > This should not be in a unique file, put it in with the other microch=
ip
> > > arm devices please. Also, the wildcard in the compatible is not
> > > permitted, only way it'd make sense is if these are different binning=
s
> > > of the same silicon. If that's the case, you need to explain why,
> > > because compatibles are meant to be soc-specific.
> >
> > Hi Conor,
> > The issue is that there is no unique place for Microchip SoC-s,
> > LAN966x series is in the AT91 bindings
> > while SparX-5 has its own bindings file.
> >
> > What would you suggest in this case?
>
> Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
> become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
> looks pointless and can be deleted IMO.

Ok, I merged them all in one generic microchip.yaml binding, but I noticed =
that
arm/atmel-at91.yaml is licensed under GPL-2.0 while arm/microchip,sparx5.ya=
ml
is dual-licensed as its preferred for bindings.

Is that going to be an issue?

Regards,
Robert
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
