Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEA3310644
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505084; cv=none; b=XdSW/3sVJ+sunjpVSZ8iXDBHv7xtEsSrIwN4UWLWYNgaRcCB8mL8YC5ax/E6SAyH6Smho4qHBcw6lm8GeKipRAFidfFgZP3chfjx28TtvggkyKt07Si4Xddc/k/2SeUPEN5Q9bF13mizIan2gifvPYDg/FYAln42wCX7eBz4/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505084; c=relaxed/simple;
	bh=N6xgWoHDs7XMDSylQ0aZJ9sOOduQO7UazwaRI4anKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKBBZpyVbneiod3AjWq31QTyit1N/IJiPHUs2/8dHigz/iAAl427nI0H1d0EJg5IRSGhMR0WQuG7jG/g0hfiz0DQdFBHylc/WdvQXYUdGmGdtoP6CJ8oqONORQBRwv7zxPQ4h/ZxBWQlXOik9wl8rew6Wzloo4KAzzH+ZH1sYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-559a849bfe6so135581e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505082; x=1763109882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67Ay+8Yya5LB9/YiJJ49ptEwAOu7ahTc/J+O60ROzS4=;
        b=FYFn37y+l/p0JggmOs4dMUcWo3izyp4PLChY5qsRsAAY0UpystTZfFuh4ni0Gk1/gb
         j+VMAl6LO3poduVDV8tgLpwditN+Ojis7wG31Yy1m7Sw74ca1R1CqqKf+4zAUS3blpTw
         7wNfqa1qfq+ZLp6fZgDQPzN3EnqdeoGnve0oPwRBbDDWyvPhXAtPu24+IAzEIrZM7Xp/
         HuxqgjqZ6V4HCdOgNiUezwE0bRyO3JoqJ2z9iKyU45m6sR716gm6EePBKk50dSeT7NJS
         HRZ2Gc3Y42RHIkP4XVQ08sSYYu7NRTLDrRsQ3veLGAlCoirh3odrZU5kr1adqEz0PFSH
         MnjA==
X-Forwarded-Encrypted: i=1; AJvYcCUaqLXRd9IS/MfwzTJ+AZYMxcJ5yHttjsHEXznhMD0bjSoKBY80C0d5ZedFcdXGwS2noI+ldLV0Rsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0p8JJTSnjgYs8cjBDrfxTjBuccc4l7F4N+mGf/q7yos8VtCK
	jOqq1ZcS1KeGlAU4qYyfA95yUYl3we9K+9h2fcfPF4zuh4omzn1ea+dCoDf1cXjJ+iU=
X-Gm-Gg: ASbGncuVCyt+upUPnlulMdBHkZleojA/QuH4OSzqxbSQe4RvdRbWGzoLqVCRm4wkeuo
	CetOcdKXZIkK6hdqDTdJl34NpwhHzF4Zo/L6tqc0KUc7qgPV0AQKFccJtVTPy2DffpmLDpnyidw
	sfy+x3GHZQRVBoZlXOpnr02NJqxHwHcdd1QnY1TtF5LxgoxYX5pD436KD0pym5GfnIQnzsHJO7s
	58dY1WnU2ULrYV81GVCWM53CRa8YGVJty2U4ZPtjUJ56QhI/QLbaXR4frchl16+KO972o/lhGC0
	qdoJ+oOPSahSxrOZl7HRH1ApNzy1E49TyuwNM5sBqEY1D/y8lpXVXnkLbXnXrXIYZrSWug1ITNe
	tRRl5ao99OdVxplsFrRErA7tTdcOxwfMXWsI/1XqSmmeADwQE1YGZHS/Y4SDJcb9WIbgGq+3mUi
	aAzWJ28lyUxtYzDcVzgMXHg0pDNFheb8Ym94DPiVeWYbF1LsWIOeE0
X-Google-Smtp-Source: AGHT+IGA3E/NLj1ruAUdh8chJWA7A+qUrMZkCnVZ9VVNN6ohuRX9wMtOypvv5+7yRtq9eVDlOnwyuQ==
X-Received: by 2002:a05:6122:1d94:b0:544:75d1:15ba with SMTP id 71dfb90a1353d-559a3abedd3mr730221e0c.8.1762505082071;
        Fri, 07 Nov 2025 00:44:42 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55995863f11sm2682016e0c.24.2025.11.07.00.44.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:44:41 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5599688d06dso141582e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0dmULVlN4bMUXRIk7SnMxo64hOhbzugsYTBrc2mkxf/itiIfLMFvD/5fKSgTWzAK3Tm43uxlGYzk=@vger.kernel.org
X-Received: by 2002:a05:6122:200a:b0:54a:87d3:2f09 with SMTP id
 71dfb90a1353d-559a3a111a3mr827903e0c.2.1762505081472; Fri, 07 Nov 2025
 00:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:44:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4gFjba2jPEp65HwvvB3OH_jWkXhurTWFYCk6QiA1FJg@mail.gmail.com>
X-Gm-Features: AWmQ_blrrptFzMWpvu6Y-7pL5-tJ_1h0P3WXNduygzU8YG1UWYjXmC7OG5BpV9c
Message-ID: <CAMuHMdV4gFjba2jPEp65HwvvB3OH_jWkXhurTWFYCk6QiA1FJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: r8a779a0: Add ZG core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the core clock used by the GPU on the Renesas R-Car V3U
> (R8A779A0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
