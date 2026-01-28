Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265723033ED
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615000; cv=none; b=QKPSdLv8c/6AbSvbt0c7Jkw8FVvah/iGrJV9XoTNOw/gKsXLyvs43QIpqI9oedVAm1owhX3FPT6hhnSkOKDNwLhEvnJjvH08hyXq4461+ptNlvoYTZrgn/FqxZdZY/R2XRiRlfEh3zmtn1tAeUNN6arQNC/xMPLwiTkLG8G6opw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615000; c=relaxed/simple;
	bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjmzUlgSGZZI6aCNfxVeCCEZsgtyrw9u5jP6AMQuBH1Ck2Pd3/GkmGOc3mRu7kTTbFqw2IUV4HEfuhM39q0cTdnvXjlwhnoJASkdMHaxdbfSD9LYoSpBzxTQJGcKiOoUcHoSD92Fievn8bHlqAtWBDOp38tPFgbOKCaU/Cl1ZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI5MwmJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEC3ju4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI5MwmJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEC3ju4H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92WP2254579
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 15:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvS
	cNCLq/go=; b=pI5MwmJIgCsNpLQMgIKMm77mkOWsaYQ8K1qX8GIeyLq7rkfQ8lp
	WC2zilQEJ8qk07yht+8SPVwfGZSt54mO0wC9cc7nPbR+Jy9FJtgrCTA06CdiYyLU
	lozTWufwmQBAatB9iXrXZBMkIdJI2xQ4RZPakz9i2izUURmKOmP3X2yawMkALrVd
	YGCec5XpK9Wk5QuK9o+t3Tk/Cft092gofZptDFguVgkabJnPxysFaNocv9r1mJYl
	Xyg2NP23edokFNyxLAYu4FPi2UHimGlLf0yv1BlnwM4tEutYWpE2q62tme1Wfpnd
	lObeRG77Sdi5XW2FzKzUnxXtHEAUxTuascA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y40ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 15:43:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso3476485a.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 07:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769614995; x=1770219795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=fEC3ju4HO3KJbzVhydapg4DtjQPHiQ7YMduXWXyE58LhsHQhEZ6HHQyOYC1nJeEDOq
         sW57UVXQg2konbv7TLYGb6fEUl1yWLtGhoAMIcUmUDlI5aY9RT0EZk/GObdbeSGc62Az
         h2nPAQq3h6Xpmsx6ZIA78Uh5IO4cDnV7+2Aa3X1UHxDy6ajIKYPZDgGCniAlKP+VZi7T
         o3FFRpLjknEu5nm3AwzmYF+2Z8QDCd/OtwaRwrn/QVPAJThKClpH9+LcfsvobKZaKfen
         xoRqN+NLvqYRfSaToaVlq0XakIfe4+vx9V7sxDU6P1ZShkSajipnBbdw1JXmk8/u9uRY
         SqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614995; x=1770219795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=kWCesDIAT+9p6sDKerF/oo61TBjh9g4mKpC7XUJr234YtouQfeX3cZjjLZoBb/GT6W
         i5V+Tumumu9gj9OyGDo36Vxtk10JO4NKM02V7z0Cr6bQGcN4BzJugh4cFVDKI981LmBF
         x3xR1iue974DovFzyk167Vu/2qxYHsIp8hJH39+8BMd+S/z4FCyVBMEtHUnkEoYSk1c0
         3+jMfW5BIggmCONqXoolQ7yCJuM7DzOE0ZH3Sug8S1Q0IS8Me+jJxGS0uuI/eL/mmlOr
         3Pc6t9UEsbFfyt/4IvDK+M034ZipJCP4yF0OCE07MQ9oeYbME3Lz8EKqnnxDzuv+GuO+
         yntQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNid7tnWCyi73IsJqNhMWm867xHu7g0W/X1VFskRlhcPjJDm47LEcxDWsj4xROijn7vPLWgj6f1Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwovhAojKz/ROOloWYEPy2on2UYb9G9XeXqPLbMgL5+ofegxcfl
	He6ZQ8QuxHJi2zjc5BQSOEZCudjtab+e/vMdVdmb+3DH8YADmfo+zr6uIrWBZnLzO/IGdzZZjzj
	7ofFDZ01qs/MTfoH7srV7QzUZpj0xwrgrxCr2uxTFDcrFkVIJaepm/8j+dGJxEDA=
X-Gm-Gg: AZuq6aINpfXKuTutUghKXMlHChljbB8eJqJ9wYFDJoWYsR82DqjzW3WSEt3IjksTdwY
	5wGiV0/KBkeksTB/I8FdoXhO7sQCfTfPHwL0l1diE8D+OB/htpt6LyItcOGnFf4tIXiy//pnAhE
	7gUmHVVFw8HI5MPb3I8AMhH5L228FKUZe2z1va2HqxvfO99OY2ZVBgGrOtq6hcq8t88/5N2okfL
	mEJmLpBhy9W/MexVrVzhk+yRUt4j+W09frDAZ+vvMwaCHAhz1ZmjMyBC9Qd5etXXMYjTHtLLAHL
	5ZSRqsNclIy+2GiVW8KgMNSr3CRzXxHYSO/R/Ti3nesmExSiJSR1UZJ4Az8B9aqVFvMsqVb6pfD
	eTx4Q5jvDkNPBgFQiUwWsHG+Qbw==
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676222385a.70.1769614993359;
        Wed, 28 Jan 2026 07:43:13 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676206585a.70.1769614991262;
        Wed, 28 Jan 2026 07:43:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm8003551f8f.41.2026.01.28.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:43:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc
Date: Wed, 28 Jan 2026 16:43:07 +0100
Message-ID: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpei6K6nwUOJpgDl7kWWIEgfjSRExvZiycp4pGw
 WfIx5JujLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXouigAKCRDBN2bmhouD
 11PBD/0ZygzFDBZ9XPkkHolSm/vx7daUl7dBNJxgRosngJmB203l5VWqsZXQ/g4yv8v8/rB/H7I
 VzabTmmP4kzKBzfVQ0WL1ww92RpfDkZ29rJea7Zq6MC7UiMnO+b8O0mkszoghxJdjwCo/uvLUWW
 aRW1oP8QlTD9XP2xUfeNqLjOt95WzAq6zjCqwYrJz/GltGbgdTr7K1rtjfnafvsE1w86wiL60Xf
 MCN4atase69g18LHCtU1Br4YP5BxluqTT8XlUhd2L9Xvbq5Cg4GMno/uBXfuSdIDWUATz4Ay1Xl
 gnPF6WAC0UdsktUYcxUEH/XrXekTzCOWOvTl0cy0VaGXQc3tkmM145rLWPptxIW3vKpbRu+v2TC
 NFsCbL2RW9IAeCfVF0kQcFBldmWdoNNDS1/Xr59vg09eRR/LqhFkpIez1Q8OBLV7VqtJgJE201F
 z8KXLnIuWLhu65H8X39TBy88FsfNjUxu0pHucFIOq8sy8sLVokM1xSd7ibHNvUevoF2vb7lSBUy
 sl5q8WWctr/ZkbRaxh/UukLybUgKnNbn+0nYc2ErpR0cKQWrNMJZ4IjpmOoRH6wipwqIn4MSb1M
 wiYvnA7e2dQ2yLa1nuMuKQEAVPytnLnrNaZGisqLxoiKMF2u6vVPr5En5bihzfrwyQOQbu34kmN kSoH2O7xd0PyLwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WzC5NrF-27HM1ZclMstbP7avkIR5lHqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMCBTYWx0ZWRfX/ZbVgct41IwL
 G+OeDuWnc0639x1tM1VR8bplMGo/+2s25/PF/vR17XKgzi/0g9JBPu7EhpzQ/koFM/Rn4d86S6t
 pgRtGjoqKdqtmHdXEviMPJfctpAX4b0vXmITekozdyDhbYbIHNsc4XVwr30rlJqVmPKVReBqeYi
 049S2eNcRrFSpTuqZcx/9aflG0sUjEgqjI33f9R5L436Yd6Gy38sn+LRX/FlDjB+HCP6SqdDaxa
 n5mSFWZlVaF9nwxO96gRnC183obe4ZTxDT0I6PZ0UStVn6CXly1VwOY2kub8bwCjI9TWWcnBmQG
 k3i+fYJxgasL/14ivIlb67RQg9OAfTYb9yICwC2wgqDlAEZRpUHXRyrbM5ZYwHdi0s1L8WYrFR7
 qK+SLfItwQfDT72hVJ0y8bU/dVhpItTaiZL6TKhxZ5ZftZKKNWEhOnmQAV8sJUtRQiYhJGe0Lad
 0YaoBqBCFba/0Rr1yqA==
X-Proofpoint-GUID: WzC5NrF-27HM1ZclMstbP7avkIR5lHqi
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a2e93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=euIjOI2ikgTaeCi9kv0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280130

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
 drivers/clk/qcom/camcc-sm8750.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 952581f86db5..d889a8f6561d 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -421,7 +421,7 @@ static struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
 	.config = &cam_bist_mclk_cc_sm8750_regmap_config,
 	.clks = cam_bist_mclk_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index c09fa75be457..a797b783d4a9 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2673,7 +2673,7 @@ static struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.config = &cam_cc_sm8750_regmap_config,
 	.clks = cam_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8750_clocks),
-- 
2.51.0

