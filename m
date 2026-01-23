Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C331A570
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179342; cv=none; b=V5ujo2r8ulXsBVLS0KB7jT9wcxbCeTdkfT/PCWIq7o3d/VFTCXI55q6gp+KPmISBGtuuXmqBlxiOvZDVAwWbSqSgx7Lqbt8DdScWYLx10LY6c9WzND2lH9FcKAsCOQUVzqcyuzi6Yw/Itni4Qx5poiuXLszcnM8ZOFDaJFro5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179342; c=relaxed/simple;
	bh=Wnzral5cDoYZxbt4300gIY+fWD5kwAwcN6sy8j1a/Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCZ7t8II5cIsAFBEz1UxMhOy+BnDvdbT6qnLWPMv77T1Tl+BgwzCKkd3MlRZSRdU6T3SbK8yX2ZqxR+ylAzFWYaqIjywj8De1INsifxhhsjEMeEsWHZDXXIp4Nv8NbqYrlhPwEbvfCzWFk3KY1CdClIS3g8T4FbYInLzntLPbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-93f56a97064so493720241.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179340; x=1769784140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrLyFLOgIReHJ7nKkJOEOCPW8EUbvL8/pGt99hnxu78=;
        b=UnLZQVvcYxVig7nfT7cZPCStj2JUbAKevoxJv78f4BkNfOxJYlLDyvLS+a4l11//rW
         IpG+1jqf9/JnsvFeWrx7utUSbVqcLPzT/dwf/BfxxC7NJEgOgcZlhqB0d7kRFga1rMno
         tDinYcymZwQGcp6yrd9Bp96tp5IBqeNwIeWLc5UGcIVWw3r0T/GMYMMjREzRbsY8VIUG
         Gzt3dNODTgxjoKR3VVfQ3Tj9OZDyMOAbv2RqfsLjWaZ59eB8HcqQxENjOiQYC/M2cUk6
         BppqLMvAUzoAD8cOsTSkpbZIN04J2LBHwm053m1pfI4PIaxVrFicFVpeRBwAGgLepgQ2
         uOVw==
X-Forwarded-Encrypted: i=1; AJvYcCURuCQ/V0GB7waTodnYp9IOD6sPZMs4KZDNtG5s/Nx7c+m0tvlztb5N08FqbFCCQFz9DPwyBPbuYKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrrFKW7SQ8oSXzD/1KcPjm4r/EouoNrjyHG6HvfrTbXM3nlbF
	79G1lIDyIpt5DM6YmClzDYSxL8PL1SAJVq0XtEN62fu6eNZDjsjVBJJoyf1aqDMEnfY=
X-Gm-Gg: AZuq6aIBRu/mx+MiFNGfDoU1NmEBJvqvP2h6bn1Hr7Mgc1Ji8IPqolca103aIybzjIO
	S9SwNnsLRgLjx04Edm570S0ThUtTVvg39WGxZQKXVuK+g6aKFUWM0HkLtKYzzcJDYGLRFMXVKoI
	ccGvVsfRE8Vdjs2nvwdmS1rU0WF/D9SYln6iEemNHXepY87VpXJZ2UER+qXZ2EaLF5OZ4iSFZf4
	GeBnDMDOT5Z9Bh6uWbfMvVyvp137JnGTRWCZmf+ySz7B5G6jSTj50Y2ISB87VPo/BbraQTO4XGZ
	AZsIFChkJoRBM52aU6cX6N0yKRqB7KOGIMbsndy9tICBY/VgZQ6ntq0Lqo31jVdNHLtnYFKtEu8
	h5Pw8IfC1fGXHu6E2DUPtTanGrcgCDLi+rVLi+BDguN4xlzYoIBDc/jCl59sTid68fW4J7YDj1o
	uAcJf+6OsuceM9qYUxB3u7EXxtuQmdn8wxKZLutJBC0bm3UQj+
X-Received: by 2002:a05:6102:dd0:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5f54bb634d7mr890766137.17.1769179340273;
        Fri, 23 Jan 2026 06:42:20 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2ab629sm529736241.1.2026.01.23.06.42.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:42:18 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5f53ba9c548so655934137.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:42:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCHZxKFzArnGuO+atU2iMdqUlUnzHFTH77Z5ltZt5IKajtcqtJ9I5hM3LyLo+5ly4eqTtCM+NBLHk=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec1:b0:5df:c228:288d with SMTP id
 ada2fe7eead31-5f54badca71mr922168137.8.1769179338018; Fri, 23 Jan 2026
 06:42:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:42:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV1zUaHTfToV-KcK+7Gtr6pG1f547-wwuFxm8rqicSeQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVxxcKWK1L1APmdxo8PbYPyqK8ra6u83gDCmRGJACGU8TN-Ywh_mSZ5zc
Message-ID: <CAMuHMdWV1zUaHTfToV-KcK+7Gtr6pG1f547-wwuFxm8rqicSeQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] clk: renesas: rzv2h-cpg: Add support for
 init_{off|asserted} clocks/resets
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals may be left enabled by the bootloader but should be
> explicitly disabled by the kernel to ensure a known initial state.
> This is particularly important for PCIe which requires proper
> initialization sequencing.
>
> Add new macros DEF_MOD_INIT_OFF() and DEF_RST_INIT_ASSERTED() to declare
> module clocks that should be turned off and resets that should be
> asserted during CPG probe if found in the opposite state.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v2:
>  - Added reset-specific assert on probe
>  - Removed Rb tag from Geert due to previous point

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1337,6 +1337,15 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
>                 spin_unlock_irqrestore(&priv->rmw_lock, flags);
>         }
>
> +       /*
> +        * Turn off clocks marked with init_off flag if they were left
> +        * enabled by the bootloader. This ensures a known initial state.
> +        */
> +       if (mod->init_off && rzv2h_mod_clock_is_enabled(&clock->hw)) {
> +               dev_dbg(dev, "Disabling clock %s (init_off)\n", mod->name);

rzv2h_mod_clock_endisable() already prints a debug message.

> +               rzv2h_mod_clock_endisable(&clock->hw, false);
> +       }
> +
>         return;
>
>  fail:
> @@ -1585,7 +1594,7 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
>         struct rzv2h_cpg_priv *priv;
>         unsigned int nclks, i;
>         struct clk **clks;
> -       int error;
> +       int error, ret;
>
>         info = of_device_get_match_data(dev);
>
> @@ -1635,6 +1644,22 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
>         for (i = 0; i < info->num_mod_clks; i++)
>                 rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
>
> +       /*
> +        * Assert resets marked with init_asserted flag if they were left
> +        * deasserted by the bootloader. This ensures a known initial state.
> +        */
> +       for (i = 0; i < info->num_resets; i++) {
> +               if (!info->resets[i].init_asserted)
> +                       continue;
> +
> +               /* Check if reset is currently deasserted (status == 0) */
> +               ret = rzv2h_cpg_status(&priv->rcdev, i);
> +               if (ret == 0) {
> +                       dev_dbg(dev, "Asserting reset %u (init_asserted)\n", i);

rzv2h_cpg_assert() (actually __rzv2h_cpg_assert()) already prints
a debug message.  However, it uses dev_dbg(rcdev->dev, ...), which
I believe will crash in set_dev_info() as the rcdev is not initialized
yet at this point?  I think using priv->dev instead should work.

> +                       rzv2h_cpg_assert(&priv->rcdev, i);
> +               }
> +       }
> +
>         error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
>         if (error)
>                 return error;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
