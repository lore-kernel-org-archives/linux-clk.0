Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E563DD50D;
	Mon, 10 Aug 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364157; cv=none; b=DH3B4NR7NLrBBUhNByg9UUNVSR2Gi8qVtz0CIHRGBpxP7L9n5svOfeupNuK3kiT+PvRaovdlJgZTn9DttfBaCe41OhcQ61W89UM35KzfbXKZNVjOIytxCvqhyE2g4A+Ptk5l/F8iEMlh0gCGOMxIxUW0WObEjr2OOsWuepQoDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364157; c=relaxed/simple;
	bh=OLkbaDWgp4ipL02gZisJWTsKREQw8A4zBnKtceIU6U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOmTm2Y/8DcYGDx/dVpZ3nANl25N0bLLlz8iFiO705RIS1GBSFu3pmdLU7PEILmgnH45NfmIkiQAlxP3nC0Z7gpAc9vQG3IkZjlSiJ3Yf0OoUX374scZIpdQqz3IDmNS0U1+v6BaQnXqR499SlR83p0rWsXGcgMiMoUAPUYMGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=nnuhJ48/; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="nnuhJ48/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A5D2C0519;
	Mon, 10 Aug 2026 15:15:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364154; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cDtG0QjaIvwPANkpMnYor9ZJCrij1s8L69sJNuEhQRw=;
	b=nnuhJ48/kMqZtnMtY0k5ZMoQmuIJec10u3anCmK4xdzZX4yufAnkC1zsUpbZe9T/xGMzQ3
	5IHfQYI1O+whLQNflzFD9CLBonOzqQPwK7p0BA8EezpQeaKjHWyKJQBm3kqBKQ49F/GH+x
	3ddMnyDyUeS7l7aSCR1mKDNIb7/b0zr1+Erka+leg12BkR+0SEfWqR1rfd7xZQ3k9V7KXC
	ao+D0T7DuKOlrurGy9KcYevfpIzzx+RObgZrNnlvRvCM7wk5p9SOdU5/aXCjeJ1w94CWyD
	fMtWao7pPtZ/pUs7oHcEY/fCiDa9gbF1LH8iXKOOwUrNmFs3W/jmBHvEgqPm4g==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH 07/25] dt-bindings: phy: rockchip,inno-usb2phy: Add RV1106 compatible
Date: Mon, 10 Aug 2026 15:10:58 +0300
Message-ID: <20260810121121.210040-8-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The RV1106 has a single USB2 PHY with only an OTG port. Its OTG port
also exposes a "disconnect" interrupt in addition to the existing
otg-bvalid/otg-id/linestate, needed for reliable HS device unplug
detection, so allow up to 4 interrupts for that variant.

Add the "rockchip,rv1106-usb2phy" compatible and require
"rockchip,usbgrf" for it, matching the other Rockchip PHYs that need
GRF access.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml   | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index f50fc69fbbe4..4bc418376b18 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -25,6 +25,7 @@ properties:
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
       - rockchip,rk3588-usb2phy
+      - rockchip,rv1106-usb2phy
       - rockchip,rv1108-usb2phy
 
   reg:
@@ -121,7 +122,7 @@ properties:
 
       interrupts:
         minItems: 1
-        maxItems: 3
+        maxItems: 4
 
       interrupt-names:
         oneOf:
@@ -131,6 +132,11 @@ properties:
               - const: otg-bvalid
               - const: otg-id
               - const: linestate
+          - items:
+              - const: otg-bvalid
+              - const: otg-id
+              - const: linestate
+              - const: disconnect
 
       phy-supply:
         description:
@@ -160,6 +166,7 @@ allOf:
             enum:
               - rockchip,rk3528-usb2phy
               - rockchip,rk3568-usb2phy
+              - rockchip,rv1106-usb2phy
               - rockchip,rv1108-usb2phy
     then:
       required:
-- 
2.47.3

