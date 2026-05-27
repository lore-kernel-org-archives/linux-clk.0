Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860E410D1E
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888920; cv=none; b=s5xaCKgE8e1usaDAIK7ZciFvHZIV+ud2SC9fUwGsspxTNbRfevvGJ/fK/iDs37+KTRtGpV1otVZEwR9Vp96qOibSrwEjCg/ZmumYZ8j1xwkNdhN6tdSYPZnogI7+6WWolbSwaHeJd+MWHH9RGFJIX+673gLFwN/9/BD4nG9mtOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888920; c=relaxed/simple;
	bh=mEcrfUMvusxTikKtH8K1dnfTNnQJfa+aFYGiWe/y/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ8/yTuwV5g66+2fsNRu/zPrTJxzbyNkFQS1Vyu/O5VaxyHULFt3DXXgpMHcebyO5B/z0Vq18iDpEVjG3024FEYtCc2c7iOoRFwH4hr4wCtnpBNvX6KeN3wLCT8LnuOw27ObdZRfYUNZ6zacgGgRI0kX7cgNIMK2UZOMcpDNO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5751a9020faso8703919e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 06:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888916; x=1780493716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNs9y+loQ3B7k+4+DTGFYd+r0HnydJFAxPOIKSPX9Cg=;
        b=Tni4UEPtfyQetgLEu2ptdi6OK0MED2XY2c6iW1frKMcNE6kzzC//Jhp+vxFyh3g448
         OM6VKGkHQQIQBMJ+HOj+dvv76pOYpaLcNsvVkk840HPJAK5/sYhraa4X6gGpsIE4Ogu6
         S1X2lDDoZkoANPqRqgv6Ca4pgbqW0rHg/iSeOTfUweF7MY5UVZOdkkNB/FWLqn57PGMl
         8mGHI9LbN6pq9xmf3HWedmrMiBhtl/jukCZJyzskf7mJuyzTaqK1tGrAkp16KQyjAglL
         Hyz0JXPM/0uWSYZKVV3JzJpD159MHsmv3SSgAwIy1uOTwl+5wstFkYB/0DYDQc8LSHY8
         VL0g==
X-Forwarded-Encrypted: i=1; AFNElJ9+0ctD2O4FkMqLMXn3mIYz8nT+IWtdLLWOZIQpi1uAqRKY+IWvgRiHahMYswHaqjguoYQuPBhe0pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoWF4mrZQlgmzcPC1HBkvcIlmU9kYaZlyngd1VYfPI6DmXvpI
	JtGVrtTcquqxnvhu134cAnPejbkWGI0G+V32h2hBtJcu1aXVmBWOE3bzCkQQMJ+NxRM=
X-Gm-Gg: Acq92OFwmVEXfsBFtvyPn08TgiMJ5tvZdGuj+eEz8pXUYgSP7M1A4mMaUGJHjBAEn+1
	6Fv5oii09VZyuMrfo0CcyfLDDUYFM5C9tEiHj7B1C8oMoUpCnMo4I/xb76DPKStiLXarw1cNWRi
	IEs+UVe9aeeKYyqjwA9vTwhm2AjY+gIT1bme0SbJPrKgCq2l39/CzSYo4XSknjaeCV8U3+JY88u
	3gOYzyCKIkRIMOfcQzpe9mnSgwzjALmZQ2TIIx3YQ6S9QznGDT6riBKcKKIFjYzOg3IB2gkiokC
	iOboHEinXp+3GrDYlaU+gaPHOD2UspM7EcN2HTUHU+p5D2jELoXo8oLe8P2R51+wgw3cUxeV48X
	8emtEHn60vCZpbV6W8cOi4VKNpVziSm1sadqBFvcf0rRa1Tb5I++wUBK12umDkWQDs2RcdvQjy3
	SX3ZBT8WnKEBCbQ/DrgSJw4jrWC4nDO7GhB9jkVYuupPG1tWQ9LeOY21FOvFg3
X-Received: by 2002:a05:6122:459a:b0:575:178f:62d2 with SMTP id 71dfb90a1353d-58664224614mr11602068e0c.14.1779888915850;
        Wed, 27 May 2026 06:35:15 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm21275855e0c.16.2026.05.27.06.35.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:35:11 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d0476492bso8607886241.2
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 06:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9i7+nwEXRHdtOuMKWha7WEt7n/hM84AqhmH+nI89cFpTa0XLkdxblkUUq+TijDAYlYfEhx0++AFhY=@vger.kernel.org
X-Received: by 2002:a05:6122:32c5:b0:575:2ac3:4166 with SMTP id
 71dfb90a1353d-5865fdf6488mr11991906e0c.6.1779888899429; Wed, 27 May 2026
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:34:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
X-Gm-Features: AVHnY4JU-pRdfRlPcY6GhkzF7rJsa1sewBAKfT1mHVG-dL_G2g5Q1LYyK6-SKY8
Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: renesas: r8a779g0: Add DSC clock
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

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
