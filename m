Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED9B3A4F27;
	Wed, 22 Apr 2026 23:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901084; cv=none; b=g8aHTacutdkOLFFiJC/9EhvnB3kG3hPrCqYRkb73Wl5pEOnYSdTZrhCs+JraLgXHP3xpq275W+ZaOPiWcmH3CIhh2lxdjHLV6Hc13Pf/TnFs4g6Jm1ogqRAmzu5qhQ7YE+zRHGCfFGBniOEcoU0+jrmhyd+iPE5hWyvpNj7XX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901084; c=relaxed/simple;
	bh=/P7YSxf5igSOAzFKgZgvq8nmeEFNQ926J/cKNKHA6Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlRJ9C8E7WevBX7ft4dn/noeWdzQmk32EikbusHBoAZa2wk6it2RlRwF3WvJq34nrlcTdItvIcD1nMzn9YOH7lDL4gDn77M3cgavVm8GaEBxwuxN5nqFSqmzqxAQkVMqILbENmqISFpCW2tL44NueziKfXjJqhD7q1MSe59WDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b3AbPq6s; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pvrDbK8n; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b3AbPq6s";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pvrDbK8n"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g1Fyd15Q6z9v0h;
	Thu, 23 Apr 2026 01:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o53FrSsnhfh8V+Sa+GU9/4kc1zeIjYc2qw4K6Qq19PE=;
	b=b3AbPq6sx/BX79CJ2xro2f1ZD+pZUORFbu96IYN6H4toOljppDRmn39KP06w9SSWSCDXXX
	k+/t7JEmUaJ1nquCKJU5n/dxDctqCu4RMXucHIaOy688GGAFsBzBo27t8YZN8hfotu/wH7
	h6qGRZCkjVGNb7OF4WqRzAnNVSKxsrhIpzF2XPu846VsCsJfYOCi8Ey1k8MRtgUema2Kq6
	nfGeJPg2AcXcfmGwEka9zAWQKUDH1tCtSZQqfOca48Sf8u2OcjHZX86NkIEsTdD0XN+qi/
	kcC4m3AKEaU8MTwpdugFJMMiDLNFSusT8pv6S45uqUTpXfuNXgd+5xLua6NNAw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o53FrSsnhfh8V+Sa+GU9/4kc1zeIjYc2qw4K6Qq19PE=;
	b=pvrDbK8n7kbVkiMINwlI1NaLMmIj6iStLfW2vfdUfT0Pu4tlM2GvymIutWcJIM29wa5xJ7
	MJqwk7CrOmgvLg1oSoDPDhlTLuRlB/frERfQCGU1wR2QVCOENSnL+YZU2V0Azx9YjnyURZ
	vo+Df1CgIHhRZcLyh2P1qRuAGyCKt3t9vBGDk7wcuVDBtanB3niDqcom+1HaMDhJcNBbUU
	Mpoz47H3HW8JqzlYXljG01+nWn060LLvRp/lrtrracSMf2cedrZsn/tS0XNalzVKUxuVqu
	JU2ak4xiyax0TnH33yy6zGkFmnr4FhV5d5FWsGkOAqiWJqbKZaCiIvdi/fKOHw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:28 +0200
Message-ID: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8466ed11b40aa63e9da
X-MBO-RS-META: zyu9m6nmx7ww3rybtrnxd8mo99whgi4t

Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
V3: No change
---
 drivers/clk/renesas/clk-r8a7740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 635d59ead499e..31a79674583e8 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
 	{ "zg", CPG_FRQCRA, 16 },
 	{ "b", CPG_FRQCRA,  8 },
 	{ "m1", CPG_FRQCRA,  4 },
+	{ "ztr", CPG_FRQCRB,  20 },
+	{ "zt", CPG_FRQCRB,  16 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ "hpp", CPG_FRQCRC, 20 },
 	{ "usbp", CPG_FRQCRC, 16 },
-- 
2.53.0

