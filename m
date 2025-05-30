Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF113274FF7
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627269; cv=none; b=SvKYirAnbw5hA0G98hg5oCgWgamEOPacr732Y3Eb/wxJ4s06+Mrw/rOjgQydj0T7n9uYu/tiRgrFJ9i6swm4Pqd/0508anXyiki87C7C++h1vFTIMm5IS7y4zuqtbrNlH62ot30b3sgNKZDTB+6Cj0Vsb17K3mZfbNqt/dXmm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627269; c=relaxed/simple;
	bh=jtEjy8chK7vSy/5Be8098CXoqGuk29fN/utLUxu+ZOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B39apo50yOzff/n2Y4Ne3vX5DHdP516Eaz+RqJCa6C7oH3dICFPPqicG5EI3ClXO5jwmLv0fN4aAwMRCV73kAlpQduTwo7dvrFSAHEpZGSqgrvhtitwHt7xCHCRqgSLLt6vvg1z597VXO9IR+jjTGdbwe42UAGKXSAEZjmtgJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdiuEyk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdiuEyk9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBQjgX013722
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=; b=FdiuEyk9LZOIgG2X
	DXUeU3BG9YY9qaVl1cdSaNsa6h0raHzjJnOvQfyRAwi1PGybqKpy+xNQcBzrI2Ku
	cCY/I78JgkyLDEGlxOSTKSIok5xGOxShzI79PVEjrH3k2wb/sEiM+O9tllGeulOT
	ZK6aBtOgpMAXl0RJwE7JDITFKtj8Wrn9bo0pDhVABQXtvxQK9hclPIvehpcWxjpU
	ZV40DScfxuiDgLrOMSxT9NUMydsg88GqRH+UcTsUHike0XJdxMvkkG81blPvoPMV
	Ye/I7ScILFkV5iV1K/4PhU3SA1pIG6Oz6rnxjYu407IRukFC3iRaaEU59QfhBYT2
	sSNfEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3y0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311b6d25278so2406200a91.3
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627266; x=1749232066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=;
        b=tvKDzopFVbU1pN0ndYmc9mL27KyKKJ484LS5nT/rZYKXbKRVMSuRe1/eQIsXOwnl+b
         n5RCSlS8N+N4On6L8bx6UnmIm3/ovwyo4DHDeldGp36ES36An4FnsweAFha8Sh0gEXrJ
         1hnov2hfKZWogQoVDJyxp368oJbeMQarDUNjhiVCX27sJ+sCPyHGxFA8CYiRHSNqZ5UU
         QCJI+Q7n3rAvBKPxawFCG/VK6bYx9lwmd/pTvcGTiR6GNcQEtajYptB8RFL+AGOOc+zA
         gNNsh+NIfjdoidhfdTzGyImuuYj7yg/ODICjo7aQ9cvMA3FK6acdfQS9/XuwwZ9ebWQ/
         kvHg==
X-Forwarded-Encrypted: i=1; AJvYcCVUFrGniv7AlBQpO82Y8G3QcbL3F1v28BtQ2E/sbAw5TmWFyp74JIQSqtRltbzpFtDkvFv5rTL4VZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4ft61HsIY7wDsjbUObGUPzmu+G3bSEHEhClp6IrhZz14WbU9
	g0VcGmBUkkxvnhQta8p3jZ5neF8gSCCzHO3Pir1XIBH/oQx1JNV82iRf0HqiUUIC+RV073/ImZN
	Oaq9t/KhoFRTGzN0f37fm1bAj2k29mjGKIzFcWrzymCaTjB0qsaeSnsReOC34mME=
X-Gm-Gg: ASbGncsnNY0sL2Y4J3KMI4ehx3hSPFZoy2FFKaozuiwr0Wzs+J5HWvDBcDXWuEdgV68
	D2yPLqfcae7OFW66oZucpbAN3uFlhiE24AubeY710oz8dr/IOiTrrRJjBdEDr7hkqcRxIYfCoIu
	bkV0TdVUagVrTT7fXNjOGpSg4ivndDtHcdk4FMflzoXFOwHuZ/st14m7mVOsl77uEUm6mI3f6ul
	RtTt6Q3ln/ZK7xmtbA0iQsIGTCzPkQjTmolrZm+m/7Xs+gQ/4DZPUloNzv+RPy7DR1yZP57Z/XF
	R3POch5vxj7A88GB7TbE+iR0zFqlouP6eBcV0/JATLZaPjBvavRxOhsxoFPhXxu1hZ89nQ1x
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360790a91.7.1748627266074;
        Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44Ez8w2kSkFGiWXJyTRDICpcy7Z7sFhIreQn9zU0Akkst+TmIzvezQ7ZxQQV4CDoSwIXaEg==
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360740a91.7.1748627265598;
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:25 -0700
Subject: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=862;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=YcjeN4u37rChhC2e9vyygUDR5/9ourQp/Z4Vjz3aqaY=;
 b=4V+1vbUqjNallDMi4o5HtOHP1e5c2KVcVyGeo5DMGTjvm7tRoaV9zFs4DFYTtqTv+nTiRbwRV
 6bG9bGyWiyOA8qrekpoVJYMfqPwDIHSo3Bka5HIDElilp0rnW2u027w
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: 8Ey-olO0ESvzwMNfX4--OH_DM-QLDOh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX4DTA+uDXZFe5
 qFpKbXYRWJIpm9wyT8a1Xi5t+21OHhPSE9DxhNPpxoqZ359su9dpNTh8/4MtGwSktnzlE3FlB1x
 PyAe2QxXM7UsoY7QDouZ/IkQt7U0PvTEgtb3dYEberocLQCl3h5F/51+Z3OyheBuIUeoW+o7+5+
 pgqjcz+YYPONCZEW+uReyYTTyn0+mHTkznrE2aI+VtF5TzvboH8jJouHI60Er7edJUdWxZZL+bL
 LliKdmYOqOgG+Ujt0M+zCJnmuJ7cOBihgXIVvIaLtd0f2NvAW2D1bVaeb7pEMiNff+ZJCnc6Yld
 Ei5HccZn04DcZWdkle/ZrS0bN6ryUO0bbd708IxSy628v+ikIDM+f2qiD0gVYGVHdTEA7crul+Q
 WH/+JHlw2PwPZAfgNacDZvodXmMDoHrJ9Df/gVZoh4SQ+BorAoQ9EiuyqRGw5z6tU78qdrQK
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839ef42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8Ey-olO0ESvzwMNfX4--OH_DM-QLDOh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=844 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.49.0

