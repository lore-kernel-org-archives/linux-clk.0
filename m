Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFCB26AF4
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844446; cv=none; b=HE+0x7KaQqv3cvXLsQkeIKPzlw7Y37PzD49FYq2amGBfdJQMNiYyRS7wqMhhbVFXDavD3uCWZv/Qw22DWcDSDAZaRTFDYijdyFghyNWAFlxZnyQF1HHav94GhOlQjOPAb9g1SSYmtUHqiRwR2i3Wvgb0pJtJCXBTAjEvSLlRWwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844446; c=relaxed/simple;
	bh=RLkVcEP08TMA4s2p2rg5pNoBKSU6ELsDGsBnRKWdlAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQrbjBkRNUUh8E3zoto5aYC3WAqx6Ds+aqwgpJqY1s/SNxvBn6ho0xgbBBOi2UGZCQ5SGosrqESr6ptnqL/S8eO/Hgm+Lfb/gtZsbwK75FOfVYu14qMptZk94UupYPh6P/5STMh7afsG2/nnrYgyYPgcoKbR2AzhehzikQ9HUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94ec56c6f05so4015941241.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844444; x=1774449244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVuLY5xzbZ7Lht1V7TLoSww4Hf8zSjGXKz5xyn0WXmw=;
        b=WRuAqUnR1gU0PH90fSIjJnxnUqJ+aKHpX9LRM8RCjaYS5D+6FYjeVid1jYtyXM/Tff
         yBItN8PWV5lO95xTl+XZ2UPqVhM2EI52ItMr9Mp+R5MBDz3sF/WPzs+zKg05icUq3+ZT
         y12uFz+ETqVgH4i0dyRNsbqxSZcCABmVLy08XMYos/B2DhyOZPw2x29o55lbWfC+2h5X
         XKI3mFtq95I979CDZg0SJzwIxVNsSGC41vM6u1QAGWRLKxe6bfho+pC2m1rDsBgrfRTY
         Bc4JxA62j674Z/n0T5a+EOwcPCHGYUD5Z+X0/Jezk+3Ms9SrtLUqofyF0jio2PAXxnSr
         7uyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcTdfQ+qiPBo6LYZzNgH01phJ1GAddztVf4QofOiJjrMe5cEcVRyRPeEcWj2lSMWrl6FSDPe373AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMwCski1AVLLud/mUaEfUx+ANvQzPHMASNCM6Ihq7HHAdjoCd
	gmWevwbI7lCh+z1CTNIL3GtotIZNzlF6BCnjry6P5i9GygfV/YE0kt+6xOfEk3WnrV8=
X-Gm-Gg: ATEYQzyRzk7P+3/vyoVSxwppNCAR0ozBE66gzC3o8avUL/fx4MgIWI7mO2bXeVP5s8/
	iVt4SLsNh4dLIZkt9D+PMJlYCV49SpnIKOJbY+p37hyh/XMyYvOsbRm3Stnaj1kCcitSEmqInc4
	ZtkXpcc6Y/oaMdbh7tIvrR5Hzw1traEZZD3GiE/2gD7fSo4cDU40iVIHsFV0UzhK+4vIO+j6ZK4
	FIhyBilqK8lKMhuzUyRmV3r2J4QqeAYxxaStFcWTiO9a1LfFBo11lTNJvvOSHqmCaSiUko2u/EO
	7LOb4qlWSIc+ACT/N4USQeKEYL7cNzT3VgQWIlx7Ae9pdBnAWR9CSmOESKHab214BdYpfHcMksU
	ascqCjaEigM+wR0E5l5LAPXkZIh+hPH2LalHdWnFKDQFEUlVek8lHIOht3bDHY/OMNrxkrQAo+r
	7H3jAEPBpSNESC3tGfYNHC1Ds/3ZmBpE4ZreO2DMXa2nmdSzuuq+ycUKR0SzFl
X-Received: by 2002:a05:6102:b0e:b0:5ff:b8d8:b40b with SMTP id ada2fe7eead31-6027d12e892mr2004208137.11.1773844443953;
        Wed, 18 Mar 2026 07:34:03 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951034007acsm1396659241.9.2026.03.18.07.34.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:34:03 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6027a750ad0so579339137.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0/c0bw7qO+L4D5xGizLIXKWWg2qqPj51LzDk0/DyFBC0t0qzb7FgicQfirHw6GwPh/sHze/2TFJY=@vger.kernel.org
X-Received: by 2002:a05:6102:370c:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-6027d3785cemr2012196137.27.1773844443605; Wed, 18 Mar 2026
 07:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:33:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4O6a1PizcEEQbcqNH9uS+EFBh5PNtdxLOSry05ZMyGg@mail.gmail.com>
X-Gm-Features: AaiRm53rPDQhGHM9fT2pQfuJKQAJYchfr5aoQucymEyAiqvstwv_Sg2uVhxKDN0
Message-ID: <CAMuHMdX4O6a1PizcEEQbcqNH9uS+EFBh5PNtdxLOSry05ZMyGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the PCIe controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
