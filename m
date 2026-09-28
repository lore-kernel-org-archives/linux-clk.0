Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257744E0202;
	Mon, 28 Sep 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611060; cv=none; b=W8LNJWNXHrCpPXvfYaM/FSsREJqz6RHRRZGiAtZtccMC3pJF3DVPUOh7tQcaTGW75HnSXweH9SJIuP7eBF+GjAc2iqAWoctznDAlfQm73XDO3wHadUYjmLF4blqPEGfXhmAc15Pb1e51fzj+BmlClC4zT9BCrqjns7eBVw1+Hh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611060; c=relaxed/simple;
	bh=+/ARVIPj4f56djx3Ezh4ZToCMNPoyd7Ue0tRG/g2D/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nquokkqcbwr5ZS/rPwyyjp3mcmWqoM/Wc87kOSnD25M2II8GBCFJNGMa8bczMX8S31v0WUkJHrwyEgK5D/o4ER/I6fF6UKAjUq0mWeWz9KH0lu0tQMEDQSYvSTqvUO24O1TFUB+GcWl6x0jdrK3ig2+MzRQFl7xl8i1tKHeXQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMMSbLs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMMSbLs5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5428C4AF12;
	Mon, 28 Sep 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790611059;
	bh=+/ARVIPj4f56djx3Ezh4ZToCMNPoyd7Ue0tRG/g2D/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YMMSbLs5YhQkXSElJ5Meo1yHeg0MTSWlzZL8Wbrq/HOU3MrvO063sTBRbhNeHXsPd
	 OInz47JNdExxqygksL1tVJnNiKoFqo9EF2uif+fZDAKuwAo9FpfArPc3GwZUKfq1oc
	 NZDgWUFmS9GycmLtOhvSebXSyW6Be8iPtosCrvwQqxbFfEG5TVK0qJHVZ0nTXaWOhK
	 96xhfrejewY3/0N7p8+pk4Nr5UIX2yng+eTKoMshs2fym1Pe52vQwAPDicI5cyjRRV
	 ApS/fi+3Kz55yZXbi53slTdFi0gNEzB/o3JwJ0Va11SMEpWt60zWI8mV4ao9XL/g3x
	 raO/Mg564nvBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E31CA5FA1;
	Mon, 28 Sep 2026 15:57:39 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Mon, 28 Sep 2026 21:27:38 +0530
Subject: [PATCH v9 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-master-v9-1-2277f09f9a09@oss.qualcomm.com>
References: <20260928-master-v9-0-2277f09f9a09@oss.qualcomm.com>
In-Reply-To: <20260928-master-v9-0-2277f09f9a09@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790611058; l=2671;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=EqcShn4lKqnUcEIX4DZ2sa+EOeN9w3AEP1mmSm22Vj0=;
 b=TM1SJBp7tH2hiudoY6cxOGN8Yw7u22o1dRULwet6bK+mW7NneRBOWhaNU2KCyJucBLZ1GONOR
 JVCTUtNDf01BvkG2eJUpH7xEZtBrYMGYwUmu7vm+a70ud3GwAiHzJuV
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on Hawi.

The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
start of DMAs and Codec Interfaces for the audio usecase and can serve
as a periodic wakeup source for the DSP.

Require the LPASS LPR and audio vote clocks to access VA CSR register
space safely.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
new file mode 100644
index 000000000000..601da83add2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
@@ -0,0 +1,62 @@
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
+  The Hawi LPASS (Low Power Audio Subsystem) VA CSR block contains a
+  rate generator that produces a periodic HeartBeat Pulse, also known
+  as the RateGen Pulse. This pulse synchronizes the start of DMAs and
+  Codec Interfaces for audio usecases and can serve as a periodic wakeup
+  source for the DSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+    description: Address and size of the VA CSR register block.
+
+  clocks:
+    items:
+      - description: LPASS LPR (Low Power Resource) voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: lpr
+      - const: audio
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    clock-controller@7ee0000 {
+      compatible = "qcom,hawi-lpass-va-csr";
+      reg = <0x07ee0000 0xe000>;
+      clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "lpr", "audio";
+      #clock-cells = <0>;
+    };

-- 
2.34.1


