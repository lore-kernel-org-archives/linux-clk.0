Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603081;
	b=rumOQo+HakyvTxNqt/RG+3rWKwhA1yHgPxt1DgCt+dsIrEXcf/nWrviKdV70b2tRZbIp
	 M3bqf/ehgapBJgE3WcyS2AxZOnd9ZbCCBlSkWoJM4syycTGuUvpGgziLhrwvSlAmZcoax
	 fpUgnL9ZHg05/wiuMiawJ9hYwVTFqX871It5EvgGw7rgre7j0dLLGQu77t+biOm3GUz2T
	 3ztGVgfHWAMYuXwVJvkztQxE98eu7T+eMn746cTmVKebisX/T0/RyFu4TPYvOvH63chTd
	 eVgU9DvirOtufb/t/jCTTN4mkBoDGxg6QIyyhPN8qE6afXU8vsiyHlPyzWar5EilW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603081;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZBPooVZF7uW7h0CXKjSkh1hLMir8fagB3w/dmrCkhus=;
	b=XpbE5+1nexvxZN2wQw0Gc9rGkBt42vYY8biDokTveQpMdhmYVKh37v13CAKwFV0AuOs0
	 E6ekHU2Q6drs5dwU0kJF1DaeNMqk4Ujmi4nm+LcWu542JHS3DmJoyqriGhswtu3QZeciD
	 ZNWOml5vFKc89tjODy/gZmcMFd6tTWdujce7z2xgamg2hhZ8GVKuvvwHZEVv94+4C1yWC
	 MTIq4U5KEaT/pcdfhSdb1yqrJO6hqrWV0RkPDYh+a8OwEgBi9gSXbBEq0GUrZDsUphiLI
	 sAtw3sdlr+l686Vde2W/dTUanlLUVPR+eljbVzUYMNJfLLwbXA3pZHy8CFCRIs5tTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiokbftF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B06606A336;
	Fri, 13 Nov 2026 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiokbftF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684421F000C4;
	Fri, 13 Nov 2026 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794603080;
	bh=ZBPooVZF7uW7h0CXKjSkh1hLMir8fagB3w/dmrCkhus=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IiokbftFqWYyXeol3xATSCDxIUHZKARN4+7z5QiydgwNsvKvwABMz5NiQO8cjupjw
	 XO8mfopnCNRJIIHnACAebvOYJfaBsS5/LBKmIu6aSimzPpPzuXRoatfshVbCRJwJI6
	 KewI3xkXRaFhzzoU2m5dlUXw5sQ1OxEGHmjCo4x1V7z26njyTlDErhmDAnLfUmz3Ei
	 bb+uB4TGfsjuxei5lszsJKarVQ4VbDlCD0GW9gZ8WLtVypdUxi5UYXlNACs/cUr1Ce
	 8W7RoKQOxJWB2XfnUE/80rVmKioyxF/GbUEbiiTspSBXdXMZhMqc+zPgYdAPDqMMsL
	 PzPSO8h/6G3zQ==
From: Brian Masney <masneyb@kernel.org>
To: linux-mips@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
Subject: Re: (subset) [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
Message-Id: <179460306211.1364508.5876481329838567672.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:51:02 -0500
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=451; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=P402GNEHfaxpfMi/MxGxFJiW//x8dnoxBvd4UZRXQv0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+VzjLvTJ4beS7ViHtiFRa+MIjLUEx3HZ79heUbDnPH
 vDnuGNoRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpADdZg5FhiazzRu+SgJ68Rbz/
 dijqtnSu2vTd83OunHWXafIsT847DP9LNNMnxD17lLtaRyDuRtyVPZs4C5kVSnSkE7+sN9ZaWMg
 NAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 13 Nov 2026 11:08:32 -0800, Florian Fainelli wrote:
> MIPS: CI20: Enable SMP with two CPUs
> 
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
> 
> Changes in v6:
> 
> [...]

Applied, thanks!

[1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
      https://git.kernel.org/clk/linux/c/2c45b7e1e2f7

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

