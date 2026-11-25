Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611618;
	b=i1SHt4QlqJCNZ4aYQcoe70VRH7YN6IZHmkJ1dmRuWKCi8xhQmwY+RM3KKml9uJwuwLR2
	 FNhpwlugX0LJ883uH371aRgJmIRYXDK9D0+MD0sZvQNJcaO2hUrcV4dR4FRdyXJon71Ef
	 mOX10ac7UhkF6/ON/2lQnMLfwvzzJRdDw21gHOJbKyJN9ZBUnWy3Lnho6P4QH5ODWOwbW
	 R91V6H8BxSuGMWsdklV1OF9/Qo1zU3n+dz6DagdCZhE1VByPQ9OHui+XsG3dmDIeNrI7h
	 bCmoP1YqOJrFLRtY+z0rd45YtxNbCJeXy+iNEiI0ssM6W9GdfpAnnTedFOgN5S5XnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611618;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EA5HFR69zZBy+mgDO51UOgm0WbhC20ODgETm52mz7QM=;
	b=X16AUjp6crQSwfJH21+azMJpCVrpC0QTOC8WzIpIS5cjAw4oxEe2Op/MqJBsEFo7qCvJ
	 HJApOdNuHBCJNme1/qgaDdgIidngrKLsY37Uyx33AXGVchkmrZWcCLLFqZilJlKNbg0K+
	 eacyRH1ZIhHPvd+JsJwXhe6eXXtxLMuuElFxhgxs54sJTUHIUafGPV4UsSGKCFLHPJrVN
	 S4ByfJuVDcCrNGmI/PQGfc4A7atoxD2PjdiSm0ShscqYTSYh9KFL68QzDKsmpx7rNWjyL
	 ROgkLM1DzlarDMrPWThVVlqoALedyqVZZekljULmEInNEX0LO8LRakC3OyZLdqnm50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99720606A339;
	Wed, 25 Nov 2026 13:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99720606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 3151B83B;
	Wed, 25 Nov 2026 18:30:10 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Wed, 25 Nov 2026 20:59:09 +0800
Subject: [PATCH v3 3/4] dt-bindings: clock: Add Netrani RPMh clocks
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
Message-Id: <20261125-netrani-clock-v3-v3-3-9b19d320f422@krgm.moe>
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
In-Reply-To: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, SignKirigami <prcups@krgm.moe>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=783; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=x4h8pJqpTJvJTsPIKbUINDQEJcme83fipXfnSyJYy+M=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrBtvCMmyjJtAK1TLcvBFXmJYmboRRVgSORwmi2
 lBNk8GEciyJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawbbwhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqINpwv/SnxsUkqpqUQf/o675jXWU1sIi2Jl0Dk
 ZsddbU3xMnrZ4iaD1RpheVcr8ShDHvkLt4LMoBobk9gfqRh1MaL+xCMHy4HYSVNj3JvVa/c6whL
 jqzZQwTmhnp+iUnooLnF63IBHLvBZjW83IKCqRv3uVlCvtxdBWwJcO1sT46vTANexcCFsL8Uvz7
 bZb/+sWaxVDE9ut9GC15Nia8eXef4SXkLsQ/mDTTmMEJQpzau0fA5F+vFmV0pR0xVIaEf3XZmZQ
 xIS27PPTbvJJqyXLtjSDNflXvuy8KotKiCkwHOLbpls+s2jtQmGQ4opgPLSBh4MFNXqupsA3OUs
 fiG53yQyA3lmQzqtEU9YLeCDvyG7e0lqP6SB3qlqoifrgfAgN8beW+Bca2xrCMQspoI6p9I9/Di
 EVBYHE2zoe0ItpoMPaPP0kvXfWCvVHSCt5CJJj+TRwYq3wWnikrfIFYKChHIECHyUYO38lH5zkP
 MS1X0OSPN1m4dJxu2+NZW0YixWkLvsM
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Document the Netrani RPMh clock controller.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc..ea99ccc4d 100644
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

-- 
2.56.0

