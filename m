Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1793AB260
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260476; cv=none; b=Wo6vr4GHbPSMLYA1Oi50JcZFyannHaNnfH9QGqiVopp6GObME7h0n50eQPoI8z1DyVJTIPMk1le1jXXfWf1S67om3b7Z3JkcBBo/nBEDCXrPo2Ik6/M6PsuofddQoWGEt5vk9VM8YjZikNyMicmhFdjqIMTaJAe6bCrI0Hw3CLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260476; c=relaxed/simple;
	bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moIdJr7Bnlj+iuhryh6OIhM7iDZbe/OfAdpLmiMByk34mfiss0By4SCeQ9LZyoTTJ7Hf86Q1ygWzEHxksM6c6njRyYxZ1OQJqJeDGd3LoeQtsojKBni6rjtqfG8LsqHe6DsO/Suwa6AOATMZ/KkfrVnNkUySXUGqZBWD//JO95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQaAHxuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drJ+8Tzl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQaAHxuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drJ+8Tzl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795dCHJ1852645
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=; b=WQaAHxuSent2Jsyc
	u3xpRYhi8UdSOyk2E6gBPQiR4iOUOQr6zojvtxgJS197LWZXIfaVhNTuDeTvDHl6
	wzqrH8HRmZLsPUjBC4xdccOdFSgzU08ekkJdvfuIwkgWgDk91M5bjfwAtsmj0fAD
	k4+HqRvBcWsUzC5+TWAwI8uBTH/X31hewTEJxUoFuWgKK3iPUrZDdIRWwTCPcTE4
	Am/Ik20QWFLzsqtav+uI0kSxJvQBqhTMJzo13eFM4OB9dgm9xYh2v1zmWE5tNndG
	xqDTJhEi7cRxuB1hvchGmBasRIh/jKITLwEyanOX24gJluKVkbSN/cNDp+6BMPWa
	SITchw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush2j3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:27:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2002083a12.1
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260472; x=1786865272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=drJ+8Tzl2zoLEL+os2be8GEyv8qE6ZzGRtfGGVHyJ77fIPAGtcWFwZM2io8pAorLy9
         wN/+Gq0/u+a5m7sF0J6fqxpzQt5KGPVdNjg3zSX6EnbPnyPsmpYAm061ccctiq6+xH7v
         OnjzrcthBKLmmHls4AkSfJyEkGwvhc/KIdO4VivLJgAfiFW0jdxK5Ko3VrLE5nhvsTCR
         K1qANPBZu0ke9M9rJoH0kWQGzrXSjklC9deUDHEiOBjN6UxIhZr/52D/2r/iXfAOssVu
         K0fxjfFJdJf8JiTZHynlbohdNVxFNgTYZmP8rfokR/o9uX02XD+IHOXYpKO/IhqblNdt
         xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260472; x=1786865272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=irEjN7jDoC0rhFmR2fqQEXa3qG6NGBU3zuqgMGrGcGUR2ohb9gpqIZRFvoDBll3Lgf
         /QQgv28QSYRpDyy+AhlWwIakpCxPbNERkMWpqJHkpfQFDULIpQaHwwBqSn1YNTVjxjNl
         yrbBbmhzU4En5hwQb0aA1TTj4hBJ6Bhpr14493clS2w+jXmhleR10xM4niXsaumMvzKx
         7qvukgBa7Sgz4fj+mvG/qf1JciApLdi1IQYLza3JGxJLNCTDYk0p/0e9FBdTZenAZHlx
         01iuFmeUA53uy0BTSE0WzA4GQrQX+WuNXxqvJHTYB+wQeItotM/GwVAQ8OWr575Sl5zJ
         G24Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuItsceiVhrZMTIOhNrevwjw55eDdDBU3R/UdGpls9iVMYRctsn2yHW8+pVkzs0h5pwrLRKHYSQTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ClK1Wqaw7sogMQQ7T9mpXRyYHPaXIYZkNuiWEnhwQyAEJxbL
	0X+rVAfzdUGmtmeiAuMJEtplxoIEK0DlwMsMxjp0wcvxNWOOP3eHGQgk+kazChtKp/XNamq32Tu
	bpJmwQG5kMW0GhYMNPANWYYsbz77VegJCSRB9kyh89pljzZdB1f6p+bvDZcOmRlc=
X-Gm-Gg: AR+sD10Dupo1Iii+nZ0U9ty55EooEyPgnvP4ZAUMZKP2JHCEWkAykMtpM04dr/tN9Iz
	7QpHbg+tpXKdQK8Irtf4bWT4B/gVEEUCzOgMa5hLxqs7yn5I3n9IxrXc19UiI1igfIkhbVW/fbv
	ufptkgep1VhwjCpFSJ7oZ2iPF10Xm4+/hLAWtONhK5kJ3Le4G5/MCczpUx9oWgdAdPYB+5O8ybv
	MM5rIT7+MVe1kCwwApiBlwH2zOhL5nw28GHKUO2UpjcC3KLT96KTFFwHK3oyLojKjQ7ws8qGzhf
	iesJPwPBMuv7KIb0QkIwWrsqsyF0Hc2SYyEGyUDekYV9Pi2t5sWPuBnpYmHerKuQsUFjGrLhBaF
	XGvXrG8pV8upzxe8QuDitxQ34b1Am7o68WPvFXxTnSLgMdjDKglr8EyMOeKrdtEo1usWD8fumsB
	peCSFz4AsW3ZxvhiBN6LyuS+s=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623814637.23.1786260472489;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623755637.23.1786260472066;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:03 +0530
Subject: [PATCH 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-4-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=862;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
 b=qhU7O99SDlfFR8Z6z4Kf6lk//kHxeS5D+db7xUfMIC/OxSBf8i8E3N52EXWsiRBWNVQrND6cW
 vhQd68Gdn9PCZzv27ywcqXlAqhuAQfcYZG3McnmiuRemmqvrYz7QiIc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: K8nga27shMy1Pm6W9Ef3BMCcvLPCYS4O
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a782bf9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jfL2y6gmHgFrDZrSC00A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: K8nga27shMy1Pm6W9Ef3BMCcvLPCYS4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXxGwBuNFEbo4C
 DQAySCyMKcYf6WC6YRYD2jEhqJBpwW6ZXq/l2mwKrihYtTPb9mvpX2pmS5ZWRr13OocuDKcJWHP
 Itt0/KnKM+VYx+hSP+fxyxkumhywAS+GMBnY7e4+lB/HyGI2WyQ0wwh0R5JCQfAwXayYfL3U9wc
 NJlE1Q0D7J00jDYf2ftfH4O3i42ZDqAVE3yaz3iIY8BwLmBeQl4ST62C4v5tTHlVBKeal1YSYBO
 72hubrS88j8b6F5P4vow3BBABJAC1vW+CLynM84w5mmF22jY1ABJxI1+esLu5R/A0Ji/SQCKUSq
 ts3YU6Cc2s8TtKkKmlO6nKiDTAQEB4Yu6j5FfJOAMUhBfFFML7NJjRt62UfuD3xKt0WhLqV6dBt
 ZbpM0pLWLy+0JZvlwjF4UmUQGzL2tAMFitA0mqnctE/S3+IDTaawdMKkLFSvcwmcGgf2/pvmY99
 6HTJJg0SC57yMuVHirw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX+snuX/CgYg0C
 wNKMHThbjHT7IMamgjePMgo5QdlRll2vSwDi9W6CmDEQOczwnMn2PGUR8pHkmc3PRpw0GqSjyDH
 WRl9n/chM8i4Wd7Wi58btUUfhlKrfxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the RPMh clock controller compatible for the Qualcomm Kuno SoC so
device trees using it can be validated against the binding.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386042..971464c63ed6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
+      - qcom,kuno-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk

-- 
2.43.0

