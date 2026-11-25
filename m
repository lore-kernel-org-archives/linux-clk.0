Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607608;
	b=eceH+dIRXThuXsvBtMcetcwf/QG/XxXDo+0SNxReK1ARuhlp1IdQzdZTLC30SJtaTW3S
	 U+uFOKqPXaeZNKc561vwESMwObcsI+3RcsL8+qDQEzO0cJGku4Jzmkyg6f8OPNjUSJrsb
	 h0LHdVZ7Xvhc8/Oi/TOj/0RgJ5TfVF5fRxlG1sn+qNN3JPoCqbhLsPKqj6MasNTmQrx/J
	 wCSL36xx67uBhZ1BBDKdOU7OLDDe1WKSNEtTUkWPty78NO/r273yBwa5wMYP1kKfWa5eH
	 tfy2w4FBLrKHVpeOg34bKn2ThtGB+yWa3l4a0P1BVdM+UmthtRJv4Q6lhye7u/LRtMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607608;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mlkDCg9kprZ62DwlXQd8yd+ADgwJpdD1CpbOrg8ZjiY=;
	b=OqR+FwsHHF7Ifbz848AF4pOjSuosND+F0YJzOXktLRtxXh3EuDbXqxTLyB3fIGCFMGSs
	 rpGTYxXfZgehqGgoqD3wWf6tO3d9G9n1v5/iadwNR7+m1OCAAUwXaNHe9JGiSo38WE2bS
	 0FRMtUc4B0jhKBOTaDK69hFzsoFfpl5gvB3LXBs0xHY03ABjEgs6ArED07x2xP5ywO436
	 m15ncaTF5inFvz58x4vg+dRbemA8wTa7LyVe6F0Vx3AvrXCTY4RXlb8/RWGStbxnLViLh
	 9B/c4DLko32oCZS2OFUgl+H/i2WGTrT7QwJfcjc2eBD3ILacERVzv9rR0FPhRlTDkvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=C8qj2Rj+;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FC606A332;
	Wed, 25 Nov 2026 11:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6FC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=C8qj2Rj+
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 32D4E45844;
	Wed, 25 Nov 2026 22:53:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795607600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlkDCg9kprZ62DwlXQd8yd+ADgwJpdD1CpbOrg8ZjiY=;
	b=C8qj2Rj+fzKog24buY1PaEC/j3+RQMketNzOBNyqLPWLhq3UVkUmXjPujBBBfT32+Ki+0s
	2Y6k9BKv4Xh6Cgdk4eNvSDniSQhzK5oRY5aaw8V03U/XkGaHoA8oZcgvXvXzrrwIhtpckP
	D7e+5pVv+l6s9ImcAxTvntnCi3d2XynmKc4m8EmxMU3tg72jdrGMswbwvB8ygFYJyyf1aJ
	HUapdsxbhWcfElKIXpTDoNlNeqEAEO3kDjc6dUakyf3z4+fSNGVWbQdDDxumfm/rnqxnz7
	PKxPPKekc+UHvNn7g/4bNwrBoIOeaE/YpnGdebkwT26eR7KAiLcsSJcNrm1rdw==
X-GPT-Reason: The email is classified as personal/professional
	correspondence because it appears to be a direct reply to a technical
	discussion. The sender domain (d-silva.org) matches the recipient's
	known personal mailbox (alastair@d-silva.org), the subject line
	refers to a specific technical patch (clk: sunxi-ng: a733), and
	there are no phishing indicators, urgency tactics, or external URLs
	present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Wed, 25 Nov 2026 22:53:20 +1100
Message-ID: <20261125115320.3692954-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

On Thu, 12 Nov 2026, Junhui Liu wrote:
> static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> 			  0x5c0, BIT(16), 0);
> ...
> static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws,
> 			  0x5e0, BIT(29), 0);

While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
link-up and DMA broke as soon as clk_disable_unused() ran.

ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
bus-msi-lite0 is only its register configuration clock. Referencing
ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
shared fabric, and gating them off breaks GMAC0 DMA.

Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
driver?

Tested on OrangePi 4 Pro (Allwinner A733).

Thanks,
Alastair
