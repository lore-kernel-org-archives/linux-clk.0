Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A134CFA1;
	Fri, 21 Nov 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732650; cv=none; b=UJ5CajBfYQEj/3RAeOTLny6Ab6Jqg8gn+yOFAob5FGh1HvFfnvG5aT5RIyhtwPvuFfpUhx0OIFW6Ylmae4Xqg927EC6/tgwiJ3pHybJdEr4icxxWVqCwMUDHqbNGkKMBWPSfPQbZRMUsRxm8KlxIB6YDwPO8NPEP9PT4500KmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732650; c=relaxed/simple;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0srxpskzRcH9IHJbghBdPo6xluAa3gqLK8I7pVVw45pJDVjL9xTsJnax7BkSS3Z2Ki/NJZ7RtIjKQPsLMAe5G4cC0yAEzo5jIJB0KJFoqIqht6/4CpKAIbJ4wuA9/mbjz2JC8XHDGTreI6aW2gRABkfFUDX8OlMVmDmQ9IoAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4Ymhv68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4Ymhv68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A32C4CEFB;
	Fri, 21 Nov 2025 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732650;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4Ymhv686ddYKssiczei2H/0gnm9QRk3XP/8ToBKlU49Rn1EL6pd6VddsJw75SHi6
	 GZCa3XTt3O8NUd6x2+Qc8aM2GaGQNQOg2PhfKfY8UyiCK0Z7zmfC4oJ9Gi4e6Odll/
	 /2ugiI+t9msUHObZLTDxmYPTCvjuJSBrkP+vvEX6+bzucf/sKVjXlR7pVLi/bsf02K
	 NAu5Pefb44jEDKjxcCBPLulTaSPDGArLjYRPVxuWS2UIlnkER2sS9TMuci+ThA2Kma
	 Qw2oxQB2l9HwSjEqik+wyI6JXqBPAc28FvaD9uSr30Kpc50NuuPqr65GUDODrX/Jnv
	 z3/F8P+2AAmxg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Fri, 21 Nov 2025 13:44:00 +0000
Message-ID: <20251121-prude-dilation-79d275fec296@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=twE2/xw0EdY4lCByaHHfukqX9Ahnfe+zRoGGS/KLfAU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfPF+dPyJc5oCj1MzPJVEZM85uQqqHPX+6uOabPYI QX2mU0dpSwMYlwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmIjzX4Z/quLrpLjzxOc2rNN8 wLuB1/KpGVuWlpNInHmEvWvAPp+LDP/0fTRO8R+yy50bZZd2RXXevVuTjlycs7P6qeEE0Sf8cr8 5AQ==
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

