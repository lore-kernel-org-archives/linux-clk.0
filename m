Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0637CD36
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832435; cv=none; b=JbunoxBR+sfCzAz8kyteeIpr13IyRSTiCX4H7OZASsXcMlnN7qhO2NsTH2HlH0LFsIaWQnD4KE7M7pvJuTgRNO3snL5Qra2OtQTKQBxS5Wnnyk8LtGPEeF2TGq5u2O75nkzZ1C6w9NgfJeZncBC/WYLV63r3wSZogaDfPgYuNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832435; c=relaxed/simple;
	bh=li6NXU7sST/n8eXTPpy/Kpdi+fuxsdYH6rwtrEYDBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsYU8DXNzm5m+vKfwXdnISyynXgPLoKIwMtZPE7TbwxTQ2wkw94TM5rURy7JKCki7MgPnz5kFvevN/vRZ5Xy4WyDG6ZLwqP8SsIqH/sXTOXuhX0aqXxhuuDpRj8z1pumJicvV72hUD5vndhmbuMYOcZ8cssElVko7yXsmRuUwEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9118b952e2bso151763285a.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832433; x=1779437233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk3+gk0uvDvPr4J0ZYYOynNFHdcw9MrgwNKr9DcQAuQ=;
        b=S0qUV/T2ATxQ/DhdyAhdievOjKP8oR7B8wFCWbJwJhvtzoCk9kSOwanVgC9RcQduw+
         RrBnsVbdrOk38a/rgif9fC+vw1XMUnU/o7RM+fsqzaLN/D3gAFsRKUOgq8coZajen7N1
         jR+9buWgjdrV3Im6Jih3VljPUC+5ge5BUfrBsP0vfLedmyMn0ff4Cu/+psGq3j51uhWP
         KpP2g1F/W5LAO10fc6cOJgtTiMsO5IF4UfgJvuU6N7SdDJK+Ydf1Iho6we1RtBfz8Dt2
         nkUrGHxIS3SUVNiujMQmtrHxC9zQ2czx9jD5Mp+6PcpHDhCMjx6vf9Zi3TH+3hhwD03K
         lxNw==
X-Forwarded-Encrypted: i=1; AFNElJ90jKoDv28svHXVt88WkiNOE3N4AB3fJc+vFXgLofRkwKaMbhRrcFwogwejCjIHTp7FGbljkdmRo4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JgvwmhMci8NGGHu+WyR5MuoWo2pNpucGQ2xsK2ztQYMhcSqy
	yWZoMRQkRFRaycKXzNDyhRT293LDzF150P7sgWi7tV0yLrBTkxb2odOcN5ph0J8+
X-Gm-Gg: Acq92OH7NpTDAxsdkI0o2LKxrAMvhUhbUtI8O7TCf4TWZzQwSNXsF5wnkejUwqthv/3
	N0qCK3piSi/9muljRi7xuXJcXAWrHBAuN1ssTAqUr/WQQRnZzoHVmKWRRA5Ti0/EJa39QTkXkrE
	/uqIZOgA+ITx7SbPnyTnZuFPuNleJd8EOrmokNCtSe+D/Sh6xKAIE2RLHe8rK5d+Ac7sOT5sDK5
	qM9TUS3ASPEUXxGcrAwtTHQ3Xa6bz/2qty7QNpyXzQGYZjIiLNERz1hgZ+4+rIAb4vT28hmgs9u
	5DFhrDFBy5WmIqiCx5b7w+9t26UHLS7dj9tJtHF/OSpcDLxGkn2531ZK5cf2wFR4xV4npK+dGzs
	sxU/UWjvaWdivOw7O4QQ0cqvg9NZcHoGmVqu61qVq/Sc1vd9Ppqicpuco6Sp4RINiMOeQ12vQDc
	adktDRdCfhXoB9LAJk/kLjeytWwcW2GZeFTwtZio9Wp60xsIPK4NRXb0g3nIb2sUWIH8agxPbex
	s5CZfG3oJpPJQ==
X-Received: by 2002:ac8:5d0a:0:b0:514:b17e:8701 with SMTP id d75a77b69052e-51659fbc7c3mr40350871cf.10.1778832433053;
        Fri, 15 May 2026 01:07:13 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645856d4esm38073351cf.27.2026.05.15.01.07.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:07:12 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-90fbf21d9d3so411767885a.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZMPHudPxWoXOdGRLz+G2rr7yhupEeKuB6kyf9fjf62Z4n7jAFhZGGcXeZ6aCCwxGoCmuZEUsV+2c=@vger.kernel.org
X-Received: by 2002:a05:6122:ec7:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5760c0528f5mr1639450e0c.10.1778832080852; Fri, 15 May 2026
 01:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:01:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
X-Gm-Features: AVHnY4Juo1yrSdWSEhGd8PIKGe45raKjJnOdNJywoBplErTdAE8Qpe6uxcK4nzs
Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/rcar-du: Add support for DSI pipelines with DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 15 May 2026 at 09:56, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Some DSI pipelines have DSC (Display Stream Compression) IP block
> between the DU and the DSI. Even if DSC is not needed, the IP must be
> enabled for the DSI output to work.
>
> This series adds a basic DSC driver, so that the DSC IP gets enabled in
> bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> the DP output comes from DSI and sn65dsi86 bridge.
>
> Original series from Marek.

Thanks for your series!

Now we can revisit "[PATCH/RFC 1/1] arm64: dts: renesas: white-hawk:
Add mini-DP output support", too?
https://lore.kernel.org/05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
