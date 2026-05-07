Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99473F0A95
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157885; cv=none; b=nv6UvBCuQ5nMsHHo6uG7nR69In9GYfsnLgD3wQeJUYhLPlrtD21zMpZjYPpLJ1ViaXlmB48NHA4LjhQwK1zM2jlv0j2kQ3yjPZAQwdw+MQlFLsBw8e6usYKOA2S9JWvHPA8kCjmDgPdHtuc485isqiRuJVMcqZTgY9FSP8KQvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157885; c=relaxed/simple;
	bh=NfMR3rhEtCN3uJYiSKMLF3eAYQkn2tLJ812E2/Ox7D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qowiAGL5DFH/ffMZk/DhIEVW5dpb1sbWPFHZRDuATEuUiEd+J3E0rKsnSYkZC8JsO5/YRrYK9ypEuUigUWuW9ntr/9HcP6U0+mgVT/Q5dKUAdjdXkF1jmnUclEKFyFbRknqYApXiOZh7y76mlPewFUpE1nBCFQqrE/EUBzkgl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so370132866b.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157877; x=1778762677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zcz5NYdu2U5q9v60tqEZEyD0RcfzK4GFJfE7CCh7d8=;
        b=Evli17F5NXQBc6mkC/5YJ+hBL/7uIwGptb4z7NQuhJ+6386uQXinT0dUXuPWcn5ulx
         LCugpTGCIKvEEBHodzFHKPmTKbmwuBlz78al97Gv6S+s09W0/uczIz82624dgYuU0I24
         BjMNsN+23+UQ4xsyykO8zPtOQVqtyGv5TJ6K7NRZ4kF4loEIW/7j5oj91kvf6YTCf7xn
         NJP5o2rpcQ+fzXzDPbnVOBLNVC9gJ+x623THPMcFn3hKXZa+kHDPZPDYPkShgLxx13WW
         9+Q4bikEV8Oymlp1laAPcnA3wkYKhRP66Rk2Np4U1JyR36On2XKUUMOg1yImX3gkTv6+
         Rzfw==
X-Forwarded-Encrypted: i=1; AFNElJ93F0OdjzyAS1+Ug+Q8r8f+z+suuaYxoNwNJTyopNEb7TC1bw/GTRt7S/xv/1WNxwMyBz+LHrgN+nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZhdvy7sUD4cx5quTyWGJkmx5e9notqdj9zpxsVfL6y8JW5MH
	2017NvDcfSIcnTRIXQ+0Soi1saB2mZ8cyNT3XavzHGnxhzkbEh0/mcb473PLYO5qe2w=
X-Gm-Gg: AeBDieuSLYelKROhg5sdGdLpP+26879LS+zytoAMfj6aUs968Q6zyqiJmIeHhF7P1YC
	bgXBxLrUU51SouKAj2x4MeLiRkTS6t++sGWrv5Sabtrx8yPJo3S/Xp3ac5EinIYjftUdMWksQ2v
	eE0OR7sEJARdXJek7+l8aAJMTh6LcTKjNKZmokUQUPKPP+24LOcS7cANRIkAlv9foWQvCjIa7Ft
	+c5eSIiXWsra6HovZqdK3vrIjzOEOaB7JvxSIGnD+GoL1PHGuqweFDZmMSeP76+ilA2dwpn6sjp
	2TonfM9waKyck1yklgvVIsS2U0EcW77kPBYTs6hDsre+QFw5QSq4NEgco8FTITwFrnQRWkGt4jJ
	TQA+UT4Xp+csTsOVFS9J4oWqFilWLwpvjdG+wiIrt3QWnz3uwSz3MkIE6cxFcIpEy2hF8l8lOaC
	BXaDfnTLmfTRool1g9q82iN51yvFs/tZkyDZcd9Nco4+sEvi2ExAniXh0Wn1MrCek4dhD+ZLs=
X-Received: by 2002:a17:906:fd87:b0:bc1:d3d2:9348 with SMTP id a640c23a62f3a-bc85c88eaa5mr135041866b.20.1778157876817;
        Thu, 07 May 2026 05:44:36 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc83572a4fcsm79485266b.61.2026.05.07.05.44.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:44:35 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so1196825a12.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Tv2KN7mdcyGyBqXjdw63RPGf/unH6WWJlTjJTjF8VK/+yVQe7UG/R+zBkewsgcQRkn3CYKN8GnF0=@vger.kernel.org
X-Received: by 2002:a05:6402:304c:b0:67c:8616:1c50 with SMTP id
 4fb4d7f45d1cf-67e0c16e596mr1058130a12.0.1778157875510; Thu, 07 May 2026
 05:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr5f7pJ2Gt=8MYLjBQOZY-NFMk8B=80rTBN8Kyt3hKKg@mail.gmail.com>
X-Gm-Features: AVHnY4J-2OuzoqD4_3FpLKNrIUM3DpkBMp4f8oVrrrOTAv9q1kuKmlmlcyCaNms
Message-ID: <CAMuHMdVr5f7pJ2Gt=8MYLjBQOZY-NFMk8B=80rTBN8Kyt3hKKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SSIF-2 clock and reset entries in CPG driver.
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
