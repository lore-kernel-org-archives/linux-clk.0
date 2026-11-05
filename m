Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855698;
	b=rnTGlAAx1046DxUn1KAxv3LRZjY1wijr6Z2X1M4g0zHO9RG7ZMRRwFXu/K8n4Q4rLtSy
	 8JsMpj9Y/V0JefKGNMMyK+CdQ91W9x/G0OLMj9g5YB6CHK5unEwsSHvQiaY8FeAqslcT1
	 TwP5WFzzVN+lWkpMUI5YwuyyGH/QAp/IQOquoR6dbM8K+XdV4d5BmYrRRLGhYDd6fAjma
	 nhOY2Z64Ii87ckiZPK8/08zh/p0BkwaUhUcphurZwgWdQIrGNUwJPzv05Q9eTtWHpsYp8
	 paZ0jBOfkYHDpmAVYjemytKUFZ+hRqeLYh6U7WIqifLy/pevxSjbCeJPYKBbUv2dOqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855698;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	b=CQB9ckDSdal7dYIGVFliHHLwCoW0RSyxT7wkthYCOQY6C5PAw+sS81adaxuycWHbYL4p
	 X9b6zUJYhukaQF0VVpCq/7FCjrSwtbRkYncfL9zeJ9j9Zb78NhXkb+EPVJZzx44GMyCoK
	 SxeZw6T+5TgE47+pZDq3sKT7Yv+q9yrb1v7CRvE5VtyP+J1Ns6+l7Z234PCDaLy9dP0Hj
	 ZVE74myg6cjL/IwdoqH4aNh1H5oY/3d/9ZZ0Jambc1nl2knFWFndZLrYeW7NPEfsD5uYo
	 NEQUsqZ+6FB2/KBx+d14zS7Y/VUYlPL2AJmv5UQ84hvwuJD3TWwOxTJpMCbh2HcDE2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnS1juE1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C920606A328;
	Thu,  5 Nov 2026 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnS1juE1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855697;
	b=ON/jHd6ZxRla2j6bEFJDPVWacFbNhnf9U8uWgD2c9LlA7vh9uSiVNktlzw6/G7iGI3UL
	 H+9QZnQwTq4H6YAjATr3KS6IX5OqCfPMVBPTTUG1R8q3innHh/FbCbIFND8vHagBD960e
	 v2d+Is1UAgbChKAl4WIlYfi1NbufjYuutSaw9usML2nm+Pj0MdBaJw9H9FCzyvbtsm/bY
	 vgU07G0VMQHneZSqSJO1scw27B+PC9Klcj7AX9hH3H6SKmILsfVokRI8ebQb166KK+D26
	 6nWCkUINt+T4yAs9A5g2FgXu7vhPPz0MrcY77FQlBQOx8HAt3tfEDD8lw7X/+WgJTHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855697;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	b=RWn7i4UT/OftkrGOEyCTe94fbRznTqUMyZlV5otdWCZsUbANnLglN8ZhuPqNb8Bm4k9F
	 ANls9vKqH4D/R9/uRLoLDa5QFTkE+/KnK8x5gc/IWqd2Dfsi5lxDPEd+otCrs1FB0Fm9Z
	 8kq1LyffCkdDsJsmtq7bbiarBh8xpI7f9jEexTiSM9JXnjepKKuEWYxrrcuPVCdPYKvhr
	 CtOIdcjT4EJ41/F0Lo5dpGZ/DhH7m6aVr6COPIN0xN0m1cwWVsyqgZzu88Ox4jyIPw+tx
	 ddPw/qlDGBLcgKDBTpQow37ZYkU/p68JZWI5Fv6a1ufnlD7DpW3+4P+6SzQO9sToyqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F97D1F0093A;
	Thu,  5 Nov 2026 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855697;
	bh=F/MVbWE/nzEllmJoCczHUTZ77HaNnAyLwGH51Z5xA14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KnS1juE1VkE+7oooxuJwxQ7mnhVY/aBaeHTQWLmMvf1lE5Q56LoWPxXrtxSsuot4u
	 h61ZXq3VEJq7p7j1abXu9Efdj9g+E1zkEudp4WsHvkdCRUK+BXLMLzisL1SvUg4Mqp
	 onoyRWuLnk9DtFdMcvoFjXjbI5aoa9fiGX2Yef706+6wu+JD1zLnb1KMqlPXpe8uip
	 s99rJcAaGGSRgN2NeCe21NYhEluc9aaZP/JznzNNDSa41NpgGFImRGX0tr6xK7kW5v
	 a9ZWxK/S/gqzI+wIt+TVY+H4iXqTv+5xHo/D1vyRC367i/urC9t6Y+YQQWZMSXJ/VS
	 mjDHLO/is7XrA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B0469470B3;
	Thu,  5 Nov 2026 05:14:56 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Thu, 05 Nov 2026 10:44:56 +0530
Subject: [PATCH v13 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
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
Message-Id: <20261105-master-v13-1-dbb43cdc60e5@oss.qualcomm.com>
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855695; l=2721;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=DRay2zf2W+iUZ3uXswe/Ui/4wI7/rJwOyKRrUpLoIq0=;
 b=41GtAaMqBw8G7yfq/rowt6gNbU30PWnVHTkBmhqHjxOpfu42KvxiLkEW246fvovnqf9Zftanu
 9VbaIXW/kI+Av35PAHV9MMCX0YlHu/nAaFSo41Qg27/+OEwJTSxlud4
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

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


