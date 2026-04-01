Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEB330675
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025338; cv=none; b=XPaOVgVo+EnoBAZ2rGfQf8hmyhzkX5VrvWaZRng5rLWFHQ1ZXlBK7Mq0nhFOELEDqZPa38QyoiQ+DLYqjP98glfdXctLMA1pPJdOBjHfk1hG6ITxU4X/WBvvuCefq84RmF+yU/y8SOHslrL/NfHTeSNQ49u3vLYZNIZ9EZXU81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025338; c=relaxed/simple;
	bh=h+6iokKQZz+tTzp0NWNeSPU4XGXWquRPqhH9qv/wUAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAWnNwlNheLsxZBDi/mL+dr08If9E/SAMUCUd1wmsTz8R3xIz8RJy64WthGCJM1VG5gUBFQBWd7viAyeSKTFzAUZ6lrdxKEoUxg0jkQMAr7O1RrNOAGeLPJfyM/K4mp2HaYlyxMKN+DmSf02UKBxeUiY/18uNwBtZohKmIhR1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnz5zc24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFvHG/C1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnz5zc24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFvHG/C1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VGmo1459303
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 06:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=; b=lnz5zc2428jcxJJ+
	1bMYF9WArX+XrYuWWJW4oGa+Joq+wVxtGsQsgPftncBROcsFvVyIrzLopE/uZpFr
	iLuXb52Km+dCJvb7/OjQ8v+L9lOiGwteVcWv6tRvQxglpLetCj1FPcZTAO22wnic
	0Qm2NdvuFWtrnuXcaxgq99fIQasxStsB58Km7jKVBwIzsyVpVtI8WWAa1O04e9wN
	NLu18Yvfei2hRHr1Yv7QAtA1AafhZjp/dsqqzxxKJo3Oim/uQDpwUI8rS2ViE9TP
	uaYOamfkXMtagcwlwLoipLAodCMb3A8gBTYSIworGssOe/mpiAC46OeUl1FHHF2y
	FYyCYg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0n3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 06:35:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127337c8e52so11604058c88.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025335; x=1775630135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=;
        b=EFvHG/C1kmOGDPi/Pom6uBeGVSLYXLxslRaQq330TXbDHha8ZeyewalO+72EFPzpAg
         rH73Sa6xSdmCfGbGEGp0qU+RcPXe7OnTD1H9MoNksRW5vRDYHF7fYVj7RXMAVYCSxyjb
         UCld3gP1vVeWKbsPlmsNhobG8KoPRTxl6HW0EafF3pfGB1kBzCAxrpu1Rkka7+tR3/e3
         RxzGL7r6T3syvAB905jveyPiD0dVHK90IpZzCnc91pIZW80mzfMVoGf3MMf9pprqA+Vj
         Ukh7BpbEYkRBDY8rOGjEJCuLFp1r399XsOZXu7RfIH1pGmjxUtP2xWrLCiPHDh7QprF+
         q9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025335; x=1775630135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=;
        b=nIEnic31sdAk5mjP44I+PqsGS4nTBSOZlLsx4pbDimnGFVQvH+XHdvORJPyDpRX2m8
         /+VcNiC7zDK42b4Hg1ArQB3aeLy9GMx1Pr1go+oK2f312muucIm+vPCD5uwE2ENVrxQB
         6I1hazI1BZR5hbZMMnj8G7xvExFGWkBAPD4pAh7qRJ4PZck6qZvUur4NkVBk3KdYWKsl
         JKSYNqy73AXw3QTkJCajwjYkIG4CLJfGHk5zkpx7t9BMS2hPSPC+w4h9BnTEfXYhRpYp
         UFNtyjSYv7c6/wcsnXWBmw86BlZmt16OQ0I4rgsn2GG2mFK9M10kMVj0VRvN5vU49lWh
         VJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUzc8OImMgrQYtxWp92upu0dosrCy0J+ca/0giK9jCJwg3JlRpvlgG2EDS1QAECGJYd/aQOIuT/U4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvoaLgcTQ+ntPOnqPlxpRf4NT+utYwTgAbapm2Ad8gFd/usL2M
	Xwp0nNBXf+gy4vnhroxQ0umlIklqPoKELEsmpyHDGhj0o6TAafbjDu/yKZYcO9qsA9BhBYAIduO
	JZO4BtX6RU+3sm0l3Eq23MM3hVGUxkgjTO3m0snycTfGV9zqsV76zL4wDF79Y3/0=
X-Gm-Gg: ATEYQzxtJdP7RdDnuBjE3d5TcZV6fYpXn/gz5EgnhcobcC1skI24ijhod2CYNbl+dWc
	/a1VCDX4BDzc1+ogiEwmXEPPFlpFMWnjjocnn6GRJjoEHIT8egsbojzfIORz7gIgzyNvfY7Enge
	XZrXhJ9BhNhCmuc/htf1SeoMDI6+sSfBGehAaX/IWEdzwGBtw6QAqIbYCJgdSyMuJYIMS6W/RVo
	drU20Tw5pypySu0Lb6MkheVnYjh3KAhprS/Tei9ph5kNuswzhy7RuKmR1m20A5INemTxY2rLTyq
	N8xCvEPaR7nYAsZcPQw3VclhJk82s0j78mbrmG1WjlEuIdF+6sDyreILsda4U9OS0IGLfQ9YK3a
	6fWHpspisdBlXZV7gmjt/HpXh86AH9MfKyDW7qSNQUFQMeQ09Xg7CL3BQEDIhHj+m8F1n
X-Received: by 2002:a05:7022:62b:b0:119:e56b:958a with SMTP id a92af1059eb24-12be64b5885mr1209380c88.15.1775025335262;
        Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
X-Received: by 2002:a05:7022:62b:b0:119:e56b:958a with SMTP id a92af1059eb24-12be64b5885mr1209364c88.15.1775025334599;
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:26 -0700
Subject: [PATCH RFC 1/4] dt-bindings: clock: qcom,sm8550-tcsr: Add QREF
 regulator supplies for glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-1-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=1973;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=h+6iokKQZz+tTzp0NWNeSPU4XGXWquRPqhH9qv/wUAA=;
 b=zjvlvfPidMtfsw03SJZXQdGArrrjZcjtFSfDCKrURTOSU4zza+ExjIASSv/GM728Zn/d7x0Ud
 u10cftkc8EtAcLzZHtMoEC1avGIVTJi3GcJ5AHCUSp8lJzJmXVUi/AN
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX1tFi2OTyM6rH
 4YIuQi6ri/WVDr2mtUxloCDb/31Ud9bYgwBNcP7swIWViJ+SPOMd2o+cbUg+TLo+uUIgEXaXdmY
 g6vAfT1c/6QVvpS4fdwk6CpFDPOsmn5Se85WsMUeG670DcIFSG9vay91Lh12CwM5zR8WOgDHRkx
 IWMVRC8LWw6DDpzUCfSymin4Uv/2cvrtD/W0sPd1YqIEHEv9efnTzOozG65GBcKl/Y2pzYp2QOM
 5HQT4wxO4nthA3ZcCu9DtaxdfdvkyCsQXbhI3+4mRHUiXVBYyzdo+LjBPyVxic3bGiyEX3Vzowl
 MI0rZCgDtUFj8vI/mhVY7+OrwavxFkT9s8St6oaGsitfeSDUn7Z/d8NVKVLw+pnrdSEeB94Lry7
 Cdt9+k4wyNAqgaUV07Dh9TveRn+dCqGTlJYaXYoS39t3XBZsplSDllQpkw2+BcdYfC9x/jRVqL1
 sBOUeUkE7Ua9v/zByCw==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccbcb8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=q-kqYbIK7F94m4hkTHoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: hLzVBRVYP2Iw16mqHpgJwGgIbzCjzTbS
X-Proofpoint-ORIG-GUID: hLzVBRVYP2Iw16mqHpgJwGgIbzCjzTbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010056

The glymur TCSR PCIe clkref clocks require regulator supplies for the
QREF block and its refgen reference voltage generator. Add the optional
supply properties restricted to qcom,glymur-tcsr via an allOf/if/then
conditional schema.

Switch from additionalProperties to unevaluatedProperties so that
properties defined inside the if/then block are correctly recognised as
evaluated and not rejected by the schema validator.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8b8b85bc70e6096d524447091f39e..88db650e69ef2388a5bfb6783a57c1d48c0e780f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -49,11 +49,35 @@ properties:
   '#reset-cells':
     const: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      properties:
+        vdda-refgen-0p9-supply: true
+        vdda-refgen-1p2-supply: true
+        vdda-qrefrx0-0p9-supply: true
+        vdda-qrefrx1-0p9-supply: true
+        vdda-qrefrx2-0p9-supply: true
+        vdda-qrefrx4-0p9-supply: true
+        vdda-qrefrx5-0p9-supply: true
+        vdda-qreftx0-0p9-supply: true
+        vdda-qreftx0-1p2-supply: true
+        vdda-qreftx1-0p9-supply: true
+        vdda-qrefrpt0-0p9-supply: true
+        vdda-qrefrpt1-0p9-supply: true
+        vdda-qrefrpt2-0p9-supply: true
+        vdda-qrefrpt3-0p9-supply: true
+        vdda-qrefrpt4-0p9-supply: true
+
 required:
   - compatible
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1

