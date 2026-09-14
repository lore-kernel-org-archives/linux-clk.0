Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490A473C96
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390194; cv=none; b=d7ZqUnNr3kYRaCBuadv1AIB8a4dzar0OxjknDcbXoVtzaC6RaKuoVn6KC3L8nNWm17M6+EEjmQk/Nrrh/EdY2kW8tDE/a3/SiSe3n9F3RjDcn225pt+RKuWL3lBLDxdQs/vivVNGzgLdUOiVmMv+s4nyu9Xxt/RwAn7qKAOlxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390194; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsvTm6/AsytuMz/4v8gLkKvLkldilfS54n/K/ymSx2G+PakhtAUosq8himf4yUcE3G+4Be7LpCTNOBZnwCQhwP4/jI9vFXu15LCSwUBqwSQuXtoiCNsG/PDougCHTtEOPUH5TR0kZ3dXcUpOsji+kJSx6zXjCdqvRth6/LlBaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zk4OqhB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHZxune+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zk4OqhB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHZxune+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm9NU3291616
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Zk4OqhB6sbEhwU/u
	q6TPL3/K8OenQRLsN2JqxvvwUh/NiG/Ji8B3cxf4Ad8d88CrNVwTtJ2f+Z6/H4aC
	OAZfiQETKTW7Ko4T5B/y5VGo8on8odD7a1cIie45i7bZRmO8AxSKOjg5bVdKpVeL
	ZR94jrdJNgksbofeXgvsv7BsfqnCNsoawLe4MLwtukC5r6BlbdF3CGkjh4efbS29
	Iw85XGclR1q26z7Dd/KduJ0vqTnp0CA1kM7ZMWIb5to5jMKzYEIex1ip5mPEC+KH
	qbVvrMld0zo/sJajXXQt33mNYVl4CyPshPn2q3gdQf5x9QhZ35mVSB60G8K+11BX
	uYdHDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so850100685a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390191; x=1789994991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=JHZxune+oZMHQKtH9R4P7kr89KfjtUgz0AAzjmpObDdGSNn3IoXBjXKs9pSjofgpXL
         Pxi9QITXrnpD29rrT4dYj0E2fEJxyihzffD7sW8uijG9auSZkT9bYxSWOnXrprnYdto2
         pvMbPVocZayPMSD7xOmpusUJlT2fUYlo9jbboCLy5snGL3mqA7pyvxrSAg3PCVu8qITL
         HCv2Bae6nl+N5F+Dys+araHRh5kaQCLEFwD62vzCXqzBVn3HZ2saw6TmobefXLmHsnX1
         /psET0i/yMo95rn3HyrISh9t4kp2MqkYiPsISfaPqR1NzRsTQXhO3IToOzpkZ1Nw+4mO
         yWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390191; x=1789994991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=Cp/rw1PXfoB22+nhi32qDgcCwfv6YZFEt3QwTqw5UE4HMmEMKiN4VJvIK9DS3je6l7
         hiZahSJ7j0kkG7OfFBWAUiKJQeGzLsVYuYCPp1LJougiGXcoVQFFCvaaOIkOqwxk7lBV
         z4LC5wb0GPDWjbEcacqu/3xQAK80kgPjG1DDopCFAJYNcsIXx4MOmKJ65XQYUIPfbcvc
         ZiefltSiGh6BRDwkIzQ61o8u489LnGkBsKBJflyTBqNDhGJPV3BiGqxEeS43KIP+PTW8
         xq+KubwdvD+TgHzgA+7yLitslTQ1zbr/ubWT2uFTNSRMzTkzcH+fqMlnJZI4F1Ir2NIm
         a61g==
X-Forwarded-Encrypted: i=1; AKwUvBydl5GYomVf1apPJxrU8JriN0qqiQVGMqvlYvr1mlaqqx9Lxrp/8YHeFxa4nume6cH4j6SpvXAsFng=@vger.kernel.org
X-Gm-Message-State: AFuF++nBcJA+5tj2qnsKQrcl1ctS44Lt0pNC8nZrgkiKuPyNTYc4wUGb
	YXdatrYFE5cTyMmr1bUM3z66VwkIwHrravKMrcYBQSh9dma2WX/5bz0t9RPre2zZeWpzqSlxNeu
	p1ye3koBYwMEoOXIzXD7/ZPjpf+X1gYgdrwuN6PsH8Tfbf4bIo3KWBmJiFjRWius=
X-Gm-Gg: AYBFou0UiURmo5C943Rl2UkfsHfl1kAWA0QR/GXlfJFh9TAYf3ChgVFzykP18Rc2xgy
	x1QZL7yOle43/0pK6HOXigM2Ed7Mk1pCfKZ3w1JF/fjSQhmZ+NNqLghXSdw04iIHmTSSKi7hYiP
	TRuoHdPDd1Ig4/+RMPeYsJmEh6+r+OvYp2RYHdDgVqARksg+EjfuYd7g/6XHWCctVpXjjyaH2B2
	Q0uuzSqqK0MxgHXsz4V9H2hD63eOHZnZAAjUfjI5C/PXrekVR8y8d9zTSkalXBcPiKg2Ux0g9Oq
	Tg8OMuLYJMCZUTdp1HGMJ1nqYxXcSQVI/airgZtNactVISjE77qcc3jUDR7Sj+rtS0tXWHA+JTj
	blWx0Z1cJ
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663155785a.10.1789390191434;
        Mon, 14 Sep 2026 05:49:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663151385a.10.1789390190949;
        Mon, 14 Sep 2026 05:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:40 +0300
Subject: [PATCH v4 41/52] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-41-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zzXgeiMIC3PdS9PxtHGEXnZzVRJ4hW+sh2v
 q6/vpB8LbKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8wAKCRAbX0TJAJUV
 VnfgD/9hU0liESyOT9aMS839L4uprrxstPm5r3AgNY5gPQlIkDz9uMdu2WFNuP2XQH4mQlqgu8f
 zgWo0K1fc/hlYtDq/14WDhWtXlHOjN/94/DBuseamNdIrHTQ/bo4jxqpzMX0aa4X87CQJvyD+xV
 3MY9DYSS3GI4JmkoJxO6mQ8xlM7RK8Dp7KpVisa4KEhaCa0iua53tanQt4Jx/W15HyPQu5jJANA
 MQFciJtgWMnkVTV/1pZF8BoE2LMV4ZBbISa5YEOJLMtN0X5nfRgO9BXBFHc7mfStp9joWr6OPq8
 6sug0B4jujS4oc7/tyN2FqFrW5V+muItamJEhvPOTD+uKLBjV/v0Cd9SOwLvMv3LE06vpEcoZRY
 r9BrvHlt0HQz2oZdqO64snM1ZheQnOsdpChffRrJRpok3b37DHqmtLinzwgcohbE6ipC7zgqCVG
 LFGdwaJzCK0XH9UwlaqCuSjViKFWvDGa4P8v22XplU2/VE7Z0xa1HNQlAV5/wYd9buDoCIhbSbi
 avFBwjMURyOrUGZP0BbO35wmzoXy4KphlImqVj/bPsqNpUMwLzIl5dpF9eeCL2GX1wp0sTynvgN
 LNj+RFYohujNU8QlJk7w7IUm/jLNkAdDUPfYg1yqnN6nALCj0ZzwT6LCBC4CQ7TRpTKyVpo+v9U
 aYsptZwId5e9K6Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: U5NEl2_Ec1jrzLEFaBOzJegcLiQB0nzc
X-Proofpoint-ORIG-GUID: U5NEl2_Ec1jrzLEFaBOzJegcLiQB0nzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX3v7U+rdAGTcE
 aXizZSrZTdnnWPhXEqvdQ5UjDdqfr7JcdZI1qfmkvW5j4xpu3NdkNHvWyvJw8GfoQd5/6PtsV+E
 g+LHX6qChwa5bbHioYL/w9PDHvThKQlMUxDslIs7KTjL+XLKS6+q4kaGpP8Xv7P1RiO0NRBNyL0
 P8/CIRSYxKE/IfQYA/QWBNFRdWp4RM4EhmNnzY91W2dQHQxpSKQm7/L5Ccn+0LdVk7xnnYPyPOI
 c5HfS7Z1z9SOjpeVTpxP6tDbohbi5v40ghbzEgGxJ5Ekte97HJPKS3P4wTQhwNIeab5LiIbcRpX
 256JU3gX/VRCjhVuABFjWzk1PiDxO/bbZ7bUIOJ4nqzf3p17MJXi/qmgb2FvVao0Mf9V6JvZd24
 69Mj0K0HnMdhbaIvvLbqgJSjLxXfxtbAEA3zYLmbKbbEbRUqFjr2LM1IHavVmxLcd10AMtgocLH
 Tqaee9OjFaHEvVv3kGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2kwUWBiO1ydS
 1yd+HQplBwkVLr3j/89/p2VAN0vEVUFHsYIfKAbcnw5YjMxpBOoqz7RF5nuExxTta6RVxWcg83W
 fZ5CmwsOuoDwZ808ETpQSwcdwWsh22s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

