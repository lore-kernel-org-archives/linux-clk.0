Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D219E819
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530830; cv=none; b=LrN2twywSzMco+P7m9U5AL0Jyzb8wdHdKMqUBb3oQ1NpFVk2ZkdIkirI/lP4KZeZntWfxIcHv7CRvzVqRq1SWF7EHOIMzbkOsJNf6GkgOt27H0jQTLTDo8q0Yfe86Ep4r0SD/bVPN7ZO3EoMLDFmWMhi+uLiVnqXR2sPqhy8ExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530830; c=relaxed/simple;
	bh=mS8iXYVjVBdhnzOOGwa018+Hti3jLNwAxmOap9NVCks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0cxv0zuqAs5Gr7gXbo//FygX5p/aXbG7YORlgyRLLY08dAgdMOHJ1xYa2Jc6kdw2Vx6NGdsEYVvLRWOu2+tcbqa1FIJn8Gi4KF7AGxUYFky4DOjEdvfmKpKxQh4HWk1qvratUoLb2JEbBu93NElGldiRwp1Wn7oJX9oFGiyafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tFWPQ-0001Fo-NO; Mon, 25 Nov 2024 11:33:36 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 25 Nov 2024 11:33:22 +0100
Subject: [PATCH v2 3/4] dt-bindings: intel: add agilex5-based Arrow
 AXE5-Eagle
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-v6-12-topic-socfpga-agilex5-v2-3-864256ecc7b2@pengutronix.de>
References: <20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de>
In-Reply-To: <20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-clk@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Add binding for the Arrow Agilex5-based AXE5-Eagle board.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/intel,socfpga.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
index 2ee0c740eb56d63cff7767167ee3c640beba0803..03de49222d465584f24cc6c7dfff6ccfe304db46 100644
--- a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
@@ -24,6 +24,7 @@ properties:
       - description: Agilex5 boards
         items:
           - enum:
+              - arrow,socfpga-agilex5-axe5-eagle
               - intel,socfpga-agilex5-socdk
           - const: intel,socfpga-agilex5
 

-- 
2.47.0

