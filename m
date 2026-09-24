Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B148C41F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246504; cv=none; b=qxBGsXpNqwEqr1aiUEzMm/gpGucemhdGVtws+JDYqiEHZouWEZ47JkQ6Rkvbbm/081BAL7J+qSz12noWhcfh1drWekzctPbz0/C1zV2AE/nx5Ba0o4KqO724i1F6Z7EIrw5M+xV+Qxd9ROMWUd3UvdDJxv8h7gPlTcD7eq23hIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246504; c=relaxed/simple;
	bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9Bay2SrrAZextdKW3OA3XTdw+9z4WSnUXhoNGefFl2G+JA2LO//KZAiOGOmb00Yake+DyaOPTUIX56OfVzeMRAIsgLLtl6/tbzRejgxu0ZLmtVmlTKm46omMEjZ30yXStoNZEDNnwCMM6QgFneyiILIIQ2joLODOzKcYuulfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUSTNllb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExCSf/Ay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUSTNllb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExCSf/Ay"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q9ME1773985
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=; b=SUSTNllbZ6Xu75RA
	W+7UF5e9nucLcJgDvwLbXSvo1yrf7NpdoZExvhtTnJP7svKXR9Wd+9GffRIPUd/N
	NPcAefiAVeZZBsAmS1WVGHfJ6mz5QAJQGBvfhBPGaIMO9Q4KdAVOJf/BPhCURQNY
	6J8Wlb/3gfjkV1Xuz/Nl1EOJ4/vldC3HuZ3gc/5woeHW3HaKsZfNnCOhjNBODlyP
	O5uvzLDF+7gKSAMG1yr/rj3VckBLp5ipQkcMzG0HwR3/4IvtERhet34TVH7BAO3e
	2n8PWOp0yEqCWwymify7DkH6ICbjxoaLYp0LMdDg+cQEgOFat/fQRgTeEl/Owfe3
	iQXIOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb41d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a08ff8451so297785485a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246500; x=1790851300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=ExCSf/AybPEoGo7bHSA3WjcT/7rlxxnigXwDeTyoLV0OcgRL94JvUYoPbd/Il6xQak
         9A3kiJhi8Pmjb60KbQ1Ggm4wufJ7PX3oL72MQMYtQsXjzh7mVbC2ak2x9YUG0n5MZ8IV
         8QAnFOYHdSZX6t9h91/AqEzbt5h/Eb/+iF0E65Y/KqO7aOihkPMgSEnL5RUl1OeO9nqh
         LEn2/T/M4c95qHzhyFEuRVoRC55xH8/4eydQNbyfu2l8OfT6SXb5wgsuMttokyOLPQG2
         wxcPuGr2vkGZXsF/YUfLkVjZoVdUUSJluLknWLOM4FuT8TpVm2phndMWyUKcCfFBQDPi
         GXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246500; x=1790851300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=qFWvXkylvw3MxXNgM5RdcVpo3ZG5bI1ZDDCkVO3SsCGDBFSOjwVyOdzqpcr7za6Lm6
         ADVftwob53WYq32/wx+WuE3ZHMLwL2Zit9uiMSBDUE1/3TS89AcaxNIjzl6b5AWWn8DZ
         dSmH1E2+eBjVq6h20G5ufVvY/jvGRwFRxem8nnVrR3o7jkwlwaYes/EMp8wUBDCcasaA
         7BvXVAKm3MtrhIL3kUBPFfb04PX4/wI0TkTNNGoTtG2Eui0uHAKx6dMYUd+iqul4G3To
         U0bDiFIYmcPEvO/y463OB3yl1rm+sg9bAiwjs5dTHgUsDm/8EFtilS8WD4tuHE1eNebX
         KL4w==
X-Forwarded-Encrypted: i=1; AKwUvBxnRvVvmnIDdKF9cTThpnv+hVj+mUYzjW2nxoP5+e57SFwHyCk7IoVZms2QtbpoIr/9LOkeDxERRV8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2lyllRcAUhHciju5V3CrPp71LODJ77i4lR+cqlxh5m5FPENiL
	Jb1MwG4vCAwG+WB08D7i0OyvXwyWRrlGsNQ6E1uPIRjatRUDgmWCJq/h9AS+kp5NN5HYBGz60uB
	aZvrnYj6FsqxTyH0MGiJY9kMJMa8eyRQq++1aJc6VKdurgKtBjJwT8RF9qeN69bM=
X-Gm-Gg: AYBFou3tGcNJo/MWiCAw1c4NBXPUJiLPa29L5EmQMsjdMsoeCjndLBcYtMgfjw/tksl
	ym0NSvF3iwj/OAxqxRabm42K8wto78PqbcKfZNqBjon+xgTAVlLgNs7vrkxMgCGKON0TpZwScjK
	TKg9yisHDLpLw9V/EowwQ0uSMy7E1S+DoZOHPZmqjKEwAkj0peOqGNYFo92PmsHsnQKnGUxr7Wj
	B5Ek+H2Jb1kS2enUYMQSDR74ta/J+ADwRy+qTEEMMGo8PMUcCVpQ0Te+jmxoszWlc4PK0OaIKgS
	lAJI7S72/Pu5/V9xsY2icgeANIbRvKVb25CrM09wlPuN3nx7wGjC/ax+Jc00bQFUGq4iDnL/WgB
	8mgRXImYc
X-Received: by 2002:a05:620a:2720:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93c363bbc65mr234121485a.31.1790246499626;
        Thu, 24 Sep 2026 03:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93c363bbc65mr234115985a.31.1790246499066;
        Thu, 24 Sep 2026 03:41:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:48 +0300
Subject: [PATCH v5 32/42] arm64: dts: qcom: sdx75: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-32-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP356Iagdvev0zM+0LMmfH7ZQNHsFAC5pl7S9
 vmsLSGFdSaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+QAKCRAbX0TJAJUV
 VkEfD/4lQ/O4Nv3IFzjW5UAf/sv87/QaIqTAa8U71/vlIUNRS3pfxBcQE38GVxnhAmEe6vBo+AZ
 k8mMqFi0Dj56m7/p7JTceYw4ZtM1e9rohQ+3CpG3xAjmD+WX7lbilv+w4efpLWvE+V5v11kbewt
 X2DMnt5GCe7zkaKWlJjkdPfyfVxpvqct5Vhxdg7yVD+Vg8+hNgJTdgHySxDpW/talwrNbNaCwa9
 cjUg2lbhb3sQ8VN9GNov9UHrt1pRbXnSCdFMUCCAvMbcIQ9x7QpPSdVjlyUBKI9fYjlONs622iC
 glq+i0/Y4tVcCkLhGMaYojxzwlD9YnfYIoVioBVNAjSqaLklYpU6dYKAnHeTC282b+tpMyn/H3n
 lN+t0fjz8+rG5O4xIInDxQ8PZ3vW/WBRKaTURcxolr6Z1UnCJHszUc/b+cKsgMehiELQ4SQu/a0
 a/O16nqqDy+wNqIjtGnQS3wmEn5e9j9OaermbW+BPtBBo8jtPQw1w/CtcHevAOYXFOwstJ4YVvp
 6+K1XWRshYw3HmTIhkKrnfnTq/9maxszYJ4DKO5kgBfdnU3ZY6PPBWh06O13PugO/Qpvf7ZFmun
 ARXg4nZHqls5vzRh8cFToLcvjIVbgRAXmtQ+TeWU+a/dGd/InYptrLFYJVEK2RFoCDxZkfxjCXt
 345oIpTn5YqDJ9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FVZevO0cfSSA64CVgryXOByeeID51Xun
X-Proofpoint-ORIG-GUID: FVZevO0cfSSA64CVgryXOByeeID51Xun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxXSg9T+yE9O1
 enG4+S2ayeIjbznT7AENMy1J0tsTOiCibPeQ/WWbw13V/abiD1hvx+VagEi7BR1ZNB0PP3CWyhx
 QULyQdc0UTEi2Xe98aWJ/LVMcxjDCIiM7+OngDUEu49f/fw6kmlCr1kibJM8A3cCuzIF6Kw3U5a
 kUzrn8/jKuUincIbUhPeMDYdRe6NDmxRkxTsqigWPFuKLYGPMTNkJ0+Fu+fVtctvhobzJUyA8f5
 MtaLoTkiuYZEVQv1zseThx1YYdjKaYP2Y0vEHM92cZ0cdri52pdwQfwgnt0Da3Mfrh7qMK0RKHy
 zGFJAyebrvqzSKF2YsFcIp8+q1wzNsQxIAU6J7AaZuKOGvS1ooxi/TkF7A6/Kd06zGAUQBH8P8H
 ZpZyr6FvX7DSv7axUJFowFjG1UnZEOwgDc6cQjbSoew9hwuxX31VW7+8b2eHbxSdFkrvjb2RaCX
 5t156bPTbr+qI7x6+OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX56d6Ot33TbFb
 EkTher4exDj98GkP6j+Dt8XrpMOJ/POSFkSl/0JRVhRjVDLA1b6PyUERYJnBYe4+5f4Kjyz8UdY
 KNWgNHZ3Dqd9mTpSV/EO+05YItTeQ6c=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4fe64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SDX75 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 81292850e531..c66f7bd9bf9a 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -486,6 +486,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

