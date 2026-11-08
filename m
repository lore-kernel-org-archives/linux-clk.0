Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169496;
	b=cpBAGpSy+6c/UfJdqjgbw4+cQmSQ9Ut+vBQ6BUup185DeUm2Hfj2sA7MMDZdmxK0oTK/
	 YIK8RGQmKDeSJU40QJ21dw+P7zOqYtHqAZH89321fOWoL1NtpaqdoA0XzbPezQI6Kw4Ik
	 VLlEH/tpc0HML/d/dFAYSXkj4hP0yGevYdFgWXH3usVtHZ/FzcErHgLW/1aB2f3fRMMwn
	 hhX20KAdJUSN8VziVElIfNT8kM9iVQw7xW4FeYQ+i0oR2rEDuV2OeOJo3yM2v0m5hLGpW
	 1P/t18KhOUY//cWS8rUWtNRJSSD7T0AGrsyLMgw9GoLHivEgGo2VS8ZUO6UiUd1tf6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169496;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=azKLOiMZ/XJgtO8qn85/6K7821CLKHgcmmgBMVo4N8Y=;
	b=WbZcoQJWJCDYEFzMaLXalhSkJL63xCOEazp6VZfpLYKmdrIclYxgMdtfWHxiqir1P/AC
	 yISYuHO125qhV6QVghzW/Efude0TMqZa4Pat3ghgVfrMqCWvtF7BHv9IBPhTJhvbiLEVn
	 wwlEt32TczMWcif66FgbD+EnRwWXgMj2zCcaKQlBaBBvgVDsPS1K0mG6ZS4wYg0T0Px/I
	 qDoofiPNb2cvHKZeq4ZfQZO9Rh4AlFA4pqSUo6h6ptRcVHISgi66m0E4OTjQOetWJeTiK
	 xpYg9QR8fmBpnYf7XHd5i8CV0E83KvJz/K9M6vV/4MhEkUlNZpnI65ir7aW35oHB0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIMymaAi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E36080C4F;
	Sun,  8 Nov 2026 20:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIMymaAi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7A71F00901;
	Sun,  8 Nov 2026 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169495;
	bh=azKLOiMZ/XJgtO8qn85/6K7821CLKHgcmmgBMVo4N8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fIMymaAi8hyfVGOGJa/BeU4Zi8z5Oriv1Ob12HhaBf1fa3gHkFjDrwTXOhi+bl32w
	 ZfTVbdhI9PXzvF8SuOSUfzZWNeE0R/s6KmnZCsqoBJulp2YvnBiABHKPPkhR/Oc2fP
	 tWrEnCbzQlMghDf9LsDklWsZu5jgWHMpmXxcJN2hRJGHo0nEmFzBUMgJY3JLmwWrn8
	 m6ECStKDyR0gbrWzTVpFBEmqTCS+i1pU9RamDODhoVPGbyb17reZQ9+5PvyZyfcgfQ
	 sKj4Qoe9cXmE8Hb7ft5Dcj3MidLSVCcj9mDm1cLOHFDc1cXEwUTOeAr4ToOnvcb/Ae
	 5Wik+A/cTQ2zA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: qcom: sm8450: Fix eUSB clkref and camera clock collapse
Date: Sun,  8 Nov 2026 14:21:22 -0600
Message-ID: <179416929446.628393.886593094682122369.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
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


On Tue, 20 Oct 2026 14:21:28 +0000, Sushmit Singh Rathore wrote:
> These fix three clock problems found bringing up mainline on an SM8475
> phone (Nothing Phone (2)): the eUSB2 PHY reference clock reads 0 Hz so
> USB never probes, and the camera GDSCs lose register state and leave
> RCGs running across power collapse.
> 
> Changes in v2:
> - Use my full name in From and Signed-off-by.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
      commit: 0645645582ee82e834e4039cf069671c8eb411af
[2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
      commit: c1793791923dbbbe2a948d4a2b22c9a225a24a39
[3/3] clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled
      commit: 704930b1a25310c1357e9f7f9b6d0f4aff95a459

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
