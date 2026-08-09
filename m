Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB93AE701
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260546; cv=none; b=rJsxsQncpa6m06Cps3FscFzvkr1j5KW/ljw+6UlksvuzNcwRxkbYyQlKI/3rB9a4cvuOLGVackfWyBPLmpwiMEvezLeQYMUWNXXLFOEj5G133zlEouiwIW0EfkiMNfQtaLSJ8utW0WUxje1Wyj25ibB99EjBy63pvy36m4Jlloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260546; c=relaxed/simple;
	bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ukv6YcFOjJuIUadtq8z7Kd1p/AusIoAxYiSgVXj0/2SxNraPTY7/Tc87oRXnnIEpXDfsF/arPO8A0lGkpHaQsbLCrttxCgHVSYsIK9XDAU2WB6IIpsZdWxJkI24VVohiqikDjQpnSs3GDgm0FwAzU40//NdhCzQ0xqMYevskUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwJwB+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBF8MDD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwJwB+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBF8MDD3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6796ILWY2536441
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=; b=GqwJwB+/+9nhdaGB
	ZAhT2ftoHgMggjeUqgrE+gwShf03PhpseCsxHpmiwbIgqgxyReeUssghItdM4uEG
	Rl1tQH9uDo4wdeLDuMUDiOUV61OrhVXdXHaawHsZ/eMVi488Qgw0uRrAl/CofYCG
	ghhhrfhvWUfSGbajJJyQ+49mfRWrKUs5awC+7X2JiHUZ5Zz4vhMYJDteMyj5rNs/
	z4yBB7EXaP/0LMgzr00n/mlVdaq3WOvIS3KqvW/9D2kAFTfSq0tCzdttzFwQB2oI
	VIMjGLrkQazqamga42pZdKhSnONe6E+gA4U8CfH9ZdEBBPsnQAWLYY19ieMkRe1y
	FSZ27w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqjjvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:29:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so2139990a12.3
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260543; x=1786865343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=OBF8MDD38zA9TDACSBvzWbhGFsowAFXN8tfp7kHCt/a4scAFOdrorzqavoTx+Zh5/h
         PQGoNF5wM3JcNJ6E1VHfwGY9iLyEZiWZb688ebaCZkJTbpd7tojqLPCDNJ+ifMq463Xv
         NpHMYIha6K6t4Ek3NeJ7q0OpptE0xcJn4j2fKZFkdzw2ROFwHBOA6TYs/XM7+7KfnP2x
         bzpDYoZpoNv+KPe9a60j4IwgWHAkZMTudQXL4NbMNEBh7vqE0cGABwNbQcW2f59I/WS4
         BjAJ995VOZLVCKstA9qm+9ygu+dwWQPV8tSvA5j0o9P7Yh+hmvjK73mRr9MEchuoxFqT
         Lz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260543; x=1786865343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=Y9xzUdlK/VCocP+O2tCAJGkxiyimzxdDFk0SYFSXMC6Mw3cvQWo4bWbiVt+olTYu/Z
         Lruds1UQWLVSEnwQ2yjyUpGhO9ZE9pyW8u20VZ5KmhCMFyzcliwLUZo4DT2kxyXvHUwA
         jguYJzd70AUPydCjoOqiiHKLf/y8wVErE4pMhRrHg9QRRe4RM8qPPGQLQPHK9uSVBHzj
         JVWFNdWmvwguCrpyQK8h4AdnPlj4wTFMyIpsfEhrXptuvnu/Na/hTd6+p0bhsS/AFCPG
         et5J6yzCN6SLHGmKAJNy38iEAj4UKnbFPJHiPYKlBvRavHwzExr/dNimtbzIgchhlNET
         KFgg==
X-Forwarded-Encrypted: i=1; AHgh+Rr256b/v8OVUwPypDNgxG2Jp4X3BtHjRgnKnEKpjmnTborGZfj06jEQ3UNQU19n6hBdZ3MdfbcScoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KiEgY+a+5pFIAe09ve3DaL6v1s02o0n6rS/86DLxwliIS0GT
	h998der8SyDsesyc+iPkewe2uSfbnxu+S02Y5LVxwTJwVt4csLJRzECn+0WmpQ59yPeI8c8wzTa
	SGiMuFYVg6bGB8+VH2PJqAGQJB9/H6bFb4CPoh09Ro2IZpH+71RWLmgOHz5MSy0Q=
X-Gm-Gg: AR+sD12gzr137aybxq7y9IBanh9GG6B7tK5i/kwtK/Mk02wVDXVCxegItKF3JDXHz/d
	DDQK3REstoK2X9JH2OmRm4RIKkSDqFkSfvXhi4riP3oeQXsDDj8zAe7hki7koyxLj2uGQqkrDZS
	AAeTUjnJvQ9HERn1Kngn0BjK8XeV41JDrGvkQgCu2xQ40CQAgNKWlsUVJqUNUELLf94LOT83Zex
	9Yzqg21Vx4zxlBuB7nyVrw0jSonFK872T1/UeTcCkoTX9OMj1Jh0dd41MvJjuSKag3Qohs2lIE9
	pULQKaM/6p6QOHpJgCDYLkARH1DS85wLJ1lbqUZ8B1uf5fVZRnEetbDNtIGc/RmV4RFcJCahM+p
	5ACz22YAaNT2LKkM3f/+AIlpiO8jt46Gq4edDjcEKp6lCh8Ak/pHtnawioH052R2nJHwRdv86hw
	E3CKC4x6Tsrnk+fSiH0xqmlkQ=
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614642637.24.1786260543537;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614587637.24.1786260543008;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:29:02 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:12 +0530
Subject: [PATCH 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-13-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=798;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
 b=l9PLOYb4vo1eA2JQoI6YE2Ad8LxymxwZEW6f34g3FTwoT5FQ3BB/16Tuu5NJ8iklopEAY/w0L
 LUVNBTE2SBZAMvWNUOoGpSC7suV44JRDq7COOt5gSNJL+BHPAxztARd
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX+axI+kBF5YOK
 mVrvbWgk2SoZcABnKiKzG3OPy1IQcEz3nM+mnuOZYCadDuq9lV9OAOucmZMx+r9ysAjFz/4hDoJ
 bjjMCiw/QigQfJS+l7tIFCqADexRzLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX7s4J1OUOV6Dd
 cwgs4enJePTNBO8epWdJ2ZQrYMwslhC0QzOBP/h+1O2vOcjV6UiCoco96mY7THTIbAaITQAKjKF
 KQcdfdGieDaYRuTgNCIyszt7VwCnc7TIN1EG20803gxSTiEWqxZBOBUs9Uf6tIPrkLNjKJwIC3N
 hrieeTGeuFqJO+3qHj079DShnYAANKDzQw8LjrakachnyvRRhdwgxUhlPA7RsHNGsqEpdbycWdl
 8j7QIM753cZ7QD6LtY8BpyoHzNgehFaLXijT9J8/yCJiA8nWtJf7j6MZaqqZawXPIxUIoJx1BAl
 Rhcfj4sDy7CgfDMnL3ATt1wjZ4q1I3piW7UhWZsDKbcDy6OrXkXmkg7dFl7pfZZcbla60eLkcIY
 dTUBTN5TRbc+LrBfnvpCaRxCYTc53ms8pDTn47EIl/mZoeGoMp7v0IFeSfxYvh0FVxRk+Sgw2JR
 DPMPqlD6t0eINTRu/nQ==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a782c40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=01DA1dDmEfGoSNMvxaQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EtdcO5m_OeIyjRYY8mZJMd82quNld5EU
X-Proofpoint-GUID: EtdcO5m_OeIyjRYY8mZJMd82quNld5EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

