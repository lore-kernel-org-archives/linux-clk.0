Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C0320A00
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544525; cv=none; b=cwpwcLcvDgi62nJaUbJoXF/HbI2OhJuThUz1Q2szay7oNJqauBdNbDapZEI41Nx/49kZbaak6pw+j90TaA2ah4uGnXYiMKtQuz3fTPlucfGtMU/CC80vTm8XiG9xzXON3BSOOdb0YfFXsxiTm7YJIOGg+k7SpXLCmpYFpBpObMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544525; c=relaxed/simple;
	bh=0Mx80CC1QWM3bvGMYo64nUaV/drH9YWwIQYt8dBOlnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PiulEv4f3WfmMaixpCHgZP4jYzwsfSTQs/CqiKqFocLNcxZHmkYxkbZXdA4FBpkJw0P9frib4I7hqACq35vMPGArWZUHv3UCSf0ZHIkuJR/1xsjNoUNVe/8WJHYOw+lwg6FsLMW2x11bZ3Cazhv30rEmCQh3JUgzo//REiesWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff14dd9bf8so1492120137.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544523; x=1773149323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDxJiIrxQC92hbeNlNOe8Nj98YN/DDHhyxVEaLyss1E=;
        b=OQ8dWqzw6sf3u/Ou/u/iKPavI38t2AKGseCGG9gVEZvpvDCMF3C1hZfV8TxemaoDNn
         Lu+xV1lOS04+jU+N98yEx38BHF+D36GMUnZTRZT3dGq4CM6G3isvx8iR/rf9nd9CSsxN
         lomW5JyJOtB1ZdV4WlqBQoptiHB7hNnwu+3chGH+QsdXh3XvFTyjIJh7vZ47frBkcnPE
         4RlfFuYbXV6OzNfWPLca1vFm2x4/teiACwOWkr83n5FY6sDMkn0hIxZKlXEFpjrXzkN+
         3Zb3/97Nj3LL7Q9ETFivZyyYHp+t/tZ4R2mIUWtqDjopNlKJOjybZdnJ20AxlAc14hn+
         sIjg==
X-Forwarded-Encrypted: i=1; AJvYcCX2DfSBFtKRbOUCPZs9cHVIsU98Gl7JFxrbVvPKViUoYA08tW9hafmRoQVR+2mEwCI0YSNJZHRwB3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt6f78lr1jMPYvhvst7etx45QSMjCXUa6uCcdPwFltbANaq/7g
	akY4bJCTGNJEFkk6IRSuhu97EE6yisMTadejZQ+9bqeC0PX607sDC9U4IJZSeNGy
X-Gm-Gg: ATEYQzyx90fwiFiM+dcAksKIxKKExMHd89nDuxZD7z8WYpb6bIHqaoq7x753gn1wsTx
	7HLifle9HZ9z45Ymg6sGtyX3iKMIFvLlCSOljJQz66Zuh2bx+kCLQctRgMiA8t4cS7Lsqv6imSd
	LwEn9b1P7BxfCabyORxwxt3NuOo9MBS+yvzfbSKuUg+neiSY5qIqQtLzUwv4WSeCD8+9Xb2ujJa
	BsGM/RqWnLzC1LVvoE8pgdT4vj4Qrn5vHEyikYhs57JbETBKmeyI3Z4te1ibYdmR+9YsBATV/5z
	qLve4TFk0dttFujL5u3nB9C1QpH3GTtD2zMcITjtbKXjWJLkSdlI+Tu0ZMz3XxOrKSa1nOxeX+X
	W7zvTrVj1XYGF/h33r85RpXGKrrpAnxrJZC/FWRc8Q5x6swltn6I5STSgxAoHAlvHdNIroZ3WPH
	IvwpnzDiXFwKrSLWmdzdha1g1SJQbiVMaqaDQ+pWtt3FekQUPkoNXHgppSazSD
X-Received: by 2002:a05:6102:3f49:b0:5f5:328e:73ab with SMTP id ada2fe7eead31-5ff32555e06mr6850989137.32.1772544523333;
        Tue, 03 Mar 2026 05:28:43 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6f7fesm16493613137.13.2026.03.03.05.28.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:28:41 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff05af29b4so1952122137.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:28:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxEvY88Wp93AhZakmOtGj9O4pBzt+muf12h+h6LdhThBxXVYMg/aNxN6LnHSWwLh7b8ghUEoVH7Ws=@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5fd:f14d:4cd6 with SMTP id
 ada2fe7eead31-5ff3254b2bdmr6188901137.27.1772544521227; Tue, 03 Mar 2026
 05:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
X-Gm-Features: AaiRm53fCUjLUZ6px0BRfJJuPYdPSrAIEkOdRkY6q1dq85dF6GGqE9pEydHG_cc
Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC (a.k.a r9a09g057)
> states that only WDT1 is supposed to be accessed by the CA55 cores.
> WDT0 is supposed to be used by the CM33 core, WDT2 is supposed
> to be used by the CR8 core 0, and WDT3 is supposed to be used
> by the CR8 core 1.
>
> Remove wdt{0,2,3} from the SoC specific device tree to make it
> compliant with the specification from the HW manual.
>
> This change is harmless as there are currently no users of the
> wdt{0,2,3} device tree nodes, only the wdt1 node is actually used.
>
> Fixes: 095105496e7d ("arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to arch/arm64/boot/dts/renesas/r9a09g056.dtsi, too, with the SoC name
and part numbers updated, and

    Fixes: 7db958983c8dd14d ("arm64: dts: renesas: r9a09g056: Add
WDT0-WDT3 nodes")

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
