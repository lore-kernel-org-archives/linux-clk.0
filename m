Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088EF3ACA60
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433802; cv=none; b=SzczZi9Spctf96e2jg3T9aOo99pjnPaqv+VNgzxrmWQpjeW/msveUniMEmTIgq98RUsDkuVtTkIt8K39coAUPKHYU/XwA8AvCuGZoWtLfo3k8h/Mu/twpBfMc4mhprNoHgGLl0YRq39WRGq3VLgkQzz7IFKnBh4LmxlEoXPHpbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433802; c=relaxed/simple;
	bh=OEBtpeSr41dZ3EZGknc7L9hCWxi5F1KcZZ1/d9YvxG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/rmnSRUJKR4uWfo51PYvBjbatgOXQ6InFkXIIkL/25Ywo7C3In7MWBjBM/jjTLHEYyYDYsjlu2L0brRWvjvpwHievrz9hM/EiSnE1uFSkYklP7ZKzXf29SdjA8cBktIL+J7PUtUw6KccYyEOiU5wIGW4V5vO2aCJ1jMfw31hEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so487768241.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 03:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433800; x=1775038600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNQGjJuwM+3CX5QT0Pm/2VPyuySRhYU5/R5xPZKy+IA=;
        b=BEjxapaQcphF/4jhus3qxOz5Hnlwyi2N72Dw/9wB+J+Jb6I4l7s0TnCgLLr+Js5fRF
         j4IZZPp9pFBcohnuX0fkQAC1yT15/P/2d7M6EuiUqUWEGop9dVRTfAwXvn6EwkW2xTw2
         RqWX+OhyA0mVlWpZIb+UoybyVJQDydvm4G7bx8rOkTkVErcRnSfwhEZXyYOKsoQTpXcY
         dY0l0+UV7ffRUJBWmkY3+y6RhfyHXYQS+4GgbYAJwEa0XdpxXaX9/0ASRg6dO8zQxQU4
         BsT2uxdY2rlQykW3E8N3z5xmsCh60AdBfnDTSoymFc3AOSTwbHTnRLrCV07CIT3X8xP/
         g/5w==
X-Forwarded-Encrypted: i=1; AJvYcCUcVJcXxaCX3Wua8px0lH2cAP/DNvP8pnqv9X7swt1oPYK4F2ImP8bZbHovw884i/JQ15nB+umQn0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIuZhVbaLFJAUr1LJuKxyTgHwiIWS+PjhVxhvezZo1ZM5TtnZ
	yAizLw1mLh9SgPVMB84QXByHeaVbPXuE6shRwG6cYCUFj6y8zw+4ZdjjfLB6k7iEsbA=
X-Gm-Gg: ATEYQzxom5JGvIOqT3T/xfVSgu0jRTDJgtvJiom7AvH1EuAnONl15QE6gUWt/EwFXuo
	rXo5lExTBIMsCW2n2BfGvQFpH3hpEyS5ZsIrjHFrGkVQ2SJiUBAMvSVTBBLxYo+nhrJL0O5JHod
	deBj3kmfRNDWtmFpv+k5a+t5uyJucswXZYzUdXS5ltlTgjCV/9xa4XaFhbIG9qPmK66Ew3r8uPX
	u7ShhAheMvrXuK3b6iFf18rYh5YXYAIl+2rUxErx82uw0/j8+/74O5e5FkSRAHVbeCYASDH7Pxi
	SnHDbdB0RJfx+A32JZ1hOG//YKZt7L9nBywYp26itUZ/7URS7zDWMnAlW7/BESwXMbzhgN6SxdP
	j3fQUcq34A5F1fJ3090uT1ENdKQJxybjbxJULQyTumN46P0l8BBvMRVY6hafNGGHwvirF6RlD0u
	bKRHXDQNO2C5zvzt23+vyhszOvX+xhOzZM1KGTYdTZbUqpOZGdqGotmGHLpPLr
X-Received: by 2002:a05:6102:f10:b0:602:896a:84ba with SMTP id ada2fe7eead31-60316255906mr2941913137.17.1774433799901;
        Wed, 25 Mar 2026 03:16:39 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm13166479137.10.2026.03.25.03.16.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:16:39 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so691173137.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 03:16:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfc7DPBAMF0FfOepDu9Dt4ds/6mnoQiDUkCihad4ui+gVMyDYlh66Ede9LfFDv+koy0+9jp6vUSI0=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-603161b855fmr3344811137.11.1774433798679; Wed, 25 Mar 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
X-Gm-Features: AQROBzC-crhwu8Gg_duZpu3fi-1fiqmCCzQLU7W9KwffAtApPIHHGTBoF1MILbE
Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
