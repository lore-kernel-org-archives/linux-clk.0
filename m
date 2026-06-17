Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED027FD4B
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729389; cv=pass; b=XPndpGcg0eYbU2EMVj/WaK5ow8BTMcgslBPZUInSvWQ97Jea0ogpSeSQ5vtxjWzlUhfz2c2JyMkTUx02U4Ff3oTo9SM6mxKlwnrVER7DhKR3nE6v8cpnfu29OlhImChw4D7ZHECaUIptToA5MBrjpTc8G+5jBtFT6+Yxfo0TbPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729389; c=relaxed/simple;
	bh=8riQs28c5CEk2XTXUUBXYJHl6xc4h6FhZF3t0ruzM/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plWCk1/HLIgzJavNXTNfPNC2m2BbVBw/GXjib36GKkIyN32PkwV4JcFtmegFagkPoZ5Ffg6TfjBtaWzCCJzdnxyZLvqvKPP8gvZl0P0H6pmFWzUslQqp26lfLEqwyMjtvq4DNcodmvgkgwjzg3EOmF7zjoACt88qzd18dNyL2L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QauogLM5; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QauogLM5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so193835f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729386; cv=none;
        d=google.com; s=arc-20240605;
        b=bvYsMj/Z9gbpSuZmqsXNDZmGru+Ts0sm1e3FIr6c9g6E+U518qYj72Ukh6x+JaYuY/
         Bmu/Si81QTUTLD5LxLk/jaOlpHttxTg3ms4NPwlTgdTtcIt0BxNLhLoc5jm+7qsO1nji
         sm+F5i7PhNJ0fFZikY+Hklv2UIVN4DyWx3otHTt91kyuqgAFyY3L+rM9bpfWiySly9ux
         M7MFKRLz6wtXVvYTF5Jr796adlL/23NGUZ13INVyT4JtAZlv0Ic1BMe9IOgrpNHaez4A
         Bv5s/aKd4n9q9VdrX4X7+Zc/ycVp50fEfCSvqwzzE2pb9x5qx/SP3NsTZmfO6tSenAHl
         /VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        fh=jLZg8pmllq6isAHRlF43XldxC+Oj4DrlOTFGuWL2Jsw=;
        b=Uo0/c9G/SLbmjlhWd0zCsgnoDrqoNS5O287u4gIGqykZ2qnkmt/ET9yTPbjZk3pDR+
         q1DlE0FA6irZbxYtmffYPSMmQdDVFMWkAiz/1Y0iWr1khghSdjd+2Fjrl664l3oBeoyT
         Yro0YaB5Z0+Bg09YXiuBxzqGRx1PcPpV94DgTTtgK9+ZaSZnDCTML8Lh/7tsX84NTLCA
         8wIie06Ry87WGTqzCZHQDlOw5Yxvgxsn6NU7I6Vz/FYS7q5azUMTVUybLJpFn2ume2ka
         5bNo6Jnm8FPXvbWQ1OPqBK7Goc/ew9tWW7WmJcEWmbpHeHIo9Z5petZ7XKnBNvbylzke
         ROfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729386; x=1782334186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=QauogLM5z3vcR02KJOAwodPmp1SbhNgnfDTWwSGr7oBe4pneIR9CZ8z3g+VJGK7ZE3
         d2g9dP/mgrhiwsNGo4ZP309N9aHw+jDc+cUfcB7XsDgf9AdyHOCTC8h3pFJte1KrC6NV
         J2hFYEbOpAT6PxEr50+9Kxmx0SJ+cKo++bjGWmIUcDLy3GQLCgpcE/UirKjpUpOuuN9W
         E6rlDxUW0VNvoRqZtOj/Nma4Pz03KHqvlq3GjzNzoj3sLDzdK2V1rcp392js59/+pZuh
         Nv+0iGag7kqC6TLVULf38Gm6AR9zyxxCBy4njCjQVnb8bckv1HNh05DzXNF471OhzkPh
         yQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729386; x=1782334186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=HyG38JMuY+PXA98abcI5aVk3KyX0K4NFXNI50ExNQoiiT+4X9utUmKKdLExnWq84OS
         3ux06hB9uL7k9cjkLOWoMzCzn/fcTf3I1U9cTtLPJyvZ4WFM+oE9OaLZPRUqgnS3rI9Y
         anKDQAjEmNJESM78lhl2ujb5tkEePgFqaF6dhRKXzBH15nSKHUUSnAucqnFFCIo8ZBkD
         N7d++yVqho5tFPABpXeTZ6llVwINbW9Cb9fbIgbx9L6rfIKhPAbX+GDr44HY9fvaeyNh
         xAO6vTUaaOvIz8SsuvOsbJ3YT1oV7jz0mJBb4fYdF4uouptcuBc4tcO7ArvXVJb7I2iP
         Tw5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+4oMSRbovmLWKBo8Qa9TsRfN0xK7esCcyg6uSOoI3f2qM+Cpg9deJ7tKt3y9Fl6Zr5ZlI6G4hi+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4ToP8YXOoL3r49rI8MFObW43T9PAMtQFHL2hVFizoXhyP6J1
	8owHP6EUBgH/29E2qx3IcEkoKyVO5oZH7KB8M37r43Xd/5jdnpA+NzW5H3ES5UevJ0SpokZwTF3
	dkDabQ45mpLfg1eEUXUvFcAD0zSzuR+A=
X-Gm-Gg: AfdE7ckMExn4cgkFvlXLpuoEoqPfW9YF1YuF+NEFRz8bZ2ijP8WEfXjhi0XLxdbncLl
	A5wJASgPEXcaFjVnZDHrbAMaOefrLffwqROFXQVhmu1KU5tYfM9xhs7/4eO0jThnhZFBKCxvdDS
	oIlzPdS0b9ey/nPjcs0b/C30cLb4bMHs8K2V1FdVDl7LWehH1P6m/bmxWGpOFtMa7E6C+SErJYv
	amkkjoM6yuIVOwPWa4IO2XeRFxjv+Hrtbg4xe3aIrNLRXrIfb0hj7RpcTi5s76v3AgGm3pJV2fg
	NrfrVvo2jamjIoTLGpoRVUmdec7RTkIhuIeR4RIMqILMnytMTuXh8Muzz5Y=
X-Received: by 2002:a05:6000:1289:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-46235e9acb4mr7940736f8f.3.1781729385759; Wed, 17 Jun 2026
 13:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:49:19 +0100
X-Gm-Features: AVVi8CfEsllEJEwUR32cqZ4L1WJgMIiJ_74re8ZjTdVt3p2wYsrPrSguI2CW5nk
Message-ID: <CA+V-a8vdxgBUs4Z3GYJEtP82zAUA0gTKCCfu1Mj-O_1XabVD_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
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

On Wed, Jun 17, 2026 at 11:19=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC=
)
> > on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> >
> > Note that the LCDC_CLKD clock is utilized as the operating clock source
>
> PCLKRTC
>
Oops my bad!

> > for the RTC IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in a branch shared by renesas-clk and renesas-dts
> with the above fixed.
>
Thank you for taking care of this issue.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
