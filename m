Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550547;
	b=QnII3OCGLEgwnDxivtWZqYgKrFfJbVTm3BPQ5HQVZ7SktAxWzZs+G9zD1Fbv1WigPr5Z
	 IO4vAradFhzCpsVCax7PgIcCYb4aErNWMRopxNLwPz2xjbU4Hj0KkBX92Upsg2KUvHuWT
	 RkxdwaXlb4GIJLDUVf3syQ+KhksR/5bfvDkGUrmyVbLNGiEVwJG3e+eitLafX2t4LLF2N
	 CRUBEgpZb/CZ0Y/C2i+qd+V3lJVVi53P4pqzvWWSWSVN5pbd/UwlqoJFb9C+/nR4H7SZc
	 8urJsxh2oPTJiUX627IKFQKszXev/MnphOwrGCQ91rLo+mLx/xykJwQsB7Dh+2ATXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/wXJeZNVAOYYRm8R2Ve2wFXbEmiyPmI9qNamSKr18A=;
	b=O5Oi1huSLRmmw2/jTc23nGEM62VH2PWM314MBjFLy5IlmlV4FBHewt95UUJVlY9atehD
	 /pSlMbmsjC4bGTh3SB40M7o/c7jGZJ4Mv5q5LKEVUuwVa/HkTtB/lA/owb/pINeqV9a48
	 LGuyd0UDxdLPP156h49USeiDogZu/dfKtM8rs4R7LbK3+lz7UFgrl6nI0DjShVY3IBDxb
	 8W3ZrOV0G1rZMIlG8zGv26VF/fwhVDdOYHKAoYDGppf0PfXdFI8DsUvwE1raKWweQf+J5
	 S2uYBazg5+aMD2PNLTjregPOVhICinJUId2J1XKbTh7JpC+ifcl/wq4+yUzWrmhx0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L6YKxZ7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvKL2zWf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243E606A684
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3243E606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L6YKxZ7q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvKL2zWf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXYe22132745
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/wXJeZNVAOYYRm8R2Ve2wFXbEmiyPmI9qNamSKr18A=; b=L6YKxZ7qMHvyM98B
	2zQuIipkXTT0YlEvABB7sgC9TNu87FJ35a7TeJzNPzkg3wSocfhKdpzzKCNQu9E2
	sH4PnJeAj5fjL9mVkmeDE7fDVZxy5Mk6tOwKQU9ROP+KxqQMDCcHj/6wIl3+KLwX
	fkO+q98f6ZQef+lLYtOCi9b50Z0+UTIsqBUJi6yQI2KwC1vF+wJPsKH9MCzzqkG/
	8TVjAJq+Dkyo6qdegsLPopra95HL8C5XLcj13FBlEj1j+JM9SuZgP+mtImXZwdes
	ys3KM2Zikz99wkK89Rkl0Oysm5Vafpy6cw3jVIcCHelzwjF0vRjMbPfp6zcDcGNt
	bfcL0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801ynh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-339628f2bbaso514155eec.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550545; x=1796155345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/wXJeZNVAOYYRm8R2Ve2wFXbEmiyPmI9qNamSKr18A=;
        b=bvKL2zWfykdJFRbvSUrE0uKsi1NUScr2YfbpOl+LZk2yCO4BAkOwnX/7if/dS/4R3N
         F+QeCe5Ur98KxnNqNdpBdW1smbP0krPZqWCrfVsP3tzZC424PZcInLYTEqQ1fT7fAANu
         FvauyFwPf0ScfpWNErbhxO1jzettovmEcCTEEis8cChKGFVjlXWNb5kyIF1ctVg7sqdf
         jo3hcJxLldS94ZEEr9fiuRnbiOLTu29PrF0IHbNCkKOZXG5V+Ra84rfUDiNhmVAIztf9
         aLlXcRET24v2OOC6SPyur0zfov928mF9Wvr5/e110cD9Nepe5cof++iawGo+196df3dz
         VZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550545; x=1796155345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/wXJeZNVAOYYRm8R2Ve2wFXbEmiyPmI9qNamSKr18A=;
        b=P4Qvv0MCgCYyPvacSzBRXND70hyQzIvneioXXxaKO/CXWcwZkfMSXDhVLWeqzPDx30
         eeW+k93X0HFp4yjolZI3Vp9SrH3D/9mxK2SzcEW4F6i20zTpxYl4bNq7gL6/rMVZFlhP
         cA+yU0xVDTAq+yUSXt62KtSt4mFO2vKRi0Pn/wfwVtwO93vuI9eNsoqL6WWo7uBbTIkp
         l6OcSGtU8zKaqj75hfPT5VEhJa8Bfa2WT1OEiIAO9MUHKSDmhFEVJ69qQdF67MsqoZWP
         vmGF53gCxvrN3dHPv2gefZU9QWpW5zcHQLnGaqxu5Zj49R7/xHkzlEk+34Bjn7SmCsUD
         FyzA==
X-Forwarded-Encrypted: i=1; AL+hErEJazKDzhAtNJcPW7HrDQlwtzvb/g2oz99Cj3cWpnN5GP9DQX58To+3xBXpGRrqsqA2htNuG7WjjIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PA0cLe+f1leY8vQJ7DyIs5UN4T74mswvCgj4noe10r0w2gd1n
	SsDec/TDni3T0X5BHRTJPhGzAiBcUnFaw45Z0S75n0Jr5lv7oRaSiXmUQN7/zxYUBclw/0/rAOH
	PxK3kXFXAMy1gnuPWohdapkpCpi+8CbdWQaB9YlORimYXkGYbjJHMO9T5b9UbjSk=
X-Gm-Gg: AZFdTZer6sD5vWuTmQsBAfyLgy4aMeeZ60ILwJ9e/nsmlqBXVddtGeAWDwsIBZ4Cimz
	QLdQkL1H4zAdUr9D5BP53PYLGUVDxr+mxfQZlCA1vBFzQiuqwuDGaqf7EvTw5nWDyj10d2XyR8/
	47swijMdDHHx0KWOfE6RrGbK+XKC9+Z3xAPGmDOMeJE4T5PhND5l5ErgQFeIJ1KvlXZ2ipynGmz
	4QGTgpYzeIrNu6Ye+2Uzxlsz5tzLEtAbjfIENCAibQ8KDYqr+7Y1AIcpBWrWHXqlmk1gDAWDeIk
	0r18l6Pzx0i7S8rwFXuXc7EtxH7NuMbHTRUpO8o1Uy2KyhKeuEBEPDh3xGI01iksbPSh88Do1qu
	koWcDIu0hwsaT2Fz47+kYV/Hawoobzxefg4b2VVIwI2uthXvFsVxDLqS+q5K6oUHxA2f84rO5TL
	o1uJ01uU8=
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr14115499eec.0.1795550544389;
        Tue, 24 Nov 2026 12:02:24 -0800 (PST)
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr14115435eec.0.1795550543580;
        Tue, 24 Nov 2026 12:02:23 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:22 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:43 +0100
Subject: [PATCH RFC DNM 14/15] arm64: dts: qcom: glymur: Add USB4 topology
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-14-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=24049;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=cl/ALfI3gGu5z7Hi8Mz6CKJHVhwpF8ss1WbOmivULfg=;
 b=I5EyY74ZWXkAxLojqTb0pwqfoGaGvDGtOtj0ZZJsABfc8NioKuhibSvGZiKlnGDwvUBuYzGD6
 Y6jmAsTsy04DDWNTowW6+fUswDD98xER9IRl4inzzcrMlPwhSEmnjSk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX4zpHVNLEde2i
 aHVFXh3LsOnD97TY6LHGa7Kiiooyt1IgeTvM2iVO7eUgoArpf1PmUO3lA2cG+me3D6+fziiIsmO
 U117DGq0NQ5SPTRjUIzIM8q7SUOH4J3AVKZrLKzAYM1LRzyw4Yxc/y8jDkqRUnkBC9zmWFYtGDb
 ptUkfs1tweUJKBv9ryRAJXfycplGyDqluVpoPPwGEFCsvreEGHx5HAIPGXbR1p4YPT22fB0UTjD
 G9n8Ecc67MkQuA/CDAX4iMQlYhQ/wzBy+/7aB8sg/QN9FojD+TY54/f030FuHiBtWMFau7pJsFQ
 67buZMc/zYIXpy15HIsMLH8BuEYlm5Qd9mWJsYhyaIS1qHT0pcHd9dQU3mHHA9FIy/afJlAny6B
 l2frTSS2pIMXsJhPPQ0j4TGfXqVlPGN1mQ7DzdQQ4xkg0xaqr4l8oSnI5JmqocIP5JeEo0s3V70
 6JdfhrDwuFAzyvNG+dw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KMBUdirV3swVDM72wxkA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: iWxA89fGVqtizdWFpCGEOhh4wkqKHz7u
X-Proofpoint-GUID: iWxA89fGVqtizdWFpCGEOhh4wkqKHz7u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyHtUUlSQJGnO
 3rkHprQSSY8q2dAhl0R/f6mnBzmlWV5/YXQyjPffLlAzAwrqi46wDnhzh1crX9RzzIreO4x2Kbn
 jtjoEzFY+ztm2HRI7jTdC0Bu24uNdwQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Describe the USB4 PHY clocks, router, Type-C endpoints, PCIe tunnel
host interface, and tunneled DisplayPort resources on Glymur and the CRD.

Includes some work by Wesley Cheng.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  29 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 703 ++++++++++++++++++++++++++++++-
 2 files changed, 724 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b8629cba176f7beb1efce4aa9507d..53f134878b1934e8627678dd1d3b8b73ec91f308 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -87,13 +87,21 @@ pmic_glink_hs_in: endpoint {
 					};
 				};
 
-				port@1 {
-					reg = <1>;
+				port@2 {
+					reg = <2>;
 
 					pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_0_qmpphy_out>;
 					};
 				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_usb4_in: endpoint {
+						remote-endpoint = <&usb4_0_mode_in>;
+					};
+				};
 			};
 		};
 
@@ -122,6 +130,14 @@ pmic_glink_ss_in1: endpoint {
 						remote-endpoint = <&usb_1_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_usb4_in1: endpoint {
+						remote-endpoint = <&usb4_1_mode_in>;
+					};
+				};
 			};
 		};
 	};
@@ -974,6 +990,7 @@ wwan_reg_en: wwan-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
 };
 
 &uart14 {
@@ -993,6 +1010,14 @@ bluetooth {
 	};
 };
 
+&usb4_0_mode_in {
+	remote-endpoint = <&pmic_glink_usb4_in>;
+};
+
+&usb4_1_mode_in {
+	remote-endpoint = <&pmic_glink_usb4_in1>;
+};
+
 &usb_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 419d57171b56a7f21c68481c53cabd6a609bac93..e8f5a3132487e9e4e187bca8fdc7fc039beb4d42 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2572,11 +2572,13 @@ usb_0_qmpphy: phy@fd5000 {
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_0_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
@@ -2645,11 +2647,13 @@ usb_1_qmpphy: phy@fde000 {
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
 				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_1_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
 
@@ -4882,11 +4886,13 @@ usb_2_qmpphy: phy@88e1000 {
 			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
 				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_2_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
 
@@ -4984,6 +4990,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "usb2-phy",
 				    "usb3-phy";
 
+			usb4-host-interface = <&usb4_router0>;
+
 			snps,hird-threshold = /bits/ 8 <0x0>;
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
@@ -5075,6 +5083,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "usb2-phy",
 				    "usb3-phy";
 
+			usb4-host-interface = <&usb4_router1>;
+
 			snps,hird-threshold = /bits/ 8 <0x0>;
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
@@ -5166,6 +5176,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "usb2-phy",
 				    "usb3-phy";
 
+			usb4-host-interface = <&usb4_router2>;
+
 			snps,hird-threshold = /bits/ 8 <0x0>;
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
@@ -6755,6 +6767,102 @@ rx-pins {
 				};
 			};
 
+			usb4_0_sbrx_active: usb4-0-sbrx-active-state {
+				pins = "gpio163";
+				function = "usb0_sbrx";
+				drive-strength = <10>;
+				output-disable;
+				input-enable;
+				bias-disable;
+			};
+
+			usb4_0_sbrx_reset: usb4-0-sbrx-reset-state {
+				pins = "gpio163";
+				function = "gpio";
+				drive-strength = <10>;
+				bias-pull-down;
+				output-disable;
+			};
+
+			usb4_0_sbtx_active: usb4-0-sbtx-active-state {
+				pins = "gpio164";
+				function = "usb0_sbtx";
+				drive-strength = <10>;
+				bias-pull-up;
+				output-disable;
+			};
+
+			usb4_0_sbtx_reset: usb4-0-sbtx-reset-state {
+				pins = "gpio164";
+				function = "gpio";
+				drive-strength = <10>;
+				output-low;
+			};
+
+			usb4_1_sbrx_active: usb4-1-sbrx-active-state {
+				pins = "gpio172";
+				function = "usb1_sbrx";
+				drive-strength = <10>;
+				output-disable;
+				input-enable;
+				bias-disable;
+			};
+
+			usb4_1_sbrx_reset: usb4-1-sbrx-reset-state {
+				pins = "gpio172";
+				function = "gpio";
+				drive-strength = <10>;
+				bias-pull-down;
+				output-disable;
+			};
+
+			usb4_1_sbtx_active: usb4-1-sbtx-active-state {
+				pins = "gpio173";
+				function = "usb1_sbtx";
+				drive-strength = <10>;
+				bias-pull-up;
+				output-disable;
+			};
+
+			usb4_1_sbtx_reset: usb4-1-sbtx-reset-state {
+				pins = "gpio173";
+				function = "gpio";
+				drive-strength = <10>;
+				output-low;
+			};
+
+			usb4_2_sbrx_active: usb4-2-sbrx-active-state {
+				pins = "gpio181";
+				function = "usb2_sbrx";
+				drive-strength = <10>;
+				output-disable;
+				input-enable;
+				bias-disable;
+			};
+
+			usb4_2_sbrx_reset: usb4-2-sbrx-reset-state {
+				pins = "gpio181";
+				function = "gpio";
+				drive-strength = <10>;
+				bias-pull-down;
+				output-disable;
+			};
+
+			usb4_2_sbtx_active: usb4-2-sbtx-active-state {
+				pins = "gpio182";
+				function = "usb2_sbtx";
+				drive-strength = <10>;
+				bias-pull-up;
+				output-disable;
+			};
+
+			usb4_2_sbtx_reset: usb4-2-sbtx-reset-state {
+				pins = "gpio182";
+				function = "gpio";
+				drive-strength = <10>;
+				output-low;
+			};
+
 			sdc2_default_state: sdc2-default-state {
 				clk-pins {
 					pins = "sdc2_clk";
@@ -8650,6 +8758,589 @@ cpu_scp_lpri1: scp-sram-section@180 {
 				reg = <0x180 0x180>;
 			};
 		};
+
+		usb4_router0: usb4-router@15600000 {
+			compatible = "qcom,glymur-usb4-hr";
+			reg = <0x0 0x15600000 0x0 0x70>,
+			      <0x0 0x15600070 0x0 0x500>,
+			      <0x0 0x15601000 0x0 0x1000>,
+			      <0x0 0x15602000 0x0 0x1000>,
+			      <0x0 0x15603000 0x0 0x1000>,
+			      <0x0 0x15604000 0x0 0x1000>,
+			      <0x0 0x15605000 0x0 0x1000>,
+			      <0x0 0x15606000 0x0 0x400>,
+			      <0x0 0x15606400 0x0 0xc00>,
+			      <0x0 0x15607000 0x0 0x400>,
+			      <0x0 0x15607400 0x0 0xc00>,
+			      <0x0 0x15608000 0x0 0x70>,
+			      <0x0 0x15608070 0x0 0x500>,
+			      <0x0 0x15609000 0x0 0x4000>,
+			      <0x0 0x1560d000 0x0 0x1000>,
+			      <0x0 0x1560e000 0x0 0x1000>,
+			      <0x0 0x1560f000 0x0 0x1000>,
+			      <0x0 0x15610000 0x0 0x800>,
+			      <0x0 0x15610800 0x0 0x800>,
+			      <0x0 0x15611000 0x0 0x1000>,
+			      <0x0 0x15612000 0x0 0x1000>,
+			      <0x0 0x15613000 0x0 0xe000>,
+			      <0x0 0x15621000 0x0 0x2000>,
+			      <0x0 0x15623000 0x0 0x2000>,
+			      <0x0 0x1563f000 0x0 0x40000>,
+			      <0x0 0x1567f000 0x0 0x1000>,
+			      <0x0 0x15680000 0x0 0x1000>,
+			      <0x0 0x15681000 0x0 0x1000>,
+			      <0x0 0x15682000 0x0 0x1000>;
+			reg-names = "router_cs",
+				    "tmu_cs",
+				    "hia_cs",
+				    "lane0_cs",
+				    "lane1_cs",
+				    "pcie_cs",
+				    "usb_cs",
+				    "dpin0_cs",
+				    "dpin0_path_cs",
+				    "dpin1_cs",
+				    "dpin1_path_cs",
+				    "router_cfg",
+				    "tmu_cfg",
+				    "hia",
+				    "port_group",
+				    "pcie",
+				    "usb",
+				    "cp",
+				    "cp_ram",
+				    "msgbus",
+				    "sideband",
+				    "uc_ram",
+				    "uc_per",
+				    "uc_mbox",
+				    "nhi",
+				    "cfg",
+				    "debug",
+				    "usb_cfg",
+				    "pcie_cfg";
+
+			interrupts-extended = <&intc GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 91 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ring_data",
+					  "ring_ctrl",
+					  "fw",
+					  "pcieap",
+					  "clx_exit",
+					  "wake";
+
+			clocks = <&gcc GCC_USB4_0_MASTER_CLK>,
+				 <&gcc GCC_USB4_0_TMU_CLK>,
+				 <&gcc GCC_USB4_0_CFG_AHB_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_USB4_0_SB_IF_CLK>,
+				 <&gcc GCC_USB4_0_SYS_CLK>,
+				 <&gcc GCC_USB4_0_PHY_RX0_CLK>,
+				 <&gcc GCC_USB4_0_PHY_RX1_CLK>,
+				 <&gcc GCC_USB4_0_DP0_CLK>,
+				 <&gcc GCC_USB4_0_DP1_CLK>,
+				 <&gcc GCC_USB4_0_PHY_PCIE_PIPE_CLK>,
+				 <&gcc GCC_USB4_0_PHY_USB_PIPE_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_USB4_0_UC_HRR_CLK>;
+			clock-names = "master",
+				      "tmu",
+				      "ahb",
+				      "axi",
+				      "sb",
+				      "sys",
+				      "phy_rx0",
+				      "phy_rx1",
+				      "dp0",
+				      "dp1",
+				      "pcie_pipe",
+				      "usb_pipe",
+				      "noc_aggr_south",
+				      "noc_sys",
+				      "hrr";
+
+			assigned-clocks = <&gcc GCC_USB4_0_TMU_CLK>;
+			assigned-clock-rates = <250000000>;
+
+			resets = <&gcc GCC_USB4_0_BCR>,
+				 <&gcc GCC_USB4_0_MISC_USB4_SYS_BCR>,
+				 <&gcc GCC_USB4_0_MISC_RX_CLK_0_BCR>,
+				 <&gcc GCC_USB4_0_MISC_RX_CLK_1_BCR>,
+				 <&gcc GCC_USB4_0_MISC_USB_PIPE_BCR>,
+				 <&gcc GCC_USB4_0_MISC_PCIE_PIPE_BCR>,
+				 <&gcc GCC_USB4_0_MISC_TMU_BCR>,
+				 <&gcc GCC_USB4_0_MISC_SB_IF_BCR>,
+				 <&gcc GCC_USB4_0_MISC_HIA_MSTR_BCR>,
+				 <&gcc GCC_USB4_0_MISC_AHB_BCR>,
+				 <&gcc GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_0_MISC_HRR_BCR>;
+			reset-names = "core",
+				      "sys",
+				      "rx0",
+				      "rx1",
+				      "usb_pipe",
+				      "pcie_pipe",
+				      "tmu",
+				      "sideband_iface",
+				      "hia_master",
+				      "ahb",
+				      "dp0",
+				      "dp1",
+				      "hrr";
+
+			power-domains = <&gcc GCC_USB4_0_GDSC>,
+					<&gcc GCC_PCIE_0_TUNNEL_GDSC>;
+			power-domain-names = "usb4",
+					     "pcie";
+
+			phys = <&usb_0_qmpphy QMP_USB43DP_USB4_PHY>;
+			phy-names = "usb4";
+			iommus = <&apps_smmu 0x1440 0x0>;
+			pinctrl-0 = <&usb4_0_sbrx_active>, <&usb4_0_sbtx_active>;
+			pinctrl-1 = <&usb4_0_sbrx_reset>, <&usb4_0_sbtx_reset>;
+			pinctrl-names = "default", "reset";
+			#reset-cells = <1>;
+
+			interconnects = <&aggre4_noc MASTER_USB4_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB4_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb4-ddr",
+					     "apps-usb4";
+
+			operating-points-v2 = <&usb4_opp_table>;
+			orientation-switch;
+			mode-switch;
+
+			firmware-name = "qcom/glymur/usb4.bin";
+
+			tx-equalization-presets = /bits/ 64 <0x5ce7>;
+
+			qcom,usb4-mode-sel = <&tcsr 0xb004 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb4_0_mode_in: endpoint {
+					};
+				};
+
+			};
+
+			usb4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* Gen3 */
+				opp-355333500 {
+					opp-hz = /bits/ 64 <355333500>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5000000 1>;
+					opp-level = <3>;
+				};
+
+				/* Gen2 */
+				opp-177666750 {
+					opp-hz = /bits/ 64 <177666750>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <2500000 1>;
+					opp-level = <2>;
+				};
+			};
+		};
+
+		usb4_router1: usb4-router@15800000 {
+			compatible = "qcom,glymur-usb4-hr";
+			reg = <0x0 0x15800000 0x0 0x70>,
+			      <0x0 0x15800070 0x0 0x500>,
+			      <0x0 0x15801000 0x0 0x1000>,
+			      <0x0 0x15802000 0x0 0x1000>,
+			      <0x0 0x15803000 0x0 0x1000>,
+			      <0x0 0x15804000 0x0 0x1000>,
+			      <0x0 0x15805000 0x0 0x1000>,
+			      <0x0 0x15806000 0x0 0x400>,
+			      <0x0 0x15806400 0x0 0xc00>,
+			      <0x0 0x15807000 0x0 0x400>,
+			      <0x0 0x15807400 0x0 0xc00>,
+			      <0x0 0x15808000 0x0 0x70>,
+			      <0x0 0x15808070 0x0 0x500>,
+			      <0x0 0x15809000 0x0 0x4000>,
+			      <0x0 0x1580d000 0x0 0x1000>,
+			      <0x0 0x1580e000 0x0 0x1000>,
+			      <0x0 0x1580f000 0x0 0x1000>,
+			      <0x0 0x15810000 0x0 0x800>,
+			      <0x0 0x15810800 0x0 0x800>,
+			      <0x0 0x15811000 0x0 0x1000>,
+			      <0x0 0x15812000 0x0 0x1000>,
+			      <0x0 0x1581e000 0x0 0x10000>,
+			      <0x0 0x15813000 0x0 0x2000>,
+			      <0x0 0x15815000 0x0 0x1000>,
+			      <0x0 0x1583f000 0x0 0x39898>,
+			      <0x0 0x1587f000 0x0 0x1000>,
+			      <0x0 0x15880000 0x0 0x1000>,
+			      <0x0 0x15881000 0x0 0x1000>,
+			      <0x0 0x15882000 0x0 0x1000>;
+			reg-names = "router_cs",
+				    "tmu_cs",
+				    "hia_cs",
+				    "lane0_cs",
+				    "lane1_cs",
+				    "pcie_cs",
+				    "usb_cs",
+				    "dpin0_cs",
+				    "dpin0_path_cs",
+				    "dpin1_cs",
+				    "dpin1_path_cs",
+				    "router_cfg",
+				    "tmu_cfg",
+				    "hia",
+				    "port_group",
+				    "pcie",
+				    "usb",
+				    "cp",
+				    "cp_ram",
+				    "msgbus",
+				    "sideband",
+				    "uc_ram",
+				    "uc_per",
+				    "uc_mbox",
+				    "nhi",
+				    "cfg",
+				    "debug",
+				    "usb_cfg",
+				    "pcie_cfg";
+
+			interrupts-extended = <&intc GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 80 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ring_data",
+					  "ring_ctrl",
+					  "fw",
+					  "pcieap",
+					  "clx_exit",
+					  "wake";
+
+			clocks = <&gcc GCC_USB4_1_MASTER_CLK>,
+				 <&gcc GCC_USB4_1_TMU_CLK>,
+				 <&gcc GCC_USB4_1_CFG_AHB_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_USB4_1_SB_IF_CLK>,
+				 <&gcc GCC_USB4_1_SYS_CLK>,
+				 <&gcc GCC_USB4_1_PHY_RX0_CLK>,
+				 <&gcc GCC_USB4_1_PHY_RX1_CLK>,
+				 <&gcc GCC_USB4_1_DP0_CLK>,
+				 <&gcc GCC_USB4_1_DP1_CLK>,
+				 <&gcc GCC_USB4_1_PHY_PCIE_PIPE_CLK>,
+				 <&gcc GCC_USB4_1_PHY_USB_PIPE_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_USB4_1_UC_HRR_CLK>;
+			clock-names = "master",
+				      "tmu",
+				      "ahb",
+				      "axi",
+				      "sb",
+				      "sys",
+				      "phy_rx0",
+				      "phy_rx1",
+				      "dp0",
+				      "dp1",
+				      "pcie_pipe",
+				      "usb_pipe",
+				      "noc_aggr_south",
+				      "noc_sys",
+				      "hrr";
+
+			assigned-clocks = <&gcc GCC_USB4_1_TMU_CLK>;
+			assigned-clock-rates = <250000000>;
+
+			resets = <&gcc GCC_USB4_1_BCR>,
+				 <&gcc GCC_USB4_1_MISC_USB4_SYS_BCR>,
+				 <&gcc GCC_USB4_1_MISC_RX_CLK_0_BCR>,
+				 <&gcc GCC_USB4_1_MISC_RX_CLK_1_BCR>,
+				 <&gcc GCC_USB4_1_MISC_USB_PIPE_BCR>,
+				 <&gcc GCC_USB4_1_MISC_PCIE_PIPE_BCR>,
+				 <&gcc GCC_USB4_1_MISC_TMU_BCR>,
+				 <&gcc GCC_USB4_1_MISC_SB_IF_BCR>,
+				 <&gcc GCC_USB4_1_MISC_HIA_MSTR_BCR>,
+				 <&gcc GCC_USB4_1_MISC_AHB_BCR>,
+				 <&gcc GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_1_MISC_HRR_BCR>;
+			reset-names = "core",
+				      "sys",
+				      "rx0",
+				      "rx1",
+				      "usb_pipe",
+				      "pcie_pipe",
+				      "tmu",
+				      "sideband_iface",
+				      "hia_master",
+				      "ahb",
+				      "dp0",
+				      "dp1",
+				      "hrr";
+
+			power-domains = <&gcc GCC_USB4_1_GDSC>,
+					<&gcc GCC_PCIE_1_TUNNEL_GDSC>;
+			power-domain-names = "usb4",
+					     "pcie";
+
+			phys = <&usb_1_qmpphy QMP_USB43DP_USB4_PHY>;
+			phy-names = "usb4";
+			iommus = <&apps_smmu 0x1600 0x0>;
+			pinctrl-0 = <&usb4_1_sbrx_active>, <&usb4_1_sbtx_active>;
+			pinctrl-1 = <&usb4_1_sbrx_reset>, <&usb4_1_sbtx_reset>;
+			pinctrl-names = "default", "reset";
+			#reset-cells = <1>;
+
+			interconnects = <&aggre4_noc MASTER_USB4_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB4_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb4-ddr",
+					     "apps-usb4";
+
+			operating-points-v2 = <&usb4_v2_opp_table>;
+			orientation-switch;
+			mode-switch;
+
+			firmware-name = "qcom/glymur/usb4_v2.bin";
+
+			tx-equalization-presets = /bits/ 64 <0x5ce7>;
+
+			qcom,usb4-mode-sel = <&tcsr 0xb004 1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb4_1_mode_in: endpoint {
+					};
+				};
+			};
+
+			usb4_v2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* Gen4 */
+				opp-355333500-gen4 {
+					opp-hz = /bits/ 64 <355333500>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <10000000 1>;
+					opp-level = <4>;
+				};
+
+				/* Gen3 */
+				opp-355333500 {
+					opp-hz = /bits/ 64 <355333500>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5000000 1>;
+					opp-level = <3>;
+				};
+
+				/* Gen2 */
+				opp-177666750 {
+					opp-hz = /bits/ 64 <177666750>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <2500000 1>;
+					opp-level = <2>;
+				};
+			};
+		};
+
+		usb4_router2: usb4-router@15700000 {
+			compatible = "qcom,glymur-usb4-hr";
+			reg = <0x0 0x15700000 0x0 0x70>,
+			      <0x0 0x15700070 0x0 0x500>,
+			      <0x0 0x15701000 0x0 0x1000>,
+			      <0x0 0x15702000 0x0 0x1000>,
+			      <0x0 0x15703000 0x0 0x1000>,
+			      <0x0 0x15704000 0x0 0x1000>,
+			      <0x0 0x15705000 0x0 0x1000>,
+			      <0x0 0x15706000 0x0 0x400>,
+			      <0x0 0x15706400 0x0 0xc00>,
+			      <0x0 0x15707000 0x0 0x400>,
+			      <0x0 0x15707400 0x0 0xc00>,
+			      <0x0 0x15708000 0x0 0x70>,
+			      <0x0 0x15708070 0x0 0x500>,
+			      <0x0 0x15709000 0x0 0x4000>,
+			      <0x0 0x1570d000 0x0 0x1000>,
+			      <0x0 0x1570e000 0x0 0x1000>,
+			      <0x0 0x1570f000 0x0 0x1000>,
+			      <0x0 0x15710000 0x0 0x800>,
+			      <0x0 0x15710800 0x0 0x800>,
+			      <0x0 0x15711000 0x0 0x1000>,
+			      <0x0 0x15712000 0x0 0x1000>,
+			      <0x0 0x15713000 0x0 0xe000>,
+			      <0x0 0x15721000 0x0 0x2000>,
+			      <0x0 0x15723000 0x0 0x2000>,
+			      <0x0 0x1573f000 0x0 0x40000>,
+			      <0x0 0x1577f000 0x0 0x1000>,
+			      <0x0 0x15780000 0x0 0x1000>,
+			      <0x0 0x15781000 0x0 0x1000>,
+			      <0x0 0x15782000 0x0 0x1000>;
+			reg-names = "router_cs",
+				    "tmu_cs",
+				    "hia_cs",
+				    "lane0_cs",
+				    "lane1_cs",
+				    "pcie_cs",
+				    "usb_cs",
+				    "dpin0_cs",
+				    "dpin0_path_cs",
+				    "dpin1_cs",
+				    "dpin1_path_cs",
+				    "router_cfg",
+				    "tmu_cfg",
+				    "hia",
+				    "port_group",
+				    "pcie",
+				    "usb",
+				    "cp",
+				    "cp_ram",
+				    "msgbus",
+				    "sideband",
+				    "uc_ram",
+				    "uc_per",
+				    "uc_mbox",
+				    "nhi",
+				    "cfg",
+				    "debug",
+				    "usb_cfg",
+				    "pcie_cfg";
+
+			interrupts-extended = <&intc GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 79 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ring_data",
+					  "ring_ctrl",
+					  "fw",
+					  "pcieap",
+					  "clx_exit",
+					  "wake";
+
+			clocks = <&gcc GCC_USB4_2_MASTER_CLK>,
+				 <&gcc GCC_USB4_2_TMU_CLK>,
+				 <&gcc GCC_USB4_2_CFG_AHB_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>,
+				 <&gcc GCC_USB4_2_SB_IF_CLK>,
+				 <&gcc GCC_USB4_2_SYS_CLK>,
+				 <&gcc GCC_USB4_2_PHY_RX0_CLK>,
+				 <&gcc GCC_USB4_2_PHY_RX1_CLK>,
+				 <&gcc GCC_USB4_2_DP0_CLK>,
+				 <&gcc GCC_USB4_2_DP1_CLK>,
+				 <&gcc GCC_USB4_2_PHY_PCIE_PIPE_CLK>,
+				 <&gcc GCC_USB4_2_PHY_USB_PIPE_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_USB4_2_UC_HRR_CLK>;
+			clock-names = "master",
+				      "tmu",
+				      "ahb",
+				      "axi",
+				      "sb",
+				      "sys",
+				      "phy_rx0",
+				      "phy_rx1",
+				      "dp0",
+				      "dp1",
+				      "pcie_pipe",
+				      "usb_pipe",
+				      "noc_aggr_south",
+				      "noc_sys",
+				      "hrr";
+
+			assigned-clocks = <&gcc GCC_USB4_2_TMU_CLK>;
+			assigned-clock-rates = <250000000>;
+
+			resets = <&gcc GCC_USB4_2_BCR>,
+				 <&gcc GCC_USB4_2_MISC_USB4_SYS_BCR>,
+				 <&gcc GCC_USB4_2_MISC_RX_CLK_0_BCR>,
+				 <&gcc GCC_USB4_2_MISC_RX_CLK_1_BCR>,
+				 <&gcc GCC_USB4_2_MISC_USB_PIPE_BCR>,
+				 <&gcc GCC_USB4_2_MISC_PCIE_PIPE_BCR>,
+				 <&gcc GCC_USB4_2_MISC_TMU_BCR>,
+				 <&gcc GCC_USB4_2_MISC_SB_IF_BCR>,
+				 <&gcc GCC_USB4_2_MISC_HIA_MSTR_BCR>,
+				 <&gcc GCC_USB4_2_MISC_AHB_BCR>,
+				 <&gcc GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR>,
+				 <&gcc GCC_USB4_2_MISC_HRR_BCR>;
+			reset-names = "core",
+				      "sys",
+				      "rx0",
+				      "rx1",
+				      "usb_pipe",
+				      "pcie_pipe",
+				      "tmu",
+				      "sideband_iface",
+				      "hia_master",
+				      "ahb",
+				      "dp0",
+				      "dp1",
+				      "hrr";
+
+			power-domains = <&gcc GCC_USB4_2_GDSC>,
+					<&gcc GCC_PCIE_2_TUNNEL_GDSC>;
+			power-domain-names = "usb4",
+					     "pcie";
+
+			phys = <&usb_2_qmpphy QMP_USB43DP_USB4_PHY>;
+			phy-names = "usb4";
+			iommus = <&apps_smmu 0x440 0x0>;
+			pinctrl-0 = <&usb4_2_sbrx_active>, <&usb4_2_sbtx_active>;
+			pinctrl-1 = <&usb4_2_sbrx_reset>, <&usb4_2_sbtx_reset>;
+			pinctrl-names = "default", "reset";
+			#reset-cells = <1>;
+
+			interconnects = <&aggre2_noc MASTER_USB4_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB4_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb4-ddr",
+					     "apps-usb4";
+
+			operating-points-v2 = <&usb4_opp_table>;
+			orientation-switch;
+			mode-switch;
+
+			firmware-name = "qcom/glymur/usb4.bin";
+
+			tx-equalization-presets = /bits/ 64 <0x5ce7>;
+
+			qcom,usb4-mode-sel = <&tcsr 0xb004 2>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb4_2_mode_in: endpoint {
+					};
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.55.0

