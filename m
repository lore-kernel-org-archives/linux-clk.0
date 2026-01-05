Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C53168E7
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609601; cv=none; b=cG0Y5TPRKqaWsFngwd0tsA0ypLWemwnY5T4vrb9Qs1SofqPAKRYKm2i3TZrxmYmF4+f2555BYmJqGDPUF4Z3pDZHU1ZnrN9AraDZuhQFhnGewERrU6pmH3iE4BM0aOeWbxIf+rQ49iVHcclV1fbrXMfl18dbtKBWOp0crU1OoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609601; c=relaxed/simple;
	bh=iYABdkIGzyGoYhfLH9V0tmKXDo499up2rJn5D6C5Njo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IDd9YM4j8eBsYWMW1AxichQmd5ww3SFcgf8unWPzi3WwOgMlfT8FRrlHZQFdVc4MufkS7i7paIq93B+2qNn6hiEcx0u2wNQTYzHES9KKLpj/zAe2G5IJdoNQSRGvtwUO8LBA7c3+EXyGh8lm4Pgd3VrI1WRZwRLr07MZVuXyg6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4w95ArU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z05SunUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4w95ArU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z05SunUy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6054Zvsj1814924
	for <linux-clk@vger.kernel.org>; Mon, 5 Jan 2026 10:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W6OEsqhTURLyjbRdZA3xDi
	nJ+/ccBBlqgXNuogfrel0=; b=E4w95ArU12W0tf50x4hzegSxtSr6bWCPNEkBn9
	5/2wxeL0qhn/Z45gukBZlqNhvHBxG8zGhG+swigIA1pNi73DpBdN/wAbr9VlR0Cb
	ZsIpCcnMeclHQa7Lw8+WSf6MJltx+r6zRlngrL2MLQ259Dsf/VGa1gxK4alZpl4z
	Wt57TSt0DSx9f9TnLWNAsrVm8oMkkdFcmxxtsCv0D5+mk9oqOxfFTbQTbPtzTMMa
	cgWanEoHBsvcn/wwlsE73k90mv+YNvGSl7HTu9YhLIHjalKtjiqHvUrIcCLF0Q3c
	xytWgSBtH5dK+qMRit8HqaqRQmT+XoC/VQZU52nfTFi8EUtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd45rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 10:39:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a4b748a0so330480185ad.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 02:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767609596; x=1768214396; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6OEsqhTURLyjbRdZA3xDinJ+/ccBBlqgXNuogfrel0=;
        b=Z05SunUyWxlmItTjJOM+vK8AHksCFD3dkGyz0cRFxxCHv1hzfwKNyAuWeuDTcQL58P
         yphlh73uPJXnp72odGRQzVvrTji/iHYXuDNOpsmdqDWICaIW9MrDk1roG/nIiT8DZFbl
         6zAw3QhQuzpAP2DC87JfOqkNZJeCsGmF2weO3Rm9xiCp7dfUu0zsOByXejRT30xnJGRp
         ltVpdRW0zgaErOdUOty6q7jy+Z1rWlVKRppXeDLOh5XVAL3LusEYHZJ1DNn1+SjSiKlZ
         8er5Cd1L8RbrBU/RyojfdEIuwJejGHW8WpsrF9Hp46AqjNbFJD2OKaqHnAsFna5MKskZ
         v9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609596; x=1768214396;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6OEsqhTURLyjbRdZA3xDinJ+/ccBBlqgXNuogfrel0=;
        b=tzd4AOUEQyQ6SEaoCkKgsRtLHXnLsOAGfAl9i7Hg7w7O0aI4sW1TFgonlHLxHa2n2D
         NWrHin8IgbMTY3CVLzeblbM0j+pum6D5J+VKUCiE5Jix8MsP/3fJCRldGIqferyfct4c
         jdOzJe4kVMudIqtreJ0kUG6kfo/7DX++4Xy5/XVVU8pLr1tIQu5TW0IWHKcm4I6ws55q
         uyPVD/x32Z/GxMax6kuR6AcXaZxG7FS2yewx/LJ04mNmluhlwRRCei+W9TDGcaEFt6m6
         uK6qxCAAa4nttfvqekw4hnk86sb0mrtIIjTcW3d2rd2Cx/6j+ILsz2gjwjPVGwBq+NUB
         baQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9r1MW7nklPZFjRhiMp1CXlhwT6t8oCfMyyZT+RxDDrF8wjNmZnG/P8wpIwscs6mxWhgdCen9Th0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Urkn+NekGFFAVQvTDGK74INBtPT60C45hDer4eSojh6VVzoR
	+GVih4drWCzDWx6aY99soWX5rrPuikXGisfjxW3sY5P55wnKTFIfm/wur4ypYRQDfeP4YEvTBzN
	4HjY4AUlyVxQqpWuv7DMMsyFl9WylyyrJKZ5wQEkuF9x7WfewVJctnbjEc4TLZaAeaGl03Eg=
X-Gm-Gg: AY/fxX5iPe5ej4eBCprzqVmYC6+ohWNMyDdxsEqFuIiyeMrr2Cfvt1PTETLas02BTC0
	IbbcmPar/uSPOsE9JXMfGIaWTVJfU1YIOvLQH93cLnebWPo1KC0oQLQdmsK5EMzc+6EfhM2xrxQ
	tW0NzfDkRz8HValkELzn8N5fbcDQuT1W5IerFBPZnz5hYd/UQUMXDZeI5GE4aq3EKEiMFLQqiMa
	R4DvTnlNDTRglaXhiEKuHf2tiZKFcPoagD+6utgo9EwYex18YPVEGbcfNHJKe5p604cqzuCtjIa
	DNZwU9JJ1Lhad2d7V3kIPKrm8OQEw9Zo53LbA7cOddgaUx0plWSezCFFXDb3WKdDGWfW0XrPjyY
	DHg05RaACaS2PSt5rE4sNdPX2B+EL6iGSHw==
X-Received: by 2002:a17:903:3b86:b0:2a0:8966:7c9a with SMTP id d9443c01a7336-2a2f2c5e17cmr413761145ad.58.1767609595924;
        Mon, 05 Jan 2026 02:39:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVjiLiSTCrOoXEpqBatBcTb1pPd1TrPv0DrgncFboyYAicxqqtYDHs5+4LkaH5FuCgC7JmXQ==
X-Received: by 2002:a17:903:3b86:b0:2a0:8966:7c9a with SMTP id d9443c01a7336-2a2f2c5e17cmr413760935ad.58.1767609595488;
        Mon, 05 Jan 2026 02:39:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7111fsm440496075ad.85.2026.01.05.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:39:55 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 16:09:50 +0530
Subject: [PATCH v2] clk: qcom: rcg2: compute 2d using duty fraction
 directly
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-duty_cycle_precision-v2-1-d1d466a6330a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPWUW2kC/4WNXQqDMBCEryL73IhZaq196j2KSH7WGlDTJhoaJ
 Hdv6gX6MvDNMDM7eHKGPNyKHRwF441dMuCpADWK5UnM6MyAFdYcEZne1tirqCbqX47UUWBNe6n
 PKAUpISFXczKYzzH76DKPxq/WxeMl8J/7ZzBwxpmstLhSO2ghm7v1vnxvYlJ2nsss0KWUvleaL
 Ka/AAAA
X-Change-ID: 20251222-duty_cycle_precision-796542baecab
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: WF7bvMTn026QwNUz0T188QqNdUQ-8h-u
X-Proofpoint-GUID: WF7bvMTn026QwNUz0T188QqNdUQ-8h-u
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695b94fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=igsz0PQQFTjIY3ArcIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5MyBTYWx0ZWRfX26FVGSwEPvfS
 Q8QJ/VLl6oF3TFWla/8g/Ck+7uDU2/FLHXlHwZp/tWS3sLNwO5AVAyE+k3MZwmD8RCUqdBz+Azb
 44CfUv0mBl87ueUW2p5Y9Fo/tumiyMmq7UoFL2WdvlGQzouFFcQC3fQ9LhEzBH4c5SupTeBcQqO
 BWu6E6Yp3TgZbIN8hBhMLU3caSclClQrQERotpeDZCbRlke151bNorhUqAOiDvduiE9GSFjlLKB
 edua9SH1rS5uagv6RvoeKbEeZ7YR90DkJ3p/BB+DxPd5d0hvimvkfzAiBsQsowGnGa/RrrCogby
 QmYOd1Kglp5ucLCf2T8keaSXhHO5q4lvvFkR8utafAlEbeszj6zfLO9S+Hj5N3OZfs3ho/QsbDE
 bTHCgawIn26pJHHYyHRngoxZDz5qFZHp8VMSLj3+VZBPNLUrn3eF62HMIT7xGZqT+0ZCKn7jWD2
 1avGj3OwaTW9pzlOKHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050093

The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
derives an intermediate percentage `duty_per = (num * 100) / den` and
then computes:

    d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);

This introduces integer truncation at the percentage step (division by
`den`) and a redundant scaling by 100, which can reduce precision for
large `den` and skew the final rounding.

Compute `2d` directly from the duty fraction to preserve precision and
avoid the unnecessary scaling:

    d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);

This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
a single, final rounded division, improving accuracy especially for small
duty cycles or large denominators. It also removes the unused `duty_per`
variable, simplifying the code.

There is no functional changes beyond improved numerical accuracy.

Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- Update the author email to use OSS.
- Link to v1: https://lore.kernel.org/r/20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com
---
 drivers/clk/qcom/clk-rcg2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
+	u32 notn_m, n, m, d, not2d, mask, cfg;
 	int ret;
 
 	/* Duty-cycle cannot be modified for non-MND RCGs */
@@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 
 	n = (~(notn_m) + m) & mask;
 
-	duty_per = (duty->num * 100) / duty->den;
-
 	/* Calculate 2d value */
-	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
+	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
 
 	/*
 	 * Check bit widths of 2d. If D is too big reduce duty cycle.

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-duty_cycle_precision-796542baecab

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

