Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0FA363C60
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575699; cv=none; b=pCZyki8Qgjida9uzHT8u8ru04YIDlmPgoyjwvqtn5mY5vnjeLKA1yF0tPGVzFC8hQnp4ZHYvD/OpDHncSacGdi+hnttHL6c1tuaAbsnhBNn35XN/+Tgb6c6Vv78veCU3b4bGGabNIgR+bGxFUZ1TF9EoSORAoSpn/3zPskt9ZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575699; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0minxRN+KyvnqLo5nTVFWXFDqLHW9str69GGOXwo5Yz6NB500tv6Y2ncNZIeccz9ZbJaeZNuD44RjSPwv+Fr5KFtAq7PayC5iuAINRP6e1PmZfv7ac8c+0aozpFXufHiaZvMCQwLyMqQuSWaMcFKVXKLXoU2qWESGg3ePbuVrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-836c5b01e82so45598557b3.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 05:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575697; x=1788180497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=AiYMhrrjGTO6VaKHNjlVMseWTRuaH4eFpwvrcwUNki+5bmUJXiq6lQsp4St40BsuYj
         tlTQsAhHORAV/eLk3NVt1nkZQPrjEgPKplu6Dg0TJjDtQr/03HIY4/LepaVQshI33SWN
         Kpt4y5fTvCtdHovoMcngWXJfndpIrv2k2BCCGs3nIJQJgptn3zCsps+EP99c5+Ctc2P1
         u3Zy+tbkXo7mczsGQWWVz8lYETlFy6rJVu66JPlpdMqeer3PZvB47DCJmlRTBSvy+29T
         otVSs+GS1mI6VIDzVBJo8n2kQbpU9PRRqS9T5hhzZjuTf9hAGR6hvql+4I5gsXF8gtM7
         vhFA==
X-Forwarded-Encrypted: i=1; AHgh+RqRQwW6+t8CsV5nF4amy00usC+YoLTLd8nlRdtRuj0QYEk73StAWPWvHNwRnBwFqETIkgPokau4GyU=@vger.kernel.org
X-Gm-Message-State: AFuF++moPei1wQaA5R8YTTV/azGku8+omuJAtEbR9wiHcwj+9gjmwN/L
	+hKafy71OxNScyC3HWJ4wEACmzBTWPua7nFTjtGIg02dDcjYWCNtcDWEABfE5v5K
X-Gm-Gg: AR+sD111G3kvhfTCeGYP8GI9QE0JiryWlKNRMVOtiE5JAKdkkNoVw/o+Fwbaz2d9csx
	/1xE3Xq3oeha2LsLwxwITle9MiQqJmiF3u6LJ+phyEuW7Z/l8rZqm7c+Kyns6GpEymWXnAWBGR+
	16Rwor2Ez5/ye4y8bPRfH1vBla96ElM9B/tsqNp/11X6wdl4469nkJnfk17ut3CFG8DTzL4f5lR
	ITY4xihuhFRLSepyvJh5FP9GVDnbtafYA/MrgH0Sr15XiE3iDnBb1k/wSYtYiv/JVWBVK6gfWp8
	+TWsjRReCDbqP93nCr4FC0qSPk///PymdOBrgPtLbiswuOXNZk7BIKAIEsWGeKJjEIJMNKnDKYf
	2RvFnfu+hB1ij8gGwTNS0TBBP3HPXOIoLaKVONX/R5Lk3A2Rkhay9b9aYegPTY9KNdpYzSJuIrY
	id9en6/L6kq5BkDyUpymuFVyev5JbFDS/BkAj6HB82Q2vntzeMKOGTH0XRWTAyfbHP7W+hikyIj
	Xqf51KT5ykD8jtLpn10jwAzvh1BMg==
X-Received: by 2002:a05:690c:c614:b0:81d:edf2:dad8 with SMTP id 00721157ae682-849f5635738mr93484657b3.22.1787575696616;
        Mon, 24 Aug 2026 05:48:16 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac201719sm32374927b3.43.2026.08.24.05.48.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:48:16 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836cbcd0a48so43728687b3.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 05:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNGYxhjin7zeqR98UYyld7w2fjRBmmIy7qnTuI2RbYqBM2O1GQPBoF6eag+IZrwLHpPitZcNNMFP0=@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
