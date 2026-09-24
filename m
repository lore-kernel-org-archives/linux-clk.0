Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01E47A88F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246494; cv=none; b=QaFasyg9HDIhjOHazvx+vgX+L26g1P03iCi4tGDSW3VqbAMhCnwaS2v0vzbPnmzRnZpnaHVC+XQkNmky7yY5gahWjHDU5P2QW23UUVYGGnEEzb6nMKMlpDGwspwoQoOyZKoCJVwK4B+TN+bsL5tq0/d9sN4PKchtOb4LfREEua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246494; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWZqm0Fp3RPH+yJSduCChzA5Hk8puUHSjO+H/qMsBQ5bvH0tvOzPGu0uYJ60fMBWfaC3IfCyRFmpbGjkpXjhmzHQjrd/Q0szZkd7+D8NTmHK9rT+5Sq2dG/TqP0n7J47EQowHzKDSM9Sove95M4wSOriCQQFnNgLm9oaNauHUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRuZJpZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APMpAWIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRuZJpZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APMpAWIM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PCI42025616
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=IRuZJpZDpc49/oQx
	6rMU/u6YrG+yjJC1u8+hboDA3LjpLmcW+njOUmsAGrqbomebt73ZrJQMlf+GwqiH
	RnFWUvW5w1TevP8k/DHjLGTgKcvyp3vVsHoZXnpjHFcVt+S6nUcukCeYAUVlyPKJ
	3fb9jvRdtsR7Tk/nYeej6rm4WlqLzv2+Q0IWDwpxG2NIujFeVz6Z0utE2O52VBlX
	U7Y25bJn9oino1oECv2Wa31lCa3ZTcAbScbILzHlcajKggxhl9/PUDWOSPxh6bmY
	QDxFFVnayh9Ve7OUcZOAj/aKs+RLuVjzf3t/UQUBnKSX4TzBF5u6hiTcrir3tKlh
	ps8NaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt29d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso450318985a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246490; x=1790851290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=APMpAWIMb8guaIc0TgTI8ZEjEmY6jTrqH0d1E6JLRpXFZvcBhZraq+lmVPFCKoPRnB
         oHkweUwoDehKmTfYDi+iaYUCmOtv3oMutcB+HwfkRE/Rbpn4nhLWag+sWr0QszoJjQVG
         NI4J43jO95CWfAoRSVer/+5WDuMb3eirBzNJMR1ESn1gXAupJbhpoKl3LGkHRLc5QciI
         sHMUE/I/O+lV20T52fHc/5kiV3cWseUet9Mg3HMWc8gQnvbIdXHCpFRVEOdK3LspgIQq
         rn667E6JdWzTEbinhYbnIRq/D+J6s4ABF3U2b1akMAS+FxTG2U9sc2GfFPlRXyrtqNWq
         oo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246490; x=1790851290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=A4J8AebWw5T42r10jPSozkWrCt7ovnNLmV1dCyA4JLEjhx+MoYmuvWUNUvbcjckwLU
         66EXgS+OHMWzVs3ip4FHv6aUYjky+KBAhNtBqcRLc/qyp3qiYiALqwI7Qj0Fk+RvpiBH
         hCnAwosI46Hqtaa1qX8FUUwRqiicqEXVY9eWSZQEX34AQHMQucOWWJmADGRYria6Z+o3
         MqLX/ax8ALqO5OcfVII39u8OvsMMR13cNdSBRVAVKlJX20imDhQYSDuyqhZQhpuQMMfg
         MnuIKiY2bkgUYACU5gQ7vjI/IyX6bDcJOpdsvOHKPU7kcpchRaWR/INWM71EOWX+SLHy
         vfyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+Z+ZByfSi/rKJ5T606eLY4tWd1xXCy2LNZ8hnCyXozJC14dy6UswWzig86XdIdFg8VE3fmtCg4sE=@vger.kernel.org
X-Gm-Message-State: AFuF++moiwGYwSVf0bmc3a3Vq/WF+laKu6laFfxJtkta5WZwzm9GxJXB
	uAuNfdVpJnJYurIkA0RbSfB8mTd/T0UqxZ9/53pOXOE/mE1Dt3fQOX4791bbYzCde+ET1Ogs9WO
	SHx2Nny5PSjwARflKiMuH1R63l34wL5U8SslhAH4ngThv80qqhkf+5AeJ4C0iIeo=
X-Gm-Gg: AYBFou2Z3eNUuK5YzUpEa4+kd/j0gsNsj8iWunpOkUfsx2ZyvhcRqoQIxHGJpnadmMZ
	a05GZ3iyHPRAgy6OUUrMhA0L5zpfOong2GqcohDKSnywHjVK3Q2bSCyaX70qogSGWbJLGvhTfI3
	2fglovlRBgWwKa/6wiF5P9qkc3yvCbCMcxaVbpazbMX5nWY6JP83k6xThiV7HOdp7igHqo9nHn4
	M5OPmOooly+P3/yHML7GsLsR0K4WkG2jDrL1TuSGcZVvef3dk2f6ycEdrLhHA5lPXllTX+SaF/Z
	ya3ahYWClYJom8atSAFHn6Fn6F38x46/AsKO3RoVTC0u9FmH6H2C3AlT94GNJuUyldFUFC6kAqe
	R07H9MpEt
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213856685a.62.1790246489772;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213853085a.62.1790246489143;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:44 +0300
Subject: [PATCH v5 28/42] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-28-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3150VKLVCnGh5T7vQAYhZlzOGSDYW0slUy2
 mCfhq9iX5OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99QAKCRAbX0TJAJUV
 VoG0D/0QZ91uGvffLXiLnx75qIbQIeYQRIWsEakjq29+AAiJJySYhir+59JUdxeLK1XBAwEpmLp
 bPwqJQhgWCP4Tza1RFbwZjElJa/lKHwo28dZak1BDE53Mo9Hvxx2MZw+MgF/gepdF0i8oUJdVk8
 XlX/1sVw7l14kxU9G1sZ4U+B6Rd4q3jNRAacL/+IIYmTjqS+cULobdn+IBpbhA66ONDEihJJUSm
 d2/aPqAU8yyu0B1GXZugpix7ZImXaqTVC9Va86lPRibif4iJGQKI4nWDPBwQsirofn+cDmfQMMg
 j/3wSjiuctKIimhcYCmP5jcCTD62965+BFdcF0hzVn50JteYjgm8GiLrko+Mxvfjj0F97QEW8uh
 5ODIoRkz8SXO4H84fGpAjmxCTJj2rdjsQgsRUz/zyvtsc87BMjL0wl91ulm6J12dxK6290tjZc2
 prytt9VRgsjTH0vntspkWptVFQY+mr86uI+7HE7LBPCOBLhHOSBPE/UlczU9HgXDQM/rYAL3uQN
 J0h2Fjr/7BrA6X+i5ES062fnzGiuxYXFZXFFrBzw09QJjhzBUceZwHm87OkCro3xWHYy5BLv2sj
 sX8EBHTxLbDiHltGJsLDuQFLufAufIZZMKU4PHafqJzSFwPABW8OAkvDmtWa1ptA1taiTK133Q9
 yksVKa0xYFJo+cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 22lCRwHFgGXTz3jQMzMrzNfIykFMj-k9
X-Proofpoint-GUID: 22lCRwHFgGXTz3jQMzMrzNfIykFMj-k9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0gSn2xgzIb4y
 mKVITsW9aSgpGr9nTYppVr40pQUROSFIIkF4SJ5HQag/tzLMQ0w5GtZxTQlCuDC7nxYQ/w9FJ7h
 79nexZYWnEYZSoJ50sOFyA/P5mxylMQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXyEZGURWeC99D
 /tZsa7XLQfQytcR3fU3XlbKba4cdK0cLEZ8BIjgs84RtBp+AHUn+LdxblnXU0sNFjlIl5ZGVBnG
 +u1AsEh3vnnjD1I6/V8nsGewdg29KtYYqlWCHZ9XemiUqDkqPC8+BzDPvSy3qgD6N/UzsocbATm
 Cob/UHjCymLU4BDOnY4z/2mvt/r80q17X2OI/ByS6W3QDOdabYzH7Cj/ThQgjeU9fn8oGBihW56
 QXxiL3/2NAjYLVlnwBcoRu7O3vV5iuX/PY1ivIuqhMsv/tzetWOLgHrQOZwE5cUHXx6ycdvp4SF
 v6aQfBwvaFp3P0Xe1rpXuemzaPwXFirIqsU22NCPXyhD22anwvBM5dJC2XwGmMPkIwQexxaaWMl
 oEljn4WfuHCczZvgmHsqx0ODRV07XbQfROlnIof2+BjNeDgR31PCEypQ6v19LNl1EUEDjlrFkOd
 BRl/5MCepETSmOj0L9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

