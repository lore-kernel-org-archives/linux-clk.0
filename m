Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC034E66CB
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554667; cv=none; b=VIzR2Habbng8a4HwdXPN8ewN4Vabx2r2hfz4251p7k3Ypr7SYBaEjE8HCxb+OMmznyXI7qOl9tJYkiBjKLQZHOW/EZgea0H/RkEs8htOSoSNwp74mnAYetr82gXqNREz5L6xMSEhEnJ8LJGMlQ68s9pN7Auj3F4q5H5tFEdl5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554667; c=relaxed/simple;
	bh=jZ1F4WC21Az3jEkyItdyWmwptqda8S/3m5px6frmneM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za2FASw/jvWre1/6Alp0Ut5CO2eSadDD8FIl3WFa/f1WwW2F5PmaKiZFtPDmlAghnkORe6wFMzUf77cM/4gu4fFEcWRbyxEIX2Rabl0uzsHNYK6fmKUIkvi/hmODw4eUaXyhQPOvWraT6YYQM9JwsKM1X6VusmNZvLkWNUe02uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EivbjGY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAhjQ9Bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EivbjGY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAhjQ9Bi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92r1Z978409
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=; b=EivbjGY34PWMqlv0
	hxhoJUtCXyp5eNzh99ZFLxbsKcXNvOem4QlJpPxdOtQAVfyEq1ld5gYd6Tj4kYbr
	6Y8o3tx5yjJw4R/QqoKgGmRYZIMiZlMLx56H+bZ4xGU8nxPuuiTkE6mFTY22+sz7
	Tt6Dxd98nA329Or7eYswJs5nONZuik27WFVZ4ijAG7NSmE4ErDWhKH00Rz6/bkZC
	xZlvga6vVEdRdeuaFVx6VJUtaSnKZvFiP3SrpYWdhXTkQIzGp9w75Vhk7blxxamK
	dRIS+SIJi1ARKXvfgxrxN0PXlWpGmExEfN8E+mE+ipX2CoBA0MIrqGYiY1Uzoi2Y
	x/+kcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so703159385a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554634; x=1790159434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=;
        b=hAhjQ9Bir6k6+1C2rCx+KPVRmzyMymMc4zOVWtpq5fd9bvoaPnI1tTufrxkv1pihxB
         ANNO0m3YKzNDCIs6PBgMIfsgLyLABjPLGGYvQJF75vcYyiR4+xVWupiV1lfuFw/bRnh/
         BfQcj6G0cXdOvmUf/qhJBRyRMeTqVaolwlD04s7IDV597a77zdqd6A4ofGxOUboEm+wR
         GH4hW5uM9drcCeoa0aBv0cnZCS+BkNoEvdBvKLKkFgRuowPOoVMPjrM5suQ1CNpKjAq0
         ZiIlVcs08uC8vee7F6LbliVZ4B+sqDqD2p6ydYadnJrD7XYc55r0wMQhXvNFFk36ZSwr
         yEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554634; x=1790159434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=;
        b=lsfs6IDkehqV6x4wlH2S9VxDuFgV/CO3xpZkTZusvH5r+aMpxbRRPF/1oqN/USNJFr
         J1luObW2Na58YeogZwS5Ns+IpOzvZV5v1s7c0tvnjZt5JD62fsMXqPVzRjRzc+bH6WlD
         uBYlHBKKw9OmRC3S3VC9Cd/PolYWfMoJyXZ7ufasU1LWZzg1BOct8D0xmLuV02dFKJcg
         23rQoC9pDH6tBiJB1a5pxEMjCBAthLEvqZpnrSIQ3vkLcBW7hezre/pJHZ3yZYsbZ43q
         GrBKrxxrCIs2GoSkCvFzK3iOvYZocpwvaWuFCVx93qIH7yOCnNXjem4VaTMrIOlxT7Ge
         5VWg==
X-Forwarded-Encrypted: i=1; AKwUvBxfl1kWYliAEwsOI5YqzbPxJkGFbdVs6vhgi27zi16BIErv7KdcmjDkwXa03BGRsetVVxRzAttiogY=@vger.kernel.org
X-Gm-Message-State: AFuF++lR1Vehk8uaedhgwk5L5ixtA9+NLQmCXAkZrOREAN9icbV0FmVE
	d3KoIqyOqcJnirkUwbnWU8MILEDrsM6usrvpXjzm5yQ0s48KbFg2rSY/HXtaXfW0kYIM8GpPW3b
	rG72rIchX/6l8VlsJ+NrU14mheEZTcp9TZ6IHeY7nfmdnuMANkDlIKc0TD/m40WM=
X-Gm-Gg: AYBFou1a7pVPRAUG154tqc/FQcQ8JMzshDbgqwcS/WUzLzhTLNG/UK2GKV312E24s1I
	qeqG7psM1sG9zW8thA0OUW6TNscuBhtKOsn2MBLWEF4peAA+WLkLDyDyr8B4NkCKcPuILI8dkdX
	vSvFdELZzzwAf6bcz6oZILugXwNLb1GuiBUzdEXXzfxHDflWACuq8+QRy+6ufetdOa7fiae1WJD
	1A0Ja1m7aNB+QgJJ4STntXJ572GX350/MALVgr+YkWS6SgncKEZ50HjwBg0AY2h4tWdMlNXrd0a
	UIGDElXcQEXrDVfTVn+arvWH+X6F0dS0G489xz1vBTAyUgIjCRzeoxUMjhzOw45zn5RZnblsq6n
	G8VM0MKc=
X-Received: by 2002:a05:620a:800e:b0:939:e5a3:10dd with SMTP id af79cd13be357-93bb76e2cfcmr326485585a.2.1789554633600;
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:939:e5a3:10dd with SMTP id af79cd13be357-93bb76e2cfcmr326476785a.2.1789554633097;
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:53 +0300
Subject: [PATCH 37/48] clk: qcom: gpucc-sc7280: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-37-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jZ1F4WC21Az3jEkyItdyWmwptqda8S/3m5px6frmneM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9uR24WEoaYzlFM9U0lA3l1k4QFzmiD3Q8Ba
 jsLXqsPk4SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbgAKCRAbX0TJAJUV
 VoEOD/sF8rRigchS5Y9B3F4XifcZuTcbaKr/HANbNCmrvYfVUuKagOKBCwlF47rh3EZ8hDyCzVx
 fLyweH0FOgJNxvowq4b0NxJQyd3+r5YfDoWCCiHxUSRrcQZ93uQ7waDUHrWzbWtrDwblM1LcVkp
 aszrBtW/dARUc0IMPdSs9jP8gi2gBxcZr0xYVjvsAzjgy5T/6t17Ag3g79IULiPPHD7qsIK5f66
 Q5LAJc+dRkNt2mu/7xxGzRDzeU6/C3Eq74JKKwBpZebcTItB/UhgoBqZDc6QFI0QokKa09WsCqb
 1Hn3qgxKlhDKyVBmH0E7uXmyDz4aFqDw/upFRWlZ665UKp5+DJnN0g07dFmY7VxygPRDd2DLuD6
 73iOeSuORDdLILxThMLfQ4hni82ipEiE7i5dzd74lTh3q1HL2oQi96mEthmicks05uLWFWnP3hZ
 zedpodgzt+nkJpO6fZWNyiGawethDGDqli0jQo9vDrJcq2LXQvY+cPOiOQaOOpjs1Eq+9s+EQJD
 OA8WIncS75pdAPmEPJxbHvn1aRP8STmZhjx/c6qLe/n8EfanYSlozwvAK73GNELSZERW6xe+jc6
 mXbn47MCUBQvzGOsaZT7hTKwjlZ3WG5Gls6hhRVsFwNh937R146yLW7s2JUSjYWDB/yVAxlR4Xg
 d16G6lckvgz+CSw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX5jp2p1SCUNoz
 /8JGu0Say1bYyRH0esjbtNSDUeSVjIOWWxHP4gwDV18o0mSa8OwqBp21zYm1pZfFxifZt709SVD
 nKA/A0pdRS5tc1/hioGOt12mVaHsjVavI649gS2DUz6vGS+bU7LrQW+u2FFZ5DjHGVRzddFETJl
 G4CVOM4hoECgAhH6wNZaeV2A+Tw4NL4+BXr3tSbCSLG4m6wGzhMGb068CWPvz1EhqX5hxmKIkXh
 E2PGbqh4G+wFuzCPBD0tWLeyOJYqIBg36DwRGUD/Qy3B87oBuH2qJgo8hDcsjstRBVA7QYWsTSp
 vJHaJXS6ulrW0MVdOQuCRgIasKgLTOK5tZSST4tNXkBYzacz+urKkRuYXy4NrZWlyz5hPdtrDR1
 czJg8E4gD8L6spqB65PsAdr6XsXS/OV4wRYFif7q88BTVRQnng1qGtvv1xTlQmlVfrCQTkDFtG6
 m7xWEGYUIY8dPYiNGPA==
X-Proofpoint-GUID: opegSi3r6XhULSYPB8Ngi925ryd9F5tY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX934IjbodeD3D
 ZPiJZJhljicb7pRrBJTbz100b5qEwsU56Hj3tXLclSPoZzZW1Udzz/7xfxLLeaMt3af1FpQDUon
 +g9AAVChawdEOs9vrlyHTvYcznc6E/I=
X-Proofpoint-ORIG-GUID: opegSi3r6XhULSYPB8Ngi925ryd9F5tY
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=W2O9Cv0nt9n2xGTIkqUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the GMU branch register update into the clk_regs_configure callback
so it still follows the always-on branch enables.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc7280.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..9b267276eac7 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -440,7 +440,24 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc7280_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x1098, /* GPUCC_CX_GMU_CLK */
+};
+
+static void gpu_cc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sc7280_driver_data = {
+	.clk_cbcrs = gpu_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc7280_critical_cbcrs),
+	.clk_regs_configure = gpu_cc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
+	.driver_data = &gpu_cc_sc7280_driver_data,
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
@@ -464,11 +481,6 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
-	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

