Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDACE3B6379
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689820; cv=none; b=s35Pn4tMzHR+A6s38CHVqXEaq7WRZ7U8POz/8+D7VQNFWu1YaiaZ5AIwGe2M1yrkM8u6pJwzCGeSUAM+vxvJz01BLiqYn1q+xMOkb46NnF0t2ncTaMGU7rPFZ6G0688dU7Qf0VlPoMQ18vGYcX9X9TGNW6rzS/q3ZQua7Y4sUxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689820; c=relaxed/simple;
	bh=yosGDZRUqJOAqWGj+YSUg44nrce0K/K5QUaTYJIYSEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED/zy26uwSqxoDU4BWQRJVbPYOVuHMl+DwrtAcFXAAcBOS3gSRE8/1vGO1RV0IS/TvjSp/vVIjWnghbs2d2CiGp/RnEQsPouRqgAc0l6qUo+X1Zapj4Bw2JG4N5XTTkchu5mAyfwE6QWESyt//NJP3ykv5b+PokiLRsQg4aN+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9669195bc9bso1441838241.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689818; x=1782294618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be9sl4KL53VG3jbIWtM67exzlHhIMuOa3JPJ5DmV4OE=;
        b=f66LLbbRy1tpMQfgabJp22QNviLaVatX0V7new9Jyf9+GO8mZ2qAgLl17/QmYDF1LQ
         vYcnsb/17PsTHn0rGYf8cz/Lx8JJgQx4AMTUCMYgQN5cwWyTaE6P//9HGWXR5Ug18GjN
         FJZhITHf7HmXSD9mN0M2HFn2RLXo/jO4Zd5IH7+eYE7xF5xXgdG8Az5NSXQ8yvbcGz1F
         iN6IMFhGBU7IFxvQLRV1GhoNmPeIeIGcqLLrznkKimWEh5GkMXahnJCkfwIHcGtSpa3p
         ash8UyrLOKarLccHPbNh6VF3lu5lcI/mTX00bKPts7BGvzpVNt0ijXKCXREA77Ae1HrC
         DwHg==
X-Forwarded-Encrypted: i=1; AFNElJ/86ii8xD3QEKwX1yVDlQAdHpey2J5JMT2Kxb6QjKW/alJSl9b3YWXcwvnxEuQj4Q5CTWCSRC/BKWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgOCI9x9AIorFx+O2xOrVwCOWSSpQ29NX0woDvONt2J/uWH4v
	ig8fBLyMbqc+Xmp+i9nsXtD8ZD+e7p553WDc5ZvE/lm/1BSQswinP6kV/2qk0zeu
X-Gm-Gg: Acq92OHF7GeqgdLXIW6cnbyk9DZvn+VrNK1Dgn6gnubsVjfJfyPM323Mw3Ogp01lmNe
	E9M9OpcH6U9SinjBAG/c82MPv9L5dMq4pF2VZL3HTJka1s0sPeJ4efgK6I98gqj/fdx6U0txZGp
	wc+7oexIsgRjt2RBHeka6oFLvxpVHOEQ3c8FZd2yjMsAKK6ON0o0ocU5a/4Gu7WirdKceg6ncid
	4WlJ+HtSShejXuezwWORDUFCDSUeXCXmaFR7NWXwtpltKAGIfhgojA9u1MsCkYJLYbg0By1Z5Rw
	VORCcT6jqBPi2IeP7EeczNeuO//Jc+/fncHeQhUQ8CU5wrW2JDPnbTwykPaerLHa2kwfPhyLllK
	ee/je/2SXDGq7rS/M/mKBp2QUSwUdtKkBdItfQYu9XHW91y0sPb8fBMsqCf3Afm18HhF9awXBKZ
	WCJbxSI8f7CzJUAbI6jG0ZKBt9zpMzyK0s2fCk1nIQJ2KXZfZ/Vg==
X-Received: by 2002:a05:6102:41ab:b0:6d6:c2ca:1c20 with SMTP id ada2fe7eead31-7246c9abc2amr1307010137.14.1781689817729;
        Wed, 17 Jun 2026 02:50:17 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878872efsm6867095137.12.2026.06.17.02.50.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:50:17 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso2250415241.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tmVUHNuhEADR4MBLW1QuO3aIBPjrI3TgsiU4IGZEfc3w34YjqcfuPluDK1bSR2qq7WDwzBJzWkig=@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:6cf:37fe:2cb with SMTP id
 ada2fe7eead31-7246d750087mr1351245137.27.1781689816544; Wed, 17 Jun 2026
 02:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:50:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
X-Gm-Features: AVVi8CcJp3e9kR75NVaDatbeWYVbp9xfJzSab3kpmDUcfOpvbSLyDp0yecrMJ4k
Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
