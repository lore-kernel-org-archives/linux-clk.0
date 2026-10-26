Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014257;
	b=pke/QT0NQPwzCnYLK2roJMmsWFOrMim1rmt39RIx60L9j2D+9fEYxTbRiBRcqgcc0sFG
	 Pqy3M19q+QI7aK0tcBUQ7WBGBvmW4EhT9BfcW4pB0/yQkvJu34iZjBUiWbhVQdKaPAILI
	 aZ2MA+id9DXsUskENjXcVtJiNNdtDAhycON998YCBkt7hDcmKejCu1nCWdJ19vb9rlvb3
	 NdZzkutAEPVftV5ZvcLFwlXpPW9eAq8Vi+glRn2/9b0nQt21t4K2C0D+VyyIYfWsZwpZG
	 ISeckWVJmcqgsz7odFc0tZZl5KwFzGzocHJpmUy+5k1JG87I8zyp+BBjA+RMnATMR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
	b=LwK/5UVv0T3KGZeuEpajALnUqk42QReJg6J2U7PZZ5K3Cjy+V1d2zrgSvQ08wyijT4Ve
	 BDwR1cbiPUwKhpGmWvSIIMftfO02bGnsBGNvI+dkpantyMHXSdIxOQUS7s7gDm7kjmBR2
	 J8KjbID1cGMe85mTgrXRtQ1SH1PmqSqwElkA5BmuxkKdAKCuJWs/EPrihzYeEUrBG50/t
	 dYPykd3glZvM6QmFBRp3rCth40FuG4xIb2DAwMjwTk38UZgPd/KJ3fdyH0Q802ze0Kdcr
	 NOGdN9vN4MEOsg22+8+oGYbjdgkJ+65jKNXSPSR1KdBKusyduDLLsnucuIsWTGKS0Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189360A5BFE
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A189360A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsux22732735
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=; b=npaCX9jtYxzYT5Zt
	t7JV3UfqfK/8A2WwX5npM8A8GheMCA+qj+c3P1NesESmYtTssFoxz6b4+uHeBRYB
	MQdKYlRY5jKKRc92oQ3Y+9CoYXD40WPyHnAURMSfEvePs2h6bFQe5ShF1QkSV9bt
	hGD/AP7gXGbyhWeRuATFmp5KoD2WAF6vgKgHU4u/3pxpu8CrfwLHnJAKvdK1lLmp
	z0P+FZXpHNqfy89HCnX/waWyrlQ5SqForeAAnhpT1gfzezJC33TMkqvbzbshzi+9
	guAIn1wCZKyXU5vb/FPwi/Qh7c1sMuHy/x+7u0eqFAk1Djt/gzTvT+nMnBWV6uEI
	7xLAwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8dkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so2191344b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014255; x=1793619055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=B5M9QUX0JGMgRE84M896uv2k6Q/lz0+zdEUMc22BZS0RUFWPl2um7bbjjZfAloBC7T
         ID5B0tpzFouSZFFvx7zdVQTSoanL/x1b2MIARjxBOEpvuD9vE0tAQq1NBWLOhmGsieLz
         q1GbbU1w4YnM3yFPYt0ToFQ+wV3V4KV5rrIOf5QMpKksD5Pt+qX7AjNVC15Yqy5p/KmE
         83AKEHiwkAn6v+lZ/KOql/1l05B1pSxify5pDf0nvHrQcgJH7NkjaDsrA2pn/jBcehWW
         5stxqgQJ0WuVKcpM5RT4XxWjEpDIJc/Hp8qur0R4FFcbGoTPoZlwbcvz12dZBTY9w/UJ
         gOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014255; x=1793619055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=PBsmMXnCugtATBAcTNX0FGsdmtScGJIYjGIYc195gtk1m9yeGAq5ei7b91oC32oCtB
         UFVTSiz/pPbWK/cVMzv5BUejNVhsxWmZ1rhBnkJhPieTihcMElpQGIM73wKfn6rPliF9
         UgBSkcIBpwhU1z1iwvIT9VJN6N3DjAgd2PbBSwGE+T8GK7p3Q/Fm6LChuTH140bbLYvt
         rVyGS0NkLf6t4AOH0IZrLTp4rSH3TpxF1hW7Lwt8JhC1dD6lFbp/GsUGts+BY+hp9xs3
         KgzNaYDPmJNi5F1bqcBmsXm9DNlQn73QLhQVCQ3AOws9xPncChbUk7qHONySwcn2AoEz
         pO/A==
X-Forwarded-Encrypted: i=1; AKwUvBzdZKoa4RG9VNkpwGg6Bzbk7cs4QGrz2PnjCuKplKv+TNXg+GGbXGv3vs8tDlEaWWVLwMLPvDX9oIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFEsihYTZRRVkPgjzFyQee8II9jm8l9ubSJlqwzyrnjNwYx0Y3
	DP71qdBv/ST0hl045bdAMmlS6PT6bcn1/3nn+RqCPGGdxQlQq0Ogjz4oS9qQo3SWFW5OvFvCPXD
	pnMGt/uoFN9tHboFITW0zlFXesAwCf57P8ovlT2qv+wgMfJPVOcr2grNR2EVzdxM=
X-Gm-Gg: AYBFou1XpxXDHQF4eoXuvGj6NO5bwPxUoniJ6uwfZLPjFXSQz+mVGrTpw6oorLk5H6t
	KLR+Zn8JPV2i45KYUTM/wXz+FyWd9v4CRNl88KxiyH8ZLsuclwEUWGmG/bOZV0UH8WtT6fofAU0
	QwTX82pCCJfP/VHwtXMIE8UJ4KSe932jn4S0LKx1FaZyl9Tg75ZkXaF1+lGLBJB0Q7qMDMy8Lte
	uZpr3w11TOXD+FSHVUfbXX8pSOJSeyGNKpxzW0oChUyOAgjd+N9iwC8I9REO7bQqG6FUGj9xFJh
	tQ8dU0ZL1MV/Smssv7kJq5Y4fja3Vw0Up/6Dst9Uq3Ltuy6Y4UWiWB46fcmAnccB8kyicetnN+s
	q2QKUWqLzYKGh4b/wq+PYBwk=
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288332a91.3.1793014254521;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288290a91.3.1793014254037;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:35 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX29h8iSCR5dSX
 Cjw7EIFvbVsJ1BQKWKYna4u6erfE01C5ohHgZHw+VgRjCwK/y+0ay8QxOQF7WcxHk7Qj1HIaPiT
 7hUinn1KUVkMs2Pa0rNLYMks7XviojM0quJs8Xncp3M6ZySVlRwybTlOlM4Lbh7sC1h0sQlVwkr
 4zCwl5kUzJiXK+Yf2wdZTFZ75PbfPYJ+7O1iDS0SU9i+6qaXoU5iVdk+e9WlfoYrFuIqt9V6Hbo
 lPpyj5sgm1FMlREQlx8X07YSb8QuuxXdG2Bq5nupj/gsT7ITmy4ys1NQFTM4/H+2yEDGN2YcdBu
 ve7oL+iviTN6hNpqOjBhG7CiKuIyal95dR41ZerZAAdjG2u5wUo17DDNh0gM84q0pMmbLb/M0+m
 eeYBdLJAisRTR3WX/HqxqGa9oBNcuHquNWDPXMIHD+rTEoA8aDmEzBXDfc9cmxuZHdMWnTisM0P
 R7NUqguzBwr1meH9LdQ==
X-Proofpoint-GUID: nYoGIRoRwRltRwJs4ToHlCEntrwDSVGb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2zoaSs9kL1y4
 SyCC5QGR32L++4bi6fV32diypRmRePZ8h/q/5wWQVQBl7oGgQzdNAKc2SF/lHwP33+AvqDzfvdY
 7ECTmx5i89pC+7QNs279ZOHYK4Irhh0=
X-Proofpoint-ORIG-GUID: nYoGIRoRwRltRwJs4ToHlCEntrwDSVGb
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf39ef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JIsdQxy8wyWm9aXyvGIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..e122f70eaf20c65df5854e644887ad16da94a7ec 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4891,6 +4891,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

