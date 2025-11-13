Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7D2DF144
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052839; cv=none; b=ewiwI59zRCCEdQqgrKVc+JAuTq5YF8aybJts4jk8PkMizbKNRdE//ymgQCKTx6/xYLpy9ek0+XlJyilCzYfUu7Rx5Ol2rQuDb1QgWnOFBZvEa6CXlfc5RF2UUsxY4pSGQfbTzEXWPB8oUbCQwk588W0Z5BOjoW8cNYuMgLfhRSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052839; c=relaxed/simple;
	bh=JsV/8/54jQvxd0kSYYLeIfmgPFGknt20dq0zvf6pcTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhvCFpHlQYQjPFLv8xMJPVKt9eRdiSi1dexl5Hcr4nveyTF+1mpavwpfRG+x0SS1WcTJt6XZkYVCRH7huowtoc61HxevW2p3xnYHXH2/7+AMOtrj9SSgJMMHYBElp0e3BnHLjQL8g1JVLSVSLRjAOEY1BXPyT6I8JT1NuqhmjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55953d7486cso604501e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052836; x=1763657636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALBRC4wvbYHISURwEdik4fuZyBrb01I5jhftggw+rBA=;
        b=oKRo8Nx+Ssu1REmlRA8d7Mh/6koG02KoqmpghkzDeJISu2aAK1IsOvaxJvI/DaSdDy
         1c5vPkxcpihekE7XV3iMIGRDcqfOpEwZe72CQNy0XZmTcEOQ0Qpy6NSXTtrgYIf5eX5m
         ZLorqnnTfwkR8XsGA8p0PZb/k4zkR/IsOp83lGkK7OglnQaP3ljIwa6RpbYB6juq9fIa
         To8L4IJEqs1UrfNw5rb8RCIWGUzTGbIyB7oocVet3X4CnjbNTzwNTHdLfGUjGBYFNuaR
         9R+/Pl9RpncBIMR4pm5G1W4yYBf3f4w7i3Vnl2xr0TYZOZOMaqXqTxzxkEQlLN77mFBp
         COTw==
X-Forwarded-Encrypted: i=1; AJvYcCVZBSmEJXGWZ+MLGMQZvRfb3nXdJvXkQHG0krd2T0GtNtggf8RntucIaU1MDyJyx+xCfciMuFxAqHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+Rq0HjiETbzKhABkkGgj9xAAmeP9AF6Iju8JuFtS8VJn41pl
	13LdhwTEv4ehyRPGVZuvgSsQKqf4A3y/FYCAKs73B5it9tNV7A+T+mwCE3A189EIM+0=
X-Gm-Gg: ASbGncuHrDtuQa4HdTI216CDGp+uo/nqMh0IEbjBBYSka2bK8rZlhj7UJ3ets2r2F9C
	7Jnf5IP7myOpihyrJ1Dzo4zIWEuVrZssgUGqBtfHIC1H32waK66jXiTQndeylLKxvEjYjWLyjoc
	KiOBbXEkwJZGnfQYf13dtW0nv6vIXgNcLhnrSKBZU3VgkN5j4mtnnVhOBX6uDk4Re04PdgEWtcF
	o4fruZXr1J5zZI7Zyjr3FY5+bJav4D+6nMMrF1MVOy3Ick0n7myJh3qGAmQqr03v/iK4RAXZ2qH
	drT//B060Fxoz6RSSqA3nR1TC+FpIEH5KNf/1aLne2ylfl6tqy5ngjmq5F/Yw/o/rAAU7JedD2i
	AH7ohvQ0ykZcjGbFFhMmkyLEtPYuTdL0bE/9Oow2fXHD6S1WAHtqKpQuFzSRsWpv+iYvvyv4bRr
	V1w//PAXhfWXlAbCkpVLcQrVf1Uc7mAXjJsVcPlw==
X-Google-Smtp-Source: AGHT+IFX5Acv9UUm7kR+hUD9yop7tM59GVpvwGRQsMarA6nd6ZQdwuxGAdjj4LPNQ9evbHm095B5Yw==
X-Received: by 2002:a05:6122:509:b0:55b:14ec:6faf with SMTP id 71dfb90a1353d-55b1bed9960mr185268e0c.16.1763052836375;
        Thu, 13 Nov 2025 08:53:56 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35db02sm837195e0c.9.2025.11.13.08.53.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:53:56 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso528784241.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJlu5nxgykCYXDZPhtU9cDdKKOFO+xSZxZBgwTd7obCxoU5bE9tIFeOkbUOitxu7ZA77q+dFazgXQ=@vger.kernel.org
X-Received: by 2002:a05:6102:4b82:b0:5db:25b5:9b5e with SMTP id
 ada2fe7eead31-5dfc5b93ff4mr177461137.22.1763052835289; Thu, 13 Nov 2025
 08:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:53:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfHwht8VUSyWHJi90kgt1gnz7Nh4VEBfoBveaZsfquhA@mail.gmail.com>
X-Gm-Features: AWmQ_bmlVtkk56vOIDIOnwx-1JovK4RapbFc85Q7wu_rCX62rAKZtONV7Zi4F7w
Message-ID: <CAMuHMdWfHwht8VUSyWHJi90kgt1gnz7Nh4VEBfoBveaZsfquhA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0
 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G056 CPG DT bindings
> header file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
