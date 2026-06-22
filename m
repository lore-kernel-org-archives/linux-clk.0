Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57F03AFB11
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133332; cv=none; b=KOEVaS24yb/PfHvik2ORR8jSJqH8QhLFrC1vw2JpRMU+seEJIilO0kSWKwTW6neKvPYRdHhp0GxAIxYBU1pkb1Smd6yG2QBmN3H6Bwz0EbjWqsroA56u470PXjdFOTfwioLOsME1GHGUwK+qO4TrWw5+Anl6KbYRp7QBP5Gvjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133332; c=relaxed/simple;
	bh=qK7VD9LHBp2iojTMkcS+j1VMY8DyxZEPJu9ua8on/To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFgxNnYUFuFonUaFJvwuU3ocWTplEhEr3RXGD1iniTEb889kVK6qbIm0RqXbaWLmIDzm382HKTdTQK/TfTauE2rreN7wP9azkQTZRweSOO12uf6TRuqbPfUJojvGz2bPHJzh4C5jZwffQvbbGLU/VBTAPCBl5b9DZjnwpJw3Sa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966df39a092so1417541241.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133329; x=1782738129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjMojdBNG/o8SIjkI26rWpitqIrtyyRQlAlt+FrtOZU=;
        b=Fh/+KuJ3NRLgMwz4y2ubuBrLW6Kk9kbsJ9YjTYJNu+zjetcnZGLHIJ+8L5C8xuXsJc
         +WSkxK3nx3zFhOHYSCfM+zWR0PJRHvcCIzL5P64y1a7YWVlH6cfoo3bduYIgI5v71aWM
         ZddfGQre4C8G2ctNKp8pGlvxQcKesbbsbCO4KfElDI7q9kjMJLUe1Ma7r0oGHbVyi3PC
         KI8WoPiyPDKMcOy/bxQhYjTTfBnDaTuUp5glgCK6CWLE+PzNCuhH4A41Jzdu3qKyD6Qi
         Qiu4AcYPG6348xyvH7CcD4sCF6nXAsvwUqUoa8MPyRrmA/OGunYJq7sWg1uBeY6Smbmt
         6a8g==
X-Forwarded-Encrypted: i=1; AFNElJ9rfSLzU517ovn5aChVLn2LNcqPBbGXVCoIW7G2dVn9niVo+BQVXf5KUpUrnCpK1aAKU151uItohHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvo0y69dfj4ZqU9j/vlcCMrbzZVA6q6AbUuNe2XpsI//Otp0Jn
	upHJvYxhrnjL3kFI0qLVB6/PEatSVg6i98SNiH6dWyBlEFP6DIW6sxs8ir/i+t3l
X-Gm-Gg: AfdE7cm6iz/HiYusmKJJ0CwenjgUIuKtFk2mn9Gz8m1fVQpQw1RIOgA48h3rTpP4DU/
	asq/FuG3jsjVMff6pwTNC6+NoJqWzfy0dIwk22lLRYLCo35QFhrH1j2I59XxE8FMOvGrIHcTuOk
	TCb7hwmtgmS3W7NqzQjV15QOY/VAzAv/esRZlRyC88rE56cneylo0AKY3IDUHyaYiUHN1mjIo4r
	/sEU5Gxv9SagbBWXcvyD7GF1ki8Veg3Wd1RFZFPbxd5BRdR5fi7J4r8QJH6xWvGW0xrT6KBasuq
	z2zLFXrFiWfdjGRQHm3rASsUJqPklthjz+71LfmIgGJR4DGInoWdWb8m9+wcbgSrR+9EE7xH/bd
	JhhzbJigcVYskoJaBx3bvWb4/JlDsIpbE5ToO0SxBEnoqTy6Q6iP95qe3S5pLe6R7Clv/IjhGMU
	9lALxZkkOz1VDSXv+rzntaIihjXD4d9K9hO9WAwMflSkAW56hjdQ==
X-Received: by 2002:a05:6102:cc9:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-72a037518ccmr9348877137.14.1782133328282;
        Mon, 22 Jun 2026 06:02:08 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba4f2926dsm5843325137.7.2026.06.22.06.02.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:02:04 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-729d8f9238dso1005804137.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+5mQsyu0cJ3YC4GG/Vj3+spDd4pM3YXqAJCyvVRo+69e3HfEeYYsniFz1WsrJ9or8V+76loFz8G9k=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:631:4cda:3e86 with SMTP id
 ada2fe7eead31-72a042b0725mr7252805137.24.1782133278319; Mon, 22 Jun 2026
 06:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:01:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
X-Gm-Features: AVVi8Ce07vFTcANCkm8814EiCsqaHjcIMGnkhkhtKVp2ly41YzdV-ZwpiC2NPxE
Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - No change

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
