Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8052737FF
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752794938; cv=none; b=UekB4bgwmfUDkFIkSiKwhD9U/Wkh8fQinIMKj4gE0qaGTRuGsDuqfFx/PtUy9tepraBNdTw7fcjU/ehghBXPgoh3c846E6ftyZ+X6vg6Xy/Q6w29SO2Tab3iUhOp6MDF7qPcyfuBdqCQm+5wAKsuNZKT6hp5iltdnAbL2H1jtio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752794938; c=relaxed/simple;
	bh=O2cCbqOAEvqsb54sdTypVBT8GhswTdQfTJ7kSW24Q7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZnU2+U+W14hm6YrshU+iS5v7elCU9+uukOt/Mef1KKT68VfSu/Y4DfImYCEGd0cH9evYVmtcNXz3/ftUuO9Jmd8rjQMxRwbJykQTG5MUgI3E2FhuWQLWJlfVDBuAJqFVz7g2iTW/x7tnMfMMiA7wvoqAtybg74PUr1WsaFlVi1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJ6yAY0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJ6yAY0O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HK6Cm6022444
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=; b=hJ6yAY0O14NAP0SA
	OD7RIk1xgMFCFV0Waxc6glqINKfqNrshKx7X0m+j1IhGZTgu4SKIcyaO88U3fK93
	N/RKgxJxcUmMYorqd+tANjfAmIXX2xtm3ZsKQ4OGannWCaKJIFYdvWfJbaRlo4XE
	3hGm948gTzjskqC0wBuUGVM432JOTHdn510OiakPXvjx5QkFPic9x1vCooGbZUQ7
	f6/1yaSjf24JUbcCnCXhx0yq9e+s2KCzPX+ViaqgfGrJLEyP/8erLk3wZn5xF/R0
	KKRazVs+JRI6XJEmg2toHA2p/Lk/xI+DYUvClM/8Ri8L5sG3TbDtvgmo3tj3Yl+0
	e6vusA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy9e3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:28:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so23726715ad.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 16:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794935; x=1753399735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=;
        b=vf0gwMwidU4tfSsD3Yrj9P4DdXWX6ITAyIortyZwDjhWNsmikPf/ZLktg2mogN6I8J
         UFqTT3Y+2xlSQkDy1T9EDelkiMkpQdOhFIItOW+O2hiodHRy3vW4nXUbzxin3qdvAhcM
         HiLFtX2FC8kkZhvbAK4NLm4qUh2UBcDfXrK85peS5GzPvAu62TBd4SpZjhNDCPrnyafI
         xot9M0809nV53gYHXx7GGd4PWQafKATPIZHGP6F/U6siRvSE/f+ohHDPXpScEA+eTURd
         IW6F8+WVnKRKOINC5ozxbpe4gdbGnWBQHiDEPd04WawGP5HVGYeOivYP91puUmG2XylT
         30og==
X-Forwarded-Encrypted: i=1; AJvYcCVUgfEJMfa3QH+i3CkVbxjCg6eCNMiuqxUROdi0sviFMWPJdZJxwPyDOgYidLx/N5kIxAv/OUHladM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyatjoWAzcoMvTtYVN5pXmlV+Ye6LzUdE7B03ghdMyyxRryRC3y
	2x/5WgwQd/gDxfKwna4+R7xPbuFk7dfWVgCpn43lvMaPZnuKfaLwsiSFY2uA0dtm1qqv5l7S3da
	Prjo8IHjkHKXnOOxM4PIwcX5tX1JBH+jOFNZbvd8Tg7EKuGwQQ2gSv3yW/qyYFl0=
X-Gm-Gg: ASbGncsP1Hpgr410XNmQhKjN/QouoDD7oCwot2jn55h6QVX7sNBEOXFKjqV8JPup/0B
	V6UH2IPxM97UF6Rt0Liyhjx06ad9N7C3surVQ9iQWLonVAwKQfsCNXWl0UDh0pVkmEYxS0MW4t9
	EmSAnkBp+XC/B+ctzqfQCzht0mcYvWG4kXbY1kbDNOrYb/K9paBZo73nQwBNQiDuQCid1YvMMsM
	e1eEXNoxMfVBxtloFR7l3qEpY2k3GDCx+ip1Z3rKl+mrJO+YkJtAVKIZSrwR5XgaxE1kIhVBgyB
	13gLW1kvjemc7BkRL5dh+UoPMO3rfnoXTlF3kdjEYsNHy9OCp6MLeCLKrIBncq48pEm/0lD9Jpn
	CpYh2OT6M2/AHuOZb1lZuD1oH
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id d9443c01a7336-23e3035f782mr80881015ad.44.1752794934700;
        Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7EY+GZlHPcNHVs1AkXZZ2eIbMpFdFBa4h83G1a5pVhnBvbRDWLwMJEYWXJSA5sRyT8Jqsg==
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id d9443c01a7336-23e3035f782mr80880715ad.44.1752794934261;
        Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:44 -0700
Subject: [PATCH v3 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-2-72ce08285703@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=911;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZ2y2IyaYhBO6AuOxdT0mFWtWBLRRO6rCaMc6lj8Ipw=;
 b=JIQEhhSfOyDoyV7zPgQsd3A3ppzobltB2q4r0El3ARcu9XmGhKVnrWAmOUE30VXrx8yJGe0zd
 e/IkHZCE9atCpqRREuhMprBnDp3dtKBR9yS3h9V0DD0pruyJh5ZbmIW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX/BjHWVY2mb/z
 V3oGo3q9AsX4DUz8LzVarTHN8UPDv/pp/3dKaSwCPf4EZ2Mh3wCqnAOqv6/xwjauM8gCO9/4CyE
 aWGGdMJadhiWT8uJC20Tsuoonz01Bvq2xgdVGLwiU47heFSMv9zhjEfNzFjvSDcHehRyUjDOwfF
 gGNlRav7+MCp7+6LMA4z0LrftgkHQSsug/NUgRL9nA2EBNLZTEV6ByadUzLsiTrNJWUg51O9sAQ
 8bCOWshBLw4RTd2+9xCanQYmxxh+1JD+yjls8lLwWbhwkvtFUwXz8raYs3kT7zowhzuBmw7XlTP
 Ztx0cCzqmXM3jk6MAwDzyJIep4BTbLp8vrF4nKXwi2vWfCR4CZYvCW1l9/Hqc3BfxUGt0IJpA7W
 Khzj0HMbId1Tb8sXr6GQ5wV500X6R4dJkWBtEVM+0MBrwOS/5NxGJ4E2X1j3ziVIgCG+uGI6
X-Proofpoint-GUID: 1P97ySrpcy4tGBrdY1FenS3ioTznl9PD
X-Proofpoint-ORIG-GUID: 1P97ySrpcy4tGBrdY1FenS3ioTznl9PD
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68798737 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=881 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170206

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
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
2.50.1

