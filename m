Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4243E558E
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934334; cv=none; b=d2/xnw5Uwj/Atbv93xbnPDrjHrG1TW/bfUZctHdf9DeKkSA2lydEBKL/ZspAeZh8Qx4JpDecR0nHaaDW2vOpDVLGsaaXA7CPicCg6PgvkacDE7PlZZTf/CpylON5Xan1SITvJQAgkKeg7GS2z4ifvrsELvTSZURaWual6rBPOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934334; c=relaxed/simple;
	bh=vXnxLZDFMsXbZH3qKkGOnVX/RNECvFZJUjIe10GDTaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjq5W28CLHZ/1ZZ59SAe7HtJKvjdLXoT3Tb+KBS2LeBaAm1UdJMHoOQKDd3W91Q2vt4QdtwwoIkR0IHOi5DZu8TFFqr2yy1cCmrcG9PLW5ZwMyvtTyBYzRDVHoOkJjeEiU2SrgF3C2R0jZZGoS1hOrhOzN5Ll7GoaJmSDhqlWT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso259610e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934332; x=1774539132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD0xj8TjVx8IaFOOza8lFHCZSv/B3KHnHlTToYvdOjc=;
        b=M/pRDAprO/iwO8mv92yPYcPQdH9YVQ1kq720X8HlJqin678TmpAtsYRizLoeE3o14K
         wDInmolBQq6PJO5AfSMwbia0TJLi3c3akx2Tm080QP1co/8wpZOOHE9iqKFSIZhmbuD/
         DbdNQnqmW2SDgsA3LXnDIMI9IUauDZL/8eAy0+VablFTkH9S1ApwEtqs5yWOAoJf3wlA
         Sl9S+UQQjTGrMJUHUWvihlIc7iRs61jlwTWDsn5btQmtELWb0oqC8BXJAdLQRXBmbYau
         HoYaqRK2T5XEMPW9XLhTXPkYBlz3fMtAw+hbnWIy7ULO8OvMKyjs+jJEbeOYpZli/QhD
         Nlug==
X-Forwarded-Encrypted: i=1; AJvYcCU1F7oHEDY9dzE5zU6MM152M1QNO342MD7oaIIJwP4VyxIZYXj917I1ypn2hd9+UPFlh5gT/7/0wSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YycE0uyzIdIyy0BJE3XxJx9bCpFpywVKo2ftLRUlQlaMJJNoNM8
	19pJmboe+h1Hn22Ujm/UWIJWyDmC7cMj5wOKD7x6C38dQyikNZoSeK+2GxwjsdEh
X-Gm-Gg: ATEYQzyDL0ARLTFKgbhdrR8DbQ0V1HHpHJtzhT9E5i0x8JSGCXhYuREDlS8RNutGb3Q
	Bc3qw5O3irQl3njfu1vZ37IBsO6uv36t4XBoPzXsixVOVlG1vx5sUr1GShHJf1QVRj96g2Yh5Nr
	v6hvEo7z2O4QecDXp2w0O00w4r3xVsLlgW2Lpy3vQE43D2BnMubThCiooPhcOvbUnmp33ft2G1D
	TEKR08vTlAjjZq3m9RZfKztijLpabQM9FSnetofgQWAGitRHB4wl72CP2b6GLPoR4q2BqoQQgFM
	05RP/fHImCWyjICWW6Rni3MhfYrIxfP5fkz9B98g06NAO4n8Zm1yjB2gs101EfdpjYZU6I7LgRL
	H3EZVB7v1zEtTuEAw1LibtsdEHrzaCXZCdkzLO/EBAtQn06BD50IOHWK9OQ/79kqF90SyZ6HwW0
	yxx3W0W4a3c5yyWB72F0vyXWwH6AdvWY4iQzbQqIvCzLEkVVvbOyUgYNuVEzA3hl4R
X-Received: by 2002:a05:6122:e46c:b0:56c:db9b:2eab with SMTP id 71dfb90a1353d-56cdb9b3039mr477793e0c.2.1773934331680;
        Thu, 19 Mar 2026 08:32:11 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510340b845sm3050994241.8.2026.03.19.08.32.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:32:06 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso259559e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9pFrNOWlYgBHPSdtw70r9vBWxo0K4LmkhRbTyBwPqd4I/jWr6m3o/KEZWZJGggiVvc0des4AtlCU=@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:56b:7a5b:3cee with SMTP id
 71dfb90a1353d-56ba71419d6mr4293734e0c.12.1773934326451; Thu, 19 Mar 2026
 08:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 16:31:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhU=mBKb6urrJ=wPsCANgWHWmAOfSNgRKMbgjSznMPZQ@mail.gmail.com>
X-Gm-Features: AaiRm53xlVwi8FLwAu4pk5ImJpmsBy5XJ2IMtsQvF0FsPi9ny-Vah4lMnmzvt1Q
Message-ID: <CAMuHMdWhU=mBKb6urrJ=wPsCANgWHWmAOfSNgRKMbgjSznMPZQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
> into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
> decouples the logic for setting module stop state on disabled clocks from
> the iteration loop, allowing it to be reused during resume to re-enable
> critical clocks.
>
> No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
