Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3171FC0FC
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983782; cv=none; b=I7sVMgLwWFNn5Xlc6V0ZANDqWHZMIPtmwCmek/lXRMHfanh2BHU+U9fU0Ziw0yoo9mBTQ6u3y+7u2SRtQjf2BlgXMZWvZtjo8JMAp/7APu3u4TH+jfdHHSxi9TiMvbcqQVsrvbqn5FcbthGm9yUfpQ/EO0oYg++QyMyuyzuopxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983782; c=relaxed/simple;
	bh=Siz+EqtF2DEyDXXm9dI9ms1Z1FX41pT/fgVeq5GfFg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV1VTpvSPGBfb4cIPAUzVnDnZlRCA2mp9h6gbCPUmQSzcqqrkt7VXc19Tq1YMoD0UdzcAgAYp10Z/Fg/vc6wPjTQY0QnvavmMtwGt+9sYkbKHO6b2o/dDWU4NFFGivlDZvI2M4b3Kme4bJgLSYMvYddBZOKC2AVWgv1Pb7jO+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso617170e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983780; x=1768588580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa2jKIqs2yYTNXV3hdw53GbF0voF5R+l35nND2b7JKA=;
        b=THZgACw3s7/SdX7FLGX6tQbkWwzzKq2TKJYg5GXvZGhjfDrznleq+7Kcp9lFaVQ1vN
         hopVCnp0fFLNCMvOx4taV7a0Xtb9Xd+DZMd/JxJO9xuGbNnDpi6SztE3lOI1mRTScHaW
         ipSKzA8x0LAQLFu9biJq0faGhqpfzyjaPknqsxKvrHm1a86jCEhCdg0o15LMxCeMMa5/
         qt7RNwGtOvKeNAa2XsIOVyFGmxxgmSqmReQWFrFO95FjuqaA14eTz6MtkXLqZgRAu7as
         1QqDFZgehkn/rwypYK5yCGRMVGN7dr971ARX1AOWPX3kwURc78cARQg1wyqQauLA3kRh
         ixIg==
X-Forwarded-Encrypted: i=1; AJvYcCWqQKtElw6/MI6Z8Add3fJ+vSQVonBjaWEksg/qSrnGWsAlbZMD2pRF8AAQBr8iuaWmxDnhzl8kO9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCpvgHKyXVqTcg4ZJ961wSeZM3leC1D+BSN7I4js11LqRfnXu
	2bmb7UogvYSWqosR4FU9rfyfLjVq6WwncTOzOWIufHLkdJRZ7wldYN97daoRaW2x
X-Gm-Gg: AY/fxX7Xu7xLuWpUjQJGMZq3ExVyDzoUCIA0uqDTJPp8SYc8dnHWJ1NJ4bTlen4817V
	xoMPuXrydfvuxuvxVcdwbZERBFYoxWdZuaClV+xBmXagFsYMLtzkjANxxypUgCw8h3jt/BNDPke
	VvqyOyRe0xaNGWCO3F7Yy22v1xAx9alc2701SSfV4wup4ba9xpba5ro7H3droNPOPVXvIJYvpqK
	xpuJvgbnh3YK3s1g3g3W/d/CDTlXvf5va/fODxJ/iQfl6kYu2VmGPHCQGbJNWdA9TB7qzgOr0f+
	DG10gwOKurqb+R2SKqYlmc36kZSubLQM7/wDFgwX31kUJ21l8mk9Z0xNvjiOL0+TTwQztXYTyLc
	ivVszWtvvmYDM95l+0gkWnHrm/ITczzpyHjPTOIGgzXz7dNccTjU/HZGM150P6nNHvZxW/HV80/
	j8xdWvT0sITt6tchiH+hyIp6oSrcgD8utsjxF7JFTeOvO0eBkf
X-Google-Smtp-Source: AGHT+IEgzGtQlEdknv7p4dB197cUfp0GP61D1RsuvjQI8a8xt7zXBZ30aHYKjFPV/pv5Y4pfQUoQ+g==
X-Received: by 2002:a05:6122:31a5:b0:559:70bc:ca54 with SMTP id 71dfb90a1353d-56347fd1becmr2994250e0c.14.1767983779764;
        Fri, 09 Jan 2026 10:36:19 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a43fe52sm10202598e0c.20.2026.01.09.10.36.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:36:19 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ee99dec212so747379137.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSFFXREW2Z2EzEwWBNEmuLrik7t5bXtBC4ssDuOj8qi3Dhj7hl79CoqByQuvJoTZYLaEKw22v5pB0=@vger.kernel.org
X-Received: by 2002:a05:6102:dc9:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-5ecb692ea6emr3804438137.25.1767983778284; Fri, 09 Jan 2026
 10:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:36:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
X-Gm-Features: AZwV_QjUM7Wb6ei547ywW3OJAaC3IFOVWsMcEtNjkONgJiVb3Bt1YrhDacYAZYY
Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
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
> Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable LVDS0 and LVDS1 output support.
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
