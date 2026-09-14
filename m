Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA53E9C05
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373546; cv=none; b=sJxbQYrvGqnHkUobE6HC7+VTcIy9tBxaKXR89ZjMIE/1nvAlAVKCkuegZJxlLOWXIyYYx58dgLkrEyppMHrbhMaiEiYwmlCs4bFJo/qN46R8LXGmm+derUkxG8fZrLlODkFbfSQG88n6G3aKxs++HYxCyfSYQ5l0+lDUHW8C+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373546; c=relaxed/simple;
	bh=qOxCYMeZioIGCmh0MxrsIyGPyaOCPaAbU6O6uizTRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdoNmcRIgfJcMZOYGAAuuzjX7PkT8bb60lO/GUkxkZc2fH1ONEA1YJXGzpxvoKLc8PSy+/9NQ78U1Rt0FwekjzjzIrj/m+1adITNmX2dwFaPqYt48u3RmMfW3WoWQCA0OnYcdau4lS4wntXl+Ib9TCs9y2+ver7Opr2fABs/rm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4f53975e6so3270226a34.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 01:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373544; x=1789978344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2JcK4+UnTdYFj4YxjDgOg657J6kp6BHITWmwnB32W8=;
        b=GnGMhMMoioKi6Hj4/jJHIZa9lKs13N4Hrfdp/PlXywz9tbGiVgoomTRaI6AEyqzcxL
         PoAK7U1Z8eiyvUQP4hCiJdLEPJZ5SozsXTjUvFQpWx6Q+lCafF8WiMHBW6tk/zTLTCSh
         7vcOXqucv7ntwc3PoNHjOcMOzKi6CJj3eFtjYXccCLyNHggDchEwtm/4wz8Vf6DCGWtt
         sDJpSf+7WRYoJ7VxloiuRCo3wdDQa1sekISlWgMlI8h9L0JwzparxPhD3j65K6OWrqDf
         7JoWrJCBvDlrrFnCv07BlsfkRQ5FaZp6czdC5u97Wk2jvGZBc/tfiPzIpBaAS99s1iI7
         F+CA==
X-Forwarded-Encrypted: i=1; AKwUvBwbQ6fOcyZyP5WrAwAm6nBJTz6bX4HtzOKqmZyGo+ZqraSPcQabfF2oQVjhY3ISE6T3zAKPwSWbiAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kets0haSB8KZbc0gIAy6cwrK6UYNGEfUU5ypWk/adMbfZND0mG
	zFs3m76G2CRElTNdLH9WRFAMOWLaMWTzuViZktZ1yvHtc1qjjzulQZEhuwPp32mx
X-Gm-Gg: AYBFou2vsJUbrNJPfiyEmh3mrBNGgqc2a3V1AwzO5DSzrclpyEryS+B6N4Vy6sWhtFK
	IneMkyNab7BtiAugAkPA8/Hff5Ra/F/I9PeUsS2pvn4Zfw2f4zww4stvLhXxeOwjNn2KBL6aO8E
	9oVTx1+UoF7Kr9NEhVmUik8rebkMY2TEL17lqpQ+JG0+XYeYFKuk/wt508NklqNEy16A0JCZ2HW
	z1E88ycANQmF59XshoQ8rGtzkNClQel2yAFNkDDxj3ObPniYiQMQSZfRdasKTynMo60ONS5PsrS
	hBkd0mWkjJOhXt/Cl5MMZwb6VJag4I3IhkDilZ0CPblp3nzOrmlfW4eGRYa0+1YiPzjxAVEC4Z4
	H2i3orSF3xkyL5zZCIm5aZ+kLEHSpgodzDupBsXtQnjzD1Ql/zPIAKn2pNtuMGG2qneD6FazoRz
	0mcHxT/UrO2EneSSakyA8XgC6Y3wsYQAX9NqDOGkmn/KD3LKQzkxX1zgNJwYt1kRqT8PFzjDc6B
	nSbLtnTvu9NwnLzm4468FuM6hEzu3V9Af3V
X-Received: by 2002:a05:6830:4c18:b0:804:bb22:6d42 with SMTP id 46e09a7af769-80899165940mr834591a34.17.1789373543835;
        Mon, 14 Sep 2026 01:12:23 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-807ba3acfe4sm2518845a34.23.2026.09.14.01.12.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:12:23 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6c20a9c464fso1572817eaf.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 01:12:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2w4LiYqLiojvJ7sbkxbAaFZzjfiFMSl3NWcJk1TuPLL3sE1/g6pjgnZZ7l4qAXa1C9aNP2Wjracc=@vger.kernel.org
X-Received: by 2002:a05:6122:4905:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c981a7ddc0mr603320e0c.1.1789373084860; Mon, 14 Sep 2026
 01:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
In-Reply-To: <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 10:04:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
X-Gm-Features: AcwNN1UjvEXLwhrFNF_ZKWONSXtVIhmEHRxBRtfYrWrrOz2Bml4dSuA03jjsOBQ
Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm/rcar-du: Add support for DSI pipelines with DSC
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

Hi Tomi,

On Fri, 11 Sept 2026 at 09:07, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 07/09/2026 12:29, Tomi Valkeinen wrote:
> > Some DSI pipelines have DSC (Display Stream Compression) IP block
> > between the DU and the DSI. Even if DSC is not needed, the IP must be
> > enabled for the DSI output to work.
> >
> > This series adds a basic DSC driver, so that the DSC IP gets enabled in
> > bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> > the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
> > board's second mini-DP output.
> >
> > Original series from Marek.
> >
> > Note: I see that not every run of kms++'s kmstest gives me a picture on
> > my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
> > but fails, and the screen stays black. However, I see this same issue on
> > WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
> > separate issue.
>
> Pushed the first three patches to drm-misc-next. I'll leave the dts ones
> to Geert.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
