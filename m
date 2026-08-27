Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAF4963C8
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853150; cv=none; b=DTnooDNMEelLPTfoAD5itl7AkHCFZVyievrMETMeJ78d6Y91dzyng+rp+0IMw6AlMX500UkFoSCQYjno2/4dmL6lke3nAhBi3r+2LtgxxbhkxyJdwd3PyLgcMjZHsQKxKXP1QuBe/u1tWpnNUk52cRIW1mxExsfK2WQZBo+d85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853150; c=relaxed/simple;
	bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmWCiR06sbtJEriU1L6yCUM+ObPkGAl3oYIgQatKmYYArHvE2moZsttAHu1WYVhgrxe4RsjCHnlVTFHhd/2YOOdLfQlsxufM5SJxaHrBDzApy+Tt8vyeFcOS1e9p6g2dhXzunn93AIHqHdO0XeBXrSJDlx9ik40Lln5MPP1ArKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOhbLiwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDAI+iaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOhbLiwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDAI+iaR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdeF614573
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=bOhbLiwnothWZ6J1
	2k3OkBYm24gbYy7eH0y5xykv8V4Hh9DyGa1BsJkCUeMEt0owX11la+1aiTwRrWfV
	GFm/v6SA6mz7JHHuouJXS5aNYay5xcGk1QWF9g66GmfXxuEQiJGoSeAB/lAywKG7
	2VG/4jRJzIB9w5kxqoUjg2Z4ezrJs1+wggnugypTvql4jJz4gTHfP/o/0/lJel2+
	IjZxBemVfxU0WSXQdhACi4XZS2E1sk+WvVhF9TQ91GIng0RoX5pCQT+/cK4gtCRC
	G7Sjswly7Kr3mCkjDokOnW5bwNTIkWzCYakbZ5s261rDCxCUf2h6BcS9E0K93Kbn
	CDgSpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr698fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63c16fc5bso1800505ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853147; x=1788457947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=XDAI+iaRQt4bGqonoVfQJLhILldxsBOpG/cMfHFMA67EcH2q0rnT+UBMRJ6sfycegr
         PaZMmWbeld9wiAyB1n6y5Wsaygks9OzkCGe3nQN6NsNHEIQZP7ZEIs3l/Qxl/J9AQykX
         /4/KvJ55BeuLew+8HLeQ02nC1wHLhmkD0x44CkX8VY+cij9C0NT1j4HIpDw+86uItslW
         kXFUzxtmnsrGxyVBAyv9OrurTtj/AcxAl7JfsYFNUxTt3DBEeQUWj5e3IKo4a6PSMbEH
         AYlU9I+bdFRdZS5gNGZ9CKhgj+3Sau/daQMlOUvhkvw1m9QtvDkj96b9o1E7+9he79eP
         YYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853147; x=1788457947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=niira4OegRw1ATM78OfjsMknoaOGdh2hrWm42HAVKXD/1znrHEUXu77EWnNnGIuCCM
         snlfxXMeRAMsFGRooOI8K++yIlqgvEah3cqxfGrhYbhTRTWO+GIXvZ/i0KROjJzhW2th
         ckHiNgMbIECFt5KkS57RzaaYGDc3XuOeI9dySRncv6eUNX0rHtXl3mbyOik7/DH6/72U
         9GtVuYpbmNpM/9KTLedM3MOl55F4lArO3gxD+iVzsqD+EljByTzKzyRaeBGQ17xJD89J
         NHz5v3hmP/QnmHka0o66ZBUjhf0MDEeQLX29RUmC0zAkJl01Ssi9NhKRToz5UcT1uH81
         moFQ==
X-Forwarded-Encrypted: i=1; AHgh+Row35yPfWoyksQN4r50qxD4T+rtFg6Y+ip4e7tkxEFDjxz5JgUDyT6vmq8G3rL87Lw/oe3Kc2mZn6s=@vger.kernel.org
X-Gm-Message-State: AFuF++nrp3Hgt9/APCFZXg3GnjwAvxffn2RHuNEeiL8Wpn2Jd/5WkPji
	AUL2sPeHNNu/goEmoWLbVn+AmXHl90IMIMO/nCNeyEH2BiiW6GcdloN5KKt/ckr3cvxf1aRi38u
	9BYEiHMBOQwt5VYythQfkPnlFPmj0hrn44wBkBg6WHlwMcuvdqAGrHR8yeSMaecc=
X-Gm-Gg: AR+sD100POmEBglXGwAIvhUgodQk4jr19UzBLhowvX/AYZrCbAF5AMuwHX0jYCtSpO9
	CrLuiLa1EERsyHkRUvVTK2Zcc+87+VKnjpkY/VTGMx6r/Lrdeqpzs49sVKQCYh4zi2oeC4Ac6hE
	PyHD/+A8/szrjZwgPfS6lqbhUkMEjoP2R7Fkcz2B7Zpk4bugkXYBEaJrO6/HjybGSKpmLaFhVZ/
	Z3YynqI8sTNwB1YZbcjsmi366KAxYHdi2ApfifVwn1o0YAYTxf1IPYVMEsxA6kE/Ux+OuzHC37I
	c0/sH+74Gqgi05masA8qwfbjHid14z2MiNxrmoQuPJ5FydajMwwWasWjmDWP3JEcawxn8oaciuG
	9lQMSSqP2UN068OufFMVLslMAHuWbGJekir9ro/TvFewHGE8PA+Bp2C5StE1p/z9BtD3l1tdOFQ
	u9ol6O1oXgAX9nUoxyj3pw/uQ=
X-Received: by 2002:a17:902:da8e:b0:2d6:f961:994f with SMTP id d9443c01a7336-2d74dc6f7b8mr9361805ad.8.1787853145991;
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
X-Received: by 2002:a17:902:da8e:b0:2d6:f961:994f with SMTP id d9443c01a7336-2d74dc6f7b8mr9360425ad.8.1787853145503;
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:11 +0530
Subject: [PATCH v5 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-8-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=40gNZMEgMelOIHYYXNXXlGFmvf9ZjPxiwH11wpQwtzUVtCDU7L4DEV22kqGX1adVRYLwKrdbm
 yEh8szJeuE5Am01zVrVRVneXZ/Gek/x8b4hBqCNRza3I9Bty24eGWU/
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX0Q6ogGCJK6NK
 YEfykv5r9AHIubzzU0Z2FGbtdPaeHz+28ls2127gFdAgHF3gud5NwfJAo/vq6IqUTtpTV9pt4EG
 KLDTYTe7EL2EJGu5Aewdg9P06xomTXwyBDXwAXgGbqy6uXiS96HXK/JGYqszLZfQW4Ioac4EiDQ
 gFO6U4cdB2IMBxzlSUxMh5fmJQPKdq71PI19nYXETN1ZXLLFH9U4WpqT6BLjOCGhutIePeKs5sm
 DgwJfXyMHZwFKvVyPlJsU9g0yWxjjRPLkibtW8hsta2gUA2gxkkjpc/RzPx9L3urr8q/dQwH38+
 gcuEwkp4nMPg7uM4sF9KKdWFKDRzwSbAlDJddXbT9vx7uJSc76SbolgG6fAaJmrCwMneyGw+Ma6
 Gb/8MwsjbgkXlMX0LkUs9GrDwEpFt5kZmcIWvmdvr9OsZ/4s+LMqKEJXllFNTamQkiRCm2Erkc+
 EnvpKaI7r7Yy2snxdjw==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a90795b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 7hICdKYo5QXGy9yhxEosUS43Gk3NRZ9A
X-Proofpoint-ORIG-GUID: 7hICdKYo5QXGy9yhxEosUS43Gk3NRZ9A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX39e9EEfUsnNo
 V3uS9z2kkzCb/osmsdpuODVs0yd7oinUQaFW11RkinYj0IfNsp8wHvOew/VY3YcP9WhMLYxps4z
 eKDWNZv62sCWjJkPZ82KCGomnRzHp9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..2250526dfae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_cti_trig1_mire, qdss_gpio_traceclk,
+                qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

