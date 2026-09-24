Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392504AE8A3
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266351; cv=none; b=aKnk7OiayfYrRe4pEhsnAxKP/5HAolXs/t2JjdwVrs+7RtFxipdp6wZD+B5Qk1mpyjd0g0aKfa34o41wTUHZpWCs4W3HXAzs76qvSxEcxBFXJrq4B2o+vSNv7oZf7N7U3MfuTlRuccQKUwufyg3nwL72gQXHdIr4oluNflkbw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266351; c=relaxed/simple;
	bh=5zuG5UuS9qh0d8OU0nqDCnaVm1PSJ5zAsjRRiz8X1y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eu416Lb66mAPe53823CIHXetUDQ+Z25t3BqiQ4RHKqr+hh9RjnFG2g/p7m3zSEUp/iH0ZLAXAdIDhae6dSY9oZo4IIsmMoNqnQgGXkB4YWWDoBNs903pMxwZ3fKhZQjof/SxmUfNWpYfU7FiVyYzhfFKxzwwx9fbhJVpqOIh6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOs8ohX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1ItwsFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOs8ohX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1ItwsFk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeDIx2101308
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=netTNOSNf1m
	B9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=; b=QOs8ohX7LM9//DGcmwub4dRv3K7
	3+N4VnmrV2hvdhLu7UrxXuij/QndINHyZifyVNzKTHXMYHbTC7jWpN8GfnbygLjv
	qnW24PhK28JRv3D6L1ff2/KUtz1iU4k/Meg2IgI74MbhwXyuEns//YOsKG6Jkdro
	yDAInmzMDlIf1ThnMkPpzocl91pE47ktOgsRpmJafUaJpZBbAM55XHlwUs2bJ9G3
	TCCjhE+XgUbo0nT04l9s5WE0I1soQZACOR8K38lZHdTPJKnyRb0JK+eCj+yG1F3z
	SBxLVM865A0zsgToiCa77D+CpVMzODbr1+C78te8PIUktJaLRAtCfNDPpSA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e0bg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-895241d7405so43377687b3.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266346; x=1790871146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=Z1ItwsFkkLHK+FQ7AQ3LvyBr6Z4kTVz5NCx5i5qljM12quzj0mKsaeYMeVTiG5Ibz8
         6nhi6SIbYaaTNuYTBeAYUzyQ4DpoRp8xzjJfHzED9rjBh6x/0skZfC5dFvhEVhaTc2QG
         sd7mRkEDvtUdGdOqffuLNXmPsFLm9UvdZSijJJ8lJQ7bGEd+0KIqtvbLhQLyMQagESL7
         vnIWp1xiK/CK727VY6fG79piyaaGUp6kPvdNFPTKFRPum/dKlrIQ9GcQYgIBJe/uT58n
         AH9hNnJKnHXGBfN+C7tHSFQIgrc2hwLV/o/wXK3rcxxNDd58wjDPU3wOM8knKaQT4wxb
         17XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266346; x=1790871146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=2KhuzITmXD8h6CRkBR7t5+v7SqM/Jr9eEMlIile8D22AbhCxNFgsOHNvNUoOFVVjcb
         tBzOohFtfvVORxK10zTMV6t6eJz4BhqgLxjcJEqpZklYNwC1XFVl8p4xJ1yDGf6tlulg
         gOnjZ7fDE8XPBOxHAu0iXZxdB5JHmrCCL3aF1RaDR7klUDT8oLayI/Ly6Vy+2pJqLZYC
         CQBYhrMqDQkW3ClxdGFN5ZIFUgIOU72o787k8XGx0HMGV47YtMyVj6tWte1lW44Ah51Z
         QD01R3LbuI1BdcaJEVGNGTSCnLuMX0bbIc/x6e4TSzAmXzyM4Pi3Dby/r/OkNy7tK/0K
         J+pg==
X-Forwarded-Encrypted: i=1; AKwUvBx47WMcMf6jRxYW9HFgxLo+sJ7FROnwMRn7JFtgAzdXCitncGuNZ5PEh2Uh4JbExkFADkszZnNfWmk=@vger.kernel.org
X-Gm-Message-State: AFuF++ltgXqaulvqWsVbwEx9kOLXTK9cvA/w0I+1SCr3oU/Mwlj2tSzN
	IbE9mytoESKDaGneliXpRafDJRXtvn+lp1L3R48tDncXd5NEyipM5nTddYuI1Zd9veSTUhXHQ0K
	GjHQQ8YE8vqBlnwbFq9PD0ktfJiaEls2NVqiNo6JVmCubJatBNXEdvs7RDkCnIuw=
X-Gm-Gg: AYBFou0ljx4oNtxwhJJvNEb7OP9yYcC5VrXDGe8LT7OU4LKdC40tsEGGo/D9oXDPYdt
	FQvKgIygBVJsD87kpOAAnHlRVUUWUUrLeJo71ov9a2lZnitwzK6Y0Ol1BUlBG0vQjn1nH4cXX6j
	6XFGJ8jp+6OOwk7kaNKwhwtI4SUBWgCHXBkco3P5qQ9YBIpv0DkwTjGndpeW02QmJOqDQ3q4mvn
	JGCdKyeck46BM0R7d+B5Qq7Dl22m1dmRV7LWcNqP1AiAInhM7jPIsHyR6dPwTlKl78NjL6En/sq
	iZ4njLGNYlfNbeXJvXQt9HnyuKZtFq+HGEbnKoJwuLYuFLZ+M9EBDal5FqLlvQNmP53Y1GKjxhH
	uPZVefNM6qkVfMkuAdiYCJmT3BUx3MQelRrYfP78mGl6/dsdWEh6JBWHOgnA=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795587d50.71.1790266346155;
        Thu, 24 Sep 2026 09:12:26 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795554d50.71.1790266345547;
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Fri, 25 Sep 2026 00:11:52 +0800
Message-ID: <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX+R7KX0I3qk/h
 acuyeDz8nUBriJWghsXDEs7gXF0EAEr+txxYtXmyeL6JBsX8uEZCp0oTpeMCdeW8aJbpixfkqb3
 RqVrHBbwHECNsuM3+K08o8QUEJn9X6XZOLUoQcIDVZKdfIoABp9+WsTz6GNYyElV34KOkdyusTE
 a8smcmUXcjP7zIAvewK0FXOSGzPg8ZdiJ+H0lcm5eU8YUm5rQFdZJBsN6IyOVbdNbQq3AwOB3cE
 7lwiBCRIng+xGtwkm9lpSFKaE+zgMduHLrsuGEQ1cdlUxNNzzSzTAZjSFaMsVEL5aahMu8NGUtN
 X7wa/eVHuMjul8dk5nnG6j4be8fwHf5jLICkddVPutO8iEogwp2QDbM6PeREHh7L3zdHrJh80CI
 VS/7xbvoPUpUkeYmmYr7pRHBRm7vQg8SGwmal47BnUuVNfMASIqR5BJwuw7c2eXkQT3R+VosL9x
 a6T/d6Z6m33gcTro8IA==
X-Proofpoint-GUID: mKYPZxGqY4ocJJj_UWvCgQqyzCZu0bDl
X-Proofpoint-ORIG-GUID: mKYPZxGqY4ocJJj_UWvCgQqyzCZu0bDl
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab54beb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dhDJK-fFnsGTkC4caXsA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXwo9a1Wrhaqn5
 y5cEsWQcIMcc/wqgjyM5ZRpDpXfUm3L7Fv5zc/MST63xq+aDoCVHmdDdC2J3wFCxrwNAOiaL/Cw
 VNyOENx5I/2YO8Xm1Y37FsX0D/EWjp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
board XO rather than an AHB clock, and the sleep clock is missing
entirely.

The missing third input leaves video_cc_sleep_clk_src unable to resolve
its parent, so it registers as an orphan clock and cannot be rated.
The AHB phandle in the always-on XO slot is not resolved by the driver
today, but it implies a parent relationship the hardware does not have.

Pass bi_tcxo_ao_div2 and the board sleep clock instead.

Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..e092222fd8cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3117,7 +3117,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

