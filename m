Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7834014BB
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463731; cv=none; b=COVXCKT+aQgbI9nd5VTNqkchIw5CS1R72yR2cWdJ2mThxLRUHlzJq7fOjtAzzrw1AE2QYE0ikTp7mfSSs53RyXIYVQlATYaacWODUdFvZRnAXxvZ7NqkciXi6c7hYE8OGn4vQ4Fw/SepWsWVOZGKDTcwIlVD5Hm+MpgbFzN5KAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463731; c=relaxed/simple;
	bh=kN/9y9XwGUDJ1nAC1IWWtL6XoKcE5qMK3/fWnrEnzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjxI1DUEfr8Msr9wSP5WAPKS9u94kSvPBXySyAXIi9c2SIzrrPUrgSuFRilqkcA5cEfMNcbTEVu9Sivq88CgFQgNNeX2+8tPgy7Oy7lO1SjsfF1i3/6MZ1N6urMfKWZWVHoihomg20ViR6bzj0WmTkHqtMtghxwyQkEg8Xo4aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57512a429d1so6150718e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463729; x=1780068529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szBb9VN5OI/LxN852+H6x+3LXcGPvGU0m4BLzBAkL+k=;
        b=UgYmJjKgzBIgChL7K9Nn1ITUTdqS/Yt2yKPAQEA430N8N6500NbzJ4WXs1zUYwLbto
         Zl6CypptmZiNEa2zkIKmXP6jPcucRgyUikObXaiPUwW20LatymBifYPiYDSFT+a8icia
         3yRuRtnmKp3MRhoAg3HU+JPoYdigbKvHUMEVIUUxd4ArF1Th1iRv5N5/B1+6tV3jrvRd
         KVdFF2l3rWSLSwCz+aO20Op18TC8tVXiLpj9EqfIvd1zp6mRoK60kMMp8CpDJF8b9nw3
         STwwBsQ8H17UYceoere4hGtqL5n2XMXeGlQWCi6t05ADiuBhTYL2RM3WVuMkVgreheCi
         V/Kg==
X-Forwarded-Encrypted: i=1; AFNElJ/8hXy/aTuS8xBWSSocz1w3zc8h7je85/PgDUYMUQ8vGHidLw2pgFGwlo/BG1lC2F7O8e4o3L5KZ3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgPa5lWttip3OVi6kyIbAqEfC0o07TZhrlJntyr+SnCu/9XTO
	SBhRSS3XLKEVetZRimitWa3/fi5sVMwE/tvJHVZoRjCAMqr81t5VYQU3/5GfKpe85WM=
X-Gm-Gg: Acq92OGeYRQHbqbgLKxRRhxbCzEaLQFDg/9XbmMOqsKIK3bXiRgHZyICNmHZXaySdD4
	4nmHn5maTR9csz4/bnmDOgC5YkFpZ7RWxw+E3fQbB/tmkNlHZrM9jwLnps/mT+Whxd4SICD9JBF
	1IISMs+sEtZEGnFpQhJ2Tlb0Qn6OjLVjaj/yXftG8LPNaHI6SlbRhnCTdJbOJ0f9rVLc6uLbEfQ
	bWhHLAaQpqGsWCD93pQDI2qoQQd+dav5ZtliYjUtIsT7yu2dwBO6eJ1zNxb5/oS0yFQCZVuN1CY
	f4I9vnhuwBvktVTDOVY3cX1Q/eCK4BqXig9R+geqd4IfmpmXwLfmI94dkhHLC/VGS4Nr2btZD5L
	DN/239Dbm5E/fV1qNyU/c1CO9uorAc90IY/1XJAL2MfE6JO4Bv9NtHTbJdq1CO/dj0wCIv3ifiM
	XFKx9pcyNPNyai/VHOTcG6sT5q6OFH7pMpPUSXG5EX6yVlvj4TbHiaxILoDxoJxvFaDyf9QU8=
X-Received: by 2002:a05:6122:e26d:b0:575:e5d7:6f1c with SMTP id 71dfb90a1353d-5865f625831mr2624528e0c.1.1779463729326;
        Fri, 22 May 2026 08:28:49 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f3c003ffsm2581493e0c.8.2026.05.22.08.28.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:28:47 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6312af106e3so5851668137.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+C80d49M7dXlljj8l2s4Z4XYbJaSfbev2kVjZoxPmgocVpobrKK12R4t/hbyF3xXISQvJJ0lOfuwU=@vger.kernel.org
X-Received: by 2002:a05:6102:f8e:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-67c70e5f66cmr2706370137.3.1779463726809; Fri, 22 May 2026
 08:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:28:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
X-Gm-Features: AVHnY4K2cO6mOrwYyMVCwX6fOKSnvdh0vCSY19G3lWwxUQ8j7rXhdTpY2ZF4U8M
Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add AB from Conor
>     - Fill in Geist (RTP8A779MDASKB0F10S)
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
