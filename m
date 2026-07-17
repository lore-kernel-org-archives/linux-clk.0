Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333493B71DA
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273547; cv=none; b=F3G626bpAymbKIKzKYP4QFKqBmD72T/izSzt2ET1FIALEbf3dc0U6SOQpnc32KVnpI+eOrVuNF3o7SJ8t6ATqyh0ytEhr2Qbi/Dqrd4WMMgHPSoGFk34QD+EYJCBk1yN8TsRkHOYJTNuERZjDAcJgghLnvVK4tfIFABGEmsQxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273547; c=relaxed/simple;
	bh=H2fkpda4QTDXLjTbUXq9Hwo6C3IDYqfckLGQqzPvBUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTrgb6UJEehRFIOMzt+xHnrj18FxcKFM0nugs9htnmbS8a0xtS3G4jIVCCf2xorNyAcBOeKtV9PORdkqHcOoDwD8facs6yGdqshoPb46EWIwyyQQ46k58hbc4htbL4FdnoJyt5FPDVHN+rgfxrl/E58kJRQU+3S6SI982Ltse20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahfIn769; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9ZI8Cmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahfIn769";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9ZI8Cmd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cK951161165
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=ahfIn769zSllGEhh
	u/lPblN1sd6MCbITTLZK0gGRHLSBZZ6TVyQZRalrius+Kmh49Y14pFzJz+64o71H
	WFAFtAPTy/wVOxvKSdXRdlslgy26x7NMrCextFSesvCmjCQQzDUuPOWWUosWxNNI
	gicFzdbDhKvADzLSaLsHG6C4zOCnRguDwEBrVD+RbqDmGErasELe5FQDHq2vPpAG
	CSFgvlotpT8AIl70/OMpUi55BpzAPSWnXwBZf2dkYr9WizkUwkevbDTN1ffSADFI
	qt0V4SyQTGga+TCTMdXB+6JaXbMITVl7U5tFRjiLBQuQXcZ04hOBdx9At4uF3u+Q
	KLnqrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3arpsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so106866325ad.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273538; x=1784878338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=T9ZI8Cmd7mRIgObPn4dtQztQIYN7vYJdhNXzj0ZQlH9UYNV6gYdtjbhL6terNwAvde
         4Vvk4UWfU+42ybewpnUI//bkMdit27m9sVIv4uZlhaZVaSNXgnPVqpcJziQLCk7jq1uP
         kuV5I0uzPgT9tHp4j9oT5T4C8lN+R38fNumiTde+n0T18djjlqBjO2s/eRHPBfJxDhUV
         j3vK+cUfCvjprTJE6LGSXPeArawYFMfnf6X3GnXKukZLFgLgS8XYldbrQf92CJSQ8hS1
         3wx7GYD1AY89MpkU0bMkjRtb+ghPgm/w2YMVrvZ7YeWPnldbDB+t+QKoinE0Xf/+ZpmY
         1vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273538; x=1784878338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=RHK8uXGU17gkkVdkA+TH2Y76Nn8OfjSnaqbGzlq7Nm5kna69tuFA3vAF6PNM6EsO+o
         OIoVtnp2fMUoQfFjhXhOXl+lp5hDY/4euaTO4ZRg5K2tOrHaipCSCfmSjSZBQ9nGvC9Z
         62pA0S5Z2EILRW/ilzzu7LK/MtAgQ9W+ai9k8KQ3V48o5aYRfw8kaC1+0cGrODbg8t2R
         /reGlE/uwY8l/1uREQhR2UiFhog2kKTEJQyo8ChkTw8EwD8+AuTNEULfM7NWA7n13+65
         tqZR5ISXEysu/jNEsCUixyCM08YU1i1QzUr4xVjKrwbc/fsYYNYQcMT3ukHNNcw7rnTJ
         vgOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBT6QfA8BkoyEuwYGeVirrLTjHcLVqhi2J0YMfXYUGYvQLd/3rq0V3QwJr7a3jgk3UNoq9ebIxA/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8zkLDlo85zx+d96EKQEgnNCtiIb3JazyezRf+V9aI9vkGSqS
	z9LZll16BDBsNAQ2JfcCXQbnzy6ks3WmHwVSVgFgQxWaPfWwPrmyAElFSM5/11yhHO2CjfN67KX
	JQjUI+kfb6QwYiOyPcsGAPFQfx2m43hWPxQ0jE3IZYkbLgdrVt7ZJ76Bu1rB5sxg=
X-Gm-Gg: AfdE7cmjTXdpZO4AMst15IXbgi5rPr41iM4PTh+RyEk2vXquZ7OX8nP5gSu9Yru8fPv
	x33hes8Cc7wjFJ5zKPPooza12EUUP/RD5tV8OaREnTOm5gVUasksfzhifpVNnRMnAYa01fPRiRa
	n6CqcdQddnexH9XPId8yAnfa1C+m3EjObuP+aL9QfCa+6948LUfld9jqFlVC9eIvUZybuT7aAMK
	+LTLCYx6O5D7iCjSJAlb4/RpsSdvWn8K3eniYTyEDg0xVROcx9sbrwMA+EHoOOb8hPrx4kfpHNn
	rcpSzuHiA4ooWs61aho6VysSpYaRYt3gJ0aJrW5EWknBTtlz9E3oym/WAd10xYMQZfZLLKwwGFX
	ZZtOtM0y+G9skhoQKbV5R2W4t
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15268315ad.43.1784273537959;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15267965ad.43.1784273537506;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:47 +0530
Subject: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX+gCgxC0Z9OGL
 i1LR376mZyVgp8S6bFwXFJAAJxTAYemsxqclMpnPA27FtXZ1jLwh0lNOcDA7f44YK3e1ZzU5eo4
 DDWb6zrk3QKnhpx3euX825Zho0igtu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1cFjPc1Qhf6o
 tqT2a4q4c8lm5zaQUaCzc5Q+UtF3Utnftb/aVZqLP8toxMgDVQAnecZLTCk3SXWvcIju5QxCaRG
 8OCnjS131NzDZzlJmCGaAgltGNtQYcV7iIJo83HyoXphYEgG3VmV5wCUNqdiiJ1hJArW1bVqKeu
 MOtTrNtMIiOhpvDbFRphBkzpHNWeP5cOb7FVHPLdUQq3PlZKMo5SmRq4qdnW8YuHRivqGc6UpXQ
 PZ1v+Cub9tiGTZguy4SRwWkWhVU15I/qE+YKlBYfZsFuXJRnYrZ881Vt/vhdoB+UUQbv+8XlFwy
 4XHuDfHJeP/1iDdFKSgEe6W6VpxDBrG4h+aaxFmkfYaiTXKjKH0xDGHDOw8Dm/aVYTLxORSXwDn
 MUJgTvTws+59ZsVPRzIZkHkoDxoThlC61mJU7Q7Sn2CrFstin5ArzByaN3oC4WAHlkU70JCrXqm
 PSBgedafAkxX/K0K08w==
X-Proofpoint-GUID: ISQMDkrTFbY3GO1zkyrh0afGevDpS1gx
X-Proofpoint-ORIG-GUID: ISQMDkrTFbY3GO1zkyrh0afGevDpS1gx
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59da82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

