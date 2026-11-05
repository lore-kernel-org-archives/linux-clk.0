Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884085;
	b=U3iy//5AqXK/sKiK4AEXy9AISBezqsW7MjWN4AyTJAxNDprKVMpsuKLOjV54nCTLPhai
	 U7yzhItEZroOyDOtSlClXNHo9ROmAmgBYe9LopTu7n9IFQ+RwQR4IT2zUGnnetWvARd9H
	 saq7DwnMNlX7kMpvwoOzeu4AOlVptQ236CZeZ5YvxiEVze+bS2We/9G8aAZrFbCQyCCEw
	 TgI6zX0Ktgzvo6ZdgnDiPx9AassN0PVrt4ZKIsyNFaeNIWvicF5WN/5rCI2+SdL7+gfjB
	 /aXwxgEjgSQVK7JxV5u8052AKP/HMa0eb4eaDUa5Mj1mpg9NvNieZewHTRNKlcXPWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
	b=r4OYVWl8jVquLwicgGH5HLbs93EYRsHVAdKe/dJaUQns/8WKOk1wl/L0bQfY3VUlafjR
	 NAQH3L4gv5c/ilNLXpyMomsmur22itjqiaxgEpbQU+sPrejcKBR+53PUxFpme/UzyMEo7
	 hWEQExTo1u1xT3qYTcuGUmSrfr+8LqSftLzk76CxPTh0PUV+iEWnwJ1ZQCogcWOFaUUWX
	 MkPIhasKY+urKk2fUkMg+i+GIURrcU5L+ziKi9uEkOCVY5js6fRAt2E916Zjoq+bhOv5B
	 ymmo49ncxyGrb9doxpjZTBNwG+EBbYEOgp7jWyfz0NYoVPI+LG4yiWk5NvQzSwxWSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CB606EE95
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731CB606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tWY71053351
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=; b=f2Xx8w7s3yMUKtuF
	IvYhi2RQTzagLYMaqzVa2WnLKnzbYJ+pCUvBQL0UeSziQmcEp+dEWf3WIdDPiumV
	9itzRHLAZNA7wcenN9XD7YcLQMKznGih+FvNUILXUfvXyczJzrOVbnGNC4F7660W
	ugKDI7WSMZIiFcyEtQdbvv6P/FDd/DCLIZMhsNqsGzgg47bqPF7hUx+3DhGeaq2w
	R5AMfiTNc7WaeDafHP86mLPEPUfBwDFoaGHaAoflCelulEtSsFObBk7qMrlc3die
	mqvE6fIgqHyiQcJMx9SD+S+tvnIh8LgaFf0l8LtXxPpwo4BaYVf0aktPeLqTpkx4
	K95S4Q==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8tyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 13:08:03 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b12b209c4dso22420057b3.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884083; x=1794488883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=bB+dvqV2NXnlZvco1aHuMzn57IqQ8KQ7XxASNn+6tLDbeDmzwIfyPz18pYwddOWH6Y
         1gFXfmpxJQalVLejXhVmuNhmeebz3VrQaNSpdwQylOKYHQPigOPkViwq/4rE7Ab64995
         IwjDNxim2seUyYzHZFjs/nhbS9I0QukaA4+AklE9dMvnOXqd8s5f6c26sdQ46crDxzCc
         EtySKfdsDnNGYHr4nmEEpb8isCRzB4Za3cLDrZ6G2OmFpLFlojyWUCIqbWMhag/kM5uZ
         FcFktBXMhsq2M35/9JZMRVSqm7SPqYWVQsgEyEQOk3olaVEW7kradsrJIG0u2DoJ0XHc
         ERTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884083; x=1794488883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=OSikU5HdEAYEAIHBWcRRKNh5EoB09LO3r7BvvI6Kuf8xzyeQRjGoShs0uxMj5It4wl
         IOqbrSygGSP+su3fptXkFt3fvKqyz1EWjQI5junPa08ELvf5XuO4Q4vk7IC+w8beLlfY
         3LQdZoU7O+9IJQPPatjop3ShB08x7433/TndhYc8B8KPGU4ydIBqp77lSwyiqbaNyCfc
         fntbzZ9d1nmH9c5RezkrRQGytqS/b7Bu8QyexbWZaVxd1ALkfjj0cRGzMR05Wb0DYPBL
         3PWOfkY4PmwxF2pv91bHsKCEIYr3tUxkI3JX2Sh+GFAz+hV5Rr7rdkHvoTPu6M4vA+1N
         xLhw==
X-Forwarded-Encrypted: i=1; AKwUvByZrD2vYaJRnvzWa7b+5g5mWQWu//oiRXCsVYCdiQjDu1E1xcsXCW0fzs3StrE+/J3kixoKgeznRrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tkAKA6Gm6DnrbkLIlxcg4E3ZsOBRWBJBtLAfq6g7nEo8Zk8Mf
	fHWHsO2JD+uY6ZU+rKUaNlSvSHSqKFSgY0sZ97xNv8FjF0ih8rgDHcxlfTD/CRNdY7EgOuofPjl
	av10T2UNiwCqVcwfYjdkiXZovmFjxXkv2hgFqlrTJolSn3D5sDYBM+nNejYhRfjk=
X-Gm-Gg: AYBFou2gBkK7hw1/3nx5e4j/3U9FN9sGi9jTTBiXhLrTO+ERdMrKYE8dkZPB0fSXqKl
	MdXsUoe206K8PqYQrdwDtgHAOs0wKM8lIMPZh8wMqhaECmfRx/z8KBzwWgfKPUmDQhVZDr+Zefc
	ZYyjQ1fFLxssaGb3vY672VKGqu3QDWozpFEJYgXD08QgbK12lkGnrYOdox/RZs83azR1ZFnW5MA
	+2BWexuSryEuYYEUY30dS5jNKjv019Lf+Lpa4S6+TB07Ncu8tj2S/hwS6nNHacNKgmMUPH99XzS
	5j6Yq8x5bd9vQzmW0+gQLwitGKyz4cdBNMkoi9A2PWAN8DG+reLMPBPBwGyHIjihPmismyusIrL
	68/Axt33+qQ9ZaWwLv5QXSCcJ30h4MsWoJdQqd9IkCM3ZT4G3zc4/RKoXzGcy6eIyd+yyetxK3J
	Wg5EAmDFRytJzmAeAT
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712602d50.68.1793884082976;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712590d50.68.1793884082464;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:01 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:15 -0800
Subject: [PATCH 4/5] arm64: dts: qcom: Update IPQ5210 xo_board to use fixed
 factor clock
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=1379;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
 b=3mqRC4X34pzKkW88rrjp6qxCP7hp3Ti8ZBVcdSCHjWbioQuMLytsd7ZQFXH9LJDd254AKeU1X
 UORE1rhCVcsCm8iT4fKvmQPNiXsSy4KDI90CKFvid0gAkha3KqfZvpp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX1Kvq7ooIvTFe
 xOnx9qg9I3A4WGooH0NmaGET4r+APIxJKFTYaYlKs9pPOv66zmyn/eON1ry7PLJ5NZHC4Yldl4/
 1mOz7mufIZBfgV9tG7pyy4/8XXmdww6QcF2/Kflul4WrnPd0nNI/Lpk3yH6qFvSvE9zaR7nZRck
 O0s4u4XgVrLWuUJxzJfd6sevIZaM77IJTwJu5BOtCMOYPUrik9uBtg/k4V6ZrT8XbU8MaUOcXMN
 /IJLF9u/70AlgF3cA1PMSO34wzkQ2fevD1hWLCVkD6cy+N1ykwoAos4byBZdA3DY0YW5jZTGsaC
 3m6ZH0dgeXeEc9b4eaq4QbstO1eqh7Z8JAlxN9CrBb5zmLpxoA/s3ByEjePjS+ptqaCUo1+6BEB
 Q6CZx/Zp5t7dp5s+xgTG/DdyobhUVNpKq+w/OC1bdgHGtHnmk0TJFoo83G2OZ/vtkwngc2ByrlY
 fazpWDf6ON3lVrxzr4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX5jKV6DstGaNh
 AU8o/EUs2wEqjbX6hjKwmFojr/aW4oNK3qe9EMfanP1AtdS5x/vdjj2n2s2MkZC250ZXnsdT12F
 OaDRQLW6aHzhcjldMHvzee1oWvmFMZw=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec7fb3 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oqiXH2A-fwTjus5yMdMA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: khyYOPR-ZFnNau0Ya5oeSpaavTegkMyi
X-Proofpoint-GUID: khyYOPR-ZFnNau0Ya5oeSpaavTegkMyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

xo_board is fixed to 24 MHz, which is routed from WiFi output clock
48 MHz (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 61a53361138b..519307c6b61e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
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

