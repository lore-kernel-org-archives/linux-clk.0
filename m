Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8A33DEE2
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448829; cv=none; b=fMbrEAV21H3kKK/tD4bH7AbAjVXq8lDJ6j9XHqWHxqNoFO3tkZGpJt7M70w4Di+iLz2O9nPeDivfMwIJiTV+m6geg/Vpfl7LBcpzk9c9tCEbykt4+WMJiUR6cUdap30wS8paLFSmSHLDUkONU2yT6zQ804m9ptTZONyoDp/0oJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448829; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVDH2z8B9U1FKuQvSKiwDnhsajvm6Z3IoITt9gNV8iVEhNm7jXbP2hDAVa5/2KvDKTRl9pOd37pOPIFhbBrmoFKtSi0XUpCf8rpaPKmYH+IeZCd6CU/CRq7V5MvgNL9344UcVASecsSNkx+9D6v5lmtlSaXRfzIMiPogKzHnk/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rucg4ocR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfZ7ZzD0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rucg4ocR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfZ7ZzD0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294a2s3753087
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 10:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=Rucg4ocRbQ0PwDDy
	KsZARxc9evrRA+0TNx3/l6lpsQ2ku5cov8gTHIfUu2LPlX4ICMHFPoJV8zZVOuHP
	kSJ9hAHEIKxElind4QK2LVQ2PZqJ+awqBpRU8BpFtELYHE2z2YrDLkiPsMzhNT+Q
	huAPZOTsLFK7q4q7dBi8JtaS19HxSaiESHDUd/5kJR/5/TqT75IKs2trXC9N4vhk
	GxbJPncJRGMpH+9lN4t+8bDPBNMM+DR12h9skELQcPdfUFBUI8D6DdGljYYU4lc1
	JVQ+JR3fpOgYZLB0c5HwlnZbPzipgY2hzQDmltK7zIyHg9FPaIJ8X5CLsP6ONgIH
	e/WiIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8d50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 10:53:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so3039585185a.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448826; x=1773053626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=YfZ7ZzD02u072p9wkZZlhdvRNEp/bFSaJCJmqKhvNoZWKSqsnY4AKpt1Lc+C7PUGao
         QOVYPIPGKTSxa8R8B2z5bID9cGOztSlAy0jDzXBbITj/h7mbwhb3wWtVsRi9Ooakk/wU
         N45MYK/yl91FG2mDu7o6cBsOUG1DZxAlP4JMUh8eEyf5P9FvYAdaFIy8/0kEz1gCY4iJ
         KdLsext3lKAFKych4+fHRIhr2kGlmWJgTtPpCM5YBPZrkSr8uXvV1R4Ra8XumC2b27/j
         MRmmxhTWl8GaZhR8O8vtIIc0jy0hvNTCIc46EnqHrQlXB7zDBLgkNL9zz3H/g9pQp7d5
         R68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448826; x=1773053626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=dUL3HWNkMo/WhbRqWtzSZ+W5/CxT4X63LfKq0Z6WrDA/tmv77RGMknsf8+xYXUdsEo
         tiU2WZI2U4OdlOtXMc32nzoqTyR0j7GEkVIpWkmV1vcCcWRmhDY6UcsNkJm9x1yDkc5J
         AfMvjfBxOK6ImNAr5WIYLgsvISvlwZ6My3ooS/JVWK1pAtCD0G3ZekWkjlFQtQrQoSni
         zJDsv7Fk074yh8C8fZVSxr2LTIL3p2dBXFniLrZTKd/hQ8d27FZjkoCAdXT73AWm8l6w
         fQiL1yQFjCfd8yx4jwWXQNpDZkyEP3DiICnyTThIo0nY2RY8NorITVYV4ikcO/uVwppX
         PsLA==
X-Forwarded-Encrypted: i=1; AJvYcCUJa0b2h2ySVx76USqwm2/WzaAD1El/G9KTMN9wP1TE2rP9VZEmzZtLjS9hBPZzxKT4cs4sp2ywMAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3BpyJlkZl3JfRqh865WYz6OtOhJLfJD1xoR0hAmJCFI1+qQ5
	kzIumjA1tsAlHlgCs0jOkXil+qd7rPBNE5peKEBrLKEDUwJ5fAi406I9haubXdqLMo6i6Rz6Et4
	pfTTDj9LHu8C4MCIpLepQz8eo3L4jjwSi3hRFOR4H8you5shp/OrNxzY2qzqZhfE=
X-Gm-Gg: ATEYQzzRWchTOH1Kv0pzOxJpwV5au6pc9rYAzLEj+HuhhRQrzxAzg1GRUAKbDkqZLhh
	aTqxsnV/Wy6zyqCFvoItVj81AcnE8FOgb1K/UNzePHR0v1baL0OQdboe3BTjiBrA9H217SzTNbp
	SqKoYwRRMkqKAlu/KZtVAul1pgHskrmUgAy7sbz/abxl8Eu5t+DfLtxVlOCe0N1xq4vVMnQ1BII
	j7XBJRAXtu10nBI7f6x371bBPmaModCa0IMrI4giG9cMwgUVmR91vq0qEQ3lDhO6Fv++eJ643i/
	Kefo9h18SzT2hfSbTAYF+OzJLlEAHZGeDLIYEQ0shRYaGhxlBYR/XSffFlLEsD8cOnGijEPlLq8
	4KDDZxCKy9BsS8nttAiV7FTbdzzZkCA==
X-Received: by 2002:a05:620a:489a:b0:8cb:3bca:bb3a with SMTP id af79cd13be357-8cbc8e0d7bemr1307887785a.67.1772448826037;
        Mon, 02 Mar 2026 02:53:46 -0800 (PST)
X-Received: by 2002:a05:620a:489a:b0:8cb:3bca:bb3a with SMTP id af79cd13be357-8cbc8e0d7bemr1307884685a.67.1772448825487;
        Mon, 02 Mar 2026 02:53:45 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:44 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:31 +0200
Subject: [PATCH v6 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-3-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwtZVXLYtwMyb0w7VAkBiiqmoa48AiDR9s7u
 rmmr5kIwMKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsLQAKCRAbX0TJAJUV
 VhIYD/9eWo9XreSgz5q3fcIj+NGy3CCari/P77NiP+MlUNAuwCtfkX9Vd8w9E4RvH/aR4RjXd6Q
 L1lmDDEJA1Cu4nmCNd0wiSm53VlDtxuNzweG+4lqG6Z8XTLPPIiuvUcYCP52aBPK8x3B8nRUJmX
 lcjl+fagZPYsbXpxAk3pLvpZna9tZpkvMLfMFlus2B72SQm3Xc/gyO7lmGpVq53USDjSBJF1ppU
 SjHcS1j1IHH92FP064by//xwbDBZ8Mk4kGzrwOTAX3S93Ymc3NZAFlWr2BaWVbii7M+HeVRq77J
 l5FKvcCvKfb62dKGtN57bcoHvfCuHqWCapFbv02jKJST7IIDBf4Atck8OX1JnV/xHbyxFpjitRL
 T6HKHAzvYYgGay59Yp7Igt/p7tTaYHn/qvGQwGjz/IQw5W7CCmmOX58UlmRKkVzO2TmwC2qeT44
 gGAcDrPTMo9eq0bizbZPCLAQcB6M1GmdvyG5r7Exz4VX5n8KWFDwbz7X021hxZlU4ySFOjYKCU2
 vSeqLalOrP3sU9TGUxDGzSbU+oxM9sq3k/4gcRooFy3hRGVX+BAHBS6xTo6hwxAHd2DfxjYxD3c
 l/pdvQQ3VyeoqYEqjJsDRbg0MVPd95gWUJ86zxWbib4UR/cKU+LfObRixgO3d7y5avVj5MIK8uh
 b5+C6Q07Mds/nFg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: r4yptbWZjv9rGClJkOxkLSURIEkqJqc4
X-Proofpoint-GUID: r4yptbWZjv9rGClJkOxkLSURIEkqJqc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfX6iOZJPWe11C8
 jWFAb6/Aut24NZ2C+h43vmyGGef6iy6gUua6JKVB7on4pIsgx5RZoU2bV5dam8Tf2cC/txtD52v
 6MODmGz8db2qdsflV/9nyIUdcFEwmLcFBjrLO2K1Vqp8qXX39OQPbKeMWXl0mytF5HBQPBuPpxV
 4n1joD55Cb6dKoDrTbhPlbq7G450zvmMJS9MLn2nIQy16zK4sgGUyVBHIVDY+DOYSMNsLCZN5xR
 ezUUSAUTNac+fxcorXvM64v8GakjS0B6AoshVKrumGvyXDy1cEAG7RQ3AOlulSXgbsgy4Wq64E0
 O/FZbtxVjk+UDXMZRgIMlw6I5LwRDyMlir1tGpyW0Zi86hYWwBaSf7qyOvEK6v0Jt/7TGTGSV9P
 GXEALE1CBeFub5LZit9VbC5K4s25nC7BySJuWqn9FQ1a4CxvhN2HSTUEEPLAaRUy1tuUl/R20ge
 p+Hl89iydt79EVOMspw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a56c3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089

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

