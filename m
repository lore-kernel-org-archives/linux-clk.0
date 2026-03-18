Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C81392C4B
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831281; cv=none; b=ZTaFApweB5drpO9QnyU5lFUQyxExETYImu+TPFNxt7M268QA+G/u2NaHZz/TsdpU5uB8GMNwOA/Dl6EZfxchfdE64mgurc4gOtLQnQxbmPKqKu9eDhi8M0UWXYXLhoq1LNEEjjL3W9sW+1wIov9gkreFcxufJFrVN1c48H4zZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831281; c=relaxed/simple;
	bh=F801OhlCfKFa4xSQ3yL2bq2kDykIuH1lew57+kHCFq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/QeOlicSP8mxkVtmQZoNjbtnUFOJvnWvtTlUURL3U878V3FslrVK0vQQ6jZdZFfkFnOfWn7vzkVA5rdeAWdjtSzQwhZGSEpjTL7A/TywxKTpET5c8WHDhTUa7yRG4KdsMdPQtROS9GCnD74kH0dKOcoiBT/9/EFHTN3Yh3VUvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5637886c92aso3503074e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831277; x=1774436077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jivaoZ9yjO8A/07kCRdM84g2a/Kld4eTNJjto56HLI=;
        b=iOKyjqjKhssNsR67h8yDYboMi48hGFsH/PbRqG7Fox4OCwGQmrnnRqpLP+jbdXNGC/
         B9cDSwOEd7IGKPJUXp2LKPmHwR20540AGGLXPVcxefnx9FKSL4CE0mgj+1hVc9e6hDgX
         z4q6PKSeBg7ZNqSrdTgThG9XkaTsQYOpAMYmyBJyt24khpxTbFiaHIJ198pGuC7/bKoa
         fuQFbqfK+tf81SVjV4xWMkZc3+6SP5vxesfY0Y3OruIDCoozkMCy+hoIYYUXG29yciZQ
         tepU5J5qIen5/wNBM3a0upMXpc2xsp5ZKgt3JnZbILBm7nd07Y2fJjVazUbEEPWq4+Ih
         EyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+/eFITVnhJPynPKE/yn5L7GAQ8Y4IfEhBeALmx5eo2aGAlv3khJrz9FLuHczmirUi29XMxlnuUUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrNwBKihnUCQO/K27fp8xPwunkiCMsohqSgF3vebZ6i90A4q7r
	MKQUNrIGutP2gGgp5mZideWWji7N2zR0o1LcdKo8Kkpxb7Od9Fwov/ZAXYhEnLwR7z8=
X-Gm-Gg: ATEYQzyX8g51871KfFdr7dR0VqiI9RCaWaBy64vdKZoLkTMwXPB/Be5NJNIeE7+zBsz
	2UNWcIC0bP7ySSSpBjso5ovoFeOSdnMHsH4AmYyDKUriZtgcUST6XVcdP3XKhMY9apuH6VJojQy
	uL3QvOhMYMcxOYoZa8hvrI9T1Pb1PKhsjxwti24z6GO846fYLGHi54xrsQaAou0Z50jz+1ibByg
	Hg5RX+19IgAiBz8IQAXUf6mQlGnKMOzf8g1l4dWAqe/Jd9aA9QGh1PF89FAilOOWxau2b8s0ePa
	XtUU548s+cxtR8QlMJiVDYCx8dy99Fu4NMvnM9Odx7gO/dv/5EKq7JmGcFrL9NESeeooj/CPDya
	F4MdNvvK+WozpgLm5UGOa0lboQgScvt0weSjbTZdNeWqiGVs7+14q9jz7TNdQFBkP5JDMgeof6l
	Om7BclD3Nx6iq/5z9LqhwQJNlk7MjapRxr3MXeD83UOQ4dwhRPFMPX96NOX4wsqlHCweAjdi/8B
	wY=
X-Received: by 2002:a05:6122:2225:b0:56b:8665:9da9 with SMTP id 71dfb90a1353d-56ba7186c38mr1580948e0c.9.1773831277456;
        Wed, 18 Mar 2026 03:54:37 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba7068a66sm1361856e0c.15.2026.03.18.03.54.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:54:36 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56af73db66bso2555082e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV171qfYhOZM3nNAPEq0gGC7Jbsj/Qui2vfvMmQbUc55S/8ssRW3EBwpgkFjL+iNsYFmXObqv3VCJo=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:5ef:2457:8015 with SMTP id
 ada2fe7eead31-6027d3af482mr1147178137.29.1773831276348; Wed, 18 Mar 2026
 03:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 11:54:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
X-Gm-Features: AaiRm51auCuQxyhAsZpw3R8iZHeQa0kBUg1xHFQIVFYYS6l77UrkiPZpeaoq3ro
Message-ID: <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Mar 2026 at 14:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no
> owning driver to restore them. This mirrors the existing crit_mod_clks
> mechanism which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, DMA reset to be deasseted for routing some
> peripheral interrupts to CPU.
>
> After a suspend/resume cycle, critical module clocks may be left
> disabled as the hardware state is not automatically restored. Unlike
> regular clocks which are re-enabled by their respective drivers, critical
> clocks (CLK_IS_CRITICAL) have no owning driver to restore them, so the
> CPG driver must take responsibility for re-enabling them on resume.
>
> Biju Das (3):
>   clk: renesas: rzg2l-cpg: Add support for critical resets
>   clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
>   clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
>     resume

I assume this series supersedes "[PATCH] clk: renesas: rzg2l: Drop DMA
driver dependency for system boot"[1]?

[1] https://lore.kernel.org/20260130143456.256813-1-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
