Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0953E1714
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544646; cv=pass; b=Rox8xbem0NguZajmiiynEXhFTtJdc+rihUdE/cETtfkrI3QpR8Hzw+uWw3GKs0DG4T8jFRRG6EVx+WCPcqLkSpIDz2EMtHG52NKJVnbI9MtfHSI6rrQu02wDr4q1/hnENRvEMHmmnDZKow6ivh2emKM6Urtbqem5gEBvsAVuue8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544646; c=relaxed/simple;
	bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6XxEbxIrBw8gdmmQOohGpZjuM6zx+gpR35NKS6wPuJoVF4+MlFYlTi5QeXUh84SbqLgJDije7NZv3g9mlnhaloJrlOI2FPhsbhd4f4/zWHbvF9fN1f3KC55LBPcwjAbv7NWxKpd5eYb6K1VLbTrY4BAgAJ+358K1E7+OA0yMJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNB2gY/w; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNB2gY/w"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de008b020so2724737f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 03:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784544637; cv=none;
        d=google.com; s=arc-20260327;
        b=Kux+GkU+GwUETMCrTGat43PaeqFIOTtnJ+NibKeG2HHzn7zVGsqaQheH+RV1NVyLL1
         GLYdPefZXCIZnpOltty1Dsqv3gYP5lQziCbEwf5vLWP/eOcbcknZSuKvCQcbYSAIMNFs
         fQSJHcSKr7HLIlMS8BT0nbRHXastN+LNwYhoqEt4VXg9QNb0Tvyixg7KTOYZQZvSZ2fK
         uJhP4UlyMOvX+LeyZHPkUOE5CamOOvFejmkAxNGceYaaqycpsi+6hhQUsGWR3M1+kEIQ
         qO30HWObXJXed9sta8h7WlfNOyluvLjZFKM0793NFK9TcinTeteSMy+XI+QjYUK3VUK2
         4SjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        fh=nLr7+vqXxEvGOIuZvRiWJvshct/IFFMZ1FgUYYg8QQg=;
        b=j3UIBUIJ3ADC2nJoBaYobPE7Rtfp8C6JAkqVwRECpWxKPtBSmJulFYcycq2rYYXYnC
         MI77ozy7mn9YQGCdFMOUHClDDxjYa7SCnvLgezju1ALxYmWw/ubjzu3ww+Q1NvlHy7wo
         MHpu+x6eUkubr4zLaYK8vN1Ij79PiqjGroCOiitr8c2DSPtAx73GMorDgu0M09tg4+Py
         Fc6ZMjnQ9/WvUA3W6GyDM5/RbNZgB/r50Z5Kl2bOD1/QBqjWMUcux99mV3zarvpIyEpQ
         WobVsmqZIz38kx7s15b4hAMe4gvLJ4/j4Eg0Dsip/Y9UnYW6B4IFJGWjjbGw1H99BMRV
         BBLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544637; x=1785149437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=cNB2gY/wccKpu/LF7vqqY6A3quWLN/f6zMGwZEqMlcMHEoXIwiYgHXpHpRta7bFryS
         cDxLrDX1BvAEI1WtAn1sO+YOfhvRN6lBEPQVmCWaXEMVpbR3U2dxJwhzeNTQMh3j9a6A
         yDmNTX7OYcDikeBt5RdQwnC127eYSfjoH+OZnhsX24MaNH8g46fAuFrsVJzwKQEUs7sW
         S1mnWy33WxjcoPafzgNqR+PKzmy+aLdFfusY2RpM84EpWG3XBM9EAXFlUaKU7w1Qok9U
         ZPftWxlfk+amtTZv37KYookH730ft9Qotzsc2rcPkVhFpde8LXtyQH13Vs0vBA9ItPjb
         i48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544637; x=1785149437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=pVI4bb9cLCTnjdhKtpag9lmOC6OwX+rt5CiraYvfBsR9wrNIZIY+YtO4tsGhQCI9T0
         fyOLbFlRrKLZhggflOa+CCMK1WTJtFt6U7EC6kLpgEaLws+biIh/hFphVXkBbd9hH/47
         aR3sV6jovouOodZa3P4y2ALZMdqwCr1vVUZlG2S/Jxfna+nH2zEiPMXOuVOUYozOCQKM
         h4Nb1pAEy0lkWXeSIdVl2MOf3TcgbaHr0RkB8Bb2VZWCNuoS1oIXyptA/XbfYaufLBuS
         nzYphszxhAJ1kV4WEYEKjOyI1noGlFiXg7sxEv1ouo95pOTC3K5tWK74UFHWW0KpXf/X
         U2fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrY2hoyUQpWtWCEPkWn7OQDLUQ1wPxxPzwMQ+YLu5FRMkOmGhPWoX2YqrlUQgzqp+NNHZP2NzvgSHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qxTsFFg0zQ8Z7hD+1YAcQKDS9c+hmRBdN06aRyfpbTOg7hjh
	cw1rc0dcRnmcA+Y4oEZpEe6TTm6K6/TMyDitmlqzleabbW64AYS3FfaZxxBCF5EcTpV3CxjuByI
	vAPUwGgJbZAj/UEwyyEqeWqi10HbWsa0=
X-Gm-Gg: AR+sD11sRGr+muW2NVWBqKI4QDyehKpSLHM7eiT+AufDDSnzhkmc4jgbDYRQ9LCfiDJ
	6SIEklbW9DBcYKMicKNsXn3iJfWsx2fWA92beKoccxQ4GL0G9jVP7EMA95ggL+BBOluQ4Bk0OfI
	eceGnfoLI+V2AIPrgNTdt1Vw7yjRso3SELqfS7mee9HiU21WSxs+jfX92u6aPK/UWp+T+Jmxvl+
	Iyz4D8b4dxsUzQlxn8M5fqVgWox56eIkNSWGmAwEwh5Wct2k5RR7Ejnvz1xTQv/0vjZBfIg5TGf
	7Yjh27ov6+4qXIK28rJzn/Euz9WGtjI6pgcucIo6Elbl8n8=
X-Received: by 2002:a05:6000:26c6:b0:47f:71a0:c060 with SMTP id
 ffacd0b85a97d-47f71a0c528mr6994984f8f.2.1784544636880; Mon, 20 Jul 2026
 03:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260720-fractal-prodigious-spoonbill-86f534@quoll>
In-Reply-To: <20260720-fractal-prodigious-spoonbill-86f534@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 11:50:10 +0100
X-Gm-Features: AUfX_mzmB1NqSZ6NtXzORayD9TuW5BGNtCQcsQ-KypuekoZwKlJVJ80qQGr5ZIo
Message-ID: <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> > renesas,cpg-mssr.yaml schema into a dedicated binding.
> >
> > Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> > system controller integrates additional functionality beyond clock and
> > module-stop control, including reset control, clock monitor support,
> > write-protection registers and other system management features.
>
> Nothing of above differences got reflected in the code, so I do not
> understand this reasoning. Binding is exactly the same as the old one.
>
A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
Since the RZ/T2H clock driver uses this syscon wrapper, a function
pointer is implemented to handle the RZ/T2H-specific configuration.

Also, as the initial implementation used separate device tree nodes,
Geert suggested splitting this binding schema off into a dedicated
file [1].

[0] https://lore.kernel.org/all/20260716123434.2576253-3-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz=
4J5eEPMQ@mail.gmail.com/
Cheers, Prabhakar

Cheers,
Prabhakar
