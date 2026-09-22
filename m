Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9D2264AB
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049421; cv=none; b=XdwQVq/sNKPWX5CYkXKcpapwHkTJUGX2lhhhWg6u23vqV+QZeB7bzL8uDkVGBRbL6iaoOqDNBWFj1akkkq/HwJmnovwt4mEJ+kICeh6BYevNsIEmHQXSl7vv/QSoiOhjL40Z0NI6v/qjlI6h7WKEE10yhcd2eUGWe3RUaLEr7fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049421; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDD+Fu+9RLVlPUsYjwTqPPlmvKyxBftTqpZkYpIPrtN0KYeUwqIMR1pxmrse/NPnF+D3oUTKhMq+LYmSDLpVg2ojjxI7++N9m5sorbN2LZzrPahxjB7Vl0mWPmzrk+h/qgw/rwD/CoU1YCbtnRAJu3wr069eIRsYaAiIFRpuoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmizESbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfJxClk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmizESbi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfJxClk0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0ecFu3044188
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=UmizESbiP5xlgRfv
	XgVnZdFq88FcF5JxPPOjy6itEIUTgT6chHBRse072+ZNwqytsEM4KpcHC3YDmfxW
	C8dKKLJRvOEGnF3vwDUIFPz5p5D6xO+j0rjcQxXtQhRWauQFxfC0LpRbgZ2Jf7nR
	3rbbG1ZxYb3HU53Xoqbomx9SYsejX3ywDHifR3SVHdbHxWErPDNWVpfu6Pub3TXk
	ZqY0Ct00Rbd07CmJhxcVwgZwR4gtkKjft1i+xl3ctY3rFgwv3zf0lRWOgcWOLzv7
	G65+sw3K2+9bJerkqWhIM4WZjaewsbhjwYue8m1c4pDp59SFWLiWsp5MaNm3npUd
	vKRm1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarm72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1083327a12.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790049417; x=1790654217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=MfJxClk0QiCZjL28I+rPyncN5xltnQFG/19WIriqGubidOZTvS8YdCX2QV/zhPjTlD
         h82TpTB+bUbtXgoO/ms84OAkmKonJxycxksNcwRF88Cv7qyASa2QKkyIJvq/4BNSeBPc
         qisZeSvgs3Zad87LKlOnyl6b62L8/mtqnTwSX/MwOKDItYvLaQ5or2WJ7aJ4Z49wcPGC
         FDpJ81btDp/FrveevsdeLESeNHOLjalMzrmvBXmmo+C+CZyf/f6uEW3UugTquRZ81rna
         lyOq8DCbAZWTT0O4OQOA+4ASMUkyDmlU7+NeBG4mz0rL1qRNQSzJwk7uQ5Qi3+/N+kko
         /2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049417; x=1790654217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=0eo4Z2gCNnYt7huJiZv/MwVeCW4+3krHuy8jFXCDPd0vQTCel64M6SYXWhH+LsuiG3
         9YY/9WH8xYvsRA9lhB7Fn0bvLfIkIbkasUJVn7Bfyd+uV7fRSgWMCKGRC2UdOr5YicA4
         odXF+y9IcPB9WbF1ATp3Q9QW581DLsxtxONCvWiQz/n9pcoaqG/hiwCbGJzjaQxaCZ4G
         iyHFmFm3eJlGG9rIT2Cy6c06YWHGEUS/6icTiKML9mcl2rHkx8OU9dshbq+Dc9LFIoLw
         qJjSGhDgdgbX8wLeXT7VPCjCQWJoS2KdQUakcUiLRVYB3GWHDupAOoxDWxpf0IDcL3Fj
         uVVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmsazu7KEDLB5Je/Uo6I4mZ0MiT8e+x2JOiz3ab+i7y/q0u+pDVYO8r5lVtbUhHUruTI61tE2KeBM=@vger.kernel.org
X-Gm-Message-State: AFuF++k76tb+QnF1H6NBE+F1PqmUtVHftkOISEMlmuu9FOL87gZ4x5JB
	hgtplMgThhyK3W5SuxG3/xMiMWMh3aCVQDrvtw1KrovXdROcorlRMOaotqocb9TQGo43EPthWO7
	jRAPi98wdfk/yjPj52SKcH2rNSje08lIFOgEY4vkqT4vTntYBWJ0XaLnC3QOxIhg=
X-Gm-Gg: AYBFou2SuuYcOMgjNvECn0keEsSTC6FR7sL/Y2jB8+z74Omr4jtphUkmh1fi9em4Uw9
	pI7HPbg26J5TsT6ztFSMZ8S8dcTL0s+BZqU/tnXvPI432+0eoeOeXJQs6zRtgpWiVCNZIpZl8lD
	beTeCjUnE1dEGceKF/M9T7kqEue2GmktFzy+31LeeDII38x0AEyvmrRrY9aVuOniJtnEFzHi10C
	id2tSdIzUnylK19Ng4pYcHloYMLqcuq3qNTC788lX651H6XiUUyu91HhnrN3AOYE0C3OJo8Tuo4
	W+iPkfL1+k23KLfv1ABI7r/X3x8i3+aEAlXFDn1SURQKlSyvZjOl1/PYVtcI2XQ7dGwxnxV0ZHB
	HA86gd17xWzbyGDNjjqir89NG3QwRLME=
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494635637.16.1790049417409;
        Mon, 21 Sep 2026 20:56:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494599637.16.1790049416930;
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e58fcsm1613139eec.2.2026.09.21.20.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:26:37 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
In-Reply-To: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfXy1NYqg59E7Om
 LBk6GIFP0KuJ1jD2naPeRCTjbj17GuvYon62z3doyvv2BzRrtTWxvEMTt9QoNnr4puTw+XzVq9o
 KQ9CVHl1IDn2i91RUnPe9c3D9bVNyGezYryOeWkZpvHgakt7G9ybbF3+pE5a6SPfrvqkjOmaNho
 SrMMkO5LzfbHlUvQl1KX2wmtt+HVTLL0PbkmWGcyWLdhrLvT1DayfA4mspiGUIl3Z4LnqHDCJRW
 GBeCjQuprciUwyTVqf+e4Y8121BWYrwb0Iw6t0GQSz/PWmqQ+UbLIp8t226NtuX/z2NPyUstLox
 FukHz1Yk8N/u0hG5PPQh2tpAAD6weEhZidzre9xDY0pzl+kfTFyMltONmral6qZ82tPy+K18RW9
 9caOoZaSwyi3caXiGzAha/OmZN1BHTEVxIjfpUN6HiIO9P0CK5xHRg89e1mEDvJV3T3Q4D9wRHc
 CH8eA7KZQ8n/vU8YS9A==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1fc8a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX2BdAB4X7iycH
 rRCaK/Dxv7+O20r+BQOVC5K4XfFNw0ZqEvHVj6UAOP1WB2jXHJnHgVfZDdP7CkjGunLB3AQD78g
 MSFCCjaEV4p79l1+1krz4ZRZjSSuHrQ=
X-Proofpoint-ORIG-GUID: sGADSfas2sD04whA8YJyZG5FuA1VTooe
X-Proofpoint-GUID: sGADSfas2sD04whA8YJyZG5FuA1VTooe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220053

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

