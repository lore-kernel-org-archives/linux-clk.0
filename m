Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3D366546
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983271; cv=none; b=g5EkSJwmvJMOqdNljcM5+w5EGpLvRTDAsxU7NURZ9mFbq2asOorz5uTsdl5x8QuMZPfTwmR5PUjTh5Hd+4GQftqznib2uPduRUJd2FROEB15Z5GPIEKJ9fREP/v9D3IsT2FQPmRcuH/h9k7Unh6fdBraa1JSTyJm517Q7gluu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983271; c=relaxed/simple;
	bh=8TzEm6ww2KBwSJjrrvhY+MuA+YjIBn+Y2L9mT5oqgDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMz64yehUXqGOSaeqK0MjHjIdbE8x5EpKSDEuOwttuTN2OF29hNjbkvGngfKQayblHgWfLeEDMdTNBZxmD1ooyrFX5KnjPnOarHqEzt+gXHAiC4P+9BkpPcAtyoMu9S0MuvOOYtSyktOsqDBCSDOY8jm/5yt6NOzsiwLtTpHOwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55999cc2a87so1316837e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983269; x=1768588069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fLS5br715ALrW9iu7K4XmrLPlp0NmncdqOKXgMKuek=;
        b=lbefQYqL7KU6rx4gU/nCJalgVYc+hJ3mMpL/i9i63/m3oM2kVBl0/I9WPJY3/UCwfF
         zPUOvYCPBI522tbv+9TGy/pbxw+A/YDsgdVm+Y6Qs87CRjaSrzx8xgoCws/V2QTxktM2
         6RO9z5nYnldF2HCk47PPxzf/ImvMN67ddaQ1w5X/N1vIgR+N8fmP1UJEUc33fLbepw5l
         M3C12tMU3Po5Ayx9Kk21l9Fh7PGw6PQWKq1H8ukIWHwhwzK7Q/e97yKiAoRvzkmOrth3
         h9YCBM9Goywo5NqZfLlDMdgKSh/SlsqAF3Rg5uyUoGmkd7hICrQbhV/XJC8INL3RA4eJ
         iM4A==
X-Forwarded-Encrypted: i=1; AJvYcCXP7el/S4sDQpHfIXOeZAZGcGdEQ4OkB3K+E6CZmzwQPJWWzLtjvrIprFMcEUcx8N2PHnxT/PwGtBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9m8WuvrqviLms+1dlaHKgI0M+ZObYLTMMZFqVwZMj0oqbnbdj
	OTEKQdNQbHHRRrAU3WYNL8FzwbHXFDyOA83JFi3gMNvz1opYPvdrGAseHXeJxweN
X-Gm-Gg: AY/fxX59GhLFb5AmWg89n3o9kx7pfbuOGtZ0CzEUT5DWBQbVZXOY/N1jGSeZyf+xBsK
	0Vd+bi8f9WSDoSUUe+EPvYhlCPBVpz7B/fJSlDll1JWp6KSjbZNSttG+Q964fBcojW3LTx/Sj7g
	BW3p6h2r9PnI8+WsAot3E95y5gMtkYs623Zkp4kW4puvF/pzXlHxkGQ965m7+4eBO/prnCmnlRe
	HvYMzD3AJsP3SLNtLelFYZIBBw5r6R9ODcz2OiDp1IsX08xhJR1nGrWL62wEPlF4fKTLupnUlqG
	W5fvh+aXx8YdCwshUnAABppI3ts7FPDwBoSewLnBgkIG4lnd5zSfm/rG+VyEbHs2E161eKw0VVO
	/KVr8lzCdmYv8VqWt8Ggoo6iruHdQSZG/IZfzd63ePi4PkupYvibcIwa+/I9mnj4nZ4h53cJ1dL
	TvDZJh8FocblZC6LQQdTqnHQryZdt3CaDa77XfyrmV6GBFE5LT
X-Google-Smtp-Source: AGHT+IHQwI8PVt9+KRatc/aow8016Cg1eFfebSdDeWd5v7XdtLUu4+fsiUI3NDb6dRkNUXcQbVAPMg==
X-Received: by 2002:a05:6122:4b8c:b0:563:6566:b2d9 with SMTP id 71dfb90a1353d-5636566ce43mr1356173e0c.18.1767983268703;
        Fri, 09 Jan 2026 10:27:48 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea810sm9731237e0c.5.2026.01.09.10.27.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:27:48 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1448672241.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXky3jyWYSm09R+GvD+8giGStP4+xY1qqtUmLHUUteNvzPB25L+spQRLv3DiuFyG/3SLiXNsNXIAOQ=@vger.kernel.org
X-Received: by 2002:a05:6102:604f:b0:5ed:f26:55f4 with SMTP id
 ada2fe7eead31-5ed0f26580cmr3794404137.34.1767983267169; Fri, 09 Jan 2026
 10:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
X-Gm-Features: AZwV_QheUwWEgzt_8L2XxxL-r3KN1XzfOq-OJJW2J8DrDX2eZqhIZwBOou0w49E
Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
Subject: Re: [PATCH 02/22] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add CLK_PLLETH_LPCLK clock support.
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
