Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAAB47ACC5
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246497; cv=none; b=umu2l1tNLJglKKd5eCgXvmcpnaMWIx7MvgMlqGeKXm14IUQ5F1Z+m8JgWs+2jmcpgNWrltmkTdXFnQOS7wdaEADRhO13FlurVroN6H993C07FZFdKeHKvOjsSKsq0sKOi1+SWnugsmuxjU5LkUbMqWjwpN9LUIjjhQTOQOByIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246497; c=relaxed/simple;
	bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYXKabhaQReQt+rHkbOXbMGUO74qy28rsm29J8wwautiWPSYREVQbjLp63G3emxXvVD23PjZqREaTNNDTMZfX/R6OMIB/yb15vSIFElJ/M/eQhYhqz05Ai+NN5rtoNPkS6plRkNVclFPITYDC6YsganQWK/6bNt9MLOx7Xnx+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTNuRUs2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUQjBgBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTNuRUs2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUQjBgBa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5Luv1175610
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=; b=dTNuRUs2jLGRcSF+
	ycJ384KkCnITmER0A5lJ1lQw7iPp+G/5L1RjNA9Pb1AAVDhl8eVEknHMyqUQqNKu
	7DGKrkq1ZWZcyEBXYfOoaRQc7mVu2KrzJV53rPxvCZGKc3S/dhTmR7CyurEhJWA/
	wSpUJkh1RXokYDImxj3zVAmWrtC7wmfZcgP1VTIXR/BAriT0HELQaHn+y3TGY5WL
	doLFBDN9YnqJBtzbMXe8Kotce48QVm6FihydfrHbr/fL0vDIK8tvJ4nSYD7RioeZ
	FRSOqHbUPEyNGWUz9/mHIx50rqDCfQfG4iVrv0mpqyip038G/FPSK95NYWkutVKx
	lSfbug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r47f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so329456685a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246493; x=1790851293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=SUQjBgBa6aLG0ZZ0Hk6dYhAKFlL1Ekkf+6nv/wtwSlYBp6+OgPq5eR6JI1l/I8vLAV
         koarXX5eFcqEHIbidDcOl6/R0kpl0RyeUPE4ghmS/Ebko0qvf/ZONuc03zoGeFte1M7T
         tHA8L39R4hAlhipNxQfoMIKi5JYWN1mMN6bqxGyjQuYm0nUTjFQd6YRms9HtrkHKF3jv
         johfG4HRmtWHgBOYY0saa4ycWw2KDKuXR0KvrJ750tK2vXrcTlNZih8shdtEMY5osmbd
         X/Ddg3mc1yIQvvkRRoKuPD5MBXKbQIz2BgvS9+IGsrTYc+Q0+Zg6zPqyYdQx71aKqPi2
         3/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246493; x=1790851293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=rBE7DjeEskTwhAHQnvWlBT15tm6ljM+iMmspj94o3NKNnDknuQgNy/kyl/P2Tx/Bp6
         GQS2fcb9gtxbCtSY4bkaDnskaZBxYxCGcdnKnLlgb7hBYMcka7pqLIEZF54uwautloxk
         polnT3UoTHMIKcoquc4SpF/1MEoJw5+yQxOOEGz6aVle4ubyHncN08Ymh4s0JXg9dsaP
         MB6bbb9/IalKPaKTlmok3fjWZOKBqdLPBaNSJPf8DQi46PgF7CSY5KP/jQ0clbf+KNaD
         NWdkmoEdMZFev9jVxeNfje+thEMU32CThWqrZmU9g5m4N5mB+gXLghb5TZGh6OZ9Pb58
         yEnw==
X-Forwarded-Encrypted: i=1; AKwUvBwg7He8YCN4uKonf3PB8L4fMZBKY3iRBdHAK4DyMagzZ7p6Axu0nnV3Jp311w1PVeE6EBAFgdmy0Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkbULGrAv6OlQIztIaQ9q7k+SNQ1BDobhO92U5jfWQCc8XckL8
	YCaQs/i0+eAutHfKQsWIDD6I/PnHnntOeiTTZEWNPCWUlYISAe/hMpZ+V8NBLBxZLDnOiMw1Kvf
	JugPZaU8NFXAGj9X8GQI4AszYFF1EBglJdU6b3wf/SLxYWwFeS4/WYdSAof3bIaQ=
X-Gm-Gg: AYBFou0nu02imtZOhq696gI9JPXySuvV6TVLonWP6L3QE8s27afA2P3W3NCYLNvS8/7
	gddlTgXUBiPeeSlzWH2QFz4UI3SYFzs/E0h6fctQFDpI6d5mITAoGmmGUIWJbKo2n3ywYjKUh89
	L7wgBw39vrwZe+AGZ8P0dGoJONqlnSQgf8nXwVS/2+hMGsKXuJZUrfx6RPNPjHaYuS4Cz4wi/Rd
	hke05dbJ+pe4SxBP13SxUJ3ofSzJumVb4lzLcMC6AlqlVkUbU6RplQcclV2re5pgE1NZeWTLSv5
	ziog117CbbXI53nQ5/kGZxhl9INfPkBvwTtqHMqtyR25Dq5rGH2xAH43TOsPsa8wt7YcFqO3bYQ
	TzTV4jH5e
X-Received: by 2002:a05:620a:29c6:b0:93b:c61c:e765 with SMTP id af79cd13be357-93c3625e8b0mr221937585a.8.1790246492575;
        Thu, 24 Sep 2026 03:41:32 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:93b:c61c:e765 with SMTP id af79cd13be357-93c3625e8b0mr221930585a.8.1790246491942;
        Thu, 24 Sep 2026 03:41:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:45 +0300
Subject: [PATCH v5 29/42] arm64: dts: qcom: monaco: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-29-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP32Z4njOiWYqSK4tc477qIZbUaDaiUbfHBrF
 kxsdUprotOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99gAKCRAbX0TJAJUV
 Vju4D/41H/FNa+AGSSRMNGgOOqxwOgdqDNewlwUZIWDqj1lDh7MDnwKj05+vrmIDeOBgZUcRfU9
 dTuVSD6tR4O9s7tWawsbHz9oopSR30kCnZCm1sERoxy3a2CZnZh3jW/LFhyZ50hNVizIpl00DgO
 +FNmACYc1cLxc/0RlYFKnYes1K6xXin7+K+AM/vy7KK6fL/jXX0GuXG2p5e9tLsxZNYSqAAHZen
 Ttx3rE79JyrT6Cx6kT5WcG80Xmtk1TeXHKc1HI7rWRl9VoLPKnbNHOBBz76yeBXN9ikI6Fgmw67
 yxRAlZ2eRxR7qjbP/29MTwJieVz9QKXv2phxrRTH6HFdVFGhDQqZ4MoJ79ImVkyj/4XLtmJARYs
 +Kxx/wvR9nep/ptWjej6NPHXuq5PqIGtmkmZ7Cvghox24+y8N3lFdJDsJNUsOXn2etMWHGul96H
 2U0YoHXFywsNhbm8agP/8iIdZDG6X3Fpqzu2A8sBUrMwglksOIS2ufjfK2FwAcpIkclpKR1fN/a
 hbE769P9EjMk2H8xxXhrjWwPZIo9IdzEEdTi1TwsF09an1XT+7/JvYkqAW3yPx1sy7b0uv3LUio
 OEV99l9mHdaQ+tyWsNysoUF49pG6IcWNvnLzuXppW2TGEJ18myo4KTvlVWyj9l2IYZPP/BtKWTs
 RZRwMuvhFK0P2BQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WAjDsnmbsSrtadSYNQC1EyVnvai4fTV3
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+Om6qmj+wTKu
 jYyrNhZVFaCuMz6VIYZGXy7QJZwm9PnNu1wovcPlQnyrnvxH0bfseKtTeS8rQ+VZ/fT0L7LPdtY
 kO9SB6n7VCPlazVX6Wot81D4+h/glP9LGYxu1YZc7TIoWrNoBtYOergaYs54czF1wqoTsfjPv2w
 thA5jPYFgDaX1i38voj/mmTP5tDn4cX8P8FEv432AeXZJbAsjFbeFwLDsIyv7FePfQnYP0i9noD
 iRFT8tk2XIO/rnt5ygS0NuvX162sM/5xxeMdo9l1yxf3AQ5Lav29l6wdhmblJdOyExxYT35X2Xz
 BYhb7oIKdwfr4PBNhNfVB/6I7LN2ZBdoKgwCa8sv+QAdnqZJlRWCDcGHCYHcxsllU1cuBDMulT2
 OPbnp4gkjmTBfznZqwrF38AsvQyPBS5daNrTCEtDAaI+Ctj3JlWDiCK0W+AKCvGdPKzng4AyL14
 3EFG7dtdy2S2wDGhDRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+t3xOidYBk/8
 mwB2IFKr+IuLxNNSxwSJR9ZAT3ZcMOYWREt6zCull2eRNLNoOLDJNXiWjzMRvr/gAQoEdzxayY/
 7iFABo+EcIvziv7fxc4B+pTXM+5iHzw=
X-Proofpoint-ORIG-GUID: WAjDsnmbsSrtadSYNQC1EyVnvai4fTV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on QCS8300 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..8478e81c4ada 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -897,6 +897,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

