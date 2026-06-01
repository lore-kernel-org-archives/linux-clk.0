Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD43233F4
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288170; cv=none; b=uKXIJqZBiSjUd7QdIsFFcBzkY7Qnl1vzxgIpPiEHXnRzUg0vuP4iaMqhlq1DEfyuoYJJf8+cfMqtUi5Yesk8TC4Ye25FpqQCiAerZgcji5Ai6jABjqNR0byuTLaFChiGDocU0A2eJ222U5mF+ahS9IXev+SfnogmQ2zBtglqAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288170; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W54DTU7qBdrk8a6CEgvBmRURKNRB6Mo1ih56I0fXV2PI+up00wCuSKXgCHNuw3wtC32FyS4Cbn0DXvzKrZF27s0AZJ5rfUxmjcKpGvJ77ZEJickQrDfLN9HO/ID0iQ4M+ofcv0HcudgTMrtKIaZf4qcJ0URxbIJw6EfFQluYicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVc0eLdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Tz0W/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVc0eLdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Tz0W/m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511O4Bk196252
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 04:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=IVc0eLdK1B17gW0m
	Qn1SfzqlkAoAgwwO5/bqEqTCWwM/zeTi02Tqckh2GdQKLyZaBMeNgIeb9T3DElMZ
	n2bm1a8ZtwbEVZGlzJkENGCYu4DsCbfTJm+zXcq/qsDro8ApyormCn0b7zluYRmw
	5zyIMIuPUQ+8uYrG6eULHgJOPrTTdkJB59XUeDpOY4L2CFB1dJEbKPwO7ezTVc56
	icLu4wmstubr83mW7lVPHcAMx0SmPmlLIABUQKOMsgdXK7x2OPwd/daPG0nJWKM8
	DNZYALdCEThn9n41vK9MiL3lsl9QTAjJTji4Vk+j/ZOaU9M134n2UWOmU80+0bcz
	ie7gNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pp7fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 04:29:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32259e0eso26301205ad.0
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288167; x=1780892967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=V2Tz0W/mhWyu/ifAW0+gTIKzO96xislM8crI8J2RTKmzx+21yik0cUwO+i9GVHHh9O
         UNTW6SZsqe6kBaUfirD72PtKAV/dUwK4+QKxvNANhxpoakJryNWefrQHWhTZK+4QuY4U
         Y//iPHa/zYwXyX6PQl6N0MDakkuNe3r6HaHnRK4X3e3EYDXMoeAD+7VIOwUlf0DNC3AI
         P8N+dQDSEMUCZRRDWajxu/QFEHBGNZVnJ3g+JHD3GYUtsflj2NrT3Ba9Az7qMHNhaNz+
         gFVGinYYOk0rC3hyZcdZUxZScoXl9wpPYwwf1MGP0Bsyxf6PEpfbFGNTXLycN9X/asLm
         6yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288167; x=1780892967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=gyqE9zTD1247TllwfCTTuDA1bhAbt64YAhERVONJasVAbGY9ujxnXEFWOPUZlWv1Sp
         Ir4/GTzR0fSR4haFKpSgKch1g9j9Y6H+dBiGqUjJj1SCLFG6ZJBMaJtRN6doygYgGz+S
         r1dCiZBD6CF188FKlcL3Q3L0gK/HIwdghyeY2DRSRXx0ioeHO0NWrLDAFwQJqnQua8U3
         MW/9H4BLCFvaNQLOr+W7b5zp53PvNUmwPjoiUdN2ek44BDQSSolkjRRosqJ3petpX7D9
         zAwNmSRqT/7a01jTCvZgZ1npNb5rQHpig/w1zyrp21qwcAriohyYPsbWZdStFEcLk6jY
         A2Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/pq6g/oES+lnl1j9X2jlWblowjQDs0KjQGigar5HUJpEBFFScLhVcLI5REb5KxH+ue6LrVnsmCPzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lX0ENmHtFp71gOcsJVsH3FAX8n884IlCdcoFp5j1/XrISMS6
	fMQ+WQKyNGfWiPBIkiS0yjAOcJkmufAD8a9+zq9GOrHINYfgCsXQx5rEB359Q5a9Oc2DVg85gfG
	FqJkYCfMmL4YtxuPsDDXI1bpABdk596t+vo+VpRplwIRvK71i14bI3YYSHhXpuUQ=
X-Gm-Gg: Acq92OE2HuuqPP+y7dWyvTo8M7YwAELYMItnWuIkfTCG+xL83uhcAAGtIKYPY1/NO8O
	eCiRylEsms3nEx7XQmhvAotyJVGhBwwe3n3Ac+ndcu22KyKCsBUtd2MpBwLeQ74nAVVBNT2L/aM
	lqJPlIgMiBWly92F+IWNwwgllcue6f9xixQ0I+AJzoILmILZvxgCzNFU6UkdThl+cdvY/APZgp5
	SYh9pIPEBiT2QKOIQWM3Pt9Gj0ImmROHszBmIvKtOsHyBxBcTuGQQwPPpGhpEDtf2G6mndPyZM0
	Gajcew4ZEMtB/2y9duyWkxFEhYbslOGmIzqum4xQ1NjVXpzHc3/7baB80hbhA/Bs2zGqSajLnDq
	TAWzOlQWqoUlTd5awCrAjH7i1tqTqgJleSUz4lkJM+Gufgi4Kr+oWrcQhGPsv3kk=
X-Received: by 2002:a17:902:fc43:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c0a555946cmr74635855ad.6.1780288166899;
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c0a555946cmr74635565ad.6.1780288166496;
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 09:59:13 +0530
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-1-76c455f5d579@oss.qualcomm.com>
References: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 5P5FN8ysrUSJVBlx78RbjvmaVr8aVI5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfX9yqw8AY9SpI7
 KAsqQnnfXn4ZQhWEYil+bRm0j0MNqRttzhoFvZGp0GJ9YEbOEKLDZNqpy8Ev/37wFbHKDt3kydZ
 FsBxnf6QGNOm5DB1ACTCmKYeSaZHIJJwZtE6AhaP9KiOibCaFdx127TwAst9Zz++RlkIrTKsL3K
 Kj5TaaC5qGCKrFAu57OXrFswf6iyXgUr89j94ncyf+6kYdendYNe+cjdv/tV4pElfcj9qGRXBEH
 s6M4GzERUjOnNXKSSDfZ8LrRkraNP7zeUDnGpnaI8SXAugmUNYuNgn3KKFapOM7/9shxUaE0rVS
 VLQxvrAWxqFoZRo45/YijziMOL2GRY981B4dn/X+5JXJerVN6USgHn/aQpEBBv4jxAVOy5Uwrfl
 U9KZTAFRuH7AXMVsaBA0LlyF4U4yuAWsBQWx9tSqUMW+aa2UxrdXHGJU59hdPmMPXORorQZiTG6
 yV9jCP51lHx8kNMezkw==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1d0aa7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5P5FN8ysrUSJVBlx78RbjvmaVr8aVI5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

