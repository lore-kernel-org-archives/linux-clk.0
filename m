Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC543624AA
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112855; cv=none; b=BXXwaRBpiyt2V5kDbu/UW+2kFvt/9sCgvzNvtwvURByAnb5x2nggxXVvkPTvtwwmoqkeuj2vCVhvgKLnadofpaFqoLHhLnY2CGwIi7NbF2Vh3zoPv3mPHBPy8qgFrNe626iun8sEaLiaoZjT//qjiTRhQ4Kcwkw3rra9Cj4Pb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112855; c=relaxed/simple;
	bh=0lSJAvm4Hn1Ils6DHNjWeGoR73lEO8Dc8PMjR4+fBqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loLQRUvKkJbpwXhGwWS14iWc0BNPgmHk/JddavQdsV7kkzTQ4yqj0kwwJto8850H1nLdNpOhwECAO+gLZEXVJqXdhDTJd7axc8wIcYXouT14veC06KzmtS9nN1udVey+i/Cfz0ma2d8AGQntIrkzqSZdi8nm6WqUpskcRCbBWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b7R0EfHo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b7R0EfHo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E0B61A13C7;
	Thu, 26 Feb 2026 13:34:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D8C25FDEB;
	Thu, 26 Feb 2026 13:34:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3E851036938A;
	Thu, 26 Feb 2026 14:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YdDsgApApAV3cK0W79hVYmB4UC7l0NfHNOm1EgR/sOU=;
	b=b7R0EfHoGWw+wn/La/jsuPP6EqOEN7IhVaXpEiM5ujFm4n7XyIebbrfw7gVFGWUlJQpMNy
	1qWStOVGzarPyR8F85PVCMrOlEv6Cfl14QhSlHL1BoIz4bqd6WArLqRJl3CmjehNdHp3n5
	oYR5AkX+ecad8Prjc4XwnWeHc4ZMhZqVRVPc+jC1U2FhpDn6CPNsKnos4sGlbuqm5nuAzE
	4epDnZ2O02CuY9cZ11RdtcXzkanzJBBCNLc7+IwndPvZJglSWu2mwEcetqZRmkbswA6irE
	2E1eyUU2k5SvkGtovYOMLu4bKcMDKqyxc6Twb4Ne7bvkqy+fdeg+m50eJhgS7Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:45 +0100
Subject: [PATCH v3 01/13] dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-1-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add an entry to the mobileye bindings for the EyeQ6Lplus
which is part of the EyeQ family of system-on-chip.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mobileye.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mobileye.yaml b/Documentation/devicetree/bindings/mips/mobileye.yaml
index d60744550e46..83abe268e96b 100644
--- a/Documentation/devicetree/bindings/mips/mobileye.yaml
+++ b/Documentation/devicetree/bindings/mips/mobileye.yaml
@@ -31,6 +31,11 @@ properties:
           - enum:
               - mobileye,eyeq6h-epm6
           - const: mobileye,eyeq6h
+      - description: Boards with Mobileye EyeQ6Lplus SoC
+        items:
+          - enum:
+              - mobileye,eyeq6lplus-epm6
+          - const: mobileye,eyeq6lplus
 
 additionalProperties: true
 

-- 
2.53.0

