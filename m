Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07527357D17
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 05:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055055; cv=none; b=HwpWnamNXwfqByQYbIPVWY1CuRj/1RzSq9lhgAmlqTiyo4jNoyou0vB/Al/7OQsH/3zbDqDpR5iSzP8T5F5HJw4WlqfY8QSvwhdpL4NWzdnYCd2QKBjTMM3AxR8f1ZcovXNI7VPPjVV8diG8eQGeZpQ4GOeCqit9aZga/wyBeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055055; c=relaxed/simple;
	bh=s7fSnjoSnd/wINZ2W0kztndmGynq3HRQgtXJQD3txzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i/XBa882lMUSPyGcpAaQJuKcP8Gu4MwttggucBILvPlhrlIxT26eTX4/p0ZQB3meK9aaojVXqvcLItfzedTZ3437Qnqns/eDkGistB6aQ7MyAWKQdR43EAiarz3xex3eapUujZtSLY/k9FxaSz97KKnrTXlPTrSjA9qFW0JBfW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9bwdtFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfLBzD9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9bwdtFC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfLBzD9D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342fiA2777604
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 05:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5WyoGsIYKBPK0Ky6A1rZDa
	hRDD+ZrB4ddT2JMWFeFtU=; b=e9bwdtFCzfzxD+f3UogEqveVpuxa6QxcRfSNt6
	Rc0KxrUrGfeZU4gY7KzHjhr6ql2aOsf2TBW1jl1U5QZ/w0Oez1C74hR/aonCz3/B
	uXv6WVNBFaKPzAyk9DUfGqjhsukrnBpYNx92Ji5i5mFrByBMqSzyOhqXkAdu9G76
	CS32JlGXrM8oHcARA/8IZoMmDQf52J6XD18NFGh+DHyMyZRwJ4WL/2frhB27f+I1
	Fg9PMnhsVHZ4Nu7p6yD085kc/E3fJcRcDGlOD+BzwI8jsNT4lPXOWN/KB2HhfT3k
	Rd1C7HGAdyCbFtgSHc7wAkbncqEwhnmbcqvHg1Uit7e6SSpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 05:03:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so216384a91.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055036; x=1783659836; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=bfLBzD9DvS6AzWD/jIL6UK3I752jG59c5uplI/oz+q7a5bN2ffLQCzSgpIO2dqDp46
         yqnHZYXNWFNjxAWIxLblQB3n4t/O/XttuCtQDG/vL4B83Cs+pFeAHYR/ajrZqtoBZ2Ml
         hb6LRNuAAjaD8Nicpjox5EmKidKrQ8oB5jhCrvOdBSLkbEc220VP/F+kG6mIOwKsfgZz
         qhStnMpkXzaxPGEWTUtU/NlWarDX7JM1FPMWTm7LopBy0EdnngWjxmeATeC1Hc2sJ8EE
         lkXd04sdeaIuNy/QdWUYMfaut21CCzkmnRM+TL2upFvkum97w57xn9tGaqro/9JZIVac
         jtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055036; x=1783659836;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=I5TA07R95zrZ7aWyM9imlq+l7IJzwBlYrCymdwp7gadgho7NOPr1yAAem4W/rQlIHg
         YoUzfyVrLMlU+UFJIG9XaZAYFx7rePSivcNApOL/4VzkgSugyifP7ioInVF6PeXDi9uY
         +G5xXLRoA8ulMA9CKagFhiX6SkMr1Mw1X6kpmbBx1QYgxg4yhLYTdWuZAfX0UjncotsP
         6aj/4RTzmIdxf+7MiR/1AiellHdB2tqJDL9dieYAVGW3m6AxhSwcdFuIu/4LXZmhiYv0
         jcrR7LcylHztOCy0m9gwQj1Kz4Yzznzy+OJxnCQhPaMdxBFtkZrdEGdgkwVK9hqVL028
         NKRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpklvZducR70roqD/jq7zqyOJ6SElCc8TIcMeiiUjdqPGMjRLvuVh9aYNlUHaynz41mcPQ70wOVoUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsatUd/jt5YMyMKdvT/8GUMDBAdCB83k6c1gEAxR1ST88cStUJ
	HkZGG70QB0cq8OkTXE2amnUqZB+RPN2I59NSDGfzvc+CaGc42N+msrvSE8LjEglJXCMpVT5FWwG
	EyLPsn783WWiZREPxlOPQUPvxG77+TMIhO40ebidx+CU1/q8xcPj8OH2Gxzch7CA=
X-Gm-Gg: AfdE7cmh4bP2dMn7n7L+w74kSsV5UEvFcL/SllEvGO+hPwXqd6pQ9BJRfBtrnE6Nukb
	OUUh8jxOZTx795rIk61vatGs/GUf1kOox0IryGRPRz1rq0ZC7O/Z+jRPRl5d6QLPxz3WZmVdnpA
	hmBn8HnBtLpIxDFfq1ER+WdhkFDh/Cir1llPwAfwka2ubBbEcAKVVLS1QXMYq1wapm+OVor461G
	OJuor+HSVkikxUVThsqYEE6oyruia0dqAi7tCl6UW9LNSTft7I1il/V+UTXzENW/dgx7pSIJIu0
	zf3t8+8eRNQneuK5VAk0wg0eiqPgOSFo7I98AdWg9lECv1YMfFsJ/t/SjfVTCOzIZuevxUJ1v8J
	rlwdEDBCz3OqVI2dpW70eRRVyqiK+QQw7vx+1usNV9n5YwB+7aY+bJusbBhrLm/t9kUoMPxycfK
	sTAZ8tQK/ymnuqhnNlPQ8aezsIL/0Hy5yYYOZEf9g5
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598851a91.8.1783055035531;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598813a91.8.1783055035069;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add APSS clock driver support for IPQ5210
Date: Fri, 03 Jul 2026 10:33:46 +0530
Message-Id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJCR2oC/22OSQ6DMAxFr4KyblASZla9R9VFCKZEZYwBUSHu3
 jBIdNGNpW/7PXshCEYDktRZiIFJo24bG7ybQ1QpmxdQndtMBBMhC0VAZYdIVfWmkHuJ8hnkfhg
 Tu94ZKPS8qx7PIxvoR2scjibJJAJVbV3rIXUamAd6Wj2yAaXGoTWf/ZWJ78Q5T66rE6eMxioRB
 XAeK/DvLaLbj7LaxK4tu2sSFx8x/sMLy0dRmLPAl1msvD/8uq5fFsIOEBgBAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aqkEcFr06yCu6TYfpIsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8MwYMF7qFwwniuRTqhiqGjk-qisQD7qi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXwvNQFw+u2XIB
 9XbL5waPbfYreloqRds4+vMRoKcyiPlXbua9xUhIbSMyGmslhnNVYh13a8FFLEmbuIFrBv/oCbk
 iexyQp072IOFkfo/KBR1eTgkXjT+2gqZKGXNjeHslnlWDrC4YcWJ+rGIA6Hr+0Rn+WbPTP33sQ+
 QV+dn2vhWm0QsKQ7B251iqiw/QzfTSxMriHKUxNgR/RPw95QevwFwMcBvON6bdx+942osI7inFl
 hmQV283cm/OcEYOgb9eEY2RVzlNR/IE4MN2Y4COKLKKTA1rCt6SAjEW9sPIEOSmqqSv1YqRCkNJ
 rqJ+B1a07LrKOhUGW4c890ubRQFM2RUPgu9wgtgb5Y3CLbN/O0W1mcJgNYCtrwX2FLZGOt85tfJ
 v2LeYnq9syK643VzLLZtQL94oDjR9vkMitgfggSg5PDWOCRAZggkmI7VLbGgR4vkX5O8ANJz3G7
 CWlepyeoR/tHPAt/q8w==
X-Proofpoint-GUID: 8MwYMF7qFwwniuRTqhiqGjk-qisQD7qi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7T1XFF2wVO/n
 4Fd7GEoKbBzC3i1rHXWIlAjCKEJXvzrfNFeuvpsQPs4e+N+i1V8wt7W89DW8jZqV8tXiu8Dq6QT
 WJ/TvYEzCQI4wMcOElwbTh+aQJNr/jE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- Marked ipq5210_pll_data as const per sashiko review and to match with
  other SoC apss_pll_data structs
- Link to v2: https://lore.kernel.org/r/20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com

Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

