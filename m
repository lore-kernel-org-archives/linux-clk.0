Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633680;
	b=e5UV2dQnoszecI1etxDSzQfIsDtP2A3UhW3g37wgS8+ZBxMea330EFKrAANWVy4Yx69O
	 PDnVRk7ZTBiPlGEN00Ck31hMB19j72fcYwSJwkK45+HFD/eCSUDBTDoD9/FTZnhtkZCsk
	 DOtJSu6vDHvGogPdbSdWwsW1dpdjSkMTcYaUwzUKF00y0YVW/QChAqJkeGj/+7pquWUSS
	 H0eIxPbt8yLPggtOS9b4zamnJ8FmO/b/5worDGWv1CQWHQahsxAiDKvQ8I+NGMjdMlsFV
	 tcXOO4g421FLdgDxFn+GRkQoGD+DhcQ9sbAlg3FhtGjTuyrUCdJaiacQvLx6EPho+aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633680;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
	b=Ztz8vmMbvc63Eu65xFsPH3q2LmPnrhvvV6vZLPqlCMpH4cCelYwS+ftZJst7ScRxoN47
	 SstyO+XveHOXkrpIrOW7kCQ9qtB417TuqPJnOO+VWaszWe3hJA/TUEA1+1g43AULiZdVb
	 SQLsdClTs8Y0FxOX+5qlNB/4mKl81bvNjXUX2udCErPUq953LAfItif0Xv4qlS6b766HI
	 VMP6BvqOK+Am6ftE+K30SI0cqtLXcc4PkGYU/zC1z+xmYGLv0sctE7WlEYB+DBvp5lWO+
	 l588UlaS1SoQV+0lw2eU1AFVAZ6m8Q0+/NM+KQQwGWO30xi19r571uKF274QtBKYifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75B60A0C90
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA75B60A0C90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so16935766b.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633678; x=1794238478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=gcFVe1CMBR2mJj2zMEXHRF4ASOBJkwVtSYJjJPi/4Hpl/8/V2hZKp7siGHlr7Nb/eu
         mlOXmVTuXeM2VRjpGR6+M9e9TLaq52M8sqa/YDi3OJdX8PZdcmKtoQR19Ljl6XCxEqsr
         XjlFAiMXzWUrQQ+hRssIlFK/RwS6lFsjW1264StdbsV/YdoVjcUD63mJLViebmuX5H41
         W3gZ4+gu7SdDOo32ec+LFk8Pq3hTvq/hjm0xFr8epEKL8fe9pro71SN+0x0ObHUSU+wn
         O1pjsOCvnpEQKdt00AY9IfcQ1XZb7DbQmXwdXscf6qbnb9MKJ8wGyb6QLO8udsuXs6cM
         QcvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY9wUHR/oJeEGUqjHTK9iYqn4TMJWWpgoB8h8nX4oHhceQrQcumm/oMjfN3DTViZqbMNjjRls8Pt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0O8h3qtnlEd0BzB0LvdjDNKRMwSAxvfrG2nRWSLpMG4+Br5lA
	y+gmLNBWgGjP6A9dZ6ZB/6K9Er7mLp7jeERiBO/eOhajMWnFHAR0zfLO5xR4IcjtJaM=
X-Gm-Gg: AYBFou1qsFL9xNuPSW7VxzUq90yHy4fHVngcXecaeUwuN4OfjVVhtW7uXAskedhY8Hk
	DxSrYEaB9QHoyO7m996oYGMpVaHeRAwVV56L7IHebb4H/2TIHvlKtLETOwHmlD8G//6+/uSEVjq
	iIRnu6xBLN3FvdBKWmuZIGuuUpAs5ECwmj2ScL403exr5G0F0JA0wWAS+8907DtfR1eyt2qMm8w
	rwlm5rldNoBVJzfIafzS43Mjgw1WBpiL6VPrdzIRQPDejPSQgPqlwvh4FJl9ihD57UvT9oCyPqI
	bdaDvftx4OGU9zltJ7U9Z5T0Y0/12vV4Uxr14b3L8KTGKQAHQCL6rEEUPKqxjeMPNqjARywrZpj
	8JPuK91yBZrXTBMkt1JbKcfJuBMRhhewq3Qg2+smhF97JUfj9jgjO8nuu/dd1BT8DM2j7Uk5DUp
	P3NoooW1NrPq4Hk3ENSjbfsZ8d2PHq0yywUx7kN2exx8MFWawnjZUDXiJ2jdG00ZFiUn8gZAecG
	JhqqZhdQVl295WWuUZ1xWGxum8PFiogQlmFvbT2qRr/MVRVUZsDTqtM2KkvxHE6lB/TKzQbSIOO
	RvGIDM+fz5VrclMC4aQepu0IFEC3uxBws0xp9ljJB4mXOnmxvO3rkYDhUbPilbP94A==
X-Received: by 2002:a17:907:7253:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c4ca7aa5303mr845547666b.42.1793633678242;
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec1586a5sm1926266b.69.2026.11.02.07.34.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso4679953a12.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw3nElUAjKEW9txiCLajphMoVJYoILlvfmwrtcP95HE1AAlIAXecXP7B8jEHVyRxlIonyaaqF8Gee0=@vger.kernel.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
