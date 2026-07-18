Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A90388E45
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379460; cv=none; b=TQaXg6GjM5y/78SDN3sH4x4UBLxg71u7/Df6mIIr51si+7CkG0Xrto2U6YMpEew/mrM+mpX4urvKAwbGpQgIlkrvxwdQaXvk5VFoLjL7uI/q0cp4QSq1NbjNIH5bDzC643uPkgzqQHGFgxz25i+yc8GsiPfwiwNK7yOhwGeC8lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379460; c=relaxed/simple;
	bh=7zqjKQjjwcqqiLCbxwdUYnPwDrzp5EXyryBJEanwhlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK39Kju1WoTAKEJ2c42bZq03v4ltuWHyByb+0c37YlfZ28xpMdYcb+UnnK/IZJ7QsPpMlXUIoxE8hYnofIH+38Ga67ddI9yHTpUbSonu+gmp935GRlhUG0nGedNyJh7w3CdygpTkmAOP1I9oPXeVcZvftOSOUOOA0hDq7OYFB3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDAYGcMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUbDcyGY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDAYGcMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUbDcyGY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHBNZ178525
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=; b=cDAYGcMwcTkPybnA
	HeMNrAx/HSU6rQ7Wtf2XffJmUMSmUk5dELsqAS6BpoRot3Ob0gafwhg4gWrhCkie
	Z8l9JpDkGa3hNziADmA/ehNChOKaI+DMhk1q8bJ5hfk1IHWRolNg246Bh/gMRY6p
	wnDZcVbGSt2mdMuc2KMmEA4Tm0JN04GeofNALx+BDUE7TOGW8Y4pbsbFykxoLFkA
	0yGcmZZH/CwJvRXaJ6psAE6lxecYF6IsJcKfbFXd52Lxl/RMInO4wqJqyPIfl1rx
	MNtp0jvVM1NYoQtahqGUN7THK5VT1uKsHXrmUR5kLwH2nppaqbv16Fj8W57Z//7o
	h6S9Zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so8103111a91.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379458; x=1784984258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=;
        b=QUbDcyGYqveRnn9in4rkQacQsIU1NVnD9mkn0yG1S/cyXfzIkcJf7ZCYVsXBicm2+0
         CSILyNguyCE8jmqDlqNelAwtKh8P5Tgsh17+kbKI+RMfq41+Pa3psS9cjWEF4nGaY04C
         bRH35xK+p4vLdhBT9favnToQbyFiMunZMdlI2hF0bRCGF3c+42NEKpzfEa2WrMOA4fT2
         gRtESSgoYopStUMoeiFsU3SL5xY2SAlN4Eq5Y/JTadLK25tI4O/z32aARYJClR7iSQLG
         /LNGyI2XHO0umOGpv/xST8o5W6Opbltgww7BLpIjqPamEhRiZKUSxgzQ9yco255wj/5i
         O8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379458; x=1784984258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOSzJQ9XTNtgoqsrOxiR0v+1ke7z3w85vhhIIZ0sDfI=;
        b=EeQyEpm7ihS0neiH5SDaQsGSvEU4AaiMYcsHyzX6/ggUiN21q5fX1cADJaCuMavo4j
         Qt1Fw7QpPltjdfgYeAX8jyt0qM3pCej3Pkm+eh/NXa0kvXWtM2NanyD4MDy3z0hbZYuZ
         xBn8pUgYL/HV1vEVTVz8wMbDgCKSNMKiqys+l6Y6Cs+dUcp7anFY7KbCQmNjgKX56ZKb
         XAhSDX2/Qp7xt8xMk/9BuSq0Csuk+TrH+FEKqmcFSIIDbCoH9P4X7c87/RMJBIkoJNRc
         3wce9dWxxrdGnQCV0YwjUKTYr8vrSqV7/QbjgtASa89Ept6sQ/hnfWJm++ZL4f1FMBl4
         TKsw==
X-Forwarded-Encrypted: i=1; AHgh+RpLd2seoVpjPhsW87gUEGcfObkiNOfuQxfmbJsGDoTSQo8aYFqcUj9XQDAQDo8VxVybGXf9fASIyz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xvnfktQig2XzJYKK1zHE2yZ9bj7oCz7Wlg1bHY1PNA1C6uh0
	DM7YlNrXdOo/4qdJiXj3lndxF43eN63eB5Tv+46n8w7ymbQTUTA/QYDhO+aZS8WdgWI9O2pokBz
	k6Gak5FhvFs9DhY4DNF7dIcTNpZfECZHIbBuJXozdDC/2rFbTw0rg0C7jMcOvvwc=
X-Gm-Gg: AfdE7cmzJ2TOjCr+O75jn++mNE3AZGbHcdM9pr5GJLyg3wl+CZAJfxV3uO2MrYDiA0g
	8S9Fog0HN1ICJti+YSK8bshKoBIwfLZkMoj0wuCdPEt7l7Hf55uVjl5+p3uxPuzafQ4YAz0v3u2
	ntX2xfs+aEqzDUZoOux0/mFAPm/IdoMYaWbLzmMVjkWClFjZCYW9qBY2eLEPHGoKBNwpdI+qZZx
	L7fMH2hG0ptA/Oz25x78yrmnxaz0ADRIzUrHCmIJ674nXQRVQAVf0sm1rbiuzrtA8v9+5IfCdRs
	jK+LwCShC/FkeJr+kdNp8zeOAFJI0mMcTQ6bSuL0WuCQiwReJbiKb048GRjyFgY0l9z90kWIDds
	SE14O0ka/nYzNXjvsJTo6LOAvw6Ss9mY=
X-Received: by 2002:a17:90b:3cce:b0:381:96a2:14d7 with SMTP id 98e67ed59e1d1-38e4b538f85mr7358319a91.22.1784379458234;
        Sat, 18 Jul 2026 05:57:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3cce:b0:381:96a2:14d7 with SMTP id 98e67ed59e1d1-38e4b538f85mr7358288a91.22.1784379457821;
        Sat, 18 Jul 2026 05:57:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:19 +0530
Subject: [PATCH v6 12/16] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-12-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX7FHRFFUWb7l4
 SIvHMud21r+cvcGWoWSIn7upEBKDcxcyacxH3+HNfiFWGyHQz0NWDnjsnJvIrjuOIr/gQZ3v34r
 tKMmIRQ47P6SgDpuuzhWKIjQ8RVytsg3Quidd3T4EVPniM2dl2ZoW3OUvdNcOfyC0ybwksnlJWe
 +FN10JL7NjQXusfyIoinp7cM1jKjh5ev77k9lreLg/6rKXjJauDzQ0LArDUuKajMlKFG8eJZlgN
 5CPmDJ/e0jqxKMO0rjiFs0iXPzfdi+MI3ubEaRdzI4lvdx7mkJ3Gd+85VtgG/JMzCOFDPhD+Uth
 6KuUMn65IM8Xldx+twUi6epGwAyKxQxt6gmbI7tGiX7tueCqRHa69TX4FCL3uVnSNPUe1RVNbpz
 w7INzlQk/1aW6oqnZ0XWhOOhUJ97mkPFe/2uaV0kLl8QNQ65mXy8vIMG6XGhY/1XbOPssygcKbn
 gCa6IYmOogBvmvurP9Q==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b7842 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jPm-3n7eGs68fwHgNG8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EWW4nxFKJGCrhIfgxYh-c8WUKnBCGVC-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXyOyXSOPpxM0S
 uGtY+w1OZNoFm3IZwUVBA3lTACU1lznnkY1xH0Q1OCIdBa8FtN5cTUmFlZd9DrIj+S1VQXNYFl3
 DsVfMONAKqpYU/FFL7RISJQsDI42Abo=
X-Proofpoint-GUID: EWW4nxFKJGCrhIfgxYh-c8WUKnBCGVC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

Add the missing power-domains property to associate DISPCC with CX rail.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.

Fixes: a2b32096709d ("arm64: dts: qcom: qcm2290: Add display nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..590bd2432d85ba80891ed42df8afa317c869daa2 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2197,6 +2197,7 @@ dispcc: clock-controller@5f00000 {
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1

