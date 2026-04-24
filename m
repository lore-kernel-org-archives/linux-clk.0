Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5373E3BC67C
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035326; cv=none; b=vGDlzbB8DnV9Cm1Kol65yvy0xPwosKPXqj4OpgxLR5/dIGc5bSEvF84zXIp5Pp2Fe0R0senaNc2Isb5NQ1oqffLtD2R9Qm1gn8R/dw9fzB3PmEUNT8cSCWEtxnAWy0dun6A9IKIPrlwhMbMjA1DN3PY1FKYa8VK3HkwBkBQig/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035326; c=relaxed/simple;
	bh=42/E5ZPR2B6gkFPuTFsjwFpgB1yxDiW7r73CtbxY0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7ofeUAPZMsqz+rwWFit813UExhSfm7/H/lhMSz/fQxLoBT20kBmbODMX+KubqmAt7/QB22oIpWQ3xKgWMIs463BGHmqMVLhszxmmi+LynDAYxaA4kt0xOpOP1b9FloOrr+FcaUzcZjgmI24fZZ5yu6kQy4o61BnNbzBa6XoKyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-670f6ae9c7dso10666230a12.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035316; x=1777640116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lh2uoqfMz/5p6xF/SqCiKgLYXOLD7frnhUVdKR8cm4=;
        b=fpwhUWutjdZiKx21/7Uz19iFvtDtBGmmFphKe/oZ09vbJQ8Mpp3uXDUGribugdjDjq
         0RLos3CrKwWMI2jxnxzFPPy+fbFBKCtVWsRj/GrwkHaIue2Iey0iOkF8bCf3jLfGu98h
         w6vTS8pmZZOQ8QWE01gKGuzzrvyWTsPAz4ORZn1/HLqLGKQM0vndUIeD2A2BIXCVjAAc
         QWvnPRQcCADdQREYyMKb7Qs4oRuDNcL8nl5cPhMLq8P2gfoBWm3b1QZDdwnJZPKZCYSH
         NL2urezjAjifMAm1r7339H7bqJOgk/1Xd+/2pyKYCtcExTwG1MYtOac75PBovZi7GSEF
         /1EA==
X-Forwarded-Encrypted: i=1; AFNElJ8UZz0cHZkS3127t4KrGkpuXHizbDpuZKNZpd3a3YjmhFxYAlkor0xXGw+9VFa2qxMcnC8hHnRIoHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC0Q6YrLHwvqx5Z9UPFQEB+JUHAYQyw39VeRMW/95oi/JxQGb0
	SVfRN3SCTONp2Kde8go76AFu6pqPBXsoKbLM/FiR8sNajXoLKF8+i9y106SxF6+PX2U=
X-Gm-Gg: AeBDieuuCRVLm8mNzYJXZ/joYicewmWw5dvZApy0GjcXbsoIs7B56wMOIr/eFrx66Og
	PJdVCeBJsI9th7vXFs8loOYjChmFvDW22IV+utBbu8Uq2PKYK+NX3OM02+0K+E+/NqeOrqHUEJ5
	h4yQJwTmd7jxvWeNtaH7Cw2e3vQ1kcCwrB5wRNzsqlwgkczcd3KwVjYJuUAoT2LsZfY8xkb2PkU
	CvnLSOAyQE+HJEhCXwGOBupK9c0Kp/5wtnhq6ysUjKKNf86HpCdOX4DKtUeewpqLwV2YVFEym2m
	C0Fcv0LisvXRjLv3nkPksE8ua/9Qw33Eo8qG3+6XA0PJ1a5ex7zayCFrSj53+JMl+Z4OXFO+QTQ
	P7kYrqgQ2slUw5cxdVE7sAawXvxIjrLef5cgl940aQk0oOn8+QyUqhUxD+ckxgPEgBl7/EOZK5+
	+GnziKKgB276kuG+Y4YR5Vqyd+aGeFW0lr3ZiIFs1m+K8vJ2SFatc1AhR6prV3C1I2wwppKW8=
X-Received: by 2002:a17:907:1c2a:b0:ba7:4cd9:ca26 with SMTP id a640c23a62f3a-ba74cd9ef1bmr1164437466b.35.1777035316372;
        Fri, 24 Apr 2026 05:55:16 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba5498b3ddesm699500366b.22.2026.04.24.05.55.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:55:15 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9d9971d059so1145687866b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/FfIbppKpSjYRRcsooW9vcZJhh6S0rS0AtDoJNTvLS0kQtyIaLQidHK1Y0+z59/rweSpFtZ1SmXA8=@vger.kernel.org
X-Received: by 2002:a17:907:9622:b0:bab:897b:1aae with SMTP id
 a640c23a62f3a-bab897b1eebmr554803166b.49.1777035315325; Fri, 24 Apr 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEKsUEq2408XOG1thdwWxA0BvD+KGRSJ0JEAnueuJqng@mail.gmail.com>
X-Gm-Features: AQROBzC92lOZut4wvqLOrENamY1_Y5-0Fl_css0VHPeUm7lfcrk2_KwQ9-0msMY
Message-ID: <CAMuHMdUEKsUEq2408XOG1thdwWxA0BvD+KGRSJ0JEAnueuJqng@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: r9a08g046: Add I2C clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add I2C{0..3} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
