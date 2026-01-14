Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455DC3168F2
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403495; cv=none; b=X+kpTZyUNyWWUFPNHKtvtLHsckcM0dx662cFEPJMzpK3O19tFlesotnX5VgLEQQkoxcpYKn76g1h80cgpySO2zxaWf4STP9rBidWJJLKG7Jo6eTjNJpORWkJA0zPapbO6Uyg4HKk+V/A+ZjF1E3Rx+hJgO1rdOp01FHt9dxhtAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403495; c=relaxed/simple;
	bh=+M+9z0p7l/E4nDyP+sFiFcu+HP8xpPbGwtgulKvWo/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o507q4BQ3r9Dc7HvHmKVJ8+QRE78nil16ZfPUcADFIvp3YypGs3iMJ1+ejHATwV3CjaA7cHy3q7kEzQwkpH8/bTmv3tP2d4v+zgLY+fDFTn5Y5r9RougSsExb0CYrcA6EBaUN1yANnmg7PyE293H1pXvAfYWEO7VyzGWwtxOxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5634d866615so4867823e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403493; x=1769008293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2PPCiljP8mKTN3qlK3gNrjsm5ZPU3Yx8SKu0rtGmFo=;
        b=c2keOudQvHdrGPv0SkP0xX/+tn3iKYQCMxNqo79souMyMvIeXXOYhKWTy3uKZbJgln
         Ijzgn2e9Jv1Qt6nGk7SkjKDhT94VZLgwAarqFZrkvUxKSaCAZ9R+Q1fbe8f156WfEC/r
         I6VQ3yZXCNzLOf6GU089BZSx1temGfvZMCeXdy3mVq3DbgLGsADQ5S8PnT3CtZQZ/M72
         52ykfLN6zblO23/nSwJsW4LyNu6928IpHau5bGlvPDJyzIZjY4kbBmmeOBABenscQb5P
         9oeCyJuMX4B3YtwTBMCL+FGTu6O7HvTjso4ptdo1fDmoQbQXAeoACPKSHr7wid6IwdKW
         pkeg==
X-Forwarded-Encrypted: i=1; AJvYcCWyo/e6B44pKO3E18BwfTuiD8b0DOoiFgHButIbXL6PP071D9Csc3k9CgyPxSoJYpXC3HKQpFUu7Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqJnmSX6wvRPDqK7OM2SNGgie8JnkZ1dmILMo4rlxaUF9m+IU
	BRbnHdYPyyUIUKy1YqdYLuJlqmfmCsp4W0RcQzh6yoyT2JFp2ygfu+v+Od0upBHbndk=
X-Gm-Gg: AY/fxX6FKuRKg9o+y5UWUYV8BrHhBED6gCo53LiG/XJlbzGVfJkszuRvI4bL2iuJIqA
	GYKOa8Q13sxgPv+n1p96C/Lv46YkqDZZQQQX9pvDaHchXmyrnNx8rz4GkBCKWGgstEk7zjGiqS3
	rxMTNoUVSjY9uPuZlliDVSJOpcpOn1ZdN8wTJvNexF1mc5Rim+CsqRO96ga0/upVW8LrnBGWQsr
	1I39x/BYAFs39ounqWNG++fDmXZFooo3JwJS64j5ZofFuQ+v1hmz02xUFg3LFjzmH3UbN0nUoUH
	eyuim/F11aYjtLdQkVqLZmd+TF93LQgsxl9ZzRCvVOtf0qPSxMqsWSFeuz9vIsrPd3cWY4DwjSy
	AgVWpmOA+zK3hh12hGrvwXn0THtWWITboHDg4KnCOeBiuqYMVSJdPMWpt7XA3PEuMOhl0Q+LExh
	j3zjufAY8MXEAQ3G0+fdiw4El6XnwOcznbTtvhE7nSBsXJzXsKueqTXxrJHDi14ME=
X-Received: by 2002:a05:6122:8c10:b0:563:4a88:6ece with SMTP id 71dfb90a1353d-563a093930fmr1198323e0c.5.1768403492099;
        Wed, 14 Jan 2026 07:11:32 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947bbcfce1bsm1251262241.6.2026.01.14.07.11.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:11:31 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56365984503so4115901e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:11:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV423NE6mVK/ANpFEQoL1umHYI2BgYUWtZV4Bu3/wmmymtWtnrePPikjjQl0fgoKy9u30Amj83+axU=@vger.kernel.org
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr1323779e0c.0.1768403490712; Wed, 14 Jan 2026
 07:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:11:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
X-Gm-Features: AZwV_QhWXdjW_YU4fjdNyqOSb6ulXkw-i8mzGwj6hWPbLAjpoXOZB9H0uqSzcLg
Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
Subject: Re: [PATCH 16/22] media: dt-bindings: media: renesas,fcp: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The FCPVD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
