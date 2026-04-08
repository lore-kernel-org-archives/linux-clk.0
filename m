Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31530FC23
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654939; cv=none; b=INDBOzM6ApFn+SSnvHn9i8DhNC/iuqiitB2rgOcn3aUDEgIrFjOq4XYcqJN+MGsL4VQP85qn2gXIju/7RIArIx9U7fAK9QwtOOR4ukm1pBTuyfu3Iug249enr+6x2JeJv2C1qiKkd7aMTt+NbL0npifOkE4qQY4bfz4Hl+9re6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654939; c=relaxed/simple;
	bh=Esa6dVRyYOOr3vJIDSY5cJEBLjvkhKepH2lKClA4ih8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU+Q3nJK45GHhFnN2OayXMISSHHfEOfxQNzyoA1kpUenTXrmQNV1s1EkQ8xNTwS4luQb0/g1GDIh7o+TRS+xQryuHO0/1RpLiuoJohUz4Fw0HOhUAzG6k/s+Vdfs68Wpjdi/rDbDWbmxtDWEpOs7EG2ZqI/dp5j5Ni6gb47zOsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c9f6b78ca4so813392685a.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654938; x=1776259738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VHgesrf5StiprJKDytJNXvB7R5FJ2lBTM9ZJItFuhE=;
        b=kcyU5BWEY8dYtolCKw/yOxEwDy7Ux5G/K12L9aKrKhKdwI60mPydVPWj6Brcmg0lEE
         DkmXmnDaNoZZkirlcKXZPplHaAoB+mcjQuTzKWp8mhHhiExjKXsKiXOD6K2agkRaBewt
         smbSp7Jv7vY6mfSFUNDH23LZa4MZAXTyKSIO1vVb6Cjx2x7AdXDwrbgDLorNmIR1K6Ki
         LkISy3em+SVYwQFJVgDjAq0h60FJ+CuTRRnXfXPuOA8XTAqDYtQg0r3Rd8EicHFZ1m7Z
         Mze3Yyj5oNarSv7eW91TqSq54saxQfM/P7mFFg1aHM6J8gF90vhbPl96zf8pwssVuLd8
         CnFA==
X-Forwarded-Encrypted: i=1; AJvYcCWzgrDrj0jEGpbBsHN95Kc4BPpVEw0CRUo1eW7LQ0zqmpQ0CDPjy8PtVy/XtWsV9DKB2+14FxcbuGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucvwnmyW5xMw49x1Vbn6Zp4fcVC5XED/gMT1VMRQab3+UhKAI
	9AU5ifG7hVg9u6ELmeT5KtPiEGnj0n8iQG6bhWSnNOae6oUG+i1g1R9yYCR/6A==
X-Gm-Gg: AeBDievuWZnUjboQOEnmmH1z/0EDBzwRkeeKPbchJSB9Te4FlKVdqyEjEyQNoW5GhP1
	+PUuicM1QyvxN50jBsRYSw5f2Hlmh5Pk8rIwjHrYUb1+dKb9zOGlX/xi/NvBd4Wp94EYR5Gud7T
	w6NP36Ts3vf0g5Tnjl5fL7lsbDuaNNLpZgCTeDY9oYqDy5uQ2BpBnF6CDK1gwU9M5bkojsQTmsI
	00yTwMua2Fzb6otbK8uFLqtnmt0mljlo59WX60CMVxgth0oAUqA+YN/BJ/IqXPeYHQwwAdNYbS2
	P4KS0A7Gs1QPKr9C8U30ih/zQFuiar3vhOpVWwwFmSO7f1CjlEzFYWt3POfMgElyqMGJisn5njj
	kqilwoDM3DoC3+aQF6pXJL6JMW5MfbkjKmsVWJBK/p4Bu9yw5xv+SJ/YVU0WAhygr3UbV2DiKz9
	VimljqOjSeIW5ang+Z7Ovotv+vwCdCKmEjJGeUMs4J8d79JP6CSrCaq9NYz90VsALP
X-Received: by 2002:a05:620a:4591:b0:8cd:af31:b421 with SMTP id af79cd13be357-8d41da56b21mr3223725085a.34.1775654937666;
        Wed, 08 Apr 2026 06:28:57 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a806cd69sm1537397485a.29.2026.04.08.06.28.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:28:57 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb5c9ba82bso972164385a.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9VBRbfGhBA8qzarZkk0f36WpvIYjUP6JDkTYTExWxuMH8qelEWxw1UTkzUfU/G0vOsqandZdrKw8=@vger.kernel.org
X-Received: by 2002:a05:6122:3a03:b0:56f:1a26:563a with SMTP id
 71dfb90a1353d-56f1a265761mr1211064e0c.7.1775654605828; Wed, 08 Apr 2026
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
X-Gm-Features: AQROBzCAS3tdwS4I5i1ony0ZYqV2Tos82DINalsSZpND3OxFU3AJc31boq9f15A
Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
Subject: Re: [PATCH v6 06/21] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 12:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
