Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0DC34E763
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137710; cv=none; b=JOrKhgmKQSUsM7eARPIOA7+1sv3gG4tFXNs/GKnL5+4SGvlGTNmpJHjlNI6M1TtvorqO7rHEIeLWRAYIvB1qtLjnFhFrT2fhYvzhRVOg4zJKVzPbkZDlosyyoYJNGGmwQqtsZ183J1PwWwQcXUOe3tTR/+DyO7kW3SMDAsJPGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137710; c=relaxed/simple;
	bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxO2DcUlC3fBm4Je7tuRrwyAB2o7Kz3ciqvgalLvPOj7/opHgY5u3RMXcJ186KCq4JuS2EdujwypSO+h/59s+GTSefOmWH4b+Z7gDh6cwUAiKkNWgNqYUF8kwszZGSufkzWd9ZeLkNbdivqomUzBvAQfxVb7USISTqnsISyxpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCPoOWjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kje4w1hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCPoOWjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kje4w1hG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64758tm13924161
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 07:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=; b=GCPoOWjBoxXq/hvr
	aVmio8Q8JrmhZt1pyiRm1DS2Zlx3pcIfVI7graWIXoCY23KYda0sCDqb41+/AmBU
	683Py2lNYEourrxKrSdW4c4UTmELN0emoF0AoxANBsgxt9Ar1YqZCSs1A9xiKHQ+
	hnvOBqzRHocS9GAUY980MuU1+8OM6tsy8XV4g0UFVxkmEEgZuU1fxDfD2cTnYEu+
	NhiPv8wAuYy1tA+fYMF8p6c9KdpFwOpju+bZtjokrqZI5zXiH/uKcaizcIMLipN6
	RTwJJIghDso29aUV30bH7nVrMmAy62OPY0Rblna9ZdRb2AgLtnDq68On7ksXj0y+
	KFCUBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889wc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 07:08:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b459fa5f76so6883636d6.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137707; x=1778742507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=kje4w1hGSvctEtMDrrmE3qneyuZ2r4zXM0zTIGDOKJNROz07ig8fI8P+rtTpYsLuGy
         zzdECd6qPPD7IwEtN/GqidhOb6HM4qBmPmfgRELUz4q6BCFmU4+aMNvl9yTnnQ8+nqv3
         viRjtGiQmQmpeOc9HX32zfxXZvU+1v0CjAbfCthdDYiEkt0oDJjbC9yVU7Q6zKYH1UUa
         be116xprypypOAqZsrLiLS10/lb+KvYobRpzyC269Kjds4CkzBo/rzRTwSEsD//UAf1i
         kVx0MoyLfH9iGBjkHWxf2UosuAO2N6Kx9yy07c9TEoKUdSiCJBamj4srGJETv01uc9W6
         AtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137707; x=1778742507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=Bm7ak1SSpwFj0TNGw5FKi3zyoHqCa1E6ZCLHY+mO8rTkwc/5AQUy1EBEKOX0QDzUpo
         OUzMEc2LaP/AGdo/wSa6G6oYoyqMXCHexRJ+xAuQRRQEqzm0GRJUqve4lz5Ziehe4gWC
         ELZ75BjEW5RZekcrpmvehSOWrTTdi1PNFn5YM9HSUMw6/rya6Buml5X3ZAYM5Zjd86Rd
         W2CldqjmZj+bJvCykPQfhL1QIsNrqL8qQTfLTReQP1mQDa+Iae6xFdkethf4v8hvJKHU
         byG6VUvnUI+GbsyI2Vph9BGeu/Y8ebpZHEm/fElUec1go+HvfazV9pdfMS+sNOWDH9yQ
         ZNBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MQ7BwrvooQWrrwmv3bEBQC+BVF0ASOgvC6DXr9moPVzTVZaJoXkxZCBwIwIE/PUW9fP+w9P+FP30=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZu6GlJ0wplyDReAKepoeOPJLfkzGvviIIQXMZlwVw75yPyZS
	KHBPF036scnjCVHA89T76faIp7Ll2pvICefDbe50rF5tDhsNyLBYbxixAYwWZIBLOozoqeV+e6t
	T1cc8t8/APwE5Caw18nZ5kFhKICkC+JoK+vvq95PIk9xA/c4LA8Of6ij/5sDIhv4=
X-Gm-Gg: AeBDiesbus03OXLpUBio2xvh9OB5U2eUwuH6v8MyCuNWlYNMeWYzDkH2DWSvAhhbRGk
	1KeABe/bI8aCu9bZD/T63XxmyO16ofWxy7Gwafld7kg+rGaqV5gu2vs7TI8lmiO5T5UC4BQA1jF
	/APV3iuo0zhFO4obgc9lr/BntTpddQxxfoxVVcsmRGYRAp3HuFyt4P8OJPzvtqiPwMDI53x+w8L
	3ggh/lpbBdrD7moB1tI6PIub8KHSCVC9EG5BJJPXQ3nPw99iC3C6Ud/EClDgz0FkJXd8yXrzNIE
	xrqzELn2uCt0fQuDtOo4kftWEIBvGdnPf1kGVgFB1oE8tWDr0kIQSrVaYzfsecTP9EUTiAptHK2
	Vd2qOl9g50jscykcNyIjb60hpbmJFDhtnzo7m5VsxSCL4N+B/BoLkM4SGOzQz6rx+gfscn8G4TH
	RyqvI269NXOzrwVjxENqIXAu6zz80O9yubHrebnj6RUusUWOuptx3pUsui
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96643131cf.5.1778137707192;
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96642751cf.5.1778137706707;
        Thu, 07 May 2026 00:08:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:10 +0300
Subject: [PATCH 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus on
 SM6115
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/Dpg+89AtTAZ+p0GTGj3HsNhLOa2vbwG25Q6X
 SbBwZrQ8QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1cA8B/0TI9p7676sBpqMniKHxUYJrhvkKisA/Y1KN3RiYa89rIH9n8ocbnKFF995SWrgsv7oYYR
 CKTyEIuUYztgNIhfMdg5PGgGqCwCSHoHMpf/AKIUUsfXH5N6YvjSA69XHCSC6YaJMbVojaSl5fZ
 QfIkcZOcozsvmFnQ9BJtbZflv9N9TJt7qsj5ZtJ/UB6ek3hkQBxkWzpgWUU42DZWUG2dxe2AXSo
 HC1MMcmZb+b9tVh36raU/pKpzvhZsZWYv2Qyf6jYVnCySYl2i/iJi5dNQk+62T7P2SrV4EHyuOe
 zIS2NKukgyTeQmnOo7XQBABMqTtqVjzWQj61xam8WuhioCO0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZGmYALbdOm_gb82zO8iO5gb6hj71ex4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX7BQjIojzpYnP
 U+nl9M7BMW74HzcOrPzzWjjBRWMOh6BZUeF5MyshfbGAiwpbMgmNwZlqeI5kos3jYb8GOknYkdS
 qfFPvvWyQUoxzzHpljpSAyoRWp6tC6eDB59Ic5OyljdYlcD/661xUtZU19Z/E/WLqhPDVZkWC4K
 5ObIYrApiNJnMzyWfdfrOXyBOjuDiaxrCIJ4EUkE9ybtR6LGXzpqBNY6RE++tg6qmL1ZJxJGOlY
 Vom9xNqlv34IgXcz/ELOwaSCECHjXwYFaPDGx7v5FHlvmPP47CML0S8Yxb9tV2/Sqh4v9XWkrLG
 PtmHKVJ8xEJzl4z3ff246SMdLMVC0DKm6h7cVhzBsC1jYyGRys4FINvSv1pAePDqs0RTsh+2tu3
 0kRogZJZIpWCKDvuOV7ja/u8Hta4kILYh8WUBe4jok9rmHqxlchUyIU45TjjwA2Oj0G/e+J891h
 6Q1Oxwek4XDGJHu+dEg==
X-Proofpoint-GUID: ZGmYALbdOm_gb82zO8iO5gb6hj71ex4h
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc3a6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Qhf5OHDhvhXNivbLZvoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..5c5933082f82 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,sm6115-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3

