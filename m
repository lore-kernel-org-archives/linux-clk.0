Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428191;
	b=li9kCY61NaZMuTAIp89a8sxfbFw/E00SRKusqJwUUozdXP6qAVHABEOYOIWylF2RZb81
	 47iu1ODO2rEFzn/zFapoTHjp7QuZigaKntOEdSC4zhl5r212oFYjyGaXVB/70jlEixp5N
	 F/i5ewnkaPulymFt7V15rVjKFDZc4/Q0If5vtbxH6FfIJ779X6wRK5ufK8HdWvsUp8XX7
	 SPwQpk0spn+onmV98nzJI8w6k8mrKhfx/rPClGTixebVK8TFGTY72QVqc+1S6R/N81D1v
	 zgpb89EurYbuHXlDfQmMvuKf2nGS0XvwepWtGin0EaA9UbGglR+Jq1lSedOdux2OJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
	b=MS4GOwH0iv1IC3FVXukKgMaQb9tde2xvRuP+xBXZqQyQXUn+2iYv6yHxX08/xJ9WukUa
	 mqsH/IpsA6+2gqQssdnKIUIOsBaV7s+k3P5gZ5ha5RYdukK6ybhH+SVuYqL2P5aQposHg
	 11iR1zURYux3scNH1oIiXPc+Www3URqVWVivEx8wcJkL2lyrKTCbCHWf7m1pCjGRpNhOK
	 ShcnmP5IRNNTWuotMiCyQyfqtKn2kslhbPw0Bl9Tobz2uF9LRj8ckHGJ31MpHDZTwzizy
	 Ci9Z8midK/W60V7WTar14lu44ajZbo7Bq+9TsysXbzk9cl535WYMW5dnqxHqfvFQC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301D606A319
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7301D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so264435666b.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428190; x=1793032990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
        b=sSeGhS22jBQdMU/pq5EEearzlG3jAOxvZi0Pogzz/vQ+30capSXHcKcM6wKNerojv1
         1j4ANYPolsbxrmvnqL9NxqRKbtZhMc5gmLWEL66AlU17eKT6urKQdfD1Hdg2LqgGjtGj
         XM72qZvJqZgLvxenX/MNadzsVvQowwdQIqgaBBylBLsh2thuIrwTOz3fgGEa+oOLMKmF
         yUrs0QsHiU+itAHdc1piZJTOWu4i6wk0vLLj93zEoYHMWl2wau4XNYkSdiwmptRYuUuy
         Yuaa8eAi20A4mn462tI7UcOmqWI8/u+786mgy/KahsrqJdmj/C0lSfgZcYDhHFhrRfCg
         zvsA==
X-Forwarded-Encrypted: i=1; AKwUvBw88yDwWnJ2K+gxw8E4gNYqWAN5i7+QX/JDO2hgFcgsBvErb2g+IS5nemTNY7n351PzEQbQUU6YYA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZH7xEFP6jk2WqVn3X5zxc4WEPVqzS9J6P/hwxFGwu6H2SgV3z
	Xr3naSCMPHXfLmVYkuqdlwIDd60Np8DgzGFHaRwXyI0P1rbKUk3Qcb7ZX0K/6wXpVK8=
X-Gm-Gg: AYBFou2pE1MZRO2Y6i2cJvYBNpWKUn1lsrpZu6z/j/ghYG7otIrpyKiR5C/J5xxntLI
	8aqyLtzjjPVFHmdUoFIXGh14ygh2tCjl1L/ckbXFCSkH0o4L7H2e5301qcPdYcxKM7RrO7BhcDH
	xS+A+0p5KsCM+FsQ2VmnLnIVt8oTC1hko4v9jrpGQw9q8pVimT14HdE9hMoFf7hkiJ8O2RJzoL2
	GKpdCyEY90luAPfiadHul9AtwuOSdvZqErl4yrf5ueXJS2nSlbwlKWreo4JnvmMKwE45OQXCYEm
	+cOy4s4MpkYj8jeBCrsPTD1TLbEhaTc+4+A++yKZ3hsPmopNaexs1L0ElNckq/GxIszjcepIxBP
	FT6gutCNwUHVHJs/SQQOjzvqr64F7FV1iO1w4JHQ8jwTyJTHNWQZTCDSlXBFk8orm229dDZ6PDI
	DuBS53MeWyx7q/Uvt/zr+m2H01FyQpVGksKoSM576XmWOHpJq4uszH//6biyailAMK1rcm3YexD
	7jqXSUaqcahd6JohseTU3Y74bSoVOsUVkl+2sLKzQwNphY=
X-Received: by 2002:a17:907:c48b:b0:c41:3e8b:8605 with SMTP id a640c23a62f3a-c41a08dfc69mr594877366b.43.1792428189566;
        Mon, 19 Oct 2026 09:43:09 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40918c5f52sm376549866b.49.2026.10.19.09.43.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:43:09 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so264432566b.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRT8eVqBf2dYZ9jD1doizccsxBlbvxD22ZsKlAWr8zxjQFdaiKEkMGZsH6/VTh2x0pebr+g/Aydqs=@vger.kernel.org
X-Received: by 2002:a17:907:9605:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c419f31c8bamr564444366b.27.1792427870527; Mon, 19 Oct 2026
 09:37:50 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com> <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com> <20261019161436.GD3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019161436.GD3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
X-Gm-Features: AclHuK-8scCJz9rF32kL_0712rSWvXw0tvi_Wr1HURn1pKiiIZROkb3-2ONTagY
Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > > pointer to the clk_map structure, and populating it up-front.
> > > > >
> > > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > > @@ -16,19 +16,24 @@
> > > > >
> > > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > > >
> > > > > +struct clk_map_in {
> > > >
> > > > The "_in" suffix isn't very explicit.
> > >
> > > I can add a comment...
> >
> > How about calling it clk_id_map ?
> >
> > > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > > +};
> > > > > +
> > > > >  struct clk_map {
> > > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > >
> > > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> >
> > Possibly. I was about to recommend just using a single structure and
> > leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> > waste isn't very nice, especially if we end up with many entries :-(
>
> Actually, you could even turns clk_map into
>
> struct clk_map {
>         const struct clk_id_map *map;
>         struct clk_hw *hw;
> };
>
> It should consume the same amount of space on 64-bit platforms. Doing
> the same in the MDLC driver would save space.
>
> Or, if you want to save more memory, you could drop clk_map and store
> the clk_hw in a separate array in r8a78000_cpg_priv, using the same
> indices as clk_map_id.
>
> struct r8a78000_cpg_priv {
>         struct device *dev;
>
>         const struct clk_id_map *map;
>         unsigned int num_map_entries;
>         struct clk_hw **clks;
>
>         struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
> };
>
> where clks is a dynamically-allocated array fo struct clk_hw pointers,
> having the same size as the map array.

IIRC, I considered that option, but rejected it, as I still hoped to
put the (at that time multiple, per version) tables in __initconst,
so they had to be allocated and copied anyway...

> Too many options.

Hehe...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
