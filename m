Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3C3FBB6B
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439362; cv=none; b=TFkNqoWKt0QFW2l14Kf7AAWb2qCK+v4VAA6+qBmlK6RC3axaloq9t/DtWYSPzkQvUBzKzN5aQskqYqG5aT4llDwMEFBlBLKV8RNzspxixIRclOVjk8Uy+OHNltEzTZNBs4TlpOn/nWGrxQT1tt5YP8GktM0MeEJntcEGGRkX79w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439362; c=relaxed/simple;
	bh=qBY/ZVj6ldHQ7SGOT/ev/wk35ZQLrgQzNtpOY5WeOOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWoAPqNJd41uMkEucWSlqngCi15NNYngRv8wFrWoQt32psGXyqdPX6sZ9otzyQVPPZIwlbANuTSivj1JjD9Nz+fq4jJYc+pVEAnZoJaNtHko8haAjfTHYBj2+F4QpZGc0qvn6OxvMAWzcukuLCJE9lpgyD0nXyjc0mcg3U0Y4tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so2004914e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 05:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439359; x=1789044159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EaPjeR7aztkudYOj6lZEtq7c15pwwZNcBINmpVVqLi4=;
        b=PLZndC4Q0eFWLZheEtcxdGJnH7EJVUKRT6K3WSJWg11e4p5iGIDPecl1Ngcao7f0mH
         hRgcQDfXAVcyJ6aU1DqCe+ygP/zenAK5c4ppkOESm0I6xMhnNK5Iq7r10kIHgmLNbFQF
         Ms/kzWaTlSdPLmtzkblzaA7AYqoeElGwk91XHTDIkJK4yVT5jfU/VAu4W6Tf8IFDHVLg
         y626hqrmZkC9W0F2/Wyirr1lUhBZX+eDQIxgHM5kWtnT6dbM28PddZbcpREpHcPHrETT
         +gvWZR4hmCKH/QibPZB6k636UAJ0Wmvu+mXUqSnXpYNMMWzyW62hxQVWxWqVEb9IupNC
         VcPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxNedIlw6aVUA8wchJAjIGC11An57DmRlMBt6ImVYR4cH4EIt2RDYCkWcO9ZX0kUBecgecs5c07Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4f2xZ3Qj17qr3B7HgTz4X3mEwkiGSqgQG0JascnKLGjb1P557
	JcjDdGrHwQbvW0ukw0LUrjU+pytn0AXaHfywdB2y/mTp6MWSy3Kk1RY2ucP7kzdGImk=
X-Gm-Gg: AYBFou3bCfISTvkLToWB6zjpfuW5oUZ3/4jlqCgBjOIbryGJoP9yq+ML+ttSrVFi6pG
	Qg7MjQclGxkMXi3k0TfPjP3ZBCXaWbIS5B8SD2SAp7wsr4jJLbVCJPxg0WuS8kYh3Yj10jZbXQX
	5ImXv2E+cAX29JZfipHbqj8Y6UkKgmv+V+630jkhmV5TszS6P4djnLZ0+8RcpWthb/zz6AXmtQ0
	3qX49xdjrzix5OJETNoTW1v0ovIE03Hpz4NsC9+p+52T6QnebWjnZvmT+TaOPKEJYWaSOtHb7o0
	CooYYmw+meaXqzS8idmZ7Xfa5UTKgE0fGE/S9iabU+Ofd7CO2y9pHH8yebFs18plgAz/hAulzLg
	cd7EVBhmoee0b8qN12eFIuHSFANfzIuSU3152rVabef/WY83zanrWadPWf2deGeTZadRKjG6StQ
	gE5G/YV/a6aH2E1w9mXZfeZcY7sBYugglyygNahDsq23wo4UHtPK80uZTLjP5zqxjfxZDaRwmas
	87Jw1vT1i1jWK63OvSLRERKYg==
X-Received: by 2002:a05:6122:2907:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c7d2809235mr5521189e0c.8.1788439359072;
        Thu, 03 Sep 2026 05:42:39 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7d21c9ea8sm3515390e0c.5.2026.09.03.05.42.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98084f8ab1fso195304241.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzs92ApeOdFDfL9kDfIbApDjjZsyEz9WmB6astTuPPf+bhi+ssWZKZEqpJrjBToRNbzwXhHPwpOaZc=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:786:dfc0:2ece with SMTP id
 ada2fe7eead31-78a1f3b9b05mr5106487137.11.1788439357897; Thu, 03 Sep 2026
 05:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:42:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
X-Gm-Features: AcwNN1UULql7__dDtfLgJSgkoosulVVoZxCW8pWB1eO0ZbqrsKHQCSZJ81CuyNM
Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a08g046: Add PCIe clocks and reset
To: Biju <biju.das.au@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the PCIe module clocks (ACLK, CLKL1PM, CLK_PMU) and the PCIe
> reset signal for the RZ/G3L (R9A08G046) SoC, along with the P8
> fixed clock required as the parent for CLKL1PM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
