Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1690481FAB
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668690; cv=none; b=RwG94o3+nen5nf67P4XITtk4i/ey/8HOMaiVa1NXcnpcZRwkSAlV4g6C6xpd61tRG4GL3PE/e9FPPfHXGqPWCEAturJQTu1YMXeTGnGmSc2SDzPx5PaBaW2sip+FOiO2pnuH7v7HzMd6qam3efXGCTz6wMD3UQ8yko6g46Zxt+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668690; c=relaxed/simple;
	bh=eQ34DPym1g3yHftFYjOe7131ncl6EEw6TRurmNjX1u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMwJjZltMG4eYiYkYP+WMwUg6JEi75jFh3ZES/vn5CSCWvlV5Hkx5Nv+I7gOv9y7RaI3NqUVayMZYxmUYwyHNpruudbmzyF5qkAGCriRm13xgTX/e+Fg4t3O5qWCZ2yiEW4QQvlSHEsmSKopyuhh+BGMfTGxHaQ3kzp7/oQLCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so2209039e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668685; x=1788273485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyAeQiEiW4UAm/NK4AK+DyXXQ3APXDKQszoA62dY7gk=;
        b=cl9MS2y/x5BYKfePD9ThqMaTn1YkeKaNypon7QOJ1FVqOMKw95PZbA93RykKRJCQXX
         CqGQSObjIUJMydM7AMWrIuJUsdmgxooyhuQFQmqVXSRdQeM6XylBZxqpuvr46r10qBE/
         Kpm9MrJnWgEvwHqKq7uJUWHZlv1RjqHdx39aebf5oJ4Ax66fCsLe6FVDnzCnYXsC2kCM
         i4aHPLisyS0ULU/acYivKXgtB36p3lkybdoTj3+A06OUwad1E7xMNtLs+H0New7RqRcm
         4/CXaD/JJxHHyTQADSCZEd4MMxh9LJsYc2bY29l2C15YKzx0VjBEpXhwEI7nkV+eIPSE
         oEsg==
X-Forwarded-Encrypted: i=1; AHgh+RqVvwXDddKbxW8wLAahZzFlQJizk/XuXGLL0yqoRQE0h4IUnCy0HF3ZwNFRREHgmUhkA4xFN9N3shk=@vger.kernel.org
X-Gm-Message-State: AFuF++n/HsaiOOZhW+taGSi0PANbU196u3sHWJ7hHjaXafb4osq03/66
	SEfUMQs/3A2m5mtab0ldXgt9KSHdNjwdWMW9KkzQHYWJhzy2BRSuzOKg7i7rxLehkHU=
X-Gm-Gg: AR+sD13Q8BuXatndwdWv+G+jbm/r4iK2m+x6PpzDhr4doKl3X/AG+DrrYqhcQ2tX7G8
	y+gk4G5am5sPQSj2Dmtc91UxWnotJJMjFToXtY3LhEWK4WV/DxjXJbnF6vZK6/c0tzBbYrJRSw6
	A1gYTPmEN7r9HyYt2Q4uOCISgN/4Saiq8Jn89VwKUCWUELkf3KamAKjiA/5EUAZlKTIYihtphOH
	JaDGxOl4TtRM9M48slwWKrIb5InAiuLq9HpuruHvp+ksea7QL9DJYxbf0PbKNvWUWZ0nGOOwO3f
	u5s4k7EwOzzUcLhIF2BsBq2sNtgoRwyeTmZFUOjuzk2lF0NKUDlb422dGL/BHYUc0DOhJTI8nUr
	XOgxJPXta9NeC8W7kntU9+HtU2qR/qb0K+FivYa39mMD5DUsoxns97fB1l6XEpnpEZLyUFkhx0G
	IJ73JLfu05tdFJxYLcNs50LR7emLCE4zNXk3xMk9+gBLA3Mkgb/XnByOcI9lHTISfeIVBxUu55B
	fVEQ61J7pKAZZQ80ZZXP7mBC4xgnA==
X-Received: by 2002:a05:6122:420f:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c5ff6acad1mr13506857e0c.4.1787668685441;
        Tue, 25 Aug 2026 07:38:05 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623ee51d2sm6266558e0c.13.2026.08.25.07.38.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so2209014e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq9mCFfiE472FDRBdpdVN8GoPx4afnZJV6bmAwRqvE9U2FLUVFuuFuH/bJStcKkARNiFsSe8lriY7U=@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr10559459137.6.1787668683910; Tue, 25 Aug 2026
 07:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
X-Gm-Features: AcwNN1VJh8QhgMVTLLPaW32CuNebN4Cwri3VhB7TN8P_9_MXNNGof6glaJNaOtY
Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] can: rcar_canfd: Do not set registers selecting
 the CAN mode
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The bits 30 (classical CAN-only mode) and 28 (FD-only enable) of the
> Channel n CAN-FD Configuration Register of the Renesas RZ/G3S SoC are not
> available. The IP supports only CAN-FD mode. RZ/G3S HW manual (revision
> 1.30) specify the bits are read as zero and the write value should always
> be zero.
>
> Add the mode_select_na flag in struct rcar_canfd_hw_info to cover RZ/G3S
> and avoid writing to unavailable bits.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Commit prepares for the addition of the Renesas RZ/G3S SoC.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -445,6 +445,7 @@ struct rcar_canfd_hw_info {
>         unsigned shared_can_regs:1;     /* Has shared classical can registers */
>         unsigned external_clk:1;        /* Has external clock */
>         unsigned fcan_pclk:1;           /* Has fcan sourced from pclk. */
> +       unsigned mode_select_na:1;      /* Has no bits for selecting the mode. */

As negative flags are harder to read, perhaps "fixed_canfd"?

>  };
>
>  /* Channel priv data */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
