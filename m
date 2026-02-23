Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF68365A13
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848117; cv=none; b=KNFduF3qlX+E+H5d7ULQw0Nyv9DuDP4g4HYq7SLaRsmDj16b5gHkvtm4XGGoIOwkXGIYIJDNN8su0g1OravP0ctSZ31zGZY90bFX16wA2MNneFYlzz0YsvrDuCNr+NTAmzIxl9V1bRk1OXyClmUMEQfZlIPDwrdhr/tgR4gtO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848117; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V58/br5Mhe9YR5X7NJ8xV2QfdF86tqNhR52QhHZRlsMbvW2sf9kTQdCzTus/Mi0zC2omGYUofARV5RnxTw2cuqLDghzRogqM8zImP5HljXyq/mvgWl3hpH/ChHeskFHYqt/6cdcdeAhPEuGJQzLLWHavAhkCD9yKcsLnoj4OETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN3IDsmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVuAhnzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pN3IDsmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVuAhnzz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcIe322187
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=pN3IDsmvSfHM+xwQ
	CH3TYcCyMLCgG1GaFQ2h41SnTNPDhAXPa7yUUVyZRnhEtbPdszLbOAcnxYZYKEdH
	fXAdw0so4zu5PnU6UjCDisgmJffhi+EXNSwFhR7QBBZQ314vkTm1i+MQ2py13KWz
	RfyotsYVNosihG7Oo4yidM+WUAocWnS6SGt/xsaeIEWz9eLdkv5ps+WdV7X0tjAo
	rf66PPQBo7H0WMl+HVkWoxsS18QfVxK+3MsTdwoXGxZ8zF3vMmXG1qaFouABkfza
	4ogBdVdvzqR6JpNUYZEf4evGbdZiTGwbYWI/Heb4KTQhftXS5GF5IMlDAeJfYYGg
	BdpzQQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y07w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:54 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4c27c728eso45625261a34.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 04:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848114; x=1772452914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=aVuAhnzzQHL+vAgYx6TarQzrbjczZYVKr+csL/jk+y4cnv78c9oXo3uZ4ND1Cc3cHD
         ewU8P2haKToAqzzK9OPdLJ+eYnCyxw3uv/uvbvHePIkYYY1m5G9IKuQ2be23GskgZc4f
         9M/eqJfc1kDb40MXW7On4qAsrM7g9cVhPXS3w5PbaOXVhibDpZNkakymvyz1UT5kvYHr
         hyHA1SNVdvA7HYl56LucyupsAF54oz+b9kD+aweqBmaFUIE9tOIgFsmAJXe8NlAoKmaO
         sEDQMaAY09hbvLxPq3XP4oG5sTyRfY+BrikTmWdZrbaOxklPDuN/CcfhCxyhChMO9yqt
         2SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848114; x=1772452914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=nAoTk/eryckuy+0O93cmxh3vvsgCEuG4D5Hr7v0SpVljltjEwSIYhhLzqMwjy3fjU6
         LtUZ+SqbOtf/7AukzhjhIaZ99WXs52DQ5yCoOMHzcQOujHh+uzl7wW6O5r0JKLKkyhO8
         9EH24QRZPoM0+/ilYCu+a9cm7tdQ3vpqo35t3q2wn1MpIX6JxEZDuM7BzfYxA4uNJ62a
         R4Dwqr1rxPNDTF+xJwF398Dqwt5AV0fvppEzwPTtTRT1nUMi68TPyl6wNMS2YZT+l95e
         iznT0LrFM3dO2dYKFO8MegMvYGkAxb5bUnZCCUFXqZSnb8pK3Pygqmr1PXz2kx6tzdpc
         cfTg==
X-Forwarded-Encrypted: i=1; AJvYcCX29PEySy6TRmodllVc8zI7lk2PRGIOtpZ/l+ufFz5v/EQK/cUwIdDa2SKlCgP9e+spxGdkKA5PISA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpsG6k/T+VTed7VIH/GqPMl3a/ueM1gJFiuxSG0qgmiMH9L/t
	CPEFuXygBRpQmAFgF1S5zvPMON7ErlKLW5r3x6SXI+SmLy8s8xwdLu5uGklG3NeP3ruYxZQYnm8
	3yQ8jYEoY0t1QxvFCwUfJoBLPD6+3QEbf/2ChZ6W9K/UnBSdBYb1qkWFKBTM4dGs=
X-Gm-Gg: AZuq6aKpK9XuepcG53jsG622l0fxXHYPNWH17dnyrMXkfU0mi9KT6lvSLm0Y7q7Ve0k
	gZwtHQ5g4xHponpbvm+uh3KCJ3XXROlFo5dk6U12+dc0QkBQdNhQgsFqkZT2SS6Qj31kJ9mvp3N
	ENdNdDc4FJwF/Gy0bpGZJyPKSiK8phW2Gvqpus1g/WLfq4hKyP4F9k4XskIifUmzAUp0NiA82MZ
	gZ00ir3/LsGD2h1VNQqpL7V31ektnbyIiD2x3FYCWWguHOZ7Ty1mRkzi3qrKUKhZZpCImLHbgj9
	+mFMh/USqNlOmxypRTAgvSySt5W7t3H+8yd20NqPAV5pdDiBJW/GTsA57CMldX4cbHSc+j68yWc
	itpPDjHsRP5Fo8X63ki7BoFkrvpJs9A==
X-Received: by 2002:a05:6830:110a:b0:7cf:d075:2674 with SMTP id 46e09a7af769-7d516a5d08amr5937429a34.15.1771848114103;
        Mon, 23 Feb 2026 04:01:54 -0800 (PST)
X-Received: by 2002:a05:6830:110a:b0:7cf:d075:2674 with SMTP id 46e09a7af769-7d516a5d08amr5937411a34.15.1771848113626;
        Mon, 23 Feb 2026 04:01:53 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:53 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:20 +0200
Subject: [PATCH v5 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-3-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGh77K97ujy/AEvMQVGLqQDHUKNiSJVUjZJo
 huNVn5twEaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBoQAKCRAbX0TJAJUV
 VjwwD/wNFxvckY1MCknRDYRYcg713HvOycyHmIENyd8IIlD7fuXxr5aKHfY7H5u92zoVIAWVu+E
 Q+acZEdJaW5+7iyx3Y4R/3N6yIYE1b1FLeN2XZb/i+g6TWaT8JqQbXez49Jlum4JeWOKu4CpsVB
 Zrm7eKIFN6pY5wFryEv2/NfhB5TGpDGwtAbI27aKjzPZGpk7/IYtQuncxv/NWv0Nw8WBq01zjyl
 SOe8DDtLw+ioDn7XhSZaxa6wWABno8mCWOULPnOHTVEjAGPhujpFqth/Vz0xwamz+sVEKStFfk0
 svLuByp6ghmup2zlX+lBIYUZ8RjUVYQDL8Ux7wduuYKiGcdO+9VWvQv1X/UGBTd5gkxL7KhHXu/
 BHCN+6JXYr3U1NIjZn85yqCbD3ZMUH1Al460LDLWL35y2hpypiSdV1kkk6heLLK6OI3828zaI/f
 mZpDcFCRVizV+CcqES+xjEDR79gXPqr1UfQid3QhiRkOS6FW6Yv8128tg4DYpeOhjyXMarLzMux
 LqOx7VM8pKTP+IVisc4BNMVhtFF+Oe0a8yEY0JUbkMPzAtLSNIBAOEfr+Q2P7v4CmRsfoqlPZV+
 CZK3CD+FpgyB3DHfu9EUs0NlwEcRUIeQVr6qRJb1yNvHr59V+XuaoPS/Zd0ODDCmpnXU8JWqEcE
 R3DsjZxh0UoksNA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX0d5zSuYCEz32
 +guFnlUH4VaagyBO3UdaWG+HmhQ1MU93T3JRv2m6ery8qX0UoPHmAvkxwLwyrmyfC8IPMO4rUNW
 B+PumEB28n9Ys//UcnBDctWCmQxF/9N3UoWiwyRIWC8L0NV3/2TSGVQ2EbYXcVziD/vLNBaXnWz
 4RANyRW6DOOSnaeSywt/9PkD/wq8SVtX+F830kKSAJDnU1/BhBEGJiI1Odj5hdNtq5rmKd02gWk
 FzqvHAZfjnwekv6TER4ed80YSVf8OWjX3Fxf7CX9NlqKBU6mcjs70e305XvUSLncB5CB5yRFacF
 ttqCnorX9mxrSHSQwhkjS+4/2dwDWLea0HLBRVgbhOP8kxz2j5rPcvV/ZoYIalj8tSWnGkQP8zO
 6lv/O7kbnD/XlSAO6VE8mQzS5WIT9ST+qnl8XFCsHtvexcnwzfqdjClDwrO7/zuEQsO7q5Py9Oc
 A4hbg7D17xInFyNyP3Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c41b2 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: v1AIoaanh6Rj8S-opLGYcBlGbo0vMOJA
X-Proofpoint-ORIG-GUID: v1AIoaanh6Rj8S-opLGYcBlGbo0vMOJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

