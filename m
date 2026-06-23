Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465A3D47C5
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215812; cv=none; b=oVyxGbEDIsvkO09mi9tsn4WdOXJX7+ln3QJ4lKDue43XY3Lpc+VTS8D9L/XOmPE14qfaSBTEhc48ycmsm84C9YvWEp8Oexh8B/7JzMBY/EiaO7b/fLLl/0emytNvYmd3mnjps5yV7K24nJZeQGcth45FqpFnuY6mztPObrB+yXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215812; c=relaxed/simple;
	bh=3wvmw63CMGaQoxKMqe+zRUeptA1VJy/N8n/iY8MTMTo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HeDXWm1izondOYq0qve2Dobr3ifkGSARILshkLTj5GOGTY/9jxlhK7bBJ2Ww26c5xiZhBHhehZk8ALQ6UM+A4684pJ2QxAatATZ5jgksWwOthkETYFq4sHY5fXDw0ABTKQVSC6PMQmN+Q8eT/DS3d0P5YmKcq8yQs4pLKUey0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bO/WhQWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYhRxKpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bO/WhQWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYhRxKpe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXsaC3753699
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3B
	c2qnOxKk=; b=bO/WhQWE48U0+yX7LS9fOdeVUvTGCh56FrjjdATHLS8tBUXsRRu
	smnn3ePjTaVvTcTTbbenLFYYCxcxKLp1rNfQhc5DjaxKRQ/iLuu4j0Be2HijNzHz
	RwFiEazKivlDOhESfQAE8hwNKyUqqSRF1FszPhcFriStCrEXQ5fQM1TKGi+lRrJR
	vonycz/BIdCHzgSBveqGXwIN49sBzaIzVFq/kMZD9JiBbM7evfrj31waQKDJ/qkd
	vsnBM8928shyBqJO/0U5q2qlh41p0y4vJ8SSGnzuYVYUaWon0qdg8laiE3c8dXXX
	Fy3QA9I4zq+MhwnoURZdDeh/GlaaGdDMAeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h0en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:56:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915767b341eso533621285a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215809; x=1782820609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3Bc2qnOxKk=;
        b=RYhRxKpeWR9ktYkiF19Go0ieAwzRLI1a6/Ovf62nzywYahQU6khhSHgGKAhEWOh5gz
         AEc5FBk82af94rRBmTkgfNcduHY4yFL43AiJktOqsPa+yEl0VrwOWknu699I7aMiNcD6
         B7EJtShvHGR7lJIpBBF8gGrPHMbO3W2I/XREcdk/Xl2Hfu04gJuklos/ggn9tVaGMK22
         5E8YZcxXlplXxObDvpVE4U1SI0nBIKu1Zfq7gkxwjU3KpFNpDJq5tvQbf6CX//cIdyPx
         tYKFpBjEm+uPn/GkITN9jOAHwofyFvBqi8qionAZj1A5yrDM4vKrD6DwCKqvPdtxiVA7
         jwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215809; x=1782820609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3Bc2qnOxKk=;
        b=E8s+k1hEO+m2mM2mfS7n6ntumHTre5DaxKtrIJTW1kI7JE1mCysE1DcQgHOD47H4rf
         SFQEMYhI6AOmP2V1Qr/ATmP9z/ZlolnSAZStkEcMp63b/Yxz6iM3rb5sW7a59r84//zs
         rsNaKxq2r2WuAAGggcZ9vmcRisJT1x1cIqP+9LpuYiLPT8JJUHtfDXlCE0pXJEj/lWIq
         cV2C7Fux0I52DNItZZ0BSRi+da3jbKa+6I17fVSJ1yIm+S9564EMY1BCqBLODnhgTaob
         3VUixtDggiqW7Hml64sqAVtef1M/VhfsoaKYL1KgUmABV90pEzWnV+YuVCFmQCoJ5Ea0
         0hUA==
X-Forwarded-Encrypted: i=1; AFNElJ8zChhkuN+P1O2T33RTrhOCMDB8OYqabZJIZs9VyR89p8aDqWS4PnLXHcEFRSlNcz+7dCNuB9/Nan8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv04ZT81iU9noERYpNwrYOJli7hp33GRobOPQ7oWltz8ZFEX6B
	5B5/MzqV9YfRxcdvA+tUSDgE9Q203/JmwItxqQ837vqi+EcqF2EKbXQtmMPylEXxxNTk5W5OcEh
	dCW3QXVKfFAgbzn8WjGKu52upZnBRgoMm9WWU2LMT+L+OJu2etqY1g+WGFGxjCvY=
X-Gm-Gg: AfdE7clpeOh7D1rRN03nKMlzA7vQdj/yaMmioMKqZh/7NLOiQH4h68j4deqHEoMuuCa
	BM3XZArCLbMhvgITu26XzRLMbrAjNkHC9HvvwRPnStdxNvLvlZfWOJehH0GYGoR9MKAlHuJxrG8
	vVw08Efh9+hwerySCLjxJCZEheXn4g/3L7TU3olGhXKEM3/BVou2O4WurLR2KR52XIm/BVU/Ptx
	zSd7cdWXX5U0cIJpgmH9smxKplvJk2KkTson8xuAMysOk1/GkXHNFkceZrew/YXCC2Ypb2kLjgt
	d1hi61FA8H569JoRowxug8XU01kEnmBIz7WjjYdY2Ue2MDM0x1X2DbXaVl/kZUMC314D7/x8PeP
	KHih+bqywFCgmXFVPFqrckU3LajU=
X-Received: by 2002:a05:620a:2987:b0:915:956b:790b with SMTP id af79cd13be357-9208d0f90famr2703800185a.40.1782215809079;
        Tue, 23 Jun 2026 04:56:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:915:956b:790b with SMTP id af79cd13be357-9208d0f90famr2703795885a.40.1782215808489;
        Tue, 23 Jun 2026 04:56:48 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e3esm33561292f8f.8.2026.06.23.04.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:56:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
Date: Tue, 23 Jun 2026 13:56:45 +0200
Message-ID: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3wvmw63CMGaQoxKMqe+zRUeptA1VJy/N8n/iY8MTMTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOnR8+e1YL2BCdDR5ibKBOJrrX88tdwtIwWRpF
 Pzy/ht0eCSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajp0fAAKCRDBN2bmhouD
 1/5RD/9ZZr8VLzX6a2ksa6HXCOkLT1lX2rPSrlUuwM/KR8YPAc6qeRTydvGnY2Ig3SLd5CTVTbI
 DANVnGeKkwlUOLhTNIHo1z5SADiFiLVTbYJrYtEj+aHl6dGai2+e1ItXQiklWk3NhbcZDvLi8VQ
 Kjzf3156Oecpe3iEi8KOgmHJhHokDyWWKMDpRBddB3YXDjlqzq80/TLVeB+PuFGv3Z+8UqBAqjA
 Gg+Hpvst2Aoz2x2mxv9hLw+8EmwbZpshkkcJSn8U3j5HmDyKPF0rW5Ho0LUl6vz0BgjfpqFghoa
 aOGYbJ1aI6rl8ytcVAvmySMnTvahirKRLMIh8wv8yZlWwh8LZDbjfIj1+s0lw//WHSAl/r/OfLy
 3nd8ZDJKxyHzLvuRAaaV+nVMJ6u9WhP1uDWASIr13rCTTxaFjlSjvuaVss0CP3qMHDcu66lji8+
 yGQuIaFlok0DboJw4gOSG1de+vlxvDml5gGKWreyIphNPjzaGGDcxg91wdRlEQhCZFPeyMlOwUh
 SEbtq+bIFWkIePE/m8ddBDuCz6LR8ZHAMixghMyIBFu6Zy/u0JnCGL2aFx7CI/dtU56C03OFJCd
 7+Kf7/80tpd16ylWFr7qO7zYvsW2SZio+SekwMYJrAZcCgjtaXaozht8agu87sK3xt1MzTfMaWA 5OBjzJyODHUOuhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a7482 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w2b9Q_YtGAR4YTw20V0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Bpx5wlDoyzUSCdbVl_2Yjam6DHsbuq3S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX29f3YCEiznvp
 xSxEx0YKhVaog6oGNrf65mCRqS0N5hYCcdpz7Wd+SxFjbyyDxwOdqG5OOqlTRMr5G6OGdTAP6IZ
 Hhf7qX5uskBM986Gs/t4WmqnW39KS8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX/MUYDVoupDZx
 /XavuZDkCBd8bK5E5RnzBYVWwgnyD6NqyQQjYs99AMy/j0o+7pDlH2l9jHSobo8h+TUJyAq8BLv
 +cmnX9G+YsQcadQcfbSUhrXto1asXanoEw2xu9zA/V3YZmDK1OwwDpTTUOtwpq057CgGOzv1sZ0
 JHqJVgq7QbqT6BxV+0YrKxCcXoF80yabCvs44N2eAY7fqvYUdaZ895whFqlg1aqbjpug52v1JoB
 TTFd1VwKeOSZlIQc85B+bWToeN9uj7suK0Re21c9XFJ10mtZ5o7wNoneI8CVfA2LhZcHYF8bC0B
 AW/QHE672a1ko/cm2YuQt5hxMLH59GWk4eZZbP2AQGbJF5R9IiA/riaVi9zg5gtnsgdFkzgaPtA
 n7wUr2iy5nA7ABTM4++RsN1oT01SuQ==
X-Proofpoint-ORIG-GUID: Bpx5wlDoyzUSCdbVl_2Yjam6DHsbuq3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097

Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
Display Clock Controller is enabled and references parent clocks from
DSI PHYs, which causes clock reparenting issues during probe (init) and
warning on Eliza EVK:

  disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
  WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
  ...
    update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
    clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
    clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
    __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
    devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
    devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
    qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
    qcom_cc_probe (drivers/clk/qcom/common.c:445)
    disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
    platform_probe (drivers/base/platform.c:1432)

Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Previous approach:
https://lore.kernel.org/all/20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/clk/qcom/dispcc-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 479f26e0dde2..e31c24125274 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -757,7 +757,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_11,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_11),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.53.0

