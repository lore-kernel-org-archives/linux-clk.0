Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5A46EC79
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711722; cv=none; b=K5gtxyBVTuSw2Mm6ZGwLJM0/opdCS+BtMYthget3FtrLFU41ivPLHIHgNBpNGdkZMjiYgN9BdX3uJcPIY5+E6IEkf9vnHct2JhcUjlC4nu557cqWcHsqTgItEheNzGtGqFySHm5eyRghi3yvuznFesDlLAUBVJCLoe4MFvWx+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711722; c=relaxed/simple;
	bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPDUbDa6c1f1adkV5yjwdg7PYKCFRqN5ugutqYBSVeRuXX0dUX4HZasaFtCwxTjglczQNsCaHv9iOacPCs0JWOzQtfyCW0O4SKWTKf23UBdAtQmvED9dfDMDcZ0OiK/UlvT94rmvLMsWFqy0Z/lP/v9Lq+hKFGMNaa5sjPqTLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M33ckUWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT8f8DM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M33ckUWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT8f8DM4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbBh81494597
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=; b=M33ckUWQIXB4ywXs
	WHIleqAWcu+c6E6b822P7IDVX1so3WHsgOq65SWiZMRb2Av0SU6BmacjedCOfK33
	6v9SyrOWg8or4q7NcaaaDanRRFq/SO6H9zzPkv5Z1sK5XfAGYd3ljl6/ARLLEaMp
	dJubHU5GswAPQVzR+r5o8adf8rV8LzpoazOFVVUjb8z0zthCtJtQy1Qi2HxZjPes
	nBzVuNXii5T2oqNyhHBJXLuWfMn5ODUC6A8s4M8gaRZoGea9jH9lNpK8PR4u0aDL
	shdzpbX1r64K434N7TQJVSNFmIER6mf5lbWAX249q3JpnipnzD2vkoxhT3xBgryX
	fYzn0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20gn8qtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so1381047b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711711; x=1787316511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=JT8f8DM4MNyjlEguhoMyNCu4M3ylw/hZOQqIGRDEXGmAmbiksSnoKvZJTawf1d0yfk
         Z4p0N8zlDdruR/0VNInzjqjahNUHvV4zzs5EuPvZeODkUBPLQEzxmc0P53hRXatHmXqu
         DJUZ+sE69hwTZkr9oRgiCLxyh9OLGhuBY175JpdeDNdc8AGCvNwJeoorYkSsBwlysTH9
         IwFCwQP+tVxt6l4//oGjofayRdWopA4gPDbn6H5GxcBTJ/VE0xqy6s38O527gYn8OTDA
         1Qeb+/O2LB8T+Mgu1/PyHhs2XBZ60FRw8/XqHh7t+Ec44T88v67/nFG5Ss+w2Hpkni1J
         pMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711711; x=1787316511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=kptOH1ghLxISwF7/QOR01w0gOqfwxLhvUuJmlso4Mfp68aLTz7hq4ZfeNYLonqKHdn
         z4F8wTiFJ48g6MFXuFSItH2rN9mNiUDkHuAV/c38kFRuJmfk3udT4akVTskwm/5vA8tz
         kqz6yswsS0rBdYCfvUjPVtEaOooLYKkem3CiBCmcgzkqj7jfFMPVeYxw0H0i0zATJ5fo
         XYZgXE2NinQTrHuNdKZk1Gu/v792YhjzpuAuBrP8BCOt06Y2jwCDbJgpbw76gYIPj/BY
         qXDBBnNPcXyXXM6uztUS64YUmCZCgFY87NZwGlW2L5QX1TBdzCJnsinVcRK9X5I/DxKd
         yg2w==
X-Forwarded-Encrypted: i=1; AHgh+Rpypl3GLvE3Ns+3cea4fGggsg8NW1y+HDCTASY1QI8snldNddpT2f596Ma2+S9E7E3yxuB5Got/7/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHpxquBjLbV4GslqwRBVVLUvn/ClW1WQ01XjRoQJokK1J4Wnv0
	tTOV8TfMaeROA2oImi7vTmen6yww9JjoF+EX0/mbbIy2Q/TTL/kVu3SsPXdV2VXBa+Y8utrUdPS
	5eLmqEhrkRKOyc8fhW+avmeBDl8GHghGxoiMCw1B+F6K3/m5HHgYIWxPqUUozbCQ=
X-Gm-Gg: AR+sD13u2YgNZqvcbVlHnyPBG3Yjpvl0qye6ulwK9OnHGrtIEvNbEqn8YAtpE+PrCQL
	L3GIRKgn5nH2N1C0lQKFPpdN8WbAqMuscNCdBGML0T5nmw35KrHbbGuzSYAF/mq6HT1OugjQTMs
	9JRhiTOzA0+DsB7ASX5ErjK5tyqkyghaHaqYT/Pohy6EmvnWBWGJz2eV7bbyLm8xlB9Oemq8btB
	LX+b+Qn+J5dHnDQb+YCCIw1KIPoVR3sKGIIqNY5nUMHHDd5078eshqICokQiPy3GZidVAo6Zw/9
	Ku0mzP2SuElyXsXg3jnzd9IPHKMzXs6IbMEmxg09Gg1cf6Il427YI/ct4oGfLHnQ+NQMZvGK8k1
	YJFKcvrD8ZDMKgympXXydWKufUrW4IPOkrQmZ84v1rzQ=
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587068b3a.7.1786711711123;
        Fri, 14 Aug 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587019b3a.7.1786711710697;
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:22 -0700
Subject: [PATCH v3 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-12-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
 b=GoHKPlU3bC0W9TMzVKcDfRktV9jgV4Cilkf9AMRArxgujJcqHehLBQHiUjtBmT+6x0WWUK3+X
 /f+799d2sS7BjMswFR47ZyxQuzjkRukDxml+yp5khWw9wsZUJoCYv//
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX/ppxTTqjSDeH
 XiAACDuYuX5F4hDnK1tEe/Ii8lGQoj4Ua5oKbGOCNFVqOZdJWI9Nn98efICVZbzawJL1dvBY8VI
 2k3yCFFnxuAGWs/FJ6lkCu/GZzikcZwLMt81pk03wmTjf1pF0DcFOBzs/FtZdtGmJT3HS+5DeXE
 BxbXAjMwQ0xIkJLakri7rNjyjwMQd3knpEY4qsehw/6/SjwkkcGEnkXFD2LTFur+uQRx+nXQGyf
 rHFumR/OPW37vP8t8dzZrUk3k8VCToKUreSEbOzcQ1ajNY3rrFYesqUkDNfHDxuOxLP/OAg0hzw
 EsDYelTtkoVh2jZ10wTDfEwRPH5RKWThMVx9izHnFK09FWsJ+I76DrbnU9q58VpH5yNX3P1CS4D
 ryBn/yF2mkyOLDSQOwsTInkJv9rN+8hOoYa0ua9dB1U0FmebmO1FrQEndEYrwIbEYXAidqnXqWD
 YcWpVvMrhncRmdxtbhg==
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=6a7f0ea0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX8un5lQVbosoN
 QLCLWM+uwf1E73sWv5uZ/hgMHNvfe1U/Q/Gi8Wyq0SpsSu3QKnLdVFPLWGiejNENemkzJE8bR0K
 IQjYomCufTdxPJ6Z94f5XYbYH6JpOOU=
X-Proofpoint-GUID: eW4b_I4VFZL_0KI3uRrYlbyWSFfDVKzK
X-Proofpoint-ORIG-GUID: eW4b_I4VFZL_0KI3uRrYlbyWSFfDVKzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

