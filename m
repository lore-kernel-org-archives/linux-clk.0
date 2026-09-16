Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677AF4FDE42
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554671; cv=none; b=lITXy1bEv8TR22FiP8lj6lhxNGwmG4vHqf2uV+ls3gkE/iNm1PC4kNbQybj9nlk0oRMuB4AsmW7VaAGC4kHsAQyxQJ9kfeUrxWiz56BUH1E7jL2B9yiH0lKX0t2KcbeI8/2oFB1nEgzoJtSrsBBV7LHRODR8PARMl3fjdKcLdPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554671; c=relaxed/simple;
	bh=c4S9D7xkKFu8M3uO9imMybdUjuODrfmq2FnzGW6fsfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWNdUpcSKgZxIBScDQJctvSnSQPzaVnb5TXkjPeRZIPL05w6e0pdXpMeEwax2fzdkiCr2F9OsNTr0eL/L1R/wrKrmx5Kg+nU4TUXCA6dEqQd4AFeMhUEoEM67RLsGh7onldpx4ITz0KaqkTCprZCkAtdBPaqGeQvlLwbJMIy520=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naZvRrRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6eFPSNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naZvRrRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6eFPSNf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934tD2226492
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2N3h0PvEVaJIhwWOlEG9IkFO+5IaOL2fHxO/9nHn2M=; b=naZvRrRRyjtAAVha
	8RLMh9I1Ea8qZQ2prxsM4Z2q9IVQ4qXYtnhXaOKCyWRYy/KQF0WrHxUudvNNFT3E
	ScdlrI68GAW+b+ICr4xYvVDvt4dxLG2TiM1NKkeRyMYOZtWOnA38cuZS5K+KCFhP
	JSaJ6p+gUxlQj+pzZ6DV12YrkB6Sz1hvBGC/Dhi7gCDeH8XcZW+x0A7MXU4yvpca
	Gtvt5BDDjgSpLUZtFooRh3phXMGps0xKSpRP3CMHA2OIgsfyI+vr9Ztjk43nDPYF
	zN8Gz5BLbf9E9Qc783rDZI24WL7p6qKQWhELH8eC5jVBOQUnmrc7lFwaQ/mDsHTS
	ByrGdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d206e2b4so115241291cf.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554646; x=1790159446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2N3h0PvEVaJIhwWOlEG9IkFO+5IaOL2fHxO/9nHn2M=;
        b=P6eFPSNfBDgkoVaRaOxm+XOUVET6akTONR0Fx0BdhyRa9cMZymWx+UIADBZbcYMX9M
         T60iBjEqhDSvM5nIhcfFe+5w+zO5/282k1F0rcOZLgK2PQsxvwewsB/Oyg3MmubVbx0A
         ihQu/FI3fK1IqbJncFWOm67C6rBP9977O/RI27hKfGga5tpu1yw863U755sWZ9Aq0E+Z
         j1G9udtoFDpYamfCGMgtlqDjjAPyXdKc9T+9rq7mGQQZ7KPy2zJ2X2zbiWCv9zdDnXdf
         b6VdipcekatbBVbsWLS1QVOQJ+rqNgxUKI+mOOSrlnoPgdpAsK2XAmwMc87iK6XK19S1
         UgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554646; x=1790159446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2N3h0PvEVaJIhwWOlEG9IkFO+5IaOL2fHxO/9nHn2M=;
        b=inUfgurVqBHRpEPNQaaxXp5lH0jdl14EnXPWpv2m8sbMRsCs2T3Q9xhJt9QaRqMADa
         bLfjFHtYXNM7cn3+CD1Wqvu4ydMec7yF8AbNGcx7QuUNX78C/DN7OYUSF/8kiO3JE0kH
         7TOO9YTGYnj51mQk7PJHq0oRqDSvqljgLjyNwZme4eNfgeRLu6uOnopa6sO/UcbAs3wJ
         fSdgPLdlDAiqbGRFP9sCVYlXf6n65u5bS7R7rxh0toWmwutJPg5k6c4jRoXuyj7s+2E/
         HMy07ohIun7jIXhZH/WoL4huH22dh8Pqnplz2ytKTwIRt4zETS/R1l7BfTo7zzsmClWd
         zZDA==
X-Forwarded-Encrypted: i=1; AKwUvBx2toqz2PLrf0+74z7oknl8ncPXi/Enhl221sfReevnHcajkXYVu++bowESF2d3tndHNSKy/wLeWD4=@vger.kernel.org
X-Gm-Message-State: AFuF++lS3xkZZiFt9d9VBOn5f8PxlM2Lix777bhCbgcUZfsYJDSIV4AA
	ZypAVzB8rzthdzs9o9of6txbW6rHIy+3rcPRU32Yr7NskpXvWN1xN2IA8lApPUqtZClYHV6OkFz
	pVls5yi5PR9OaQpQs6RP9FwhpT12XDaREJdNbeFWhiJyaKsLl/04t0JLPv4PxSgo=
X-Gm-Gg: AYBFou3QjJBWahrAVZWMG2+ijs7bR1P/rmGzGL2uNJTcDhB5KkO+ttNVXxiQtbrb7Fn
	YRGYopXoFWfnik0jkqjeIsxRLXBOOiOs8yhz4oFFJ9DO3PFNK6/NDXH8YEh2ZIxa3sYxfgpUURi
	/WV6BeMGz1P0U61fztmeIPHVRkLf2qIE92AjcvhsYCLG6D2yPnyil0DyG4YLF8S1MRPokP8VVS7
	xLZlagnJAgP5LvuF7+WzgfIwT1eNJiDENA7aY2k5kpUNdTsOGLdzDq8aET0Vf5gD/HgzUiKXsKO
	+S/MVqKlMU6pcjVXAVj4Rri3ncunfosFMkcV+BANzCAu4/D2ccmiLlpLG2+Wln0pS3IByQo4XJZ
	9KEpUKyY=
X-Received: by 2002:a05:620a:4728:b0:93a:2bdc:cd57 with SMTP id af79cd13be357-93bb77085edmr305791885a.2.1789554645503;
        Wed, 16 Sep 2026 03:30:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:93a:2bdc:cd57 with SMTP id af79cd13be357-93bb77085edmr305784885a.2.1789554644951;
        Wed, 16 Sep 2026 03:30:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:58 +0300
Subject: [PATCH 42/48] clk: qcom: gpucc-x1p42100: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-42-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=c4S9D7xkKFu8M3uO9imMybdUjuODrfmq2FnzGW6fsfo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9zkpqZZxcWOWG3N1kpaQigtD1YexLocJsCr
 63rvv8oMAyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcwAKCRAbX0TJAJUV
 Vg7dEACswX0C7wofWJ457w7mTs54ioeJUK/exiPsultDpNSOHelV02YWQorDH+dH7ko5ccjrIDN
 xDgLrp8NUFdR3RHY6If+u8OXDulNKVFBWSiduRTQX6dvTUu7Ph8ex9GgDKaj1qJ6Ow5iw+Mbbh6
 xbO2NrGaXqfApxbOXWJCz4qrX/6E+TE676KD8hbMQn3x/fXfhY8SLZfrxrl7XedJuoPuoMeTkM0
 H1VL54ZcyAf8e0k3FdW9jB9IgljHwNyJgR/Btl6XIzw3D/igsHS4Ur/7FXrkiwI0svOCGxNg6WT
 zWXW/+V/t6nnIpO6u7CIQBLCxPet7ypcT7u4CdxQ+zVzGR/xVTJgtNiUzt7neXwPjxM2DNHaMgt
 MLJhVBWWQBPYGhnn7xfK0V3uFbWduKCCri3xJY0CT7PzxFSVvFmfblB0w8hNEbfXuJWTTbELKPs
 /pSciksVYQ+Dm+wTlKE3YMNIhbeHSXFbb2Fw+5yejmg+Hcb+6WhW5TSUEjjqzsjdMQEJreNssD9
 zJnS9pIAvruNoy5CJnNotP/m/zsFSlpqZrf09XcTH9+vH9LtfSoxHMySEWdj3gbqO6rqolrnwVY
 jtdXGYz+hmTjW0mQx0TQOKPgPDpPNnFQQP9RsalTPV5NZP2kzWc4DHUf2C1Wo9BP0uVdTWU3ftG
 sNM5lqe7vwTFxvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6fd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -ohnacBhObVVi-Cc6JW2v_D4-NPT5bck
X-Proofpoint-GUID: -ohnacBhObVVi-Cc6JW2v_D4-NPT5bck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+yacQOe8bJ1R
 km1q1dT6l/SpukIJu7WPn+hff60gmSzNVH1phNcNVvOlXllR3rmAdS7tr4LBAbzjyAhnauWyGJ9
 Mb1lbyxSOSPXfsQOSxM/JNxTRsPdHiw5zbXJnvABHQLLZ5Fr0kO+IcrC7URz2zP+vUrgxsPDIrw
 LbR9RzpakRNbgxPIw+LssbPSaHe/RYRFYlZhT5JxmGt1fLxO6TSaHplbZJCE9IxoywGFsnMXeqq
 4wVTy9YQaStoTuMkoalhI624+RyzNBsgTo6Cu5p8C7kHl8nEmPgPTNRWM74qBRTdsRVG20yqHEl
 2by23pdHzIPLIoOZDCOhSexmBfeRCY7xHan5wBg0u7RpzCNkFUMDFFjWJDFUcEJPYek2Elr2XoO
 RY4LpsWvCt2v3adxCfpx/sp70/qbN1IKy/AmfCpPeYx5QXTmH/cSjEWtimf1oEKkrKO9PCGn960
 1uV740pF37j6eDvFKsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3NUdQLhcwM9u
 ESazoa2QwanZ3mV/EzvHSwRzcgCNVJYOnVsjwt3idg2PBab1FK6ZeYdVDIYZAzPzoDrqHyGjx+a
 ABVEW775KjhGi+PcCAExODGR2Z2SYFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-x1p42100.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-x1p42100.c b/drivers/clk/qcom/gpucc-x1p42100.c
index cfc34e0fd290..3f3fec257f2d 100644
--- a/drivers/clk/qcom/gpucc-x1p42100.c
+++ b/drivers/clk/qcom/gpucc-x1p42100.c
@@ -522,7 +522,19 @@ static const struct regmap_config gpu_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_x1p42100_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_x1p42100_driver_data = {
+	.clk_cbcrs = gpu_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_x1p42100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_x1p42100_desc = {
+	.driver_data = &gpu_cc_x1p42100_driver_data,
 	.config = &gpu_cc_x1p42100_regmap_config,
 	.clks = gpu_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1p42100_clocks),
@@ -560,11 +572,6 @@ static int gpu_cc_x1p42100_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1p42100_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

