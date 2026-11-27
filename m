Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815060;
	b=z6giBwB0suIqwxbPz0KcEHEieOsK50VtM105XzywyKGOh5mfXDaczI7/iWUiUG48WDLX
	 Dl33R4u1wiI+9MsLJHoKALizwbjjaD3vf951/HSvHhzXdDDI1mRD42JjViFfj6HKIX1xB
	 ZrbVo1MOlaUi/kYTTR/CizeIQCTmfBIzOVxYw0VZR9UI1DC9LH2j7julBNrxVWVngJa25
	 D9O56ZwnFLgpt2cri12wrjbKLokWAAPSBwIDojHnuX2v6nVlMEwffXqoji0QhQ3w+0iDA
	 r7nk7iqPIJkPwnmdVqNRTtMG/6W/sO8zQF44YUyty2bDcpjZfXijbWoE2DWukpgr0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815060;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q3m2yyt50RINKi6ioBAszyxO/hF+Qz9GpX0rwheQRCQ=;
	b=L30VgIvQHh8DUaGKoi5SQI7wUp4pA0+Y4eQ08MxXfwcQLxcB57S1Mo7Q/KBkG434D3Ll
	 XtQKQHBVNTwJu3ciQ0y6mGL0hSmG/8CUoF3k5chgptgK7QAUwuOTxLzJRUegBWZ6bB9pl
	 Y7jywf97fToGUQdO1qctfyjtcdO953PuHNmHbzdwOiZl6NwKoaEWR0pZypE+KV2ngU/I/
	 fNxf0QAz1FOL8BxjApJedvVcW0e7srwELGWrM1DsNNs6xHMRVQvt/crkhn+rLmPXvxd6+
	 NRcV6LgQQcalDrIS02CN3VcKfNGJljzKSg/wLaSt1tkmfECmllgPfW18NL1z8FRZELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e5V8y1Ur;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F238606A31C;
	Fri, 27 Nov 2026 21:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F238606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e5V8y1Ur
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q3m2yyt50RINKi6ioBAszyxO/hF+Qz9GpX0rwheQRCQ=; b=e5V8y1UrtccmyPxmIkUjF2ky3U
	exC1EK59wpjZe9T+uL8fDgx5yQnFLqvPPdf5wVpYR4AJDFvFarpaJ0we3NixMOBz5+Laf3+VkDQ7c
	gGFyGoHCP2domoIm+STqlYwwvxhnqjGKFJp4CATKCk7mjuX4buNRea9eF2/OCuvT5QKSOsg9LJtxy
	nBhWutwfY3LNRTLq8udK7VI8Xer4qBRRmVo6k5Yy53uJn5cAssMH+2HjAOh2r6o05sUCp5yAxDq/q
	iZx2haoFDURMSaUDE0TqY/u7XuVnsgsJF/a+SomX4q0VkDbQ5+b83JCXnYzlI8whw7zKYHkXjGKJQ
	7BICBRrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cwchoi00@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: add RK3588 DFI clocks and RK3576 DFI
Date: Fri, 27 Nov 2026 22:30:41 +0100
Message-ID: <179581499871.254621.2470437130945394639.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Nov 2026 15:52:35 +0100, Sebastian Reichel wrote:
> When RK3588 DFI support was added, support for the clocks was missed.
> This series fixes that and also adds the clocks for RK3576 as well as
> RK3576 DFI node itself.
> 
> The DT binding for the DFI side already got merged together with the
> driver changes today, so there is no dependencies for this series:
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
      commit: 76c1bc06e04007247ca47e45d7313c24ac0b2570
[2/6] dt-bindings: clock: rk3576: add more DFI clocks
      commit: 2268455f297ec61b42ab44dfeaf982d2af370255
[3/6] clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
      commit: 2fb95541b66c05384c75259f06d51efa69e16bca
[4/6] clk: rockchip: rk3576: add missing DFI clock branch
      commit: 8b8862a19dc62e1fd838ce3eafd43382f78d4d01
[5/6] arm64: dts: rockchip: add dfi clocks on RK3588
      commit: 6046a394edaff1e6f67911ebe4ef0f508a9f82cf
[6/6] arm64: dts: rockchip: add DFI node to RK3576
      commit: b4f857a1d2ca5999295247933d29ebaf3b5377db

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
