Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB973876A0
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379467; cv=none; b=Y7XijKbRIzaanqmpM0fmdpsiI0U6IxsVMcGnkXD8VO47cS08Fj6qEVexc3s7jB98cbuQakRFMUYxYGYFBkKuhZLwxLnhQGkGBOuYBfwzoPT7cyk0FqDvyL86P1RfoOXrsb04RWRmP4C3pGuLbQy4i3uw/a+ehX0xFQUjuwbsMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379467; c=relaxed/simple;
	bh=xt0dIfbU0BtlsPnwy3/JUQfeGdBD3gUJbPZnDZ4FIF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SApJubplWAvIO1NTsdw8ascbA7Ssq9+LbyhLFptOsZiKml8WcFyQoJPtO/LSgcsEmDysbxHohzvpZrn/I8nc/C++s/U40P49FCETVBBqdqGEmi+eFuj8h363fqHgeqt8RzZ5wnmzBPQoFBydWSQSQqwANvm5+CW3Wu9UViJYO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwU3NBRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQIdrWuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwU3NBRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQIdrWuJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHMQA205652
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=; b=SwU3NBRJjJee0W/q
	TJuu7Gm7spZHzHkFoDvJSUhPW8Ty8H9rSc4qqvJCqtCp3v5++9nNxIk7By4KqHGt
	XS4/ElebD9VLxVWcKAgdLNGSVKpaciVIT9K6IK86/iBMUvX2a0sd+nja26sJnxXt
	kB2nvlfYKUKu2eXCgdCw1FiH8NKd1aAF92qsGmjROSFHKAeliDFeqzISVVjzO4lP
	0ssMnn0WsXL30A5UJPcmAaA8sCMTcyKjSyB/TiCCsDb7PLTkU6xLvpQvPGEgS3Oq
	Oh/BmTmIcmlR9Bv9lEmYWzxNhEn0JPQqA1fBz9LaLtuio+O5aCeT7z9kHAZQOwst
	oqt/jA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so8103453a91.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379464; x=1784984264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=CQIdrWuJsvFpXuoFtTG2djHGQxK2wUghP8ysA/7dFw1oWxpi/2pMpDSC0qM2I3ZKSC
         7RdyiVgJ+bFCrrg5p66NVR0tgFOQ2nZuoLUiHtHuo+nfUegVJvGa6WB8oaRUgSyZVQ2D
         UdIDwPT7R+BehIBzVFT7S7JKccF/9Vk3yYqKdxQNWA//+5m/slV9YOpH0+9r3HcO04gR
         fYD9Xgqz9kFytrg1dNwQMDavxAIlbNTY6NkCcSnAWccIpz9XZ2l9T/+wy6xAHEm/tPTa
         NLPCaRy8ysP2WbpHbxZNkw2S/7kqVtLcCHGvMVKq/AiO07mzMRKTAhwOxOiXI+hLz9Bs
         imeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379464; x=1784984264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=eOmecekMvcmsrq86uistqvvZbYznNzvuEU1u/dN/+6e7dTMoly2fD2RMxnQ+ZaiudT
         AyqHCW8tG8onmcyG8PLPJLNTAiucSjDkkJKOtfCcB7qWDip34mdeIDnW1E8fNiRj62jJ
         C4os2Qe+Pd9JlMX48ZBoFzZsUmgeEIhJo1BNQXGIE815dFsgQUb7sVa1JbbvPFrfBn8b
         947sXmtsEiNhBcTt9i5RbB1erFt/JFNfvpCWmrYYwRrMLtdsBngJsN3rCT4jEEVOz/gH
         WQy1ailb5gQpD1to95nFZzdN45CulUwHu7zn6RYgbhUG20zgGfPqbbDnfloSjKFRsLsm
         LnWg==
X-Forwarded-Encrypted: i=1; AHgh+RrEmcu2sEwZ1FQtpyl0EkDoZdKpjhPbSZ8HqeTPt0BH6Wkq9ibYvOq/aQBpMaAFeGAqquQl2vzEF2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVnik5haUza68V/MSdSCE2i4JPDs2O4PWLmPzxS3gZn5HgwgX
	RlcKr6ilVQippm5D9lzXkY9/N3w5JXI/0IvO9urOEoXxtJD4FDqzL9efgRRvYCB3oQ6qX4UX8m4
	OnJK1nmME0h4CICdM82fYHDw1fi1VrQUHa70evE5PZxQtCGQbIM+edjCxWOAgAKQ=
X-Gm-Gg: AfdE7ckQB1/nwjTKMoFSdk5bcmFe/YzybIX23G1SiUahlRt5zkh4drXJebhPhG6p2et
	1/cc5P5csIvPx8WgSd0OlLtpyt3eCrCmqyUoK1/cIKKPV1Nee1SgY7MG5LOkOeqokkJQeq0pKRU
	JHkXT7VQ0s223i4zeeg/ZVxpLEqOGx85h+W8EvVDw3R3VxtUl8GHIYCuhXpHHivFcW9vX0jHJGc
	2Alp6HeJafupw0/jOqCLoOUNqHISu5nOK9yDG3eKVq3eBJcXFSNbqANoxgq9j0w2bXJX9wdd0Fc
	Ig4L7JzHIBAhfSQ7HRS01T6WMhAv1w6geXX+z15pi/90FWHMP9iZZ+4mMVmJvXFxYaHbHtTQt4X
	3wddZQkBjJHV7e/GHfuIi9968KdBE544=
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467122a91.15.1784379464462;
        Sat, 18 Jul 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467084a91.15.1784379463998;
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:20 +0530
Subject: [PATCH v6 13/16] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-13-62703e05ef0f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PxZNrgiKxCnvyEhPjlD16N7exf4dQfVD
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b7849 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXybOZ67Tud9tZ
 noI8CZcvIqsidoIHcHKd1abMruIZTHlt4xsE3Zn5Z1z9XUfRsdM5RWJjeoo39b4fUO0dzrElQsC
 1KPkeGPsOFNww0/D1SF7uJ54jIYU3Ssq+0S/dt0UOjyUbhp1qSneijGjaoQjTbtsLbPHUcalIwv
 jHvthpf2vjsUqzy65PDRxtL6xUllQrEVgElBLQlQHVGT4Y6UJHmZwcqsMyfNTRtfekFxjI/i+5R
 vBcElLTB3j5uorvlxjI9ruMqLYHPNa42hHiszVbwZaBltKT7qLL4lhXVtD6479A/yK/UQrny9Aa
 4cc9NhDfuje3kmnS9bpfno34e9Eez+YnGUEuFK2GiU96eTOlU8gDRsGjijNGoKpH7FRd1cPzGH0
 AI38cldC9iufny/81i7H5mCdM1PZzW+gN4QUgTHpI1KrA2oXlZn+pJsku3+xfeRqKvmTy8WU0yJ
 v/2gup8VJanzL5FY05w==
X-Proofpoint-ORIG-GUID: PxZNrgiKxCnvyEhPjlD16N7exf4dQfVD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX5kLRuj0BxbYQ
 tnm13j41dzocHP51Juhc3iNcOSTdzh/0F3Kgn2F04Zr0Tnp2UtVb8iPt7ixf8b/iqlEvnMjmUSf
 rVTqnJh+UF5js9W1TTTXXSmtcA0TbDs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index e9c2326adfd285444257b96f5adc68e27213281f..8d4f53c8a6cbf9ae89475381ef6ce6e7b61b006d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

