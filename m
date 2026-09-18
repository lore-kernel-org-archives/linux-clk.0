Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288F54704E;
	Fri, 18 Sep 2026 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712223; cv=none; b=lpwSH6I37jyHKQW+pQUavft8K8DRgh6CxrNkNXo4u6TRo4cqz/mHhGKsVWnyYHA5fJDlfbAjIu+yLwgRr1XPWRi4LlpdqSXQ4ZgV06pUCNSTjwfThWa1ZdQMocZy/yLLwztc9xF0JSQRyyF1YXxqgzIkLjRiizIQw89U/uCq8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712223; c=relaxed/simple;
	bh=GJu74okmXjBhqnTIOGctvx/pb2xEFT1u3IIKkCANtSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7NMWWvjVtOntShw8bcDnb2tyMT6gzpWfydfSIVeJxqm2yRxubJvHoAX77K00wpAQP1avRGN1kD/5FftkGQorQ/3s69e94dxeS5k/37yvtyL1Q19QVqb2xDNZXVad5sT+iw2LaxiR0vQERDc1cHZJNeiwt/oc41xc9jgUpi+FRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC+VO2Ft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hC+VO2Ft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3305D1F000FF;
	Fri, 18 Sep 2026 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712222;
	bh=B/13cZeUrOLEzs/U0VXbyufzLI/X+a7vJxST3/Q9H/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hC+VO2FtDKbfS2UHZn7KsHJfhAMbfycfRebcPAyoit5um1I4sEqs1B3s/d7QsmYOx
	 /uPdeYvBgduMlrxD/q5Qx/yZmnVjrncmd9Y9Pju17LeWasqH1HIMdlKoWQt5U+07Hz
	 itUI4J2CpMvUEEBQ/TG3dnLcJuv6Ss41jE5ltAkW2SHN1CaJfJtBo8gwaiEDocZ2u/
	 4YSO3SLQuAartQeYdD1llGHXlMPFhoAhE1udDqkdlpPAbhR3AS4sCi+2T9sNWXk37m
	 4u2pFM2ozWD9atAEq6/Rf2uBnfPTpaGO4ftBf4KHUAopzadDfZD5zCYKSdh+cDicgJ
	 SHLy28DKe56aw==
Date: Fri, 18 Sep 2026 08:16:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Message-ID: <20260918-futuristic-mindful-waxbill-21fa2d@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
 <20260917-mutant-chamois-of-competence-46ca77@quoll>
 <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>

On Thu, Sep 17, 2026 at 08:34:18PM -0400, Joshua Peisach wrote:
> On Thu Sep 17, 2026 at 2:51 AM EDT, Krzysztof Kozlowski wrote:
> > On Tue, Sep 15, 2026 at 05:32:09PM +0200, Michal Wilczynski wrote:
> > > Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
> > > 
> > > This device is a child of the starfive,jh7110-hdmi-subsystem node. It
> > > functions as both a PHY provider for the controller and as a clock
> > > provider for the variable pixel clock (hdmi_pclk), which it generates
> > > from its refoclk.
> > > 
> > > Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> > 
> > While I appreciate other people looking at this, I don't think review
> > here applies. It was a blanket tag, given to the entire series, with
> > exception that it is from newbie, thus I want to ask: was this binding
> > REALLY reviewed by Joshua?
> > 
> > Are the rest of the patches actually reviewed or just "looks good to
> > me"? I see no comments from Joshua on v3, v2 and v1, which is usual sign
> > of doing review.
> > 
> > 
> I commented on v3 saying that I would test if I could. I don't just

Testing has nothing to do with reviewing.

> throw "Reviewed-by" on everything I look at.
> 
> If anything, I've been trying to be more honest in reviews, and only
> review ones that I actually care about[1].

You gave blanket tag for entire series, so I do not get this argument.

> 
> If reviewing patches isn't a good way for newbies to start getting
> familiar with the kernel code (especially a NEW driver), then I don't
> know what is.

Writing code and receiving review is something for newbies to start
with. If you do not know kernel code or bindings, why do you think
your review is applicable? If I try to review design of a post-tension
concrete bridge, I would probably learn something. Would my
review apply? No.

Best regards,
Krzysztof

