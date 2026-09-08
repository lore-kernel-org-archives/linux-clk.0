Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD847526A83
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869882; cv=none; b=N6hDa7TNBmAHKUe9/I3GoFgD/7cxXnacCI229INURW3iQoXxpRSen4maiJFS4Z2HqBeUVCteJPQAsJdK1S1ITVm7dgRbBhW/PJHdpAzjWD7s3t06nNEyOZaV1o5kq9Zqvkv9ABzbLvX5UhiCy3rIHVvP4G7y0w5dI7jpfzUogKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869882; c=relaxed/simple;
	bh=0TMTisvxJ+92sKupOfinZVmI2wJF91ccrQT+YBZKyKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKreZ45+bT3r/S0kVxRPBoYrDSAIW7fatsEKv48TAo5b9prV6LBTuTv6NqQdTXbX8/PoUrNZxfx6bqsvzEjbDJcXuVFD7e4kwVrG63w4Mcw8MbDY91m2LvtT+wCFblReL9Vlj6H+6IpmC5bOWuIaD4IGFkc5Ux/6GT/km5lE1aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-939b87879daso85631785a.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869877; x=1789474677;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofUUPAlzK0RlPGiJuLSG6vss9ksk5CLPkzJ8jLWh4TE=;
        b=FmvCG+IvAXRloCZ+2BDbN0Xv/mhoe81QHQjoNqX4N0V906oQnAOSCKyp+sZP7sS6Ce
         OH5z98jLmlG/wXtwYTVeSnFfSlgLyIttCDbb7kdcEhtLxWThSGYeoG2r95ZipdTYJyQh
         ckdnxiDUqSGFwzrLkE63RgbZ5eYmlxo/EvFFSUNSaAeWtlS5fYUdOXmKFT5dbfJ0CZZ0
         3hvoPLzxXTuEheORJKQDZYzd8Cnha0EcFzbPSerQrAv72c0ygPoEhfeyZ7L0JqJIU/dq
         3mXxqZZZTuiBgdan/ZvKAFFiYREar59RHlhMEYcNqfNsw2HQNMF4D8Mn3nSCjw3z6shc
         SiZw==
X-Forwarded-Encrypted: i=1; AKwUvBzfIcr5EXDJxXygDew+OI3HZdTqyXMeobTtfHHrW1i+s1TV5FdVbX43apw0gBBaF2oTTD83E1FLs0A=@vger.kernel.org
X-Gm-Message-State: AFuF++kngBI0dhQIiJcvmNtObF1oyjjTt/FPPaq8BhVkqcevDjkLywj8
	oK3lJtbfv2QcNZF2vocz8W8JA8VGAkX3NbKvUinqTbRfU8fbgyD/wxISRrFduaFu
X-Gm-Gg: AYBFou018C++sb1nODXEfdqckhYO4ofsMWGx09293LpGSzlYK0smtZKh935bCgj+u5L
	JmlpL4v+544yozj9i8H9u6J1g4hQrGmAMXqxvmRCitVOhs0aYvn9T87kV0ywpB++69ji8UTIMRi
	hXcFvoThIe1UOJ+UaEhvK03qXhcV34iahzDPxcerMrPKm9/tPQHwL9RiDioMNxp2XZFP5AzQfl0
	FMzWJdNM4gOi4YcDvvtBj7H3zH8Q3oGUrpj1zRHrmIikV5o+8fjLhdbXhHjY7SEK85GeMU1G1jS
	bzTIZZpFktQcrXuKn0qShZnNyTuDqEioKrRAFA78oAzxItlcSqYyDPuHI65BzzSqta9VZQqqXSb
	P3rNGCt0V6H/o42WHdQfDEWXeGsSZEIurEU6kC1ghZiB/z483Eb3Fh9MOV4utvOCp3IW1EaKMY+
	uIx0Jb4cw2AQc+IDoFTxXBtMjS63ZNpSeJ1exGykeWO9lq30nfXwoH7DZKW4Y/7+M3QUEN6JcXn
	UORKvpGPvoUt5rEMpQzXs4sANAjAO+wqK6Pyg==
X-Received: by 2002:a05:620a:5ef1:b0:939:7c8:78b1 with SMTP id af79cd13be357-93980444d88mr2713092585a.24.1788869876645;
        Tue, 08 Sep 2026 05:17:56 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939a57535a1sm568625085a.0.2026.09.08.05.17.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:17:56 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90e8535619bso71186706d6.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:17:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQM/XH5BQc0GfIpSXyOoX4Ivx+mDtEkAOPZiUoREedSML9xXlD0uk/876SxXGSpmkTYU8ay6uk81g=@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr9426846137.10.1788869517073; Tue, 08 Sep 2026
 05:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
X-Gm-Features: AcwNN1WQMv0pxPEjkRceB80LKKGbxYp0qnUsTTCp1Uv8lpJfhrW-zDPu8BR9rQQ
Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r8a779g0: Add DSC
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

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
>
> The current dtsi file does not represent the DSC at all, and thus the
> pipeline for DSI1 has not been functional.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrowhawk changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
