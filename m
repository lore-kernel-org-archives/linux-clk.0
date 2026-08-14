Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1542DA35
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692834; cv=none; b=ZTFrNzOSolSQrSR9ySG5mD+vdPHVFLKv5X1UP8iPEaWtpF28RJrWrVarCco75x17HCQqKDjF2aIpiHqBwWxcWaayCIGT/WMhMqgozFW88blWmV7LjH83wW4K4+B7M+CdP7ispo95Ap9Y2ttNgL6mtJoVxdl+18kqR3n3G4p6dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692834; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XG5+TxUHiadKZM5kOZsNxWJdbrC0pZT1o0z2CpMOsL55NukWHsCJGpe/fy9mwGLJbmcdVF+a8kbjp0aJ8cgLcv9WiV2DLq5OC4mN3eCmDnzZltOZArATAX/Gq/PNrdvFuAykEk+ME1ktDtFT0dOllHXUZ1hy2aQPVuB9kDVARjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f47cNOju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFfetm2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f47cNOju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFfetm2g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QWmO282838
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=f47cNOju6Yg9bKgr
	pVlDJ9ZD1JPPwYQ3kYTqh0QE4byrKyuysRvlI0cjuCdzouB1EIo/rY7ONJaRiM3D
	4e0Wfs35yErbB8+a0S6GCI2+0GqTZkiMDgQlWuoJDvop9jsAe7abC7somdrXeOSy
	m7w29WbZpnvknbkOeiNeJyscniNVcUN+ZRBdwH6oFVFs0a/5sZIB5L2TsOYGRmVC
	EQwU1HgTvwJqWAGZAXg9ySNKRlz9FEBpBc6GCxwf3TTEM2cUCozy+hj/taydQVl8
	utrwPClqiXnV80cVBd6hlfMBJ2+FOMTamDkS3kjarFQ1bkPhxyfzaVzLmQSUKKWn
	yWQ2Wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90u5q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so8625125ad.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692822; x=1787297622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=iFfetm2gDIAck+ar7ckmYqV6Pf7sVCA92rQe0Qe3H0FAKKjmlu8lLGI/DjpCy35Tff
         Toq7GTgoXECF62zhBiI4unHD4axhnsgpPNWivX9YztSfZH39KJrEo+Lsaf23qiusm7P+
         z2xnx6t3zgs+zCTjuRmpsjeXD5NF/SFmmYWbhOcHCXse+PLo3lzIYpIk7k2OZPvA5nnn
         TR2emXZfJv17h1E8mK389+y6caGXnprrDDWGsdrMTeTIjKd/4511gn1s2UGv8Jp3b1CV
         2zICOZrBi2fkQB0hH1SJGy7DZ1kDhA+5yiE4HX9TM5P9OJaoGFndvBIxKRff96PnilIK
         rHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692822; x=1787297622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=sjIskQaI5c2l1Kt0UQOm5jhpZ4POtNBhnEZMtRnFmxIp2F4PF2Ur0KDXC02TEXytD3
         6Aci0b9nxP5+dnTOB2pue0F+aWfNJ11l4RezqFXU7NF6mnilx2YSdsoZHOfRXSEQIU3L
         A1pXJ2P2WX9BNJhiAjLmz7ujpDoRpBoNY3I9HPcdqCyLtLbukLygaWlLTmO3L0Ox2Wey
         eh9JhBRRtpOylVeZR5QTvAgrj8zO7lU/DNmP9GAVyG5hPQwJaO3OfA+x96AVOiFLgevT
         cGy4bXkxhapCyRHtaDpkaB0a/6S8lY2HrFfDvj2ZVR+vmKmFX77KaXG2XDp42bBX5qee
         iRFA==
X-Forwarded-Encrypted: i=1; AHgh+RqKpv2cutOKGrpl9gJq4znc85o2/rJUZgjw5bdNmAAZVkxZHTA2u2ki9BZfYSWnYUUd8xkJEPf1KZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uQOJsfWrAWcP8Pk2bq7adTzmS+pTyNn7TwEunb/xxY/9VO3W
	sDELecFaeXH4PHFchDzrCEugz/rQtLcQbegr3qhuqNCRjy4i2nDdYr6C1ygBVa/BaPn/c0mOXrv
	ZbTbpI/hIVyvGbYGfjBrebd1ARAzSd5BfgzmkYToz5xD5yZj48R2nbvqOkdi8DCM=
X-Gm-Gg: AR+sD13ABZoojgKqUNziGuBRG4ET+M6eYWK1CjuciyxwbZxTxMiK0pLUW+zvlou7mfj
	51yhADjm591ST7fiWVPIIC36kdOX+Ux+rdJcaEapZG+oeFe982jEP/qLlCdETvjf9dIB5sByOCn
	tXxeADJq3l4loT0rA8meotlq2C0VCCip/eH8xY5yEHkaKX9F9icFIcSH7KehXRNCfzyEOtY+6q+
	bqwLNbx1uO2wo2POIDrIlF6+Rp5s/lfxsHjY60FKJe9blMQrna2nK5VsIHc+MG/oQa+PzlV/abz
	ujNAKjDJW2TNYcEa7XMYAbpz2bRor8EW7p9RDPiZOopGrAVVqniBmTeXzVsmA1GILDDhUaVImjU
	nFQv5+nlRgKCX9QkCW9Ih7bTikP+8JHT+KwifcdKlTZJ3cSLaJbprwRXCQnzl7UM2pMm0enc31u
	zSwsq5JcKhnc/cwKiPInRiQ4k=
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631999637.28.1786692822527;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631945637.28.1786692822096;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:43 +0530
Subject: [PATCH v2 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-12-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5rfTSqeF3ZffhEbWQ/MCkAbuDD82v1o8NO8GUugDaLDLaKTC3LlK5BcLVBkEaw7CxqOZjkCyn
 LB5WOXsXFY3DZZxny1BmotvMhg1imljcHSJu02Gp/nx3UKotZJU73zb
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ec4d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5Ai60zrIZu70
 v9LCg4wp49r88iAJPZgcfAvx0FxDaF3xF1vMqxoSLWQUv+xLjiIaAjQrqh4O9Fjk8CDK5uxUi4b
 e9ZkCpRW2zx1iTF/g+xCIdTRUPqYCP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8l5CvNmMC5o1
 LutLem+EIVftajUHX3ZCNzf+dGExEPIzg5iv2D0An1orosyTrkxjDcZtBtxD9+vMSbiYE4Q/PN8
 AJEo32Ay4mY99aAQ5kPyFdYZeAvRIXTIJX8VJKMKGHahStKgQ5WYoCxfQbZX0CWF/YbhaSQh5/L
 tMcQY0PZWAUwWNvsBMIXUv0YWP1CFSqq0EnMFegBkPzmIIs81COT/W42MKVzFh1doaYpp208sl8
 SbJbw1/6EEmEe9HByEDbRI9njIX3UemVFVo5xxv09ZY5OvVgYnVBODFCx9LnZ+afSoYHxYvirgd
 7k3CUuVR94sE4x6dt925QbdT8RXDtBTkyhIVUOBTTdNiAvOSbqnKP+q2TYVCQEnJQilu/Gg03HI
 h+v8Jwkzgs4MiGBZh4E98lP7+M2zrzZxHlMM/Ltp0vlIkhFopEAH1H9J704tMfKzv8jyWzgtnoj
 Ym/emgoAX9H5Er1Ij5w==
X-Proofpoint-ORIG-GUID: 8crYtPB21FOHgqGD5yOIfIi2NZUz0y_f
X-Proofpoint-GUID: 8crYtPB21FOHgqGD5yOIfIi2NZUz0y_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

