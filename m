Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF8D369D40
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584462; cv=none; b=J4+Oh1mMCABKLZY/UMH6LK3S7zLt9l+WFZn+vsaqWpIEWHP67ldDWdgRG/eMG/N86yDcki+kTxKchKEvTIEWVBaZaNcmlXlU+VSai2lVlQyN2VI28MctJ7gB0nWEZUXj5Qr7ESyNyKZXywyK6bUYsF+/zkziz+VvYPP9qQ71amU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584462; c=relaxed/simple;
	bh=PMHzlusqnjEcUolJb6Rj0ihhVcm0EmxTzAkLKIuEEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnTzGxiydLroytY02yfVvwREE9BqMq3VnNqLZt0+hLBMfSlIDgjWli913BwnBMXTW0I2ZRxvZ8+aTbyftyIYukFOodJb0SWWkuhWUyoPnrochV4+MdGYtYRXe3sOJG+0jsT438AmDmNwDrp/pVjUEZXH/YKZ0T+hL9KV9CseIJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQ1ywwYh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oF6MRzeN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQ1ywwYh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oF6MRzeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-lrz469o6OKyoQygo96Uh9w-1; Mon, 24 Aug 2026 11:14:18 -0400
X-MC-Unique: lrz469o6OKyoQygo96Uh9w-1
X-Mimecast-MFC-AGG-ID: lrz469o6OKyoQygo96Uh9w_1787584458
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7b3adda4so37789411cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584458; x=1788189258; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=oF6MRzeN395dZjNy8pcRfe5CseOWW92MPrDY1ThpTRLMzvYYjy+3PRbvAawPZ1pjT7
         nickfnFlfw7zqdwMreayuFSWA/BdXPnKQ5ur7Vt2LNdGqWec7csfG7C+KW5I5YTTbvnJ
         wnsQo0brNyHpLtnN2NhkhmM7waHE0ALk+ph5o6+IMVKir/hWxQmyrJ3/EU5R/1ksogl/
         zZRGmDxWcU0WEK3Djou89HObMtmnXGU44+jqUqTaYrd3kC9yiwIVlYYDFDIFiZiG5tc0
         li6ZkXoL47J7oMQzXguZWOtZeQzuAKjO2opkYBLpMT+pIRP7RD+MXE0ZE1jZZCp2f/8x
         sSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584458; x=1788189258;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=Xkmm9ZcSjCIxC9by+7ewJVjTwBUFnyvLGqWdnUnNTnRpMp6v1ctRxuhC1jDwrwPMyF
         jiwAnAsDUNncguAj1wT89yG5ylzbfkzgEShBp+gIp4fllS2UFsBx5IL+zEePvoX9C3gw
         qPaoFgPwKDMVPk34RVZ7fVhEiKWctiuxVY6x3ay78XToG7GPA1Qg3/ruD6xLXZWxX5Ov
         Nn+/iC6gIQYZr1qOvBII2zingd8+zh/2Ik3ZCed3vhYE1+trkBYvBtyjbexdkb/QP+i0
         /MACoxHl9KA5xw4uZ3eh5V/q5YLgGlVY13rvJD9D9wp/LqLLtwIWndPUbtVwEtB4apGw
         xKyg==
X-Forwarded-Encrypted: i=1; AHgh+RqdR51QNHOegQ7eW2P6LGnysrsHKT89bwBC17kbDMbP6jx0xMBhBDZUArJc+myef4smfI7G377PgqM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZSzaWwUrCo8khJ7icY9dstssOjvdd/51ie/cQ2Alzb2bpqAmc
	z7Ne7dzmGlhmcpvMU4o3HXamHAxwbKYO4ga2p5oHemrKISFnoQuya9wSZYuRvfuMnQY1rVuAFap
	69PzOA5Ex2nugK5k7ylZavKQQE8WSE7uf5Xu4kGFK2zlR65cMWkipcFKiRyjsIQ==
X-Gm-Gg: AR+sD10r6697c11BksZF9GRHNHJIhKh/KBZGuPYSfNUfMptHnOY5/pL5OPTYrIYTvGl
	FXbyCM5iTwVDk+NR0Bsldk6d2Sg/vgIaqvG40dhSTe5SCEJURkNmFApRzE/T0syA9AYdLHmLYj+
	tkUjVznQf+Z5ig2ujvH4dOhzJWQPBn2nDgiXESEcx1H9WfWSVKSRoQYRGXjnHveJFwflVaoLAYh
	OQ4hp4BrQtK22sDDTBwz8uJQA7cLAvia+4Yg14eAIEaYMPgqlOvlYI/0juYTtOhMO1/u5XIabww
	NizihDblPv5hWdABLFYNgT5zqXDrkaHp60cIhvFAPDxRloGDUOtds7ENw/MlxTC7wW03pNreZq+
	Nua83XhQq+eMcO63OH+ku8xNoKrJVYaiyr4Y=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260846136d6.4.1787584457418;
        Mon, 24 Aug 2026 08:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260845166d6.4.1787584456812;
        Mon, 24 Aug 2026 08:14:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a82554sm64013126d6.45.2026.08.24.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:14:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:14:11 -0400
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
Message-ID: <aoxfwycOmEzLzhEU@redhat.com>
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

Thanks for cleaning this all up! For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

