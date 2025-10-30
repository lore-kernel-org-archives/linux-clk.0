Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A4355806
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822590; cv=none; b=hgPsdy2P6tbMlswIN8lgjC9ZSgn5EwRIkjDPleg3491mZK1fp5gqWFtpdbBKbPd/XcpQRme7TpQRu6BYqFo8ClURx0JwlAKZlJCz3Dqes4JAjbXQ+4VBCmOvWc984mWqM4392kFKRr+8Ou2FmzVdHJNEK9cV9cOpVf2/jQWWnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822590; c=relaxed/simple;
	bh=TdTenebo1wf1mMWccGdKC5vf2P8eTxK18YJfYnYRBCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F48BUVbDFzrgrn9z4DEKKS+PvFnLOa2sRqHeCeALSbVT0CQRrNVyr6DWEcF7Bn8iY9BsxcBsfJJzs8gHr2nuoWJ7TlF4uRAHR7wP9SMYEitbXxGzPhgd2AZxyeV15WIx2+NiTX14KNTSCn5XW4hymCJ966T+d3AWALW8g2uDxw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9Chfr4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNE5j/ZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9Chfr4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNE5j/ZW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PDdt3508734
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snUgPgVQWC+EcxSMP4fm0dKm8E4V5U09jedaQkTnmks=; b=Y9Chfr4zN9u5opCW
	OQbMsksnmh+N+z0/5Q4lcuERQRt9EUPXfTmZpoNwlCi+352kqBTsmCLXNpouhosc
	ilyqBrAvqEV5oqRRIKXsa2YLuLyW4Mkn2+3QEpQB47Ezpwr2N6yVVsDo1GHcXzTC
	qIZGKFW7muWl/xt6xVXoDHOS0tUtBcFYfgRWDTIjS2EQN2O+clo4YJgvQeMCsy+7
	rhlvcAJ8e/B34g+HLRpH75FMp/iDZg4/tgA+x9I2GeVxuMyHZuTNII/Qp/Yvv4zH
	p002e+JeH0mpe4ol42OKyPR7LzdLBYj0oFYs3a4BpZAaARAfUFVzFFggbH6huW3O
	ylrNog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdga2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33c6140336eso1952384a91.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822588; x=1762427388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snUgPgVQWC+EcxSMP4fm0dKm8E4V5U09jedaQkTnmks=;
        b=iNE5j/ZWaj/rp339C3lJICiD9N6+iCQqbIwD6ulgHeV1CYWCvR4polCAFoMh0Q+xcW
         F3oTNvIyaj8aDNRhUr7HsZ6kE4svwO0jgZejurj3nYSeQfI2jUroFBAR0VScgNyLoOEd
         O4Hlnd13RZBOcS8un8eHBrJmfdJu4cyx8S+lT+rUxcFg4deE8tykyPNid4MSMd5A9mLo
         ENyVbGeq9c8vtW2e63V+mBXn8SxbPfAuLvjLM3DStoDwubkyIpuTn9RD77L5QHTbxcZT
         OWwGze6nuIZ/AnsRMP71Texdw8Y9JJH6Pb08oki32THbWRMm0NtX/BfijUyZJr6gUMEn
         pDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822588; x=1762427388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snUgPgVQWC+EcxSMP4fm0dKm8E4V5U09jedaQkTnmks=;
        b=gEgwzsNsGphy6HLJyncxkdpLPmMMwbZduBwHCi8c7BqAF29No+HBn1AHv95/ba3nq3
         uaQgVYT65IZt7dujHDwbo19bbCLtQPSkwsN3X/rPc/pkcR1CZfeMJVvEhejjAbyjkVs3
         FbxNB7+BKYbWa4sRXJUljXAVrOaKlADaiQjngn1Iro1kmFS73CQGqQ5GNJSjda+vPIp+
         tMFItetvT247e3PSBNzW97y1pzH8y3EtHC5j7UUyM192qJCKmGlIAVvGT7LosayGOHNN
         65gySe0LH5cozgzSUZknTrHmO8yxVWxOgLcjWJY0ckDfDiHe/COXbsPfaoPFTgZpu+Xw
         AJZg==
X-Forwarded-Encrypted: i=1; AJvYcCVbSHM/vwD7w0wGps77obTl8gMa5Vohehu3+rWri2pHzfCKR4cixpcYPW4vFKIGkc06RS/gRBn6wyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Jq33up73dFLP7No4t3ZJruEQvEy5o86HN+Y1M8uUB9oMfN+1
	kyFWqcBAmBFxMAv4UxSBOSbkPPGRF0hgJs7RxMJAKAYVxwkM5KwBVD8kEjbcXbN6CsJyUgez9Lc
	6FX4NBjXJJazSDvHb+BiREbI5TWiBzQpXAh+VNaGMPblRtK0Dctnt7IYXFkNGEYY=
X-Gm-Gg: ASbGncuGrDGsI1gcORtSLA8f0LM/K+O9do03YVmSoS0g5Bc7piesxtlJ9jRDdBJ+s9d
	+9fgCjNStUKguj5M9QDqBppqP0Zj0Zgo/eh9yXn5z6NWi6a2olwuAlKRDS6ujfhVZA8luclejqO
	wH3P5tkYGcsStdPWw9zbLM++FN2c0N3v9pN/FTA8hRTLTbMJXjAnZvcm3Zsv0yaaoHY2WYysQ5Y
	GIsYPR/sxHofGJROKFfHodBYDkr5CjJYRp+PREpblj2E67px/NWsaAZWfYnntv3l9g0XDuDNaFM
	2NZ09kl8dN3NRsBnzVXxDi0utjGCH2u3/mDHPnF9x+bfxTdNild8HqE8f1TvGqGM13to6ObgfRX
	j5iBet8JPnrarG3hpZaodurM=
X-Received: by 2002:a17:90b:134b:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-3403a28efb0mr7578847a91.27.1761822587835;
        Thu, 30 Oct 2025 04:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh7+ANE+Hi9qtGtlIMkfwoy1OotAoprCXBNtn0GZ8LJhXpLEzUjuS1rFg5Wm0R5B48lMsOsA==
X-Received: by 2002:a17:90b:134b:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-3403a28efb0mr7578782a91.27.1761822587245;
        Thu, 30 Oct 2025 04:09:47 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:09:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 16:39:05 +0530
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom: Document the Kaanapali
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: HogfmYowk-pQa_lMBmEDtUu6OZxHlpJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX8/j4C0NgwEpw
 iYG5dzbYHuqWEVHPDWhzYPTIEcIFOfsnVVt2MXK978Bxftu7ADcxxYFnGzZg0aWCbBMGIZ4IpBx
 vU7xqaX/ZlZG2hj+vk1PYaGMMB+k9PAOahP4VJprHXvv7OKCqGSXx77DFK/4RxUeZj4h0A4mKrT
 iNxJCg/p8HM6K+no17Rhni35pmI5JA3XbCq5IjHx9XCi4ME/FJKvGYx5tvvKN1w12X9RyysbjXT
 778+SRiLAiUJsAQpOIfrRvO9Sai/zNki55Xju217KI89mQbVdH45VSLezbn9MeDFJANX3FJNmqZ
 4yjeZuGd8HPKl8gl1AAXKzr/ltJkthayGaGLZsWkOs7a9K29isBvYUbvKblb0rLD6dj3+vFzpj2
 QqWN7jsdbLrjWgOixsmgreq/JSpgDA==
X-Proofpoint-ORIG-GUID: HogfmYowk-pQa_lMBmEDtUu6OZxHlpJM
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903477c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=3hKmvjqeoD1fMx2jVRsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

Add bindings documentation for TCSR Clock Controller for Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2c992b3437f29b38d9c73e3c600f2c55e0b8ae98..784fef8306812c482f863c45b322a69b88c5800c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr

-- 
2.34.1

