Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51790429CEF
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572597; cv=none; b=ePfGOE9dgp2nsLGfVNJcr3H2IculBm4KW7DyULoV4BJWjY1Oum3pGwn/LyszM9OE3OkjZP+PEOL1yHq+VWO0bOM4ZV4KsUB5hCiE8m5chobQqLqFFbKFpTa6nQehpiwyXS5qfy5nrvp8BtrCW/VCP3F0o/X4qJulrEzYMhk6eg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572597; c=relaxed/simple;
	bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzgMgvODzgWlNl5d6Sf2rXTCdTeQGKJdwdnphYGYFPbXLukb5S3c7t8w9uyoU1H4N1787P8hTH35t3T9ofzbnWRs2++fFHSscdF7O2fdgnAvm3yCWkp42y6gIK6ms6mHdtcyKZsFU/Es1K4NO/elhfjs8WpIruqELm3JX0+hW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdNL9t5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty4WrYUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdNL9t5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ty4WrYUA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMd4h3194970
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=; b=DdNL9t5+XLgk53vS
	XFbtyygMZpFRiZ97YDHxuO6+aKldJFEV27mPy32TwUzlLYchp2F5uyWbpspTc/b6
	jw0Jajzzrr8dobJPjXTF2e/73vbwIKSGV8END4HXIcx5KlG+3Z6p8sB3OIdsa540
	dwqTWiFWhJ9EzkT5tTulE/vjYyOLud1+2p/fcZ6CJYgSs8g4Yot9GTvfwE13eR9S
	7re4JEUaST3zjZejfx8A2Uu8c0YdQr9BXl6lJld4ePtCw1QqnXoy0gZFsZZiBW+i
	UAq5ZhqFw5GA+qwQCed10sa7DtpiP5Ju2eQSO3grLo+vyPIX2R/mDzqQd5xAuqHy
	wLgxWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs321-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso59736981cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572594; x=1788177394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=Ty4WrYUASfukzykN9bv+LS+Ox8m9BlV2XU1KpIykoo/ZNz4jJPq6wWLowLkfLqM6Oq
         wbVcw9hZmRZZQf2ur0L4Hztsh/eOplhPQzItCc1kCM5Bsht4W9ylvPuVOfZCR+wBiMV4
         D/MM5afEiMvdklGdiexIjWMZ5ZhJdaAyDqk72P4qnXJWNlhQykltqGKUKVN11bSs9FX9
         NLn9A6TUW1Of0JIRzRnJxp5LgyS0g0yrQVMpRVcsrgY3N9xQ4bT+871MRw+7P3HDUfzZ
         4PPGDG4Y1Z9LW96PvIB+Lq1NEOejKQFEv+GZmrNzDyRIFCOnlpysp3gxyIlb4kGBfFvE
         APSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572594; x=1788177394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=M5I0Ojb47emP+rsTAzzBnlQoF40PNyo9QMX3W0OF0f1thm8h/BwTddXrdcaklnZQEB
         zW5zPRqbYYwUIOY/3aA7j/FNuoz9mZ64y+wdmADwBZE9ZA81SI19YDd9jBaK7qrpuuQE
         HdYklxE4/YhR79cyqVHQqp7SoAU2b3mAlJbJGkRnXGrjq2gAdi6bChIOh69XivgbXWOP
         3lqtYXZPc7ZljZUWYttoqZFuZg9aAl62NaW72+OcWisgejLzTKviX9Iq9VoAKZifpKRs
         z42QIBq8UZK33HEWyodoPRmwDcKmoCCNwCh7RRQwmpnIQ5BFBQF7CaaxELwVReX1fHlt
         khLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrzpi+1QHi0tguAbzOH3CGqICWm9mYFXNO0B3wtAHRV04/UvVF8y2KFzYrMAYqypke6oXlOP1tF/z8=@vger.kernel.org
X-Gm-Message-State: AFuF++lgH95l/r4+NVSLTgr2k5bzDWS7hSI03LdGfRin6exZIT0l5fLm
	wpXT1YFDhS40ZkVaN75G7o33pzlgReNXRWcu1YaYy3abEMWFfPt4lE9Mq9+8PkV88lk0bWk8uH5
	z0cYkATk4+eFTFTpguDfljZ63lsMDKyGHfHQVJDaCZgHcs6JgPmeD89vNZxIG7PPMjSyi4PI=
X-Gm-Gg: AR+sD120MH7RhMBLumL4LAKSGMrBS6na6j2Hn2Yjo3KyO3HJYTolgYoAtcBVMRGl/f7
	vJo6AZXHpGmp/sniE+znKSUa9nntjUVj8kdClQMeKy7Q24pfe4gMpvRnDQw94YhAwQjPDGJFRvM
	9mqdRRgye8lp1Q+YCQ14FFhZU4vriVPHg+rxAlz37mpUmzD9rBjzJgcxLvjnbQSgEXVW+CRGPxl
	FOfTsPsP7eNtMWeSO6i10vm89u5b8/zSwvr1g3V0y8KmZjjE4Q2KIQPYLOWgyZ8v7ktheEuBaZW
	QpZGVd0FFGYqmLuH45u3HP+ZfS6bwgfP+wJlQVr930th3uki0BmTCpMZPC3ontUZX5div8KBSn6
	Qopp3yBJj
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349089381cf.21.1787572594514;
        Mon, 24 Aug 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349088771cf.21.1787572593981;
        Mon, 24 Aug 2026 04:56:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:25 +0300
Subject: [PATCH v3 38/47] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-38-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD69LNjiZUQCJB0/pLmPdDfKjMfu+TG7wnLc
 dN2TMS7ATyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+gAKCRAbX0TJAJUV
 VlKpD/90UVtdVEQkMAh8529CNhnOFTi4v2ixDjlNgRiEc9sELZF+KDhPJFCQEb0cablWNSgKt4Y
 8vNtEDsIPVa5XgFAFUpaELBZnn+6r2It3q5/K8tuGO8Xx46Ubl3t5P86nLUVBIpeqdY92w3bcjE
 ZfwWx+GfpPvAv1ZXlYexqE9KgYigsN3GLVeSH29BpNZ5XS9ZYoS46I4tWvUMlZDMIDouoQPY9L6
 yWy8JlSTfU3IP9l1KBLddpF4kwRDrQfjdl0EYKaaCbKbF1lcjpssVrMkznuI6p21itBlj84/Fxi
 hyfo6FImK2VeQC3MueNoNZcLT3fAHhWfJEGm67HIfsVBcerOpqSG9op2+eS7Yro6PWeo2QEQiBL
 sABI5X3iG3nlwNc4KhStuX8K4YpB5lhMNQcn1+asMWe4m4881mgtS6jKtmDoPiV1rc4yrewIv/I
 SN5z7xlj0CXl3n0hTZtpF0i6ACZaz4E2HeE3aH3R200aQJMDsW47jglMOHJac08DqhcHW5NEHHM
 H0HvzA6XKSzRO1ViNJ2wmvhh7hqLqVMclcZ5fEuvje9i4OjMM/x1E7liIubMG6iss/V6OcuIrjJ
 hEb1GTYgJX1+M7u32wvYujWUjILegfNHEaxIodU87xSEhY2bAz6Qg2IZ/qhWAtrKUol9kpqvF36
 /DUmMrhfr8BP1cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxwFSiCRQyrIk
 DP0gRaVqr/XKAB7+u6HPrSDm88mcqQogR9OomuhnSjnuLATxjCiwotyEObqJaDPTSFhpbPiqNTw
 TN+T2Pwgw/JYe3yH3uEsYIVS9EYwsvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX6j/ML1WmwwU9
 VvNFTk68esctooGoZPyIDgrKxEgqercm0iNaYcMscUAcq0NI3pLV1Wv/tj8UO1MhJafU9YpVMIZ
 aE+jGWqysSqnRkDX9ZIm4BtKXARUYRT0Q6yNYopN26tpRZB0npOz3Wbsa10Wgy+QTjolXh5hRSd
 BmBeMX+KX3s07Buxie0jb/sgKovgY3kGwJC2hWObxC/TiVsJs34YfLVlx+e+fjLrJqqqeqv1d1R
 uFdULymPpc9zVGcj2zAJF6L5KVwa8lyzXFBTfaU3lsl2bxrFaQ0qDltvBkyFhRpqvvTRBkzMzQ0
 lgXi65JBk7vb4Mw5dJknYemWn3NU7zPjBilaHOMa0H3SEgD/R3pi8wOkeFuUc1+ogj1XGynmtXo
 +925nGXcAdgdzq/vElxXqOqtH+lF65WtPjZtChSyreczsu828In3ps079Yk/KjrGBtEDpPuO0RN
 RLbV+Q20jNKrso0GsDA==
X-Proofpoint-ORIG-GUID: WeaL_QcjB1MIxX-YHG_OjYcceAuOPPOJ
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3173 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WeaL_QcjB1MIxX-YHG_OjYcceAuOPPOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index b7dc40f3778c..0057f68732b1 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -390,6 +390,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

