Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CB3164C3
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575368; cv=none; b=OqH5zgRs/zT5bLoM3JkK8W/mx68gBaU11lI/Tfq0z72R9cwKFOfyajKS9pLX1Azr8/gZvjT0S6Xa7+Swlj320rwsfaA71AZFwtzngUakulQrYzjwCjOpNgDEpnaXVOzrkB+iaRLgnbarGEiyguPX1pRINKX62pwHia8uB9kTaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575368; c=relaxed/simple;
	bh=eSn/vrPVAqLMf1mV0uK3MSO7Bl5fYmwa8QbVWqjzQNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/hOA8xosiACJkDna1AARgcNc9nJpKNFYT+Zn/LHjt5YLP0GL637O5KNn2jFjeMkiE91GEhRiKcraRHeSjWKL/fzhl5gGFAL+dEkzguxroiQQnFyXIHdWleau4bsE6eqY7S9wgD20r4oR1scHMrXVkY/kBPBpvjES8ifPotE09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YePYMZ/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVTORfmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YePYMZ/J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVTORfmi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7AViS678609
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02s
	mGoT+36g=; b=YePYMZ/JOSPFk2ZIO94JsJgGsxkjxHxUuWKp0TFaN749LWeRXjc
	A7rc3kI4UlNqbw5DnwdUMKKvVUge5BJXe8zyKQIOHYtbogsuhHh4j3uYG14brEZw
	7pe5k9kmn0/Lf4ol+FK9IoviY60qcFQ4j90JZ2mkN7/KEMk6M4bX3+TEtzbyk4Tp
	9Drt4a9mDnNnvWjcvcPGZ6i8YWl2lQXzPalwarOEHbemABiTDFu8n65qBXHB7Vfy
	Fm3CKZ/h8Ln0EW/+lHWQh5MYwW1y0kscv3EK7phXhK5qtjBqOqA3yJU6j7FH7G1S
	CeJQsEarYBOvUicmtLfA5LJ7tv3H1VElY5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2fcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so158737441cf.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575366; x=1767180166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=LVTORfmiwo2R3Y3p2HDS8dkn0HFgNV+WWhQ1F/vY2AdfeR73wFJMvvmVvVGqYqGBNv
         +B2ux6WdWWgphloyWq5D2sU85don0pq3fNONUJ/1JcIy0mlu8EEkjcQIzOn/AtUIGnUB
         0s6M1/YVNjS4isH/7V8bobJg2oJf/UNtNXEFDfTZctOmllDY+Ay0Z/jZ2lPsnsmbaKXV
         IrEPKWYJQ9I0j+OpJ42Jyo3oT+aLnPJaye4qHb7M/xsqXuX75pvZpVSIqe66Wi419yYe
         STS6NSLEvIdXwx2hjbKHp0ZKp0A7UAw0CBTQH42hyCbxQrPuBG75OjcoDNGqtThcGx88
         wkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575366; x=1767180166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=NnUBUp0BWopeEmtHZK40fWrrwD41jxqDkPxX5tEulL2a2jZOO/xwA9uuYFGkSw5eGI
         QP6HLpFpyeNxmcDddrcgQrRV71S3Ke/qNOTjM9g722SeX2V7c1DMsaoQG+NIHtrJNFl/
         V8U95O8TvMBZr26IxwR1KfB/LcE3BC+TKhEf1Cq60Tlb/BG6lDMyN5G+Z+NMVkIqprJ+
         ZNfSM4SkAqA2Rcxpya0xJ72Rg/c0yOfp8OMYJo5k5sJhhmXM7H0AiBMiD4gpcD9aAfPf
         Iv5OvMaKFYsK2K482o5wqvHwkcTpgYHro8QG/b8FgEdUzMeoyyLEXPyFVhBnk1+pS3R/
         q7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWGinTC41SZmFO96lf51PVjvDoAs1ct+S8hpii1HCLcHoH7F8qwpyS2RcWORxmnE7kYPG8+x65yBLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlk5JPLew8GpMB8wE3n5JwBDjMVA3ajwZo80mAiDny+PNzz5k
	QxAbqng5YMLWvYuSOr7L3wlaFtrWsqYzW26Zm8YjM8iW9T7mO8KdbzaMuxoN283NZyJZzuHGFYi
	m3ytmbq7lHnil8RwpeErcq7Y4/8/tE7S3/wZfMt3R5NT+LMhGy1zcxDs5s6jfVSY=
X-Gm-Gg: AY/fxX7FlaiiJLNbzdrw9Uks0Matp2Ja22L6CefkmUhYvIWZ6vHCFoBlPS1CWwXy/uo
	zmywlWFJDW8WHFXDtCz4BDagcWPvw8JC34jcucEPcB7x2NoL9dEus0TtrKmeg+CcwOjRIQo1lkm
	uG7ZG99uab+odZF+6+rP6szTI++g2bz8GLROdzT+qehKO+yfzK+JoFtQDjT8V8QX46gQVzCeaBg
	O4Qncis1h2IbDRndU2m0PROAxWWdRD7V1onNcHC+WIzdZu/N9/fcrGkSIR1T29qXWlTUMgFtG76
	J2c+OigoZ9Z9rZAzhSim8CYWoOFTkOp1awHADqxzYzmDHXpyxtYNCYbpbSQdY58KDPvjte6CdFX
	AamjdUpmO42DfUCCe6/7gGqS1l0ubY2OJv1s52gEqDSBmVuibbo7mOs9OQy7gw0dKQcKFCw==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006711cf.30.1766575365777;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIEyJuzFxKiRo26Yf+z+QYqxvtMHQvuEuAVwz/3TiONO7aYne3WRyXt3VVXkH0ZPT1PxurgQ==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006421cf.30.1766575365333;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] clk: lmk04832: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:40 +0100
Message-ID: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=eSn/vrPVAqLMf1mV0uK3MSO7Bl5fYmwa8QbVWqjzQNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8z/zWNdvmw1CsJTUQVKXfpHncn4h8LFXYkal
 FiGiWnektWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvM/wAKCRDBN2bmhouD
 15aGD/9er+6080n1ivVaVbeXYztVbuBmdlFk04FD5W29D148S8a2VPReYd5iiL6SeJ+ujJrCtE0
 y1//W1akaUv+UqcCf4w/v93WfF8J7f5BAbW0sOtswGvVo9tPUvQWS6GCfTjimsydbLP1UJPvnzk
 qxIhkvGQHo79shSdec5gfonmEdoNjsCyzgsx37cjuJKVRJxjwJY26Pm5V8k6ndxbZpSEXJ3xWoD
 45I63qBY+ypRxSYsVFdaitgiMbUY8hB4I1FQ77To3W4JMg+DjpDSRyDhE8LtZ7jREwz6SBbQQ7d
 N1Z8Yh7VNzhK6+eMjOk4kiqJLW3jWkcHa0ehsVPSk3D7cPC2fBVnkrQHXbxiJKa5ofzeZc1GAx/
 O0Dz8XE6VYAfIEzpSB8p5JPhwV5lsd73uRgv4+dFVGHk9ILtV16yFBPwzgX3Vs5GQZ7UcTI2ctb
 WQInzqMhSWdOXtsTRRrvDBx2iuqIQO4iO7AWd3Uizu9bcc1AebT4aSoq75YhqMNGKmMA7lEFVLc
 0g5K+y0EaVgWzHfDFXyiZRdG7PVEH/dxHdI+KPufXva+WaiGwT1hWNWyLLXi1+m4yM+6s7sIpEy
 3NAzgTJygQsfrmzqMhf3f5hu8ekDXS1geJG9Y9tWahNhfn3RgaV+qhBjbYTgSZgc9zPdJrGuLh1 Y49fvpxM7EApjuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0lxejcKbLLeh-1g-IvffTf5Nu3I9ZPjk
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bcd06 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bDIXTv4lkq2VoA6JDjQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0lxejcKbLLeh-1g-IvffTf5Nu3I9ZPjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX7R8qkjK9SyAH
 U3+Cme9E6BNy0dAB96AEX/0y453XNdh0vRV4ohrmJUHpIzJj8u29HbQ3eenqjBBF1YcvWQ2J1I2
 bOFRS7kXwwhDZGLVWzjhGrdLo4hucmvQJ47e3BBNQjU6NIt9BHZ9Cxo9CizwMo7XziXEm0JyUoa
 bQVBoW8hfoimH0NcCP+4nIGuRF5buTQNIgRvg+TE17QBTMFhXb/lAcdZk6xPrpNQcJsuzkTjc9p
 yuayA+/lfsX12oQg1kkWQTU0z9rPOuoP2Uf3GH8wJI8Fyl36laAh7AU0M9a4bUjVVUMMUXckmMp
 ZULbFeLSDsRQk9cLNrryXMG59dXDLQShHTdpYv8SUFJREAKUHrE+ICcZua6KmA1EluucZZ7H2Vz
 W+TEIFhi5IpgyxmGlZU2cOVzXcAzxuHcZ/X2CjBx+Ct0jdbC9gpuYS2+Uba6PVUhpGDsk8aIVII
 aJxYVOLmNeCt9HJXZEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-lmk04832.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index b2107b31efa2..9bf86caad829 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1400,7 +1400,6 @@ static int lmk04832_probe(struct spi_device *spi)
 {
 	const struct lmk04832_device_info *info;
 	int rdbk_pin = RDBK_CLKIN_SEL1;
-	struct device_node *child;
 	struct lmk04832 *lmk;
 	u8 tmp[3];
 	int ret;
@@ -1462,14 +1461,13 @@ static int lmk04832_probe(struct spi_device *spi)
 	device_property_read_u32(lmk->dev, "ti,sysref-pulse-count",
 				 &lmk->sysref_pulse_cnt);
 
-	for_each_child_of_node(lmk->dev->of_node, child) {
+	for_each_child_of_node_scoped(lmk->dev->of_node, child) {
 		int reg;
 
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(lmk->dev, "missing reg property in child: %s\n",
 				child->full_name);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0

