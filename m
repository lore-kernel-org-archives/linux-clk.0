Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143F1E0DB5
	for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171201; cv=none; b=aFqEUbdtH+ufaWRD+0MGybBIDw1FT4Tl4xLSJCMzqFx4xVlsEy6H5eTyuFOQ23QrA4MlYOxSM5KONuGLk4BprANCNDz7INi29XCdeD3qa+u3/tcA7J6CdMVqfv/hN8+pMbAq0uwjGAvsksK/2+qBwAVl7oL335AaDykRem/a7B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171201; c=relaxed/simple;
	bh=6bP6dOWk0CZiMQmqQ7V8tThH3RlrxudkJqBNhQo7WoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XL0iq8lhNRwDvq0ioeQE7UKkj/u4NWppI/Msx8xIQCPCwKvFssvWVqzrCtSaiuHlwkhw5aKktQ1/hKAXV0k88gycMAB2rAEU7vFHMOFyfE7UJ0brY9hDWAdVSBI6UBMPb+7BMJXapFcf4UtjeKilMbK1bJ8y6ZDDslIjK+Mf+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=UNIHWYgG; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="UNIHWYgG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738171181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W6xxV0PtQ3PAKtzkZYBXyssRiVoSb6vmC8HEN1Bw0iI=;
	b=UNIHWYgGEXiY7lg8/XdTLW4UiTcMxM+LKgAOwbhrfB3hbyrTZxCguT+/uvTxI14RqUEygF
	0X/bNkTQCv7l710ZivRIXnQHTIDnpgxajBZgw2FgBgv1WXEgKEMKIBJB/oiYd6rJf2cYCO
	iIpWiJAzbfSaf2/mHaK+/I2EXCWRRZSzttouNM6USsrW6yuJqQw7OB/IEuO2I/QOUPm0hb
	Qjixiy9llpkEIWgVmi6R5fohA3FbVBOGmkaBvmePhCV6rMlRatNrH6EbRk00dyYVt9lcMb
	MeDcn3FS2+t9uybsfw9LPO5y/Pm1Ob2Y6V06fvwjgYR1+rPnNZVdPi4nEAgXGQ==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Craig Tatlor <ctatlor97@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 1/2] clk: qcom: gcc-sdm660: Add missing SDCC block resets
Date: Wed, 29 Jan 2025 20:18:40 +0300
Message-ID: <20250129171842.1588526-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This will allow linux to properly reset eMMC/SD blocks.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 drivers/clk/qcom/gcc-sdm660.c               | 2 ++
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index df79298a1a25..1856a2d96dde 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2420,6 +2420,8 @@ static struct gdsc *gcc_sdm660_gdscs[] = {
 static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12000 },
 	[GCC_QUSB2PHY_SEC_BCR] = { 0x12004 },
+	[GCC_SDCC1_BCR] = { 0x16000 },
+	[GCC_SDCC2_BCR] = { 0x14000 },
 	[GCC_UFS_BCR] = { 0x75000 },
 	[GCC_USB3_DP_PHY_BCR] = { 0x50028 },
 	[GCC_USB3_PHY_BCR] = { 0x50020 },
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index df8a6f3d367e..74c22f67da21 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -153,5 +153,7 @@
 #define GCC_USB_30_BCR			7
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR	8
 #define GCC_MSS_RESTART			9
+#define GCC_SDCC1_BCR			10
+#define GCC_SDCC2_BCR			11
 
 #endif
-- 
2.45.3

