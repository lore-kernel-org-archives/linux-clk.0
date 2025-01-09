Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446C191F83;
	Thu,  9 Jan 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441744; cv=none; b=kSQZR4J/fcn2eMyXiz/fB/GDg68wK4TCNP/WE09bmsDugWXR06FTj8FJ62cfhfl/abI/ra+KxeTOy/C5zlDBB+fjT+SjXuXq7eWoA3z6cVfjFO/TJwGzVsIzo7kdDyQxPd6HhyxLaWExcm9PSI/2B5nGInaL8+pfJg1+jGblqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441744; c=relaxed/simple;
	bh=TJdQgKasUJiU9oU5FdVyHqy0elp3KTJnN34FDJOqkws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WO3Z/ycD6GiqTsAGcngXWOu6l6KCLujkWutvhhboAH9qw+xyZPJiCZPXpA3pmsizXDMMppl/q7mFDOWFPZGa/9QCJBH8p3gkfJ43+YfsNaKFgIIjrBgdMhKdLjdQ0Z4Wu91dEVUMEBB7yrq0JGcVQr2FJ1yqSAdJeHg61GlGKK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ALA+qVOY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ALA+qVOY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yG1bQCbW33R256XkWNU4fJepnPv28LylkVyxqX0Jz9E=; b=ALA+qVOYXRcMdnZ9WJcVHI/pdj
	mUuifzN0CluQdS4IaG76LIDPyrepX0z41bDX3x7oz66Ae11H3PO1ZvvDhtTyquuF4oGX4RbvdBD7s
	riGFg7rZa7Y6LWQGtTXK1FJ+GNgGPdn30pt+ms2t20lUjVq8zHIyFh7WpS5jbejJqA7pJvptC0oXR
	It8AaQNL9+bFhh9AOuir5B0Bq8gsDmYN3YRmODlHMt1IquRM8IXs4fbcfdZr2e4MQtVd7vgLgWnp8
	19v/k88JRr4F0xpzaINi1MlvgDXP95FMfGY0wlDL8VPFQmxz+pdJnRveV3OOJjcXIaNUO9Ggx0sNp
	SVJ+hQQA==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoj-0003hx-RU; Thu, 09 Jan 2025 17:55:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v12 0/5] rockchip: clk: add GATE_LINK support
Date: Thu,  9 Jan 2025 17:55:20 +0100
Message-ID: <173644170626.2899934.2363636508136913470.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211165957.94922-1-sebastian.reichel@collabora.com>
References: <20241211165957.94922-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Dec 2024 17:58:49 +0100, Sebastian Reichel wrote:
> This implements proper GATE_LINK support following the suggestion from Stephen
> Boyd to use clk PM operations by creating MFD dynamically. This required some
> restructuring, since CLK_OF_DECLARE() is called before devices are available.
> 
> Apart from improved power consumption, this fixes the runtime errors from the
> pmdomain driver (failed to set idle on domain '%s'). Last but not least it is
> a first step towards reducing usage of CLK_OF_DECLARE_DRIVER() registered
> clocks, which should only be used for early clocks needed for the system
> timer (see this talk from LPC: https://www.youtube.com/watch?v=dofbbVuIAPk ).
> 
> [...]

Applied, thanks!

[1/5] clk: rockchip: support clocks registered late
      commit: 9e89f02da718bc912f7f253b58804d4a52efed30
[2/5] clk: rockchip: rk3588: register GATE_LINK later
      commit: 33af96244a66f855baa43d424844bb437c79c30c
[3/5] clk: rockchip: expose rockchip_clk_set_lookup
      commit: fe0fb6675fa48cade97d8bcd46226479c4a704df
[4/5] clk: rockchip: implement linked gate clock support
      commit: c62fa612cfa66ab58ab215e5afc95c43c613b513
[5/5] clk: rockchip: rk3588: drop RK3588_LINKED_CLK
      commit: e9cdd7d6cf2a5031a968dc21f4f566101b602150

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
