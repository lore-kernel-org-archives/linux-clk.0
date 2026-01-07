Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E41F7916
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784597; cv=none; b=pfmFsv9CjT7e/2tIQ4aQ5QRyVsOmF0sLn/6i6+wFhtVf2mZ/VnUog9KMKQCZyMjOgY2zOm++Vb3FdaZ50lEADFwd6Gl4TqGYwelxqcK+HNtRu5YUFzKYaaAx3MEhujA7hSj22hNtQ+d/vuhU/EeJMoGExgK+AbNhA/7SXZ6W/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784597; c=relaxed/simple;
	bh=RrM8XtdV2MHD6GHqPad8HEG4WV2zgZVMEIfORujDgSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGvvIAT0BhdqUQAh022FCMKZ5ZT+64nGlge4L5Ku1nGR8+UlDp1iKZjjKCNLE7n56K4PilreQ77gt7IOKe1SLAqixbQw5brhG+GdrmQHcmGceCYabmLGQEXtFHeTYQnqR5hTNb3+ZMZWaddxbCbsVkwGPWcNo2Pe2zsghoXIsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-55b26461e78so582264e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784593; x=1768389393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WdZ5/VUwE1xJh8ISh+dZC2h81cNevcLv2ku2RENiDo=;
        b=OeZk1eAn5MjRh7tK0kepvgngPGehBZdvmaJ3ea+IlswPPjzLFbWdU2vL6Yja0Isrnw
         kT/le0Bo7kDs7gaf/hHd6mR6ZBi3FNJIx4f4/+Hr/Kou/ujdfO5jGaI8LwgVWJ0ip5dS
         cK2BefScwg+x71sIKBhaN8b/RljU/tCFwH/+rP+01xqUm2banCiammkNi2805Yytwg7w
         iR87skCHZqiPwiozwsM44jnLloe2p/RDVpHrbCN1bLmJw99+2oWYuoU5yPQuY4t8Imq9
         CT6ZotWyeGghmo6zrt61OwroGqxOz7pL9fiQBjej7Mwnoy1i0sUkcCqYzgAfD0h7BNqt
         cLYA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/h/lySFBOXrA/OQnB11OxMYa+Jlk+/F0++E+B5Z0vVoe2HGBLoE/imE+py+t4Y1NuEbLKyBTFoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlJ7KYUiDLZRfwqXqw0SVcCzam6Ip9qoZzZ0csRBM8Ov1lLOz
	WtHUAC8ZSZ3u0X69CFzUoO6BtT5rYS9CODJsEIioOvgJgGDvES0UKWa8ZEBiiyuXYMs=
X-Gm-Gg: AY/fxX44QxRPEtuhsR+FKOtTwHe4DCuOQ6HVZzTF8YCfJUxmzeV3KuWgV7FpsL2jiNp
	RmLBGL9rpOtSWfXtrlTPXFPx6QBO8QkJ0pb0g78HYT9/MYpTdcn9755qIi8GCRsoPOHtt1MshvJ
	sZcS+mwine4nnWsWFsY9/lIaHTLV/ZdZVZTq5+qLs554OCz6zH0mOY1WOkeAmfKcpEkvABfHWt2
	RPT1rBBBZOyjnuH72nwKtJo+eBXJldOjEN/OjkxyX4pAesRP1u4jDaqa7hgEj6Ql/pyVGPJF9Bp
	31aOfKdqydlQ+/dEDIVkYSUJPoZNOh/WEqCWP8ms7e393UqKQBH6fJo1XnznA3VzGw5eX2H1IMm
	2VDm/WCXPfup1Llcw0+IVbv+l2mt2/ADJ1PJOFFnLARBL6tfZ3OEcoxPPXVxpt4QnFSPxwT7Uh0
	VCKESDSoj5W0SPgRdK0z/RafyP7E9w9idXEH57+s2/9uZuTigX
X-Google-Smtp-Source: AGHT+IFqGPPX/UNwDfBTwbI8RMokuqbLmmQ+0TsGaTAuvKJ1ztfIbgM9PHMn8uMgo6JBZMc8vzxcRw==
X-Received: by 2002:a05:6122:e75:b0:563:4a93:a5f4 with SMTP id 71dfb90a1353d-5634a93a871mr419203e0c.4.1767784593525;
        Wed, 07 Jan 2026 03:16:33 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a41f813sm2531838e0c.18.2026.01.07.03.16.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:16:32 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbddd71c46so679925137.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:16:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2JbDR22Wwk2YaP/hM4et0SUy72KUnl01UbCh2hqMuc5Mr/AMoxdg4B55or13G/fwnDCIz9HCQmGU=@vger.kernel.org
X-Received: by 2002:a05:6102:374d:b0:5dd:84f1:b523 with SMTP id
 ada2fe7eead31-5ecbb14f786mr562313137.44.1767784592410; Wed, 07 Jan 2026
 03:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com> <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 12:16:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
X-Gm-Features: AQt7F2ppzHtEKNTRC_2cnqisndOj7_CT6UKFhC42GAaqOr3yn1NZxbW9SH3gO20
Message-ID: <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 8 Dec 2025 at 11:14, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I am wondering what you think about the alternative below?

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1669,8 +1669,11 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>
>         ret = readl_poll_timeout_atomic(priv->base + reg, value,
>                                         assert == !!(value & mask), 10, 200);

If this loop would use its own "u32 mon" instead of reusing "value"...

> -       if (ret && !assert) {
> +       if (ret) {

... then "value" would still have the wanted state here...

>                 value = mask << 16;
> +               if (assert)
> +                       value |= mask;
> +

... and you can just switch back to the old state using:

    value ^= mask;

>                 writel(value, priv->base + CLK_RST_R(info->resets[id].off));
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
