Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540D28F5;
	Thu, 26 Dec 2024 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227139; cv=none; b=ExHLTOxilV8GMzwyCN+ArxLGxmW3xSdZ0V6KdIV8NpYInOYoXIHG2AkYl0JDhxgMytT6gCcjW9uYmvv7oFFVWKMwJ5/4F/3vhE/FVDDLjIjz8QNZ/KAO7gqGnrXN1xaVYS63BAX4dQ1BB8mKu/M54ZWYX11MxGCEn8g7KRp6X3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227139; c=relaxed/simple;
	bh=7dL55AlvJRi+H1afrvbkQRz8fLGH7itx4UESJB1AjxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQBMvi9YOZviGFurgGM7XMrK2hjEpYyFOnOkjs43UvO+2anbGa8x2kYJUjossmjHVacPr+7AbcbFEnIAP+OMCmTpq3FQQHez3CDdKdQW2SsU3NJC4HpIXTbITb8+G/Rm07/fd2ReYtHG1ogILeXoM6sM/duITw/eSbSfYmCqIoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=f1zoNcLM; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="f1zoNcLM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F295D1040DBDA;
	Thu, 26 Dec 2024 16:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735227135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV06uPDyV/m3CHHviV2vOwjO8cVMkjk8mJ1uMo9EmyM=;
	b=f1zoNcLMZaxNc4y/0DaNr7OJXVNERGkZQJAf3vDoWVGAleqhq1v02mEhVmBDI3J2EWvAFg
	T6gFiCQywOv7smzrmYOjMrqzirP34Dmlgn9rulYTIE8aUGtYZX5HQ2fdliC7V2JiM02soG
	FosCDfjpIV4sDI8ymheLtsZP+RXQdZQQAmz2UqRn6gbozwh3HRv9x4aIbJo3n2fLTFkD9s
	tlOrLFXY7z5MjdzMBCLxyXjFMbCWyKUoItnfioYydEhSJtkfXUKVBA0QIUVPZ1ZmFNiqpy
	+xZCa4Yqv3NkMAOjQ8sQlp8Wj/dLT+UyNTUKQXkb/iEV6jA4v1EMGKA30MYZ3g==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: clock: fsl-sai: Document clock-cells = <1> support
Date: Thu, 26 Dec 2024 16:30:29 +0100
Message-ID: <20241226153155.36351-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226153155.36351-1-marex@denx.de>
References: <20241226153155.36351-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The driver now supports generation of both BCLK and MCLK, document
support for #clock-cells = <0> for legacy case and #clock-cells = <1>
for the new case which can differentiate between BCLK and MCLK.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
index e62543deeb7da..250d7ec729c6e 100644
--- a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michael Walle <michael@walle.cc>
 
 description: |
-  It is possible to use the BCLK pin of a SAI module as a generic
+  It is possible to use the BCLK or MCLK pin of a SAI module as a generic
   clock output. Some SoC are very constrained in their pin multiplexer
   configuration. E.g. pins can only be changed in groups. For example, on
   the LS1028A SoC you can only enable SAIs in pairs. If you use only one SAI,
@@ -40,7 +40,7 @@ properties:
     maxItems: 1
 
   '#clock-cells':
-    const: 0
+    maximum: 1
 
 allOf:
   - if:
-- 
2.45.2

