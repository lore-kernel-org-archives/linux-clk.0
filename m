Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4742640C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572584; cv=none; b=tDWafP8ghrpOoKYaf0PgSVR83RuiXK0O3lTbAp2r8OizbeWTkSEg2FICuZ9Ykzd8t/kmF8RX5z0jrJMk6WVW+dIU2G19OE/cXFRy2hjw7H8OMjfoJT/8LAMk9vh6cPpHZ44thvZtx05jCTKZ0lemvMCPIgptVIlmBcLP8CtQC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572584; c=relaxed/simple;
	bh=O2DsokWt1mMW8bjuqtRH65DPNyZsJvqs4z90wopP9p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZi/GcW3D4szqGOkZJgJ8HAeD9JB1dwpcdISzN29eizKT0hYZOyvgY5XzudXpS561C41YZGprPA8HBtxLckqeuZP7DO1FcWhKAGS2qbZGFE5tkiWyoiEMbp7fhLLjQ7NfUrzLzIIAh8IXZrIdbKrBbehI4LtKG13vmLIAJfJmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRWFetUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqpUz8XS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRWFetUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqpUz8XS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdij2275085
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OggzUa06YckTcbsyyQNEu5aQC0d3jyXT5GphmAyn54I=; b=PRWFetUHyHFXzFyp
	o/Ayf7JyAqVMMixXqgezMp99dfQ9/fO/U3ieZibEDDoQAm8FRBvbXdVZicOL2xVN
	VEgwRxQZv3caofZlXs8NLcGOgIhn0iLXcqYTxuxztPUdG2iFe25YF8PeVGvBBGIj
	ty3UNMbvy68S4+YCt4wiYcil3TeP+Dex1Bf0PtOgHYOdODi3MGhwvdoQY4PoPRUc
	NXi9IFY2mkEBHTiTA1qTdRDbhYffLlYnGYTeF3Zs6eH7KcQVN/PWcamI6j4pHuUX
	q7qbQD7CSoY5VW59jcQTPTe/O+E/DSsUMhu1qSd1aCq1y5tIIZBByxiw6FJva2KV
	MUDccQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsgfnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so43971301cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572581; x=1788177381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OggzUa06YckTcbsyyQNEu5aQC0d3jyXT5GphmAyn54I=;
        b=jqpUz8XScdU8H7LwkDY4PadHkApJGs4BmUKZdpslBHbvxNxFkLnLby+hJyDnZMRRjw
         tA7VEn39rHL3++1EX1K64xyYL7O/lNixzrDAy/OP5LeKUkNVVysDfIP4q0KgihakkaRN
         l6oJE10i7+C7aAVB08s56lzwU7p3J+7NmLf9EUsG3yEhtdPtSInrNxYTNfyGUJc57z4T
         Xu3//vemjfcit36M4dpK45AilYdiVB0l6sfdlNTiIqEpWs6JkUO7rCHIqCHNNywbKXAX
         rUJMpUQQXzTo9MTsOeupG89A/dHJh6+mRWE0b04bX1mB/97UG+W8KyPGWQsXDzGiAWff
         jXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572581; x=1788177381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OggzUa06YckTcbsyyQNEu5aQC0d3jyXT5GphmAyn54I=;
        b=mYoIrfS//HSroJFzqTT/mRe1XL0F2KitXmNmAI5hwaOw0bmeZX3oTCPE2Iv47aydmu
         F3yP8CoTG5sJRigB2KHtqCRp1mJFF3PLp8O8wJhGWgd+0BdzuyaBqEE2Q1lZjwWOt1rS
         J1ZEVTNrJs4jWJ7cZfd5zedwgitgZP3ZSv/NSGhYhwTkCwaIT5iBRIuwMXq58uMvyGQ/
         LFKN0krCafcAVunBtbAWdRJ/r+TNtwC73blF5asT6FzI8eTBchvwFwZfeXUZ4E2x7xpO
         JF/MhirbtpeVKlmZztMDK1erkblxIevZYQ+Xm9EImqJNF/0YCMRMoJxeg5riogZBfcJW
         3ncQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ7qzB7J2JKE9he91v3jWqTo6yvyiGVpyYOghiHTxKijUZ7+kavpoDxPlFt/IjlC6ZRnyG99UE2M8=@vger.kernel.org
X-Gm-Message-State: AFuF++kc4Z4wyWrMtRR7kb1OjPTZl4lF5i6JhHDCbTLo7+UDics8mTPO
	okeUdWckFWDH4drXzJYdIoRS1ssDVDPwR/UyK5cGLuUsGMB7+k18PmRsa8mPvgehXR+4gvn/dO0
	rhe4k8A3v0uHnIGfgit7ZvZCY/kTUnaRjrFZLyNSvNNDZJ80mQpje985APeUc6F0=
X-Gm-Gg: AR+sD119Bu9n332on/7ZH9E6njgtQ7NsQ+sB31wj0AMekD66xm7sId4sG53hNCPC9Nv
	/XFrhJEgkxTHOAJR2gbWcHtVOrvi+EBCmQFHD3E+2xgw0DndDPAOYqksKkk9djpaTomyCFEf+te
	4ScQknYWlAxgsIMPnt5gdEe1Z1bcaphlXV7FZIRZugBDSq+G2so/6mjEYSmDvFVYZwo7YRXb2Yk
	jKPcCQ0QpQJh+Py7Rnf9Lwb0o/tpb5pJr5TMFoV5F0Exifi6+mMVRfrqHKcFi6IdKdOpNFAWI5G
	qDdiiXpYs6YTRHrAymhNkeB+ydvbAZdY+X523Iu6Twxfe28dQmOrcRV9idXcGTRlYeu7nx3z/Qj
	0362HDB9P
X-Received: by 2002:a05:622a:4c07:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52df59ec938mr264779421cf.27.1787572581143;
        Mon, 24 Aug 2026 04:56:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4c07:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52df59ec938mr264778701cf.27.1787572580561;
        Mon, 24 Aug 2026 04:56:20 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:20 +0300
Subject: [PATCH v3 33/47] arm64: dts: qcom: monaco: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-33-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O2DsokWt1mMW8bjuqtRH65DPNyZsJvqs4z90wopP9p4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD1ZDAUNQbqrzbnGshrc4XI31IyegkxJ2EOi
 9tBBN5fEZ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9QAKCRAbX0TJAJUV
 VgkCD/4mJIXUJzBcOr7cdSWkNpVBd7HpEx4es/cq+oyB50PpBOmCzYPHud35gaCafm0/Bh1uKRW
 GqcyEPNhd0Z1qAk7GQ9e5ZP05Xx673zlOtI1sZBm1Yp9yO8+hz54LzT9B3tUEzRz97GLQ4Ua0oZ
 YAEKeCL6veKmJFS86ZSJG5yoo6ZG6Qb1N9WQXMAC15xdD11vP0Enw5hw3Yg9vHCYwm42HPC/dBg
 lGj6Fxd2ATux+0l4CiRm+AVMDJwKdC5UXqMPtuLQyq/P+uJSk/IZFkc9gGUktz6DMmD8hT/AGWd
 bL+hQfApZNKU+s1gGuEIdFdHeH/DvnD4lLoL+qV+WvAa+YfkJX5cSnB+3Ed+Gx1BNsMnLiXnaWV
 nAu6Um1gyrsyqtTvuosOxSUUJY+liXToNX2gHiN0Ur4+LicfVkrH9WK7SYIsdrDx6npMcapTpIb
 1x5mSCcG34j59qCVwRxXVpD/W47ImUqBX8HDTpByANn3elsGFRd4iH22RmBM8Amhgi3XDDcDQ+D
 /Ky5uaRIfTBY63Y8cFq8VpDlAccmP6o82Oqo2F5mvngYuORWg3isPy9eWlynlhDuPlQbWZDNkU8
 Hido962jfXdYb14O0c0eJGKYYJ3WBaLBm08QfhCguZDdCwJCK4/xKTEz2CJ4H/lrIYmGQshcCIo
 kX4sb/Msrdo4yAA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXyMKKnTHKfjFI
 kVBV2TEDNLpiA7ELL2+rN/9BwCw1yRf/iyEtu3A8rKRVpeP7dXw4ai/VFu6IEXI6WYA4BtaSsT7
 FJ8UFBGwv70BX77lc5hSe0mDfJd4hss=
X-Proofpoint-ORIG-GUID: CHhMFyYx7o74tuaTvtN-VXS86NN-495Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwcg3XZFc78Pf
 ehPt+haHwo/211cR3k+K+QEBFVpMPmOG42qmpFJtYTLILZOW6KY1szCYaydywpG+5Bw0s0POpCl
 1gua6JE89ZpOcg3RyWB687lBghY3ZC9Hy9U/v62PBjlyXkE27tENVGPQrPNcth8mp7CkW5vEXN6
 2k37Ax60MUH3pb95ANAt/BBnizFXn49QK4CMOBD0GXPtkM7JMgreVe6wSStdS7XAKP3XKHZzKM9
 3v14CTrQalklfg+LUzPjGBqY08ev7lvK60QZRyDcR6y3Aaq19FQz5f5htVwJWVeaWtUTcKUpPNn
 uUpNPULJuzW3r1jMHrZOZDCXO5aYQqSE42HDUvYQKP8UXvlc5PBFbJ0ubHpTjoruqsUKcvzuHf4
 GtXRaWY4xtIZqmzccDL90S2A9D+6FFaUzeSTVsPk+VMFEkNpi+3WdEj+Mkg6b4V3VbuPnVspCTk
 2HfiYd5fGCtFe//gG7g==
X-Proofpoint-GUID: CHhMFyYx7o74tuaTvtN-VXS86NN-495Z
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c3166 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

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
index cfe39f923224..0786ab4c5f0d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -898,6 +898,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

