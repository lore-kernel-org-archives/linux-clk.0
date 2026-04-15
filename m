Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304EA3B2FE4
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260025; cv=none; b=GSeBekLiU/sGRv4Jk3nYHUvvfqH+8OIdHGPCLZi25OLFSa3KzlrUHt9KJI/BLEnJas0Ro18v6r8ecpXo7Jm+XW1bzIlRePmI5Uv7eYUGHSBiHID1W7OQF8MIPV9CHhNYsyx608B6k90s0kG9CfINuHZLm1tILYA1OhKm2Wd+pHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260025; c=relaxed/simple;
	bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prbxqKAYQQrucRbgOb33GQffjIJ5IYdbE4za+bikDoqG9tvufDYz/eqLQPqoNONUkBVFFRKCVxuaWYV0K8TAPuI7M+5R9qoVngR/EKWgi7huq2UXfY4wNdSXHnXUNVlmORvxzdVdMvKQLXkxj9qgj7s9zeOsuYI7J/wHQpaKPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDsKW/Kp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFiMD0eC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDsKW/Kp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFiMD0eC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F91VKP1778920
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=; b=SDsKW/KpPp2Hiu6c
	gcdlLl9u8QMmW5CFpeGhhyz5jpTJy2XWToMecq5zeaaQjU0/f0eEMR0XvpxisL77
	zuOADmDSZKf59Dg9e6SL9qSr1z0y6UzEaO8IETn0jukdpIg/5Ek4RQs4ByH5JE26
	WgNZ/hlGS+qvPt04MhTgYT2Zi1J9FOSUqh4nvTtA4+W7rBt/1zSpGfyu6TcdvSns
	agkbxLJK+R+1IKQJP+PgWouGNswUmnydnKaLEL3Uu8MjGJ6Nd2cobciFY2sczZZI
	wxJUg8FpSdn+xP8yQQ2vWiS0mw8uXjunjxUW/OpMVbZk5t1Lgo8XB9/bG+52kU4B
	jrwBTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03r9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so3627244b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260021; x=1776864821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=fFiMD0eCPMi7PGifkpFjCPOIzf64YzZmmrEgWHb2Rd0cgrngJXr/dbzeykaLliUen0
         jh6YDj+jChX8rXi10sxeB/UaAfOUd16x7ysO0/0seNWuG66KPWpqwZw/aJKUIjS6CJ6W
         IpXVlVNykg3Geh20yXLGGhIKlywStItJZ6EOoHm7fUGWDDi3gQrqzGoJn16h07rQjSLv
         hqc7QX535isjwBGVwkS5g1RYJZ5BbAQEiIUXr6oCPdULbxTTSjRFs6PjGZflkbebRf4X
         cGL6d2hfRy/o4DY/ubYNGDKx8BTJLu5VT6eqSPvQM9vlc09IP4JRlagkBwmfhlP4vxrB
         wjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260021; x=1776864821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=XThWple2WnPGFHm7m0755xWq8K3CnNKtQZnFfrTNcH8nLwBZKoL0jx2pZUF3KDlr+e
         KOXkRARZT6ftnzNhJyygjjhJnkRWFk5A2ZW5BwmByNOXBLfhbJXrhOIowTE8zNXWaDNy
         EP4IWl+3y7ASF6Fg8FXUJK2xNxuvXrrjod1UFTsiW1pNIZsWKLICIM0sRQNzAazHDvyf
         Axl0EWxokYAqZBPIMEuU7lv+qtYOyicb3Z6QXGUdMuVhBiAQOGyKzLlfOugW6gJYGgoo
         jP9QsXd7iF+wJSGI629IZxdrXB0R3vFTx1rzrmtSUlPil76IHSxanx8kAC3mcLwAnwCb
         IxPg==
X-Forwarded-Encrypted: i=1; AFNElJ9GrMbU5MIhudLhi0E9rLZsOQ1TyNXbgR2Ov0sDFtGBHhgxh83l9IH527l7Bl0EaG+pDO0XLVRgh80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrWWMrerreIXU6DHUPKnByLZ6KLxlKj3wzxDXjve+CRNFMa1U
	Gja8sLHfgBQ1qTPmaFovxzAGkLxbwMrzl29TVbAeRsaUH991YGzARFA+55BNR4Rg76bb7umUaHe
	CrkQC5+/BJyOlQJUSAcX6+UX6aAnti/WKx8huwVPwb1zP+X628bncapww7/O5kAKa7dgcAHI=
X-Gm-Gg: AeBDiescRSE+DEmDEnn1H9U0COwN5oTuGIEqD9wMQpDpwEs14rORh1bmjSCTfhX1wFH
	ia0CzfIUvTgdUneFXFuOL/GT3ArqKqYQIlWUD8ncP69wW7scOybtp8Gx5Jm/Ex5uyoCOGKiH9gL
	C0zz7rVbotLZEnZviUjBbEnwsWLYvzZ3N6gRyi3/6D0cPEnDZN4zfNQM0wwD2BtYKEzS4Rntjsy
	OICEuhoFxKUUIklMRQG4Oz/sQurOmpsyOZJdMY66IXRMeRc6N6bF5vUUDAh5lVXUmqaoadoZXZu
	0mlFqkmbnbgVHO9tmZHt2vAdxHJlyWcKapNBXrL9ce+Z+5MZ5bnxrmRM6+PU29rIijT6dRJzp1C
	7WVnVwPbksWiahcQxhgP6J4R8nC5dc3In1NWaMAkYSidOP8nJ82rh0UhTMq694FgQ8+SlhI5uBr
	d4YISRfsY51bsnxV9kqAX+llDcTZsQi2ivzwmyR+gDccJ0PfZRQG9wfJ0H
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023780b3a.44.1776260020549;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023750b3a.44.1776260020056;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:18 +0530
Subject: [PATCH 3/5] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-3-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=821;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
 b=MbkKPCyBgmhldJHygpwYuks7foIDBOHg1RVVxuqEr8gDG7kUTI/LJsPukFs0Mu8/nD3ap2blg
 O0rJ6nvQJZ/D1R5etryASFhnBuwgb2K+ZJoTjKLQeGDyME7vAoKE7Yc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: -EE6JezjHwHfKoB3-RzrxB_Rod8CqU6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX5mlM9yhkzQz3
 +5B7/lsyeBGGmo75CUav/GeT2RdZywN81V8/oC5kkAZCUW5ki1eK1XkenY6UMW9wXrElHmKxew+
 1yyJxI3xjPZQPktY8PoQcqfp09PKcy/9W4w4Je6/6vHo7qbXvb74Xh3qFRGWx5kXwzc59eTuBHE
 Ue3EpdqFSZuVVhXCcdVn3Tl1VJVKk6U8AknybRCYZrV1hkKRKTzoQYsI6J9ZqxR4kL7RZDLoV5t
 7En8+wjD4XIx9FwricVCPvA9zJmCcAwFTdRkJprdq/82n6W3MxtN51/kot8Fa2z8JgebCUQvg4w
 rcnrLEBL/hs5QSHsaCfT0S4rib08KUco3FQAztqGIRvbD2+B1vgNAjaBpTHMwky3QyIQn6FMFKu
 eoeKXpRsHGE3EHvkE1QsFKCcYw2VAeA/BphHRexh9dTJVNhb+6J4pseQAy5N60oIFR7WGgsExK0
 8alRrwwsCcW+oG7hDcQ==
X-Proofpoint-ORIG-GUID: -EE6JezjHwHfKoB3-RzrxB_Rod8CqU6F
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Document the new IPQ9650 SoC/board device tree bindings.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

