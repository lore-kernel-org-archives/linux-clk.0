Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBC2E738E;
	Sun, 28 Jun 2026 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674028; cv=none; b=FK94gz/4IZPKHoLs7cE9fdyYDkrwAiF5kuWqB5j9Vac85ucamngbNhhAgBBp8SxtCuO6R5/+wuN4JiYxtdoBwkmLi70hjigGgh+7VA7/brefkjZ1my0848fNnvyGGtipEgFWQ14wT24Foy358a7VRKDcTgZQJBdgNllryMpo/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674028; c=relaxed/simple;
	bh=FCodNi6ty/cBlbv/zpTiMtH6uSClwLENQ++mxU89SqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH67I2S25uHby6hz9f9nM9RbDXA5sSJlGBxYjwWcPB0UERsPC0weCrn+qNX4W80CtSjUojtG2d0/J8xPI6/Xu3XpCPnRYNYeGOOrE3Osw5pQ9atIWooAVAjRiSvxFI/WpmaV7ZtxeNMDm1phGle/1qJrvCjTs38dOcRTZxXumWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Mk26meco; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Mk26meco"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oKHWu+eAIE/CZIjLM4PqfERbb2g3EF/Ptw0DlJwxfEM=; b=Mk26mecoq6LVnqwkG20VoTOT58
	yjzkv4G6vhY8fd4Ezlx75RVUft6+m4Fw8lM2iM2joFBRYdfWQSPAAgtBCz83xS/1CtIUAeLLhUUbQ
	c2nfEhhoUeZTH/smRNmwvxUdmvmvkiZKD1bDU7sFRQQR6qNPKkXXfvjtaxEs5FOVBvO6kzn/16Xr9
	arDNpj7OIB6/w6HxaX92wFd6Bfucp9EyZj0+NhKG0Z7gfY/6s1HdXdXNvZ8/n13X0Omk4SrDovtC1
	aGu3/HoWDX6NOjUexXyb3VI4VxlccYEGa0KLJtvZ+KE4ohZr4fotQ5DVtEilybUuf72lnpJSIrILy
	fxDzyZ0A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Sun, 28 Jun 2026 21:13:24 +0200
Message-ID: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624123914.1767374-1-hello@superkali.me>
References: <20260624123914.1767374-1-hello@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> No in-tree board references these gates yet. Boards drive the codec
> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> managed clocks, clk_disable_unused() turns them off at boot. On a board
> that relied on firmware leaving the output enabled, that cuts the MCLK
> and analog audio stops working.
> 
> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> state firmware left. A board that wants the kernel to own the gate can
> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
      commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
