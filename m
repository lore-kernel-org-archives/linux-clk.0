Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF732C8B
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062769; cv=none; b=lSJZ26BkX98PpKlbs4IgutPONOumaU7w1N+53d9Wx+A6OswjnugTUMT60f7R9FDQ2EhVkmjQ8JGDn/4W4bl4ED8sj6stNTZPlB+LycX+fhGnWOIKS1bseNMFOAa/tDQipdbfNqJaDtk0AcKpJeluHK2GcR3KWrEgpsJsoXuRQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062769; c=relaxed/simple;
	bh=B2Xa6VZztFm42sxYFXowro4G1pwYLrRZg7/codjLEJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFwwmQEbXOIPgWHaKLQ7h4IAEP6LY4Vj382LwmYiueAI+NeXQKmbJ/lTfPcqsrnONt0XZ/lWyBqXhEMay/XUrALOyQLISSX+y3qjPZ6yBTAbHKXgrAxg2QeCebqth1Lcgh/JbWkExaR3SbSKPWpbrl6CbEjtQQ8h4VL73Y7z73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57512b86273so2746962e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 03:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778062764; x=1778667564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOZWVrduNGKMu3VYaa4JiBvzYZTtFtYjox5RDxS4rA=;
        b=kwTFveXrRM9Oedp+pjCk+6dToPC2bfonY8kQ1l79pFB6sYDshgl555OAkpqwVoU/gk
         d18cJYlnaZULrBmaf/5B7+xiOXc9YH294Hp7y8ojeu8xkyatrt6UEtfYNj7TzBmL/353
         omUi42Jh2HgUgWlp0S0zzqewZa0FH/yN6Pq5UoAplqCxdr4FC4LJtj0Rx6U0ZSYoFuhC
         D7FduBa/wu096XuPoj8kVhcoMPNA5+UX87gre9kFn/OLcv1u5Ex/MJGNN+j7ehmk3mbm
         ykSl6+1qLdHibtoBtUmBOSkFRaKkfpS002USmXRUh4IA34pULrQrcK+5fgcTIxag3J/P
         w3qQ==
X-Forwarded-Encrypted: i=1; AFNElJ/k+fTm4cyVrsFAA87g5flkLxFGH3695CBQ1/miMM70mNZ2b+c8lTICc4LECu6CvB7j8IGkBmAcv7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YywwP3oISXqXbbPEEXSb7z3c83v4ghYCCioedbduIScZKZ8dPDR
	xvTUmrH+hP7ycBxU2pUUI/T7HfztMK4Wek9vmkibJiPl11ioxv+6IoOqGAS+PZPy
X-Gm-Gg: AeBDietUGDODPSDJbeSK6xHzXZxJnizz2s5EYumvBsfqLPJw8cKVUYURune1iKzvPOt
	ibIfyy1ePNI+SFaS0hauW1qokrKzfYy9mt96z7DcrQIXkpdQUmNnyR7mEHbvxrWWYo7OFS/H0Yx
	gUJD/UFJoafmz6EN8MoRfqPVJFuce8JfUnzeYQzzCH0E9Mmw1aI1scLUU9X/WdbvdOtZ3vxybUC
	PxipmGWEyNUrVl+6XDrUx75WOj9BPjKfMiNRXm2dzlqmrZao847N4JEO17K1QSOMDPudKx7X/im
	UbRCIeQ4yGKBpZN8QsZmg3n+MtgYr6UHJTdsAfuy06Ugg7ebdPH5b2Wy5CqV/YY9BeTcezNgC7n
	kzuZ4269UYP/tMKuOslTxtnPPki+7Nb992tv2oCOY1YxszZs7Z0LJLHtRP2gvLhKpk95Jp1owUP
	fhgiPOjR27CMAIpZxpvZCqIZQ/TBY3IP5pYzR3bh1Z+D0zBIRs7LkCHNuAEWOW9Cl4iN7nmVJ7z
	h0=
X-Received: by 2002:a05:6122:f09:b0:572:353f:be2d with SMTP id 71dfb90a1353d-575597d2482mr1443244e0c.13.1778062764389;
        Wed, 06 May 2026 03:19:24 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57533806c17sm5205680e0c.0.2026.05.06.03.19.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:19:22 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57512b86273so2746947e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 03:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YRy3g5J4UvK4dymw8jHHjTN2J5WKMOUdh3gf2EDI5Iu4zwL2fu5WFveV2t1iYnGc+oTRk8/NzVfw=@vger.kernel.org
X-Received: by 2002:a05:6122:3214:b0:56b:815c:961d with SMTP id
 71dfb90a1353d-5755963f49fmr1289109e0c.5.1778062762167; Wed, 06 May 2026
 03:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 12:19:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JCwkwAqaqLSNXuaf0ETjjPOv64a8QgXMobUA_baaUFwZots-RZr9ezKew
Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
