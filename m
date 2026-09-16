Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76A4E80BA
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559180; cv=none; b=OHUuE/tEFRhASo9QKghprCOe7jfbNLoyZK+ELXwRensCsDJTbLJXkJqG9KE1cRs/ZOgypACTIlX/ukezZVR4sf4pnF+V89tg4AfxcY4X5KwFejxGyP08PIuG0E2jgbvUeZlKx5NUW25VEIKRdbIiogh3jyS9BfDnVHPzzBwaj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559180; c=relaxed/simple;
	bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hvKC13h6+2zFvfdbYftaawGGYgO5kNVVayqVMOLpI5nSc0ySvxNsr76zLOUSF3s7s/ZM4CswAQzCRUg/2xkhrQUdm0K8klkgXsMhvZY3+sKSJQnLu8jw/+w/nN9IFFgqJyYGHDXadg1TNAs0hsi79szwxL4bRkVB0o77Ix3Bedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5RUp+Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SElmUuhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5RUp+Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SElmUuhr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93C562658355
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VeiWxyRJnXNn5vuIQ2+Ltr
	kLyhTv6TcCPGxdOPAsIN0=; b=X5RUp+PjThE3fcRsrLTk8M0Fp4NUOA0brp+lQT
	h9W7VUrkg5mmeyccN5Vcro933mmT5SYuGQ9/mq5/gU5kh1LoucnW94+aHxj+4nk4
	CMVAAfqAMAk3oY/RA4UV6VsJbKzMJeLcqOAbc7/NYFGXjx/ivIJPJzRZwVXkuCfT
	92vNwBsJbV7whWuxaxOWArb2vDQZ2ViVqV56OuMvWgX8jA2VltcO1j7MiWO14O/L
	Dh0b8OT7OuEbCHnichDtCbE9+t6Rx3lwwNW6x3uOEXfjfABQXQjGLINBSvMh7p08
	iOALUioCTJzEyqPdIdxNiIFV1lCDSTcpejbJujcEYNeEswDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujkqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:46:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f1847fb9so672046385a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789559162; x=1790163962; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=SElmUuhrmgGcfBGrQIme5jNoc5ytWMyuKdv+zri+5/b3k0c3iCy04JDtPcRT2AG/SY
         T2rH36jH6GdQsnWx1DXXbD9jrxeH/XeM+f/tX13lJ19kJECITBgiOyduuKBZxGeEIkCL
         HJPmCDHZeDVFJtiAwI2xvlyZ6nMqRZKhfsNKB/JX+3EArjQgVQTtJixz3UM70jDrU+5Y
         i1hOvBcvLhAOu1+npYxU0nqMNJ7RbvOqOYh0JuUiN77jaAuzROIL02sz1OIesSBoXJ5/
         bPDONf7iW01HfljjeY5H8WATxSNuGnFrQFhtJqAEjv1XIxE2OT77pJSSx0KqL2P5trGe
         z1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559162; x=1790163962;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=JTIVObx7aPJso3kvzPZyOc/J5DHTkhXEbtbmruFRyfF9mRaH7rcOI5Dz8jNMwl/RXi
         ruc52omxIvmvjgcp5zwOoQuUh1DM0l7JmgUhgeYHWJb3MaMVrEQGlbyjvukQ+0MxOsf/
         bRaROHn4UgEjMmbw8rBdSXPe+33g9YyHk8sJvM4xLX3+vCsTmr9W+L4MFLw8s+LcwnK+
         nNakggsNIB79kj8wMozcMiCJog8wMnIEczJnRfycOI2nNRtOM0alIEc6wg7Cc83ocYn9
         zIe/RPWdR/I3pmgGdSlIql9OleWhsJaF8t4GmsPVXIwO/TS2tDmIzUox4B8GLUV8qLkl
         dpqw==
X-Forwarded-Encrypted: i=1; AKwUvBxkg+tBMICVtRVWgaHMwQMw6RTR65pxG9BRi2ZZ6f4lc/gB58B4oWE9+2GE4kcBWBo7Ek8/zhUnSsE=@vger.kernel.org
X-Gm-Message-State: AFuF++mUl+HZhbRy+ltyAt74+cQpXPGRC9ZdynNJL5Xh9xspG7Zihh+3
	SEU5y87k1V3O9vML5M/A+UyO7W3MNP0Gh2KlBlZrCLzgSCXSbD5eltRwRYV8/y3vfbLYafDcvOG
	K7TmGcgEkhKQp8u6Fg7S9LGZ1aW8XoJn9I6E1VSOIGXQfhBBiH4C0FRe4FNefDHg=
X-Gm-Gg: AYBFou1o00FSvLr46X2MiBUR5xg4ypCa58jOHMK4I3PkCQ3TMzpf6oC/ev5yMK/5HtJ
	yyAoSMdWm5/huDPT3EMl34YPM5+50xG9BWEBKEuWUtuoXsmjB2bm8oa0XCbzC3pgGoe7sFGCCKD
	UuLJEah11L3flvL8SrZ2lY/8U9SVzIIjfyzE5h1lLn5PcXoQm9vhuknf0DYxUaoaIvp3Z3N2XzD
	9LncRuXA/opJO/iFUbuPncVPXnfE876v+KdnzWZTmdk/O1SBJGRsG53c2KKv6QYQazzdkGsBzlS
	QvSwDAnjoEfSXbmgKWwkRurxnqZagmZVDjR62qDp2XbMVMGXUDZOWXW4OG1CCZ3cyOrNYjDUmTA
	7UDWGzzQ=
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382013585a.28.1789559162224;
        Wed, 16 Sep 2026 04:46:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382008185a.28.1789559161665;
        Wed, 16 Sep 2026 04:46:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e841f19f3sm75586605e9.15.2026.09.16.04.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:46:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:45:53 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCBqmoC/yXNQQrCMBCF4auUWTvQZhEbryIuksnEjppGM1WE0
 rsbdfnB438rKFdhhUO3QuWXqJS5Ydh1QJOfz4wSm8H0xvZusEi3Kz6oZMyZCLPm0TmLSd6YIvo
 pYElJeUHah0BjNC5ZD612r9xGv6fj6W99hgvT8s3Dtn0Ay478NIsAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoF2em/ve1us/dY9yadOl6+fxOd1jsRMWmJOR
 lvDRX0c9l+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqBdgAKCRAbX0TJAJUV
 Vv4wD/99jznWrJv19lZV3ouBRl1bG5it7f0Mlcb023yj71Kjl5Wg51mT23nV7W9LdvBiYm3JM3N
 HseoebR1mgJ4VTPqmytwOdrwgNYqazBS/vlfY0aiitCYHHxaD6FUD6G9KtXAPySMlJqlI4zPso6
 ifKY6EDoW4JBGAp525pJP1ewrJayZL9Jmh9gRy8a/y5qK0+9bO+k62EDOvpGe9SODxBmtpnMLgw
 9VSScPrlM1JLm7o3bXbuBwbzRzBZNkX652E60jMBTMcjApDw56limBpbIDz9ySq6AQNpd1LcHtZ
 iv9gRNadp0tD2ZpuQlpzv9YhduWH4oJKChQt8ClVmre4JbmATwKzVxQINsuNfU1mmSOSvqOmGpN
 wmZETjJLyaaYrpkA4GkF+2apPPfgy1D1z21fvC+9S2dlV5hfUjgZmH9HtDd2x9ILz+wfSm34zwf
 CesYLzwQVHgQvYEmBgCss2Nq2804jHqt91qNUqo96UNEROZ9cEY1cgr/3NhFp5f7FpwASmNEMbU
 ps+CaoXH9MFGgzFBCD01p/NSuZhlJz19WcFdKtwfHt3lw3x7rw8b2ncMWX4NthgUmOZwCeuYWYM
 ogHRU5OXgDiu6NTYrmDY9uTaD9i2lNgLUNl8tS2iZQswLk+Yri5WybdFddt0tXF/m6MXPLfl3s1
 zBC17096dbTbgrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfX1tNC2+wLi1hc
 HtFazkzvwqOva06NVhd3N3pzU4dA+ZZPdkoYH5GA5HXD7V9apbSdXCVSnffyHUTOJJR89Mz4NLH
 NofFsZ+1hs9sX3FaJ+0HPMNVW1h5U8zbAzncyZ5WtBoLW/0F7aGrWeZ9sCMGwbfopiCHIyZsTIW
 Vw8pd4qpsdURZ3FObMOLBeq06geqtMGbRNR9RPNdyYxVzEkoLE0PwFLEZBcsZnJuapev7miuGcW
 Uvbfk8DyxeSwgXUVgPSjLodhfq+BDsyxtYwpo+Wzw5n1xH1jcl4SIfSphsud3SPdNiIZvDtNPPq
 xQ+bXIZuHVWutDJham6UZnSXapar+qcTK/RnKBg4y7lQJ0oDuN5OqLpvaCyYj0p8feyMLzJL4Tj
 Zj17OtKa2ZFZaU6VcZNWzCcYozij+eH13LqF7lz9E5SOqT6XWt7UnmjmEqqboXWvHPZMWPCmjSa
 mc/jygjSMZ+CPKaKKJw==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa817b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=x-KfI9e3SCgyUP7ysD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfX2pFDufSDsydP
 9KhR9a6C9u61AASNn09ZEgfPkFhmXLDpaPt6ZD2EsY3xefUbmlFrxw+vsW8KZp9d2SvIrvlWT/2
 54OG+2SlHGTR3z7onr0hrbI4pPXRhlk=
X-Proofpoint-GUID: TrPYZ5HfeFnmHVaLaEPRYo0T6Gf7KbAO
X-Proofpoint-ORIG-GUID: TrPYZ5HfeFnmHVaLaEPRYo0T6Gf7KbAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160155

The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
rejects accesses to it and the clock cannot be enabled.

Correct both the enable and halt register offsets so the driver can
enable the branch and check its status.

Assisted-by: LLM
Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3426e3dde924..ef7bde361fc3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3133,9 +3133,9 @@ static struct clk_branch fd_core_uar_clk = {
 };
 
 static struct clk_branch fd_ahb_clk = {
-	.halt_reg = 0x3ba74,
+	.halt_reg = 0x3b74,
 	.clkr = {
-		.enable_reg = 0x3ba74,
+		.enable_reg = 0x3b74,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_ahb_clk",

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

