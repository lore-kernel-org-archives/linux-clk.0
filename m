Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5093D3F4108
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875416; cv=none; b=qD9Xp7MZ9HQtA58cbmerlThpwXcTkPPXiodUFpWHJqm8gwmQNk+277Ozd2/UNE/VvqoRw1kKJkjIZSNZSM11wpFzz64GnBH/rYaUlcxcT/0xAZIif5fIEGTzRRuKaWfAsqLENvH4dvdUvF1Hc+iGuFQkP72cB+f0EpOoh2em8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875416; c=relaxed/simple;
	bh=uKLWTrcDR7c+0GER3Ovnt8iy0jidYHa0ZNUnMq1N7iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKjcTik2EaTjDu+wiXmdePn4huoLF8FXFAdTnNthy85+u92ixSyoIA1Nzdz2L4EkyWWMNhILRAwlVkOfIIQBiE36f6BiqdzvzWZnlWNTBAd4f9d6BMxGzlrmIrRdWMbmzQ0UrRkG9wXPH+t6uqwKQFZZTF5bV5YZlB6dOvSRd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwIUozhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDW8Ckxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwIUozhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDW8Ckxi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CSn4949398
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=; b=nwIUozhnlodgFMfQ
	fTrYp4goMiGU85bztPsWLGH/E8v2BkfnbUCRm3z7mTmbHApk96JFSSlODnC3HT0K
	v6T+VezMNnkAS48ETfQcnlQ8sq4eTJJ9xUsGKXBiE08KnXrwE2Yildj+YyISnzo1
	2ETyBIGO1GJLm2OEE5W6+R7bTPvqJQJHreswJob0ZiaInHtYOSJ7h68GNWDhgjZ2
	SYZY0znCcoFKqc/YALmwJpXtRxLxJsKwDdX5ziInM6D0HZ2DHhaDEg47a+Zx6hb7
	KCyJUw5L9Du13+rgbVSiHpa14tJ5P0bMw/SOBtj390Ph3zHcdgoH26USG91DuE6V
	GBrmlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62877y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2072416eec.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875413; x=1792480213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=TDW8Ckxi7B1ufv3nu/q7bjbX0y+CLiE+8D5ujcHyWS39SfkzKOg0L0qiQtKcpPzOOK
         z+jxIcnWyfgQi7AkOXPx/JzcsGQ71/yeIwJhHv7MTdElx17bsDTvgQFLnYOvJo8CjYtR
         u4dDZxpfDS4ZCew/RvGcAEQvGV/i4/XbH4Ew9qQUhkL5rj/J4lX5w/qnTghZXA6siGoV
         P8H/T9tKctlJmQXehPiAnBh92vIKs4kgU2Y683ikTVLWAkuzeqRSnmwAlaP/wqEregtJ
         n5RX69yVp99lHIK2vU6OhYT0U/fVwum4N/V7TM4hpeeHf+8ANLF9VzEWNMewA9tbtuoS
         KDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875413; x=1792480213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=G6R9ik+wpitbfYQpc+bbUq8ttA4uc27Asg5MvFTgZ1CfEbQuTiosBVrLoz3mBs8j7L
         l1I9Ad1vJ5x5MBtj/++q3+Ce3/EXmNrIiEBMYRU4naJmS2aJcLh/H6Ok+rrivbiNs/LA
         wEx7uOnSklsMNHEc6fJI5m7DaxNVLfmi18fzD9YxW70vrgat6OjtKx7tPtegQq08v9Pb
         8zFVBOqz110z3Y/Mo0Z94DiGYVMCx9PUF61XZ8pw5rRgoWZJ4J+8u68aUicfN6WgEX2a
         MoVU0Rvj+ZT7DkMNXjsx0s0Gks5LWU4N2Vzg0RFprz+aq4IiBS0307QyoGMNFzTSHsTH
         qn8w==
X-Forwarded-Encrypted: i=1; AKwUvBwXe8IYgU12V268kJLr/9ENqZ33eYEK5wcgIDOZj1eXNiwbPQCu+38rQvWPxMppgF8pGkkH+od3t1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSCYx9F3H/NhIomWWW+v6n0swfNGWFhvS05ZCSt4Udj5Jy1lH3
	aujQzYlN6f66sBbdC+lFYbN6cZfeC4Xalxx7l9abPZve4MR9IJ4pious0S58VFNz8mbpQYTG8iR
	BDNq33Jmn4rjjTqu3f9y5lPj2XwQrRbYnjYWhZUQPSnl9zxHmAYRLqGHdVq/luIk=
X-Gm-Gg: AYBFou3wlIHwxsqgyRD+RQKwPQes2irzuRWJ1hi21tQrYoTPwLi1SEQO0pPStGuIbjw
	V3JY4KYFC3gqO1HzWPvxiLO2oLJrAY6oqJp+eNAqsqyOQloq1i4ub6v/fglcY/1aot+mWqVNCfp
	r5zTEuwIjh6nypRYyxuxbg/V7WRLArRY32tQ6oWJxS/TXO7+hA1Mom/+3xEmHJeecUtag29eYrE
	bNxZF+28s0NzG2uYnuTgFAWEwIuTslGnsOLrQnGogoKTr9GqA/dz15WKs5en5y4y2JScLLB6WAQ
	eQBmmgykliF2T7bZO4JKbnXPQvHxkitcY1Cv2kORm2tBfZCg3Upd9Fg6NR4i0y1pForbcp843oN
	lf2QQXHOoCniQ4583m1QmYkZEO8GQraBSzb+vv1d2D+sdjH+RXfdu+FUOTCkPKgf6tK2NONzv4f
	RpXPMUAc24F+TjDny7UK7fIC05SjZe2g==
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364097eec.5.1791875412979;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364064eec.5.1791875412510;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:45 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdd956 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JR9XVsisKQFD673mhBYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX5MlosFraG2dZ
 5k378mu+uG3JmPsIUQ7Inz4fDKyItQKoaX5+kjm0R6d7q3VlE61aTDiIHkbFo5FwsJjbOpqEyBH
 v/f6Q3A3yzLP/xcO51kYfOIpN5LRzOI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX/ybDyQlys7xu
 Nsc15HTeHKkAMBgwwQPRVKKPQtH1GuFnSHTCvbUnfIJabupn3inSQFrIZyvuUWURKHkFE2aDW2Y
 7xOreI8wfJm5g8pKn81H7hoLC5pA2PA7IhGkuPBbehywFhauso1DzGrpZiL5cTMEo8wBPjd5KyV
 Ofnp4keVp7yeo746/zgCkQgual2EWhLIIrmICeKjreaJRM7SFt1nwYt1H5k4oeDnldNQ3GgcjpT
 +QRnP2MN87i0D1QHinCOE6nIL65joVh1pLOOVt/k6+lC/CGir0DOTVE8L09FPWFGKVrqSyIo6vd
 QDi3uZn8eN9DtmA+J5AqhYgK7Ed3KomSVrZ2ALjImXgp2lli+qbAhuRgGINMxsHSd5Y7lqDs2G2
 v1O+1anpekJEzgt4nQQ5acANaP5uCx3S+ypq/xCiwmbjlFLTMMgLRSx+CvXJ3zxAUiM0jzJuJ2T
 6l1u5hKnKV68KTXOV8g==
X-Proofpoint-GUID: KjRpSyVDhnsJDSlFHHSB2C38mRLkwQzT
X-Proofpoint-ORIG-GUID: KjRpSyVDhnsJDSlFHHSB2C38mRLkwQzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..20e8b240642c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -152,6 +152,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.34.1

