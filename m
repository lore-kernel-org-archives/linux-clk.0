Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E2481AB5
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848711; cv=none; b=FkKtG69m3VFAvKvae7Vbe4LK49+EXCMoYUd4ywunCsF+HVHcWcc4zvJtm/TTspzYCCdDEJnDah2ZPjlJ6VR7BASb1LMaqdWS6XfvhFenUmaZAIc81wdDVKb639mR82HYlDYO3FKZuDpW68R6Wbb4m2ZkIi/3OFcMgmumKDdXeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848711; c=relaxed/simple;
	bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNotinGC8AYaYJRdhjM0CB3fEWp7EH23HHgjZqAtLtGSok8Jl81Gb4YTP5d0BFufP/MA+kjQ8e5oH/lXqCd0iA6y+q/w0Gn4A5yaY/qF65bppfUQ+/c+3mqNcaW5RJ1VsweunJPgbWvrM89TODXaXbkUpYdKfr0HRKBFJaNb4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4Q5j3AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apANsr9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4Q5j3AK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apANsr9N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc9OG3941736
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=l4Q5j3AKKRZ2xjcb
	DdI/bb1qo09wy4ufoGY1y6PsHuZqDmmfvh+rrDEazraVOzLzKatEzaLg5vX6+5Bm
	1L5+wbuOcd/Cx2Cs/Y66hrVLD8E4EipNFo1wnedrIwC6p3gLEN0sDIzfw3sHDsoV
	g+qdMSK53JvglVdmaiAlTMRNVoZOXZURZkYopgtqEuQHET3B1RvpyZOULKEkFQN3
	0ioRtQZ80jy/NIwJ1waivcsfuu/pFLCgkHK4rvmKGomz+AzM7ONKoT27Bp8BI17f
	B+vMGjzjsHOGcNgfVwmITtvXKMcLgNwXosQl3G762Z1ar1/z4mU68VyAw/W6/RTb
	HtrtqQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etv8kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:28 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so122879a34.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848708; x=1788453508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=apANsr9NvJb7GqYxDC1KXR9CRtHeSQUFUDAHuQJoNcn4L0SvOumTtsaswMUkpgA1qE
         LQ4b7+8kYQrMfEfqSdRFT+V4966liPvMF2VIobVRK5ARN5yWJNp4r68JloWHUqYlyuMc
         pnjRDC6/fHu3nsArI1fFKSAE2r8d4VT73OMVg5f1aHJI5pjOTsCiQJhIyAsJoTWzxtp4
         ETAo4NeoPiFwvj1ilwtrn06yvv9rq772iQB3lP/mpmT+nij1i80cTbJpSOiwxoDnBxsH
         rOFn2d7dLQX6t0M7qbqZqXLQPQCUN1qZ93nrXNK2SwpttKF4S0/6sR0W9SzJbyDT1a7i
         BxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848708; x=1788453508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=p2zy4IV3PtnFo37J8EwVn0mb230CMcZpFROGP0MasJA3Hcv+LqjVC2gDudhP7Dq5oc
         h+a1yqS5JWy78GRV4jMjEjPNaNp2lHFoSPIKqGC2NPqis3E9Ol6evcu2hYlrfh1l3A9e
         En7bI+YkhPI57CCiWjJlG/s8y0VSIoInyBNQZum1rTmGwmHrJkmxyGhM8h+wy78dQsk6
         8ypae/yEzu7hcMImcblHyVWemgsmS39WUUM7lhgqnXZHzKKkg0IzAoVxIA7lqAFXMRjB
         iiFssk3zsR+NAQIHIppc7TI5o9O4jBxFP7z/y+25UW6bq3GXVNFaArSjrV+TQ03UyphD
         Gpew==
X-Forwarded-Encrypted: i=1; AHgh+RpEu5HtvfC+7OlZJQIq7NW65Cki76yuVX0rFpA+ZH2eqYXA+Tppajt7s+XBtdEpaTlmiIanGiDSd5s=@vger.kernel.org
X-Gm-Message-State: AFuF++nBcwi8E8FKe/wpC7tVd3oxZeldKAEFb9PrKrZF/wnhG2SujFJU
	7Y/3fAh2qy4Miou6BnQmMZzwjGQNBIYvFhwTZG+RDBxC/81MSB3lJEX8OO79WkARiRSuVo9/UN+
	pAhily/sONCbZcZa02qWfvb+fIdAuGKaN/MDQrqqYKttq49wZfvn+dimH/cpQTXc=
X-Gm-Gg: AR+sD1206//suFz+slnazsJrt9ml2x0RW6acFnkuZe98UYVUbeRrVCwLol6EPXBrHNu
	1jBn8pxFTafg4qWfg/ShAx3iPBaaC1W01WbZIzcKpiUhpgaE83sK57WAEuRPyoXuZxnBS0M7OGs
	UkqYPseuxmOeaQ6vpVpX/shbx+WppWPAhUBAGVJzDdDyXJ14/SaieSc7BwY6aNzMwyW4HtwwoEf
	92AiCvsNw1pA4xcA8+ygK8fONKVuK3VXyL089ln7zjo85wZkjJd+d76jx0fiDJQX5C3emD7LI0c
	M9ekAgZ52YZAuz9BD7hS+Y05ZhuqGOHPjqorJtrSVl8MMGDGpllyeY7fZPis6Y9vkSubwOLYeDd
	kE3prfXYg7/RzkbdwFHHxFWx1zVijP06llLdS7q9WWoE1/6ro5fYlRcaOVJG6pGsF/HKVzcHe4W
	7nufdA59pl0PZU9Rx3rK+qguI=
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513245eaf.17.1787848708192;
        Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513200eaf.17.1787848707822;
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:02 +0530
Subject: [PATCH v4 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-1-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1026;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
 b=PITaWUSVe1ILdfSWnJT7MDHlrRiMajI8441g+W+TvDdCSITcQR5NuAOzL9/YNAEalt5NJrhL7
 ymArXsolShrDh6ElsdGabQEGbJvPnBuA2O1CruX3+oBz/ThJIsJCF8t
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a906804 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I-wlBW6BsxmxmlAWD-0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: 6Rwiza4WkXtWp88osgCvCtlU8OOm1Z0l
X-Proofpoint-GUID: 6Rwiza4WkXtWp88osgCvCtlU8OOm1Z0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX45rSSD4/+XbD
 m7bZa5x3bQR+/oG+63/EDEmex7sC6IQuOiGik+nSdwum7Q2SFhWx56iKsEu15mCb7ybDdS/q14e
 14WvyXjS0gV2TuJwBy/9ncr2/tet0qBC6LhmeV5+zjnyJZIPzG5fvisL3tAMzhIcBUPDmP6kRGj
 of13OtGjaIvHNjPBDRWYNJV3XLqrMBSF8fHx7liQMw4sXlkAqjVIIH7EpkhD6TgOVMv2MUZafPN
 HYUyLG3Q5UYOXA+M8/gLJVemHw2prd0CG6/aUIHYAn8VarmCuVDjuB2Se8qKgFWJ/hRKj/3Bwu8
 CKIshiiT/R+VZ9XJeRhbIDKVcJDftb+BZjItEffx2/9M2D2fTRYzJvBLtWjrkFXUybaDweDeP6V
 kftMg1dOJUDOCYXm6Mxv1CzlM+np6XPxuRX/XyfmHNTXzqRPNi+BnbZIQV0/IeSOQUskvIRvngN
 OJp7MpDM3ct8Xq/4w0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX74oEFjxoSGxY
 KrpcyEy8SXeNEApa4vmE0p0KqfOU1oaHXWhyqtEqHSLUojxdqnNYwrHSKvomLdVUaQUYVG4Se4K
 ATV8RJxsPmrZnGw82sddETzpJjuchiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270140

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..9f703261d7ac 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

