Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D605302169
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780764; cv=none; b=UrzWzOsWgd/MX0gN+ixNYDuAcfeuFcKI8sKtKHwxCEUXijRzdnWcfEUxQhVM9/iAsCWeNbY2srAeilGokLOaS1E735mn466Wq2RGh1Wcq45XGpZKlrPeajuY5yI2KI1a1oLzBK5TNeuAAIHTtMsz/qA5irRVBXlq7jjIuy6l57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780764; c=relaxed/simple;
	bh=wA9BCmDruypxe3smorD0vULZ7Tgi2Cly7mnUgeAvySY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSUXzbwPD7PePVqlzRl75sJ6GnQajbF/XeZfB44P+aeq3ngWcVxGpId2SYvwNuhAYLW3b9EjMkhfsGBVvBtOH8GDHRiO5Gjsv/oSU9PWtoao6NgINbEizRIkqs74JtxJkaUCS/UYUaU+V0qsGHGsIlDg5o4U02O9CSQu6siWB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-937262a397eso576538241.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780762; x=1763385562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x+CI2dPjKNXpWEkjlBqw4SucojwVb7aPiVE+kUAJGs=;
        b=OPA78fmP3o8ds5jhm4QYPBto/ky+HN47LpK4cQKJB+c7l+WOs2r20Nhu7e5uG/YZm6
         NVUjAnbekJhCm+6FJVTRGU+ccJFGSJwbl21ZmkMmv23c9D8w5K0XemM23KsE+32M2Iwb
         T6u1tWSA0Qw43zXen9ZDW8066j8wn6pzXFhzcHijX8OAuo9I2/pfpdOsQBD9hAPUqBW/
         zqcsURsQrDw6iTMYHqsqlvRLDqkykwyTMRmUu83Bd4wBFSeuPeEjypx98B+4IsybuuzP
         Y0lIkAUEg7ddq6wogaK7Pv59p0xMsfFWdmDLUCLg/jUJ7mD3hUtCHExcUZh+wLrBxpIL
         b2kw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIUHVaspnF+1TLE3i1H1kHw3RLeST77xrw5oLGROd/1DBaLLRb80w2zf+lOmDc17bSbk9KE0SNU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJd3XjyHMyVXpf3Jdn6hOTapxKOHgCkhfbkT3llx6oTgxtAPbb
	TK/FoGJZaxt38XhNE1dCjV5guLc9cJpfrhQ9h9X6TSXv04kOwyt5S8sZLYnCqK1G
X-Gm-Gg: ASbGnctMTSzCyOstZldHiwctceeFz1ysNTz66TSOazDZ0R2A2QMKWAmpBOfH+fDvYrO
	wmPrsQEL+fLmVeMdgn6YSQWBR9EwfZVDqv3uSqxPO+yUYQ0Y5NAf4r4Ve0im+ZXzZuoVj5OoiYo
	1Fw71NGX8HRWkAsL4CZjmg1Ponb2eMENLU4P0f4ZZ+ju21m8p1ChWOemkaPfiUt0R3neu60pw0V
	7nroFM4tfjEaAKx/0HtX6v0V+o6b9CBDKKX2YiAlL06ypq+rTaQTcLp2AfSvpFRaO0PFvxaUTIl
	JXuOfE1UgbV56emVszeYxZt2nUheH7GUbBTFqoxFSyGIqN+ghh0GUipv2AKQo8G6cRkD+4ABtzc
	7fo5lOSsiDD4+lzW9Tbk3otj3NUJpTGitUNkRO55CgUD/qUpQjTbqLXIaJz8gUjxMg5Hs1bRxuh
	DdWC5IhbhZf6cbiGPYANJt6eteJaB/AEa8jjkXWg==
X-Google-Smtp-Source: AGHT+IFQOJzNx+otltUL3i9+3iqlKolJ3tjT1d5c2ZhvG97y8lLRDSYebENBmjg2eqQPkFYEel9lzw==
X-Received: by 2002:a05:6102:b14:b0:5d6:731:fbc0 with SMTP id ada2fe7eead31-5ddc482c6f9mr2281707137.36.1762780761913;
        Mon, 10 Nov 2025 05:19:21 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708969b1fsm5843426241.11.2025.11.10.05.19.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:19:20 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5db2d2030bbso777710137.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6e2SZ2u+bYWp9ShVNtZFy6ijEET4nJ6wmywC1pVcC/GURd5rU4H1J1uvmZ69qFLd9Ht4ONuPoyko=@vger.kernel.org
X-Received: by 2002:a05:6102:549e:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5ddc4814e83mr2563556137.35.1762780760163; Mon, 10 Nov 2025
 05:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:19:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoGQVhdy-h6B_6_z3-h03GnNz4AhpS5i0WJf_oAPNktA@mail.gmail.com>
X-Gm-Features: AWmQ_bmIROBItvdVM9xE3_P83zJy9BKTyQeGOqvTNjEHYV_SlB5kh2Ov6vUy8Lg
Message-ID: <CAMuHMdUoGQVhdy-h6B_6_z3-h03GnNz4AhpS5i0WJf_oAPNktA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: r9a09g077: Use devm_ helpers for
 divider clock registration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Convert the divider clock registration in the R9A09G077 CPG driver to use
> device-managed (devm_) helper functions.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
