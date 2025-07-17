Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBBB2367B5
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752794940; cv=none; b=jND0P+NM0uOx39OlrGJEFGGYuMlWxT7jhoYb5X6M4FSZIpo8QGE8EGq7bLWLNmxL8GCgaMEtlVsEFY6NmaxFHnZYSogaYxgeqRn2hOno2wcljh11mX8l9goJ+6bChrfkkVnzta7I3PtDYnLMT/rqbyzIfaWdpR/vjJdMulrRqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752794940; c=relaxed/simple;
	bh=Z55FpLZ0sPNy+NgtucG5C3MNgMRSZKdtCHkkI+2faDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8gy5zEYf4cz43o0GDKkTXXPs4wC+KfDlaRGHdtWnFIPwtu2j39Cv9nFV05R1muPkBemSohrt+U3Mip7eMSh1q0gYAkRjy6U+dRBr98blqlU3au9ujY/uNW+UH2EAa44N0yginaM1+NjAuAxWqc0Q6atzezcKUZ3L8qpt1Df7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQXeMR7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQXeMR7S"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HM5Rpk022222
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=; b=PQXeMR7Sl/LioOF0
	mA9oHRpo5WOdK91NCBmGERegP/Nvo4E8toy5yu1edWoEZmFvl7JWDOy+ymiQlPgO
	M0b6WiMYCKJlVrcaNeG6IdXl8E2cVIwguzWl2IEobm0n9eaeIqrO+nGok44l6lg+
	rF4thoNvKdnAgN3VcqLnBRfuufzqe4Y6/iBWbtRvBOinoF4kfPJrvNH8dX/ThAWr
	PsBYc6I3NsdzBtvNn8EEYxGPamFoiEt5ypcQxnAJaDKcHaoICsZ1kgbI/EYKpnb2
	u3MGrlYUhkUSGuzuLviGvRgZSLZkINZpEWvM6MrE+R28odo6/HH5UZQa5Zad46hH
	7UE7rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy9e49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23692793178so10790375ad.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 16:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794937; x=1753399737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=;
        b=FanMBN/b1GmQDqhVJGCTgr/Q6EQY5osAimgDUprtJSVcVLX66myoO1twUBOPHKsx72
         B7ejakeLUpRAZhsIi3GSh70hECvAiQYFg2s3LrBsudtnyEmsLis+qu+8yGnt0ZDWzOAh
         3Iw+byiYQFSEOssc+6turZZwIBtFRUT/Fn2i+YXP9l48lr2h+UveKSEgRvmCRiT3CPUt
         0oJDZQHXN0mTWPNr5rTmL5aVSCTLUvPQ1CF953RrHbBDvf5MQSothpXDa1K6axyqGtT7
         JsRyHAw6bx8i4Zhr1WAl4MJMixXwtuamdqPRX0MLtM9nVhoBH5gorfg/d+4Ts4p061EE
         z1UA==
X-Forwarded-Encrypted: i=1; AJvYcCUrR1049BLCQU2WJtnFs5BocrldEl6HB08ZKAkS3e1R/vuunuWWD5G9Sa4WgIlvTHTGanmBJctEJT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgWI6WHoeoEJW6YjOOUSBqDGYV2/fIkfUsbhAZJz1nqYzaVRY
	28Y5VnCViaWpSdtsLSRyVIGEuUeGPYbGtFL8WgEQlYOhO0DzzIF+S8dXMRmJ1/ven65odtKr9XL
	toSlAD8Cj5FGOxJkHeZLMPhVK/WteEscNlFB/xS+6V0/SghWW7AvmwXvLsncsAYk=
X-Gm-Gg: ASbGncsOO55vmIiXc0KTJ/pa1AR+eUCxYoyJsfLab2rOBkxDIlLcfxTx9pAXTvjw5yn
	xqZRLkiFennT5WUPYUCqZELGlOLukgP8F8nVFdQOMI/6AaCOejGmkGihno+zgZ1frofQLVLt3Oq
	6vV5YIvedcy63xCqeTQkJfUXA5flRlKNZSHLEhyk0mc0FifqiiKBB6E9uCzeEt19CE/GgXkn/fX
	PooRfWgOwazKkR1guRUNigeoYXMLtwgKUX8/MfRua421kR4InopO8ZZK3kZz5AnyyKSh9Sv18cd
	bdlZNS6atko8SPy0V2SrJSegZw5uVPNNnNCrhI8Nm5In1gGPxD8Yr9lOXRdr33Q2BQMcDnT6/o3
	nm8mXvJAh61nCXwBkhNlB25i2
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id d9443c01a7336-23e3b80c9femr8053365ad.30.1752794937042;
        Thu, 17 Jul 2025 16:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhH6tJEH4IvPWPkNyHBRb0ZJ9qv+LFEoEsSd2RwQQYetT44kKI8ABmB5MC5Z+R+lVggcU3ZA==
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id d9443c01a7336-23e3b80c9femr8052875ad.30.1752794936504;
        Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:45 -0700
Subject: [PATCH v3 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=7576;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=Z7Q5MhFNW++3sg2l+MY10L8IMh9EAArq7s0Yr3E5sqQ=;
 b=bXvkMgRG/fOCiubHjM5Jn0LKe5/Q9lqISkXucJ1CRsxFEN778kZWlM3xXVklsfaaCbVIwiSFB
 ycoZ/YlAjoBCOiAORpn6mMaJdtIv28Sf0ik3WqYNt6hPeRhc20TpUZb
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX63VhwgrElCXd
 Kmxm/RPR6EA9/pGriEGL74aXgfg/EFg5FQy0ZS092CXXP8hcxWRyUD2zEap9U+wwPhSBvf5z7Xv
 6UNA2AQWkOWvqS+aZ3hR/OilJ5u1ZPj//tuOv0TF9pr/Bd872VC6ipkLLTFuTNY4BHCm9Y00EQc
 TV8vU/a1wFcyoXnICOcIIJF5dyWdq+4p+rAZCmR77zxMppWh4eWXWTg371BKNLMtjvvRXuGcDPT
 lLn0RyjKtSY2wNpKh1TlfZdyhy2qzohr0UrQkfTWao+KAUbDhatRK2igDYgh8P5xIuVIThe+adI
 SWUn3eEEYwRSuZyf6YMWa3DnvMpjR5ZFmGLA8F3EBW6v6V24SZeFQ1ISg+VdvvVdEntHtAvgB//
 zvi06UrCapxXFKb7xKkSte7+CQcKSjs0YUvBihcZlEklU2MDuhftJKEACtYqdCZmZQueAE4b
X-Proofpoint-GUID: KgKdQLX-L4F8yoVujneodSvMSeYqAUSi
X-Proofpoint-ORIG-GUID: KgKdQLX-L4F8yoVujneodSvMSeYqAUSi
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6879873a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y-iibUknMj623qMt5boA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=987 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170206

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Current documentation of assigned-clock-parents for dp controller does not
describe its functionality correctly making it harder to extend it for
adding multiple streams.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks along with the usages in the chipset specific MDSS
yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 15 ---------------
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml           |  4 ----
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml          |  5 -----
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml |  3 ---
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml |  6 ------
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml |  5 -----
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml |  5 -----
 7 files changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..d8d94f62c102 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -209,11 +199,6 @@ examples:
                       "ctrl_link",
                       "ctrl_link_iface", "stream_pixel";
 
-        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                          <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..2dc76a074da1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -391,10 +391,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
-
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..eef5627133db 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -214,11 +214,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
-
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..a2b71b476357 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -267,9 +267,6 @@ examples:
                      <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
             clock-names = "core_iface", "core_aux", "ctrl_link",
                           "ctrl_link_iface", "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..9e52ac9c0eb4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -296,9 +296,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -387,9 +384,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..eafea2fe1c95 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -399,11 +399,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
-
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb0..0858dd61fb0f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -408,11 +408,6 @@ examples:
                               "ctrl_link_iface",
                               "stream_pixel";
 
-                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
-                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
-
                 operating-points-v2 = <&dp_opp_table>;
 
                 power-domains = <&rpmhpd RPMHPD_MMCX>;

-- 
2.50.1

