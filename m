Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513774;
	b=y3ANRsA21xZ5qowPv17/7Syg9lt/FC+9EH0qr2W6+7lzs9US2CRxPGl4XA6qnJBKcsv8
	 UPS7N8zO8ALytxRl8GMRe6lRSdL5Zovk6AsLw2IFsetpAyJklZN8HnRdwbJ6PVtAXloY1
	 /VKq7Sk5cS0WXG7oC+7IJSAQsoo/3OZ5qH1ASdr0iXee+ywuSfKkqUZBHgDGyQAHbuvna
	 7Fs9chQP225zryLg4jLPgsHlMRmHNn3caSqkg1J6z/0lb3JJcl3AWkjt/MxVG63HQ/ZBt
	 UVwVwHM6DJGVYABOL3pRZQAa00hP8bbS7sW6FH/dIVa3tzlsxJ7cgNsMbPGodJLTZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513774;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=K7TfDdvozdcjSYI9RrxdcEONNzrQTHiJZZKxjwbApNQ=;
	b=iNF/rUlyiq0DJsQ7BFPXt2Qpi2z9VQhozcwDDqfMtZHAkUmCu64kNPakVEecjG3wWl1j
	 +woA3Vi17UqUnbnxXQAcFforfLjDi5kOzsnX9wszBmeMdkhe4J51UqVhONCWIqUDEM05W
	 Y0a3Cro2xe/jZAOwGWV7hl0FhU5onj3t81Cn6+hj2mYYE4cV0lW+YuN2RLik815BOj/v1
	 f//pNFQtGUXjO1VYQlE1+cVvc1UhrnPfr6pcRDzHCZnNBDHp9NPTOHqbrOSeJeFMofW07
	 Vajt/k5g70avtGwqZ4DfDNCNtNQufFA6OqXtr6+u88zCUhEPxl98Us8dnBtFxyBeLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640F0606B7AD;
	Tue, 24 Nov 2026 09:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640F0606B7AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 0DC36790F;
	Tue, 24 Nov 2026 15:19:27 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Tue, 24 Nov 2026 17:48:22 +0800
Subject: [PATCH 3/4] dt-bindings: clock: Add Netrani RPMh clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-netrani-clock-v1-v1-3-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
In-Reply-To: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=+CT4nytXoDsaNJt3Gr/7bz0ZST0Aw5hoMJrSaA1t3fA=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBV13MgTCqCscgb4pX3J2p67Dkh4jGgGs4vZzm
 vkgqlVQTqCJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVddxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmPvJgv+KmYSSJsaY0VzJq5zyFElMJcmwsOF2Iw
 BWCoL/BJCFqmClEXd3SVmcFVNY7uoIfwJsMRKntN1/Y9xu0/uzZkexE5yO5uMQFGQQydgVXGRRi
 9tqC80Ihis8S11Q1kl0a2VBfvo+6/0aknLNYf47K6TjK/RbweMidCgmGy5AMBGoB4m0L/TSnFPx
 65LMaDgM3i0OR4uk+thHquzrbDBdR99tdZmZJkcumJQaFm4Egq58SMOpyjs4ZDzKVm6Kc0g1yTk
 8dm+Pdz72lHWnbVG146inzAFpHUFQUc0nnIj5Vo5PdkfjIKg7K8wSyYUjVMC0+ZS7UIs9LkozXN
 ETTaowMLrvv9I77S9S1X8Viai8gehyLMy1lHq80zoKf0QP+C2fuWzd+QrOQMgMaTbX1oxXl5NRn
 PZp1BuCbeT2Zbh6R9JAEBtRIpQBH5ek/YXut+aPwsyYX1RIy1DV/4W9UtFdpKoC/K3OXux7owSX
 70V5967B6rdcHkRfy8lGDjVj4/ePtOT
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Document the Netrani RPMh clock controller. Require its board oscillator
input and the xo clock name so the resource clock rates can be derived
from the supplied source.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa5..6ab049ba4b6f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
+          - qcom,netrani-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk
           - qcom,qdu1000-rpmh-clk
@@ -68,6 +69,16 @@ required:
   - compatible
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,netrani-rpmh-clk
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

-- 
2.56.0

