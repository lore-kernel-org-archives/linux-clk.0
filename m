Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278739527F
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404143; cv=none; b=ANjALcC47nWO5afdHk4M0f+G4Ci7sHoV0LvID9SYRP+wqov/azWWEJ3U5UkjiL1b+MU0YHqcGVAn2woVOgg/AIpEODmwAZLj/02lPFDUpBfAkJKL/t883UupTHL+ZLhk5ib6irbAXDIRoerAlenm0UN4M0lo2BhBTTkRF1IyizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404143; c=relaxed/simple;
	bh=G8RYK+aX88sOsP16hmOe0deVsIEt5mGBHm2uBkX4C7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeCkt2l6Ysks6XiVYIDEUkUBi9qHZdpYGl/nUPXXsqBM7QFL6+TZH3A36/eQWncDgfsXPGP+sgPlE7JaycodcffVrWzfdpbJv/PNx20/eoJ74TkkfFJ4GOwING+thaQnd2Bv7DScYYrX7wQSsMwoe7A5k37SuOMH4xv5AT07WXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5637b96211aso3456173e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404133; x=1769008933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mAk6Po7rUczPO72n7frU+FuUdnko5VLEu/mgiUZN78=;
        b=l9nPe23b9mHAMiNTXmbKfuMRhQXFh/3iZwwfKuTFro9U3mWrZwpd/m76Ko6r1HMDXx
         TJLyLFekjhOHhRbpsV5jSUWl76puXoZHJnvKNAJL03AZT42JV94y9hvWy454ydWj1hPb
         icgXZ8Wye35IY/9DvMYidqU1aUVeJglvBttAhlK8LpDbjwfTASqH8dbK9Q3AHax5KUUg
         KAXUlvajo3bp785skRWQP0/XFa2M9VkcC1WxO9y+tMYNvxg5WEJZa+BQ+aVCv9nTCTlq
         /BxGIi+Oa0IRktA5Z2g1mdmJ45Azgn/ObF2IL3g73Urly96h1pVNVSBpOpf+EStNISZK
         ClBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/pB2FUo8CpHKEm7uPO/dUG3odwDoLlpJxiMAh25On4ZT1kFvdK++vInBMhPQE0MqRzgCSczTOg/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdYH/4NJOeJK/cIPagL7iqf/qHZqyfC3SiPgHzQu7Tg4XYwLm
	83zc9yMoLq6hisnXyVIN6RaNcQjPgFBkCx4voKhIwabKPsxryQb0R5cWKBmksAME
X-Gm-Gg: AY/fxX7RqHRn3nuWKOGdyZjCBdoFuPtI8wk26GGHNeZ3LxG44dI146lxHQN/OkDsMKo
	6UU2sTkRWABOdOXgEbuyFb38rm4mavgXMJ2MpPTO9lNCxxNfbhkaRDHpnif3bOhU/fl1430fdEl
	+oaJxceVS0GfFMPa0wr2mXGaJSrd3haTNTNDJIe8mBNDQui4vZJleLCLAiQtSkbCoIn9cptxL+k
	WstZ0R+oe0nbtNqVY1IUBIZ49s6LZSL/JU3ZDo7nVB9xE5+MLWAya0c1fA9iw6BKhYBW6vE8VJv
	Dxg/7kC6MYhIvx1BDI72ejnf/7Z5GG26GoyhYnsvXHx/St/5A2M/lIxk1ms3tvbHKxT3X1wgihN
	7j2PJRGrt7gqPjpRvOOrnigD8zwbDGdJ+1nfS36y8mpPj27vbKZJSO830TlCynhBlC+MPMrVO4i
	ZTG0wCQ+Ou76m1hYCgMPWn41/IeRKgN5kybFR5GrLuJC7tcYizV1/H
X-Received: by 2002:a05:6122:2a51:b0:563:5070:ab40 with SMTP id 71dfb90a1353d-563a0a0322fmr1067357e0c.14.1768404132382;
        Wed, 14 Jan 2026 07:22:12 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563995311fbsm4926084e0c.11.2026.01.14.07.22.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:22:12 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5636f0cf5c3so3531552e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:22:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXY/5HIJQjSHXM9CkyDdEoTcmn7QexzZ+w9Il/QjX0OLiPlO1TBZWBsxHNJHC1wZBq733vpkkierHQ=@vger.kernel.org
X-Received: by 2002:a05:6102:3e05:b0:5ed:99d:6f6 with SMTP id
 ada2fe7eead31-5f17f4a6362mr1410838137.19.1768403730497; Wed, 14 Jan 2026
 07:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:15:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
X-Gm-Features: AZwV_QiK_um5XwX0Uu_MDOD3I9TuaB-CMYyAU5lez0Cp5nlWbm7lpzSkXutUdXY
Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] arm64: dts: renesas: r9a09g047: Add vspd0 node
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

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add vspd0 node to RZ/G3E SoC DTSI.
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
