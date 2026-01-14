Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542983191B1
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403558; cv=none; b=SxM/VLXMjlFuwzrfrgG1G53BvRubTn7fy8JhrrEn5I0EZC9bSjFY1RC0pdAF726MWuJ7O1JqJCzCxm/LnYLSR2DtSQ404c4WuKl1SLXnABu8trkzJUn04IiTz0wierOoDhN9Wy6HU8hykiEWEjrfkuvADykWjGDGvpEXzb//ZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403558; c=relaxed/simple;
	bh=rTRyXahERnqy/2b+PnsI4jr170HiD4jbIMfzSBqGSyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3UJ6vd0o5OkpIUkWfkvLZyKOICZd5WLK9MxK+WQoO0vZ9pIV9riKX661Nq5ssqi2LHvmTYer0Fewajb2866qwACNfkBA1Qk4pGh275fXXQRi6z0iW07Gp5Kc5BxxougwYjAhE5UgTkrIyDmeNbqFYiOO4Kmm9QNc7Xbj6IXnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-559f4801609so3352902e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403556; x=1769008356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTf4Ia98cnNEFdpDb8exU9CBi6eG0s42SPNHJEcig2U=;
        b=WhRY3NYVe4Ars+2CFEYUIElJo0mCQNGGBoM7KBifxegLreIsNeegoEwzfzsQ1RQOlC
         lyuwZuZLjpKUJ8qiKbhMgDXDgGo9pXTa7qhMqatD/6ipuMuo7i0RBiJlgGWjr1jF5z6H
         /9RwWp946Uo/yGWd30dKMFE6q+avn/fjeZu9dqpEgt/1x/dMCENTJSBjuRp2P9UIDnLE
         r3riYyQuKQFo0NAhtyJR/ohz8yQ+AwL4oXicwm2hE4LAm/uC8lDLxGOGKR7QlJudKh2x
         LxzQx20DaY3x9oYWN64hM+o4k8jX+vU+MFtM1MoUUrhHWrrR/QYgMtXhyIGFrHuhlQR0
         gfxA==
X-Forwarded-Encrypted: i=1; AJvYcCUvGmpgeddPg456vaKhD7lT2/iYBQQF0oMvpWnqnYQEpgYBHY9W7FJ6tkDDGwl5+z+ohBLbVGnOTiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKUDJ7h0qyduDHyuGZiJhCaOg5kjBYasJzPtGUlDfepj2Nxaiv
	1slWJSETDNX3SJGfJwN8l1XGvliYDgsZAQpJMYeXewrZGTD0ZixgDu2HTvUEwcBJ
X-Gm-Gg: AY/fxX4QUyCMgYdpuEslPPQjVFO89VnS+xDiyqtfgu1GCc7YfJbixqotcPUrVvEHWOP
	Kbkjd1TGoOQ+XVZjDQMLUXO89OsX2ziIe2TpeRhR4YpLd3EeLroBzZSk7ZKG2b4lhUg4OQDnzxV
	FS3yWHoIcdWZCjzppNFtTP+GpM9V+WaxBzijVsz2I8Hdqxgo+pZR1cKS6XhBlS5ILc1wfzO90IG
	uixIsCP6vRoEcV4L+TKfzpJfLNixV7KhwkdbLMvH6/xS0VCaDjc6ShKy9VcQ3RQEQynjiWPhS/1
	akjnypQ7qdNrB7x6NZqYHidkCEFZr22kxHKPkDnoQT5OAsYM4B35Fflo411p7Y9DMFy0ExaM8aR
	0WLYFvvBGu4dUh510vu4275tUnmaNeFaNMOcKFYZmB0IjXrUVW1+7fNtEWKM7WfiBOWsgNpZ4Lw
	DX9GIH3nOmUDYjYCNCq213t1z0zXY6nGr1YKzY/4Q/7C1ozoMJ
X-Received: by 2002:a05:6122:1d53:b0:563:6767:218f with SMTP id 71dfb90a1353d-563a093de68mr1147513e0c.8.1768403556245;
        Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea48bsm23337887e0c.3.2026.01.14.07.12.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso5226301137.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6JIuuwQTSlSqs9T/IVMMsicETz/BXYY5i7ESoGqctp+pADtuxAMhiB8RJGQE/oJtAH74TWO/jPU0=@vger.kernel.org
X-Received: by 2002:a05:6102:644d:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-5f17f58e48cmr1339389137.27.1768403555913; Wed, 14 Jan 2026
 07:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:12:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
X-Gm-Features: AZwV_QgBsmdOL1CsIZxC91XqWUZahJaPBp6OhsrHXMfNCw9hk5svX0lNu6KcuTU
Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] arm64: dts: renesas: r9a09g047: Add fcpvd0 node
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
> Add fcpvd0 node to RZ/G3E SoC DTSI.
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
