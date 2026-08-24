Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BDD41686A
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572539; cv=none; b=MYmjX9pfy4sHsDkQg5HqseUUpF3QE8g9smUFLsor9qe9STg+y/nAIorDWcy8YFkuyA/zR4zARxG55HINxjAPO8IFHtNMNCZEN1CvZyWyJADgsWKPIB0QjYfny24LUJO7H0cFNpSHwneT4KOslnDgLSZKKUX+NM+gfrH06/gCfIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572539; c=relaxed/simple;
	bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lO7GwKWKeRoxa0avfsl8WcVnKAgulyTr2Fvzg3PhD4w+/FiSjHDtzOh/k3hwLczJzEzXqME7Hif+ga5b+l+2cHne55TtaDx386Y9Tk/u04BojnkQO0Ad2j/zif7bcT0my2GGCE61t7OPdNeJeoy2GQzMet49ewTWD89iP8sHD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaxcokuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRwC/TbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaxcokuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRwC/TbL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgPL2864713
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=; b=BaxcokuPdnkXtJ6C
	4Ijqm48epBRNyx+VnrbbcdKGSGeRUDlGm30vL9f5K9rH6/TpxoNkhswYi2gHofSQ
	QVcn0KFNZIx1SnUXxA21vPrJioLq/oPhosTUURhPl5DEq/WK88C/dQiJRkuYe1tJ
	X0aPSLlnBB2Bgtz158AE0Ed7ABrv9OYKcotgmvk8Q3/YcO5xMXbQBtonmIKgVui0
	5YikBqqJp8bYm4V6UYLLMFwcGlS8m4qHD/SsArh3XkVpWR621Y2NIpxtqBTZFfqq
	YM5rbPVZwrBuA20r4GOLjMhyTSlvdhEN3GwavZoXenYWPNNpfx5g6UC4u0KqQvV0
	UhzYMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so28367881cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572536; x=1788177336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=CRwC/TbLU6ooAdWAwAkdTo3jy7B0WEj2q/XCMmf8IcWxS0BNhH9JOs0HQMT6mZlHll
         0wNL5x9VScqznQcpZyPCvv73UIJ862zzjlFt5ZiYAQBeFWNqMDDquR4dHLnkXFvJHXeS
         m+IV9kokfvQZJViS9c8ZUCfK7QIsxDy21zfU2UkhFHzIYqiuImG3mE8RBU4BQlV/kCh0
         RcWGZcdqVZYmCFh2F66pS5u32SEsrv7t6nNOg3tdHJySta4+WjqDk4FpGzdxsx6Wg3z6
         j8knJ6xfkUy7WES2dHUaRsQsS0JkWh/41WQslF240IW+sB1hKIquSyGvYw6n2nliyIYW
         NxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572536; x=1788177336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=RkfCsNPzSyYUqj5aMcNjA5NESXj7CAEu+DYquJBWjq50yyPVk0eRZM6Iib8NsG5Rz7
         5dnUJd28+nRbt2F/E+gZ5pCYdXZWLJXfbppMvWELh2lOxZ25H9bw4EsX62eXo/xto1VK
         RGlyEEsipMVfGkTWi/252acfQNf4ki4KjTcgq48ROXJBe+GNdXMe7kXjc9dvsHXY8AEE
         95xkFn7hoEayXcRSk9FZjqtyPaHy815Tb6IoLS8WiZIYhXaIp+PQ9H1zNp+enA+4ulgH
         teHPmEO9je49VjPBTuxIUhZwrYpMeCz8M9XYkX0B9fwvumtMgPP7P+qAGoZG1MKphHCR
         +iZA==
X-Forwarded-Encrypted: i=1; AHgh+RqzwOaleVk7Iel0cGekO6dHAGkQBkMC/rrzpKlRN9+kxLDMDZpZvA0UXjWY6oBDNdyYjbjjczgHrpM=@vger.kernel.org
X-Gm-Message-State: AFuF++mWcKlzBqn4ULH6UdY1S/CXeFnGM4t/+5TO9PsTzQXo+mIa3CZM
	lsijiTWxFbyKpkldkN2BSQcXBu+FUMfjTeZaLgsfL2p/ll0a/GHfAMkdT11uz+j7pl7wUkZMRm7
	iscxD7P3EDl0hLEHTH/LfBaK2cyx9LCMh7nORzqp3xtSE+ZiYcm8TAr95QdzRSY4=
X-Gm-Gg: AR+sD12AgBZn97Re04BYUvjv+g8pkD/lnkas4td9dW/uADKT5gJT+HDB19Lgym4ZVhG
	grhZIFD/ZEGeQILR9pzQfhup0m5QxzUpAiM47KXOhv0LR9PQOx0AYPCVA8Oi+xFfA1Jttlp0f1Z
	yj5C98PBFjYr/IBcKVTSQ55Y5pgWj/c1b9T2GDHpSWzAE5NM53xfRbHz4DkrkJiI6FuL/O28Q5W
	OOdJbZD3mXKFSPcv4PAROC1Z2tHvsnmQVLN62wuzHd7DaatHgnoBLEZS8ebQf2tZw2NorATYgi4
	ut7daGVTIGcFc2yH6YmKNFh1bLOHZgkTLLOkEwarvrYkQWTTUVa7auZ39Imvn0eMNsXkmYqgNzz
	vOZhYEQzB
X-Received: by 2002:a05:622a:2513:b0:52e:2d19:b242 with SMTP id d75a77b69052e-52e2d19b3c6mr4868471cf.38.1787572536322;
        Mon, 24 Aug 2026 04:55:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:52e:2d19:b242 with SMTP id d75a77b69052e-52e2d19b3c6mr4864911cf.38.1787572533926;
        Mon, 24 Aug 2026 04:55:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:04 +0300
Subject: [PATCH v3 17/47] clk: qcom: gcc-sc7180: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-17-f1205a92682b@oss.qualcomm.com>
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
 bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDlI4CqLPHVwAfAF9jor/4ujSyoQKbm4VPpt
 y9rSonlmoGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5QAKCRAbX0TJAJUV
 Vn+hD/0X7c3qvcWakWpjzHorXbHwPQBpORaodbX6DZaKQsrY6LoCDkO7vHzCitcAcvJ29vsTcTW
 D5PycQ3SFAc7N1oW/z6eLr3eGYxPYEEAZ8jNzTPhrGqyEpjuscr4ngz1GI3FUy3gN+6aQEAdvhL
 fHZrhb45iyyWvbdzFf4y8k1umyXb0MAyjKiWw18hY6xCs9u9v4D9wTovtNXRcooVH6eYTqrBKAv
 So3JY3ME/ajx3AVNtBjS3ERi/jvOeZsvUCZJ9E9iqspxiD2oDVs9cXhHAi92BPpHqT4c7ycSDWf
 L0s0QcKNvhyxvCRw0cfu5Nhf0xAjAxwRIUr/RqsF3RX17EJdA+XFXi0SGVYdIhhZ7QM1s1yJySV
 Y+CmFsNW4U0rQLInhccXGyPus/vqdVn4lmEj/QhExcUndCdfET6KVTRs2MtCTH2SeFvgCzXyQO8
 ldWouk5r7I57vX6pkchlNUvKeBy2wVRoquhDkefOTipeLfsoAjGU3Ds1Nm2gbNBUuw5vaT3dj3W
 4mPwppR59+Yfy6LSOnuaw4ped73YGLyTEhubxs2NkZLBaF7Nm1OSKpNWzGsw/KT7x6b+xRce68m
 ZYJOCeG4pKNHJf/2wd21Q40BiYzwlOUZF8z3XpokJf1/4PqumSt9bJCMlqGbEKdtGi1rxVj/pL9
 ZKe5cCEwYNPKkOg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxZPyo9MkL749
 Hi6Ip+Wib4HxSJgZVAcVFbAC4Nn029g1WAT7L2hErERT9Fx5hBUbuy3uHO5MfdJlK8YWDhuf2wP
 N5L3SaAeNqdBXnCQ5PfTl78I1ISRGl0MAAk7L9o2bYxRWdhGgohAF4ty3x4/UTF34MPMIWYhyIj
 V5ldAWDXYgUKE9ZO+stjki9a7TXfbCfpC645Vk/hAe5YbMRS2Fy0IUF127HdievF7EpOgooZ6cV
 lM9OpyAbybSQuNs67sDkW2cb/0Np1jerHJwIhsipVMnTdYr00EKPINT3KKh4Zb6hoxfEYx5w3uc
 95WRnt19Dggj4UdBmu5jwSelCzwOBqGyG3s7z6CezTqEVbZ9sH4obiyRsQIoL74xqP0WXqdQSaY
 0hb/wKK3XEVxzsTJ2AirapZEgwug8KmB7VYiNyeDJYLv/A4/JOL38mny29+lKs23++iQcppkrDt
 fgzdN4Elgowwg5SCTWA==
X-Proofpoint-GUID: HiHMrMbyB122ZUFYYD1yhwWyz-ia6uaz
X-Proofpoint-ORIG-GUID: HiHMrMbyB122ZUFYYD1yhwWyz-ia6uaz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3HLO7WMtJ1j1
 qFfPB+wqpnqFh0mUFQzsMS5GX2iRSucEolePtd9rlQdGIJ/HkjMjqQudtjVPByPbMA9NQupAPZX
 9EQ3h0b1z4F9tP7cS3GjdJBrp1VW8nM=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3139 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..f3a245470a4d 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2418,6 +2418,7 @@ static const struct qcom_cc_desc gcc_sc7180_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7180_resets),
 	.gdscs = gcc_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7180_match_table[] = {

-- 
2.54.0

