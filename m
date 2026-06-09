Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F174949F9
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019183; cv=none; b=JjKqhYaVF9BlQvt6PwWTlHjJa6stkALVQynNTDxaJwfaXDxGYrhOoDYzsq50MKsUFkSWfdbefy+Fw/1B1u3HtzudjMa6bhyY1YGAVnymzkPlANyD2D3M0BAWjYbtfPV0nSHmtw7FBm5ehc/BjAQiPPgvC5783onDHANJmsApPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019183; c=relaxed/simple;
	bh=TsASqrfqbK0Ps3uvYuUtqGTp6RdNEPy2IAP416/PQBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsYNyibGg4MjFNbilIKD+PmuwHhDdlL+otuynkI1mFyMvX2Ou30ZXfmwXTOe8aeL8aRpWvIz/GqOMueWnapu/WZp7znpbQnE1W3fYwNfETMAgH8hrQVbWaCIq0QDBxWG2EnIkYAW/0KBMfTdPHSNSdsR9LEPNBJJoTxDqdFJaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USq5plSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dli0CuOr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USq5plSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dli0CuOr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnJoX2668399
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=; b=USq5plSFL/AkikjM
	A+Dg3xKEjy77GqiTwyuM3icTtyNpiJfjysy3J+ZAGTv9P0bVZI9EjaSrYjf79TbN
	7e7PiNcqBL+aRzQ6q0f6iqxTkfdf4jUofs4yMv3vcTHLD9gm1202+yZKGZuwFpoM
	Kp0mAIgG03eZjJwtSFW6ZhTw5stXNn4kTZmnCduvxxYYBj7cLWcJkfdG3goHuasf
	MD/zxwjKdPP5jBanIk0n9T++H+XDVi3GLV0tA/9Qb+j0HuznRPf7EWmDQA+suK7w
	jELQZfGHv86epryj14rXwCx8PDDSoc5t48RtcEIe3+A+nUJbdk9ieu1aCrA8XDL8
	ytBQ+A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tb5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:33:01 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6f01486a0so10987417a34.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019181; x=1781623981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=Dli0CuOr7bR4lOZxwmL8LSdjTb9aOyaGs5+YyjBRpVfF2+U3Zkd+VjTBfL8kTNKyy5
         PJebv6Jxv1yToxPlgtKUIiwbgJ3WzETJGPUWCpsOmNUouDFxoMqc2jn6SmIhatAGOdk3
         8Ycy0OVvgqoCdjlykZzVXUYzOsBgs5rQYniD/AmYWAZRcp4G2u7vz6d/vPqc80c8Dru2
         h6rMQSM7D7m0L+peLqvqoO5Z15zWoEqT/jQ4uW9csQwsDAQtGYCz+Cihmvhr6dCo8eaV
         sF4ak6OvPVr+qAfki2SHnuGyBKZmUeuMqgxboRNRFup5Nx6ZpnwpvxXdgQ0cwu8YRBP/
         f1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019181; x=1781623981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=fu6rg4PHFSy3XyTqKo6J4HKPnalQegn9uR8tuOuDaJ0GrlgTLsYCAPJ5HlTkgoDmK5
         H1PvIhxg1rg9wS42/P7AmUDx8U9NIJdcDWDadlbSQ5ccLoNnr0UYHLxt527U3cueOGKe
         Q4OWed1amQ+Cfi5MEwyFLcDD0uOXLoUkRc124R1qI6vLRC3riMo+yjoLZRsqxyBGjNR5
         nedg1U2zpNprkqZsqK/ubUaB6XexWLhFWamdpyJqb2ihdfLTukLfx4542IOoQpVMAYxS
         GOmiftyIJTZ4mgT20HuWDP9pMhfkhoeUI+BBpox7dcT/t30wIjmNMqA2vvwPJvnDi3cP
         yRAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eQ/7+O2PIAXtJGIbcjpPPrQbcEIoFqKfHl/Vak/Kvj9FO1yZoCRMOeVIofafliue7HQX/jtFFS0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wYnWEbHgRQq8yU8ipXMHsIZm0hht6vHcyqRN9votQvLIJxf+
	pdgv8xMuKM0BSkoA2p/X4yyy5ZpNZ8piDEITSKli7aTAyI4U7n6ApKu4wdt1X+6Fhe9ZGq2EHvy
	t6OWf6+eezzbhXtDmyNdCF2U4M2wD+bGZjbeF1G/hHdG1kg0uDN3SdzPcsv3TI4E=
X-Gm-Gg: Acq92OEn9171HzTfz8d5LvvdBWQv6T2xoiP0k8Pdki7SmUdqsWTJWGV5K7KaFPItCN7
	53op6Pf3m4cKEpGa7ckX/aOzm0HmfWKY6antyk6GeIyA+VlUZJBlzGgLG/RlZdjN8/i2aWtNpkl
	T7HZ42oCUqTU5Ew6hR9jgcOve7Usdq8QcwU5AB09wgjuNrKZuCoDljfHe2CJDRPE7yLg97J6532
	2DV4Enkx1RvURkEionWl+JReR/N6ISnIffjJzEpkfcfkcS1nCp4H6JdsAslK7zqvhtM5qehLyoc
	ZIq5ZoQ+Gf+Vh8thsgCYFr7HTHQDrbUp90Go7m/+2MhYVns5J9xuav/SRF4XKAOiMX9o8wh7IDu
	8zIlKtbooCTdO94xytrMk8PKBdt2oWwmhBg9yd9d+0WHM+bjZYK5tyQc2
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2226001a34.2.1781019180962;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2225966a34.2.1781019180525;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:41 +0200
Subject: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TsASqrfqbK0Ps3uvYuUtqGTp6RdNEPy2IAP416/PQBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIbxw51CymIPshnJtl+jqcnyY1YLMgo1IVsQ
 z73JtMk7rOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGwAKCRDBN2bmhouD
 1x+RD/0bpM00k+so0N5oxtFjPrS7HNV5jtV44ex3SVyHoTMfdmLQ7+G1llSaeQc+pFydUAK1neI
 bbYUm0I2S4spbDPtWCMRQ0/+ZrsQ9vcSfpOweNwHaJLbnaXzcbQAqMD/0vZiSyMmFp1xImlUOFv
 QyenkWbloWNj3dV88vtGG09dF0+buRnrzs32ISiPnyHTaXGA0DqdvqfOjd4cOU9MTyXpK7wWSU8
 B9zDJZ4dDRLWxYyjIJB8nQAM22kkUpxprsEGf39YmbBzPVgrYWCXyEsr3FHw5T//MygKPof538t
 FeUD16G0KHGl9aiFLYXfd1YiI6+kq0Xyd2J5QuPbxzbhexI2Slor2t84rEqBkI2jRWZ04yFkMdr
 9/mrgCqWRxfdiWc9OFbc4xNPCGo8MBio14DkM7a+4TC/1U+c/29qt6ZNabB0FE4M2E8QMCvf71f
 G07oXUTq+npp8NThEpSfji0H1BOOFmqbUNudWu7SZc2Gu+sppYEmLUo0YNz8V0od2a1vx4aepDe
 ir6n0XspwYqNoc97rJdT3VPjuKMGWrpEUMklDte4BsQ11uA8zXxo3HlDLe7RL7TP/+osA5329RR
 vUifkOTrzccaTxO/E4wh+TkZmQT4WfugicEh/DXwDg0fuvXN2EHEJSnywHrm+w+QoGhgWIcn/2y
 1fTnGcK8aTeRD+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: BB9kgNwmRFtnrN5sRg17wd5oWscBOJ4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX41f77ph1Uh/U
 jn8hlablFbyQndcS4Sa2e2OzjEGRf6IA3NIHORQzzo9NJqgZzonJW8odbErGz1LrmbUugmfFZgs
 Ei/pJuCLEWXnwW9XCdB7s7Bfy8hhQLwr+Diy+xb9P2c5+BqaA1ey1OJKvAbJmkUiTTTNbdqr8Z9
 vonDbFbf5BAYqkslScJlHa4+FuH3T6FMO4oXHPW8DiQ1rRJQ3q1196g1E4AxOxUOa6GGQrCHoEY
 hYMLG/P5PMie070a8eiOTvWOTC2e/SwFYM63R5R+40l2Nccayq5yzDqyhSa0lPIF2BMxoYdE4cW
 teoWoepmckURUglUsHzNv7xeYhdubPHzKT1VF48As/eX4wyyQ0tIXMxOay7EpwuzH4WM6dea1fB
 Uqganmgz3rd/k95WBgCEnrF4rzyGQ1sdQtt/Y/CXLMEsD3/3UfxPa5ltGdnp51F14+0DqPbaw4y
 ytjCffWpY2kSVH2Y0BQ==
X-Proofpoint-GUID: BB9kgNwmRFtnrN5sRg17wd5oWscBOJ4I
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28322d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91c8e9435dd6..766915f8a050 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,13 +1458,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0

