Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43C2E0938
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645697; cv=none; b=N8xTxpmlIUtkLIU0ioJu071n8sOM6vs3AggxzgHpA37A4ScLLJRVZkNo9+XzwyvQEdprDHMGSXHlY5Q71qDlcXqKN3cnJVi5ajGasisl1MG7rXoQ0K0mttcoSOgu758wWjCjhQytB3iNn0N8vXzRXvlG9xTPJlZXvVj3ZNwzGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645697; c=relaxed/simple;
	bh=BH1aKcd76IaUZZ/ToYr9eDZkVxa6rxOK7GvAzGHVDi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QarQG6SENchI7guzjZ3nKJFi89Nq8KvqViHtCzG74gixxuFi5dYzcuEQinOQtlh4a0p0fbKvd8wbgNmXK1m7OV1UNXLITJ9lM7uyDP3IWvdhRSC/7S2xSZ6Zo72LvYuuyM36ao+Qq4VYDuvc1iLS46oqYPw1oV/g0/sD4b3NOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BSCbg6+e; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BSCbg6+e"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so2244273a12.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645693; x=1752250493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=BSCbg6+eqWxsdM+U4V+a2msCtN9paviA8SqT1mQaT4m+JjPTt/qE6lzwqKeRrxFQbW
         6/WpbORYsVosT4sAg1E3xuUgAHt8JD4ZiKTkoIOPFNEb6VVX5aIOOXZ3p6MeXqbTXNGs
         DApTUTlwAEdFF6mEDQRMOFHHl6Da/4uPOfPYofeZDLvri0GYWXXzvOuFyNMKzq9zpfiK
         x8iZ8bqRH8YWa3Ze5MxGT+46IGjwIIY1jQcb1W8CHAJIN2TNlwbaM/6LOZf7U54wGaKC
         n0zdwpEQ1Ax9WdQtH8dCw9Nwfg+ZI9xBASWVofuaAXNqARrLnrR+6aL/TsEb4x6gF1jv
         DubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645693; x=1752250493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=WQBrAvJ71p72iLhK/GNz9O9VjGRqFQ/2ZKAPzQa4RBUk6dg1BgmVSTLzNlac6QfuZq
         ojW5SWZDocPjDcGQPk2cQ4MRWCqRNNRbmcwSMjRsm/9KsL1nLXsKsxdfOQjYefKj7ggP
         UeU2po9scE3VbflKovwFJ1nNhUaDJduX7jUr9XsEFPnlHupsNulUeSVHI57qVxNnyNW7
         aSfvPRh8Ctk2Vri+A1U89QehoYd8DAQwf6MD4YAzHDVcVjZ9IWrcQTM3dsZKz/k06Q/J
         3Gcu0P4xyDXW3IGNIgyubsTND2cepq2uMKs3GLzxhhXAvgmSxuHr14CjUbrlIfPQK/vJ
         4Pqw==
X-Forwarded-Encrypted: i=1; AJvYcCWSLtbXmUhni0J/dtDI0pFRiUVKUaxA0wml26C+qLXQ0W8ax2YBTFTUQdf2Ct6iqiYaz06uKsEGQfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMn2vA6DcQK9JZJ2gjBkStF7pxyI6/8eIaNL4ErzSZavu2kh/
	u/j5Eali24yEApzyJ91USWu3zq4VsSh9rl4+wtxlJjanO+Of9+3pRXd9zlujvrCxmsk=
X-Gm-Gg: ASbGncuzwhUmG4Jc07olGMtFVHcdScjePhnCcM7IZgrGTMb20SrQm4w9UaSRxb9UhU3
	lIA00A/toqH0KZUb45W45KHpfjbWoJmYul25v+s34UDETLcodDXUMXjvFRxM23CtzguILVRYPIW
	svPzMFgFrzLEqtWSTKo2mDRtPvmpK5YQn7Y8X7Xc6N7JAxPO1F09OjVV++DuytiaeylLFfKDlGT
	Q0WCGQp2e77cCM6RuT4D/729uhf+3tTjHOWeRrLXlRUH9CizyhGRPN8XhCv3KmfVDdgQ7XMGaZ9
	9jhhYfB+AdsoMWtjz9xjFJg1nBBNlVfLMmfU05pvG9bPJAE1Y5ONqF5oafskST7rRsIu9LJzRbW
	yI2+b8WLAnJRJQZI=
X-Google-Smtp-Source: AGHT+IGDhz0qhVTw0+Jv8lS4jO8NKu6i+6S1WnDonE3OKo10n+XAusMMQdVW5VodGZ41K5WwIdd9Lg==
X-Received: by 2002:a17:907:72c2:b0:ae3:bd92:e69b with SMTP id a640c23a62f3a-ae3fbc4c2a9mr336020266b.7.1751645693200;
        Fri, 04 Jul 2025 09:14:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 9/9] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri,  4 Jul 2025 19:14:09 +0300
Message-ID: <20250704161410.3931884-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..b3533ba5be7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -227,6 +227,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0

