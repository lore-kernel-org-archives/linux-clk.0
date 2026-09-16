Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B2497B63
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560299; cv=none; b=AcXaPMirWhj8Kh3TT/gicvMOLoklgLFVQF+2G8TMq0sKqf7tdXEdO0L6rD32JODj7ixMVLrtgvPgfOksWg8nqrM1e4Hfpbnlj+rdt64nbC5ojO1DkotyKWyLsQwqgkBACE3+zHKyzToOZZTIEp2kduRDO5ifhsjwwy9r3zpR/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560299; c=relaxed/simple;
	bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q1LpV/wHY/eiFMDtQOW1IMpQrJkjociIfLKnZ05MGjREa4cUPrIS8ges5vulxYc10leWXsG8G+/+7xKeMfA/L+vePRoOQ1GDCGQZorpjTs1+rvDwZcvO7R4+i8KaBGRqysz8jC14MydF1u0f/c0UjUl4i1INFghhKIBCHAEUaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNLfxSZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cs50X5rG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNLfxSZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cs50X5rG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92umb1721207
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awk6pIqsCHA+sxQSt9Y0zl
	gxRNgYePRTmYV0bu7IlOI=; b=mNLfxSZ80U7ohFLylrXk9HgfjgP9SIFOHT2oQG
	0pvemc/t3YlZQc/RP/rVTYv+IuE0T3Bj26nRkhwW10CHMLjA00xjkYoPWTV4GVlO
	3CHvx7RkwmGfbACvlQ2SVE5EuQyxI72+lkoViA9Ov6pjgqSO7D/CzQLW2HaM3qpd
	E3lT/jkZzOL/TAS0kOjW3h2rgtjUr2U7gFy5+Wkjy50b6jC49PM0mg+I9mOmN4+7
	0zwOxskCZvt4pE/NPomFfGsFI4/nCnt8k6CVGWrGqC/bw0bYqMBUL6IuqLAwmuNb
	mMkivwBcD6jKFdw+nrNtD3StXLyDfPcbAtrM4mCzLFh6dcpg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkqya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:04:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fea4e86f5so1804196137.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789560289; x=1790165089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=cs50X5rGLtDWE7uxti22TMGGvS8VputZcvp+8cl3p36qw4Y1GN5YPFAvPbQhvuu3Y5
         ddfRB/9KOidcO0lHHJPtwFr29qicFngKM2dARX0ScMO+79fBi4Lr92XxagnxaRSqaqjY
         w5nRsRBOAmdzlkkILRGKdk62eGMB1EHz7/CwYYw6MNlHF534bQqtYE5oJ8WW3PmtGmLI
         creYLjnVLp6fBhR8suy84FHU0axw2z1eG69trlW1sPq+TZ34eiqFU7VARJm2eINFYYH9
         ochWD3HUVwl7YKGU+cEX/XPOuOT1xaAeR/Nsg2s0GsLXB3FytsygEFs1uxySrVoAlGlk
         houw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560289; x=1790165089;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=iJ01LLA2JIK2Byz3mVrv2uQ68TvgFbJXKU3G4O56M5R/6mO9FevT58VVfqytCgqHya
         j2jWgkLhlCfx5XURFOl6xVIxuWHvgtFjaZfAuYIuzWt4qxA2AnHU8HpUx8B5dYQlYiZh
         s2KRK6PtetVST+1qpOca5agcPKGIYHtfPKpqzM3zwPuzlFbmgjRbadwobdwXG41PfO2R
         mLvGRtlf3pBs7ohSdokRs9IU5qRq5fcEPfLLieWXSjMwcA20SlZdz3uuiS9tgk1ur112
         h61lDpyTQflgvrMnVNhDtFmV/iwW2amDOE8zlqhCF/0qMkxV9rTLHC9XrRGIgVhqB+JL
         fysQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ItLAgZ2/gQqyPIj52+jzbSwQDjBoVbNXFcYPbEC3MZYvu+5I4XGOrsgNQBWZR45YzhT+KovreDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mX6TFEtaMf+M5bF/8lg6zRLRaF1RdLJ5IPJZ/K39vcaUo1Q63r
	so2vyD+Bv0xXpq5i/qMpHf76sVGfDVRRmnTu5dwqNdGyzeX2b55bGVKfIxIzlTmeCQqepkNAXeS
	UkASIbKx4DqZt5kDTNOlKNDTaAeZoXPeURhBfToh8n79ce+WK5VvtNMGeowSoKZg=
X-Gm-Gg: AYBFou3ZA06++JUHAlODOZ9El1QNSr5ETDvUQGLHh0DggEYg52W5qhWfDItgIEeRUGL
	HrWV/1fIUJuBEhcvI5tVYehILNkrgyBpuVjoKGJ2c6T/Vp+UCFnAvGyAXausoMTfwEzsD5235Fn
	KjsLI9G5klLG1ghiVMiXWBmZH37efh+AY1gSYYanCQgGqXBn/EIE+gBmxSmw72RdQ49Iu8rbOoR
	WXqtNiAJ4gAM5uW23KbxN4m1yT8Klq+KNkOLfQUDRTLNaOxE2SStuWfQG1UxL6KVo10Tccrw1Nt
	3SwwKA6jejDpUiV8rA9OW8KJd0F5CXb8AGtmgOxO4cXpBA9p/vBqyl2NDVEPxsXLJ1JheVTKNX6
	UgFxx8c0q
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720056137.3.1789560288507;
        Wed, 16 Sep 2026 05:04:48 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720003137.3.1789560287959;
        Wed, 16 Sep 2026 05:04:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm70514665e9.13.2026.09.16.05.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:04:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:04:41 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiFqmoC/yXNQQrCMBCF4auUWTswKTU0XkVctOOkjiZpTVSE0
 rsbdfnB438rFMkqBQ7NClleWnROFWbXAF+GNAnquRpaai05Y5HDDe88R4yRGWOJvbOEXt+4hGD
 2yHPyOmFH3eh6a4kGDzW2ZKmb39Hx9Hd5jlfhx7cO2/YBFz7nXooAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoXdBm951inBggT/YDjL9giHFnIz/vB0497cR
 SX11cPMFzmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqF3QAKCRAbX0TJAJUV
 VmUKD/wIqvmQ+xGGmXTDmFU/zygFgTyRpcwSMs4J+zRnI3dQSgtDVHnseDr5PRnuiAsOT5zO0OU
 SuUUgrW4BTUlltdFOwNOZld1nnOOLaON2lek7whiy6wSNyj4eZyL7O1sCiIMdZ+ZLNOZt0N6qb9
 FWIRqZuUsgFHbLfyqJydbqdv2K5jj6yrIAr0EZ8k6E4iZCiBW3T1jJQHM+y4FLTAg0jyUenPBvW
 KVN3Q/3W4/ur3lJvXAv/EPiiWIXdxzMb63E+0Dv+cE82aKQYUAI5ba10Ya6EaV4fYc/kwXKC+rB
 q3Kv/necREQVCBxFbFVxm2/Xqk3cgSRIrw6ZREaki4WqZE07pt0fs2ytHmye7MFUUgLfvAPz6SB
 a4x0o5u/z9EAns6ggPEbm7gRPRFBAp8AtTHmH3Pa3PHYg9avrXeBbSrbddF9tTUGzTRi1wBx8QI
 a4PySbhIGTKnh9px75oXgBbS2WG/ppWAsWs9t3AmZcl6YO2CzTRUF2HKls5HfQeTlYBbyPjdVNc
 vxbcPsvwgxx7IBdr+Sy5Lfat4lzGZ/QPnDUmClmQhRgcwQ1CjpS6I1+IiA/xTFH17fdLTgJtyBq
 nOPbgI2XO0ySPuZQ+hIQq4wrJGL7XzFeQqWjD6iuc7/q7RGuMM8EicR9JFEildCZPn9c3OqzcPY
 qbsai2zK27gL0XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa85e1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PDnXyD1IIKguCH5BrScA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfX59JTfS9qFkOZ
 UGV9kj0bf0NeHw7c85s6JWvFBxhYuTn4pGYM1sBpzjPR69TZuAeBqh71jzsUAn/p9BQC71y9wzf
 2EKUnjwqt+oAboqNhP19DRBFkOhCnkaELL8TTRord9xq9qZkM/27t0kM6BtuAsFjc2b+5+EEOHF
 PCfAuNlClxmvHB3iWQ3QFXppKgx5qLg9WD3vzTFSz1X+6aCselMKRNBkofciFFSxKwKwmGWMUVO
 0OisvydBSbYslh5rDggCbsNzR73niYz1IRaVeVABatCKMEyoeiv0bBDyycpYUkjgxSkZSHcsMuf
 BfvaNxcgdkVUYHEIULzsWdm1xH1rpEkhZepr/najYzmwl7ZwM9p1gS5j6ScIL1efk2BhtmoFQnN
 w6nVd+rkT4cl0dxyNIVYxTrSwSA/k6qXksiGAwoUT9pYgHEzvPx1fjWyWBRdlXhnGy4mjK7JHpT
 +fA55CN9OSGZXqBLA2A==
X-Proofpoint-GUID: Al8LxUrCQnTpMKy82ZyGnN4kpNQtBKKl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfXy55xGwPUG9vc
 i+2/UCNsTL3TbTZn5MB5TS9o+8kmKRMMwmMteV0Br8Dfg1g7vNsHOGsvfU8vbS12e0Gc23bKUcb
 dlyQUKScd+zIgW2EIC+bw1kaBB05a1Q=
X-Proofpoint-ORIG-GUID: Al8LxUrCQnTpMKy82ZyGnN4kpNQtBKKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160160

PLL15 is specific to APQ8064, but the shared probe function configures
it unconditionally, including on MSM8960. Its configuration registers
at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
0x334, so regmap rejects these accesses. The PLL configuration helper
ignores the errors and probe continues.

Only configure PLL15 when the selected descriptor is for APQ8064,
matching the existing variant check for the GFX3D clock adjustments.

Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index a23440e13b71..a67df833592a 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
+	if (desc == &mmcc_apq8064_desc)
+		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
 
 	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

