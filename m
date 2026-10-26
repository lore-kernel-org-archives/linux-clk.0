Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014282;
	b=Qv+ZmS4XP4u57Si/LjHQg1QBt9LXbRPs4sn2HmvJIheBDS0zHylpl6Zo+E5m+7sFOl9d
	 cHLeA0Yfyy6EkwFckc72ybNZwwxutCBe2np77FLGy4g6dTsvcQ4pbLhJxBrg9kdayeBlH
	 0oPkfWyB3tjzIadcUh2MeLvSmw0gvAjS75gNHiFo9OpeQJAcX13FL1o8K6A5xC+5E0vcD
	 xlvjwh1iP4U2crYtwgi4soCJ/UHbxlqT5/c0dFO/UmBWTw05r4LowKLfH5cLU6WGBKjtg
	 EpcBnODYkaQru6udmUM7fxxuxkW5ZkLZbLyVJmteBOs4bgwz5ybS3/njDWFC9KkZlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
	b=Aojais2cjJkUiDmaR6SielVouo/oRqrCh9tdEjYvv3Fzg+WqSr1XIpJTrB/mE4k+Jmk2
	 Yd+9Z9iSkEsDxy+s1lEpLURTHRSXHy7i414RjbWTAE2FzNIXJ3XC4ZIN0N8e1lRtQLYTn
	 w7UQ6UDy6G29GcnuWxQGJ13QZZB65abxjagqJF9jy35E/27Oj1Zat8v/iJn6DQnhfxjbU
	 dlQhvN31PaJX5ZiR3RvPCNtdIsDsZuz1EhBHDD9RWADyl7U1gTS4gkR6QRNF1lKR7HCpo
	 tpYO2Bxjmr0FlyJaQlHXFGybPTOw2h91ULiG2ELIDGJOi9ZE4O+sC3vcLTGOo6g9mMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CfQxc4C/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LVhlCZ/F";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20B606A32C
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB20B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfQxc4C/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVhlCZ/F
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0Is3033852
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=; b=CfQxc4C/kewcTgE/
	Qv1d7WZrlMrN1mNjVUYktg8rKXaO+MniuiEVjqBweZpG8m5lmPGysCoEkLmNV+xm
	5/8fWVO2hq3iYArAubOuj2NJ4DP8N6zggHTeJPiz564yB4twCoJpxKE3NVqPcSut
	fovHAokjYqlTt2EAyzcoeGufiXS+O4NPGJuop8gZp+Q71K0Vo0JOMIlYqXMKlWTa
	nMDCnFFXK/28dbdEz/nS04MV8NkUiQipL9GMvo03JmqxCryK6+fw654eLK+Ua14u
	uIVniQcEEs/oyCdPKXCyOvUZbBZRUEUB4TrnPL7u0o/niVqVN8EtK8u1DPwx3I39
	m8PjcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y06c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:31:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4783338a91.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014280; x=1793619080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=LVhlCZ/FG6a8m3ihJjIpcF29o5yiFSnJRnKxiOgecMN7j4wc8MCGNwHZxsQLV/Wbt9
         8eOlQmS4F3lJCwG3BN4sE0TjyXo5TJQ+vExxjCy0BaKayQmUzYGzYzFI5ivk1NhLJF3T
         WWSlRGFbBfM7Q3ksHcVxtCSafovbXPETazcNP7J86NGOHsW60EPaia4R8f7hx1pCWWGi
         9PBQ2A2M0Q72mrbKfEntoklErihbb+fD3Eb0lx1R3O3opur5lkbnsmz0Dl2DdFdTvhpw
         lKpfvIHWUHjIUFksjnW3Yq2/5+1z9yEC7m6tEcBSUKOPUb8/LZnsDQQOE0gHWcrimhpa
         4+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014280; x=1793619080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=innfdsZNvpHSXl+bI9pqku5lvQFu6xtEPu6T2s0MF+0w8meg2vczqmbvu9vW34o88T
         nL1g4MPSFPqB4I1LoSrMcXHeNSqFNU2FPq0esmEjyUZ4TMgKx0fW7uY7mYaqujpmPdhR
         YytZmQyzBKsp0aw3rb/bXRVyYYGZXVz3sr5ErEPmjLILy27E4GCIZvy704a6KWxJ4yoc
         AdZ4JTpLSHBbEvsfRybPwGPJeG2goXb91MM2jGx4d61r4vxopfpc0dZSW6o15rP2QAHP
         iAuMHv8LqS5JSCk3+JVfB+ANhTox+UZqz72s+hSDcaOVJGivTm7buSwaUAOlzjhxXSwW
         ybqg==
X-Forwarded-Encrypted: i=1; AKwUvBwLVqAcDj7GnbsXI578ZpwMNW97d69sGrZKBOqLCoOKshZW86e8GUXHhvYWjVHdpY8K+t7Um/jeaak=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVAjMci/52SQ7JqAYG23cHFLwhlSAlxSkF+nNz2jDckG+GzNeR
	jSQiZZ9LeKUoi1QdNpG91MTzjg/aHcFmZyUKsZGZ0z+xLuUBdZoduP5yC0iOj9H35S4+kh0ona3
	ZqKpiTKgo6ITU6Ws3WDbBVrGoj1WpeJgB2CqF4ELHcRNBWyPE78y/4o2+UQ/Bhe8=
X-Gm-Gg: AYBFou2CK0kLAM4u6Ph0OcHAb0YvxB9+5+KkYJ+MkEBCXeOxO+V8mN68Ke9bsFGKhzG
	PrHZxjjDJQi35LNMxWsKeFmvvWxOnrmogx/N0qOzjWEBqH8rX6huwniwbLmZezrg+olcgd3Q+2F
	3+fiD4eC9lvQSv0h+67/GrHc+O9r4qOPG3iuE8r45uf+CubY8dD6s2LDYQgdwp062D8cYfUbz4W
	wN7QwQGHkL4GiBhYNEzzODQnKjeVaEdZuHjb3KNsJGI6GYSMtFAbqjpjLeN8VwPFwf3k2mVsilW
	Z1KQbXz/5Fhjtlq1ZJL8Sc3rUBS6eYof2GYxDt4VRtUgthY3+1A+mhMI6EdzH/jHrFIwMaKcDpY
	4F4FfNYR2DP5PdODWJMgLPpA=
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611422a91.22.1793014279664;
        Mon, 26 Oct 2026 04:31:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611246a91.22.1793014276253;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:38 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX18FNBiUhHpoa
 bnFukZNksmJ8ROEoT+9H6W1g4bgb4F5MeK4p4ksM3GtXLTgQPQUgqNh8RkKA4ekVEgQQ/T0RUG+
 9rLvrJBixSkuq42LG+nXoOR1UdIKKxA=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3a08 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Sk_Ya6Pm9egUDeeQrokA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX9MzBzwJY7aeo
 Q93jwuPxIktc8iYJ+gDLUbZEvkgvkLYz3rzjydC/fP3VktZ4UeGlXa5sE6kujUSdKWcFf3NBzcK
 8iqegxwd1ozAxzkVQv5Yo0zU+11gW59/EubS2EnXfQDbU17qOAgalBBZPZLfpZeZA7+Akv3rW8I
 E7OAq5klBUMCVvtHDse34AH+xlUlCKmkbNdngRVjISKkZNOobnf0q3wNv/+6yB8fX/3YWAFXSPi
 DhzbhCTkhz2u6D0hK1zMK3H3jgcbC+YhyFxhAqz8nZh/h8OsAXcY1uvDFt5/O0rVEm6sVP9bIpa
 d9oozqfg2ZdHJhNesTKEAJHUyRUJA2DLPSVcVK6Qm5i1TRLFd59m/AemmbEy1eerosJbhm7A8x4
 3lWHF72CeC/KBRbRhlqXMym3aedoTk+20bxGvzJ9AIn2IQfZbUuiueP0geX49nvNd0EFptcYFzn
 CQzO/9gqFTkZ4qUvLtA==
X-Proofpoint-GUID: 2OV_5ZwVyQ3p1b_sUMNWZqsLceVwu35j
X-Proofpoint-ORIG-GUID: 2OV_5ZwVyQ3p1b_sUMNWZqsLceVwu35j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk2_default: cam-mclk2-default-state {
 				pins = "gpio30";
 				function = "cam_mclk";
@@ -4028,6 +4035,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <19200000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

