Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167926ED35;
	Wed, 24 Dec 2025 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613227; cv=none; b=g4wuP0aMi8fsZmXXs8pk9KBuEWkOOPON3aTuMfazNe1PXiFIm1Lx45eCmonfabrgRndaEySIfdcvAJwokcXoGDIdfTkywajCAvhzlAoHuTyezWSJ2r4HKI8Na+O0S50ZdBh5CV0WuxJvI3aRru+093QtuRRQ4GKqY/aORwzt4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613227; c=relaxed/simple;
	bh=jBtUeNJRO+RbhNPQJjWLbiBQiPsGJ9VvONJQVLV0Q1c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kaoOQwlIUIcHjr/qSODtSiYl5S59VPazY0CaE3fHc7APwgvBL0ubMGtlobTPkGa9fys2e0/Hcw1vQwgwB3gMX2ZkcnAZV7mbaY9dU+d/6pQzsfnMv8nEg1qVg49NqEb6l0uUUtVXDFwnU56NEn1H16X94kxSm6W+v6JVQUAgwvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7KSL8HL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7KSL8HL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154BDC4CEF7;
	Wed, 24 Dec 2025 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766613227;
	bh=jBtUeNJRO+RbhNPQJjWLbiBQiPsGJ9VvONJQVLV0Q1c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C7KSL8HLRTy1Rk1rIfQkwTEDk+GAA7eqse4JiJ11JBbVPOp9zcd+4E+g3RRAUbTs4
	 KinvoQ/FKT32X7ZJqskw6uFUnCH0qXEATSskCo7yhDmKB7Hm5uHr/XBb8jY2q5K0ck
	 jSyXCbdZO5E2aetjKXi/ns+jPd1X1ZpQr6og2NXOYv0RGZuBp0X4SeEf3B0TAatLnS
	 vMzH9uvgjAv+1qTEY3KS/4SuX9KN/B70QJ6ix/RhVGURosukgDjftpbxLO6g2WBCjS
	 gtOJesCpyd1vP8p1pVqS2UqZuOUAt8f4toWDUdbha5uTIJD/a17dQ2JKVFPXHvtv5g
	 uKeORvnnmAZyw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com> <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
Subject: Re: [PATCH v3 0/9] phy: convert from clk round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 24 Dec 2025 11:53:43 -1000
Message-ID: <176661322399.4169.14248756511703978007@lazor>
User-Agent: alot/0.11

Quoting Vinod Koul (2025-12-23 21:32:43)
>=20
> Applied, thanks!
>=20

Thanks Vinod! Can you provide a tag or immutable branch so I can remove
round rate from the clk core in linux-next?
