Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19753B61C
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870708; cv=none; b=Eux5g2BeQntOwlCf0xGITktR+aPd+XMFTzCWy1Zb3ZnlB1ERvnZMZflRUWk/GrZGB2+cixN8sr6pciRQ7SnnVvMR6y64OWk01n+LMf1cdZLF/HGybRvT+Z6JaPZIFCYvLAwnKsBZCbu6x3XRa7QIZB/ZBE5kJOZh2lZa7tbps5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870708; c=relaxed/simple;
	bh=xjqICCjmH0ghryW8dOBfRncjaOxBbTFkSNvlzCO9/PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWS+Tjm/MZ0ClljsL1D7MyCiaN4oWE9WU3/BD9C6olR2mnwUsZRxJNHOf8Uz0BM6M+sdcx5cuAT1h4mqs2cAOsGkdBClH/yHkP4vjhr0RweZTOg6JhgXthsGmxffKJEFJW0NSoJ0FPGj1OqLK9VYI9CHA+H+D5A+CgHl9so1nYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so3475666e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870706; x=1789475506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvhvPfE1o8U9V0xY+ZBtjmprcW5MUShi55REbbGvMBg=;
        b=MVseUUhjZ2IKS6vTsyCB+62c3NXMSpm6FOVETdXa65bTb0x0iOeepJYWGXXSc9PhlW
         PZC4iOmLRHwh64JJhMEeOzLviXyBKgKmqhfEDyam4DWm55xWoGKYARTbJf7u3LEqwheU
         HldgM+ggs8B+KJJzknnYArBWD7/Jvjd3AimlipzbR9+Ra5BVxBloY71pV+xijCOHPNl4
         2ynHeUQ2v/urejyMmPflbwnN74rhVFdjay7kF9+aL9b0U4PomxlR4rgVZqMR6W3+JnSL
         qPQ927GZWeLxESXmHPXDSFcieUlx2PUUaMVfIjUNLTARQijlSb1uE+1sMGCRPh+BhyMF
         clfw==
X-Forwarded-Encrypted: i=1; AKwUvBwa2EXvyfoKmXobNJfZcGP6L6LgcWtAA7MpU/APZvDvTj1Kb9q4FzBtgzUBYMWebDVQAzUqpZBlQSY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1Oo0ObT1J8gnfUqeE4bg8+dlLBIu566autgYg5qiffjiCYlSb
	2pKeC29xjqcRIGmUOuB7H2n+aFq0GNm0pjZ6qyPtg4LwJlPNRlkylgPIxUkH0T9b
X-Gm-Gg: AYBFou2lMpOImOcbhhQF0fJoJOcFSs2meRTFWU1N65XYXnEBDASX3g1iev8aZv+xlER
	N8IyvVcRDez/Ci50+nGdo94Qy3l4Aeao1eLPT08km/inzcBMn3eqjBWzzS7i2sRijWViNTFk75a
	OfI1CmXzyM5e0mWrhrCSAKNEDUDxk+2wWtOTfjW85Q4w2j0ubZpYZSiOF+ID2uTalwi/54hCqfz
	QrxNJMjlMGmsuHfcXCj3GhaGJhnKiKHZjlAE9bHt20TZ6wJRAqFTF1UDnq3VPj7i3DUKxdhr1ve
	NlIO30IrykBBwXiBIAVUlEoc+LGYEz/edbwM+zXfsI7hjNwAESOEm8cVLNWVF9Nh32rq7i+QEgJ
	nws0os8V/ACY8+bn68CpMFg8nD/L6BQFlrDgX1/P3DUtjzHLgvZo9WHsmby0fZZhgcoamwbyif1
	HQsDWPjIgR+wf57GoV5Xe8anTjEZl5GaajNkCkz1Zn+W9VIcpRbK2CtYOEUNkRbn+hWiLqDvCt5
	bowoGDkgC5EUPRE5iuoTS930slFMA5Fbi5L
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr14477012e0c.3.1788870706229;
        Tue, 08 Sep 2026 05:31:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8221316d4sm867953e0c.1.2026.09.08.05.31.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:31:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2398577241.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0v53qhLjlx7WB5lRT1rs3Ec8Gb9ikHu5OCHSKBKp6Wrs41sdpz3XZVUiuGnW+eRtfYrihUb+heWQ=@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:784:b9ec:913d with SMTP id
 ada2fe7eead31-78a4a91b281mr10556868137.8.1788870699731; Tue, 08 Sep 2026
 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
X-Gm-Features: AcwNN1VHwQtBXkE1g5B-tKWZHl1EPxPwrUnATnMeQZH1DQxtt1IMi9pdue90c-g
Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> multi-function block that integrates several system-level features beyond
> clock and reset control, including clock monitoring, write protection,
> and peripheral configuration registers.
>
> For the other IP blocks to be configured a syscon support is provided in
> the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> registers via a regmap interface.

> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Register SYSC regmap

Thanks, will queue in renesas-clk for v7.4.

>   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
>   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes

Thanks, will queue both in renesas-devel for v7.4.

>   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
>     support

This is now in watchdog-next.

>   watchdog: rzv2h: Add syscon support for WDTDCR
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

These two have a hard dependency on the first five patches, so they
are postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
