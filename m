Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C1376BCD
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527176; cv=none; b=flx50ddaaEqzwRlmnBF/V7CyzKlFu7a+jFiJHaTZy21u5VVkJ0+3+/ZhM7Ws9LpuDDvmi9LstHos4wg9pdmKPSLHa5aYn6T7d5/JHpgcWOcRFRz1aNf9TMoIvMCttCB9WhizO1ZdIq5DNC22x7qERiXpMguPoPe0hQEFALF3xGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527176; c=relaxed/simple;
	bh=y8j2/FQNeXE1C/2iMG1jjFg6VhJGfmA3AX/0fZrBhX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDhrqP5djq++cE5lNTnEcWREeUQi7va0Iw828qoQThL2otWExggHcjJIGu9PcslTmve1HGWZn6GFB0R8CIG3fDRE83Pq8vEVf/DAql159VDbFT+mB35FxNIXsh9E2XRvQP2OsUq3/cSchwtQHER0kL/LcZIlm/UlmgPkBKdAwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so1514173a12.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527174; x=1784131974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hO17YRpuaXnOXgeP7ftbHwpUP+dSdnes8jnl1DmJr/I=;
        b=mPHVeoi/zbD8AyQ4GN+7wnyw5SRtfrankGPQeC+7diVdUlz6Nmq1fEIc6C4zmrbDNZ
         A1BxMbjNEj8nBq0EPQAoYb2sKwFP3TVryXZeRep3nzAUEgDvdd4eibb15ojXnZTJR7XB
         CRVWKq49wDyH2KXgx8TpYMAme9IIJ44agzEX0WHNJp+XX+JnJPguk7eF5g+1N8E0thl1
         5GOKYemyku5dZ/cGdJXkeM7aVinS/uVDzZsyNVSf3Z2dnTqwxe2D/DIKS1YnhTPqF6CD
         hkIPTRFuHMn/0aU8fvab0/E+hdFJK6vjqf3+567tbRxp/d4NaK4UKpoP5xhm2meuJvDF
         E+cw==
X-Forwarded-Encrypted: i=1; AHgh+RqFbL4+W3esh1/vNE58TYcJIMDneVNFVSuGyITowMp1DBll59a9A/qYECvzstDAHC5NJ9/1l36BHzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDemewf1018m4VmlgnYM7OMf1zqQ3WspRXphdQN9c7j45Ro3Cr
	FacLOJba2bJtAQ3Rhy0W8BkLwbIUiI9TiRH9ZKekMT6cAk44g7VhD3si8BVc/VUERgA=
X-Gm-Gg: AfdE7cmWxVahCmPHq3Ch5QgyhhMrt0i0Vrc2Z2JrB4xvWBIWAJS22bbhEzB+BmG5Bee
	5nsYug9kuD9lhQsJ7hf/T8LRjVr4T7yOG64r52xVKW94wL1p0M5Le7In2nb3+SrVWHsdcp6R/nQ
	bwHfbyLcZcYueksLhatPgVF/eVV4Yp9ZofyJyoG7LmGB6fpxa6KiD37JWj3EOR0YSPRkb0AkNtP
	PjdfH+gnozRBAH6bQDtsD/3jJk90H8QWla15fwiu4YBzCB/VzwYUONugz19YjozPSrkybEx8qVq
	ca1tS47p9bg6ScP3geS6XUujiFYVY95/tEPsr/hceWFaVzRbI2/LcSi4kGmtMCYR55oxf4VtA9V
	+99HzbSE+R91NlrtvYhtQHU90iEQpisUJZOtc7qsg4mGsbNs74Kkw8cR7VIhD9ohDoxlOR1h3Pu
	ZL4WhKxlkaOOgycnaG+H+LdQoZiwm3jMtKdj1jeKx+P0NUVxr+Sw==
X-Received: by 2002:a17:907:9451:b0:c15:d8ac:f526 with SMTP id a640c23a62f3a-c15d8ad12c6mr84899366b.38.1783527173650;
        Wed, 08 Jul 2026 09:12:53 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb488desm356131666b.63.2026.07.08.09.12.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:12:53 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so179396366b.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:12:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrchXi5/V7V3NRiUnnUEZfMJmit1W8DzkFoUOc68KWj/LeY6Sfcfk67nIuRhIQyAwPefA8pqYqnoL8=@vger.kernel.org
X-Received: by 2002:a05:6402:1475:b0:698:1973:1da9 with SMTP id
 4fb4d7f45d1cf-69ab44a2082mr1330602a12.19.1783526681164; Wed, 08 Jul 2026
 09:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
In-Reply-To: <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jul 2026 18:04:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
X-Gm-Features: AVVi8CdIlIxklIbGHNZaygjBAfJd_Dhsc8WBwlY036WlOLVf0uDAr_hqlDulMbU
Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 8 Jul 2026 at 17:42, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
> > Geert Uytterhoeven (10):
> >    firmware: arm_scmi: Add scmi_get_base_info()
> >    of: property: fw_devlink: Add support for firmware
> >    pmdomain: Make genpd_get_from_provider() public
> >    reset: Add reset_controller_get_provider()
> >    dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
> >    dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
> >    clk: renesas: r8a78000: Add SCMI remapping support
> >    pmdomain: renesas: r8a78000: Add SCMI remapping support
> >    arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
> >      reset
> >    arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
>
> I think 10/10 did not make it either to my inbox or lore.k.o , but the
> remaining 9 patches look good. Thank you !

Thanks, I did something silly while sending.
Lore now has it, b4 still seems to miss it, unless I specify the
Message-ID of 10/10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
