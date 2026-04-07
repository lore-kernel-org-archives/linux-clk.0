Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076593A6B89
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554314; cv=none; b=mooG7QwzgBJcHMqm2+B5otqSbFPgr1nkh2q2w1kwN61sOjjitCzWTSKvudnDK2omOIe4+dkMxhFxI8Qa2P2ZwMutrQ9AQ6z85SWhN2QwtkfyU1+iL0jb75EZHpGKRtA4E64d3e70KXpQxRlt9tgI9uEjym76e/d0TFgoXcxpOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554314; c=relaxed/simple;
	bh=akcdbGGOHDyFpDJgNeVO17N4YErBzFZbupPDnt0Ff24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVvYh3OwOo1L9pMzBeTw7oK6zZFIqcnPXuHptAkP2UcUAfV+r3C/Xri81NV6BC1fZcKL8JCTtMwd4jxiYjjPQELeMtXNtTCrpx7H/ny+9SJY105E5OVLXMWjrG46wZ5FmJGNsF//0ERaatpnnkTk22MGGStkFQ4MZjkxf/GLFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0WCVjDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcu0UswG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0WCVjDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcu0UswG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376KiVh493201
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=; b=G0WCVjDUAL1pV+8k
	VG85v2CD80fqCz0bNic7LL2/Il0Kd0hyyElJoEqG9Pacvcd/hKsBuLqjNLMTJhLm
	QZHRt96lBTeBERmtSP+oMIjKOXepDH4bMUhZTnQI+GWZtKxWF43MMmx0AIzBcnQE
	qUgsFIWLeV0+9JniJJ2u+V9NYilQbP7O5NVDsgVjJ6mMlp7JIexY+2aPM/RpfuGH
	Hj4gglURXYoq51+IyDb3EXqmSmGKAA6jJkWmrrzifu6GnfC1DwNpV83LUsqahPYq
	ol1Ty4AZ8w8pkTh0rWPn7+Z6rk3jCPyuoKKyjiCtISyrOwC4TJh9fpm04MAu7GmK
	RhR6nQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t1hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2523e0299so122072415ad.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554311; x=1776159111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=dcu0UswGqdvQpn2exs9KPGH8Vs51AzcZmgXc5OkBtVQvB9ecckzIoDFZUyQ+6P16V/
         +J9Al+bkEUFmgj6t/rv4YHuXhzpH3Yt4c1s0aADPkrdeGXVJ/n7ScAoYOIkp83Ihf9L+
         rwJx+qmJq4aqxOaX4IBWDUue2kw867VkuUdO+qpe5uotGKB7d8NH54GzpZQbiiDu5Ugn
         jlw98UN4KUVnqGVX+OVOoDas0OrURyzu6DcmGjk0lk9CABDasqa9H8oCA6tZ9kV9J0C+
         vXhCqRDpQHrIaaVK7H2uxNp3SoP8cKxlO6x+NXfIYxX/g87Qr0I7bCb3co1Vy/HwKAeY
         lIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554311; x=1776159111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=M5B+icsW7fPzOSVlR1lw+UE+nEiGRUtHsjJSzXHhhaQ9CLHQbFGn8Rvu8vU0vtYUWf
         St/k7Zsej+aKZivXM5UwH9cmxQxPSMwUBl16JO8xeTTwA84CLVMaagkCAAhh4LArjoYz
         YHwMNIrXUU5MtjgJv3gPB3px7F2vAa71L2qkTGDSlkgGeVIF7KN4EbGz9DZb4nuBOm7+
         xUJqGN93XafhQKZPfrMTi+/cZQHkNAhpRsohHBO4KuTQqZ7uYmu6b14C7clZjiVLAT0G
         JUU7byM90gN1ZEjeqcnW5Sc2goFF2BpP4Xus2zRMTQ0fDxs0dM5tJkAdXOpTIGiok3zU
         UcgA==
X-Forwarded-Encrypted: i=1; AJvYcCV4cprxDWvEPYszHPOBE++D4K2mA7ZIzFWWGVCJmWLz45pNwuZY6XbuIXAivxS+Ve5VLdS+waV8WAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9i0JbLYViMUFmbmjVVitXiJHHHY9SdRtx1/M9aFF1kDhDDUbx
	hDrCoTk7Ev43GRih96r/V0fQEZJb/lLBl7MzPozzKJpK/ga2NSNtlSjnDAYfLJnnhLZJDYBuL0o
	ubPAAr5BG2wPxlznkpi1DkPQZPwpEgsegvykrSMxP1i7nQCSza6uqGUVjxhNbiwU=
X-Gm-Gg: AeBDievFfZxcKvw9cZ0KtuQHgzNQ14NA6bRCsMMYzg+dR4BfDbA4GwO3QMkE0lPTMG7
	8Wai8i4dgUECsXysEw6XTPM+LSEm9y49G/PNAQT38ZNsJl4fW7c7DPJVm0vds77YGSTBYgdtJfq
	a6AvivWEMhCMhw7FV+6C9tnz9Tzn7lP3C0Ba2oJ1fDeaSoaJhJ9S1xzvPvo+pOzDEpKGdUPb+iy
	3fR87NsNcQswYuwuUoU33klIplnhphyJR2cSrng3E3p4IMmNCpEUAvmiboZPlC/7tkVSTWRUJRx
	fcGqWHGfxhBltJu6p7s1g37RyoF+gOdTrbUWlKsYm+nmLPDuqIrpkOsOzBXwgv11SyIsVD9wycQ
	IGwKUSpCDdQk5svI/iIGDXD4/s6/OzMqAxzYz7ZFDDY3BYA==
X-Received: by 2002:a17:903:1984:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b281801499mr167754285ad.25.1775554310559;
        Tue, 07 Apr 2026 02:31:50 -0700 (PDT)
X-Received: by 2002:a17:903:1984:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b281801499mr167753945ad.25.1775554310009;
        Tue, 07 Apr 2026 02:31:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:54 +0530
Subject: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
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
X-Proofpoint-GUID: WeAYpIg8WgSd_I1kUy3VNQjfAooFogwb
X-Proofpoint-ORIG-GUID: WeAYpIg8WgSd_I1kUy3VNQjfAooFogwb
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4cf07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TmjMgu7cwLfWQ02JmboA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX60pLU91e0xpG
 Xz6+cFMyh4QHy5tcyIredqP+e03ynzlPshN3soU057zFL4gjcX9gmXXQNTy6r4jEQ6OwQBO2YlV
 ++TJWASB2adNC0KqfXo8AqOcwGiszvqDDu1YAKlGPLbuO6FcfNiDmoroOR8lxST19FltAgrllR3
 9k8Og+dPJiEIIIrq1XYhrAh0SxekaBKsHhI8vg3SSO/tOayiMoYgN5/6cTJU+FWxGze1LouWr5l
 CvzsNUeFsQvBJJbxoPm2Un6quVasmJx9wliQeqIdD4HjDjf6TcnA5qcPnj+eCbXZchOAKW/055b
 cNHfsoClPlEj/1tiCPTtV4uostbbqowoqxdwBzxMDoHZKmUQcyqZAkHF3WtVu82b9dB2y4qF6bA
 0Xph/PFrTLFe+0w2r8jpkjIhZxr4Ly6Ap8ksTQ8Q27TLO/K5hOU4E9jW2fSajQUzXafl4y5Wc1b
 5ONjb+KZQ/Nq1d7k1jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

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

