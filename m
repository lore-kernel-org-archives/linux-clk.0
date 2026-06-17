Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE553B6C15
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680629; cv=none; b=RWmHSW+ss3xU0Ar3ZvsvHrhVsf/luuM1pluaM2mzaH0mZYEj1Fp3PEoEPDKT/XEFG5a0Q3bUxPTQKWLPvRILLAPJezU1XXP9MhBtzYUaZhTD0t9R6hik92Zmj1jDTvJQFkGvwJ9sZeuTj7DTjrVhyjLBT3vfTqfvs92UUBs/u2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680629; c=relaxed/simple;
	bh=+Q/X+Q2DSg+rq81utDjovW5AakD5MHld6hbZF6aXdkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGmjbhmDcA1ntP22quA5j4WpwELHvjpLIUdcIzWsZ8/U3yacBJvrtXt4MNDR7ISi2kgj1udvM4UzE1oyiqlpvGB6ARFX7TsH5JWAeanXr0sqXgnR7FZN4qGLmHL/NuQsF36at1XbR6dGOBasq6/HDo8C60d0aXqyZraTH+vzSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-72257ba51e3so548145137.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 00:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680627; x=1782285427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u7Gki8p4EM6XMlf4misGHyXuNmTvOX4Ry5GM+DWUec=;
        b=nbHfdqbA1Tg7UvVgIOpzuSp526XYTU3xyDbtdRwLLJ0LSyO4Ml52KIg0HDYXpQ3mC9
         OyslMRzti96YP+abK8DNWCn6zPGqciDMm/CQ7Lh9NkaLhXoZlNE2UTXaZBMxN8+VbuiE
         +4O4bLp6FlVZRIHK+rNICVkKKr11Gh3VRgn6gqIhpBiOUabF6CkC4O0/LU0oSbraabLV
         7AbDuzN4eJxpNkRmArS7IcV3wZjMTpvBpugglWsQw4OgKTo/yhjOeLp7fdZUb12Oa7j8
         npAnH5M41eRyuJkIK/hsyWC6/rRXJjlWOlNhRCcqg+hUDBW1oHoUhkmRTP/pC1yLE3P2
         m/uw==
X-Forwarded-Encrypted: i=1; AFNElJ+7Vp5YBxCIy/DD1uT5lpr9426c1m4bELIgk3LQd9FIzNtXUumJH4IRMQL9yK6WldWH3cfABB8B/tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XVyWtRpCZTU6Lz2gjDA7bJKB6eLDx9GAZMzaiMokDfzCpimC
	ipCtA60YguhW2XvhJJKJENgrpl4uIv0N5TMaxoW+7nlaUoZnSuuRQ+87e/pFy1U6
X-Gm-Gg: AfdE7ckMBs26zZ0BQzQ3qbKM+DJjsLw9ieUCnuwxvefLLzeUlHDVD0QNfDGCX2czN0/
	wDYnDraKzxZu952qwWqMinE131X9h0yti5/eKIi1LTBduuC9eqwjDtLr4Gow0hG3GTROoGS8j9P
	xE1TYRcVW30gydhmQnCs5DV62XxClT9BpHRifQ2g0Ts15U9FNWHZV0h5A/7X9bdcgAsz4cR/H89
	Vq6Jbh1eN3CxmI482YYexT1AfsRxGJuuf79zzCqaNqFlL6AbD5sr4GR3BEs9NggB2DAI5XK/VJZ
	qc73WWqCYmxM8NbcUr/eP/969gjj4sVfs83tXXnEOzPGGze2jevnfL9K/zUVCqLZDG58vK8ITqK
	YtLV2M6YjRnsxGufrFyyi95Pa3MFm60mXlGDHDjhm7gXCfL19FEMdWWnm6ZgWsbaJwkLXrYdCQ7
	2BcTqB7VHPwXh1SprdLbNas57YRSp9RehsS2XzCiKKPH82lrFcpUxCGg==
X-Received: by 2002:a05:6102:2b8b:b0:632:5db8:f672 with SMTP id ada2fe7eead31-724ef9d647cmr775964137.6.1781680626792;
        Wed, 17 Jun 2026 00:17:06 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878872efsm6689169137.12.2026.06.17.00.17.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59be89d310aso488163e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jmIC7KgzJaFkEEJljZyb/IPZbdQExDseSrF682Cglsy0aFHh+/D9qAmXaeyGm7OGa6VhduIjvZL0=@vger.kernel.org
X-Received: by 2002:a05:6122:6315:b0:59e:2a50:39ab with SMTP id
 71dfb90a1353d-5bbc106a67fmr555519e0c.2.1781680625185; Wed, 17 Jun 2026
 00:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:16:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
X-Gm-Features: AVVi8CcYLQHmYJC_gazcaRIfqz7y7D9l_HFtGh-yRcroThw0DCba9TthKbXFofA
Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
