Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987933;
	b=z368li7LceM6QMFpR+Mk6qjF214e71Mu5Ubo5+QFI9ZxlR8AlZFRzi4ajx++gFNo+YSZ
	 SBzdpcgIl+URIKrVitXKIBUgyn95a4aBRI2+lf9x/h2WLkaaJ8ot8WjqRZcOVTcXuLDHS
	 G8ws6IjL/mrgphvsR7kFf2rScCeX8J4y9/zG5+ED0EB4r5Lje/DpxjFDdkBP5GSBk1/+h
	 qg0ZatGW6qPPKfMiiWRtuCqNcnbZ9ST6Citvtbso0uiJdze+wGdWuyQ2asAN3Lp8RARe+
	 dEG9kuJgbEED2TSJnseMBX0cVHOW+iCwwzewrJ7PRtTuRjQvgXY8fdwrO4K6/3C414A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
	b=EbVgv/TVhwQ5lIOQ+HDnZ54wdDd+RbQXhXfayqW42w6yjeDFT5hJqp/BHg0UATJXmaM1
	 +ThoQGySmcdU8531ypm3WxYFaylHnNNOEWlJabh0FsNx13n39Do9QY9HI0lnLZVGXt87P
	 TAbYy1cpwRP/2Z/seatbTmQ2Dxg29fhOsUKq5b65FLQYi1LJd2p0IZXV+vPrLDUVxXXM3
	 9aAKHNEQO1dSjs76/pFZOlkRrCM5Duzpwr9XnvAsMcKe0HL6aGs7Vb/fDXwWal4uiABFG
	 4MWY5Gkpv3br9KCO9rWI+oBy2xWrTSFMuuFlGtE2qJBRor7tLLBYvennLdBUV9hHFqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC236606A32C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC236606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI6ogYE2560600
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=; b=DvhaKroKnQZwpoBY
	8V6lesU8gRNqXHOMZmmqq+ku9yhOCgUtsZHeS3E9erFPd7sul7Wa24xt/uhMEepx
	tnQvMYDTBoupR9GDq2+vnk/QgvzyDz12XbNHjRk89K3nADfcRWr0BHvAoq36yIQL
	SrcR4aiIhfkgB+xqloC882YNqw/ocxBbELuK5qaYFwrwoiT0VeF1PJlez11F9dzj
	kAK/ygUpQkqbW7Lp/Fb9qYRV6eurIQ5iSfSo9E2Bp9Pe6by9jmV/l2dG8QOeR6cx
	T86YIkZGVWpR6Vcta1+8YbjB/urERO/CB09iayWQaw6x7waisPUjROHrYPO1vRh5
	LXEuoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hvcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso317723285a.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 23:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987931; x=1795592731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=HJnWC9WWe1HOVYjEOd3qjSP56oW3JP1kMuRtS1nu+y1+N87ZeFB2rnUC4tlkLJxEIS
         CAvZOHfw8l2ky/AOFwzOf3NlM5XJpT2Pb3cMVwTl+Fqicrky8CFUwfELwzNVhW33cfmV
         yI/zgSKr+ifBe7Mu2IfiUKPG3QuG4N4xHMpwmrclR8GVeAWgxQneRHBlcl7hBWMk3fBT
         QyH+OlcoTK6O94UR8dHb0qEMNGBZhcBCDw34pcJTGlVDwj+knWnQvhJH6qvsQB28uQtf
         uoV0LUiFIH3NN+8hbtE1Gvooy2fx4xoPs0liw208cxIGSecGLaZOXiG7ikItrxkGK5UW
         5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987931; x=1795592731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=X0nyjhKmn2A15X7h/fig1GLglEAMjEiJgwlFqXkPwUZG2AEslQYBEUZN5GaQeDO0Ko
         6zjw3ZUOoJAAkCjaMVmQ020h7s/Xho7ye9dYuNUEdXatzJlXXuX5Le05IEHePvPZ1De0
         N1nchdD3C10EbzNRDbso/jvnDhw4VNeVPsw6Q2cpIbh1PQNvAA5jaJ0XIN9wN5/YrjuE
         zX1Ko8S6jqLhRDwcG6zdqfROWJpscLq9OL4du/B58FvdYN1YERA3JUSVBynHnd7KH2iS
         PBwMi6IGJz7fght48AhAFFxhxBRFyE8WacyFnaFlGiO5406miIkbkHcpVXNkkDl1qImz
         PkuA==
X-Forwarded-Encrypted: i=1; AL+hErEGeQ5ogqTit4o7CBkBUknoiKD7E/sdAa0ewC6sQtgDJZu5w4yAeQV+7XtsZSvB8x719/A9i17Yjrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z98ET2ePlBSbeDDUMsbpOtHHGgZ334xOQ4zZu65f9PhsR8qKpAl
	mlw3PRyuqjaWZjMGIJ8oHVPt8a2RvFkipx8i9z+1QGhQA5wTzV7levEAv82oAVX0Y5u1Sr2PuAN
	FekrGUZHIdiJUmeV4CROF/GqXMkO0iACrVPujD03PBiU4dh9G9MCA49iR0knYkFcy09MEF13cMw
	==
X-Gm-Gg: AYBFou1uCAfpvu4zK4q/qtA/8i/HTex7EPaipNUpIhBLHjjpto70Jj8QD13HRbvy8Wr
	lxzAaI11Q3WBWNN2p+Px2HbM0Or5shzxqG9HbdQbn7b149wtC3bD+UbHWdlFp3ia223poPx0yEU
	QuUjiKCbgwo8oUAT3b8bgzwWsnPbxtV+76+sBKx6JNk8BWsRfb81ev3rhz8Rvqkm87lp6cZJmq7
	u/g3YIKs82wsQSJrzQch/6oKKBSd1U73xazgIQgxEH4eWfUTQp5CdIWCCYln7LQ8C8kEAmhJvHx
	ydQWA8SZfdwmqvARnEYbBu04/eSlq2+19ceoqGzeyTAST4A4l/ATktg/vMpraakICn46vqEaRAQ
	hLoqv3Rx6tcjCVbBQGM/BewuknnhWdWx9MscOoLXpPjho8F4A0Cq9HgEYLfYyyen/yJfA73RaLl
	EKyA6K61pmw5JaWUiFZtrfuEwpB1Qg/O2U55AAHLZq
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311182485a.37.1794987931063;
        Tue, 17 Nov 2026 23:45:31 -0800 (PST)
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311179585a.37.1794987930428;
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:07 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: Add interconnects to camcc
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
Message-Id: <20261118-camcc-fix-v1-3-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=922;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/Rz6qgPhvg0/67hfY49NLq/bi6XkxtXgxMoprPKHax0=;
 b=xcUzHlsa0uUwlwiq9Z+kd5kXzgkNdUJA2NImHLlyrkpSdr9GUZSUtuU+mtMH4Cd2VzzEywp8F
 xwzsJD+koUoAPxcTl732ZMN9RE5DwGsKVu0F072HcSZwQ7Lf9T+HDUI
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: I8ppW9ij4XOQtDI6vgX2wJUrTCa7kmcE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXz0umCbLMX+fG
 UlpaW9yodR7V+5Ofx8C0Aml54iCuePyz+xGwmGO7q7CDlLDYoJ967/sF2agctHLfy5hiXJQms8E
 WPr05fr7WX2Nn1lisDLEfDgbSNKHCFE=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd579b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OHQEiVBeTy0qr7fm1XEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX7YXLZ3YdMuhE
 qO8raYgBCDhS1n5kpdXheAul/ORiC/qTwMC6DPkQ7tO15WY6+ZnWenzkcVlZ2CIKAPsk/Z/RUWo
 NPH71aegzELiGu5TjjqJU7UpsroQkEp3fQwUqAur8JGvebDNjSyczQOsBIqmTLcR6g0PE3Jusap
 Jg7mYUQrLOYRLx6ucLmj4kz4HFB+9dsDFJfTCjeyY//brRzbWgBaTwo9jXB3BEwQTmJKyr3X+PZ
 KgLVA1ZkU302KilvlGJupzL/D8iIaaQx2qQYjzpx7GKhVK/CDYnoYOR179QvvmhVv1P5Qq7bMCE
 Ad4DrYr09hj4jHs26kpL3CB8kD80RbCjeEnA8niNF/uRl9PKDZBpmZPZFIPInc9uvXCAJMJnI9H
 bMMyFhRVeUzBbpRdNHKwv3jewrwgNFaWcuuQySU12i2eFGnIs+TDHudA2onmfr647ooRMQP9MWH
 clRjCv3N9W+20SkwYvw==
X-Proofpoint-ORIG-GUID: I8ppW9ij4XOQtDI6vgX2wJUrTCa7kmcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..9312349d19ac5df67a875194a99e4a818cc61bcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3796,6 +3796,9 @@ camcc: clock-controller@ade0000 {
 			required-opps = <&rpmhpd_opp_low_svs>,
 					<&rpmhpd_opp_low_svs>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

