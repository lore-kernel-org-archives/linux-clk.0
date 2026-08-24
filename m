Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C2231832
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544384; cv=none; b=ZVYpAPqSxuqWgPmRc1l+F1RghJi98NBsdbNZMX7ReRqgmL6z2kHDCKpOlI4WqB1edwJEwanOpMmRZiLy2hqzFx0q2D+lcymdJi3Um0iy+9oj4u6g0gu0AHySFqrJC0putwsLf40vqCiBGT1itNsqAu0jKsaMYcxEqhGjdVYfxQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544384; c=relaxed/simple;
	bh=exbFruRfa5/z+uGWp84fkhkOcBsK93Ejj4V0SsqYGRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKiJ6X5noYmrY0wGWUty6FCh2hBt5fcp9qSYR8kGZLsqioavyp1TTnqlYusunk/12+xADj9OxRYlRGgnxtqos4G13VIluIaKYoBOjXe1yBMg/LznqoNXcZ8+uq0Bl53ncSEleCJCW7ZlUm+0Agqpfvw9C3ZHusvEMBjZl0XsNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1Pl07nJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1Pl07nJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2387289a12.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544381; x=1788149181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=Y1Pl07nJEBvMARxJYsezaOe69gegq+UiW5Z2zU0UAwGBkNYAPuKMTT/dhin/waNGGH
         QbHiRSomwemUYLYozgmmRQrG/2wPEsTAuR7tioiYpFQeVVduqt8lJoR5QZ3M/6PeR8mW
         iZPhuMYfThzlQFM24MXmSs5fBO8Xk6t1LZ732CVlMYd8QAdfZd0uvCs9HILUakkKgHwA
         vbtHYyPGtJvJlgRVelyAgWcuwGjQYppA9UPnp92FqGe5x44wsceiz6YGiJDwNu6C3nDe
         WPqUtygQskXvci4sU+VX/9quf3JMDRDGVAu+bHuhks5QBKHKkNKDF699A/XiY/+YxiLm
         fS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544381; x=1788149181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=Zn26DNgJkY477/Ywrzw6OTWn4y4LK6GE2drL5zVi9FJ083fPq5fota2C/6aqpOf0No
         Z2qlbc/rZevZnvNM97C1Iiu+JvBWAAJJXzqA6pcu0zdfKBx3jFf6t20jSMoyYkTzwoNB
         UzCau5h9fP8aHqfFsClG6FCIymwsI6jbPuXLJsg02F43bAhaBHMDzCw563ezRCnwJxYD
         pCXz1guXNo1wMNtdUTsVrVgtZmt3dQ9o81BxXQIkoLV4WoGeZfnaAUditEP/ShOUuzt0
         tBWf6yu/kXfJ5sJrMIEogfG0h35ky59jdUqIKxVW1kuufajQLDFA0HOmlRpAMRqKpy0I
         +GAw==
X-Forwarded-Encrypted: i=1; AHgh+RpTsu37p1wnL++E3WF+qjkVMTQ5vN615cwRrbsrIo8cbkRcxA4UNcgNZxuYZ36qlY6m37PCvM7QmbA=@vger.kernel.org
X-Gm-Message-State: AFuF++nffC8mIBQeKf1lSxu8w1q/AmvtbjSPCGvS1oVE1TcDr/1j+dRz
	OKSD1+ZEGuevp/FPAiwhngCeTnhoGfQrsU6JjlAhhe82nargYtnweCCnDSmpd+hiUnk=
X-Gm-Gg: AR+sD10cuT6R5dEIGT4o3aqCg6R8mlONi/AKo58aFDw5wBJ9PPFq5AbqOf0pDnN6ZCd
	B65qorTO7syQA/T6f/XBCNCovy+OlLuluBlCfWgt/MOqpyQ9SxlYSt0wId5rs8lpNWreJv5Sjy3
	WXA7em6XCbPamgQdkAcKkGfi2rj2ehnULNw+nu/saHwGr6o9RaRkMMd/4zNcmp6Nxp13ZD0hOAu
	0eVgcR8onPeXjjLs3XvdD4ESbo18V2OUaYyBkGxTCyKKZhNNkX6vZK37a0H6DGUSM/+zwqPHLnG
	bmKe5oWQJFgWaXiR/Mi++JSl9zWVua7AkYN8rlQyTsmL6/B8Z/iKuEKEK3hPUuwKQLNrjasH2lJ
	h2V1DFR//KW6qkj9gyldUi8IkbVidx5lrqRuvNaVCEGBgXkDmkx3VaJv7Dd3LALmk7TQYyYZU5Z
	ulboQ4IK8nPunAN/jYEYmpEWxvDnL8iz/2T8G223EdEhcf4SkeYbe+XyYLK2VvyTQ=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
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
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
