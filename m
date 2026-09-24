Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA548AE00
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246501; cv=none; b=OdLXSvTcyb8UEDTiBDJMiqeRDQtzQAE2xp2asMWVJDssIXxasvcihaCxbYbDkym/IaoGhbkbgoSq1s3FtLa+r8tlq2gIdIoIX5myGDWPEKP/EGk2CJKiH2uHkMwpnLAjzQ+ysft7L5zbympiS2nf9hjhZGHZFyorwd+66k+c/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246501; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtxCLMitOo0woJ3RKQoj9RhHPIDzOsRZeSNQ6rAZMONVqcLqp0RsUYZZmUGAVKOhMVd8ym6OcJWbcu57pkS7S8hrofSQ1rC1MKfn2QhNP4mMszYCl6+cvX5izGZvUyYbwDd+g4Gl3Hbd1a/cF7hkXZvuJ/pBljHVJxzvO/byNiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et6B9Fh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj15Oztf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et6B9Fh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vj15Oztf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P90s1923773
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Et6B9Fh/ZgyWgkdl
	btIIeXweDR2nqhOJrByvH90i2JVQqa162MY1Q45Js10d3rrCTIrEIJYJ0kaGzFbn
	n+MyF/ldGjw2gikYItqvHolYqD5VcR3sjEre7KvsQIgjHEBGgIeQJz98tXZS9f3n
	37yuT42E65YhWNaPRpAChVFzX90YPZBdeu6jQpcUOFuz0KcFvg36es9LdioCb5d+
	u5MoCTX1omEu8izo2y9yirwtLw+aD44IZ+zWp1yngBvZNNwye9XU8ihJZ7+ZVZsK
	66SHBY8sqDDC1K3aT1BL1LIaYkRKtTqOC+Izi1KcM31yOxUg8zKDNP0WfPvT/vqa
	DYNGOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so340794685a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246497; x=1790851297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=Vj15OztfflFwlecQsQ0AbNnyhxZe8hJQP1JuA98e8Z7yULu8Wq/6sF4+l4RP47KLv8
         4fol1IdpqlzT0bdhOe5DcjHocdwpuyQKSy74bRlIWGVyxs9TFFg/8MPy7RXndIgS0Kiq
         YIklUzwbTQI5VHVo/p8NkpSwD5qtPBhdetD5Sf/ObUAgH6nvhUyGVo9FFcHTPfZyRzPq
         jxOO1ZC4LvlqvPaiL8KpW2lbCKZZSj+xeUxQFsA5SDEhp6oHqbRx6Q9owYI0HQMH7wL6
         5RPJ15nrfMnamcSN6rBSSqmP2nAZ2Mxiz5Vrr0Jke+WW8BI07vesVyOAAj8zEmh8QESn
         Wu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246497; x=1790851297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=F96illxET3KA47hl9yPzhh+Hm+wiQIxehkC+V1WnXWofALQhnWMt3XPFq1FZ5Ml7bI
         l3fH0QYYq0QTananmb86Hik3AjBw3xcIzTOWCbkXlDTYdk0tyKf9QL+OXxg5dXuI5h6L
         dBEpneH1ICUxjIIj4U8vss4c8TEzCQsP+fbs3YV+YPyexTOsdY894snnSmgMpCYCp7r2
         IWMsliFnTYpBL8spwGPkF7pfmtKtVtraFwpxYL6vY43UpGjOhKPE4eITGJBv2E1KW5EU
         Ts5eOGEn0r6kW3hp/PexSyiT73v4Klfzr3CyXedP3NEWEp0Wxb0VyTxmieJQyqYlSOyH
         Td7g==
X-Forwarded-Encrypted: i=1; AKwUvBx+7GEFLkg5zE6ahUY0xza0Dt8o+sKGCJYf4bVnsFeuxUZa0DPWD8sk0x89QMg67ARAl+fCkbKjkLs=@vger.kernel.org
X-Gm-Message-State: AFuF++lV946LVcqFYrqFk3wwlV4AX3F7CvASoGrvezOBHJA9qmHkqCRJ
	0Qr4CHtwIRJta3+G66lhjtGT241CqYx/YrP4nhP51H1WwMji/a8mGTfN0eLeTLMvy9jOmHEazHW
	5l+pl6XhPQ1PeiE3Anr0shngLYLtENxhm+GbvoL1iZa/ScdgRE3N4QcpmKmHcfBbrbVb9HgE=
X-Gm-Gg: AYBFou3S8/9D9pJwMrSSYNVh+a+xAd9sIX3P19hYt0bzCFjpf79oN0GdIp/SEWBKS/X
	fEXmP4OAh0OSSRTJf5ZpWdtV0zFs6gsu6qNAVRx36XMOG7Dxfq00k/aZks6+fNNj8dQNWmTHGXP
	zKiVct0y2qmBcQhYbofqI0rUJsI1tMuPYxchLYN/+gzVNjSCS1d4mKJvtw34OHWXSblvSA1juY2
	sjZAsbZT7cvP8bXKteHbQRClwFe6XlDBmpZSeygJsdp2PHVoQx49REh7z+fw5u91XMz32TKECsq
	mAUqlfKq6nwaryn34P3SE3RVNU2s2uaainwcqfXqOK1WKq/r0zDRP6oBcAYDSpyg5Aa3rD+h33y
	9B9qLKEnk
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229120685a.10.1790246497385;
        Thu, 24 Sep 2026 03:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229116585a.10.1790246496699;
        Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:47 +0300
Subject: [PATCH v5 31/42] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-31-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP34ajY1tA0w98yS3hw0XA27huw6oCAxRCgr6
 rsOJnKD34uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+AAKCRAbX0TJAJUV
 VneKEACELGI47loMvflyG4FFK/wZKy5oxDtS9aF+vm2ffCwbL9oyfYKp7vnIYFcOUuwHyvdi34/
 2iZ9wDdWPtsnj68YN0/qhjx7tr6DcCSzkl40v8R3L6zqBg0SS53WZ+JTv0uFekXx0lA7D6UYdBY
 JdEuOZQFXTPCZifDVrFIZ7iJNY57nhdi7bVJ5rCMcEBz0M3SWr8gyD4om68++E5DcJE3pULIiin
 A6cBNT4V5xZ7lHSaRH8lQUTIZegUEP08dwkDt4eB5YnlCk9beE/lzGMpDBbdIaVVgRV64VM3+ot
 DmTBr1A/e6ezp3zgfVt8jZ3iIJibVNnpiuSOj2VMWHkyLsdDoIr5cwuo8GdPuFyqWwt7i73+ghj
 ajjjSquI+nhK8MQ198kfthWRAEm2fjDaC40l0J6wFpwrhvDJl/TfON7X1odUqZFsZ5YFGRLAKQ1
 H0I8/Ed3Rp3kJosw8gNE/xdu7dGRbCHaKkUjgszKNmIGvCF8ys+UdwkcFALmgWajhHUFpJ42F7p
 ft4xMOupM8jT1IaNpMqt97XnQdX9fD64MCZKYgHEtMgtFuIW95d83GLdSj+H7aLNkRvAYK83v42
 v+44wI/MAQpDxG/8LzEtWr9LOGYcJQCFznwt9UrPaRP5saWhfLMoYPhUOoPf0v2pdJlbF6HYtZT
 Ep8BaWr9+VzghbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxYM62YvA4Nd/
 qAFL7bZNK5/14TftMW0K7PHEaM9Z3KwQfCNKUwdZA4rltneg3aMRUdmUh7F7iV+67S0iqZIh3yg
 qIkFUuUb0HnOMhhUzmxRagnFUPL9kf8=
X-Proofpoint-ORIG-GUID: p-He5nz6ZjtoLNr6xJ74oVwbLy_31MHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXy77h/rk8FJUG
 qSnqZYhWimG2XnKm5hE/Bq/s/nUqQWvlX34D20GnCodqiZf5Tf1ovuZClrkaaaLhdzqj1Xd3Adt
 87Kas4494WP7mADX4RDEc9TGuWQZC9dgpJSmw18RjsielWRtqTw6Bo/UGuskSjxLs9yqkQvwftL
 Hi0ozLtiuK5LfO6fZsDU66voCNm0sQ5nJ1fqRY1n3gSkaZmzJej5XCfKBLZ+TNGJyjWXKiU+d4C
 XbYQlG7w32aFkcOcsgG5SLLIeIjia+4BQIJomlE4Th4R/s0kxex6KGYQlM6jvvSZMDMyl2UGWSv
 egSAZ50VQCEGMC3uVbYBzpNE5MgvXZ/b7GpV3Vth0K31q0K70HUGyY2TJWWRBXysjud8d9sZqcd
 KnhyoMsdy7Jun+Zevt/00iDycObDyI2JPVmi9G7YjZK9sC+Tk4y/WinIJe9VaLBs5HoDkfh2OzC
 CtClbW6u/x82topC+8A==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: p-He5nz6ZjtoLNr6xJ74oVwbLy_31MHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

