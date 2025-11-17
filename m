Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52920272E43;
	Mon, 17 Nov 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393764; cv=none; b=oPT4OQszQmjhIse21eSnsTZJKMDNBFO62KKBMzcYe4snKXpqiVo/g/nWOoYDsxdlM31/Onn9y21HABheAyOt5cd4apfNvLJRS8w4TihQ96ZZbVW6MWl2Dz/ygJtapqvpzfhfzaD8/fkzmLbL9UAlSuqaCDPA4X/epAPBES0Hi60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393764; c=relaxed/simple;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaHEhOrozP+KpfpQfnuAgDX/K3ugk4ND7If8auHvf8sYSgOh0q4+nPlqT6rPGHbmo6eFOeZTXbegg8AyxvvXLORNUaOwM7BvDtMnWepLZxK0nl6NUWcljFFU2PXFduHWuLFI0BxkSz7tKWiHfcsjxIYhEJI7EMxi3aoEqmaDSvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM8x3CbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM8x3CbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58490C4CEF1;
	Mon, 17 Nov 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393763;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VM8x3CbHTupXwTr57Eb8p21yqdbvluqHmz5mDdB2hX+xxlkninb9c7D3PrDrM3rLm
	 fze9QkI5seDqXbzfhqfYv+iGsv8orJQB50B3k0CAmZS8CEuseJQUQQ1WNS8rT/j/ai
	 ++AZC8OH8V9D7laBkKZaqBbNTVh3IjSWnHxLMkr6arTpoOq+6ZsiOu18cEZ2uNoVlQ
	 Qe2lYbBGQxNmPgZbZo9+u0lnq7fIWz+vs9mmoqTw4bC0YCnz5DawVQh0U8hskNy/MQ
	 re7VeFXf8V9XtpNA0uDKEST3dJ8N2NhUYAppATvlYpqCMTo+uteJ1SNFG97UJHA3Oh
	 z4D1myf/1eU8w==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Mon, 17 Nov 2025 15:35:18 +0000
Message-ID: <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=twE2/xw0EdY4lCByaHHfukqX9Ahnfe+zRoGGS/KLfAU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlt+5p1jdy4VaS085if53oWrI7LwVNDUOSfkTD5G3 T6SWdnQUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImkrGBk2H0v7uWtzlC/l4HJ n8yPad+8aBo+tcd1onRE9HF+hyVbXzEyfHbbvnLtm/AJgUs/byk59uZ00IqNhSmWP3QCOSfdiE7 5yQ4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
symbol has been defined for some time on RISCV so drop it without any
functional change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index cab9a909893b..a0ef14310417 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default ARCH_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	default y
 	depends on MFD_SYSCON
 	select AUXILIARY_BUS
 	select COMMON_CLK_DIVIDER_REGMAP
-- 
2.51.0

