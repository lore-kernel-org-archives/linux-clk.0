Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17641C2F8;
	Thu, 23 Jul 2026 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805042; cv=none; b=s7a9kS1aqQG5k9s+8ROv+iUq3XBvAhraxN4jcxKDAlZZgw8MRQeFoxGmC7c0pLosJ4++psR97DTKQp48BB+0+Dh8d1a54DCRWVcOzC4OLYC5zQDmy4vML+7/0NqP+pFj9baAwHPHLBT+NmWGEuDZg50kI9uMX/Yt3SmGMH6xuaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805042; c=relaxed/simple;
	bh=w1D4NagMFdQ9vb6d1u9picWYWj88Rz8X3I3r4aqAjgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOPOXlDSG9cH86gJsOsmrJD2/RKcc9FgRliRo3oYucr4oGAYRrSjCraXXdqXyhR8mptPcdfCN0y75ycwl5MQoUpqj7n1A3gzBagbResZF7vUT/wiFFYdg6HuvDM33uJSaxwpw+jrDmd8/qsP5kKEwUIGIb1eO6HzX8hwzPKEDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpbBGUHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpbBGUHC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFEC9C2BCB8;
	Thu, 23 Jul 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784805042;
	bh=w1D4NagMFdQ9vb6d1u9picWYWj88Rz8X3I3r4aqAjgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GpbBGUHCK6IdIlWTZ1XKO7EtFtqYpX09WcWHGh5oqU8gKlugs4t5TtZgXuDb9fW47
	 bWpOKhFHhlBfJIHeV/LNwGWfFv5OizDG/Ox6udKK7xeRL82Yj3GThwESe9imBW2Enm
	 5skGvy1dmpKlbjqBdorrGAMcr9oKYVWPMsNl0W9wmAzVbt3KaBBkuyN8x1bAyWJvCl
	 ScfvVvPmu2/+S+H/7kwIQwmdOdMYZKXOkWvkYVJgAmhJDN5ULFGbNCp6PXimvhRtdC
	 vR3KtpMp1yxAUNRrZUsPO/SRXCQmQvzyAQomEOy1YRZNjMaV7GM8OnonP6DRrm2jA2
	 YzT4Ncajw8ccg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9B4C531CC;
	Thu, 23 Jul 2026 11:10:41 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Thu, 23 Jul 2026 16:40:40 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-master-v3-1-3d67b79b0515@oss.qualcomm.com>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com>
In-Reply-To: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
 konrad.dybcio@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784805040; l=2086;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=wXats/x19oW6Nca7WCy8RrKe08FRJ05fxSnavYsfrik=;
 b=Dl9qolaX7EA0a0NiPfFECyZX8VukxMAf2q6zvexRzLFYl7i7f6QW9GQxUMUp0d2BrKYnBrKTY
 Zf4LnNzRWarC7EQRaV0OvoO17hF5kWApTAWIL0zeZUyso3iCdUQdu/7
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
---
 .../bindings/clock/qcom,lpass-va-csr.yaml          | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
new file mode 100644
index 000000000000..b4bc33a86640
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,lpass-va-csr.yaml#
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
+      clock-controller@7ee0000 {
+        compatible = "qcom,hawi-lpass-va-csr";
+        reg = <0x0 0x07ee0000 0x0 0xe000>;
+        #clock-cells = <0>;
+      };
+    };

-- 
2.34.1


