Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02763A6B81
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264609; cv=none; b=EqqtlvWYjn7r6+6YCnlRzA7KxDcgA48lzafSXKQQVdpgD6GFxN2YL0lCaQoWj7oAyDF/V90ZntZVZP+OUmnswSB1PsCFsZ78W9zGNaTdn9e7BFo4pXU/sxuuLNmFYOwibDxN5pXabe3Yh1FZCQ5w5wuiVVq/xjTrcNU+HTDgVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264609; c=relaxed/simple;
	bh=585E/t6ktMIeC1UpZ20AYiKMMBarLZckC8rEfws2X8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5FwMaDTB5pCpJjCP8ML0xmsd6qg6UvM0esEs7LFuMP7z8PBXU0VNylGAz8X54EgsLL+iQw4Hrs6/evFq5AJKRFrYlPno128vO0UEn2uQJgID6DlhWSFSj3Av8U3swAQOI3uLJuL5QfoyK76JBPBO0DzTtOq7QRcpFfrWruXH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5751770a178so1408081e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264605; x=1779869405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAf0/u2XRQdu+JrfxP8RWdf/XDncyvkHhwZOJE5kRt0=;
        b=KdQ7ptBVy9pEVDKccsU9Yuhb637uWbZKXAayTT1ZURNO/3LQ3K64UZ8XtluaetopfO
         PZ+3fyqaHlfPmc+jTDB1iwX4UdRt66g+9/Zhps++StkpLcAh79fHOv2Rr1IBHyOJPxnd
         t6ZTFMU7JnVbbv6Z4wUJ/qqAyAbALDCjyTrNfQ3I+KRYNx/xhnGiCqkYlFKGMwxFWuSc
         7iGt4dKtYg4bQ+ew2ipXRar3ZtvNmalZvgbSPqsISq7mjps0PX+O66CIynjkWRROJMsq
         VhcxD2FmkDdt7/zp+jusjtQTmcdYu2hAaHUNKv5QDb3dYgmGP/uWNvr7U1CtXJ6XWx3u
         yE6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+a8KhpfwmTxgflNI+1y2YuVI1f3uF/bxO+1zqOrnpSQTtU+GL/iNM8zqk6PCyhyLIKE5bTvM6g9KE=@vger.kernel.org
X-Gm-Message-State: AOJu0YykbX5rePefpn5J4R9KKQEVMtl5zLWO7jqkjUEq5oNckAIfKc3w
	tacVmspTMg1GSQvhJtNVMXd8+d3XoBzJ8T79zer3lDNRO0bblbx/kMt6jckdaLFR0jk=
X-Gm-Gg: Acq92OE8c46FeVrkhGvy0uzzCfzjSF2MwemaUdepK5/FRojwvIPm0XV6rtAu5/tpW4L
	fJ28lQKlDaGWueBrKcH/pgnAjExc2dq0X6fbTEjlS3k4fG90uSSz8u/w9KL/Pm1VDTju3jy1k4e
	Hiqbz120yWBD1d8+xD6PjM8G4tTOECJ8kN5aUTrvd3bNWjqaBJ51Oyz5QGsnMMSdkiP6IA+iiUL
	3ZJ98ho2KW/ChaQVe+C9/5Q8mQ4unQRgUbDpHRY/y1kbVSFbqsL41YHfSLo7NgFHETaS/y+e9fF
	pORRCOI7Al+Zdcg+2PNy5pEZkqUrVRwHWaQLGKDd4eMLb20x72RxnBefbsDQ3VEoNSlNnDOY682
	60fDhYIt/QFvDbJrl5ANyResSFoyYgdT36lvhelsOanaxwnONSaFUv/FqyYCOXYA7wDInBKbgwr
	WiQWh284wmO9ZuUvZR0D+SYD5DzLSC8ygZqvEQz0uRNIo5zcIPrm6bw9Ght/nTNCaHPVPsmKwua
	EetlXXFN3fFjA==
X-Received: by 2002:a05:6122:218e:b0:575:3b34:28b6 with SMTP id 71dfb90a1353d-5760c0528eamr12127237e0c.11.1779264604928;
        Wed, 20 May 2026 01:10:04 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f58eb0esm10100689e0c.2.2026.05.20.01.10.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:10:04 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5752b27958fso1567177e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uL9YrsM9jgo+iYGeXfjLfX7+j1bjLte0ZjJtSeDxHonjxQTfiRjohIssJftxSEZC/adX7vQd/rro=@vger.kernel.org
X-Received: by 2002:a05:6122:2205:b0:575:1711:a9c4 with SMTP id
 71dfb90a1353d-5760c054182mr12389586e0c.9.1779264603992; Wed, 20 May 2026
 01:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCn9T87hGMxqDNZjb2y0E+svQ1dnxe4biUNaJ_xMLKBw@mail.gmail.com>
X-Gm-Features: AVHnY4IFrwj5iY5NKmvHYn7v3fK5ncvbUea1DK68vcdC-uxeWDvWpMmdQfg_9yo
Message-ID: <CAMuHMdXCn9T87hGMxqDNZjb2y0E+svQ1dnxe4biUNaJ_xMLKBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL
 configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
> a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.
>
> Drop the now-redundant GET_REG_SAMPLL_{CLK1, SETTING}() macros, replacing
> the latter with CPG_PLL1_SETTING_OFFSET() using FIELD_GET() to extract the
> offset value. Update RZG3L_PLL_{STBY,MON}_OFFSET() macros to derive
> offsets directly from CPG_PLL_STBY_OFFSET().
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk and fixed the merge conflict.
> v1->v2:
>  * Updated commit description.
>  * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
