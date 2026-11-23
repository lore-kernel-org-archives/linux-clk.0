Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463514;
	b=QwN/C5YfxBh9Hxc18japSnKR2skqUFQrEpHAcJuK6ni+apmirsYpTt7WC/08NQnvySOK
	 ioXgk4tqqyVRpBPo/uuRwlGoizelKd4kaEYWY0OHKWe6pjMQk5uWLeFTiT3Mol8Q/DRH8
	 73/QZ2COUhlz9e1VziVdQ1p3W6LwgJb27K+7wCBzXYQfv3onFgdHd1d1gd41hMhvc4WDc
	 2zbaDKhZvM8TBOo5Fxjsvpn1fnUFBnBVtIpgg+tBhopVAUbaEZ6UrYdukJI+aOUflBuAV
	 g/gxC8RW2PBi8ocqm3muN2anpKJpHDjsnizsrxVnUk4Jf+7S+ycHpRBCqmD3ioWeKnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
	b=I3HuOi96uhG0NzYzE6xRypcWNOBbFahU3AS0gaXUwjvIb6VbcUMn050Ge+r7SU8a2fyR
	 dGNyFrsJL5ey3OLmx5xnz8AWHkWT121toIDoBj7VU39gGb9Qrv5On1EeVZ+8C62zcSWIC
	 70w447WLHeAUGTy375feIQCW7qni0DMjVSLoilvS7KPvZZwuruL0E/oIU5Hs739KcbtML
	 dmarenBqcHY9J9pUQTQPwbnonufSTxglNQfn1OyyzvMv/31gqbw4dSbNYXdPuNn8lDKt0
	 cHKAehwM9ja0SrdHjEZHN5SK3GDB72UFpZ22I9FMVPss26WgLM8w1k1ZDxI4GRUZ1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D30606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4641093889
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=; b=ldjygAZVjoaJIO6l
	Pj9FQlPlZK+MQHQ5WIvAp5lEGd34j5yXImG0EVV/lBFvQb8XTlHhve7qihg6MFKl
	mmC8wBuHegfJImDQYbzvZzhBbGPPPBPoMKDpqH71DOJxmwtHZjyojXLbD/wTCPsU
	BkFHhVrxup6jROy1QCckwDcmFtks4GX4VUwPOPfHXAGyheLPlXHDQ7OeTsUd39P8
	vR8yB9Yg3zzy+DADR2Klm/jX+DtgkIfTvMS5Tgen5+RopPHLjDmS6/pINpTpW3mA
	O7Y8v+TLL0ZOp1hjdIohAI59NjrE5cUrYnzpJ0KrQ7SymlXKG5zlHJfLQnN7FJwn
	TdxvLA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t490-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:51:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5164082eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463512; x=1796068312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=B+Pju7+5iG2yB7Gd/O+tkt2ycQff37Qs+miV6J+2bjmE+9t/JgR58KRHlu7huxeaXL
         v71bTsLdq4g43DtUdqxF199HKwsoTfy9e+nfzysp0k7xnq9vVgGBNlUXEiRFEC5ap9Ba
         vj3/2wGgcSInKOIgxLacGa9i3WfngV6M0DD5fgw/M29eN8GBm4HnmLJk+N7opPQStxZd
         C60zEBDcdOMtTq14koTnHqR3BqYfVxRDEmF5/BeOqxUniBjUX+VbCSwRclMn4yRKGx3/
         IxGOgMSHCBf4cI5SLtRcD1I9uQHBnjm39z/BIITF2og3UFHNHszbjW1KO+5x0vbDxZUK
         qMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463512; x=1796068312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=o0yxtRY+77ETv9OWx+zLpjwSvgnmqkptwvG1lQe4mySQRXqujKxXzFZZM5vBVBbeNR
         BFQBaOpc2x9uc3jKEO+NZX87XtZOxZEzqUpNboZY+/1hfDjjGhHTNHw42KLbVas2bV3P
         h6CDIMlTfHO5oAoMKIAb2pA5xEcN8tnfWg9OzpddjiqKwAhSe5/NAhk8kkbL+UZBLF3y
         dbIlgsCiyN650I+LY6ie6XErjOVKNHwvbZSSxCGKMDQKj5I1nAE0q7meqMhvrD+1h5wa
         Nb2AFn5gpKQ3ZlTS9/Kdr9p5GKw0bW9HbH5oX+MTWJ3J3Ks6Ie2Mqh9mxCKdm3k17M1f
         DiGw==
X-Forwarded-Encrypted: i=1; AL+hErF6s/utoUgYsYZn4E+oLnUyKa4l2rzFD2W7Vk0DVRg8A2C4N9b/siO4RVcL/6zYZDktTx2dwfZ6lyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDwn9mUxK8dlVGR5xEI+5A0NZIZzCmDHIXBvNnVqmWjPGNtiI
	sRqWJb2ql5k4/uP7SN6j+6z/cK9esjy2tM90FRtToEO0Mi9XKK8ItjZicyYlWOkejAKI1lI4ijM
	eXv1IdmU/4bAZN3p1rc0UUNUF69Eqi80kLgcDii8FAFlLTR255QtJ04WbqncNNMI=
X-Gm-Gg: AZFdTZe8WtP9X7R1clRu+EKqqfh+qSYdR8/iXOF4fTC7dcSjVkcjCeDnNW0M4iETS2N
	1p06dYvKZhYWRf0peTf5so3eCmauCYlk8ZItE2JJZgP3qV+EHRL1UjYwCFzd4HLqgmr0DVd0OHz
	awDOp72l5q/hEqer7v2PVEcvfzgJ3CcX9+jJJnhh6StOXb2zT88wtXfF3pKAzmbXyeDvd0N/JOh
	UYVOoId2eZwh2ab/BSqrEs2oMrTyu16Xz6+ZO+hE0JlwujOxSKgZXB2pvYUI2N1oj6FnjgB3S19
	QvSe18RemVsnL56t6NpgMXyl9DLbPrTqwIb22CLSeJoWX44rNvCPvzZbmZPUOZyJhnu2xwJ/BHz
	m9ALR32F28s0KHXX8R3DranahJZoewZr7V6Q9eZilyWx1MNj+NOP27KG3nW5wsNUnvSxlHo2kmA
	==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653993eec.38.1795463512107;
        Mon, 23 Nov 2026 11:51:52 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653956eec.38.1795463511427;
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:32 +0530
Subject: [PATCH v3 01/10] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: DfNWZ3ZkZq0p0z84l2DEnG-srxkTx4Fk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXzeRCaMGn5zq/
 WNEpBQE0GzrRth4HMm/xY9JXcActtSxbJj+pYe04L+r8Gyzzpwub7f/Q4qszToSNiTjtIDxH7Hh
 RtQ6f4JPQifJufjSjdDvkBd6rZi/zP0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX6YpxT2RkAYPR
 qOKLzC2uYw5G3JxeGPVoD9h4TocqGVGG/InJFdJkuAnKOmKsILwYi9bvmFdXfHrnnCsWj1/EQnQ
 EUu+d1nWG/z+llWwyy4nLOm7Gk2U29/E+yDaaH2ydFC5OCeJL41SDCD85Zvc/w6PprRuXdKrLKD
 Xbwi5Vk5hdrhQK7VQrGo8WZlI6aoN+dpR/otXZa1eVkvMrkSbOP+SqQDikCqwZNB9RUCDpRbixE
 lPRr9xGJgSaNVFyZBDeYapzcODBwMFsXsngFNl4vMt8iPHSpwbbupA0+dUUYl2EhaqJGP4mpxJq
 9XzsaRmK9wTFiHe0Zxwez2jSlHRM8SBjQpplaAMB/wFnXRfRiU/jlqiOvQG67Xf4yGzafIzbGrd
 A7vcNxJZXvPlxDrpmBXigqPsWtxn6L4eSNqnzwuNaGXCAzi07hDlHlowiYRv5UjSwOoL3BkFbXK
 SFpUeHJHmcFjggQRw5A==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b049958 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: DfNWZ3ZkZq0p0z84l2DEnG-srxkTx4Fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..76fecc6f7cb376770bfec06f3e1fcafcd480286a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sc7280-gp-mnd
+      - items:
+          - enum:
+              - qcom,qcs615-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,sa8775p-gp-mnd
+              - qcom,shikra-gp-mnd
+              - qcom,sm8750-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: |
+          PDM XO4 source clock. It is derived from the 19.2 MHz TCXO by an
+          integer divider of 1 to 16 programmed on the parent clock (for
+          example via assigned-clock-rates), giving supported input rates
+          from 19200000 Hz (divide by 1) down to 1200000 Hz (divide by 16).
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm
+      - const: ahb
+
+  '#clock-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm", "ahb";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

