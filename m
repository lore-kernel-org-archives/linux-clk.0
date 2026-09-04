Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9723311C32;
	Fri,  4 Sep 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529501; cv=none; b=WV4JF9OiqKmaf2N8G/xfkL4FZIkDPTrGw4GhFZXS5eyd2Q9L11ol8rbnuiNjwCA2cju9FZ07yjPiY41O3r5aO/6R3PoLzQvxQ/PF+yYSKBHnITX/rxzTtwcMm5TwtksCAwsfAvkkVc5gRUDdGx81RH2A5vHmmCK/FuuhU4PUNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529501; c=relaxed/simple;
	bh=xbUpGSCx0twqvK2uYMhh0Z5HEmXOnKyfgNEX/KAG5Rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HLFn/Upa4oRHe5j222FePtRhPHnbFu6RfU04vls6Jgz8FXq+9kxmtefmYe3q+Mr29exdMtCVConWqH9ycyE3IAw0snA/BbHTmWRvXoo7R/wObGGxQ2cRl7/u1sXk/zMAfNzWThRfid+ix+Yo0xXfVE98oRgfcGtDkhhUxF7ZOe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2sohWUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2sohWUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09531F00A3D;
	Fri,  4 Sep 2026 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529500;
	bh=xbUpGSCx0twqvK2uYMhh0Z5HEmXOnKyfgNEX/KAG5Rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n2sohWUVbJtultNnzRI8n3i7cqBG7Ys9UHIezllEqyWvBgu8tyIJzrNChxgmGznaZ
	 pJMFmO05zDTxWy9L+MOqlZtfqyPllls3HQigZAzzZN740D+BcmMTjmNMvZd9toQjvf
	 /z86e+M91jObN7SLeNIZ8OjarFc59XAIhHn5AOqzF2XO8FDHwuiqSg57u7RXq2hhO+
	 bStO+h6dZxKNVodvxtxUwQiyOQgbF5A2y5DljJxGDSyDEgdcI/6MZH5pcFs/kHZXOh
	 dNkZWH0U+lqWea0DEUlsuHAu4ed7ftzGk5fZwcxQwfHXG8P2iuHAotdDjpO+cmeuIp
	 hB1Sd+j3G79bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, lee@kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
In-Reply-To: <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:44:59 +0000
Message-Id: <20260904134459.C09531F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
> the rate they carry is ultimately produced by the HDMI PHY, which
> registers hdmitx0_pixelclk as a clock provider.
>=20
> Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> reaches that parent, instead of being clamped to whatever rate the
> parent already happens to run at.
>=20
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D13

