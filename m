Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB11799F;
	Sun, 31 May 2026 04:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200551; cv=none; b=BRdX9XSWEr2YSKAt9oMiMgEvOG2uUj2UJ93QSkwoC0jdQc+pmS8sL+H1kTgzdAk6uf4ZwaLTiDEC3nylEjWx+nX01x1cSOBJ/lRryI2leGCOn21SHAzYzv7MroUqiOvsjukI+VE1+xj9uJRSurgmVTNwFkS+/HI1Ai7J/9CQ0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200551; c=relaxed/simple;
	bh=EFHHCYXr3fMmz6eVGmuvtYq2zRZZc+3f/ppJsbk9fEk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2sDgNvU7vZkRJV8D1Kx8+Zdn+fl/QxrB+iZWtVA5cGjyrxYFKVdKCX2QDd3RXjkQrfCihymapfm2H6Z32+GhJ/BtPNJKmfI63P+CC0Cdqk4Q6wnpbxaRE2z1/UBwkcj28zvV4vA0OQwIFyYeGEBoORgdu67uS7sAPBo9oFx4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=GUtI6Up6; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="GUtI6Up6"
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gSk9r11pWzYf0J;
	Sun, 31 May 2026 06:09:04 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gSk9q3xplz1g92mb;
	Sun, 31 May 2026 06:09:03 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,lcc: add MSM8x60 family compatibles
Date: Sun, 31 May 2026 06:09:00 +0200
Message-ID: <44986bb00724bd127e95651a8cc54fd018430c96.1780197511.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org> <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200543; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=tpfIdewfd+xDczBgMN5skX/AIdc7U38DWllBaQyGfdo=;
 b=GUtI6Up6NfsaKPZ1nhpQ5PAjLUmapsVIAE8R4PvASLnMZjyRehM/epx3fYlFTHKX06Ua8u
 /Hv9xaaU4X+olU6DAQg6p3BXD4gH7zKDN62E7vbJtzEhW9arb59Fn52SWHGj2KSXQeeRgQ
 Vlu90BPPzUYrQ+mfwPUY1seDdtd4Cpx4EErDGPzPjhbJarqr+q6qBZEDhxePzlFmlpu56W
 RhqhiZHsKKu6k2idL3FzIFF4w6IW4pgSrsw2zjQBR9rtm+kKZMxhaFFWaENFt6X09/3k+Q
 tTDGZArMqH38uK8oHBKJvNJWZBymYJ2UTO96yfodzk9Hk7Q055TtlpRnUTplZw==
X-Report-Abuse-To: abuse@transip.nl

Add "qcom,lcc-msm8260", "qcom,lcc-msm8660" and "qcom,lcc-apq8060" to
the qcom,lcc enum and to the existing parent-clock-name conditional
block that already covers apq8064/msm8960.

The MSM8x60 family (MSM8260/MSM8660/APQ8060) is the Scorpion-class
generation preceding MSM8960; its LPASS Clock Controller is fed by
the same pxo board source and pll4_vote parents as apq8064/msm8960,
and the codec-fed slave-mode I2S/PCM clocks have the same names, so
the existing apq8064/msm8960 conditional block applies unchanged
once the new compatibles are listed.

This allows board DTs using the new compatibles to pass
dt_binding_check; the actual driver support is added by a later
patch in this series.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 Documentation/devicetree/bindings/clock/qcom,lcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
index 55985e562a34..bbdad157f03f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
@@ -12,9 +12,12 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,lcc-apq8060
       - qcom,lcc-apq8064
       - qcom,lcc-ipq8064
       - qcom,lcc-mdm9615
+      - qcom,lcc-msm8260
+      - qcom,lcc-msm8660
       - qcom,lcc-msm8960
 
   clocks:
@@ -46,7 +49,10 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,lcc-apq8060
               - qcom,lcc-apq8064
+              - qcom,lcc-msm8260
+              - qcom,lcc-msm8660
               - qcom,lcc-msm8960
     then:
       properties:
-- 
2.43.0

