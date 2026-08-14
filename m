Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F146C82B
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710980; cv=none; b=t+Ppe75qFhgASqpI8+cUDuiWGhUawV6RHleRRL4zwH1P10EFAgKMXQyMVWLf16JGk/THMslmn+NU9enhHR0JrGB62Ahar0z1TxNyMYsZ6aTZtZ1HR3E9JOn8qmAy7JMfrFVnOgfWftwxW7TxWihgHbk1OdfCXKF/78sT3WGgiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710980; c=relaxed/simple;
	bh=8efzPxRZ2l68YRalZ78BD8G3POr3O2MQSnQiXgJ1Q+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHYu+YBFjm0OTbRv/36Jy47wXnf2wj6j5Z3awbqThvyAa2ZNPKbTdDusm+oLnCBDG4p0AGWl4JzEUf3G0Wz/lDjHvz+YMJjFLjRbxAJnHfc3gVRHhgy0f1qZ48BjGNPex/5LxBB9/vvgbwK6MYQCVA7UA28CKSXvnoKllvY46cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so1474334a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710977; x=1787315777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ugCyvrIP+Wubz4GxUtXuzhWfYKwKhvwY8k21XzI9sZw=;
        b=qQFU23B0QQW7hdIiLzIeQBnIyO+ee3eIVS//odYyrY1nqznp9X9NYPPSMDlnxxA/Z0
         LF/rdPjFfSEZ4So40/e3aEVIms1BmfNIuNs4rrfzRmPnrcnNUI6NKOM1lB70mBr76Wk0
         hJa/Hg653WLghMlGFg4LdQDCrZdRFXC3m+iJRxKrn3z4ezIy6CVfd0Uh8bYK16eHk5On
         YW7h4KSRl8W/ChjXqp07whm9FL+ySvAX8PqzhUnRz3Qi67+7gKWdICGzncc9YiEShTNV
         px03b6fOgc34/fSqNvRpRy+hv7KbfdwPxiT8+D35LQkoXqDAl2JKCyfsEwdUE4anfcSe
         2VWw==
X-Forwarded-Encrypted: i=1; AHgh+Rqs8lgzeLg6p9u+V4ZGL9kBdf9OyRWkdGzPfu1qteM7CD7uSr4shPIcSFDAbESadMe2xqhHtCFyJFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYYw+rSyAjpNN/liX6qFFPhVB5Yn48iDoJt2AX+pspPZWLx14
	yApAiSOmwE49BU3+colcfG+1594usYWYMdm9B1yzN+LG5huONFOxPOhMy+8wMJgyIwQ=
X-Gm-Gg: AR+sD107to4dAOc0bTPfjkD7uxY4sGpHHyty5yM/nzCGGzgy5glbVV7iQYZEJZ/sRoW
	o2X02Ke6PhGg3ulMI3peU9nr15GZlOq7tmtEgX+jH063r680tco6uajpLf5O78movj3g3RiqRMk
	pdnt87PLOYYieyhGRoH6tV9nPLaAK3O+A6e1vO9wJTv4y/X+Deksb5QFLHZaF+UeeOOTOJoGA/B
	f7mZF839wN9GcqcJyilvif2P56zNmXf4YOQ8KGo3cV7kS09uQsXZ9g87NrOsPyO4sCP4O8ae/RX
	jCG5baMG72QCbcWUxoOJmkOp5hdq61zQ+r1Di/9xNIUeKTHeYlALqiEf4EAwlG9QVadSKCxMFlf
	bVdZ6Bh0djTkecYP0uZDcpF3uv+lEVOLRfZRAdZKUsqO/Rgxb+47hYxiIFIgXX4Yeus9OlbtdOA
	0jo2nzy9xc7mx/UUqm2E10twLwJTyOoJKU4Ytc6yz6lfa9RfqV2J2igFkmfwjj5i6vkWwnDnh2Y
	q+S2icBLgdXL5PNusfikGry6wbhw693Wa4boR9XtA==
X-Received: by 2002:a05:6402:320d:b0:699:728e:48c3 with SMTP id 4fb4d7f45d1cf-6a38a9075a9mr2404792a12.9.1786710977026;
        Fri, 14 Aug 2026 05:36:17 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9ea45asm740281a12.10.2026.08.14.05.36.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:36:15 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so1474245a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSdHxJKgqetfEwp4ILA7qytles0ALDxNLNcahU8as/QpG1DXQvxYj1SBFEI/v8pRuN35Hq6hZQhZM=@vger.kernel.org
X-Received: by 2002:a17:907:5cd:b0:c16:6608:bff7 with SMTP id
 a640c23a62f3a-c212a27f6e3mr253512166b.30.1786710974960; Fri, 14 Aug 2026
 05:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:36:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbg3cT4onaxj8Bz+MZyW+WBHG-q6FU7hSKQga2yXDi5g@mail.gmail.com>
X-Gm-Features: AUfX_mzfh77Nzt9tjGmsNggfjKDPmcxXAlMDwoDfWGxpefmrlPGM4_p3ooVNFck
Message-ID: <CAMuHMdWbg3cT4onaxj8Bz+MZyW+WBHG-q6FU7hSKQga2yXDi5g@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] clk: renesas: r9a08g046: Add MIPI DSI and LCDC
 clock/reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
> RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced M2_DIV7->.m2_div7 as it is internal clock
>  * Added DEF_G3L_LVDS_DIV for fixed factor clock with 4:7 duty cycle.
>  * Prefix mipi_ added for all DSI clks.
>  * Fixed commit header /r9a08g046-cpg/r9a08g046/
>  * Sorted DSI entries.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
