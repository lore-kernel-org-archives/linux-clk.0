Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32AE30C172
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141744; cv=pass; b=HjTFUKw7FmoFIHfsVd2oYEaGZ7cFRxrRLGF3MemEQeDlM+OjasSlE/r56f93QZuiT9PUr6AEfScpEALzbOGQssNKt51B1CyyuIxUSpJnDoJXwzPzw2XEHYdQvy6KT3mvMOumLATS6KiIuxxG/6EXl2rhwVtHLVLSm1okdGbbhLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141744; c=relaxed/simple;
	bh=e1tTuZMCTbr9WABeIO5Ex8NGWc2k4NezfMpqJ50E/LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ns8FdyO1ttOk/+k9uuvYMJoxkMSrIbOM6V4JiweM124WjxQFk1jezphtW+fanA93RGZ/VB93PFtYsssPH1X49G+o6a2y75R/AhY5yVNu9HqiuJ6qQT0wEO14Qpv1Npv7GNVMdY1zse1JMVmCpOf49H0VR6mlE/DwCC+baneRiQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF0KIOYR; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF0KIOYR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so41910705e9.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 08:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141741; cv=none;
        d=google.com; s=arc-20240605;
        b=L8nYVgHCWHYvMPO0VSvFZGVFi2QtXU7gBc4YyR2SnSkXJKJ5y/wN4h97ccfgG5FgU8
         pwAP/huyMStY+SBZklDVutTuuFX/k4Gkyn3zaVh/wIJizyf5YCVrMUK9H4s2SfsK72Un
         DVeEImhSPcme7O77e88R2U4Bmvm/79zCMhoCoQomyxJuMPQreDTDS0QDlDVXxEx3Lknk
         EXp30uWQFr8xjrhOVQDtbbcpSBDkFwSdBeJd7eNYoZwQTp//y9eJlhYBXTSAwBXcN8ph
         kmpV2/NWVBPZUBG+4Th3sUOpOMzNQ0yRcfGHAZC4WgXonzqjahBOUsVNlnkeWxoN6GVR
         Ml6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        fh=1UxsHtaz0q+egpp/sUiPRS4gAQX/S/kpHx8j5S7+ICw=;
        b=h2j3vZ3Vk3VjgA23TB7E0XwpkX6JO2MX7IKPPKBLEPtSdtMMNXse3IC33XpZ35QsMx
         ad49iahLZEVGtX2unoemLKV28v9u2fxrgFGKqy6v2jhJOCLV0gL2c8eQkT6fcFOsL5yc
         VbvfY1UDxgDiWK/Fpvxc+5gT5Z/TF5/dqhDGzq8ICNDOR1FN6HLsvPFNAMuHLCc5Lpij
         utSUkgTAt82k+Ojq7CDtbQoZ7BPg+18W+mpgQfWmc/ewKK20QH7uHaCeyFmIwggX+liF
         16GIufFsoxvmIBhgxVrMbIVj+9GkNUqwT/VRy/45f2cThRIaBocUeZu5iSDPSV5hj01C
         hPAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141741; x=1782746541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=ZF0KIOYRnIfgfUq3F7UiMUa0nz2rdPFiVNZRhgMKR3+rdzkt5DQcRyH4ZYLY5Equ+a
         Nreaoxhg9PLqYeMCfuq47KG+RtokqgAUjCaDUKy1v0fbBl1aDfhTLDaD03uVn1KRY+dG
         hcfzThTdGTi5UWl8ldvYE5ZMc+tMjjGkIRKE//Wn3VpapygIdEPhiLluLHilLW0Vft8s
         kKfBOt+PbAXH1/9/s1kH6JXmrRcKsUMrk5p8d+Eap1XpsLhLpByyFppAxqmb9fUwNmiy
         exnP3SXg6fRb739L78MAKGyyVTJYDCugKJ4Q74JKMIxPWn1cSc0UvmaxAyXJGqNngK0q
         NKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141741; x=1782746541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=VbErtD7OYlc1Qw1ppW3SnYpl+dB6kejG2QqR8pkDKzAyZ2v7cGGHS0+PYJJUO/8ddn
         m6COCD8fXoGNIiSGhxHQDBTYGxPZiCNz4o7KNPwnqtSqs0RdoQHFnNobQq9do16KoglM
         B6xOWDhUWVPBWJpdvqpyUQjQXYnStreMzrXqoQGhXNnIh556sU5VtOM4zYLMlI/DmdYd
         0mZoeaC2LvMVV/3pgY4cd9BS3IWRNILFqqSEC5Omrqny5jkbjdReqYGJL+4c+wOrCLCb
         lcnibIFIjSHtJyzJzc/PY5VSsT5oADA8Zo3QVarXAOzTeEm0CJZhKDodSdi+onkh3meB
         OEWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wnHOTGrsJP8rgf5qzR+f8QgRmqAn0cz0a/4botGs3UHPI27Vwsg1ExyGfuNGRcgiB/wvKQWGApFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJM2g+iUYL8KjypAPrrgGOhXA1o59tCKNby/OG3mCw0HiQ5I/f
	JIUGjpnHAvArkI6YfCwzAZeeqqkrf6o+WMw9gqz2CveCm+KvOexNdZ8iHTD59femFu6kcjDq+L2
	mHOpnFgC+W1R14gtk/rm572vseXh7WJNx3Duw
X-Gm-Gg: AfdE7cmKT3GdIHiN5kLBvk4bxYyQHlP5lFSJz/FkNmVJVlUsKSlWdH/4IqbhJ9Uov/G
	DVh4JdQnq0gIqsG7jqM6tZCIruLSkmmDxnoavFxWyO3vsaPM3XBWJ4dzekSzCJNwhmKp9rJwOVT
	6Fd7TYwt0P3sJV6P1xS9bABA0Ac9y5O6rc3t5DgDkgRZ+VpzKg3kL11uhccYOJey5w+o4lM6OPK
	wNw0HBf0XTWUbVEt1IQ2t+9vYAQAYHwTJqoO6qIyrVkww6DYaH4uBDoJVd4TYcEtY8PW4CAO0gV
	3V408IhGlrd/LvS6EOZamLH0nkohhOHACIYgifpvMsnSMZQqrJk8MsjauA==
X-Received: by 2002:a05:600c:6989:b0:490:c1cb:48f4 with SMTP id
 5b1f17b1804b1-49240a3522amr210880715e9.12.1782141741254; Mon, 22 Jun 2026
 08:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
In-Reply-To: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jun 2026 16:21:54 +0100
X-Gm-Features: AVVi8CcDtgtBvFzbVVwQSngIAWRif_D-KM1kC97DgRsKUSf_oeP6yHr8E0ZMKtk
Message-ID: <CA+V-a8ucXgZkQDvdOc7fwVAeh8HLuj9d9z0toHJYeg8UBSKhYg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jun 22, 2026 at 2:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the clock definitions and PLL logic required to supply the LCDC
> > (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H displa=
y
> > subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> > clocks.
> >
> > Introduce a new PLL clock type and implement rate recalculation,
> > programming and locking sequences for PLL3 using the RZ/T2H specific
> > divider and VCO limits. Add the corresponding muxes and divider entries=
,
> > expose the LCDC core clock, and register the LCDC module clock using th=
e
> > correct PCLK parent.
> >
> > This enables the RZ/T2H clock driver to generate the display pipeline
> > clocking tree needed by the DU and VSP-based composition engines, allow=
ing
> > upcoming display support to be integrated without duplicating CPG logic=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > - Added RB tag from Geert.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.3.
>
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
>
> The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
> be larger than u32 on 64-bit) is valid, but I believe it can't happen
> in practice.  Still, would be good to fix it in a subsequent patch.
>
Agreed.

Cheers,
Prahakar
