Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579583;
	b=xzVlahoG+ELXl22l9lqVdV+FCCgmr2tuBTEsk8T4TfRY1l3/l+bjZHqlEz/EZjRFA+Rn
	 ei82UIirXSoBf+f0eP/nN/AZmk57foqHbbHKwKyvPnp2ilgpqHQVXER/EF2Dgavd8Ziyx
	 p5C5HJgXlbmzBs0FxCIHsaCh2bdlqMQm3GUIy/8mWVBY2lh4839DClR6PO4vVna3SgURr
	 Fnh9v3Tv+FfhcAQkY8KkmOlObAb0UO5qWiqKjvzVW58IJ9zcW4VjC53jI51y5ULBCkMXW
	 hsuD7cR7TEZ6txzOxuIUB4gZKh2ALKjx/Z7vD7/IosT+3DYcHWVHV9cNS/CmE8rAPEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579583;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nFjRwOlvIBGY61BP1M5CJLspGZmtp2d2yaCCwwEg6Ug=;
	b=jf6d4WqOLUgz6t5Vay/RVSKUDCNOlmABst2gsZrm9EHocvLUkQdP/bEX06Y1slSGLYdI
	 WcgNnVHdvbNYN+ZY+fVhS2vWTeRJlHfhvSfdzUzRIVU3fABE502PMnDb6EMGubEEmHLDG
	 QfHf7jCJeHtuef8wBoWZXf0QCcDlajghpd8A+eqRmkIjfMd2YXDj6KPJupjtrkWS+eU/h
	 TxRNTHtYX+7n20JHqApSup6N9Dnc1dA9qc4ODWfYs877wG/ITJJLnRoY9i2u+Ox29o+nE
	 6ex6ZaosXkK1VILzny3ujQyEI5lYqj76efr5UvJztewMmxPFEp3O3519FwDtNilIdrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44053606A689;
	Wed, 25 Nov 2026 04:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44053606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 7956183B;
	Wed, 25 Nov 2026 09:36:19 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Wed, 25 Nov 2026 12:05:20 +0800
Subject: [PATCH v2 3/4] dt-bindings: clock: Add Netrani RPMh clocks
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
Message-Id: <20261125-netrani-clock-v1-v2-3-9ef014e71737@krgm.moe>
References: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
In-Reply-To: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=ikmdHRaBmgft6Fd2m4L0kToLHNE7YRz6hWE1822qCzU=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBl6MdC2QgagNesnZuUbqZT+GvzvUsQWUML9Q5
 5aJyztz5DSJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawZejBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmNZkQwAttqOjeq+4ZHXmDSKIE4HAeGfJYFDBSB
 bd9ZOXdwyDibWO9V886nw0ilhHqHRowOrLisjn+um/ml37KweYERYjYO+ySCJ4SjX3ZpPXAgu/k
 SYBz93hESpTuAsiWlGCR+DQlqkKc66ioPYDMpY3HmJJMYBRAB3FxqEmcYoTv2LcwIc9i5P1clIj
 VkjFdE+616UgN3AfPhcLpZTdWQ4OX7BT+sfK6Ob6UOd+SmF/kSw7q1eXOfYZAWE3Vw9C7Oh+VH6
 nK69BvbRDmtzR15WM1Dxjg3TNc5eMtZWMPk9zaVoYeZIiznSi1tpjcEJmfLUZx1ls5TMRACk6JK
 nptdgz2oQc5jZTomCt/DTX5C8aWmcA4pTnjxwDlt1QenuztKHNsYZp6313R4wF6eGbKyuEIBqHR
 8eiCtFGd8cKkN9bCkNEcO0EOwDQqhdu7LM/xL3sP7TwEQfoX4yB2qhAMLPzerOwuxlfQWlM91ZW
 ywJqP69b+51rLfGrtWfr4rbecbbxPLT
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Document the Netrani RPMh clock controller.

Signed-off-by: SignKirigami <prcups@krgm.moe>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

