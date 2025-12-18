Received: from mx-relay31-hz1.antispameurope.com (mx-relay31-hz1.antispameurope.com [94.100.133.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36C35502F
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.207
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071327; cv=pass; b=cVhif0HE50Hi1eWCk2LFsujTC7ybL4wrElPkduIYBtFxt0MZq6mKlBbLrtPo7FwyawqcIrsBzrfHNYCkgp3Utl4hqZCLnXEG/dC8yMHNkc5oQVyDh5O/G7AsSfpXG5kAChu2ElXq4PQEqltJ2ReqqWtaA9i2ICtQBtnutJlfIzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071327; c=relaxed/simple;
	bh=xU+o4EwdFkRdWDIg0E/QjC9yBED5TOlSry1ayU8ef1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKo+LTF58KbAs6lzndtjL/VvwICQxfoLy7zPH1GORzVvVHsItV5TgRyJfAsKqQiFEft9mG5q/hOu4k7NZnMUrUnZJnQz8u6tzrLYFrhqLto6r9mO+tvyL0SrnJmKiXdVupgi2Q5owjLR9LZRl/LILWBQ3GuYinzkgKUT+6imJSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oW7eFTfE; arc=pass smtp.client-ip=94.100.133.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oW7eFTfE"
ARC-Authentication-Results: i=1; mx-gate31-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071286;
 b=gsykPNAbjMU0cYhCQetxlrJG7s0lKfZUuMccqEr+0MkBQp5siVoA4+HnrYkMBi0MSzRS+j2G
 5ag8rQ7JG7SPVzZk3brSq0xKR0sLHDVwxSbpWRwPO3XnmH4495VSxleWgxNT5PTfnZzp6c+4vpw
 n9XcorlT0JBSHWWEqbBIgQXUsf8vfgkYgZvzaH1ZybaLu539hRUirz3dSLf+AjMaXuYtFrfmM9U
 /QCXk87ykJPyuSIzy4dz6DDGRIGozkYYUG23y5JWluXhYmMVEp63pNisvPLT86WkweZVcl7NDKl
 OISKt3G7uGSnU0H4QSK4kncUrAFHMSF3KXNI01F2OGgOA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071286;
 b=XR8+/sIPYR/biptrgS7FQ9/4iEBJ1QCx0px19bgXhbxsDpR5l0mo1uuKzO49LsNP45tDK1fr
 qEjzr+jwZO2vOPiY8UaaTZroznvXfmNbsbWtEXMtxn6lqJJVwNzcFIOITN9NYgDqhG9tCM2iFQO
 tEamBLft8Gi6JUq3mT9tYd2NnM3NZ+IIXk180UQEomroyEULm55N7Rc1gznDq2GQUCCr8GPMH1g
 KWcC3cd748oNFGmE7Vk9IN9B0hx+Eu1FkgJ/bsU5UfnaGGjcah8fhLPiJO8Vog1LiG8LQ6gQ7M6
 rBU5Na5uESVSOaIHTTYZGUXz5c/FBntXrDeeIdhcbhNgQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54C12CC0D30;
	Thu, 18 Dec 2025 16:21:07 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 18 Dec 2025 16:20:49 +0100
Message-ID: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz1.antispameurope.com with 4dXDs03JbGz4HPhR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4d69e4e769c0d457f96290f5ace7a8c2
X-cloud-security:scantime:1.856
DKIM-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071285; v=1;
 b=oW7eFTfEUbQr0Dy6aNdlUFbpmRRXhDvkqJWYryGuQappBePSv5wlv/65IVIPo027NqQxDM7y
 cy7twzq9JSPOBGW2xmSAyYZaek7K1AYghndHKxsHeLk2J4jc3YdjQ3ZcBOW3lJzCU0Vr0J78p6H
 B83T8gZHBNRVT19UAgbCKXWllJsOV1SRSr9TrGm/1Hpbewsuw24sunmse4v828/SYaoIaFE/28s
 mA76R9dN9qky6vuvWJ2CzrQq1fSoRecUFRDP/X84z1lvbW2lJSub1ZGZlZitZaB9woOrKmzoDg/
 lUQif3o+s62+5yydpzep/Cy1V7CVt06e3fB302E8bDW3A==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..1f7f0adc3b1ed 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,17 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

