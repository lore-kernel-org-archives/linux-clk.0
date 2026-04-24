Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C583C1991
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035893; cv=none; b=QlB2yM31mPrQkoHHMkx5u9V73pNZRtOElZPLDMHOkbklg+LUerBndhgFzNvxWwRspYub4Jedo4mmC4yyqkHuS7wpaD818Vo7jslTEb0gJrrKjIejpBuEHy8oFYTfeR3M/t6Lcr1lw41m20iXc8r0D4hmshGJ4bUqloxbem6dBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035893; c=relaxed/simple;
	bh=jK60j71r/PMCLKQKB8efHIPJARlwkjCBCLpWCUUQ5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8eucmWA3q53PrJ2PXqzIuZ+71V9Bd6qLNW1itbWP4/eKT3AIF9Cs/eklNf0lSH40RRDDRQKz9kMVVTjZ6P+6nVA9KyNYJJK++nTLD8wfUcqMUOvvtnrMlesMKD7WZLoxDGTKuf2n4195pOE9vpQ/19/b1iaCYR7FGudTFpeONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1174750966b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035890; x=1777640690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUxa5Yac5JZ/JIOen5ChIgl6Jr4G3NyrY10W57+tI7U=;
        b=ZP1TzcEZqc1KYG7ytGKBhK1O4N3gWiEw+mEwR4ucBTCrUCLDMhuZbaKwFsOTWbR7RI
         7bcO9U88tYN8iF8tbJ2W7PMfhHVHdulyoHFy8B21MyBYuY1JAqugbKnd5gM6hG2Ttr9b
         ce59ikkD8e50QYc6o2+JizKKE4l2zyjnsO1kmfEEaNEurFYwJ5KHUuxWA/bzzjDEaySH
         3nY5MldZ1Z9qAIXAOJ2Yr9+5/A/tMIAJMR4RjvPt7+hk0mZlDOgodP1dlUCkvXDKpsQp
         3lj+JKOOV1YDGIZsyXecLHff4AYY2pF/uagbt42qp9LeMvINchtmFPQ1bSnwzkcvj4qE
         Qncw==
X-Forwarded-Encrypted: i=1; AFNElJ9C1wgs9rRz7cDJX7oSX0DNb0upmpm3wROK1QOG37w6AJxEAr8iK2L+nr1hQ5ASxBx30wGfU8GJ8xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+FdGLwBTLvBRtsFB3Q4kj9SohgP1d0YgT/W+XfvnczPZEdg7
	0FibGOCrfAXb0K1H9c7reYNX/dfQi43qiCTAwEgwh8SDSxbWS/s+7TLK5jWEs+NUsOI=
X-Gm-Gg: AeBDievAqmaC0s2WmDnC7sBx/XvrM1vxDSFDzQ6cBS053aiHtlBWoZaRx8lgU0z1i+h
	307Zrd5r2Q2YIqnsWHlZxtQC5sTL5P4efGa7jHs6+w8p9CrkRu1OHrkWD685BSG/BfoVxibHofY
	6hQd5bcRPFiEk7iEZxXNCAizhzqYv1CpDMmkbWqXN0KfgwuLaAyGZyJtyvzKbdYZmsZoPMPyiGk
	iV05t0JWLCwWDVCfkQ0SeT4oMssqmwp4BJxZLO9PQpNStUBruTJX22UvhUekoyjTnsKzoSb3vO6
	5bH8gpbGzp6o8SA3SZT7JmUMY8k+ckAv3bax3OXWHX9Wj8dfNUuYb+ttPCQJtPc4xFprwvEcduk
	EZOVxQEknAchjaCfkzXv6vkcr0Kk+P3i0NqNjQk6vUNEHshu1rVr5nIsIgUO6X8a3mWWeVMQufA
	NxwJzPrM/S/8thzcbvoTTtU0Y+GwHGs3cmJGNDSoHnVdp1i6bwa9AeKVQjBgxEcYBLljg9mKk=
X-Received: by 2002:a17:907:60d5:b0:bab:e307:7bdf with SMTP id a640c23a62f3a-babe3077ce3mr530979666b.19.1777035889574;
        Fri, 24 Apr 2026 06:04:49 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504441bsm770221166b.45.2026.04.24.06.04.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:04:48 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1174739466b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Keh6GXr6uiyLYIg/J77F5EHlj3NGoSWOmeo0bpP9modU375rEw/0Tysdjx7eFj/DPZrNraMA4FfQ=@vger.kernel.org
X-Received: by 2002:a17:907:d07:b0:ba3:76b9:c3cd with SMTP id
 a640c23a62f3a-ba41b3de820mr1726472066b.42.1777035885959; Fri, 24 Apr 2026
 06:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
X-Gm-Features: AQROBzCYN8yQbUxpaU1BB5qpPqsbb7NS2Sh7I8H4Hxzs1kZXyoKXl2JLcJdS0KM
Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] clk: renesas: r9a09g077: add MTU3 module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:36, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a MTU3
> block connected to the PCLKH and with a module clock controlled by
> register 0x308, bit 0.
>
> Add support for the module clock.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
