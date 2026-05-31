Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994C3603C3
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780216619; cv=none; b=RG48Kkl54qSqgLF3itnEBQYPqKwdmrci2FMoSDUJQ0v5PopFWA0sEqwYhRay9Z0jo6nDAaDRigbp3qB4eOWc+E18XQsi2ummfwwM9jJazV74M0URQd5I/a5xo25zQPlMCuhGWdo8Dr5k13lCslZRTsSPBSlvhu5578h3FkfI2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780216619; c=relaxed/simple;
	bh=VRoCK7u4CxDAaDhSmUkIbsYdQb82r8KYQ5s/yqVlez0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbjrGQtx4a92EgmNUWQhqnYFmjN0rhRLZxiurTJ7N1bupoicH701dcO+eHebl2Rv2018tXTawCAB5U6UIwQFXZ1QBWIhonLmhnX6zj9ScYpAxpl+Rw+uYebUsZzGUupyHmJoBoiNPB8iLtR1vBNXjGTRu/UG4gB7VMDyRgNpw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6cfcad4f979so381371137.1
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780216617; x=1780821417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBvM2ORohpXQB4d5IQuHmDJKKy3F6iaCOKJvYc8ytZg=;
        b=reHP4lA8g37e7nAgPXAvej3owadURn7YPWqPoljFzYAMBrS4eyEQ3XkPzd6yjk1sca
         oDOhOo/eFKaItyxRF5q622ZqYGQOdrAJFUg8a399wMI00iq6zQmpoMBO3jjbcEFeP3MK
         zRDW7sl9LJWdKlhB1nEMi7mh+Ta1uILF1tqywJYzAGEEGPUXkAJw7GUC9qaJpYmQL97R
         Ilfv6lRhowIsoFPJOG9fuS9NbUWIu/dg5BTf8s6z0qQc2dRwYvpofreqPPsv9AwCm5Bd
         aUSN6RLu1VrXiv/0w95RgWj02NuifWCB0Hb0bwfXrzqnyui73vdUmpEUSljsnOhKJzLO
         QJMA==
X-Forwarded-Encrypted: i=1; AFNElJ8Sw7p0d/JXu6i3iS4/YfXqAJ1NuWMpsePe6tpdeutf6qM00KnNDrL9Pr+dzHCjXJBBy9NAwAm0+UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKG8kMsJoxUybAuCYNxuR0i0HgxYlPnssZUyMl8Z/iXFAkJ7nf
	3WTXzbaE+8iGBHivplofCllw6bktN5aQxbuugAOwHOwn5FBZsNODm3IUTqz3Gw3t
X-Gm-Gg: Acq92OFUJsHgztkhsxRDtVTiL9UCBb/KEtW1lUUuH3PLGCpj1HpkiPH6ZpKKRbjj56E
	vvfeeuVoBgvnFKtDQz36TB7Lt2wMTR1nCgB+T1/LU5QqN4qUAaHvixQbUvOO+6WFm7akKM1pcea
	ixim0fIRjm10KvdxfgL2Ldkon8MdkGaMbl2O6jjal5dxsfB/0UQmm9iFP1G7Y53wiBgo3OP/5dI
	7eu51hzJYGV0Pwysx0XHl6k6F79d9TBkN8F+bM33jPmyBSrSsniYYhcMZhdRplUz+jv7wFy5H6n
	Z4shuwYXbwzKcQsEumgVLE+TjzhRJqHBBlkx7O0o9s9WLqczXacp6sSt85tG8SeX/X/KiltcKS1
	a3Lx7JTkRb4JD22JZNggw/XIAWPXF/JZRRpQ71nDJ+r+C6cRsBRztHjYAv9RZuM9XfzEY3Qv5mK
	ZKMW0pLhtHhAfCjXBcFWe/csDTtmIOUzPDS66Q0vrSNqz53esWnHHQIiVQidOEedIF1WEtdIE=
X-Received: by 2002:a05:6102:2911:b0:633:3040:ca5c with SMTP id ada2fe7eead31-6c698a060e2mr2753341137.30.1780216616723;
        Sun, 31 May 2026 01:36:56 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81ab8a5sm4113748137.9.2026.05.31.01.36.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 01:36:56 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6cfcad4f979so381361137.1
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 01:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+nTxDDRT+74Ly+gJBPQZSbZOpo4B7faHrZyUsYHj73fuIvC2rN0zwqp+PMhfrRwBTV4mJ5h04ldU=@vger.kernel.org
X-Received: by 2002:a05:6102:5344:b0:631:4cda:3ebb with SMTP id
 ada2fe7eead31-6c693a257bfmr2158834137.24.1780216616348; Sun, 31 May 2026
 01:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-4-marek.vasut+renesas@mailbox.org> <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 31 May 2026 10:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
X-Gm-Features: AVHnY4JIRr68RiPmOxbgFI01Y083MJgBCtNRl2Ceai1FVE5g6dLCk5lLsnDcPaA
Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 4 May 2026 at 16:46, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Document backward compatibility support for CS2500 chip, which
> > is a drop-in replacement for CS2000 chip.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
