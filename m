Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C23E3F7E8F
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850031; cv=none; b=EtvcjGZ7GGBa3ZSe71CICUfTQfE+ZM0sDlcjoej9qVYbgWoHRMhkxSd85GE03hQ6u+DOGkmTYVw5yM5A4CQpLciDZZyqM1foSmwzGG5nDCB+L2CF7AcV/m48z6DWu1PBE6QTwystUEalNJIwKy7m/u7siYVFh+rzaC/CgkAHu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850031; c=relaxed/simple;
	bh=C0K3zuIGCFbCWEAA6RQca9NBjlh1H0UByRONnfECmAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVczfcJaXQ7FxPRWXH/OMOA6DkMtOUrG0F5Giy14MtZAXCaMCYld4yjXTicaroANNeb2nJuFpfcIF4yapUzemGAdqN3Xbp3F5vteKQQbc0xGT/B6sZnK1uF/mirwKVx7SPJwm2cL0U9J0sqSFVI9IS9wToGKN3ZyGpe3D+6Ec24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94acd026e45so1599918241.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850024; x=1774454824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikhQ/s135EgCf6c2OwoW/1zLZPqI7cynubnVYKoEijY=;
        b=geEIeukNI5fFRWwn70ntmT4aCr4SZKVc0NPELHO+OT06hH1ZGeZaw4nK7DR1j85FWd
         GUmWd1U2EqrkSdqna0kpWuahw/lQTNEchTMO3zK618pFunQ+WQv5+D1+PhJc4/NmnKZa
         iYDmciaPiTEBA4RsaJuLCQI8Jsn9po8NIZDBAexcO59B5iH9krxJa0Fu3aw9SQG0JMRS
         Kif7NMzSB4a+JUL00FDZUyy1frIXAaCgjDxd/D7NIn+Vv6vfCT6XUYcs5nbOJb1O+anN
         kbmLgFhSOpjevVfdtCq1UDl23wXeVL6LIAW6gJaKRPc6enkMQ3UqfTGnGycfbjXYfINJ
         iFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUAmp+E9uCGYzpk7/cPznc4sqaZ9i/Zy72+6JDR8/KVg3Kt2pY6D2LOBQzfBcP6ANyzpBOiezczLsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH05kUi94Jh+Uk8Ab1BXIeNRlFQBFvnta3Nz93L5nYJPP3iapb
	Jx+hiC6+XP5yfX8Z/tlBV/to+ZZuCmFhArJLruhQmezpLwCj6FD3mJ2YeWEzpM8mP0Q=
X-Gm-Gg: ATEYQzysjdr32zGlBPLRd+gvls2wVBXCaz0jaDYgtfFXnCz6HJkYW5/UcwLvZteCyxB
	vNNiuLaBbKZu9CDRTDE7gNLn3Vi+BQvpqmGqe04IxIWNTBAkhRUtVF99nt4nbwA6GG4HxX2KpcL
	yKM8lSWlVuBKU3FDaCIKjKVeCZfehHlD7GZnmaiiB6TGWCmYKCC0WIlWlWEKI/YOEbk7ZPPk3Yw
	j7y4uekrFA+dqdGqNTNiTz2KO0cnBC2IVpZezWL5ErXV9YvykRZHpX5x4qaK9aTAhtcTvxKHNT4
	IAv1x4+m01mAC4Yo2CR+aa3v4YW1K/fVorNfN77M46PehV6cv6Dm0t0+PFvvwBlEGxZWvf1p46Q
	TkoWDQw6jvriLg2tvApxg80XdMscL4CkFaPixo591M9dHS2eJ7yB2eL5M6kbMY0tkvcl0AIhcdj
	XEP9Qo25IJizsbUIkF9CQg9xEvh0sa4AvdVUEAIOydNOvXKQDCyqT3JYMlRp9b/F7r
X-Received: by 2002:a05:6102:5110:b0:5ff:1e61:b303 with SMTP id ada2fe7eead31-6027d2cb4c9mr1575274137.17.1773850024147;
        Wed, 18 Mar 2026 09:07:04 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027ee4bc21sm1613086137.12.2026.03.18.09.07.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:07:03 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b679e72d9so2172902e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVO8BjLNxjL+2+r80iwjE6YZ0yzTef84vQURCQh1mL/5NX4aRcw9E/UE4C8LOcLzkNy12dqtKjB3l0=@vger.kernel.org
X-Received: by 2002:a05:6122:8c0c:b0:567:499d:1fb8 with SMTP id
 71dfb90a1353d-56ba719311cmr2253679e0c.13.1773850022582; Wed, 18 Mar 2026
 09:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:06:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOxG7JKmwZFEy5EE+qJKSMuafA58HQGfFxzNDTsJ9OEA@mail.gmail.com>
X-Gm-Features: AaiRm53ykWAMjD_Bg0jQpCEt2WVWpWU9Yx6QysAtvExMVNjGws_pY1ovqWPD_kc
Message-ID: <CAMuHMdXOxG7JKmwZFEy5EE+qJKSMuafA58HQGfFxzNDTsJ9OEA@mail.gmail.com>
Subject: Re: [PATCH 2/5] spi: dt-bindings: renesas,rzv2h-rspi: Document dmas property
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 17:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the dmas property to state it must be specified as TX/RX DMA
> specifier pairs.
> This clarifies the expected ordering and improves binding readability
> without changing behavior.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

The dependency is now in spi/for-next.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
