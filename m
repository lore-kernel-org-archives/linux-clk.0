Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDC3D79E9;
	Wed,  5 Aug 2026 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963595; cv=none; b=rWHBqdmKsoIMq2Edhkpj1HiCfW52wwIixBVqQMKJo6r9kbfxLVKiIpe39uvVOugKTiCsRhP0DBu6ibC+M82BAHfZR5sI6NkkoPTYzJYKxiFED7QEoyPFeZxOsAeF79CzIltuWnHq4GQtaTGvveMYQFn97OkcbB0wfeOFPZjLydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963595; c=relaxed/simple;
	bh=YJMVQYM6oEb0xsAMlLHjVGDoFhJSzkW6jN6zlawxu2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lC1REFX8xAIUz7x7sSAogf/w0wufEHqeViBhBV9G4fTAAnbNjt5GK84e33yY4S5MFnDyeMHo+yufjL1QvH5XXO8RKPSVjCN2H+Ej+s4btlyhQNPerDtFhJgEz424Q9xWUD9JMHIH9i1VDuGXxnNR/CHwYRs0FmNeHdmWq0YAaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EIAN45Gi; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EIAN45Gi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Y917TBfw+rB1/3romxdRxldqdx84UlilNMdHySMnM80=; b=EIAN45GiU5Uqm/bzqShmqTP193
	QkB/VD0SmLktjmYTukSxuWly1l8Q3qeaUWuW6KgpglE3DKG+kjtyAUNyeWsEaQRdXlslow9gK31kx
	f5/DqNBs1ZqslCso1XekG15s1SnXlDWhfw7KZAXmLCAFpVq22dTiJsDKNBll+MSzLcCmn92aB8UV7
	Y3Ek76NJA6V5UrMSo/aT0i9Cxn45NHgzJXlTyoNFcRZJLpjiMotNfnW7CBVN54myIN/k7PLaLFVbN
	ioy2K46s61mD/EZjS97PnM0qS5Q25UzyDhhZ9JYE/gxEbdbuJ8JbV0sGkWNFC8Kfjl0QiOA5/XrcR
	rLUV8zrA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Brian Masney <bmasney@redhat.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Wed,  5 Aug 2026 22:59:16 +0200
Message-ID: <178596355286.2517015.614227776699371944.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 07:35:47 -0600, Simon Glass wrote:
> This series adds initial support for the Rockchip RV1106, a Cortex-A7
> SoC aimed at IP cameras, and its RV1103 package variant, together with
> the Luckfox Pico Mini B, a small and widely available RV1103 board.
> 
> The series follows the structure of the recently merged RV1103B
> support. The clock driver is ported from the vendor kernel and is the
> work of Elaine Zhang. As with the RV1103B, no resets are exposed yet
> and the CPU pvtpll is initialised but not calibrated.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: rockchip: Add RV1106 CRU support
      commit: 713e4d54ff7369b8118f91e98a008220d60b2a5f
[2/6] clk: rockchip: Add clock controller for the RV1106
      commit: b520d056f2619972ad09ced2985b534bba4f9599

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
