Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9737C0F9
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271978; cv=none; b=H8qHt/vKE+m69/KaI6e7FZwmGwWEQXdtpDfBfVo/wF+dm6KEfLweZWlR7truvhe/jtfdZ7TpL958WvoWruwXJKDayx+m3Zn4UyPdKgqoEBT7wQhxe8DMqBPQLJ8b1RWVWyGPHCUlhdSzapdtbvA53iCFh0axBzwzubpEiGoJD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271978; c=relaxed/simple;
	bh=akcdbGGOHDyFpDJgNeVO17N4YErBzFZbupPDnt0Ff24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEmPEcCuYeSmI82fFC99zdXXEdHex80/q7Ev+TjqoB6r+HsEqjzo7WDt9/tBvR0lqEOZuSJlpov5bmTYbu96fIumKex127qlgXzUF6Q8Oi/Bn9GS/cSaf9X5XvfxS8xFbDezYjqGGEYctcULsVFP7uEy5qBM+II8DVqZJ0ZAQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kClnZSqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7uFETHp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kClnZSqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7uFETHp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMCmJJ173900
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=; b=kClnZSqe3MNu7d0V
	N2PI9R93KmB/Ek0+xOoyR72UKrbETS2m4rUUo982josgQARcxk9dpWxxn8lVCtyj
	Quy2Nsq8Ab/mmlhbKsrXCuKSViAASGihNT0GdyFHydyel8YHfor8ojoQxO2R1SYW
	8IWII5d0ZeP+yjpphUL8fGJ3DT1tpDKzEeUorGaadIZ34VCBFCSdJTT2yPpyteZT
	Nw+SH6tHpwV4iM8JT/V32s176lph0KhVu83GCagtpS5fyslpDXzSJgLJV0YHvv0V
	YLzLKO7F0FL6EjapQiwwK/V4DG0wpsoou/vKbSkK6s8rsrK9IA0HcUq4v4A2EoRS
	D65iZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrmptw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso11628198a91.1
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271975; x=1777876775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=O7uFETHpVvXmvcdUF1RFguebju2gEXQssIQpbzo8xtNYcEo+YVV799cTjT4zQwOLYG
         z7gZ+ABddJv/y1Wk0EVcfGmSgyPt69t9TYYXqecgbbQp6SY9BNWwcbYb0/G5MICt3XLL
         BzyOlpb3xmEHFQcDFZcWgpIOYsnaDdJ9RkCTfl8jbSj1PsOiICA2HDBlSDSzWh2EwYNy
         VfuA9yCMr/Edbo9cTCxFUOU8SmVCx9yU8wwTj6TOoY8LpXy8UMxPrYEBHsm4MaV+ERXD
         sCeJHR24fnEKpsumjcCidutbPhC32uniZwi9IDO+xJaalaEqlI2SeDr7D2/qfTVfYc/z
         y5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271975; x=1777876775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=HBzwF3WR+vKDsDP8GwjcUTjVVMol4ith363b3SHIKyVOWWjzdPbw2BKJFEP5CoeuBG
         atRbjyIy6IJ7IXvocpzMaBmaXJ72RCpT/l83PlZl6YxJ1Zo4XsdObVng1nNAlITry2IJ
         ZEKgjq0ZT41f3iFjAyUliCsOV0NX5e6owpEIdUWy0/azy//BRN/QYViyyBYwdOMhAZvM
         ELvGfyKYz5gXG3mAKzhxCOPLe2g1qXEWDOX5nOZ/0JSpz1jmbN/nBIx7Hkat86qMOKvk
         5vi06pGotsgYknZSrCcHb/mgUffvR2kqyZWLkymarD4mWj3+HpQXzyUJKRGKp+M8JBmv
         EYUw==
X-Forwarded-Encrypted: i=1; AFNElJ9P3BBvh8glp4VxIJb4T4F2L3v1Szxl28g+l93Ldk32AVHBpynk8p3GCBam/Av/AVG3YWexvcbyS2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SgccW8OHUA9sF8o4xNxikLUSkKk+1HzZ/YzW8t7xQgrBDnsZ
	gm+6DttU4V5qYULutCGfG3WaepHK1W1fMrU+/XTJa9nO40Mlj6IUJGWK9+li/lXzIFOwBXtfPRi
	Om4CvWBj4PBWuiEoYT6T+M3dN4lwbkvVMsLqHR7i5GjkGmrXfDu82pF0iXskCMK0=
X-Gm-Gg: AeBDiesAwWAhfqKiHx4Zhqh9w3x/ogONyBy4/uXx/DEfHktgv/mb+oY2W1rk1z9gnmS
	27k4rWte3uijRLikP2dTrGziDSh1roXl0BnnygNxrY+76gtKOwXPoiG3QISiVBxccdm+vGE7j/J
	stWqkaaQquLDNVedjy8/2AwwiCsMcajHl1kN2rx7gHnliZh7zH+5aP7bGXj+/vJjJY9OhDFtcyr
	TZivNHil94qkoYnEvudsleKiUszvemLvLCrkDzV1E/OzltKaVD+v8ecNijGQIJ7uI+X1Vl0X4ER
	hANMy4PAO6WpoOuQk05bYmlaWbYyFBKPvsYAhuRoBlmbgBSVKd/NQfnbEf4AYlgOmphFmwVXjni
	E8+wM0wfaFm5/WpW/CpYOb6R2+QGFr7XVXqS/uNq/PCkFyNMK8UpZ7Mf7
X-Received: by 2002:a17:90b:558e:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-36140290941mr27724108a91.8.1777271975226;
        Sun, 26 Apr 2026 23:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558e:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-36140290941mr27724083a91.8.1777271974659;
        Sun, 26 Apr 2026 23:39:34 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:34 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:58 +0530
Subject: [PATCH v2 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX7rMp7d9tzzxC
 K3FOHLmkILooBJD/tYB79I7pffgffcfX/WCgVJP7RhyM+gdMsLBFRTaPdajNSRXYBeXRNYDAuXZ
 kSRFMOXrL+uRrtd5z5LPuVki2H0TRg9UFEA65lirdysrY93DgkdByEU1EvlkQKBLC5jZ1WvPEQd
 Fyj7OKoMVXR5pBZVsXEiiVSvGtMtxiAd8LPHzGpMw+SmDZht5YX6YQfXViS7Rf58zV4mGgiG+Qa
 INOPPHDf9q7qhrrVOWKQl1RniYYSrBVOyVAbyqKQDPwXqo2E4Xcqyxpqq0yq07X+lNXS3SXcNg4
 SLKI6lMLh6SHE3f1/3B9yE+mNT/Br5XgyhiGavqlCnT174GuFUCRpezVhBWrptG3j3nYmmka2cO
 HEUahF9xOcoDO+s8Hpj489AW9FiX4XLl1ZTrhEHaeWQ3KB9cAVH2qpIYBekHCOrpPVqtKumxMTP
 LGpEy32/fmJnx0bZIng==
X-Proofpoint-ORIG-GUID: MzSV7GRmZS3gqbXpL7uupaEroCvrDplJ
X-Proofpoint-GUID: MzSV7GRmZS3gqbXpL7uupaEroCvrDplJ
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef04a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TmjMgu7cwLfWQ02JmboA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068

The GX GDSC control is handled through a dedicated clock controller,
and the enable/disable sequencing depends on correct rail voting.
The driver votes for the GX/GMxC rails and CX GDSC before toggling
the GX GDSC. Currently, during GMU runtime PM resume, rails remain
enabled due to upstream votes propagated via RPM-enabled devlinks
and explicit pm_runtime votes on GX GDSC.

This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
requirements of GPU as GMU firmware is expected to control these rails,
except during the GPU/GMU recovery via the OS and that is where the GX
GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
toggling the GX GDSC.

Thus, disable runtime PM after successfully registering the clock
controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index d7cf6834dd77c2a5320ffb8548cdb515be237bdc..d470ade11b0d11eb40843fe84c809e71646dce27 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -7,6 +7,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
@@ -61,7 +62,15 @@ MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
 
 static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	int ret;
+
+	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	if (ret)
+		return ret;
+
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gx_clkctl_kaanapali_driver = {

-- 
2.34.1

