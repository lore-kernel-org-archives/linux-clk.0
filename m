Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F527310645
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780730; cv=none; b=SxN0gVFQjcbzXLgTm9zYMidB40eVv1j/hYaVWWqBpxuB/21GsMZloJCRadGZeeSBuk/Vy2NRyMPIprotEVrHv6capBL4FmeVefMiTYNdfNlmedYLQtsBU2GM+P4ifBVJI0MbwA24NV6YmgreMAm4LVTiiBAxjFCQ5y5u9fg7OUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780730; c=relaxed/simple;
	bh=KadK8l0y+2kGqkttEVnDkIhHYVAwWa1JA/uwvYjgOO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLnFqveznh2dt6eCgWC1oy9dJq5Qu8QYM+sKS1okgylSfa/8UdaTOUEkuFZqG/C4kz6bJUUctzuhlONXm4kzJwzmCrB+ByncEatPCGNMyopkO7c6nn6R7QjUihSDdRCg7T6ZS9OeEN8gOvXeT6sUMCjEG2n9/AZVc368Rdx5WR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-934fb15ee9dso725761241.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780726; x=1763385526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JtWC2opMXjpjODI3FtXSyNgnLs1SnEjuR36TMHiZyU=;
        b=cFr9UJa8jmnfBS3ritEG0jmQ6sMOhC88CqoiTaSEP12uGE20PCdae5w57Y+PnloQWQ
         quMuezUbLxxXP2sgIX0Owe7RttI+AkA36s/66LJt7aHdLQbxSwdwcZJv/pzbUXQxTXzL
         JM13U4I8/cSb9pAf74v2faAbh4EiKl2CQqVfAAStcWXm4wG+kxeBBNtuvqLkWl0ucd2t
         RlqAy7kMdnlHaINLggKr6qgyBF0OvCiZqBWMwq/vaPc6QJbz/zcbhfaxZM27wSJ+88Jk
         NDEx2Ww76TqH5IbchAXF8MTXLevoJU/nT98mPvMpz/FozZzXqIosEl1PW0fxWdmscSom
         KRrA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZndnHuA3CsHl8Q3x0TDhBHwPD/i12Pu97CkMv/OeWLweb4t48KjajZ5xOC0rKxjKPNM1MIBiqTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gKugbhWi5xZkScY/LEVl6bU+4IMjHg7DW9qoqX0riB6oB6S1
	TcNXImKrcW1J48GzBNzpXupQ4Ig2TthDwVfw7WGSB8M72TS/EY1zbuV0RWK+/zNt
X-Gm-Gg: ASbGncvD7BPhuvy54nWyNOxmey2rrZArnVngcVwGYnSqMcUp/cq4Uwu7QCuaTdx6vtO
	6HoMx6VxnsTWVgHUETAcbUFtFtFRR+ApNkTylmEwkXmifqukIZ45dUTbhoA/yFrpBTAfQ4SRwaR
	ewOUU1DqN0o4PE8Qky6h6S+Wj3+pjJekQtb9bkYd5XbiwInaFgPeyojguwwL4GLgjOvf4QARzWs
	WKEEkAp8G7Pm++PK8rBTvGN6F5SKZf+cjxl5Ut/ahj8ybS3iPknkJBV0UZGLmuwcYCoeblxc8PW
	tPMUC02MT8YYjfJcUdaH7ZqgFtHo3OM4v5pP1aERHrsuh8fjbeXINtrDK9P30dNV0Hq/zf1/j64
	CmbKu0Tgz3+hBCdFOXNXuVm5Ab4hHtKUwmE4o4teBrmofMqtCS7/MNFCSG8PA0RhEkHU30++2nO
	qBssYl160hGnay20uAMFashetwbHblKBfcUrh4Kw==
X-Google-Smtp-Source: AGHT+IGhz23OZyAQaOFV5zxn+m8HfkfO4T2PjZ4UAUd6pW4fiZyi5VG2A+SXT9PhjRr3kXnG+iu6+g==
X-Received: by 2002:a05:6102:3749:b0:5db:ef30:b74f with SMTP id ada2fe7eead31-5ddc467f954mr1908118137.8.1762780725666;
        Mon, 10 Nov 2025 05:18:45 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda205c0efsm5717388137.13.2025.11.10.05.18.43
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:18:44 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so1438161137.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:18:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6ZkRE2dbcjZGL/WkTy9bQxSHWhhNBKFPOvG5GAZuFLiTK7UR7kxtAFg7qtQOkGOwjUgvZ7p3H4wA=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5d7:de08:dcd6 with SMTP id
 ada2fe7eead31-5ddc467ebf4mr2259170137.2.1762780723317; Mon, 10 Nov 2025
 05:18:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:18:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAqP7zdeGfvR_WaLDhvnDCR3WqNy_+qkh66=X7D7NTaA@mail.gmail.com>
X-Gm-Features: AWmQ_bnxVvrR1Phxc4_ghxbxu9QxxlwIdRwsEpstOMyyybXbOekzQi-mkOZ-Pbk
Message-ID: <CAMuHMdUAqP7zdeGfvR_WaLDhvnDCR3WqNy_+qkh66=X7D7NTaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: r9a09g077: Remove stray blank line
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
> Remove an unnecessary blank line at the end of
> r9a09g077_cpg_div_clk_register() to tidy up the code.
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
