Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A114E2E7373
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611950; cv=none; b=AmoCVVYxxe4g9+1BqCbyiebzem7LZgkyxSM4VdorcEcuozVrRw5JIYTuCE+aYkb6gm9fo5VwCMiaoV+MqCfU47FYBg1zr+WVrpvyRg0n8YrWn1BJjm+bkbL5hU1RloHC5FvTKYIrmuUzS6mQve/C9pgrZcGT5Hb3fdwuc2V4WyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611950; c=relaxed/simple;
	bh=FK7tiZEI0WffDbTlu07kAZuJRwj0uLdhH15mcZOjFjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRPDfsGss8PKIC59Pmzbt/uOttNzv8cykVn5G4bAsF6GMT0BB5v0HvNROOTIjFPezh5cc4vWUlLYUSa+99xxhMTd3ZAa2PKiqa1C9OoLhfn0e24g/WOkbTUUP/YUNDO4rDdyTr9ah8OZqgpxoF4/0/gbNiHyQ0SCZzruAnjeyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-738bcf9a573so670283137.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611948; x=1784216748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqrcHFDoPWS2t5kW57shcQV+qLcmaCnZOWUcXcNxWfY=;
        b=GTJIO/gWgA3KQNgHuJfvi6aNQgdCsCSIncLIq22EMKTZlHcX0yrkK3O6H1G63iG6JG
         jMNf3SbTqVkWM8gBIgd1d/tCjeeyJcxSO8+/eJnaYQ6SjhSeitAzPj7UFkU1Tja4DVoA
         ikwYhVRzKBeSGNKdIkXcAOfRbOD3TURFrq8gxSFGXVrLv1xzkXX4Z+Y/K6RL4l7kpTuC
         NLIUWYAXKB6nU5wXkLyAIZlUYv45HzPSrMQnxFhvV9qyhqdtognHVAhFR50gatbRl59s
         UzL8GIk+9f9Z+x8ltQn7Zu4yi3wou9ijBbGnEZWA+/nwp4uxyfOhwj5ojCwbKhp3CQG/
         ru0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6X6TuHhShODAja5FHtuP9/iA5o8GQFIrEEP1vMHzTcfKtijxAQfyKrhwrzM0J4lw4qgKiJYrLcrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ8VJFlVpiRrMFhpFAdK3M5a6IyLJK3b0dqz/nbJzigHU3UwlE
	+2Z8jAgqxUsQk3CzjI5O44/7XuRLycrCwTMXCK3dgZOyHTZ9yHhDL5c3wi4P0ZfwcF4=
X-Gm-Gg: AfdE7cnDO+E8sSZapMyXBvyjt3Q5TTMFU2GMj11DD4Q8zRTeYKzU75DP2GYmrJrxzuz
	cHyr2bSjzdynxjNhpUVmzr9hV+/BLBo0P/UxbsSZVwKm3ok0haD32Qh71fDG7sE2tQ3odb2y3ft
	Dzer3z628+DyB11YkYTdM0NVejvZ2c7l9tReLLbGcwRbyzJxOLdqhBjw2Zl3o8SV2RFhjAWKXF4
	2+M5jn99EI8oNOEFamU01qITVTKX6RtSt6Yz3MMDwkJPHDFrLQB5KDL5/jAKkrSFWV64jHUfE+6
	IjbQ3RQiunYAIo6uFXmZS5+NimSZggfGyG9ONjAVPc+Sdf9JEnkkEj9NhPk5KkmIcJ2IlPqpRCM
	a2qSizlw0mFPJgGBgUi358F04gq2g1pyNuWAT5G5dQEkJ3nxffbyzojzlclIvtQHYgQXnUGDHnY
	sAklnsdIhv8+V9AH0rw0/tCXZDOf+jHQ3n0TS+9eZqtIoR7In3vB8aCoDzhL9P
X-Received: by 2002:a05:6102:370e:b0:737:d2e8:d640 with SMTP id ada2fe7eead31-744dfed04c3mr4604704137.5.1783611947560;
        Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d4fsm3790945137.5.2026.07.09.08.45.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-969524c1aefso521593241.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpf1Myn7XOVM+o2auNcGf7g71ucYSNwSafT8/yeeluPotI4oO9vmNIs3FZn4a3mZBb0fZd2pZbt8tY=@vger.kernel.org
X-Received: by 2002:a05:6102:f8b:b0:6c2:e290:cc69 with SMTP id
 ada2fe7eead31-744e01021e1mr4657081137.23.1783611946911; Thu, 09 Jul 2026
 08:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707102418.1646159-1-claudiu.beznea+renesas@tuxon.dev> <20260707102418.1646159-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260707102418.1646159-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:45:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEQVN7VqsmQ6EKWxazrFyQdY4edaHyt8pPFEaJfGgbpQ@mail.gmail.com>
X-Gm-Features: AUfX_mz8Do1OkGKS8SDkGEbLBy8tojYuESbee1M6XmgysSPwrDRBiIuowYvmngs
Message-ID: <CAMuHMdUEQVN7VqsmQ6EKWxazrFyQdY4edaHyt8pPFEaJfGgbpQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, tu.nguyen.xg@renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 12:24, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
