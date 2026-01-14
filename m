Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9330EF72
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768394292; cv=none; b=BP5tAKBoHOUgbtxex9sESxUUCCIuSz/gmxvbrKTo/Liif4c83pBeND0owY12A4X8gNluqdVUmih5Z4jAeDYmRSY7PkM6wkzRmWMXpI6MZqsvGlYc10IL8VIGp8GjTH0Hov4bVzH7gBLp0rnjRthuCZPpBJ94/j9FwC7yzEEK+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768394292; c=relaxed/simple;
	bh=uvyq84vfqLkBb8SFLfNReYm5TtcOjgPQQ2g9fXWWq84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CL2YSm53mY2B/FWjAA4coHOROEgveifJRT4JxWa4EWfH6FtYeya3BU8vSyM2iCmJMKVv5pOzqI8XFeQSU2CnG2ASq0WnbAenrfbUokQQVVUZLNPJLi9HKaD4w+yjfehelGPJAbRLUbo3AgBDcOWntOMnJjgqfoxKNMz3hjYeOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5636274b362so1709235e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 04:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768394290; x=1768999090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj+1g0xoern/NZa0KoVGvEg+BidqfC0JY8V0QW/WQj4=;
        b=cLNNlRV6SCxXUMloy1bSndfFqwehKsZk0KXTs6P9jQjQQDFrI8HgBi7EYGGjhIPWXN
         btXGDT4NomUXvdSsSnkX/eU/8dxQOsVqcTg9jrny/H8u2r18yR4kWoFCDOmaVeaQ8cCn
         YE3CKCuQGhmHsfcZ7T46FAYU6fYKoUtp02iBGHhiiOuEY1B54nbQGNVMVpCZ01kE9cen
         Wf9HCBcc60IvyFPF11oC7hPC90jtay8Vxgz9meoYfU9fdefCGd98j5YmMzZbPOV+CnaD
         qh3HahB5LDZKApydVCMOLuzxyQK/IZjVFPqVhFDADzQzCKKHguCeZ/UOCSo2xqZuurlR
         GNZw==
X-Forwarded-Encrypted: i=1; AJvYcCVHHM1kNQ6WWYhRtKG/NcrP3xcAMJY1ljVwn6P55FArS3m/PHgkE0/RMbDpWQoe2+1nycgeBRdp3u0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2M/aRL6KWymqQjW5NBnMnQHmbkE3mvnoZT3jNhrBfs9nkIxz
	qdEqksGE/1/yseixLBIoMtKGkuuAdtHA6ciLCwZnXMd2FkYci5x2VIhNi/fNf+v4
X-Gm-Gg: AY/fxX44q1qfc6iGw82LULRB9zWvBxQ/rp8jLxXSul5BY6/4DWQu+5Zagt/KdoEz5Zb
	6qr2Oq8hioo8QZ8zenNRTI2wHm78gT1hJNSDSiw7kldVTcZRN6mDJ3JNc7zXET2NU2PuqaQU3+8
	qf6KhGG1TnXvpVPvPouKs/hYDiQc/vUz4dt9NV/vbLfkdFugQ9p93DdhOryby+nJOFI2ZmfNzm2
	XBbFIkqSVNuqr2GMS6b9AeP572F9Ycy2o4NxsCEAeYag4EKGKxHkNskk248spaYlYsnKkywKiPJ
	q7KqeuRiM7TCuGL1NuiYLK0ck2GRBiBFhiCuzMU0FlD6xJGq5la/2BreyJ8BEodwlh/hzes7AUZ
	9zkHr9HPOefoYgZbRDWhqeEW8b2wU4zmoahWbM8BhJIGmrDl62CRWCFu4mij5uALpWBqmLwCzTd
	50HX+viIf9u0B59wOrQWC+K+v3QXqqhSWCn53+YyaFo5rPLnkD
X-Received: by 2002:a05:6122:4b10:b0:563:5c58:ee1d with SMTP id 71dfb90a1353d-563a0a46310mr661677e0c.15.1768394289838;
        Wed, 14 Jan 2026 04:38:09 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5637f6ce00esm10589795e0c.0.2026.01.14.04.38.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:38:09 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5eea9fbe4a4so2084829137.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 04:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/Dy7vs1CiEIPOh9J3t3kux3Ui8no1wCZO7nyuiI/SexJOiAiLK/NPqB5pLt2wxBDsYPN//fUyxvA=@vger.kernel.org
X-Received: by 2002:a05:6102:3e0f:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f17f5c4c79mr942660137.21.1768394289171; Wed, 14 Jan 2026
 04:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll> <aTA-Hj6DvjN4zeK6@tom-desktop>
In-Reply-To: <aTA-Hj6DvjN4zeK6@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:37:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
X-Gm-Features: AZwV_Qj82EmcdFo9GBygajeXpLdMczZEl-yzaqrHERtstQ_T42ZqMwts5Zu_4K4
Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > and 'renesas,r9a09g047-du1'.
> >
> > LCDC0/1 but compatibles du0/du1...
> >
> > What are the differences between DU0 and DU1? Just different outputs? Is
> > the programming model the same?
>
> The hardware configurations are different: these are two distinct hardware blocks.
>
> Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1 (LCDC0),
> the only difference concerns the output, but this variation is internal to the
> hardware blocks themselves.
> Therefore, LCDC0 and LCDC1 are not identical blocks, and their programming models
> differ as a result.
>
> In summary, although most of the internal functions are the same, the two blocks
> have output signals connected to different components within the SoC.
> This requires different hardware configurations and inevitably leads to different
> programming models for LCDC0 and LCDC1.

Isn't that merely an SoC integration issue?
Are there any differences in programming LCDC0 or LCDC1 for the
common output types supported by both (single channel LVDS and 4-lane
MIPI-DSI)?

Of there are no such differences, both instances should use the same
compatible value.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
