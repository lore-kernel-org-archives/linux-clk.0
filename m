Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3947A861
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246490; cv=none; b=Pye7bnGiHceCzRPgaV8gXUjzCywHJ4H9gvpXG/Y3wiGBehTxMCB79wycLiVUk3rgdLkul4KUF7FhEmYmgRIfXfCofIroCdz1AMPzs4c3bKH4KQgwfeJSe+8sca+PBLHER44KEv3Dj7FHGwvzkPGP5//qxTfZfE8IVg32eYuy6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246490; c=relaxed/simple;
	bh=DUk1Bj8mORtyNB9lrL/6HeW0IjUJt9z7LRSgKsZGugI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYsuAM1L1WEvzGWVbRauBwuHyR5d5UEFSHM31jKpJD3wVlffwl0JMyl6zwwqYTbJ7YgWQ0iB2SC2arUU8iV3dN38tEII/PrEfhTSuMeHMa/6v5q6z7oJtI6w8JwDTkYwVNKYPx4IZ5D8iXACClkdJ81C53KdM9AGxcZMT9V+3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/WKL20q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnOOn29C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/WKL20q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnOOn29C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pmwo1644184
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=; b=f/WKL20qG+wZ6CAZ
	HaNvLEoM4kkRXGnOujF/qhMyL+M3Q6oFmBkBcUDEK1YM0CJIQzPtjeH1xbd2xtGO
	kuzd9oRMzdWRSX6PzWHahODBrP/ibubnNObLkQV9ECVnogSP9ziGo5vLJS1veJR6
	x5w9nOl4ngnDwXoq6Z0kmSCFujGAuTIo4DSmKy8fb7pw15g1e5MM6A9wdGnDSdQU
	M6z7DBLtnFeRivuvjFdV4VbOPi/xBod+785slwk6LMFrsvezLWpoBFUWASOYNQEx
	8IpEPYHA91syo+ixP3sX5y2Lhba5tZedT3YSxrQs8NsqRgg/k2JZb+pudIaUBii0
	QbQ1Hg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb42s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso296866685a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246487; x=1790851287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=;
        b=XnOOn29CtuKiCQZDQ1uJwPuFz+IxfVZ0zjxKmgVviIBNlx5LexiKXTA456wUCCr6i0
         HHnY8mGywT2EIEihiQzqnw0If+sZ+oZaHoWaQiTJ74hwOrDRsJKEV+Vwi89R/WQ730Z8
         G327rBs2AximL8oTBBr9A1E/nEgy5XsjXVpZXHOaMaH0h+ITaylX9hG07J30sp1xfdTJ
         z48tpssq/ZJmYFeRC9kl2xiI6sQh4/CbSZLXvu280cpZ3M9ACN/FszRY2WLKBcOqKGc6
         ZD0Y/YPcaNfHBO/7fTUyN4Mp0clJ0z4WCwhrn0St6mQnltcWnjRyroSuqnWSav7D5Luo
         ODsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246487; x=1790851287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=;
        b=r6vwxWBBYmhZW0MyBsUAlN/S5sH4OACeZ59qFaHU+bjZC16KLSn+fX15LXavZpbQr0
         3apd0IpUm0u2ymi/HpUYciyBl7QXeX47nzn27O8BNrUykCacSYzpAhOzw6idfIIRXD8C
         wDQTIeizPpAvQ8tVcrMumr5PJPFhWjMD7MM4pmlPEBeciOqp6wHktDuFW8UfeRBw6x7G
         ahsnanX8GJ/iRnwNEQtxPAOCvueazHbjmwVkC4pmKHDNahDD0WXBR4KzTDPxQL8mO3JJ
         5Q4vqJwjiX/T1uDDWL02Eq0vwANgLQ0eHCnmMP4cNETDcoT+hBoFy3tUYYsAtDhtzIMO
         h3fA==
X-Forwarded-Encrypted: i=1; AKwUvBykXcTs1+CQK/69D7N4HbbIQzJGdHR7HVk1xgFQ+qlMIInHp8EICHQv8ShigUPksNynfnEqnpVLHhU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfwmCqYyyu+3olcGWqBeAi/mYxJrU9ylRmym9/q12l6bsvGmVU
	U+fNBPMJ1O/kFv33MGWLAiCluiCSzjEz0UhNOy1qAq7zAmfHXO6kS3wqs6C1+Vskc+qKelwTF1W
	ZP6oIVUTejKJLZdZj7b8MkdhRDU2J7nRSqLFDvOLSAQBSPbjuWci18uvZ8usi3no=
X-Gm-Gg: AYBFou3NQ1W+VQ2bmXb0EklW35rs8GwjA4891DBRoNEHOy4KnL2hwlkl1isP+kRxQ3R
	1CI3prieAXuf9q7TMZrSlBGMZc3T1WIQdU4rGvmyeP4vzlKHFs2t3vXpL8pimTMMiuIt4/H2NvU
	WeGFKyPpv2v/whDAqCgyDNnUYmgtySkx8EEhZHlRbRU+wpAaIJVR97IMf+I42McjQbTb6J5fWuH
	cen2IcWQCnnTZL7qkbgBl3tcdPUWXTgmcgH8pIFvVEeYoxQXDd5SjYWTS+Ax4s+RA98M0DRww84
	vw9J3NRkxq7BC4btwBe8piv9SQJg4HKF2ZX7EFHM0JDcv2z8BY0n9nA0/oAvr4IXl4T4jSiYiP9
	hY7tfPfPT
X-Received: by 2002:a05:620a:2a04:b0:939:d762:e2d8 with SMTP id af79cd13be357-93c36413afcmr200153185a.31.1790246487386;
        Thu, 24 Sep 2026 03:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:939:d762:e2d8 with SMTP id af79cd13be357-93c36413afcmr200148085a.31.1790246486717;
        Thu, 24 Sep 2026 03:41:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:43 +0300
Subject: [PATCH v5 27/42] clk: qcom: gcc-x1e80100: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUk1Bj8mORtyNB9lrL/6HeW0IjUJt9z7LRSgKsZGugI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP30Ke9RkBPdPsP+HJGyH5LkPtlfYjttmaneh
 QZqWCMTKb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99AAKCRAbX0TJAJUV
 VvqgD/99nRQ+CwVCDB9luyU5grj+7nSNMdejtCto0gKKrO96OGaGiQOuJbJkVeKbq9q20JtALaI
 fDS615KHjsZUGFRkzm6Hn6/LOx9OjDX9k6IA0i3z/G5OyRy2nrnbc5wuAtovKUn29/XBCkFRgrv
 qS6RHueeDajrJLKKXL5Lh6tQskqvJ0FAfDluAmdFG7wjyKDi6s/lJ5s5ckwYkpTp7Qa8byVQMCY
 pGcuF4zPX6KTXkJEvQYurANwUkqIZLTtqTNo+38IOeiNPbwIvChjGC29H6AYVN9OhXQcqPA2ET4
 Fe670Pn/eyoAJwkPEqK+jA2wivTkfLOhawF/SL8/V/pYtqBODD24ZmeD1h5jOTqQaHTvmaBZZQX
 /yGv0G0NG/r9V7vF6LsMhn6VCPrbGwkTauOGceQTm4oxi5NhSWHsyJ4ss/TZDNOu/R0JXr7feTL
 F71+/GRzSDzRhE1onWMfYJwqhCs55BV92fvc9SnuAcVczi7SSFrmzdDobHjAwon59xX59bqPykC
 S3YCd47hjtLsPMhsssO0F3cYIVDHOm0gsLluX/TM3GfbcSGsiwZEdhc7LhBAo918CJZPqSlRQ3Z
 6I5masVaIlS/sNvcJ0895hW3oki75krsiHHW2km8hCMX6wvu50esgy24ndShBGcM0shTTNNPRT0
 7NXCBSsLt4VjNow==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2uK0g+CDzTU0
 BdspyESfWK1Q/jKePLVPq1srU/hI9Sj22hjgGN6lrND5f+v0aqsKyhFSAau8Za1yX9UVlG+l28k
 IbrC29Tso/r9Nf4BcfD9P5knOkMJGOGs9nKiThEZzPFyPfoDhdwCmbCOOn+FfDA9e5ZDkH16051
 o5y1sDPucJZtDdHMetO/uu+cPeOVZjOO2hNL4V0N9i02ioNoAjI9vNWaMylFRUBs0zA8YkmaPM/
 BForhV7vGEHanE97vIQx+JeqtmCfltUKoj3B1cdvgn0qP4iUK1j73VR4HgqpWzyr/U6FnK3pcAu
 pBB9r0nySB6IxLOlnNHo0/EymQRVoKfewOBugN2FD7Tyk0zeTfuy2Dfc/Wbu9kBD2s7vsD4p5e6
 Ik/geqpAdinS+k8lJ9IZr3pS1wwSxXXEPhP6CYVFXN1nMbNrVo2GKhrVtG1EmzZdvyentglWKwD
 WGrWVENCY7+xi3jnIqA==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/TwM10fEPf9W
 dZ+uFtj2TfcXOI3Pzj6v/bJHSRGU4Fn5Zr7eMDGaCUSjIy2CahVZ6OzlSizPytHx03bheD9hqwO
 fj8iSsMl26UJCfdjHKqxosfyzeWxicw=
X-Proofpoint-GUID: gpM_BV3nSwF4DfefooXyO8IawMwrgxI2
X-Proofpoint-ORIG-GUID: gpM_BV3nSwF4DfefooXyO8IawMwrgxI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 9402fd7fddb8..b979b7415377 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
2.54.0

