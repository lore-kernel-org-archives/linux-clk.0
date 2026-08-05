Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003203A1685;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926007; cv=none; b=Em5N69CVj8M4WDwGF4bGZboIVLdmQ2sXXZgVAuHczqN0bZRidJ5S1jUpaysTV70XUJKsQgph+GZLgKSa5BDIkWReb6zVDKnobkHa/ls0LHSEFif7C3TICNG+I/NJf6EGw6TV+1v7gbOqvfBs8vgy2lZT9vz/2SZC7hbz//sH6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926007; c=relaxed/simple;
	bh=oEa1rZ7jhjgKUm5sxpeN55GPhpoxQuvfkNNHnl/9FHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzFIOKrbhdYZ9VP6M7qMI2tpd10+okuzXFG6nt5AGRjAKYa0+/avwk+jiUAasj3NbYfykNJE2SpkOgPSScTlwxEB8tnF6xBlzX44IihtEnK2ckXDNJiwQDcGEf9NtY18fJg5Kry89XqsUCMaXDsjA96DMcBchcoBuJm+qf52ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUurDotb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUurDotb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E06C2BCFA;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785926006;
	bh=oEa1rZ7jhjgKUm5sxpeN55GPhpoxQuvfkNNHnl/9FHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GUurDotb9o5mdyq+uDPdiBdZWVl0OIQ29crG0XeTIxsrEEPNHuT1Xb408Xtm5necD
	 zXbFIA9iuYIG9CVZURR+ybIAZkarGtO+h2XPprSubwml+cuRutJB8YD2oJz4+KIWyY
	 m7L2A4pgpc33levjBgJJJmNqURLhaR5lAxvSvvVjjTvWqxdxfoMt6xXNokTWWeBJc3
	 qKjSbrqb0dJTdEaPV19o4FO4tTL0/NUqruW/fTWMZTm7uejkHQvFXd52FMLCMWK8jB
	 QHaWiffeqGS0zAo1LHN2w0r4xOkeL4ucHnar6/gL7Xc1Cr+07/kzbw4QKnpgO7lT6P
	 TbZLr38AY4VZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822F5C55ABA;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Wed, 05 Aug 2026 16:03:19 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-master-20260805-sync-v4-1-dfbcbf427c2c@oss.qualcomm.com>
References: <20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com>
In-Reply-To: <20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785926004; l=2278;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=qxVOLK3Yva6vAmZ6Xln4mzA/Miy1La7zeDTze4nIz90=;
 b=TlbwGrbaX0lNE/YcP63xEeG312pM2XUHFr9Gn7sx83abvUcHdK043J0ICZtKhjV+46AbVKLht
 MLSGIwWUs5jAX2VtpUBw74PBCNDxyejpyxRiE6G5310q1IPT2CKU1YP
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on hawi.

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase and can
serve as a periodic wakeup source for the DSP.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
new file mode 100644
index 000000000000..9935173d8bee
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The LPASS (Low Power Audio Subsystem) VA CSR block contains a rate
+  generator that produces a periodic HeartBeat Pulse, also known as
+  the RateGen Pulse. This pulse synchronizes the start of DMAs and
+  Codec Interfaces for audio usecases and can serve as a periodic
+  wakeup source for the DSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+    description: Address and size of the rate generator registers within
+      the VA CSR block.
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@7eed000 {
+        compatible = "qcom,hawi-lpass-va-csr";
+        reg = <0x0 0x07eed000 0x0 0x14>;
+        #clock-cells = <0>;
+      };
+    };

-- 
2.34.1


