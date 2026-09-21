Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E534D7D27
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008863; cv=none; b=YdsXmYeDa3Cq92HU0vBSxrErJqblNaM1LEJ8RcyspN5gF0ommkktIJrAJcgemRM+OAliuZQ3eb+uuo4ZmI+/8eHkkM3PdIj6PtkiYkF6SY8YMAKD8VHa6Nqk83A90J3Ksa9wnYVrYFGD1dpAYuou9Hty1HeuPBtohb1HDdKbSrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008863; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9j0zRJ/i4VjblMavGy/oHeEhChow6P/5432BV2cpPbhxs9OWuxGX08dbRnyBiNly1xwOz1P8vfFpnQGWLXHGuPpJ6Oi7bK16eHy71Hl8p/RBV5A0EvxiQrpaZjv+6uKN2SWpev1ubzUwNr9DCbiuybFqidI1R3LSqz5prPZldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxKSG1x5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iimmqeZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxKSG1x5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iimmqeZI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LGUjwo2707785
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=GxKSG1x5mvidL77L
	IWwyW0eg60bMFM4QNdHyt6fXxP8iZKGb9RQLOQu06dysUUhZSGDavsGlxF3Cdlo9
	gJ2I2dnJm1c2XEczW25phVZ6VAT6uDQ144kE86MY/B9GtbEWmJ2021M4L2Z9egxw
	NZtsVvcRR1AZ5mobyUMWpBCCpyq6DHGlwbKVoGjUf0rxm/JA46NqoIJ1RjefWxEZ
	uiEijYhNXk0GD3qto1CfRbCXta2N59C/aaiPhI4nGj/onP+MTBmgtgIlANIIdiOD
	ujRkBWWwXVvINOFq6JXibm25jCIeuj7pjfe6awW9tfvAV0JyyQNxEIXbobIdftQJ
	f5nTDg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vg1v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:41:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8663802b58fso3471766b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008861; x=1790613661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=iimmqeZILgPIzUdWqKDZ95jZWV9Lrbfm5Vs7gtBywf1FC4CRLikm+VboIzqs4oNUg1
         UBFM3CvgzVR0xpjPEZngB/w4oXARkEZyx1sU7/NkD3v2NfFgZxTFCO/15Zmt4Viqalho
         fnvzwDV9IQtrJgbwC2oMHbVf+JsSnvJyhBaGRewvVpDGXkl7jrA5krosJBICFI2/88dm
         IoVKzIL3HnUjw80BJ55zKpeONjSPFUUp5rI03dBERDdqu2NUzZBGrUXd3fl10xJrwfiX
         U23IDa4pDqo8NHpnSm3+7CXMx5/Cs+8T34kJc4dMfJtLQkSXsv7S3RgX2xVUo4RxSX+M
         uLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008861; x=1790613661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=OgZCq9NSFfDhkY43a1f27olh8buTIiItKtAedKcycWhIGURWIK8k5Q7k3/nPmwYqlN
         +Grsppd2luesNLrYQeZPQRYrFnF6SYLB0eJyJU5BIapQ5VYnzMVBde3rQ8l6RTAGGlrI
         7tOLEI2GXq/Q0Ia/+/8kZqalU4XBx6EXsabiRWX5NAu7zwxVs9RN/VwSSqNAkVNeuVci
         Sg+ag7R56U+tfJ8rfdpH/DaHdjMRhamFK0GJ+E5/UvMWqNc8PRcOohLsVonYKfSa+qTK
         m6nu7WufNlHq4cb0SR9kMy4OYckWwadqmDvWMmmsOdrrmbPQYY35LTnzgRqB59noPJ8z
         rZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/AZcxVdieow5bthio9Qox5SSy9Ko/YdZDH76E5EXVntVHHIDKh3xq2ePy7paHC2gMvywHZFNSNiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kTcP5bJkiI+E3HS8usVCy/rEFbNxFXhVhk/PeGs4h7KGgpKW55
	jhnZbLcskmmuXj/SEG4Gdut11g/Q0F+G1kE8kr/zC4e2WWM6h0jRkySuzJgkJ/f7k9j8UsoAWoO
	e9lKVor7YuxO1QHobIZPjPP3INYvsDN9jPy9pSP7dXER5dNqYQ6lX1rEf+9MgaMY=
X-Gm-Gg: AYBFou1KCwlPA5EhDvudljDUKQPIVWhOA4LOPj68qJqqYP9y5lIw9UC/9nvUQp0vObk
	wX+c66NZofqtMyn1FKyFrAGedZKQx/bbOEocKLRU7RDV1LBJZgrNljgi45I7I2k6tXSBEFUG+o6
	5P9YJSyDGHBEgBXr9eo6pHl/WFuguSn49x1kxQaJi7HjH9JUug+PnHStat5FDOKyjK469D1f6ZD
	2EUfo5WvQrCz7nd3yTzW/dlVv2EVh97BQpZBL0eTkhZ2rmS/v1/HVQEnkcHXyeXpLTK0mmWKADs
	v1782s5hPPVML1r+ud+MTiSd7c6/fA4FOSoD/25DRnETpsUfKUXQXxTqiYp6NModK2WQXIbQXXo
	cvWNndtOLY8IdX7DmuxQJBJGHHBQcklU=
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446886b3a.46.1790008861226;
        Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446854b3a.46.1790008860845;
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:10:33 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-maili_camcc-v3-1-2f8d739ac2d4@oss.qualcomm.com>
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfXyRpx5iTti8tK
 0KfDA7Bed+7z8KBJu/stUguIkcP43MLKrcrsh7dZ2YwchvL6pps25hR5i/igCy/kfEWPsE2PO0F
 PXi94vPuNQLBNw6ysrrmCA5qGBVhRh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX6dh/LxlhcqDf
 HCCiggP/AxTJD+brziUV8mPjYRJi+/g7RmPeM2Yj7sAkCVjCOHxUCDCadcqiJaFrEqBmXLS4WDO
 H8Q+bEEwAQj2kne41gZVZr9AtQlX1gYtJ6NDFm4if8lFyXthfT/VqtltcuttUdqn6b9F9cg1CUH
 7/F6f4fhK/h4Fl8omDqSPqwfJlruIAkHJt05u3Y57bIU+LF8zjUjwjPjmdISzcw4PJ/gcy+WPih
 wjGgmg8zjiokd453Oz1nHGjs1q9HwWz3UxeHTQMrFJR7noFBK9h4e0gD2Vkke5X6DMHF1z6jS+J
 pSlBXLrs49mbSiCNNWHTZYRAlacnSvaePq/gpE8jO1L4FLEeVtbc2hAiIgGQSty0rKN+3OKwB1B
 l260g+WuPaN7p975WvpbWCoAB986oe4mOI+pq3JSzfRVfqxhQjedK/7l6dMJERCu9oVdPINU1j2
 3RTsysIjTKxSzZUtWnw==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab15e1d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: B1nD_0Hx08gAv-R4rUJWESwwnMGxNYR4
X-Proofpoint-GUID: B1nD_0Hx08gAv-R4rUJWESwwnMGxNYR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

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

