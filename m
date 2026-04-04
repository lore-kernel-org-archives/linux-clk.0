Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB482E2DDD
	for <linux-clk@vger.kernel.org>; Sat,  4 Apr 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775300084; cv=none; b=ebSfDVIc6fe1h9MgJB87KA6dhOorMVwqbCYd4xtrvC+gf99/5nN8nmccUBWc85TV6d0Z+YDhpoe6JELwuAA9KSma57kssesI45MzIIRZocmaXyJ6BmhTXizAcLyUPbIsY2+9p337cBBYOkrlpkiWek4C+br35RPutPyADcu8aH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775300084; c=relaxed/simple;
	bh=sRmu5BpeXarcwmBWs/DDTiNjVkNjTGtekU+vMz42qgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLTg4N0tmfEGgJYM/CDusBQcWvqqZJ2sHumYmiUQ6zON0ZVpolJRzZOPF5h9rqVgZ6trLKJc8rf5gOzzVXm1QWGxQU56vMmwwvKYdB3Qf+Dk2foYs6Vq+hqIZm5zBjrUZ0ZVluy3jhz/6DLOu+y/YC2kVJpnMoRZMbwgp7uCrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqPDcqCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBp4EvOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqPDcqCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBp4EvOM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Bxg64114558
	for <linux-clk@vger.kernel.org>; Sat, 4 Apr 2026 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h
	4HjDRdhc=; b=YqPDcqCZes02c+GpDK4A7lgMf31fr+CDFuCIRnpOq7b2HrgeV6N
	1WKrPyl6R1XGppro5YbComfGB5c8GUmb23hkhz2VdmgzQem8OBQRI3qcCi4a1Fel
	OojavYdae101JAGjMRKzrLw4cxqSCuhoXbqbcv5McMQ6PIaljSXvQ6J/rpQ+ugyn
	RfcacaGJEh8bww/SrdeaZupidEVnmtrY/Q7K8yhG8IJUT7gTP6K2HphiyT6GOJU2
	wgqIY8GyuWCRxTvPasGOBX2932Pe77IFkbP7EG5wO4ARPvGHz13JqKZqRYldcINO
	+Sjzk5PAEm3z2ZSuQOTWN6U5WPrj66ZYIQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5rsf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Apr 2026 10:54:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so127682961cf.0
        for <linux-clk@vger.kernel.org>; Sat, 04 Apr 2026 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775300082; x=1775904882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h4HjDRdhc=;
        b=FBp4EvOM+pVJsdAo6beGBAmiKyY8qtsTMde+jv9Kgy2WbukM5uLKJbofT/n9k0NkTV
         oMWieDldC41pKYKKeQlrj2n/JnSR4qkKxcD9rN3dcpWke3my/cV1Jrxpn/k39Z9VI8TT
         7viie/XkQxcgaPNtxCh6Yi6KRrsOS/9Uy39YIRuE61S1J9E3xuoqFYcQ3y7uiN9D9yuJ
         ldUVzOTUesi3Xja8Q1MW/RL1dL3otuBXbtcZZh2L460hih1aDEZYk9T4qcCEQGf8p6VZ
         xox2iQJi5EGFTmuyeGHbuzgHD/2AQJ2DOKKt949PgDpKRAj1Ed6uJsuLVt9e6woCASQr
         tw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775300082; x=1775904882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h4HjDRdhc=;
        b=lDNAVL5u6w4XZems9VaBQyE4COcAn46+y7l9xGQ9wHE3OWrNdL5jVdbnebk9MpS5XG
         PSzYWZCK2SERYVSR+LwwjEFbKi8zroqBUT3TNZEWWijGIMRuPhfnv+n5l6LWpSROw+aI
         A0pHZ5jfu66sJANU0sf/f7/Qhc6khff0Pb+A5OEIGY6K3745JaJWeS63bXJAZK3+isXu
         EPOGYisehtwsYRj6pXHcJWd7Fl9iV9165bB8cgQGe4SZnOM8zCxeAyix9RKSMis7wd+B
         Oa2VoW2adW0GunFsWaxr4573W+Gtoy7QSmBE5O1wvS82TYEDGYMQQK6QT4V9s0NVKQx8
         b75g==
X-Forwarded-Encrypted: i=1; AJvYcCXGofRCTJhAlFAtvAiKCyzO0dvS/8bDSrnAzrMWpXgbqilRI3L75SEOrtBO2tOk8nBMIG1Pj4U4NZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxelPujCK143eMGQTTauOHMyLt5v5AXaGAJL010RbQjzaMkLzD/
	eT6YlXJ5ODuaz78mdHO+EurOey/jn7GY/O9fFZl7j74vViGyg/lvVfwfNxV6kxANc5qIg8ub/IH
	rvnUpEPJBSuxCsyqTiIwV8mTMl5T7eNegjoywIHse2jDvf1aHdY0ScAgISBEO/Bs=
X-Gm-Gg: AeBDiesEtFrKr+Rls+igooY8LS9p84ZGbUdLqYJNTTrYb82RLYxmCkVwFtLmtP6dfrB
	9k/VZ9uWb5pB52yzoJKrsc9/5N4ggXag7dgtjJ3cZlIiLupxULU+2ppFHhzz5r7tw9a4a9/PEjN
	YaK46DYB8S64548HIe0biIzBnim9Sr98LxM7jF04fsDDMvg0cwQ2KM2qSnGwYQfquIaa8njlV/h
	fXdDGa/XtHa9bBuArK2ixL74q6ZVYdtph2MWdAQFD9SQ6vad++XuACTWfcqNgViob8y9BwdpylJ
	QHd991QMqfq/zsV0t+zNfeHFNf7htbTpfmE/v0wYNFuKYtYvPLG2I8bvxSXL112FiuqZy0KSgJ6
	qQJ8Z2DA18sO2TQR+eze/+Ba6OPfdA6/SJ1Ds
X-Received: by 2002:a05:622a:7ac9:b0:509:379b:d48 with SMTP id d75a77b69052e-50d62614be4mr67571901cf.9.1775300082170;
        Sat, 04 Apr 2026 03:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:7ac9:b0:509:379b:d48 with SMTP id d75a77b69052e-50d62614be4mr67571741cf.9.1775300081748;
        Sat, 04 Apr 2026 03:54:41 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm25219957f8f.23.2026.04.04.03.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:54:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties
Date: Sat,  4 Apr 2026 12:54:37 +0200
Message-ID: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sRmu5BpeXarcwmBWs/DDTiNjVkNjTGtekU+vMz42qgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0O3scyS2W1bnaDSbdWrv71bJEGBdceLO5SLO4
 kytGboL6SWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDt7AAKCRDBN2bmhouD
 1zzpD/92xOMy2jvIuKrwX0AvSrbz8VnPNAC/7Z+NgCpT1xptRAIbwmBRakX9JDhB6i8rLNS++6F
 TObrEr5b0/H7+vwU8YFfZu4M37zDI4yPKH1kE8X2MthaDKie0tlpk/SzoD3Sh2uBPDMi6VeAWx/
 7zDngDUm7bKIKuh46joxFyvCcfBPlv0Y5OlmJzmw5nETPEO1ADZxBLxwjW8WKVYuyZZFIxKnzKI
 ywL6gy1USSTJf+gOpEUTvRWZpav0sMkneJVNSblrdpuoVmxwXqJr4kNZB8PGJwr7gV2MX/xPCPQ
 w1g8rE3suy6ZNngNk2zUkObKyV7QU4sY5QalQgwim62d8B1TZth/1AKKbnRQaFZSL+ArfwL6sFt
 kfD9CI0nhp6jZOQxrgo4bvABQ61A0SjoY8Y/ht621WvtGzfB5j3ksjhlUekfyIOMR4+/qj7dO1O
 nSsqk7bOVnJaHCcoIQPvplnbMv2xGQv0F1obrosU/6wgTeb5Djf0TWpxgKCuwSMuWifJa8x4hAa
 iVOpgjLmRqMNEfvXqLsah9svjfxLSYQ5mzZCTTvPhguz4lsU6KUCQjZyK6Y3A2q8kuYGxrw0Vrr
 bRX2ai8xLAluekciCrbXEnC6mdoJjCTpmTGj3BedXmqyo5a5XVA5Hq8SZhtf1gvHCTMwqMR2EVI Qxg0eorOpHjwP6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5OSBTYWx0ZWRfX10U3RNJfDxYY
 mGtCaLDPyuPwJrk+LpukySxLt6SJPiXrGBYSzVlnEMXNB3AxeR2THJZvA8rwdWKClXXywL3zT8v
 3uhrEJIBnlu1HSd0yMSwl46d+3yIJbx6EXP7WGlpgFl63mDTZsKQNyAimSd8jEO8+1jxdvCZqAs
 RE9q6Zd4CYLLi8goxwcLBUG53i27STnlsJelgrwNXp5+0irkOLRF2OBlr9dfIeWbZIJRGKKfMz4
 5PQse9ePWtsRVAYo5YtePdYSjP4pZ1rN/xt4NtSREu5lLbE7P1y5m4MeVQGm8rhxPm3jzvYJe0U
 dxZ60GFSYkrnd0qU36n6cmaW7yphbh8MagKBf2PI2S0XjnIYDYd8n206horNZWOmxtOJuA70HxA
 gIQ8YYjKEp17rfdUjc1pi2Kq/BgMBf6wd8mL1gCx3AfV3uhfKpjixP6YvMvB4w/NHtyIN45WScw
 JpjKgKm4s8HddaVOsAw==
X-Proofpoint-ORIG-GUID: B-Og4rkJTL9PravtHDqWU_35SvNESqQt
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d0edf2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=T6h60DcBTnRI8d2fgOoA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: B-Og4rkJTL9PravtHDqWU_35SvNESqQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040099

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 466c884aa2ba..e868963f659b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -44,7 +44,7 @@ required:
   - power-domains
   - '#power-domain-cells'
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
-- 
2.51.0

