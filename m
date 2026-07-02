Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220835CB9C
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984490; cv=none; b=mwm2rWcFTyjMAQO+8f9HtxiuFHuH4EVeJOl1/mZkmsOZFlOZR7mt+xCCcCjg0xVImHLTsSvNpMDzIlwoLlLBTS8x8SD2gUcxrP5plfe8PwuFo9v8/aHB7yq1GvpyvznGx2lZ/IRpi/LbWCW1INidSFWOBAKvs91ZcAfIR7Pqu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984490; c=relaxed/simple;
	bh=oaHVnd87z43W7j09tTxLlnmC4YG6JXhvjpcX3CpNAuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7qhn3CZ9fnjLyhYABN7VIKyf7yVYPA4IWvafuY1RDeuhOri1GFlMki4GGdeMvf6zCOQRseO7ONPjfehc4tcDpkK7edPTBYgkciMwh5bRkAFlUIlvVZX3MW8+RV5zf4Glyk1TG1UeabiyK+X1FOPt0TAUsX+WvmXZptNboY3hlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bbc6c99b5cso396399e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 02:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984487; x=1783589287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xiqnp7i51oc7KGFElhrnKuIK1In1osntTe68gEGmGg=;
        b=kYbZDudb2wccAr4VixfjUiFxWciSbDc9EnOe4np9Nh9yIg5q0lAJCiPxvZ6caUfgaa
         0UwPfDpiuvJeFykZBNQvyWDNAGtdQ5AUDuBdAWQL54ORxCC6qsw8k4JagOkg9RXwW44u
         NUKVmdLUWt3Jlcnwr+ma3lKlNSqgwx7UmfhZgDINXvMNkTWAxd5IFCEhzDIQMV8gKeit
         Fz9gbhWGTosirErLoenlNlnHwFftKbgbohnSWSCqlAaO7g1ZZNj1KJO4o/23ruzOySCF
         O36OdVPb7z9ZqHelVUSwmnWxyxRmYFEKz6Voyqc5qYCDjjRujI40dpk5YTPQ3i93mxfQ
         w6Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqJbTdO+7D1iIehtftLM1745UUyXei5WqdtjF+2vb5wiXsJArZtUxstrF77tUoBxPxp1bAFLv0idns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjosJ/dCNkWTbfc05bEkMFdwThsSjW1+OMxGt8JIN70prh4Hy
	aOG/Unm0/hlAY6FIQHMaPwZIKtX7SOVus8XxzWwnbapO5G4T5vy7cz3ba4TFY+nW4Ws=
X-Gm-Gg: AfdE7ckKVy1KoDGeX6gHNYLiIQBjZAVs+ByXJ7KiPxF8cfAG+wM2rpQyYdypYPsFNb/
	8rb94XXvANzvqVx580NSaBUTeog1VC8r9Iot2zuIt9CxFYSc7xNhYtEcAM0oojGSoQF5gddUz/v
	yunam4q2IfjKoAd9Hcz6/c/JpT1Vs6UVQ9sG3WqhPpJbwa1pEfUyueWcxyK6YteroWo91iWQ3wa
	Kt1MorccS3bsCL//J/c4jfv1jT3pTWyHDUuoPemPIhbs0CBLgqxbiUeYgSXMUNmvtY5MKbkjSbB
	PyT85QyiVp2Srm97dWDGilNxe0dJaKw5ICzjMSUAjqpIma+/E7pphYIIv0d/7tJKf9o7XYQ959i
	sE0CCdnzK+kwX84BoFjxK1eqlRJgQpFJKVLIXtt5vQDTvWxfZ1DN336xknEFwjYiTYVYavM+V6E
	TpvyGVE1PrdM+AevMV7iXqacUh40zf+ajfBYp8EQVuaXx3ZozwLYtdTAqC/2+k
X-Received: by 2002:a05:6122:4889:b0:5bd:9ea9:3de5 with SMTP id 71dfb90a1353d-5bddf5f96femr941379e0c.8.1782984487610;
        Thu, 02 Jul 2026 02:28:07 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdeba4ac2dsm697480e0c.0.2026.07.02.02.28.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:28:07 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso532247241.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 02:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEsQlx/MJEPDHoIDn0wRM6WZ6ExRukkk5luglHPkSrp8VHbrWMPLtnOtR/FhZfKpgfpdauDs1ne2k=@vger.kernel.org
X-Received: by 2002:a05:6102:dd4:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-73da8519caamr2375794137.2.1782984487236; Thu, 02 Jul 2026
 02:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:27:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
X-Gm-Features: AVVi8Ccj1J5pvkR0bSkeR64npr1GsYH8otXyCLdk_qEnm1EVAcQxHJFY-QII4Ko
Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
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
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s. Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
> +       .attach = rcar_dsc_attach,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,

As of commit 57acfbe5bbc16624 ("drm/atomic-state-helper: Remove
drm_atomic_helper_bridge_reset()") in drm-misc/for-linux-next, this
no longer builds:

-       .atomic_reset = drm_atomic_helper_bridge_reset,
+       .atomic_create_state = drm_atomic_helper_bridge_create_state,

> +       .atomic_enable = rcar_dsc_atomic_enable,
> +       .atomic_disable = rcar_dsc_atomic_disable,
> +       .mode_valid = rcar_dsc_bridge_mode_valid,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
