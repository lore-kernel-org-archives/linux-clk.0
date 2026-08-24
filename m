Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7841D226
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572557; cv=none; b=EDjmb9SCtKG6ZAP+IfadtGhqPDDyzHFD897Mti71jRIcHqX11PY8jQlFLqFXiRYlNQyv+75tLziCrwGcmpr7JltCvQnvPGXmXxeQwpZSbKnAimtxPut7gIHi50x0yADNyeDBLLi4YtsiOEkF/m8BzDdPbVVOtzsl1FNVr1yA60U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572557; c=relaxed/simple;
	bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9nF1XMNVNO5T7VPRrQkjz/Wb6dZGVtEp3U4oRHJON52jOVCDQiBj/rF3V2nSa5k2pG1eykHXRWLI7Rxvyhb0D1CumUrePBtGHEkraepvoQ2mkhjEPHm4+stOXg/oypgay1bmE//zaJy9CaSqJTCu1m6HXu5gZj57mvoiXzh7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T37+Lv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WseTfM4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T37+Lv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WseTfM4S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMTNc1673134
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=; b=T37+Lv1Jfsp0ZESN
	ePGYLj8G6mu/dnJpRN2mZvK73AJUzpwoabZFAPFaaBuzUjJzYxeG4tY7/eqt7kMU
	n5zfxbECHYGQXybWOek3g935FZ3mIsi3zJfUjz4Sid1l16cavWbrXmuEkdwrGxHH
	wW6wXiq7RndYanxbQzfNgqH/ADC3wnbM+cWap/3MrfpWfOzDy3nN+pVRyJ4rJWJf
	kmZ/je4/FxnwETArbgjoPJO4XZg+p5UnbDr4aMet9AsCZJTosIW9mVZ/Mxm/rMCk
	KStvP2EVlMK33qC3HM2lXJZj+vmkZR/EVuRcktxrocGwUeuxnShzB0WEPWX9CDzV
	FN9lAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso59726341cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572553; x=1788177353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=WseTfM4SuNpWM+JJL/5g/9ii5C+PaLjzslX+tbA+DP9vOnOD1qP104dUP6bDDeI3yO
         m74W0YUcC0jetTNiuU6MLWQs+V46joiFyaQJCBMbCekkyKAKebKHYpiFhY3pCMf/rQ9m
         hmTLG0iIaI8jxXKo4wQQYUg7OZchNoYpzA67NQ+kVOdUjO5s+1A1IGgLRjjQ1n305MqH
         yrmTUjiwgNmcknKnKWZ6Px0pTiJ2EWtNIHe5Up/Na7UJgOrLyRdxZTbYL3d89bLo2Kl0
         6wM72JKap3tgMHJfpS/2aL7HAhVzH5hW9swE+Lcp7Zhh+lrT4UUTeSRhrsKbsKyOtZxl
         doAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572553; x=1788177353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=MA1tiNZe78ErCqjJsBahkKDGqqj/aRJwdZP9VLKanrKrwNZS6W2EZzDADWhhA20R6T
         gT6nmhnhrqAE/dRvQxVB6Z6e+N3r0lM8LJ+wGF2W/hyjxzz1A1vnGHwGhzexdMlttMGR
         0lt63DnpSvPaWiiQUBb/Agzxsdbq/+LcFlyDXU6TKWOvTuCHsz5MT1weqYbczgzYFkIF
         QBMwV2VMpKrugY/sGE7l8uVd4VMT0KuKpIwwXbXniPCPYai+4ESkzLjaLNJXmu6TcGTU
         czzxIYdWEeO0cHf/3iyN7lOHjfMPQNE+DftVfBvVaEf8n/rTcfrLpVhM+EB+APlNfoZs
         gaZg==
X-Forwarded-Encrypted: i=1; AHgh+RpJIinCWCIOmuORF8V0TcUaM80mEked5FpAGlXXWDHSn3XYDxEHfS6jlcLnwKUm6FQJP2icCTI877U=@vger.kernel.org
X-Gm-Message-State: AFuF++lyiGu8896BsSje7P5LbaSq9Xx7EH01dSghwwyKt1/xARC8MO6F
	hH4pwrwt/DMDwvg+/ccj6PG7BimYsWdYumXKnlWZkAKWzJfw39vhRWMGhIStH6fawSTd3OTK4Vh
	CX2eGExkpaF+hzt6dpNX1Z4j7UwRDLmtf2B+f3/DBndPnKkDSv4UvpG2pB9NY73Y=
X-Gm-Gg: AR+sD11Zbl1dPTHoEbquf5cBGMG3o3O83H/9DTqU1TxGEreIh5KeedEO91+q0F55jmA
	5HY/TELPS0qTFGI02If2+ES3IGeXBObvM0/E4z9to1yBYV7ZCGtFDfAu6K1PREDew8UELpMFOhS
	u0t/oiHmpYK6AasYfEISAKEk2x1wh+Sp8kBoDtUzdt9yXgsF+MxhZn//dAfpUGVXbuhJ7KYp+bq
	vToaVnkDtRza+hU3p5IDYPJ8DDlH0NhMy0EZd9hRPGc8JxWbHxX6F//8BhroQM3i3r+8Q8gBIrS
	VTNj/ZzxEn9Nhdg0Ve8uo+s6J/1+5aSRkNQcEWVMvV5MvKJblZIKXit0hYb/kuEsNs7VFTGz1uW
	F0fNTmE69
X-Received: by 2002:a05:622a:290:b0:516:35fe:5524 with SMTP id d75a77b69052e-52de2f01122mr321571341cf.5.1787572553118;
        Mon, 24 Aug 2026 04:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:290:b0:516:35fe:5524 with SMTP id d75a77b69052e-52de2f01122mr321570481cf.5.1787572552603;
        Mon, 24 Aug 2026 04:55:52 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:09 +0300
Subject: [PATCH v3 22/47] clk: qcom: gcc-sm4450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-22-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDqgmd90VHscejGyJts3WL9whMKPGfivzNM1
 kHlnojVVZyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6gAKCRAbX0TJAJUV
 VkqrEACF9nh/E1bvA2617idNqe9o3HRjWf2q6T+qQqmATHMI5fDmiC8tens3vM5zLYH3nB+gcKR
 axIYoxm6nkGjrXMOJR36gDEiA3ydB496fRNAEaEpDXMi/a70EuXJVNXJdZSq0l7vPHs5iR+3une
 klzOEr61Y4dgDI8ULZUjgXfrQdnQM4G38GSBPP2GbT70yA5lyyAikgCZIa51WsP77KWhNNW9diz
 290J4ScrQCMWRPVD/4HpbWPahPrHnbkdkS/OJYBDO5f8Ax2RXKYIK7+alisiUy6Bq9Ir5EYLEjk
 Oudb1euocyxJhfInT7xY8oZkDPfBuOiWpX/NNYXnyibym1m6omoCE8ggqXcWb6je7A8Xbq16ftS
 5HMyPPDhKSiP3M2BUbIxeYtEO8MsVeWfoHtSLVZKYuvpM1H/lbuihYVPBalH/K6mN/Mr9KRtz+t
 L+iqVgp5LI7/cERKtyynbKq0dWpxwlbpaeVihoNVcl1a/p8sKScPwxEp3B3SUphQ/m//qtyRZL3
 Oq+Cxcmp3SxBdDugrZGycu2bT6EcU6+4dXdZcOLWesf44H0hQoORClhvYAyw5AK6BLl8oz9BbXu
 ermjOQBpmjv68l+B4guSkCm3LDsVOeLTZUS9Pu1u/F9gFid4u9aU2gJ5UMDe9jrPmwg1vvz71Kt
 1FaFrDUk8uzB9cg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX4rPSo7u2P+XH
 mQ9nUA5M30rMjTiN1P3BjuS4zddT/wz5lo9a5V3zGYxNzawsVZ0rWzyn6yXdr8jIGOFRwr0vX9A
 YNThMJOxtrzQgrmRU65mdNpn+u5mfBY=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3149 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eVCU0M_8veZ1eS-eBp_tkrE9mW9-I_TQ
X-Proofpoint-GUID: eVCU0M_8veZ1eS-eBp_tkrE9mW9-I_TQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwe0v2TvOUn9g
 ZOsCddOESV5CXm3nMVUVKpCg5iefyMPbcloexxa2/ZldMs7sPUNb0xqJpmF4X38SaiA34fqZuxt
 4hO38rwETRnbA/6tBPTlCVwbRcsDtll7U0Yxr4T+T66/zArRHxXd59CPB0ZjN/ZEDljaBb+S2Si
 SjQNG6Tak0XjPGDTpnoDt1DkvTVnVqUp629AcFQNgN93ih+Lp3VXKJKZN7sMhJPeaQVKxX5lV7C
 ECsoTsYF+ewFD6jl0Uy/OBZuQ/0K8IVozthd/uI7ZXvYMmyarEm2zmONyK9HiuouTSSYjXygGC5
 zNvOi9wWL3c6nUTZsQ/ULmJGOQ/FmyLVUs7e/9qdLgmtMXlPSnmV8Wdkk0Cvo4ZRCsrqKwnYwOb
 fl54fui6qgJBFP7N7t8w4ni6utBBTlx7xzHjHOHuPlKUiSafOhsERKSZwltcAsVWLW+NnBTYgch
 /2WMBCkVjqJanjT7iig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 30fc7af09930..41d5f35c8f5e 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2823,6 +2823,7 @@ static const struct qcom_cc_desc gcc_sm4450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm4450_resets),
 	.gdscs = gcc_sm4450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm4450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm4450_match_table[] = {

-- 
2.54.0

