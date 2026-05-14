Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123883AB274
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731562; cv=none; b=LE543wy4EoAC8h1ErjSbW8Zw+kUW+FzikPpqZaKERPH9Qy6GYObsLn5+zzL63KD2fIvU868+hl0y9HqEZILlK/EUl9rOdrU1dQztIRKfmnSBgqR+z0GDngmAhqswj3s8Fx2p+M4aDxSO2DB5fAmEQHJ68hnAij7/w+pbFjbQ7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731562; c=relaxed/simple;
	bh=NSS+8G+ibskDCDvu6fcJc4pyQaMxJASHeRL7qLz9RVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLpEcZb1ftQpW2sEMIXaLusvjwrOZDBFiWgDJiTwAIj2AvB+M7EoEMeRxl2t/kwUQLNscAZTfyiopaRbv1e6EEYaQ44g9tD2wHfE0raL5r8j2Bpamhn+4S569bBFY0FSsjXndw2ti3MLCsoORcAUKbYmQdYOI7JXQckl3+PpoLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi+cv1Xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/NBO3AD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi+cv1Xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/NBO3AD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E37bts3430151
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 04:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=; b=pi+cv1XdGC6lZOeI
	7LIjxJHH/1qohjNkRqqYxZ17qMgwlhhobG7uyhwMObB30ka+mJWPUSRl/5QDVTbw
	vxdr7XWHFlnXppMtcjWpodYKdBUpOmZz177isQCP+xNeEpjvFwhd7vodLv5cNjEv
	si0Lm7FwoqW8hqwsavH67W0FzWve3VeebM0JXtZpNtNNSo4tgGbAu1P8BB3dSNmN
	ozPmieiihkxnJJvBABrCtDoUA75dCe5TOgczXIltk0dHIXJM7Ye1wZdwRN7Z7rUl
	5TswjZ0MLNOqvBN9gXJ/uQyBEbu0E1grCfYaRmxa4af+MaaypLDTWt1fIiHy3Qnw
	j7Spjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmckj9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 04:06:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso67651395ad.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731559; x=1779336359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=;
        b=j/NBO3ADNB9IGNoX8TxYmPDyRNUPqyVPu5emDqbulESpjO0WqHbHYMjjGIvJEBRf5b
         IKmn5swS94sOJCyYrOs/LDpRiWXBcIdmnnjGS0SGT7RcQ6JTXmrLYImHsnMlD2Mr/51F
         +OF7jM1I22rChhWPjI/jL4QoWt9kkRiyTyFxqPZPGv0GEEMKhIr4KVvDr0CuEbW0oBh+
         baQasL6Yc2R47sMnjitnvIPPwLDDDK7h1s8+WGUmD9/vYe5iFqe+gWGXLju99AeEiSU3
         JXkgVTl9WHdWahWBLIAjp7IUfEYIFnwyPFbmZa2jnhDMk7Ae1JhvoKNU3r920RZDIB8x
         l2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731559; x=1779336359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=;
        b=oKTDQF3H23suVbUBRufwN2eX73kX7MKmgLsYtJGSG0ubrh8pHX3m+BvLt9e+SpfvAk
         DfTI6MUYbMrX3tD+eAt2JK0RcFxvdOit8l5qt9GBfWQMHrEfBp0DfsxKqOUKtaNHgOfb
         vuDrnILc9kfitKUfHLXtGyrnWF/MX5sL4IiQqUL1OJe07mKI8dEUQ0Y1S9lePLgFAC2j
         Cy72dq5KG7POkdwsgoLbP9DvppoWUlbgyKuF3sLgmnnCSbVKG+pnaL477W9y4M4IKjgH
         yl4trbqBwXhHMT1r4GY/sfqx3IzTIdhtDtHAmrQ4zl6QKYzqg0qKT3mZNPZwhAJljN1v
         BglA==
X-Forwarded-Encrypted: i=1; AFNElJ+6tt4wAGbSkSy1JBQmV+zgDCMDbXGpiVuTRJiNBXS6aYrL1LBt5jTAegbwnxBJ8ujoFAHr0Arp258=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPrQRPAuo1V4KC4ruNPXLOs5zl3WkwkMCeLP9OMnYeDFMJr8o
	WnucCiePHQaDMyQljQ/AbQ5iT/a9AF2qcbCO+Ilh/tk8M7In7QPGeO/m5jnK8By2GVeO0yUPFyC
	TWUkZFCA76O9nGjPTHbvo+kjBGjfULfhlJrO76WqWgdDQaz468xCJLx/bxeX2wQQ=
X-Gm-Gg: Acq92OEVKTkEFFhUjub7lc6k/hCJGVPoYjfK1TNplTAWX5/kjM6VbyJ3KNfnsTw+ZDA
	GMMrl9FmtAcMXSIOJg0cz9aVT+J9EolOsfJ81UweBR7NHtWlc/PQ+GlxVehtydMP7sIWXgWUS4H
	ZAuVznozGR1dAl7tTENdnNPDkvI/3kuzPSFhnuGrrCIIm3G+BSzGzstgR3g9BBGwX2ssKorkkMw
	pJXuapINwocsbEFQBFByMUJ5OqANa0oiuUGTc2LdpMMAa6I1hAALQn2jNxYt7PLMjaaAgiXCJcE
	em9th0csnc2NsFelK47vQKc0eVkOneNeOEYVjdfw6jSuZ5a9tcfRTNkVcBqlSxMsql7+OW7EgLD
	zoavx7Ljsrfdm0cqFdYcLUCgD0z9VIs93NcR04NUYfBS7ySGqglgYZV1BxusyMHer+Ws0FmscAS
	WUu66YEOljgD4RRaueD8sM6IXac3q8A25tbn63li0E9Oi+EB5a0Ms=
X-Received: by 2002:a17:903:2cf:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2bd276e986cmr71930685ad.37.1778731559036;
        Wed, 13 May 2026 21:05:59 -0700 (PDT)
X-Received: by 2002:a17:903:2cf:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2bd276e986cmr71930385ad.37.1778731558567;
        Wed, 13 May 2026 21:05:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:58 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:37 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-3-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: DBFEDT7yzOEB9oAOfyiFqugvKuupV2iv
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a054a28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UX2V2v9iUqdWKtIqh5MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfX9otpzDQ5vMZn
 /DyAJSk36ScR2e5RYF33ibd/hh96QQFZTv42ZC51CzbU+t1431dgMx/tkxZuQ5UCY2qy+TQBhGN
 JC9qDC3anmWqxJCEUU/M6avkBxWjdlkWvEdzdIhcCt7RMuQPUO4TgakQGHANYMx0gjIME0eQTsz
 aBOWhghww3AqZCneRAIXSX4Uh7LeZkjLSpPAOFWChWDovEsGOR7TIYKDVXhO5nvSrUnpSCJbVtJ
 eSFOOOhCog5OA64X8ittaJA8X+IeSzVX2vfV80fcOldc9snIstcAHd2mzMnQD05nRQvdxVW6Svp
 PvQM1L3wzfPW/dDoqjzgKbA8c6ueZZQSVyxJiVtT71QF9NtH4rCe/4Ip5tc0ZRRfVCxZqHt7pOf
 fkNBnq3t9AM8Fbr527SczoshW9SmCtn+skxr32xPOSl9fWqCi4E8APAW+NFZLIa7BfDDzCCVnlz
 3APnaFogh2Oal7P+oew==
X-Proofpoint-ORIG-GUID: DBFEDT7yzOEB9oAOfyiFqugvKuupV2iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140037

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..480196ccfcc5 100644
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

