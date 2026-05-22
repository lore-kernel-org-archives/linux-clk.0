Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F03D25CE
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464096; cv=none; b=Xv2GqEONBvzFj9FXk5aqnhiUsAGhKCWuYw9Dzi95PnVGTWULfmXVzsXQOksEpCmXMIllLN2J5Xie7U4oDwKQQnfxObB+K2WLGD6UyDDXHlt7zWbDKVethlj5Exp46U5R1UjJKyEomFavzGhnfTxfA7U3qRNmhWw0bdS2wMhW0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464096; c=relaxed/simple;
	bh=RcKm+MJQR01WbzgcsBzYoy8Uo599kOW4Z1qyK0a9O74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESgsnwkHeDhoAfcZEmYDhrgHIXANwnziIaJKGWlZSZFadogjKJggRlkHi/XAAQBvDDQa0LItmwDuxYXDFeotHNvOzF9l/dR6s1JfxCnOoZYS90kgapXYUxKLq4ZLPujVq1763qs7GSMbAzuJ/yrkRFPQSoehHe4riw29lC+pq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-577500ac0e4so2482413e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464093; x=1780068893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FixydBMStjIkh+xhknFyVmJmnf/BoQ9WGZ0+yOe1GDc=;
        b=rsP87l0kOvsTx8TT3mdu8izWxWOeKiDvmwjgi/CNIrqp7Wu4jTMwbPPpsX56BxZ2z/
         eE1IH0moHypWnVjSRA5XLP61YNzs3wgQo2gVkSf0I9bwF16S5riZoDIC7E2dl6PX5cP3
         xLvVTiE9r0253uvpmLwTDSKPzqME4/cfGrEJeikjW62uxILHQYyoICJV9LtT9myrcecM
         FAvnf4uWScpPt1TuaZ7aImUn4HmlTo8dDFTxc3X5FRFJCVoX7Iy7knKwpiCU8nXNlv6Z
         SoA1EDWJ8QSNcuGMbyhqi5n22NRmrxRc/xyYqMKTNDL2ww4Btp+NP4/sBr/3XR2Qf5qq
         zkqg==
X-Forwarded-Encrypted: i=1; AFNElJ80enM5RAkFS3gQA+ClCPQwaERdsCJiqZ/al8rwusl4rc4P2M2TkiHPV/YgjtZmf0DlxJvN1BWKEVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNzxtBpauqlohXPXX77YkkY21R/F2Om8A+jY1buK5e2YIZY2g
	Bkf0ZGsaMckRg99v/A3ORC5oaUDbK42nTII9WgI8pO5Stvyf+ZfeKN7FgbcR9X8WdBY=
X-Gm-Gg: Acq92OGjB3fdhFQJRDDPxZg7H8OK8m/bvwooPJG67pQ5LBkEIYhMN4q5uXlQuaZJ1Vz
	Ftaqa9PDDD6ThJBzuGrDKwEqwEZkyBDMVaK7Yr4OLppREEE6x0IOaSUlj2ZfG6ESpO+o3fFi4dH
	/uqt/JzQxg6IEcelqbHqw7wJpySaUliZs8+Mx3qh5pBw/vTWWcTEfYJTse2xGTiOM9YEUN+11bu
	rOWmg5rfdFniHZhqt/4yc9l5qLIox8kqfLNp/8LR6QX7y1brbC4QOSo9J7wZOyN4m9ulYbYrnT/
	21qRdoiaqV+duF6xoibGMBgXFyBc6koAu67vsYVFoGuLEiTu9UZNOn7Jt2Xx5UsuAoKUydHKufr
	IoCpzZ/8DqoucuAmz9sH6Wvr5jzKiHLH+y7k/Kw76FTlNHUx4Nfzwb4m1uwTrTNQ/xlgWeG/Hya
	4CsWYY7LBI8kD258ETKe492SPNCLAadBsKMd8Ta6MigBTxzUPgxZEZlzcZmNx8mlJf0tavGxiBZ
	iY=
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id 71dfb90a1353d-5865d70cb8amr2549671e0c.1.1779464093401;
        Fri, 22 May 2026 08:34:53 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173b6b08bsm1973967241.11.2026.05.22.08.34.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:34:52 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57602a2d80aso2393392e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/rsjg6YlpAGduAiQrWO0aifkZJv/a7GjjYw+AEVRx4smreRxBm4UE6yxAGZc+e5ofc4x2E6XebmRo=@vger.kernel.org
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5865d70cb8amr2549460e0c.1.1779464091785; Fri, 22 May 2026
 08:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:34:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
X-Gm-Features: AVHnY4Jf1Pww2GHfOAXrLj07kMcY44kD7u6kHAIZKMSWedE81wNkTdVC9LQ0_SE
Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
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
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop DU until it can be tested
>     - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
>     - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
>     - Disable ohci1, ehci1, usb2_phy1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
