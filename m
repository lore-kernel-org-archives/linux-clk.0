Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED71E2307
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780704; cv=none; b=qRIT7Tpej+BIHzQviUnCmGvYKXa8stpmbVO0YZe1RDLyMr6HRuBec3WdyWbkXSMs/oLaV9Bw1E660Atl6sK8teDJoXs0AwJVf0reGINYbSWx7/UtG4yUavR3gwZgAbFWwPeLVxPQnkho9Bqpe7CVrgPoUDsLwHSITYsjtjwt2As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780704; c=relaxed/simple;
	bh=vDBZRrptiL8B1JchW6TdyIwfOCu0iFp0Ce/dGtkhJC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5cy9Z66rAppflTUHYrqhGOgrc+ofQYprJwwqk2EVN0DjbmwH9A/5plUPAPnmS8JOMtCkUgusJ93JFpYveaVtLSaoS2qgyVFY/sGI+8p+hQJaLPA8oK+ZQy5Omati4KaprwmMud2WBFnRG9++Yzds5FMSCmMNyTtqYcGLGC3rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5599e0ab1e8so1031824e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780700; x=1763385500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ0ifGUcnHr6Kd16YmJsShuaDbT8XpGIPU3sUDQV+ek=;
        b=Eo8ZPYLjvlTB30yrDEuOlhOvzWdPrmPQuDwpliPbGdhNkIiCqjtyOvVPMbCS6y4S+0
         tUAw9VEbrqsnMrAFV68DPjLdpXMn+tF1Cn1JkmeUMtaC+RT2yIAIcTxRbJmeqFnrkxfz
         r2n81Tn9ucbt3Z1UoNQTD8PAVeN/VtIuCjbEZuwJ14xPC9TLgWT9fDDsE5O3ScdKt+xE
         mtBN/cN0EHMwf6k+FDbXp2ygntTPpfq9WGzr4ovFI5CusOKkv7d0CuFmZspLbZF7dmBg
         5+GwqjJ55ru3GuFc6CNQfg0A9GeZYR/Ikw8t2qNuLwW1zvHtwXMrgWfDd/acf/7QOFv+
         ulkg==
X-Forwarded-Encrypted: i=1; AJvYcCXonO4K4nupKRXgtXKcLGAmB/uMARHDhrFWJaOtzdMsoGMkbNtRXTYXPjAcSqET5ConpAtxiTV0ZhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1xPY8RTkUlrvKf98ao8gpnYA8KPgenc1/AOM/KjXnfTZDS3w
	v/pKmnGTm3bEZ5UyF31XUqEc9+KIIe64aBDiz5FNKTfq6zfKA8jbEGo/z4h3eq56
X-Gm-Gg: ASbGnculSV/xantL4Jq+g399jcEEa4xLnZ8JbrWq7bFOi1XVbJ+Onq7wjHrXcanKGWm
	1batST60DB0820BvW/nD8h9BnFEi005QuHXfy1GwEIbiI6j+QF6xh+p30ZA76YFvvbxIldstoud
	L0xU9ouFDls7splcsb0Z0AePSH1NbEvTaKicUfkXSx2/NibCcGg5oLZP9D4eecl9Ph7kIUAkElD
	FtLBLR51fw40rm9embOvePIRREfQ/8DSSrXaUJcX/8EgwFte0YrK0BI/z/ISJ1h5+8Kx17Vv6GL
	Dut1Nxbq2ZG/FOgBmDv7B3YK8tJAP3nHee2YJKUURMwxai3JhFUQdLajcj1qS0OmOq2vtJwFJO/
	74YyP8nFOQLAZpOhTpw2StX8z2S6nOiN6i/ttnTyIC84Qh97Y4bAoW3ZWXBXcZoZXdMPNShSiNW
	e4cA70EHtjAw7LQedTWdKdTtupqDRo1LbmCzocOw==
X-Google-Smtp-Source: AGHT+IFR+1JqWetEutWzUavGZeNhWoMGAJu3TH6i+NKfwf9V9vp3+bzLTTr7GMr/Q5sd2+kUlwiEPg==
X-Received: by 2002:a05:6122:20ab:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-559b31e18a0mr2743280e0c.2.1762780700521;
        Mon, 10 Nov 2025 05:18:20 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958320aasm7154624e0c.20.2025.11.10.05.18.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:18:19 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9371aca0a4dso1624904241.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:18:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUnbOixELaE2dRhl4Dy1xaAWuUl3FwQQ1I3Ad37A/WaYDIdYVSOtS6iP/xLdhVkEY601OKyNrDWiE=@vger.kernel.org
X-Received: by 2002:a05:6102:5492:b0:5d5:f6ae:38ef with SMTP id
 ada2fe7eead31-5ddc481b944mr2851696137.38.1762780697780; Mon, 10 Nov 2025
 05:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:18:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAyN-XQVoBNncCC5Jka4TMqSeswe8frht9sPOEJB+VLw@mail.gmail.com>
X-Gm-Features: AWmQ_blg0wBfBRVHEE39XqXvRiX15hbIbJMqYeX6Rvu1lD8v_t2OD6KHWJX8VBE
Message-ID: <CAMuHMdVAyN-XQVoBNncCC5Jka4TMqSeswe8frht9sPOEJB+VLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: r9a09g077: Propagate rate changes to
 parent clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the CLK_SET_RATE_PARENT flag to divider clock registration so that rate
> changes can propagate to parent clocks when needed. This allows the CPG
> divider clocks to request rate adjustments from their parent, ensuring
> correct frequency scaling and improved flexibility in clock rate selection.
>
> Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
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
