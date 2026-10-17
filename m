Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7A3DEFFA
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213123; cv=none; b=fgQkiu6bfKeCmvPYG75CBPix+Ia4yQczwA9G6qHoFi5X7v7KCT3sryQZM+GKZ3fnr0jDeEy0AbCIJvVLW00TU/7Ur9pqJZaWHXSELrELUkYFWCuLcqgLINsVCRI1dWCOWddfZjxHyAUzAT8wvuscH56J3HM22lzU6O4bXmBVUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213123; c=relaxed/simple;
	bh=gUbGpMehdXTAOT2mYSW1dLh9J4F58m2XPrcBI0Gk4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyFw4831/nGynM7y+83QOs2Dvqtdx9iGfJ/vcv8FE8SOWeL6z57pg5afJxNZrA0y1abTvQkDtIErWpbW//hcVx2P/dVMOeXxk6RGgL7CHkjUp3ogiPwjVrpEb2Y4ImY/aCxnUJOGsFN92n/aEkKFTrg4sBbJ0BTf9SFfCn+gSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzHRHq+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToMtdU0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzHRHq+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToMtdU0C"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3Pl5Q4134332
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TGJ+GhNnkEO
	Ld2KsiipWAv56syre7ugC3IzB9jrXOZY=; b=OzHRHq+qbBfS3s+Jv/xpFwPPr0X
	G1VwwW6tqkf+6KjhPcaKItgFrJiEq6lCsvKw/QaklHeYRS8sZE8zH/spD3K5DL9b
	E5KpVSffr/I6CXHchGJ86hvF/9BWmraON6KPN8OLumnEoJZPoPV0ocskzIX2eJCY
	vVMHW2xcuR8B2SfswMi0xdNv9CTLsQNvE8xWblQ0+srJ8WWutut69zhyUOv7CSq5
	KEMDhmILHBRkv40vc4zsewWL+RnKf8TRMShK+7bM6CplJe11WtuTsM6EmiIva+DM
	lvulMLYlh/FdZGt2AGF/NvwVqBIEtLc+kk3LhKP75wTnuzjBnxs7ZibObgg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13ur59u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2144378c88.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213120; x=1792817920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=ToMtdU0CfSk25hCBtzjU28U6HRrDGdr2SbZWGB5eepQ2liNF25II9nRTi6+QrEiDA4
         ZCP3jZygtGOl2zFCOMTz0Q61dga62z12CtImYc+CCJ03S0jFKOxGbcwMC0mNvhdUDUA9
         zwd8mgYw3j9lv12SGYQtuXOHBUC53gmlZe9wcnMdloAwheyigY9Vs3YnSnzv7/SJFhFq
         T2FffIKlxsizNrh+LUEUp52lFOxrwZpzBTkhWrBhctJCz/MdsqIIQKuqFTW6+jHOKqJB
         xTjRJE9ZjLQ0dbAHqdDX94ni75J6xoDK7NM4xwm2oINoN5rVHfg2DVrIJE8pPZ3dFsdo
         J+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213120; x=1792817920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=QeyWAEd0w0Ymgs/zP0hXLB3f5v3Ly4OHR3Hpzugt4lj6l/PZuYR3qyQpSgh7jc2CUF
         Pqz9vlq1/tkHoOR+A4XfDQZqOMI5Uw18MoAmMBigWyuPAy6FdTSQRvkW4p+jx/cMrUfQ
         1iog+B4LkpyZly0tWA3kENy2v7JPv1Fl9bHmzV3AC8hGr4pW5pt8IvomJuM6ZJ5AJpa/
         BhnmYC5wn3CpXj21cbEAawmZZiLU465SgTdSreKRPJ+uqNQoUyq33RcUN0DRs5j97N5q
         jXEqNs+kBx4tK39XHsugdXsmDqN6Qp4gp9M8vo5vHje2tQoZwUot7w/diUcvixH79Ttm
         +clA==
X-Forwarded-Encrypted: i=1; AKwUvByaM8jNgSBoBvFRpJrBUcjdhbM6sk3U66cGTL0kNz3r4a19InvNwNRbH263f2yNb9b+A1Ag0Lq1PKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyp8k8C5TjJJ6IxBATKciDgrWv6fRN/UyfadSP1Wz9pJU3oaPk
	0Ygg5PATdLjThAfLgeS4xW8xim50iNqQwF+EsTgE5kwRpUriYwqBzmij0O1dsrQhsaaWAyLMj2i
	pzBy2p9cSA82fQ48u3ePXBrRZkDstdm51QU92Gmw82bBw27zc4CedMf/J1r4nnA0=
X-Gm-Gg: AYBFou2Zpx1oaExuotGVVbCyJ901ocA8ICcGDlJZoiiE5BRCO/zsB27xkvvVltmxeEq
	I+t7dER1sEvUNhnxkC+n4mblQMSWbdhmT1GYgRBVzPqsHn4y1UqSrLZI9TGNH/5U5cRFKSGIOPO
	CcMVXFNuKGdEQYG7ZJcbDrk7CAGCSoYIkdVguZTYl58jbQlkdFHwsqRldASVT5L3Pb5sqmsYNf3
	6XJMDTKM4c4xBfE98oW3bF21Y/U4qwSAaNwIyJW3PrNa1czQ4nqEbkFN1aSDAHIb28Mh8VxsqM2
	V1co2QMBGXLN+eI4jWzXlQ+3drbKjGufLl9WSMeJ0H+jCe8vDGbY0EqR8mryL5wLMyTax1lhxkT
	WmZONq288dYiWAjDpecxpcTFlv6+O0SWldiv9LhPVH89wguWVPjdBVMwkf54=
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450116c88.37.1792213120115;
        Fri, 16 Oct 2026 21:58:40 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450095c88.37.1792213119588;
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Sat, 17 Oct 2026 12:58:15 +0800
Message-ID: <20261017045817.1506961-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -zC9A0S1Z37xvChQc45Gw5_XQ1GhWN3P
X-Proofpoint-ORIG-GUID: -zC9A0S1Z37xvChQc45Gw5_XQ1GhWN3P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX90ykAT4AaDfi
 zOczP9Xl82gbRnPBeu3UFPOVDiFl5L4WSVP15V+f/KPt8C5JlhoCMf1FVTsOWIL48KWRFtj9fvL
 Os+D1tH8qrEKxpGcTQnveFQQr3pb+J4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX6m2ZsenI6Y89
 JItKJpkqWeMFAdUkZSO/JMFkEjVVEKoDM/nwuJxnJtMZZ2gEJLUObqkyfEMvvoBtqyH4n5Y39wq
 MDERRfHZ3Dblp1FJlDohoZRY1dDu2FVYwwRqNaIxoewtXZ1zuVu/fKTkwnz5qmaaJSU0rD0ZYe5
 ZQdk3UvSrf5yMR67T2GRMCfloLnfpAaT5rO6VLgFy2DO8RU6bp7cnWx+giFT3V/YmzuXbzcezbs
 2pgl8H0/UT8k1Pr+rbYwRzoZOTzrLGwy8MbewpQMGwtI5GkwE8w28vWfcLxXE7tZrZ2AD5jC7lB
 QparrTG/iY1jZg6SSEANTFClCNv4ZBLlW0KrD8i66HVFV0dP26eN+w9yhqOeJvMzUrlGyHKPkCP
 AD9aY6DDpqOII/08sUY6QpjyFXgWTbRaYfpMynS9DpJr7WOcUEo4w+rKm5a156mS3DhDaeL02iz
 k3pr9MOcnSHiYqteZCg==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad30081 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

