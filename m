Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE14E66D4
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021893; cv=none; b=NwA/sGyzYhRlnn4zM86PDBIwIQY5aPovzN6qU1hIao/q7aEeu04tMkde7AqUsUnyrB+Q+GcAdC/XqCGSZZualJngH0o9NlsKMixaTE2WSv0e6farFmvb8BoF5DExk8O09rg0PODi5iUmonFuhB3XyRvuMCi+5/m78zI97tezWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021893; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kij09577YR8NSKdw6F6uEbPBB5KTijyFab2bpAPTkXkdPAYGt57XwFVWG814W+bVgpLG0J2oXFNenzM7iRlVR13Hkmd2H/2tDbNYBNOeCa0asQj/vxw8SQ2Orm7awhmLSP4LKK4b8v1Iy6C5/ommKzkMyl7bCzqFRbi8oiBvCgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw1VGvWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gz6s+56o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw1VGvWD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gz6s+56o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHQUKT840950
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=Nw1VGvWDcRuOvcdr
	EbE6sGvjtyEPI4XcPUD++TzvxNaj+u46lzdW7uttqFc7jNMUn+cDTdaP1Q1Zu8BV
	YTPgkLqmDuPUxKS7pU4CRunM7yorQmikpqj36mmVD+exlqfbvTcidmXTJZknxlHz
	4P2TBUDbdwHM+6uR1E/ifnsR5adue4UE4ohsAsjUTWx/BFBtG5C4IQ08w+N+c18d
	UN5EdxNUog61cdtmyFJqmUtuYF8E91/Lmga4VBSfTcQfwwK9Q7pFBeqAg56AhMoJ
	xgviQSzxvMdPufZCX8JJKl8EfzGZQT6KtXCaTlU6bRb/7HZcAQt7MT8/gjHqn9um
	03KaAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4ws752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7fffbe0so107539866d6.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021890; x=1792626690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=gz6s+56ojRLM84w/YU+3IYraiQgIDPF9uc7ILdK5LXIAE2YZdxSSTX7d2/CFMHKwRW
         QkiYCSey3Lxi4OOdj2UR9/I/MBpEOrvXnYs1kBNiMZCOiGJBtP2Oi23cLpQb1L1ZeL3d
         0Ogg9slJmw/ha9xNMw4y2+TwwqulWydL+DOJiIxmircFdsASDtO1oHSTQ04HiUrWuUem
         p931y6IuzxJYes60BCHUUUuGN1YF/m+S+3koN41EcoioAlecv+0qZlFjZr3xhP+IfcwU
         i3YJ39sfnlJMNKlwu1W8UKB7ltX0JPokULMoZ4dSpkypdi5tVpMjRyLz1OocPdX4z+zu
         t1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021890; x=1792626690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=mJMw9XbhR9nlrFw8+iMXkJuX5I1vIv7sRVfH9lLHubyi3C0DVxbo4i2rn2VqZ+hey9
         pDSzLfYby5GSwtr1M1SrfEoZxpvi9aRzOUCANajrhPGC5Goha8Y4T8Ra9P5HZIkT0gIk
         RlOyh9uxJoqPUhTPFm/ssCxJqV1SApj/uVcDyKFIVWGRGcmy+c/FO1xTU48y+qg6KS6u
         Gje1IxGAJtSt48vmmSxL2eD01f2tNuMV5xI8vSWslNUG4y/55PNx9SZEDYrnMCS62nLn
         KHJ3JKQC5Xtl0X92vN380L8wVvQt1qhjoyAUiHPN3G3szyfa1v18TtBq1dF0NJH5WS4G
         Yi+A==
X-Forwarded-Encrypted: i=1; AKwUvBwNcrvf1O6woudnQtPIq0PXwtbt9asC0lI6unRW4ab/ZEbwfzQIXv0C9J41lL5H5ts42G23CDOkuRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDAc7dpApbYEEua9kmvawgHonc/PNfnbSdwNMqlRXVHPLnkail
	gFHu3QGyvbBl4Ln8RLuI6K0YwEOwJs/OdUbuuu3Al4DgWQXKXgEE3FDAeNgsRyru6vBd/JWr+cr
	k7hLsWO3xaHoKMIg8sM/JlPGtcFM9DDCHR1/SgOZ+Ct0P1zMU2ciJBKOQO8t5/8w=
X-Gm-Gg: AYBFou0N7Y8mvr1cbEDP2hZDDBK2GS+zFw72tuzO27x9z+5I2Dq5cJsNHl5Kz3mPAsl
	19JncDHkg1g1tO7bFhZnxs51XUwCtIcE7r08F8M6vPGeOIxNcUMnkCwidsSQixeIiYEnkEVLRcM
	kG+YKK14zHLefzHOgeOBSdBQpP+pMqWn5+mF0hYuEjEz4di/wy6g40+HV5vmxCnZUalsgGrDUE0
	F/T5hUf3wZ7PIbJTI/9LO25K0HlBUNyHcc3iU0RmmKrq+LXbR3a7F4xGLywB/2UORCtSRw+rg4S
	RGY2AUSymjX8uNlyVZkedhS7YVmuFZ7xCDUtzyOQZiNnfVSF2TztKHtZMUHM8nQEbpOyv0/Ylaf
	XaBymGbPbQn3T/sQ6fsGHwZ4sQ+77Hqveoy4YsMDndoZlWIOlntrP4kLubriQ9dDc+w4u+s3fTE
	loFLXySsyUc1ai
X-Received: by 2002:a05:620a:1a0d:b0:93e:6394:5e37 with SMTP id af79cd13be357-93ebd1c4b2bmr2843093385a.14.1792021890122;
        Wed, 14 Oct 2026 16:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:93e:6394:5e37 with SMTP id af79cd13be357-93ebd1c4b2bmr2843090785a.14.1792021889684;
        Wed, 14 Oct 2026 16:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:13 +0300
Subject: [PATCH v3 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-1-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YF0Qqb0Jsn2AzfHSzmdbHfGJDrdky9Vj1BN3Yu4/ugn
 LV7Gg06GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRgsvsfwW05kcdnlhbvcLu
 f1Cl5RaVK9YnDovxsGUU1zxnNBEUZ7JzLHPPlirfdlxk2sWEH/7WTspHKwICAq54x9VNc5DLEGf
 v1Xizg+n3mexIjnuO7tvXn+jlVHF8uXCWS4hxzdbfC/anJ5oIXPsj9ldn8/RHP3mmac75Yjin8G
 bgE+FtJw3i2bluOwZ+cTfVvnw+2Prt/YnKGUx/shQvuEQeKFpqKHlpYewa7vjo7vsep4T/p3a82
 DnpjETSrb5KVluOL4zHYqIy7zV7OU+wOl6hPLO9SKLBp/5E3MQ+v6WCTntfuAQuejrxefKGCht2
 09VrKwofCGhE1QfvTrcrmneFK1CkVccjvPjKn11FM+oB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX8w34WD6LOKtO
 OYdmuiQbIxVPIUbR3A5mYsW7V/VxNxl+M67lSNZ+PuR+4psxyC4hTHECze0qbCp0zGS4J/gjeyM
 BcOF2I4grh0GT6kG/1PY9eHuKGwxVzg=
X-Proofpoint-ORIG-GUID: svEb-W8BvK6kdqTOAcS4My141_mDS_Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX6oVdAHPtUwQF
 gBShN3IwonfT4JdZWfzk5AFFK4RLDR+kK+EyMrQ3uk5ET+3XA/8r5GiR8fiEL6eTKNT/O5b/Rle
 pdCOAe2LVP7fzXebQoO8EzjUWibKGelNwFdKaZLXQzGOiQIzBzkfpwnhxpBFs5KSkxgDGn5Qoom
 uaHqXt3vx0a6gInZohiYnnbRoXepSUiPHfr6Z/84TEweTsWx8l+GBOtEBB2WABiIRz5iJiIb70a
 /XCAL8K02KcK5adkNCTfnyueshVoCSsddydR1/soKsoS6iveQB7B4vN6KPACtgNf4EH+n1Cftzc
 ALL2STpdbvwushVdmhLciI4f9AiLRfTsYCbjS4kJ+ndSPhvd9FQM/lYBxTFQUOhejTlqPiVx+vz
 dxKsBtCkH9dxAR8itPW1dNGAzQiwpkTiAsr7PJytRTKlGkLi4MpxL+/lGzxZ80cHamN2Nz+RN22
 OtKSQQbv/Jz2aLDbkiQ==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad01582 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: svEb-W8BvK6kdqTOAcS4My141_mDS_Zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140095

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
new file mode 100644
index 000000000000..1cc63a6adc7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,wqhd60-nt36850.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly WQHD panel based on the Novatek NT36850
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Truly 5.7" 1440x2560 60 Hz LCD panel driven by the Novatek NT36850
+  controller. It is a command mode panel using two DSI links and it is found
+  on the display cards for Qualcomm hardware development kits.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: truly,wqhd60-nt36850
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  avdd-supply:
+    description: positive bias supply
+
+  avee-supply:
+    description: negative bias supply
+
+  ports:
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - avdd-supply
+  - avee-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "truly,wqhd60-nt36850";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l14a_1p8>;
+            avdd-supply = <&lcdb_ldo>;
+            avee-supply = <&lcdb_ncp>;
+
+            backlight = <&wled>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.47.3

