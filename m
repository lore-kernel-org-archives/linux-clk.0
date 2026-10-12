Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C99361DC1;
	Mon, 12 Oct 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805980; cv=none; b=HnSNEpVzw4xh/PK17ffUXm7uuiEo7mvYt67vinCxav8WmTi+g3zlUhFxvn2KZ77j636202j+9MM7UjmypAmZoismeGgnj+JmsMaZddfrKOT27Ym2rmElBvc+98+hWoROixrfqwTM7RjIDLjyWkZ1OiCly9+UjED7BoQqEx8m5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805980; c=relaxed/simple;
	bh=Gav7Tv6ZpreVfA0NgXWJDq/A0By79CI06H40V1WXkT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6lhx8v8OPLEpW4Z5jvjPx5XulxDefaEobeBoJqv6JM5EDAMKpRC9WvN0WZfLwBt5KjbV5x6GsbuFELeR8lT/Qo3CpJsv//w3n106+wCEgaQmhgrOhO+MeVgT2j1PpsvcllxEtZmALIJH2hI8MYf+sSjBUNgPvAZMB2XbFgnX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2yzrk1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2yzrk1c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22260C2BCF4;
	Mon, 12 Oct 2026 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791805980;
	bh=Gav7Tv6ZpreVfA0NgXWJDq/A0By79CI06H40V1WXkT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2yzrk1cXdf5xnE16JC+ccgZ9/z+tYqL18ISh/hxOrGU1UqiDUPr2tR9nuFZYUXdq
	 CZJ6oe3blPJ3gZkzUXXXZtL1WYFCt5lJkiYGF8G9l1K4x8RIBal8bkwHwkgam+CPhy
	 z6cIvP6Qr6NDgZSAsqx3Zx7Jqz2tNumdnqTJTDEp8AcpPe1dgHPVo6xQ88tx5zEIL9
	 ZqijzrJ8QbBX2IrWk7th+ARTRAtPv6/RLCf7EyZXtikRwi+iXrzyhBCUTPs/tiXKWz
	 kTx4sdIhyDIPGzDmhX4VYP4cZp8A/RdPJ83twuY1va73IN8iR2Vyc8qsU+kAFSKdIU
	 im6XsJhSFojqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFF7CA9EDE;
	Mon, 12 Oct 2026 11:52:59 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Mon, 12 Oct 2026 17:22:58 +0530
Subject: [PATCH v11 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-master-v11-1-15009e3ecac3@oss.qualcomm.com>
References: <20261012-master-v11-0-15009e3ecac3@oss.qualcomm.com>
In-Reply-To: <20261012-master-v11-0-15009e3ecac3@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791805978; l=2721;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=DRay2zf2W+iUZ3uXswe/Ui/4wI7/rJwOyKRrUpLoIq0=;
 b=iCGQ5ybZessTEU5uYESmojbTww7EzvEM8u/IbWKT5/hegVT0vFOxZY+9EK0jWzOqtqzBHpIZj
 zE7gQxlc4nGAJFoterWLVFD2VJlU7d2ChBcQ1mouSNwkhhpRXMa7E/M
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


