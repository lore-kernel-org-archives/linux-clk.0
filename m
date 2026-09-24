Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF945489FC8
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246499; cv=none; b=e6ItmT6wieSjhn0NHTlUrqILQfTdcXmI9/7iFfXPFee4KDNwyM0M6JjlOAG/sxmOkwAw1WiOMk/V7ciZQ0cyQSLKY17IykQO0ojwS84vrjhuAcLHoJhzn5kTzpSfaIXUF8156rtDr4ubRskmNOODBrpJmMAXjaI6G9tBO6ovvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246499; c=relaxed/simple;
	bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7JccSdPdwQHnPn+oLax56QxI6rKbDwMgBqw6ODp1SUXLIRWByi5c3tuWtjpw8NpzzjFjYhHBy6KdhSMiSw0/mgi1qSV0Xvfoj/SfFrsb2VmEeO2HpE+/uogT1oUhnshRMdUzjveclYpeameA8IXiZfgZdnu3rMyOeaTHpYa5nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nablT81b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elWJxL0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nablT81b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elWJxL0H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3a86538670
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=; b=nablT81bt3eWFyna
	6M6MW71uXDXEftZrZzFYZRkjo3mPgJcBw4EA6/vVit6os7jvLhXkM/xUYfCvhK92
	NKhU/tHbIJ7F3gkR7ZCBlCOzYoNU49weokBlSf1QMjhRj3jaYTPEDfD56PXMTmxF
	K2J+6RCbOjIw3chQVLZxel+7cTkO4iWCwofH71pvMnW7o+L04uu2MyQEj/l+sB1N
	kU0iQqKPrex6/JqLfK+/atFJYrRecn8Rg/CqFbkp039C2AhGJvwskvasV6YFEOYc
	Icjf0QTpuoccrDa5ncG0uKCT0JwRVWm/bA5KXDZ25FCesTpmvUCLa2n6hEGHp7gH
	ILMAzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so388563085a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246495; x=1790851295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=elWJxL0HmzfTcN+HAY1viX6a3yAMIvVKYOei++O9TKNXvpA8hBEVW+7Ove5qRsaQBc
         Zf3W0qNyb3dThz6dJdRM9EKpDwT5EMC1b5/dyFsPHgg5gAMCjigMpUihfJs4WupkP7dm
         W85Ip8EAasQ0qnV5wZgWg2GO8n0Go3gw6PihMRkr4t99M3b6Z0x5Vtoi7koQKSX71QTl
         DmgGGEAZBztxgzkwBgXoyJJtri+iqEDtjTjbz9IPOMMF2feVrlCqeO7b5MdZm/tHbZ4h
         ZgPX01JF1GArmC4wDyKKYAyYIO8faXSM1xLID1/mltkXNVq40Mx15VSV77fk5ZwWOuXi
         ZAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246495; x=1790851295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=1sID+7gC/BiplzSemsXpKJ5NVnEOmd1aCvp9SJ2g3B3xdJu+L1q1K9K+uYXnBdKF3T
         PjxvoCv7p/WqBUPvm8O23X0RP3Hm9VGOuO5+cinKVgvet/RpQY5ZUnLRZc2LKG74JUrv
         N18sJTdyHzSAOcy3yx9qnIIIk/oHwp5qv/UJ2INX7iqXdIGB40GVJsQas5nDTLbZeOnU
         bznzYdpqw9aHPWqoRJ6dp3OCeTq64Pyqs/L9ViHO8BsGnIfqMo+toksJ0zhAxBxCse1T
         BNz0obdXqXw7UWA3ixwmn6MvObK3zUjJwIhJKHf6DoSfbQlEOtsTgzQ5kub+f9/Ht9oL
         rN4w==
X-Forwarded-Encrypted: i=1; AKwUvBwXwcNqCLk6N+zT5P+UbX7uDKy5Hz2w35Jx1lXL8juXZdY22smUOl8E1Esi5xRYMMEp6dvzR+z2ef0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKcNCigJ/M0TnkbvQK0bqaG0VG6dba1uwz2BkiOHTGbEHPVX7c
	0aMqeXARu+27X3qK2KFCxduEa+kX/C6l3k+4b4GsqOr/lnoOjYSsJO6VRjmhbC+tjIEvDwJJKJ2
	VLmi+NqE1SY8jW0bOa1PWcag6Z0uvb5g6ONAtxR9cVJ6E/zzIVANO1H/9KmypF7k=
X-Gm-Gg: AYBFou2hAyccnzyeUhCmMM82tKKcs8HhgoKkRPDW7Pqgczi3rZWcKlxa9UGcXF/E8HB
	srUEsGiIFbeWW6QMLJ0gofVukUI/k744ttUFlm3NAnYgfdL0Gj/iuSIByTH6AdUqVkzOexAvKuu
	Gr6E1gcSinladGZREVXutQrADy9eGVFK6mWjRbRZ3hyENZ90yKpgSOSMi8JLZQ85GikF8UfqPXl
	N6qHL8R1yPoWrVOQdONcf1+YAjfvt9siqgXMMsK7lb3lG426KIeJrTTLL/ugSiRVO9fiXEVhwGD
	WcMkTgtZ7B/Uf87q80RTNU319hMfBmCgimi9BSoAjDrAiaCJCEVTvXsBlrrrHwU0uq7emUsxHd9
	nJEznjX5o
X-Received: by 2002:a05:620a:225b:10b0:93a:2bd1:648 with SMTP id af79cd13be357-93c362b4450mr151134085a.4.1790246495060;
        Thu, 24 Sep 2026 03:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:225b:10b0:93a:2bd1:648 with SMTP id af79cd13be357-93c362b4450mr151128285a.4.1790246494411;
        Thu, 24 Sep 2026 03:41:34 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:46 +0300
Subject: [PATCH v5 30/42] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-30-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP33ZuKy68pSvFBR5Sq2N/qAuQwQRcmsTKpLt
 mNKC5CIPHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99wAKCRAbX0TJAJUV
 VgH0D/9a2E8TIRQ7sLDnmMdVvLHXi7wpHwG05i4QSwYSpV/uEYnrn+R8NFMG0Lw640hSfCDckqT
 fAoEW3YYG9Rrt6pMqGvF1Hnv5kBF4rhhFUUuqffRyfnm9E/sXTyvSuAtrixOIDRKK69IWeI1fPl
 K5faVparphQ0RtR/x4Q8WYxq89Lm9Brzeh6zAYj0N5/NQKDd/Rbc5yjCL4LkztLM2xnDYgILxXu
 dY3dh4DMFvAyR/Z9LCtI1zQJ7OTjdyhHZcMbdaCAV5IiNg+XDyw6HH6guJz84q5tHQGFIsmD2zU
 VQ4ABBHIJPq73cBWZM9KNF01Jo0iz1ju8GnrY1pcFz+CfNdYVKA/Q6tzzv6prwlTrGJ+IdisZuK
 dXzst3jO1x63ZX3h/uGNATQ33xMwzcfDmjcwSinZbL9eJ6uWZuKFuR6zOPEWdKHPKDnWxYsS7js
 Ye84842NOd38rWkGCMcfz/pIsX0LuV2ayzPdCwN1ZCn1+eK43SQgMczcCPJQAaAyXZx9uCuXvfQ
 hKUUnC9KWHBPofynl19wmjCHJqdS1xVuSMvvtyJfup+9n+i1OB6zDe/KrfBy5mL4+Uwgy/D88hE
 oJp0IcoIJ6TWc+3iX8lBXx2o3zIAOiejG0FbEmtZ4PgYUd8aB+bsnKnrwHVoqMpi8fyfXyQ7PRi
 xiJmAo7+TNKPGog==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: SGt1uiT4-6NEAuntZY5AzVh91VDMjnGB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzlI2d3vt+OGR
 oOTdX9wxLfk3klXl9VzRfPxxlDhmxgJrhjdBFKOqQfgZtMb6TJRw8yUBXl/kvIFb4vv+8l1nC8I
 d8a12aJs/LevvBElDdL3MleAeMpOIRHZ2rh5WTKB9m3wIbZC2UayqJfHHJAABK/UNtkxv6FjG+L
 WmQsQAzfjF6JA3EgSHHcahND0EV0FvhiFvhr4IzlftdsUSa7qw1cIn27Q3Cud+ADOgRHQ+v47VX
 P1vrFYzFGx8JAPe+2M0dLI110quI4chqIY76kcMV/TmP6LKIl9QgPioVzOzup6l/2AI7Gy4U/op
 xXYrrVwxTTSGz1oUOuQRtWsYHfAkYPVgFj7S8OMHXCp8f9sPW5KHCC80MchSMhND6wV/x61ZC1F
 KtT3gDLqfEIwSK6TIWhpzG1Wt6n0eCTtGHm/SNiB0p4BwqxcJi/utZP8mdy2f4yFBiZOgmvRKxg
 NL1sbsJasvcFawSdkew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4tPozHy3BVdu
 u7ahhs2Vwj5SqxjRsZBL85PkshD2+FNdqbIJIA2UsFSa7dE0ATrtsVCvKhj+bvBF6DtgJr3Avtj
 X41NKMhsPN3IK6S0QRdWPkl6iHNzM/o=
X-Proofpoint-ORIG-GUID: SGt1uiT4-6NEAuntZY5AzVh91VDMjnGB
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..ceeb9c47093e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -474,6 +474,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

