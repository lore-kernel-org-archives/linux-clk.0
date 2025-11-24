Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA60313E24
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998141; cv=none; b=NpXoEfP93wkEVyeP9pXVTsd5X8LgDX4Z+UZz0rqzi77JPlFeH9n7Z7GzMAbjpggsUfIHU0KIpXsf5GafcGbTeQMbKiJmQ14eGu8TeMW8TnCWTjqKjdUZQe1w0acigRSeVFMw6znjvSab8kaiFIAr6lmkGAqRJKsXP8PVbK+ozp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998141; c=relaxed/simple;
	bh=dtyn+c3wkvuOdu7AMLNrDVzOrUOL5mnb4P5swNzpLio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgOkFfPJ4/AE0fAyG7I1IOJoQsYaqqnlKmMMxfDeu9EzQv7XQZUp1sbR6HmujX/ckpUZJRxg3zVhOZlMzcpyxkw78ITPlWq+H4ounIWzh+OV3Zl0MlsSBSq45SaTFD9ORKaXjQduskSx3La9Wv6+75xHmpuNjxbemit79BwnVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dfd4a02638so1554584137.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 07:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998138; x=1764602938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ/nWHkQ3xxW6LNbuBTA1ySl2vV3DXFG1vo3GMeeO2A=;
        b=uB/EohTaycaUiwjMdpDkSJkaMYpDeAVsLNZ/8GB46TSL4ADXQCX9z/PESjLJFTkYo3
         m67zaLQxYlVOOL2RSmYMY8+AQjkMAJDmyTMZjcDBh7+NH4exdC1PtHSBo8XtaRGw2lrq
         xablWXgz6BKT1Zb/Wo3L13aFeK3WBIdpOxl1g6sd+DBRZ0qPSutI+YgStVcdoxA1ESaE
         dQmKYSqToa3X489YVje+FbsQna/B7IVsuyf5M/4v8SilKqt00fiD+ftHhRx02tpfbRAt
         c2rRMwT4REsxVotX9YVYfrksSb6rV1VweuiIdXadrFl1zAmNJZ6dk92uPCAeQeAZLEQW
         NGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbeAAQAwxQUTuRdir/C6fY5YOqRLERs6D6ZnzD08rtRQ1qFJ4skOBXPz6BtEcHXJBxYw18Wh2cUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06z8QYTsy5HWf51lBPc+v0GeNGaKcazR2BzwmyL8KXPIZG8JV
	qJzcg3VxGLsqVrFFP9RhMMWZIo6gXFqtFffWGnQd6wgWiBAbWI6x/L3NjV39X38gX6A=
X-Gm-Gg: ASbGnctTSo8viA/t8Ut07WvjZE+8hiYj0K1hlfjuyHQoxr4BRs2JN0havBJn6mQKEJ3
	9I3CG71xeNmnv+o7sXy0gt1F7SoHrDWthcl6HCmaD7PnZIYLtE/AMkrzSwrwiXbfdVo65RJkJS3
	z+5oO94UmnKodLJcwQtZ75e6/agVzQaKbz4kzMc2lBe1RD5/EC3tDSF5NCccSfQx0LC3LjSs7fD
	ilXNydX2p4KK2poMWRF0nfFInaf+7QX820m4TaZl90bZ3x1SDqK9KROvWg0QRWYZEoc4tbk3W6l
	1xI4fnCvdFLpk5KfnFGeGp0dbFrbmYISDAxRKK5F1DtxcGta9AiJB8u3U6XQGCC1+CjoXSVainM
	cRivJD3u+m3GIIJcwJK02gnBBEVgXoSAbMwDJVX8fWT55V5Mg/us4wro04C7YzLLFqnZLknCgAE
	N8A+KfDdFNKa1UnnwuQ/7/f2hpE86Dh/djThNZmMTZGn1QBQr3NcF5
X-Google-Smtp-Source: AGHT+IHoNU3Tq6i9bJNeN5vrkBjyMAeWMtgrpMRboBvcrkQ1Unmm4J9q0mVwNv9kToEBy4MdAeqUiw==
X-Received: by 2002:a05:6102:3906:b0:5df:bb10:631e with SMTP id ada2fe7eead31-5e1de4bc6bcmr3747642137.41.1763998137590;
        Mon, 24 Nov 2025 07:28:57 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bda019b5sm5340767137.8.2025.11.24.07.28.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 07:28:57 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so1054036e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 07:28:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVc0ymzicFGwQkD8f2aFJPDTJ5Z/igbv/Xp6E4Xb1889VLNp0gUmaxoQL56oQO33iQ5MYZQE+gIOGs=@vger.kernel.org
X-Received: by 2002:a05:6122:2011:b0:559:6e2a:953d with SMTP id
 71dfb90a1353d-55b8ef8f5afmr3242357e0c.8.1763998136876; Mon, 24 Nov 2025
 07:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 16:28:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZznFdttha8L_r7O6rHYqrcumvJU8Fb7DaTCv6_SCnKg@mail.gmail.com>
X-Gm-Features: AWmQ_bntAR9TDV9XVvD8fDuaotBQeMQAeiwIa_R_PrLfAuKtTZ9RvX2YFOQkYCE
Message-ID: <CAMuHMdVZznFdttha8L_r7O6rHYqrcumvJU8Fb7DaTCv6_SCnKg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Propagate rate changes through
 mux parents
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 10:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable CLK_SET_RATE_PARENT for mux clocks so that rate changes can properly
> propagate to their parent clocks. Several clocks in the R9A09G077 CPG tree
> depend on upstream PLL or divider outputs being recalculated when a child
> requests a new frequency. Without this flag, rate adjustments stop at the
> mux layer, leaving parent rates unchanged and preventing the clock tree
> from converging on the intended values.
>
> Set the flag in DEF_MUX to ensure that parent clocks participate in rate
> negotiation, which is required for correct operation of the display and
> peripheral related clocks being added for RZ/T2H support.
>
> Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
