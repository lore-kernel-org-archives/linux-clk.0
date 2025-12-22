Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302643218A6
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416525; cv=none; b=Mm9NnlyzW1Ty2UweMJSxniwXDIqbPRwpsEaetWdG48CvQEYN9LYB3+gGf31hLJ0VJ7D7SuI/RTqam/+OhxhJqDlq5sakvziZhaM5h0qVqRiBOUTk4Ns8ngIpDnbrQ9hQY/2zc74Z7g8F+kem+3iBd6MgKopcQA+h5zANgIlm0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416525; c=relaxed/simple;
	bh=O8pZL4NMYK531cx9bv8WY7RNqg2T78nYqG16ntxwKiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8qm57gcQTuTkojAHQvVxC5Z+GZkpUfL1EdZjMNJ/WpBMYExNHPUwgd21JtwK+cx6z9DC9lBdxlquAMrYA7xoTqGPh1VUlzBiXTgbu6BX3OXM71TvZOfMAoNvEpbZqyDd8j6iJPK/HpGSkSQnMBMtc1A0RHlCjx+5gO7fBbZxAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5e186858102so1408451137.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 07:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416523; x=1767021323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlhlbeiUd/10GzJ3WP3xjFNu241CxnEqVnyuXsgKZIQ=;
        b=LPVKBjK7ZYdVCyhW1caSQ0zHgb6aVNEqlPDVhHUXDlfH1pxqg3SQvsNnkQSRGaAWXm
         vJ50fk88rlQWrWLCKpCToRzpdSHKi13LxwUFdS0DZflgwSFJKg0G/3s2Hd6KR7qdT9LL
         KwDXdtDmGPao2TVhIejDu+avjpe7D/q8n1VxbnW94EOftPQNbiHFG0iVx4uoDm/6dJVb
         D4co1LzJ4EAdX26PPurkhlTVlDSu0XOH8y5qGYLqmvyZtjGow3KnJSzuxUch9TOHSK0c
         5dxSjSQOkplNZBBeMsRiB0L1ubxPafa8nlcq1+kSZbgYFpH+PCdkqbHbZwV7jEsfAF0d
         T9jw==
X-Forwarded-Encrypted: i=1; AJvYcCVEnZu83i1qZX4pJScQN4TS7bClbDx9sYM3MQ8gSjANITP7RXU7UXc/9aHdSDcSxWJiIph0kNeYHKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISv9v8ogsTN7VVrOjgofOkxMrkRQ/X8YGpJ671RxSx+7bidj4
	r2mYiGnZxWCod8s6dsuvqBK2jmxYX7BvK5ohlYxB7dqflXfslYYG+5GwL6iGVCrU
X-Gm-Gg: AY/fxX6QPldlSF8ey4B7arXsYBmnJnMjUIvT5yhnSVNR7wbGsE62ooC/58hEKMEjnMM
	B9uyxmU58zid/wGDLmQXeMNW7HtrkX1Ubq5rOZergDAa/jjXdwoHtV7WEN1mpkA3IGRFCnifsb0
	Gek35nB6oStiFEaSph/LB+PKBHedZCYT7K4qhTq/rANsS/tLK0gSLhSWIPPWYyGpOZrQpFUiu4P
	lzU6yv4QxhZMFJoGzQTz9T5Nmc8wA4A6qCnYLFQsFCnqHmvuSixTqk8POGNc8nqfWmq8CS9DowV
	CcHAkNZ9HNVKtkrU+8pweTzQScaQa0bAhuhMNazF3PhkEjwix2PaKMs8a8Vvxh+MjnSIsVkbB2J
	uykvZTiw/z+aE7pwy4Qbef5XE4eRxYJCoQoV4kX5cxjbkt1to0D5nodbkx76n+SXFH56KpqVowY
	Ee2SyFhz5Cs08YCWsdJys0T/blwViQKsI1l6+Ed5zTEzGR6rzXrMpASlGaPz4=
X-Google-Smtp-Source: AGHT+IFAhARUIBD4LNYSOAACH1fn3cPThQq/oGhoAfPDxgZmVsvk/QwcRK2stz+O/KdC3E+DzBju3Q==
X-Received: by 2002:a05:6102:a52:b0:522:86ea:42c with SMTP id ada2fe7eead31-5eb1a67f46dmr3437177137.11.1766416522791;
        Mon, 22 Dec 2025 07:15:22 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aad0d1csm3504641137.7.2025.12.22.07.15.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:15:22 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5e186858102so1408441137.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 07:15:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHxJVaonbCtI4oAHY8rnUnYVnYojZ2afSOkUDZ8gsSwYYZLUS6T1IW511se995Q/FJRgUT30Zqqcc=@vger.kernel.org
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr3062956137.4.1766416522224; Mon, 22 Dec 2025
 07:15:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251203094147.6429-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251203094147.6429-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:15:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZRonj2AuT6fJH+SoA9feGQqr5vtVexqD9zY9Nzymnsw@mail.gmail.com>
X-Gm-Features: AQt7F2r5mBHf69-JyoBoifnBT6a0FoXKbz6Uq0VEUhCo5kqLod-PwGZF8JtWhI4
Message-ID: <CAMuHMdVZRonj2AuT6fJH+SoA9feGQqr5vtVexqD9zY9Nzymnsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add entries for RSCIs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Dec 2025 at 10:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the RSCI IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
