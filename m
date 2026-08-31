Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54674AEBCC
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190570; cv=none; b=VGIRFRkODsdO7oTUhYpppywaV8iekNaPi1BUb3hboDxcb37apD05Gsn4E2TnEj9bLhjN+XEWpPEpXi+rI1QkQ0kjmj1TjfAYL+pQZjmYlULJghW1md/yMuD0bJjRL3iUz+IaE6crW9mxLcMwR1GJpgQ6B1ItLAWltC5Nc1cRL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190570; c=relaxed/simple;
	bh=DodOb5bu1oSMuLPsOxNFB8oK01GET+pyiMt7NsDyP0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwXQHhx2G1vRAOCYikG74wxy6hEsQ3xfciDLYIAMHuvnc4JOrCAm4WeQIdoL9CejgbidR1SBP9V3RIfIn1RaKulzm+yXOWWcymFn3CAHslGJWScOFA8vUrkMWQsoCmoNLqwHa/D06lO3cPXk1X6pTRxdOjyUOKgNv/Um9FoaEtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MllDFC1F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AvVWjzlH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MllDFC1F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AvVWjzlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788190567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVxBilOuJ3eJRjLFViKxIC+i5050iOvt2YALC/2UHq4=;
	b=MllDFC1FBEdnQNrGZhkaDrBpl2tNnlUR3bV0uqNK9YMcEXl+vOOyvlPNsxPaII6K6UZAJc
	gQFslQcZjRNKSmxLmBwoMkDrJ9RnjvzFNDzdMM/v37r2kYDWSMMsSvkVmjCxsy5YP/E5J1
	4nA6GLfiOEJVEWgW4RwZ7OZ8H3j6moA=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-mVcYiBOcPrCwzAI7m7k5bQ-1; Mon, 31 Aug 2026 11:36:05 -0400
X-MC-Unique: mVcYiBOcPrCwzAI7m7k5bQ-1
X-Mimecast-MFC-AGG-ID: mVcYiBOcPrCwzAI7m7k5bQ_1788190565
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c70f4b830so4849383d50.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788190565; x=1788795365; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uVxBilOuJ3eJRjLFViKxIC+i5050iOvt2YALC/2UHq4=;
        b=AvVWjzlHj7QXls7GoYFVn44ZDsR69lSpKoIkBuoXoTNtgyugbIh79MEuKTLDPwmZ9n
         qPUqN2uRU90DwZYmmiw3RBVZ7GhVpA8DE7AbkfGQmt9ErbpbmE0Ddb5B30YCyOiG93Ed
         amkRp5ySisqByYFwIX832rN1E5SbVR9wa0yg552Cn/M99WQSxDepaE01yhq8VkxbZ1kx
         2kAHJ21YaekABN0x++MKyHPvIibSSQMO9OD0CTw8ISnXIoacmURBYQkTpjA61Msnf1Tc
         E79cMWOrQGLKCVQjRpm33ea365rAODULpJHtY7PY6GdCcoqj2S/9Hpe3/o+CluKemBMJ
         X50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190565; x=1788795365;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVxBilOuJ3eJRjLFViKxIC+i5050iOvt2YALC/2UHq4=;
        b=jOwlya1xd18W0wEYB6ZsJARKHkkOQH6tHfJ2zWm+SB//8j1biE17+THAaZUcKLpiE5
         QWOMYIvYfOI73asq9xVoewDj/oEgQXat5PwjCojFRsB4y8A3fpa4gdTd3A2nY9kb5Pvf
         HpjjLcZ0j2cmnEd5bDoxyAi70JcqbxgGpu5NZZwLQTyiogoQmog+1uWwR1q8MOtYVOrs
         cDIFMK21TYkpV3uTa4B1dOCRxoJS4o4KagXjfpP0O93ntSZJ8jZl6yEK59npFc2lzdFy
         SOX098Bxi4ldj2BNO0rCOwE2MI6oZasOBjZN894KeYwZs+V/gf2B0URTEnZqCZqq+9VB
         bKjA==
X-Forwarded-Encrypted: i=1; AKwUvByvCNWYiAa0VulQ+mtdorflFbTzXzcBSagT0plMsULehw6kwiJAjoDfPyDe098+8ZRQ0GJX+oMkg2c=@vger.kernel.org
X-Gm-Message-State: AFuF++nVFwxJJe0h3ziC8MrOUiQbFQveJmp3lfhtwjbMbS+ACgegciw9
	RZC2jHhw4+4sJtHyc+R7Z5QRnUPXcMCLVZp2MS6ZzEZhdl2DsczlU0Nw3S7D5v4URGb563boTVk
	1Rc7dAZzH4tmEc/Zr4rPktBEOEOCaLfSRjC3p6Pj67gfnLdAafektFry9907CtQ==
X-Gm-Gg: AYBFou1j788BeHwipqKnHrwrqOKOjXBoafs6heuBGQQlyJ8ekDtxy8tF4bJ9RtdrIbA
	6glf1M9WyqzxvdmLqhyIF8Pk7gd4lG8XI/ZCKQKv+XOhDhmMjcL5QLr59XQJWBDh5sc4skutuPz
	DtzfuWbMZhelGnhBpfJjnAOwcOPaEddhoaDHuop654cCGu7rRU/0uPGOVy52qfagd3JDDcDdJ9y
	dQzXf42nQkvnxwZ/GIEe28VXhCJICXHAQRy+A+C87DtUGUmI7IQ2ZF3ZybvX/Js0YSwIF09LFim
	pgwBTQ90cM/aT5a01TCPWbzt3Oz8bPyiJ92XwHNFQSN9ou5X1kF7urArS+/F+09j6LDcUNFJbGI
	=
X-Received: by 2002:a05:690e:13c7:b0:66f:8255:9f3d with SMTP id 956f58d0204a3-66f873db9b1mr559397d50.7.1788190565194;
        Mon, 31 Aug 2026 08:36:05 -0700 (PDT)
X-Received: by 2002:a05:690e:13c7:b0:66f:8255:9f3d with SMTP id 956f58d0204a3-66f873db9b1mr559344d50.7.1788190564555;
        Mon, 31 Aug 2026 08:36:04 -0700 (PDT)
Received: from redhat.com ([2600:382:8519:3f74:ab6c:bb55:e9cb:f8d6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f7efc9dbfsm2062227d50.9.2026.08.31.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:36:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:35:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <apWfW5ahiYagw0OR@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Geert / all,

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> 
> Geert Uytterhoeven (45):
>   clk: aspeed: Make sure clk_init_data is fully initialized
>   clk: at91: Make sure clk_init_data is fully initialized
>   clk: bcm: iproc: Make sure clk_init_data is fully initialized
>   clk: berlin: Make sure clk_init_data is fully initialized
>   clk: cdce925: Make sure clk_init_data is fully initialized
>   clk: clk-axi-clkgen: Make sure clk_init_data is fully initialized
>   clk: cs2000-cp: Make sure clk_init_data is fully initialized
>   clk: davinci: Make sure clk_init_data is fully initialized
>   clk: fractional-divider: Make sure clk_init_data is fully initialized
>   clk: gemini: Make sure clk_init_data is fully initialized
>   clk: highbank: Make sure clk_init_data is fully initialized
>   clk: hisilicon: Make sure clk_init_data is fully initialized
>   clk: imx: Make sure clk_init_data is fully initialized
>   clk: ingenic: Make sure clk_init_data is fully initialized
>   clk: keystone: Make sure clk_init_data is fully initialized
>   clk: lmk04832: Make sure clk_init_data is fully initialized
>   clk: mediatek: Make sure clk_init_data is fully initialized
>   clk: milbeaut: Make sure clk_init_data is fully initialized
>   clk: mmp: Make sure clk_init_data is fully initialized
>   clk: mvebu: Make sure clk_init_data is fully initialized
>   clk: mxs: Make sure clk_init_data is fully initialized
>   clk: nomadik: Make sure clk_init_data is fully initialized
>   clk: npcm7xx: Make sure clk_init_data is fully initialized
>   clk: nxp: Make sure clk_init_data is fully initialized
>   clk: pistachio: Make sure clk_init_data is fully initialized
>   clk: pwm: Make sure clk_init_data is fully initialized
>   clk: renesas: Make sure clk_init_data is fully initialized
>   clk: rockchip: Make sure clk_init_data is fully initialized
>   clk: samsung: Make sure clk_init_data is fully initialized
>   clk: scpi: Make sure clk_init_data is fully initialized
>   clk: silabs: Make sure clk_init_data is fully initialized
>   clk: socfpga: Make sure clk_init_data is fully initialized
>   clk: spear: Make sure clk_init_data is fully initialized
>   clk: stm32: Make sure clk_init_data is fully initialized
>   clk: st: Make sure clk_init_data is fully initialized
>   clk: sunxi: Make sure clk_init_data is fully initialized
>   clk: tegra: Make sure clk_init_data is fully initialized
>   clk: uniphier: Make sure clk_init_data is fully initialized
>   clk: ux500: Make sure clk_init_data is fully initialized
>   clk: versatile: Make sure clk_init_data is fully initialized
>   clk: vt8500: Make sure clk_init_data is fully initialized
>   clk: x86: Make sure clk_init_data is fully initialized
>   clk: xgene: Make sure clk_init_data is fully initialized
>   clk: xilinx: Make sure clk_init_data is fully initialized
>   clk: zynqmp: Make sure clk_init_data is fully initialized

44 / 45 patches have been added to clk-next. I took it all for simplicity
rather than everyone trying to cherry pick just their parts.

Geert: The only patch that didn't apply was:

  [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized

I didn't look into it too much.

Brian

