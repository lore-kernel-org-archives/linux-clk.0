Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEB8377EDC;
	Wed, 13 May 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668670; cv=none; b=nG0DY+dUAeVQLxLX0eODMARtdPNDii+kFwnFbY77y+GpfRaAMcnO7dKNDl+DLXq8NZQhJryYsDPqnXnaV9OgE3pq+mmfAb8PoJ8AJnHVopWuLoUw8PmR5C3cqETM2jwIwInL4batVQsI/v378gkfTcHDhkQkGEXzLqQN2lzfSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668670; c=relaxed/simple;
	bh=Pvp/A8Q3J9EXqnaOUf3d2STobdqQogNYo1onbEPi5nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+nKcCiwqBUAum4jMSs86J8nNQYWxd7jnqlkDf6Qixn8hEkmjqUKC19ErI7FPvtVk1kcCtYQzUugkQeONlrFRO7Y5M+sn63RL2093Rl5PLTD6Dnw72rnwkzMKaba1Gn1ZLuh81nbVayr383ZKb/1uqMEnxWE1zg+5hxyDqncTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XmEQNcMu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XmEQNcMu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xfLB7UCd1FxhnipHP74KybOFTqY+Qa3iF1Dpbphypnk=; b=XmEQNcMu3kYeKzGVmVJg2R7QEt
	ccGBPq4XrtkEbOK90ewHWnU1SnCWIrGXz5gPuKSBo0ralsj5l9THdY5y3m5m32krKfQJ+x2amR8Nt
	qRSpYebR/eXuyjG5ova73aCb8kHqdTyLtGNGAsgZIST8Qy4o6Q2Ou+cPqX8YBW59FHQaZG0yyVlKX
	yDIckFXK6V9Hpyf/Lur3MWYcsvcqLm3FLU9cXRxo6GknBL3IRmjqwtkBmzwkWCuDPaBlmggoEVbbc
	Y/IE9kHvWbrbPmKry2N9D6fR4g2tW9VZ93R98Qu2F0LvGYpCrmbMuhNG4dXl+nW2yaq2TvwJcKEwB
	zW7U6hMQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Date: Wed, 13 May 2026 12:37:13 +0200
Message-ID: <177866861364.141763.5731097553415107944.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509003602.956186-1-rosenp@gmail.com>
References: <20260509003602.956186-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 May 2026 17:36:02 -0700, Rosen Penev wrote:
> COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
> Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
> for the parent Makefile descent instead of ARCH_ROCKCHIP.
> 
> The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
> so this exposes the existing build coverage to other architectures without
> selecting the Rockchip platform.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: allow COMPILE_TEST builds
      commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
