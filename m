Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B595F2BEFE8
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215940; cv=none; b=I9RQnIbzVfXlgMtQ2zwMAahOj2gXRLFfkvp5IdaUmNVG90/54kFgSuJlvwU+obqNFwMyTIxa8KI//ptSl3aiVs5MSEZzcMHplM/5B1L0NNr56DIP4pW0AzUrmzw45ZQu/B1y51mO0e3gia6/5jN3YR7sqhdw/F/tcdNvWogVYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215940; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShrOAxV/tL/lPjsC4EKJ7SWMH6/wSL1TBp2K8O+8l8RGR6kJSpsRI7umhxdLzRBleNL5tJV3RDaGq1cO7NIrwVYqPpY5AmoEfuMR3b3GekXdfRP+AZxkYYgLGaX5Y+MZlqSI01ThL+/g4gv5J5RLzYl4WY9KclQIjBpWO5yQf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFJWA3Up; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFnq/31o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFJWA3Up";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFnq/31o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484EvMb1971787
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 04:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=eFJWA3UpOLFMPxJ4
	Ir8qOLBkORFa/zuVlFVa3FbokTkmRKb5qv1IlGANc5z93pBG5snwJH/a7hr24Wlh
	6E1obx3RrPmkbSDhejKuGrga01HV80AtCtFhCAGv+Phu+L0hkjuOlOANNce8oWqR
	rWbRlb0YZ7c5AeRqRe9INLOyrKActikLz8xGVofebTjXrOJkWQFcCQ3Dj+LMH+0v
	kNK/pSF5bOWBygHVAF7uK3gD7H7Pl9eo9I2+WZESaZYrmf9fqisKdl2s6+lY46OG
	7DDItYB85CB8yeah9sW3+66wJ+vZs+kCbzZKlMA2X9hIRq3sQ83anYQv4E+h+oU7
	0ufEZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejbd22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 04:52:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so916487a91.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 21:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215938; x=1778820738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=hFnq/31ocPVInswoBBoHTBT1/6107Tdb5+9T9vcX1eUlM/nolJcNBBENRysg1jWXwG
         mZyi1bfz8LEEUZGDQxWLQumasR2MUR70Xp7soHZ90lXNCAjSgDVYBLDrPIlPMP0yjBsQ
         HiTXb0Z4qj+eUQmnPmjfybyZXS2FCuOtvk3gZ5MWf8JSoa/ZWgPNNdkiEOt/I5Fu0Kwv
         kVQQ2+PX2sIReylV7WPScRU2XVDWoTYOVOBalzIhg6hGR9y1kHPoldLhWD8TFpQNPbwJ
         L/5+cUyTKSjK4z8XlFOvXj77CTZC7gh6+w03NKitscnYj/QKhQunpzUYqvqJUtx1rhQk
         AW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215938; x=1778820738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=HMdLA1vo7UENr4miDYbi+0m1ZrRfTh1jmFuJIixL+1QShmyK4sts1QPEgMCX4ZrRj9
         Vac3itiRkFRgj/u+h0Jt6PxXtaVphg3JyqELblwgyDq1eFaVDqSN7eVphPWxy6Mg06Z0
         mcvhozNCjRihuAMd87fmzQFvmqMQphKfvRVpLDkGhPmlMzZO9TQpcdgvZ8d1siXbZN8c
         PQ0V5FK9ac01YRfZ512nyhAHEKHme270JfS0yI1Ex15MgO96qdibBM1iiCMde/1F4648
         6QssN0/IZgKMojNnUFbFGL+EX+naxK322GecQuiRyU53ZNk/uNfrcp+Or18emqODhyuW
         8nyA==
X-Forwarded-Encrypted: i=1; AFNElJ+ixNTet5DOxquM7xiQ5cmPbrGtbzJpNGNwfevMRMSyl3b1q1hZUAu87CTSx7wiHhYCdsBtiSvHyCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOMCwpZB8SyvoyXLm1TSzCTWN6FdYCxGnXCnOaA9UJd6deNjB
	7o/xjm93PbAMz28P5oBHgXJbbUrKkx+gEe6CloS7f1r6TneZMVL1dxrGAlX6W/J0YzQKbRV3cCQ
	0aUtgL+6K5Wq07/MMGSYB0fgFL6c/jveuc0Y2pt2WZjQlhxF7z73M3M7razy0o7s=
X-Gm-Gg: Acq92OHxr0PW8FhDF6DOWTIm+KkPrX4aJvLvyzGd5FaJh8LN50qwoLb3cdc4AUzkUJ4
	lGcdH2vauVOtM79smzYVjUW8hdLDblHUxLu4pltWrTNPwG2eK5l3jOZyzh68dAcYgifASDIKdUC
	MM2yIEGLlyHf7Sv6SY1BLol+Bu+I7sKU6QZ/Jn5BJgpTXX6qwQh8Lx8tpXUqgdag+jI9lmV4meS
	seL6bd4qt65KpdIWgg1JKNDjfXA3jSqkTeeCf6vrrdPrUWqS3Yabg2q/NPCc2mjPvDhkztMUpph
	S0y6sSTy3AqJ93Py7/btOD5kNi8UanvGvjKYTAplEIxcy4cVJ/L0Jp/lrkUTQ/VMYeH1w9Datlu
	mqPVUsnaMakWXqVdHOPrvll/z0hNb3thETiLxBBy7zNp7JL4CMCBI
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126704a91.25.1778215938265;
        Thu, 07 May 2026 21:52:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126674a91.25.1778215937779;
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 08 May 2026 10:21:50 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-1-83238ba24060@oss.qualcomm.com>
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX0LZ6EGU2l2Lg
 dnqRpVI92WbGMhAVrn08ZzEy0dgHDlUTO2HIRQVt9sL+o82bzuDX6sZyjG8KxNhxYyfnsNMolMb
 zy4508eHWrSAioepII5OKCcDMD1nxFTo1ja10VPHca94dh0BhBMqvoNlQMYNXq81VH7G395BMty
 5PzOWMZ5u3rMglRCwC/AGI6+yyhcOUoUr0F1d2Qys03Gk0+z9qx3VE7eMqHpz0Hpss7ouEnLADa
 PTAVaNQ0Ocf2bjAp2eubwwvz5HxqtFztxpt8YFnwxvHu37SZWZeZu7EhmyGS4eDRdIqzoV2SfMb
 s1ojIXktZgTsqkW8mrzXoGxmCESlZJDyGOnWqjv9yeIL6mPKCyz+9dFO+kJnDw/wL6rmv96oc3P
 qQR4wm73JlZ+Dunyza4Xfwzdj8jNA7VTlqmg2ufOGnckrGQuY2Yi+oHgG8+IgZ9v1R1QN0A7AiV
 VIgRa1Cd948u7fvJjbg==
X-Proofpoint-GUID: LkRJbJShBxREsUAl7VDRl9zlU0drzIxj
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd6c02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LkRJbJShBxREsUAl7VDRl9zlU0drzIxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080045

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

