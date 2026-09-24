Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8D247F78C
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246455; cv=none; b=iI5Krq/+hgBRFlxDyLc9nDc3TAOmP6Zdm/XPmr07apd7zwKRpXxyDOgP9dB2Vw4nMfwQZDDoVp9kcDLamcfPB0js269xseaY6M/L/0VeBfeQWpPvNskfrM4qxBYWd7uQIXJQBov53iA2amvzSoAGLzJt5wTDmVuawbAGuBXbC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246455; c=relaxed/simple;
	bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BA9Pnn1rdZZ45gENuDglv4/fJsxo9mdrwUrhwNOT8A2W56KSuMREGl2iFkVMQcXfEmcwQacGniJB7Wpvvy/1CLZN8uazZPUJ7Lt5Cl5m8wwGGr0eEkWfukg7bhOs1y2mJAGR8K9/a4CJpYW7KQOI32A3dV63zEzSdnMU9tHY/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfPGEmZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxi32fh6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfPGEmZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxi32fh6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Owp2857954
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=; b=YfPGEmZbrLraYFiO
	+nSKk0OxZj5L2NtmiOFgVV2jc83Zvqlrj4HsA2Gw55QYPNzjkEKx5CBmjUy/i07w
	Yol/Ac92nagbK+rQxQARtXKLWW984OMnedZ5w8mZBeEXFsueB8IuZarjInLP+kZC
	6I3dgl7yPV1GlqpcSr9UuowW3ji+QfEppd8Tju4/5QT6cRcBVB16uizfZJLbOU1+
	dK7zBtTCHJT6495AGUm+LE8kRAO8ivbi6UFvw8xElMNilBk/4COMYJy2QodtCqB2
	Ba6glTUKBMElwtt/r9dS9weG7uImfCsSVp0jH8KacPRC52y/nxHQC+SjhVt0T8Eo
	AlPw5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag57w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so284621385a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246451; x=1790851251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=gxi32fh6c32HJXiVL7B2M3IKvB/RaciLPtvXvQNM6BxIKz1PabDAexf7F7A5rvA/PC
         crPBLVqGlnc4ZhNnukiQsPSEET+lapTrB9Y3oaarnauzh61wLE7bdfV+7YWbyVxqOKqw
         W3+q20mydRs4el0G/O7KbHZgmDDZI1rlEYy2QHeTaV/LxgqegbeTRhy/MIcJ+ypZrKRv
         r7ysPnbfnn/hbhg+Kp/pAGmaMo6vmx0e+WA1AZqHZ6tYRrKtrtuR1O7Z6aQ//HSGqDJF
         I8o+SLVZ99rV+ggYTGSSJj1+1Nq1U3G2iQ4ezDjvQBHpQW8CbdbM4ilNaSz5Vu2M8HEG
         uuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246451; x=1790851251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=vKzjznKgngGLQ3zcqZW4hoChUWMWajNqjS1jzbTfACNBF6bECkOdObSMRTMy1g99y5
         HCND5JXyVgkCXTYkp4Yady1Ard9VKpXuaRODmNws1YYFUdy7Q877Cbb9Nxuqtaa47/Gu
         47UZ3cw/yNDEOuFzjvj49TSPmPkBLGqVlDv3F/8WXg/T12K1uFfcD4ybiFViozAmjA4s
         WkdBgZx73qgjccJ+Q7knY/iRTjD/47qRnpBWjTOt2D82Uea2EU6WtVDw1SaCayM4dbEM
         Tc+HEmXn11Rib93479vAtAzND8Ry4EBQ8Trjn325ENENSjMK0XiP3A2QDZ+zaFgC6gAs
         rB/w==
X-Forwarded-Encrypted: i=1; AKwUvBwTRy9wlbMqG3AW67caX1vnCEJxfSS722YN8fHejizUKzRjtV1aDM604JMVwkTZq2/PPpqnOLA3qs4=@vger.kernel.org
X-Gm-Message-State: AFuF++kgN9wHTKJE7Jj6lSXvrGH82Rh00mqjmqqZI8S3tytQ+UYu45jA
	50V5fmVREiPKa544XysSxZ8h1HpGqe2PXqrf4P64TZhiDBPaPLHLNOlA9F+gdGH3qPNPlEnq4il
	AfBQpG4B9ZaUmiBToEZo5xDiWhttJFd4T/aoUj2mpmv20cuikwCGsxYSVY6UZyeQ=
X-Gm-Gg: AYBFou0PAlMpbsPUa6pTWYs7XQV4Jt5CdYswFZZ4lynyMejCixwz3p/tn9qav9o29We
	iHmIA+rlv3LyDh3wB4bRsVuNSBleDRaHBLLRMRPa2dzxd+aniR+PfMJpDQiG78MNRJJAuM3MtiL
	RSh7QYIapRiptKHaetW9ZivRwSAAHosq8RCwCZbA326MtE98L0LAHCkvAp7n43zxwhtAiqyQb+y
	Vtt67LtySYybwcrgZ+TEdVfsr1pxh/1vW8CnWBSL+MSWVsLJpxvTgI2BKx7g9tOSo2I+pbUrKEN
	d+qe4Zpf+f2Ut5Ftxgx+S0e8fS3FbVD6v/JCTbdorDVHWceEbsTmKzwcR4AeN5zsijZCKOASWfh
	HWwrwJK0K
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214567785a.26.1790246451246;
        Thu, 24 Sep 2026 03:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214561185a.26.1790246450622;
        Thu, 24 Sep 2026 03:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:31 +0300
Subject: [PATCH v5 15/42] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-15-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3oWwfGp34JH03+eBeSANU6Tc4ZJl2nG2Wh5
 9XN3zLFBCOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96AAKCRAbX0TJAJUV
 Vu32D/47beIYVfzSauka+DrKi0+iOEAPyWRMXRgMCZ4Ux1dcmlPATVAj3hSeSRF0WAdBiSoe02d
 cB+dcdhZQCGUcjEHiafbxb6dqUJDaKpJUB+F6bEKfTkDDwDfuvRyujhk2IXB0bPKaGGDsNky4uu
 CLrAYl+IXzvGpkodGZ7bf/+pAgCq8VjTwLiZE3jsNIUacCRdCR2KqXt1zaWV5uON5lpnI7ViBpL
 AcPykkQo6CzhcmS4UrPHvJo36cawlfRKfi3qFa5iwrIWiOKZVbY/6CdpsZPN/W2d21Ejvps7sd9
 XZUS9mW4HfL3jQ9vRv4hEEfEymdM7aUvVrbOsJ8BPZGB1tykZO3G55hlcKZ7OjaibHOZNuKRT2p
 ZyQXZ2yTS/cQ7ieIgvUvPdEBzQEsFP3iMLyPPNt9EbuaBxOwmhj+OB9sVr+1XCQvOVs1Av3TMVb
 wFOtaPRaqz6H7177ib79ZQtJA5EsnJkGi+Cwe2+FeH+2ghKnESGnJ511LVYYERyrXKNGoCawnIs
 WX5lL7rgy9Vqx3aZSjha8A6hp8XBuzRFwHJ6HKL+J3jGN+38biNLK0K8LapIl5Sc7xrJ0cDqQcv
 lZPCCAovmpnouVxmSeY4RRBX948NF9uH3FvtLGEkngFrCNLJabpMtc1xdtPlJH0ZOsALjkEo693
 sz406ntWVa4Weag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXx+oIj8xC9efm
 ofOClRnW2yOz/txOm/bqvtSzbwc4MZYVi+XZw6qUWJ2fytzexEwOdEZb0TeMLGxCRnAHXZp1E3F
 vO0enzFEQE06yjtI9a5ClXNTzeHYT7tNaP3ThjVzjj/wn4ikwchQKKGtc05R5IV7DoBaW5QQ7er
 hKQHCUpiesk+4tS6XUfB21hhod4G+QLZ9mXXXm5agAsdywjLPjMVUSJdjBuiFXFq3Rhi6zuznoC
 PsZZJpx1oO/ug9UPKrNyzuCBm0mMg/RBqpQt4p2NLx3H4vuavPSDviHdHKoiDT46WkDN1DCoISL
 HSAqWT/w8AY+zoqpobfzO72p8ncJTIBGNjkHJ1Kjw9LfjvdcDp9uUkPBnPqv4CWCchXJgQVLLfZ
 awVPhRsdE8Ejk8Ao5BtobwmYibFXbldK/hLmA9glG/ch7cw6L9amagm0uw2yHMWbV9TN8OfV+TT
 rIrXkSR8z//eEA1F9Vw==
X-Proofpoint-ORIG-GUID: 61o66FTmk0R8GxlHpqO_YgRtEe_aNrtm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXw20soSNNsgVp
 ewxQOFqyDkBI7hON7+jcYQNG387ntUXIruDoQ+ePirfQJeUdpqGFZPaUdzFDrJ8miX6UsVTQoT3
 n7bflrJSUlxBeScxT1o4NbNC0fLSqqM=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 61o66FTmk0R8GxlHpqO_YgRtEe_aNrtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index e310b5c9b5c7..c9473fb79ccc 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

