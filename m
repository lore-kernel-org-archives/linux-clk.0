Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AB56C650
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884556; cv=pass; b=gwNcyhH4oypR6jQLU6JZ3a9K2LsPEC9oGcTHnm+3KGdsLn5Uv75J9CgLlG91vz3AtT28muoO0N+DpdQCA71Snn81eq0Qu2NFNoXogr5bcD3jm8gXwnfX2g+SqtwxrDOJAiYVs/TRhkXDmyHukarXNKKDJ4tw5iqgh46tOfVCGTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884556; c=relaxed/simple;
	bh=gx0WNzHrzpR5Vg5y5KJZ32oxwshPQgn8Fi9efTzEQjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxVGjbEnR6toxEadmd4mq3bxkvneAJ6TnSAfUI8mvneEWnwlvoPnzir5dWRlx8wxpUlFv3ySxA3tdA6LJw1/1n1pdY7vgZanUEA5cCWJPdPl/uLST8pD0QoMdEEmENZ1rHDflrlBkVMT2NTS53nCOrYyXNpWEeA9dOOXL7dxMEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHI7JKr2; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHI7JKr2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843f205a5bso3031456f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 09:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788884552; cv=none;
        d=google.com; s=arc-20260327;
        b=OezAVUUouGTb28IUznB8fCfEjN0m7hynKSXr6eIq3E1isppyCiEDr7+XtHU3uzCEnA
         HAefbHGS6Zi8JEXk0nFsLel5WWbuRJoz+o9kcYXwlZRsbW5RXqe+hVWZgbmoWcGzeXLC
         mpzQ3dmnv5dG78be9X/4uCcoO3l5OzH1cKfckDVnul6BivKB2/lKOlbbsqwIICivI22P
         ulPCRrPYXc/Wu73O4XUMjOvT6MD1mKejbAGIuGTGRmuAfKIPZ1t/m6PYhZNmyKBXId0+
         5rknlONqYCYrfO5KGpi9AX9Dyz2jh0MjqzO7OmDlIcbKBv5LUNyLQW2/plFXWJOox5It
         3AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        fh=e5wD4ov1PG0kfPGS2Id8AJJ3+I6D6Qaz370ADlCpUSs=;
        b=luBSnAb88PtjDsJ/6Mp+vk4LS0KVWCzTdZkuE34N4YveVCdXindDDSIrJb1NFO/HoK
         nCT7RlldeUNBwG8JOIczJaCONoswJnZ7FNezXRXs9kfopfx9HKvYibppSPVu3uJ6XJGN
         /K+Q7llr+ctkRVP36JTJjWTX7UczI+mspPTSv2fVfdQE1a3FVftuk7D0oQv7LeXmJFW+
         kqQJaYKNrvomP/708rPR22J03wVkwmXPvRLTOOWjR+jMIKl+/V4d18Haj4n2nA4cbU2N
         vjmpGu0nXvt3Yj25pyS5NRIS9TkB7U2rE/+TjkSc2gBriY33Bvzry7gmrTBm+FyxUAUv
         uUIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884552; x=1789489352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=MHI7JKr2kkr24YW4snLpJdEML8QbgbEuKlTVoMWeXvxapQb9bE9iEJ/apSQfsEBCyF
         6UK7QNkxSB/f9xiBqGLkw/iBAFfKmaoStMFU0SS5vDwnJAGG+tC7GH189zop7UdBzH8w
         nwK+VulVgJKrc1YU+MG+M392P5la+71HfwYsPHAQAtL6Wmj11OiTlSRr3/2FVb7gcRtK
         kzeWmmZTOwgHWcLQ2wBGrFe/9jhFTHjnktsABOgWj2M/hW1C+S4I+XMRSJOVRPGTC81W
         1m9LjXgjk7Udg7NCQtPn+rsj5TDhUg6pzer5U/kGbQZXLXNO6XY0wDlRDF54Tgi9padj
         LwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884552; x=1789489352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=AhFQ+/uyF6GHIsth8F/NLeHe8JTtjEuwYTDFdWaUs+o35VmQ1kyOz74i1MbVc073M7
         RtY/AeQx7ZUlKhVyQy0gz0rRbrbyHM98i1H+ztyMmNy2f1/mC1nujHUbUnlrWgVd51DL
         vmwDB6HMYkryaWuDCdllwCNbUjoxTurN4iXtZqkHt5WennN/A8pPoOosbm6GCFSOrjTh
         h+Z8nw0Yg46XJq/vSkVhYp2tpru7H1Z7/13jilACFUXMdHfGOFIgIAhn5HVPeyfnyJWy
         C7qigQz8xG59QricKQC2TfQu1T5iH1meUw7JgyPUxk3U0IE0PSI/SYep/Thw2kU4RSol
         Qn8w==
X-Forwarded-Encrypted: i=1; AKwUvByBIXdwbz4ItoikkiEntNC6biS5cXJsRgeQNAFxk1I5bEcESDaPiye/FAAjHBMoHa7zkyF5KNUKIAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kgG6PjMvE9kT/+xlLn6GKyda/Xy1xZDhyxXBpY7Prm9vf4MQ3Q
	5zzuSfgmhHq31yqlBSd9khOCjtpVmhRYr8L4e1S5SOmf4x/qNqXv9K+gZf+QW4oGXiUUvfqMsz2
	VXAwPrr5ptfd7NoZff3t93NJKVH1YDTY=
X-Gm-Gg: AYBFou3EcPwMNvJXQwPokdChkCeZfi9OJBimHz0GFGS9wpKfab17ngjlhigtp6QGz1V
	b/BbNhW+gbLE+iR5z7ZmKzTwAqqK94tZ9ZtXrADoeRVxUbd6FMuEBgAdUMPHMAcLbmwQHyyre1P
	FbvAb+cbjpu97TrY8GB+3FkwJYAvBo4GVzK2SjVCwH9TEOs05s3iT/6XBlQkmIcn9YR5PZDPPY0
	c/37gFFDg82K+H4Mk05sDiw3lgW9mZuYVOFOQZvxJRDKKDW0m7KzN9NZwNe88LMQKnyDJjArma7
	g+CHAeufLmQjEPK88f1sjE9A+2maQghZ0Actzj0aT7sDqj7UQm9Z6LtLsymjRSc4OUwQJYCw6Bv
	6ANDVRy3AV6gTmFWatkzw2LBa0q9OuQ==
X-Received: by 2002:a05:6000:29c9:b0:485:8ecc:9415 with SMTP id
 ffacd0b85a97d-4858ecc96bfmr18626346f8f.48.1788884552482; Tue, 08 Sep 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
In-Reply-To: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:22:04 +0100
X-Gm-Features: AcwNN1U9H3bV0zPtcgBr5_fY5_Ex_KcZm0AWkc_KXas88ZieEy0_hzjnmDi9vSA
Message-ID: <CA+V-a8uSR2jgpYqeUxteqhSD-FuxKBT_o2519y1z35cg+3XOig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Sep 8, 2026 at 1:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> > in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> > multi-function block that integrates several system-level features beyo=
nd
> > clock and reset control, including clock monitoring, write protection,
> > and peripheral configuration registers.
> >
> > For the other IP blocks to be configured a syscon support is provided i=
n
> > the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> > registers via a regmap interface.
>
> > Lad Prabhakar (7):
> >   clk: renesas: r9a09g077: Register SYSC regmap
>
> Thanks, will queue in renesas-clk for v7.4.
>
> >   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
> >   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
>
> Thanks, will queue both in renesas-devel for v7.4.
>
Thank you for picking it up.

> >   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
> >     support
>
> This is now in watchdog-next.
>
> >   watchdog: rzv2h: Add syscon support for WDTDCR
> >   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
> >   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> These two have a hard dependency on the first five patches, so they
> are postponed.
>
Agreed, once I sort out the series [0] maybe we can take all the WDT
driver changes via renesas-soc due to its hard dependancy.

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar
