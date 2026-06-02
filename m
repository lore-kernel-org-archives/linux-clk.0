Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED13C7689
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387715; cv=none; b=E813gjREoTouGnM1pYnvf2UqQyaUkUDAwUeDdu1k+/Gp967It3RLEGZNgYt9UQb/dCswW95ZYTDbKS9GAFci+hIBQH348SP4It4Meme2esC3B6SXuUCxXOdVGLLwV/UfPk4gF06wFMySxub7K4T4EG8rrteirxlF0zbzFhApAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387715; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU5MNwXfAdG1drVn2Ty/oE+MvOuFxmuzA06a1BaRSvBzGYWU1apfbO+dvlfA/boWZpX4Fg3iw4L0Mkg+9tq+IEWtx7Az8jkElSbZS8FZZdfwHbULyMGkFf8H4gHpHdpwr4SU4mN1rSz037pmbMZGoBkNzS8rhsvc6gq6784VdYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqkNaI4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLjLR6OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqkNaI4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLjLR6OC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245oD22692313
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 08:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=hqkNaI4rqo6FoMBX
	H4ZyzuLlPHj2kY/iRlEYAb1yDaCLkeF9z0rBJpgRMp/K8e2mk1K6kdiTuI6HRbNZ
	pmQs996N2k0XOqILj7lWnl4LpF2xcXTJ0FfB+0QeRFHdF/x4WXDnNpwNHp7K3Sd4
	kKkufTG0JOXV/Gy52cXTkNbXH2KRAulV0u84FLrLu2duXbM8HcsThqBuTjRFoOJf
	cw4JYyMEyfLjASjYBWE6MqAXQXWajhegIOOoyzkkH82Jj8/3NrYaeUb5AwzHZcd5
	wgm6SaFTa3QH4zq9591DssAzpWGXTaMDHSdTdfQ1ZodL2F0GxyEy+iLMge82baE7
	Crk73g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgwpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:08:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137ea73393cso4881208c88.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387709; x=1780992509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=XLjLR6OCC9n2Xa9cttOqrA1Ri9DMsWKU97mG4Ija68gaqmoQ7qKyJfnzzf3uEeonhV
         GRi49r5OfaFSOoZ5IXdRsYehi2osHybaHz4CFZnoFURvT10twclQF7kPnDdKWHZ0UGrc
         6wSq7Ioxn5/YaaF2NTBvW/uE2r6R+jBLUOPTN8V5ZZ42zmR+nxN7Gkjkbo2nePeshl25
         sZ8JeYSIndAe9yFlKRHbQL0z69ZF5EFLHwnM9h8A7gkJGGD+1MR7un5w+KnvJPM8T73/
         i/ByDZXoaBcrxBaMDVqQXTnLB65stoMG/pyMjOncHIDsRedoCyWl+W5de3lEnlAc0SZb
         7UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387709; x=1780992509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=Z4NBjj/O9BFS+MvilWs/VeHLOlDhSMU5o9TqsL3d+B+jwo95EoS31Jn/lmBKvPXAhW
         3UP38SKyEmiaraW4HGciXC275vFoVqTjnMTN79/b+Qq/nD6yz7R7LGJPGBXN6Eos8efF
         bURbKWRaWNeLfIcZ7wv9kotfEh5frraPLInZPOcOQ6hoYRFzBopKTeH4na/cKCTV+gzG
         HUP8OcScf/giSuh1cu/oGWXSCtwVxg4o0VzrIx/pK2vxOlniT5D/Jr9dEo6b/I836iLd
         49mWBL4zPAshhvErJoFDHjHzx9/f6/IAuftwFxf6qwJpNanL2MMWPmsQAukGiKiEzwB3
         1ugg==
X-Forwarded-Encrypted: i=1; AFNElJ9yv18pQSz6mUr/AxxHtcP2A58Lh8c4F//EloA5Y06BZxSmzaNgnUGpBIcWoGSrKQQqpTQKJi+4y1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7/Pco453r6Pp0KgyxS73KKOV3zXbdpVMxGE7QhjDpPJ/ed8G
	rw6cu+zlRSWO/qE0kSUkrb+tSgRmXWaYS4qYpUa3en+eAI/kKC6Wld0mWEIFFtPTjUInOE4lXxL
	x0zEBZAftIRY5aXEy549mha8ymNQ6pUE8/mfPiTFPjputlLAHgtq253EPrPtxbQw=
X-Gm-Gg: Acq92OH01cyCZLqB5RM19zYNVe0q24d5B724IVhWbqkwvKvictDWsC0qVRTQrW/yVT4
	EV9rEPHRZxEM5s/56aaVJoRkP8yiMeQQNN0MUpw7BfSuYC/k4FWIdTtoy/epRKkQK5lCriP7tdw
	D2XBSg96hh7yeCCZv0ePWgKRqu9c8yOkU+tpfB2j8oGl3HZh+BXljcDlvlNePcykIeaA8z3+24S
	hChWpPJkkRPO031+TFuImGMJ7Yrp4j2E5t3qWOCGXzbo/Hf9Kmr3+WdSS7yrun2E2NxqI4aK68w
	TWiOaJagc4PIXom+moD8RGoKSaKXWHCSLRVdzKiWEeAphddBs0aCPMo3sfGEHoSRSNw3k6lrqhj
	NwoBZx31iyJRxIGrbLHzogXZGSS0BORuYdPJMEcZt2TGWHaj4hqBt1QJT9guBcjf+u0H87n/jxz
	/sSIE=
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598625c88.17.1780387708534;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598601c88.17.1780387708024;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:23 -0700
Subject: [PATCH v5 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-7-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=H98TNurlWjladkP+bi4o+RpFOHyFZNlHSpzGx9FP6oNW2HziFKwHwxqJJ5ZGA3y6kJUjBj2q1
 roGThJh7vkVDcyyk4KyPU8ReV6d7YG2bct2QVVM597xzdq68aEbD5wp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX/LjE+OdTQbz5
 ESombH0jlNkyoMClmFOxIp8WlMVNGHx5xEAAM4v2UafSMmFr80fCI9XAZOVnFoe8t6KmHr+y7wi
 pd4AYr4s7bCUVPo6NKncgMaJGIefqAocrfF/jWPNRcaaSNv9xD02+efu4e7AFxRkZeFEMSAPXkB
 PBt8Jz3osF/1HeWXY8wKK6niD+Pxo6P5K+jDW18ZQR4Td5wl8eRJ1hAghBxxwA5mSxGJMxPzEwd
 gtyIudnX1y0qtyGSdUgQXTYVG2ry0PiuAdZ1OKVMZMvXn6BO8ZMxdViYzuN2wumtWDf/fMeYkMg
 Ja05ujy3EfkvrmqlSWGqWyBEyXpXOcjrBj5HSa5shzVk70lyiQDVg3i0OnpPQ/9XP5CSpkojZbB
 alJNkw7eKMV9E72kHEEQDYENSPjGNmFwgFBbad0m44plTxzali9YICXEsWk6miNOkZ59wJjCgam
 /PTn2BYDedXrTrjnTBQ==
X-Proofpoint-ORIG-GUID: cyvuygvjbxUwXTzfue138JAOlpXSBSkC
X-Proofpoint-GUID: cyvuygvjbxUwXTzfue138JAOlpXSBSkC
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e8f7d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1

