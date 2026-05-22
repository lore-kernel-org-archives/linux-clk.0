Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745323BED7F
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442281; cv=none; b=TbvKFzyk1iVpqR7egqduFadsBVSyuQooNw9soASh+fxUBAxVyRSp3W3zOYn2dqgpKoaKcT/rUEmueRACkZHR1jhIw1v/w6RluI6MwGqFK/wJ9q6oWLKaYlhqxWJ/1FzyWlbQItoM6uuCQ3qBNFqDYmYxbdA7knnTzGPb5L2/c6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442281; c=relaxed/simple;
	bh=tQoNXs0YXAnp39amJZcKaF37pK97KoMuwAUSiGpU0uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF51hCRaXzpLdMkDSu3mQOtMA+og9K+zkHL8tJyoLuB+bWQjqntIp0IdoyKl8vKUBBw9N9t35gr0HQIrrT3Lbz1PO1Qc9p4bdpTHIwe3qed9CxZIeFC+YA0seu32Oho8/ydzUauOBcTHwop5uo8qHGlfW/hFdkGEvX+R6i1Nx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so4778552241.3
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442279; x=1780047079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXh/a66hlYfRbxZfuNeGCMhzqvUCQcFK2ffTSRMpwj0=;
        b=WSzb6F5ZjTklUlWsrWVTy3d03KCIRaby9rIticdJjSmDeo+cdOTGzYdR55IXcYwxsG
         vBCTco+9JbKzSbGkaaerIQrIv+ZEuFo6xFEmwrfcLBTo34fn5JqcDjl2q1+a16tI+wqU
         rXZ/PCrjtyV4IqZllh3WZFI9ZOipd89tWLLdemtipCqCxJnYpZY0r0dXmVGL02d4+IQH
         e1E8w9S4D21mKWH1lF/N+Clb52siq5mBexJI6WyVp9jlyweEJCiFrLN7fYJ6200QYrsI
         LWfO/k0yvMREHQWRcFMJ233vlvyojMsThcwztNlmpnEmLMuffjQIvjXuaBg8OFeQFJ6T
         QZvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9E8kgGZjyDKHf/gJlQsEVL0amGtgU1jCYp0245/bBgcocIjYWcZnP3yDFW7n7V6BCFMtDgbYCCd50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzju8b65zog5o7mQIZtGgz8MNFzN5G1zuu/HFf9M5fAKl7ZayIa
	ZhDAgjUJbtlysYKuPnWZTkiRFh8nTfz3/ZjyXY68DazuFkwSFAB4+Kpn5UC1/nLQ
X-Gm-Gg: Acq92OGefUg+Pycg1UWsfUHqmUhnQ7NY84J6gRcmNKfi/kogcp7y3YhU2D8zCF4VNUR
	9dtn+fqXlA/gCwZby9TQ3Z3lgFPcWzxZwz+/i92q+p+8rqoKfmbyUoUK5e/cMWaaT4skgu8wkWU
	DgDqYQwA8p99Q3bvH3Ebv0QHQEFtaJvUas5gjbhFwdntPtRQi9F02JnbEqZdiL0JBeEPyMBjuo+
	YqPvPUAR8PRxZL3dmmCTayOypCRGnCFgpmKYpIOpJg0X8mFkU96VEGfzyaIOxceDdmoEFQvVoZU
	7HlnwU+kx9B3t9C7W7yZSakjDipX1ZUJsaYpXj1BOMsjRAva2tb0P1cGbHU0Lh7nRKTXmTDsv7H
	nUxi5Tag3yDLt0uJOTDYBeg555CzvbJ4bP5I+IPNzgoitx3su5DUNtYyQQFNGJXNeRFpYYLwvt5
	f89J1J5vRlMGpJDeNMBOvbgv09Te88xrhaco8I6GHuP6q70iLdfI7dxxH6OpbF
X-Received: by 2002:a05:6102:4589:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-67c5f48e955mr1282903137.0.1779442279470;
        Fri, 22 May 2026 02:31:19 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm926918241.2.2026.05.22.02.31.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:31:18 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6312d29596cso5304972137.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 02:31:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nbjZZzmzo26C0nELzFdowxcQCA9PT0xZwYxVpWLiLm1wlotFtMycVm6RqQX5+S/+NECQ33f0IzMc=@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id
 ada2fe7eead31-67c6f741653mr1209894137.4.1779442278012; Fri, 22 May 2026
 02:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:31:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6m1+Ay5i-5Fty+W3knznVYK+SP_-G649joyR-JaoC=g@mail.gmail.com>
X-Gm-Features: AVHnY4JCREYmX_pQ2UBjLSuHgDHou004xVproUkaCAOyhIUIUfjhoGTRoG5CGVI
Message-ID: <CAMuHMdX6m1+Ay5i-5Fty+W3knznVYK+SP_-G649joyR-JaoC=g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 11:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Drop the unused DEF_G3S_MUX helper macro from the r9a08g045 CPG
> driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
