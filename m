Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F033C1B7
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144024; cv=none; b=BctR9t5vpvGx1Q7lqGrtmJh5BUu4pR+Hl76LrRXGIBTLl+8ATrhJv7DM/QHsRd3jRxdjVTn5AZdcWU7PZDud+6TMie4wt2S+lewFxthLB7Da8jZFefDDl9API5bTi6Fmx0/G4kSQyq002Jui6++bj354bvwhoeHD91Kq6nS79uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144024; c=relaxed/simple;
	bh=vTU7egChOM/itNFwOOhUe7UhGKcx40OP+2xo9K9oosg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsTasQN1gpT1DZDJGBDGHC8YCklAiG9PrrwIYJrC769fspeVI7vYeHSFZ6XfVYrkHmHLQCii4ukcagUcMiR13IpYFxHjYcKb4ciHrm1qBNyoXZwhcajG1qpBBuVPTyDmJaU8dNlNqycyuEiaFSKonckhm23J3Joghi6+QOiyZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b84t3rNI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2r/Py8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b84t3rNI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2r/Py8l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClltI237976
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tECQj2WCuXL1A6lZ4Onlg6RxiyxeY8b0DO8Kgq0Nn5I=; b=b84t3rNImCx/AkUh
	h6bFqKfmLHEmYPmhIapwjpMYy0iA1h/MgLMpxmsgE8Xrrg3ahqPArfkY896ApTay
	VeqtWL4UE08NztdAYdFuynMSXdqP47cH3Ghhn7hDnjqXp+aTbmmP0QvRy58CJWiU
	q8jwzaK+bt63RDD8gJ9psGHYd3Ft19ivlxDD+R7Vt4lamY7pTf0kUNGaEE/+lWIk
	2yXeTRv2R9mRG/Jp53inocAc0Tn373D7trYUZ343TAuMW+/nvdebIANzfZqzB5dO
	BwvrUjQ5TkAX7dYsbSEjZbmeOj084y8ZyIBNXDLBnYgXPXfd9H3/WnPjOWk7JyLD
	ZVsSEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnb78n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so123763385a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144021; x=1787748821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tECQj2WCuXL1A6lZ4Onlg6RxiyxeY8b0DO8Kgq0Nn5I=;
        b=Y2r/Py8lH1HrDgun2J3SVOd2iUFx1/5tXgfWYzcsrT4m9HjHX5VcVGQ3VvrruDmCKd
         AO4hxpcOw+xOFJ+hdMu33okEoMazz5QhBwlyU6aSHSKrkgKE1rime3Juzes7T4fm2GUq
         leGTpzzk0XzUnwhnOZwBhjeDq6JsGPaJSqJWRLr6YPzVdNoVNX/oAr6G3i7W2jjyonvP
         mUniPNRCptZlEUe9RXnqIEwGkxLmKNu5by8W7znZrPuSM+nm2JPokLtMx8F3jJl6xYD6
         zaXG1Vy/+YzoTbE0bCLTlXP/SSdQXTaRi/eCh6H8NLlEobp+fKHCQQlaCHZ8jqILXMV7
         x8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144021; x=1787748821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tECQj2WCuXL1A6lZ4Onlg6RxiyxeY8b0DO8Kgq0Nn5I=;
        b=NHatzNOGe2vL8vr/ZgX5MrPvMn4z8KsiFpigEgTEAI5gFeYTRtPA7SkNNTDT2u5/DH
         ZQmAnnogcERQEf6tp28NhbYP8kKAspfj/e44mRhs+Rebp2Dy1uij7A+t1NdR4l1bwJgG
         FaoRPqBRzvvCSm5wI2xC05c654CqIsr1xaTmL3G9iLG1uzGFOwUL3AAmtC8QC/gGGl3T
         VakbSiynthBY0VV13832569vBa2kp+7K9CMQydVn/kmTNsADLStlOIPjAvCT5rAgWIOq
         gntbEJRsnEi/NBFUviJNXZn8jQtANyxoMY/mlkP0vcMPSIwcnMhwxjbTHtHSHGMCXopX
         Ap/g==
X-Forwarded-Encrypted: i=1; AHgh+RpDcd7qH2flk/zJHHCIxBSE8Tmy08gr6WbeAnZKWf3IdcKpjpRKDD3xyzWdIcvWITIjDLcclJ/bkuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycD7G8RQPqsYRSgGVIiCaaLcjxCHirjYJFrRcJ3/fb4uCM7w8+
	a5FkKjrNIB18acnco2umzVUPIRLd8Eai82/w8Hga6EPRXm5i5tJJpwSDBQ17v/vnEmYfbR5IbUQ
	O+azQHPUFm2t6YBCbGTAiyOZET+v4MP3dls0uVTEHyS4rdpPhU6ujKxWBq9ztC9M=
X-Gm-Gg: AR+sD12fhbZphdpTp7ce3wRVhZ00orgmzIPrPSruvL8IVs2Me5Bmhzc+3Z6rERKGiL6
	Z3X4lTF/RiUyx73HnFEQnO/aQDXJnnrla3Ku5kiL6J4tT/PC3rDrN6kZ6z3BfdPdi5uENee7NSb
	PI1yXm+mM3FEwqb6Wpe97bRXgTPLDx4v159QrrOSle/t9HsEyESbP/8XvHHHlvvSpDS30v7GyOl
	XppdhJTW01vYdJSHHouW6EKsPr1ceSvl3SJxIN6mVtXwO+gRZKRAcHcpRmPVVclZy3a3IYoSjtB
	XpEyll9GZbc9jz+Qb4Xd7MYFfMLkH7kY+OVra5cQLepcGFM21cAPyTpbHKsXE5WOe+GfacwemOg
	UHq9kzYzp
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr381077185a.15.1787144020916;
        Wed, 19 Aug 2026 05:53:40 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr381068685a.15.1787144020251;
        Wed, 19 Aug 2026 05:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:56 +0300
Subject: [PATCH 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vTU7egChOM/itNFwOOhUe7UhGKcx40OP+2xo9K9oosg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacdGy9EkGpJMbT5E7Wnn5aTjPX5rHXQOj1N/
 ku2AZKZaDCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnHQAKCRAbX0TJAJUV
 Vqw2D/92HSuuoTKxMyGzpU6h8jFotFuyIV49DwbZFzVSt9le6+WWx1ce4GBZ1kvMGQgz8+n5wpz
 yLvc/CGIF4y/yKD1KKHFcJ5ZV1TNYljSW62gLyeaKKcVPp1UmuazIgQWADZH61hFXT3fkMC/tdA
 apizJiff6j3FUjBYLCvo02YCLBPA62b/Sy7N17UC1edLhqehfeCnV/ugbzhJ6fhromPjPM7oQfX
 Neak5qUdA8NaXkDCvAa41/3ydcuMwQXYyBkMcXoL3C+dl2Tojsp84G17ID06iuUFWmTG3pGGxzK
 hUt/3fg5QAhTGYpZau91YBi5V5u0edWzoBLNyPuc0oaE/AM8dVUFCm4ukOWpFt+d84H/a/VC0SB
 w1k73dZsL9Of2sOw2rBVLxVJ77VZCHOMlH1VUt6EJNhwmsJ/Tolq4/lA4ajv34glf8MHEzG/ANA
 mnjmlRl8EylANMjhb03WmwHpefY8gyXmV5BGgMcm+5C1HPVi5uPWwuNEJwJfcuyYYM132zJCrJX
 erC1dbXe9G6LITaX1XaIQtHPB2scmu+w4n608gqAsIYzT3jqGim433DMiNZ0gnv0NC51tp4j3an
 5HJXkDeXdQpKFRgIzovc6h0Io/dNYUHm2KtsvcdfsL3smeH/ghqp4IXhLL+HNVdsAURmTTNYctv
 MFVOPIgUcEG6xjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85a755 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1JwpVWvtT3xiYg5hWjq32RCy3ZLfyM-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXy7lKyyBeRtWK
 lpptXe4ZDhTL5y0X4ravQWxChjBj95i8JQ6+BDVhIdYsCcMVMuHLxZAoyY28Xi3lHdw/NQcBR3X
 KTiqW+z5WP7hrB6+/mSBfPNQAIm2ylw=
X-Proofpoint-GUID: 1JwpVWvtT3xiYg5hWjq32RCy3ZLfyM-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9n1RmIEeua6b
 sboY0PE4oLTfMJeEYrGb0JbYXdpZQ3wmsWWGlMlXNcNXsHiF0FmaTjM2Gjc4aVxfTaPtTE0lect
 jlsauCZkqBeRLPCz7UlksxhNfJn0Pn2DT+jXeNV0pSv6JkhpYzuOYnWQ4CEP/PAy0UVhOHMZ+0u
 DlgB/4aLIasaH9qHkRMz0iMQOaVHl4EYN+vsuxf0fU0EHytcrAAahl/ceeIbwyhhLKWatndQ3oP
 +fNn60kEAogwzvsAzlFXq5OgMmawMgUQyq4+ZdUAwMATB5JwNPHuEd82hhOI4BUo+FTad0cT2Tl
 apOhSap9TcQTYy9wf2zIdH8AlCYEalRzvFomoM4mbpXNGGqrc+22RY9Ga9TGWl85/0edRTyo/K6
 k1HtBMyvoeARK5etDxbdoGKIwl1L8Dlu4gQJLKqR6y8164VSkPVrOoS5lZBNJgzC2gBSd6PkxaZ
 xQ+XER9sGpwBR46ouOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..176cced72245 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -942,6 +942,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

