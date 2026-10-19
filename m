Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB04AA595
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401498; cv=none; b=HjGnvo5WQL8PEy6inxzx4l2nY35CsIXLPUPUA2uCtmykYjm4A5dJIGMgsU+MXOZGy2qxE8dPBVGRm7EUgvjQDw48eelLsIYDbR5LrzhsCCdUsC7tFgaN52nw/x7bzUx3BshUdgG+3LVZ3c0nfkow/JJC0hi3/aLd2pyk89h4rjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401498; c=relaxed/simple;
	bh=FUR3zv3ZZDVPFSKArK7sPMtEQuW7+6U9gHUlSMhh/U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2AD4oUfr4436LcjkjP8GWehJZ/zZajCJTip3n0cO6fMQ3mhEuNnb/dnWwu2s0gLKaxVkop4G74JJuzecyfYeJ10cmTyyFSLZSM3gEncLS3TMBV/OmSvWuCzsoZ5imC8+2O7X/jJDtcgeKMVLxS+8qcHciuGPTbTR4ZfxjMYeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khHrW0tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub0uFDKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khHrW0tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub0uFDKb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OxPQ2752524
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=; b=khHrW0tSwhUduI+x
	e/J8OB76mrxEgyhZBdOQpu+RAdcFMcmcg75fIfOL4YvVx1j3bxyoFMmO2RjmtfB9
	iSD0AVSUez2w5IN5AaHWuC59SMnJGPtaFKuxEDq6/TbwbTXsX0Sn954enSDm35lM
	tbPCCTD5ZlpDrg1JSAotnaYvo7GD3MGmcu/KmpWqQk8QIcbCrZQ5sE3olrgVPxur
	AEOtUi2HbTrvBsl8GxCcMCPu/e3sIaTukddA5uIxwvqk+7IYV/uOkKuPsL83Rwj+
	3FqkDofr2sPOfouwP1T7hoqWCz9n2orx/hCWZyu5sxXqznTVABUg8FmAOGJ35//K
	SfC+cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gb7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so527977085a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401495; x=1793006295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=;
        b=Ub0uFDKbyNBjKwqipLYI5viWuNTul5RUWfduzmD3lGGHzPE5KaogqlkGoR1yNWh4Bu
         fi2gq3fCfGj6mm5W9QJ/GVVWeMxGIAFbflg7yTAnCsqpaWqMmFaOY6uV3k5LMe2y4ssq
         SWk0dUvqRu79BVSovWjx8lVUHt95/VPS3Z/Po90m04HTYKMCXdPaIxgvH3n1drps1vjr
         vZIpDFMsoa5y/NxQbUfE/wWWtjzF6K9LzY5P3Zg0wWR++vB4XgzUxn8IHH0bIIrgwAo6
         /XhUdqB0qYaYEwukJHYmH8XfO6m6FLbL1J7JDjNXzFcCpm02Tu6XsI37ZAZgYe8Bs8ar
         sybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401495; x=1793006295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=;
        b=H3/su9AQPtthIzw5K3Dn1ot7TcV1JQa/i5Fz+o42JWznyiZwY7P/RSnzZTUH7gqkL3
         jM7CkZDv0UoLxuRK/t9RuzOCdQsXgTT7zw2DqlqjtLrkrgWWItbWGM+mFh1S5gf3B3fT
         COPfyUNbq612699lGBv1XqFh2V+0WDAz7T+dydcQBm/d3t66rNOI3a5n1sw2GMZlkxXC
         jTeXsvv2rfd/Ik43g34BPl6oNdRv0adSoWgtVE68DkM1TCKYUjMFfJNVa772yObvVqTl
         GvH9Ijjl6sj5CJrZ7Z3V2rWaIDvivJfBUbgTiv8/aWpxgntZuGUhino77/GFsvIZV36d
         RjoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5ko1DfmgT+ATDrRkWxCGkV5KifCvvDnqYWJ/O7qEp9aM5UV8WUvqtdlotHAMVkR4xqM3CEWnFDYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGtSKNDzp5/CI6NskjZRPKa/jKESZsdsF22azUDA1QmHokfhTu
	dbZX5jFsVRITS2AKiqGBsip48PPqVL/vP2S3PFVCbU3dRcbrK4BsAaMirxvT76ASvXTlP27y/1r
	larMgbG1IGn0ZjkoCiUcvnxuoXunvvUJeuvmzyu4IP8yzERoBdtfIepiOHG20cEI=
X-Gm-Gg: AYBFou0x5XbHiCP9Hb0t5mmYHJlPTCUnCR6ZlvJRL0SKN6pInHFiwlTH+7bqQ6VUIHa
	IASVqxEeIxBHOJMyCytDxGgCO+10tlLen/psZAiiOeK6hY1P9PmCrd6M06GvRuPxkgB5YMYiWmP
	MYRO9x81i30cJijzHqC0EKd1v2ZoMuNWFDSqfi9FfhVfdcaKWqgC0lWcDcKrx1BnRsrjzJX27Q+
	F8Dpal0S8cI9CCQKzMStXWT0dBvHtXkD2jU+IaWtXvyHduGcJaH3IjHNyLMOcTsBxHMDtmZIEA2
	TqqLj2i6NEJILm749b25mmbb79pB0cIENqpu0zwy7K8iaHT7H4rimYlpIXfXz5DXUsuaMMaMdp3
	624mFcmUy8y847iTXy2UIrjds2Jbevbb9C3pfakkhXAtn49pSHl18n0ILAklm7USDLmdrXq5YXi
	mL1lY26PiWf1EA
X-Received: by 2002:a05:620a:4547:b0:93f:1b70:52a with SMTP id af79cd13be357-93f29d53d1cmr1275117985a.46.1792401495352;
        Mon, 19 Oct 2026 02:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93f:1b70:52a with SMTP id af79cd13be357-93f29d53d1cmr1275114185a.46.1792401494838;
        Mon, 19 Oct 2026 02:18:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:03 +0300
Subject: [PATCH v5 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-1-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FUR3zv3ZZDVPFSKArK7sPMtEQuW7+6U9gHUlSMhh/U0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBPDDiwCNLY+8Sta1NZOSsWVbU9ix5MG3v7h
 niSHLtKtH2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgTwAKCRCLPIo+Aiko
 1YtIB/9A6QWWUiEeAwS5BszeA6o206fN2mxnUbkWpxM42EsZXmNaMq19doW6gD2ylyErAX5rwmo
 FkFtAQFQai6eWSn/s92V7+3OYpBkpYkBKdKNxBja+Wh+FNZYdcIQxw+482wmF2mnNl9I91d6amL
 AC+sY6zg64VP3R7nacc1FH76S6z2byaNCcK/DWWoChEPMCgIOzOI8jOF8ei0RR0QKGnqsUXqkAf
 swgUsac+00GTJI/BFHVsMTH3g0vt5nouj6phgM2ugHmt8KlGM1sW8t90NmlJzANDaYnL0TdTxm2
 oSFB4vEL07IW+5FlNWj7uQypEYPqhn9tLWv7RWJ4elFpmu6X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXyf3bz17Zun8s
 f7Sgp3W88kbq33xUu3BTH/29d5JfFbPIm3K94f8in2+R+QFZuKZEEnjLWKYVDtWzRIijAI02Rj3
 gh+wN8iSPJ86XUo21DB5DFUOk6XVE8M1fChU8E7DfIGZdNLh8sXDxQP8ixvK/gcYm7hYnwJDVth
 ClIAS1pchcg4n+/1hSDMXzlKEM+gNJ2criOUv2eMX7421lF+ZBfsHKk6Ta99nARh1rV6KUgGF4R
 iAkCWP1TPGPEAkfBrhvBCvsYOU/0ZIzdWRPTyfBQLRnDkmlIDMRoZCpwdJkjNoJYSY0w2w6+CZb
 i0a087EzWsmFoa/U0QnE7bh0xGzL4xb5Yk8946zfua0wyFVqWya/fbVa3lhjhd3Eh3IEk2voPWl
 dGZz9CbENZEfc8XcUCazrr4TjnOVBhIkpRUT1XUNtiWzAb+41fDp/W+rey4wrlSbPvZqCVp44fv
 ZKzeBZ+NAZBigYIuSDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX25lZ+N3EeLvF
 qnh3sP9vs9z/uGJd6rbGMmMUh7PFgHIwdr74duCFIUiriTlXdF3jqaq0HmFzWBermW6c/mM8yuW
 yOK5EYWvkenZU0ceVXK1jF9xH7Q8kPg=
X-Proofpoint-ORIG-GUID: TKxvqyjmB_vqbKGStxFJpx1uujskhPBy
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e057 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: TKxvqyjmB_vqbKGStxFJpx1uujskhPBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

