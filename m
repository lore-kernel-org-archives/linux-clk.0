Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C531ED8B
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575393; cv=none; b=NwdOYUGOfk5EuqOruXaGR9dkmqC9UBSz3G139X0jQg942wFp1mAPOlDYEIIhlEyowvFSub75eFmyhbcHewoeWFDNUFWVRfFX/xpRMGCsseZ5RQoU6lK+nEl8cRnQ8M4Dn4yrMBfd/LOUmcQ7D6+eQn4WhcDcANh2je+aYTy0ngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575393; c=relaxed/simple;
	bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQW+CGWDKfp9v3V1w/3h1OTCh2Dz4tpvZnKJGY+ZsYEzcQWKbEpJHzpaHATLLmUISt7xnbqVayIJobqU9yKyKaqCS6ov0RfG6Q4EQsSrMRu9ZzJISgiBjUQmvQ8dgpHj7wbQ4BmsvFxK969qsrtyKmjdTl2x0FvXrbe7eNyPra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmUftDGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhE6ei9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmUftDGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhE6ei9G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9Ga9Z1792509
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp
	9ie9xAzQ=; b=FmUftDGzUUPaZTt14QFfJqgHnbbj6oOuRZMj7MVTF2WK3jZiyy4
	71UVJDy4Jlz7Ov7KucB0+FpzLD25K2SeAEImj8lWbBGSUSeq5+H8Nq3oy74sqm/S
	bJusd0qZZ0DvKYMY9sBmtB+LSxQayPMToMuvRyIwh+xJtaYf9SzE7zoG9DmGXml8
	0OEjZsv7d5dB2PYuVMAPIKuyanrrMwueAgwyCVcgCAzSkpcWmQex2afdNqGFs+Qv
	w/HOwKEowduYuERrWTh19vKpFdYntrvIp4in0vC4NxrKHmiNQ6SD6oCn7mwi9eFM
	7T01qBaiRUuf+GdGAqAdOfY7Im6UQ/QK7IA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cucp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d2aa793fso149145251cf.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575385; x=1767180185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=IhE6ei9GT3P04o+zUEKRCUYmVd2v3Djc9hOM3/p86CsV1wwqz2YsEuTjfkfhP+6u9a
         Hck0+PK0nmjTn0akX+FmBvV4FxqZacJPVMUAdXE63peDzIKBslXwfhcmIeWXSDcgd8VA
         Fin0XlFtLCNM96H+HVZB2hkUCJKCUTNY0PuS1rcvWQApc/z6J4XhQe+Rt8BklpHWq7EZ
         rnLsKfo/SVSijnOL9ZTYz+NL/ERV1JObU9Ajk3qlra1cpwRIN4ekBOGVCovSnLc2TdrP
         Y/cffaW1elefVlk0XGSeIdT5WNiaBbyd7g9QetfZVtbtXnH8kCDn5F/rqFYHi1HpgtWI
         L8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575385; x=1767180185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=PGl4UDpYOnGtAYjxfrsXD7ZKnj4/zzDztUTwZ+uiVpzrOdR0erQ9ZFJyxjNPLqpXUc
         xSzbfwhpAXxZspcdm2S2ny8xjXft4+Ki36cHv65GRwY8oylfxxK6hXQN9FdSlvAJbjLu
         bcRjWDJTCUwW2lzEV/UHHZppufZXVoWM0rv7qWEexiu2DYn/p+h0vp3NwGnYaLPdBfUe
         37EoVBdkexLpSMElfzj0GerbpPE8LlupTejX/WWFs+br9yg3AWY1xkH/pKXJPNdGZeez
         GBRNNIJgYoVYj7P9/6o9jGCKVYLkWplG6sg28VTHUDmcCawlMrjQyaL+E+Zw1NEN4paC
         eRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWJqU7mZJHFUVaS20IHEVGJl+4AvPsAfK65Ad3upCSk/NtTVAvhcVqADI3+92AvxUrwsu79MXW8n8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68hb5OgwkR18di0Uov7hGj2jLN+osILmGL8dkE4pypCvVPxwN
	i+O97Ig2WcFebpo6SUEzTRqN6Oj+nUSZEx6TcoRGprmy85dMxxhLvIn1DAARYZwep5LTUFbfbO5
	RWEoMje4AM0OcLsT0Vv0pN8lrZGcwFR8aKeDP5FDhpJVI4XCuP1bripTcd+xzrzA=
X-Gm-Gg: AY/fxX66IeN5+8pMsYwJxNrfySSoSwqRSNyyLJJihMAtlGhr0M2uVB9PU3ekn5UC/bV
	pqUz/LFKPQ0HOOkGO/jQHe8tEm98OKJ0tEQkcMjmH0sMNoROeKkYA+nunsF+F6xy0Ewjrq996UG
	rzgdrs/EZKmDJiK+FNuA4E1RZ6eYcHO6ZEEmJNI1oGnXlrixl6/eNu/UtxILuwcobBZRDi10rlE
	kwuSDSDgSr6H6ZrUhJuB0x1WkaEs6XsFgNsmzq6H9I/Z4dfsBZnaInDEhhQeAapYNLa/kqTQHtB
	Kp6atqKYhjesuC9uRWcbkMAAHaxsd6gXdnlvMsKiQ+kup2PPOKn6m4edCkQjeeWU3JXpfMnKus1
	c+2B1rHK6RQsbZ318hexHmpUBBR5DfpF3spYZrifPkOCRlNEKk0E6kb+UwxjG9iENLE61JQ==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045441cf.56.1766575384922;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELeq6AHWkZvQTJUxbSXF13F6qpL5K/huUFrxvWFbhaAGm3AhlXEbdbvVOtB68sRTEW+yL+pA==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045151cf.56.1766575384487;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array initializer
Date: Wed, 24 Dec 2025 12:22:58 +0100
Message-ID: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80RA/NEfksD+AcDKiE4nnSKYnZrjTi1IJxzz
 HFC21yhUROJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEQAKCRDBN2bmhouD
 11fSD/0ahVEkVIblIKo/HWJohvDv+/qaEUKSr522WjDaQGFoiNfDo04QHmVPOm3VC9lTAK6oIuF
 SvSSLB+N5rvWoBOgMTpYG/96BzT3i+M6OumFHG9A7vwjc57xBPfziHJRxbD9T4C4ijdCGGFdnpH
 WvQ2fPPaME/Y1VC19xUCVs4G6tWZK4G6Y+3G/ZpwUNLtEglzjKFUzC1xWlokI1b55r1hsT8JBjX
 THZ81Oa7WO1mE6AFyPEBt1PK+Ip1u7Oys5ouPUZvVt6KiOE5Gm7TqTHaKF5Rb6umyhw8F0RzXVT
 +l6hpMRSny0QvPLUfxQhlx6po1IOpSynFvThJ0vgCzWZpFwTqiLLaM6aw70JskOusZODc4rOlBZ
 fMz7jpsgBWwiWg6xts66CfqVTeKMtLT4+Vh8R9xe3qbu/OoafU2TbuuWAhsq1MwbLD0QmUIfYZx
 z27GtKEVvvz0aD0OZYMFAoxle57g+ucvibHXrh7BFryHY7aEUbBiwh+3TXWudbYlXMhvk1f1Sib
 yenVCcfGnJVYWF3oBWrMnSNjWLvNuVu5J8wwzlrm04XE0r5+065PK3rETvisWkI4qZ4gi+yBIk3
 xp+72jH4yEKWcHhEreSh9mqe60t7PBuStsQz9MBa0mtT+JRLNyTwAF5lFDe/1pHiUo5ehTJaz9W G4m7NZOSwXikdRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XDyYE8pUn8FA5KZ9HSA17gCsbewYlljJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX+eoV4qo9P4gb
 2MCIe/tkb/ywnqIWNoKHm0w7OKF5whTCTkscDMda/Dw3lHz4cRJlwMYhaVf5wWLc7ucZNvLXh7Q
 r3bywJqeagf1ulVTZXUNdcYJ7SOVXnNjxSIB1gYjqmpMJdTiX4S1pVVklj/4UdSVvLjwlzwHAAt
 voH0JtjvpvqWft600ogq9A7CM9lH0+6naQ6q1knvJRZTiGCAm+/bk4rdLW5xhuEe709NsG/evWT
 i4sQyaBQImcZTiY47Cxt0qnlajlTWDQJuSE74RJiggEk0+sa1jUt3TKaHWnpsxmyry23TL7+AzV
 J24ggTJqFJGrdLjwIiM/IjayrIlHfUvGsqdFV8kvI2dzOY68q83IRZD0kR3xUA5t0Vp3Iig+lCm
 Ij69W8U1F6izjlpDMNUAqcoPIndId6Ke1nbK0GxRUFbbTZY//SdKDHGOUzel6c4ERpekYWlW5/k
 UeJYlrRGod2jRhtXk6g==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bcd19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Oyzp-MmrXw3c9cDLh70A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XDyYE8pUn8FA5KZ9HSA17gCsbewYlljJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
initialized, as reported by W=1 clang warning:

  gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Does anyone even build this code before sending it to upstream?
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 182b152df14c..b9743284927d 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3380,7 +3380,6 @@ static struct clk_regmap *gcc_kaanapali_clocks[] = {
 	[GCC_QMIP_VIDEO_CV_CPU_AHB_CLK] = &gcc_qmip_video_cv_cpu_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_CVP_AHB_CLK] = &gcc_qmip_video_cvp_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
-	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
 };
 
 static struct gdsc *gcc_kaanapali_gdscs[] = {
-- 
2.51.0

