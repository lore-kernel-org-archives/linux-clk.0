Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66342331ED4
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504135; cv=none; b=O4O974lP8vU6ABF+e+KO3Mp7BfokfHYjeVATtqn1fbE4qR/Ib6k2r4oggbAz2jyBY3sLxIQViOg6Gk03AWieKYUvGEJ/Fx2oiSyWb6iIlI8ofKLBKM/Kh2W6krC4T6F1RpFie6kya1hh1e+zz2hOuA6tOlccJusEDR/TIm9zSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504135; c=relaxed/simple;
	bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuKnrCTqU4beVUInMMWf8cp7nsd2zEjryNd6VZq2Ql9nZlmHO0BOJ+FH1s6va3WuQt1f8IiLmzyKk5LzL7S/tLilKvBbZXjmTMVBtdiOOktMy4Bq3EWd1CeAnpJJj3YowuhFM2WUht9dgtTa1kjFLTCn8U9G7v4rrpA2beYgC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOKXoLEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCkUyAJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOKXoLEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCkUyAJp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888naH2204042
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 09:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=; b=hOKXoLEKO9srQd24
	IbH6CRWjcKhMIKVLxQXlXughE0ppcdUwEdCiLcHUY9I+CJsRMPqfYmYDP8OWidVR
	ZtIzRT8nv4KT/a/79MJGIof1F+c5y0LXKHj/4fJ2SMhRvICD61jLRQATWvVd0P8f
	IooJv6OMz+rIquKkwG+dDlMzn72gcJZfCWbCUyOPJwUz8KBW/H48a45jmK4Ga2pI
	ZMin0OTTqc+GkVgfoFTkG7CvkJhOFUayc5ySIwOFlcEXZWwNo3iqA/MJo6m3qEx2
	u9Z0z3NJSGHx6kvPMdPwJA3j20LbCSGNxoAbV7YYPV5v50Cc5zgsxiuWOmaS6C56
	32BcDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0pxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:48:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso9439926d6.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504132; x=1784108932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=SCkUyAJp0heJmVnq9AD1XnYUZEWxX0lSrrRP2ehoVjFnZqVvqjrt8GPcfstwJe69tz
         n1cS2/haQ4/Ccx7zz9ORuSE+GatLTtoHXi+sjDNopBm1cAwEnX0R2ltr3zk6uSgv0yQL
         KneA3+EK2aDbUek5nU+yAxMWTnXidp+sHNSPFkk1UNnBRCdhVfJZlN63Cm7zxa9wa+Gz
         OSZVblRpM5EykvzTubP8ujSmNCnOVSyof5z6qLzwKAfvHG2XRleRSIInQmiMdQtgdi+l
         Zwz2bgSKSZ6IV9nuEgq0pVZbxEAGaUCTkdgjfMjXxl7si+4+hiAFiq8HxjI4Uj3L7gas
         sMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504132; x=1784108932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=W9DaYU5WkSNXVUSDV46e2TxzofksMuHNkYpupVfLJjHKjcqJnu2JA6zArDuv6Z9BWU
         DBCSgNOFHN3OsGt2ZVLovd4qeRp9g0FeUpWv4bMCSzQHZkSuwTIDwen/vhLTmymcbTq5
         nc31xfJih7Uf8D583fjyAC2jD8UrkahpbZ2mygm3FmKSCmqpvPpwZm01ylUcWwSQfok0
         xYPYmxqb7DIGsih89+302ysaoOhF/6SsWd3sF1yehDzbrjSLqNhlQSbLv+7wNRyfkS2I
         8epbjaMKTsXIaJq+KPrQPsY8B0JWJfEeVYrpEYLtfnFCyqOQesLAJdYksG3bQA92b8JS
         RwsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLv/Tur0Fdh2s/4d2v+s94+bRsmVi1VCngOpanNfIdIhCe1eFA+3QVT/cPf/RQfjPYCTtxNIWVeTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiSgJmhKotwWaq39HHjh6hc3xgTrDNvQ/zBsOxvFrtjTmk/8qy
	M2VTX1PwgoCvRHC8EIPogO7UV2On6UZ2VJX8G7yqaGvPVgG2dnojvZVcOIufzUlLpoItnaq/CKk
	jvpitGhdDxzJK1bqy5snBAggo/iNgejHvFo39QN4JXxc8WFFU/eAyk7Q5krWxnHc=
X-Gm-Gg: AfdE7cmDdkINzqF2E/5l8BR6KCg2w9ongTGQycucf79jLNoxHPWsKOrH6N6OMKIVseD
	F6hrVj4t3BjwjSAixaaENEQT6OAl4whwD/L0HNSBGxOmHSieWwG2O1Gu909NuC/l4C7Uih+go8R
	/cg918P1ZkZ7tw7nCn+OaQ+dFmfRZaF7/D8w5P1KgZRXi5ij/pT5XsgdI2rvagr4AHWierqF4U3
	tJwMU5hkbyObMebIg1OtkbqBfWF102kI9Eq3JZtgv/d/gAI+MkIksoFXORFJe1FzrAgxTGC6avO
	Be5H3iMID0RVrHU96BtUBqtb9w9OqiDhPim3cwB65C+l9QZHHVuV+PJ38fhU0zCjHHE79joXufl
	f6Afhnwrq8eGYCFe4r1MkIRGwBzHE94OfFf0=
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157321cf.46.1783504132531;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157051cf.46.1783504132121;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:39 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-camcc: Drop
 qcom,sc8280xp-camcc from "if" block
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-1-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz8RE5I/GM5fk9P5eI/NN3vbRInOctpDPd+Y
 BN87M+WWHOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 11bDEACGZnNsy8R0OzBuKqblRiDFn+wbKnVMm5IPUlTBLbwhPIqpCHkGLZBi2okQ9Rq4u0rUATK
 LCKTw3B2wallVFSHWnV1PFC++TIJ5+XeV/fvgfb9GnjbeVSTCn1zKxQ48bGSb+trITflbfo+/pa
 67PsVRKqUmC2ociNhlDfTRngvXWMsquEY8xxCawbAsIHj0ZO1SWEGHE1s8LLt+3iakAPUmLhaTP
 RGcAVV32s8qr5JX3MjyhgvOVIch/IJlp/ICwWOQEKpUXZnOd1Zj1VKfOiMXhWUxZntTyng4mQy1
 4+eRCG/yvY3TOQhLoFAm6pmWWIEhKj3cOp13s3xuHoXVC6MLx8yNmBWaEquzNRuJwYrLFJFho1x
 OnL7Amd7AcXqNo0ldIm+PZhGSK3a4nt4+0vl/J2fXv5jm8Nn3xBE4V1O8N6hP1og8SAhTE2OMcu
 tOAKtuUBKnAr6bhCKIe/b7Hst4GP2JpIUO2MXI9WrTxZ/WCA0MK+arBKoWKucCDFQSZ+9QLAlDS
 C72dpFgZ8pBJAbWeq0oURDt8s9Ui3Gz956FaVQKOYwQ8CY22dpN1MJWypgshzrHWU/zBMXzbt5J
 kv7+oGV6xlXucL/6ZY76CaoO+NqyHD9Z2VatEAcgh20dr+N+G13O9WYQ8iSIu4HHNaNSXeruIxC
 T2Rv9tbxbN3e6VQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e1d05 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gQe7VDfzUBWdSbS88OMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX+9brM8vhXxRg
 F0m2G0wAkpc7DztvL/lWmWO7/xHJjiiNZY5Gad2WzRm54XycaZzEKDBIyXP0Tm/QCHJcSR9Oc5J
 h3+qcAoMgHyOBob2j/EL85xx8QZyZ/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX5psWm/mMZ0h2
 iA9XEDVXx1KLale4L+zZRkQlmY9C4HW8MPW+6QtGNn7rL3SeXJX8SbnyAY5UOe5O/lPrYBYTfNC
 gBwonqhs8JGMnuqgrC+xYg11NplW6tx1y0na1WkVcIR0tpnc+mSYaWoHTO3EPWJpj4xauP1tQ8b
 4CvL5GhzVyeHSHbwSz0DsBT0SuSUTqvUbU15I0G/ix+hDGp1fdbjCjQTU7Ey9NrkWCU9HBvy0nH
 nuUv0NX9+jkVcn330pgf8bG972ruKsnvPVY8niubUaUdjIelkVf13Lfvfo5sLcdlAJ3PuH9USyZ
 jatGfRRTfWqEa0n/q0mk767uXZkoT+yjFC34Cb65abHLxEslzYKVes3huk0tN9tOKQGz63F/Yt/
 cELPCCb2jYTohPefJtgqgqgWl1EzlniAxu8L2lsOB+xP6ymxQJYD4T1QFBBtfhOpxpv8ylr2fLv
 bG1j/K47mxaa+AWLY2Q==
X-Proofpoint-ORIG-GUID: tOWD3Yh87XUhRbPqMBDZ2F-9zkPPW3Gp
X-Proofpoint-GUID: tOWD3Yh87XUhRbPqMBDZ2F-9zkPPW3Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

qcom,sc8280xp-camcc compatible was moved to own binding file in
commit 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
sc8280xp camcc to sa8775p camcc"), so cleanup redundant entry in
"if:then:" block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 8492a7ef7324..e6ffacc81d0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -74,7 +74,6 @@ allOf:
             enum:
               - qcom,kaanapali-cambistmclkcc
               - qcom,kaanapali-camcc
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.53.0

