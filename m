Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C45318EDC
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834139; cv=none; b=nX5jN/tpJS0jZqBlSXkStD0Ruvx0RHPci4GRGzjvSe6ekWRBE8P3G7TL/mla9lzTM0OGrdsJc8ron8btOjZtdZ1NFnzqOjOUk+rSgwOOmlqMpqW4eHu+qJ9Giij3KhDQ6QTKGvuZPT+liUxnvykySNqCDHvFyFa5fQvj03HimQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834139; c=relaxed/simple;
	bh=jWM31g6lNle0yzrLIbqPRb8Vd8t6ZavnbM741oDRnJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CjNvLLVCQIxqd9PD7UU3QVuIw8QPSPT6zsT3M4NLXxr25NKXUh4k8Sy1rN+NWRVWVxzejgAQFT9KS6ycarjTbokhNDzytOB7oaNdTR/5vRlEykuyD5JsWVkOPf07MbQ5Zmp21Rfd/OpFeekcu0UG4zt6AbUFffZufzKaxuKNmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o28xQ5zJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvZD6i4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o28xQ5zJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvZD6i4E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBC2aX837971
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 18:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hyMgmDuoLee0i09BUrbQao
	vhMTJNH4r9obEscx0eIEQ=; b=o28xQ5zJaYfmckUpWTvnyVd+RqgziTqe+CcA/H
	qy+Y04ig5wNSs38Bgw3PcSbQAj0IQxxRkg/YtUOkTG/ELkdz/SJ/nEo9ya6/evDG
	HcyVlaOlRiVZ8WN1WErDMoQcJMU/HMmx0O6AiEAuceoTU0YZv5fWe4wzPKrOWWLr
	WkXhjvtPyBfm1fFXEErHue4Rd8Y9qupT7y20J5DNvLTM5qOMLP2oVG9NHarj9JzY
	eSY42/+za5rZ0Kz9CdVRVWZy/KxJ7b9uL6kByIThfQ/WZdIsBUgETm7TPAZiz1y1
	d7wD5UJNElLHGHrCmRgx7imqOt+zaHk6qA1cx4ZQnw1X6l1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8j1tat6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 18:22:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7d7b87977so26845175ad.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770834137; x=1771438937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyMgmDuoLee0i09BUrbQaovhMTJNH4r9obEscx0eIEQ=;
        b=QvZD6i4EBD+cdVue3t597b3arYYHzxA2KwXGy20T9Yc/HPGorekddGUD7tbA/J8jET
         ljUHMMxZ5GEGg6tCCxNBj8elbgsK+j9Gf9qr0CbvhvRq20wzhoS9G0cYkJzILq2vq6Ms
         rnpOcyMUS9FHUQ1mtB5OErtLfKMHnoda/KSEv+iVl3g3IblzLwDfd03Vhfe7v+Lc0GIY
         I8IyuE2N0JdgeL3IwxX56JjgVy1C/QC9ShJEdgkNMw3+qh8oUKb9E7aUkWX/0jCX2Xvh
         x/0BaLwNj+TVgpYagK9mdJeqKP2VFR2mxvpu/XbOoyJYfzVuPdA2h9MKFFrV/csAq53y
         xxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834137; x=1771438937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyMgmDuoLee0i09BUrbQaovhMTJNH4r9obEscx0eIEQ=;
        b=unrPV+ZdwBpYmyBzhtEEcYy8zEc+hyk0txPmIi6b/dVllKT6sTsbAejNU7TUjzBeMR
         OIbcRtXpXG/vIWgfh2aSYiVPiq7STwvvJuRUHpN1/LeUJDkc4DwOLg3HA0X1poEqUSs/
         BnYPRlsBp4golmR5F0zu6OxOBHWp5WmPRkdkfQjTOqG+VvgvOqAylUAr4+gOdxaXglKJ
         pNJDuHK8gViuGpyQ98/lhp/0hkgIEUqsRP7EkeoUb05Ewep9Flmz0kgh6yvClhrIAve/
         0dHdxwsUFr+BItxJqTtf50RFeOik7euMCkpxVD9IbucDCaCxupPGVDsdaAF+pZmYnUXf
         ksYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEUw40wKRwpf/34pVgqtfdzShFIBFuko1WHzutyDehN4kFtVAr79brr7sfb/9HaehsWft0EW5kuC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0VnU9yW/Z9YllnMfZH4t+aRSgfiiS0emhAUzxz4XGbIsoj0r
	wc2SJrXp5nRJZgytu2sYyjlABNoaTrOW3Oli48VxlrNZUFO634TRJ8Cdf5oJYksqUS2Ln8KxwjQ
	Ylp040fX5ZffdVX+HC54EZabq+pTcy5UNHq4maS7ZbzHcA1p2ReF5arNbuMoz3hs=
X-Gm-Gg: AZuq6aJzoqtctSBp7uHtzynhfElXAfBpvVX6V6XKhokl8smDaJ4B/8Vzu2xhb0jwGCy
	vaMV3SoLOx3jWyfTVj3GR+y34PaEqvSNx0t27zUW7ldzHR7Vfl8/JHn7Zi2cTB0EXu18a2xLTTs
	bfxNvJPXzQv/4msaI2dqKVEM3BlqtK0bINVyCevcZPqOgZheFPi0bGBuY/uEQ4FeawTuKUgLJHt
	23/R8g+YQdZNw9QXw3USpXiUoxJIqGJ56aI5he7/m+zVNi6s7j0vL+mQqrrEjkHk9e+T3eV1UcD
	UeMxfkJjB0AHvrM+s60PModIyMcpsiks/VCKacXgLHhyLA2Usuv508FKtLObBXoN32ORF7J5dmn
	6+wUoqVOqvqjaEOWcTb6HWUzhp/nBMN1fgQ3yMayk8xaKbg==
X-Received: by 2002:a17:903:17cc:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2ab3986ea83mr179285ad.12.1770834137336;
        Wed, 11 Feb 2026 10:22:17 -0800 (PST)
X-Received: by 2002:a17:903:17cc:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2ab3986ea83mr178955ad.12.1770834136863;
        Wed, 11 Feb 2026 10:22:16 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996665bsm41114895ad.54.2026.02.11.10.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:22:16 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 23:52:06 +0530
Subject: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM3IjGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ND3YzE3PzE+NK04vjknGwLXctEc0tzg7Q0S4PkJCWgpoKi1LTMCrC
 B0bG1tQChWmntYAAAAA==
X-Change-ID: 20260211-hamoa_ufs_clk8-9a7970ff90cb
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE0MiBTYWx0ZWRfX84EeTUPaSxb4
 HRdh8eX/3OgcFRlvyLCsybLm8rnBTPMtuWn1JoF0RQkijavtn1AXdwV4tBZdzTHeL2Uk2DpP2nr
 0jUJkg9Rh4VWYzl9YLf2yQXzvqQTVxKs8fElDc+aZaoY8Wqekm9UOx/q6o0YPt45rdL1UzrH82Z
 YLbCo4zaIXkwjktXUx81GuI/PudlZtQX9QZ+ddmPokqkENnRJ1S3bn2h8isVB174SPclIbWpTnU
 d3a8tQfEMllI/ysbQViTULclt+IZR0IFmibPyV+3VMCah6SmRzBseR2UEcX1Y/Db7i18Jc0EXeO
 nW9YVCoITJVUz9HYJd3czHUv7neHs0+0ngnUSH1Wg3bFiBBMf3cUbiX1lOK5hUi2TE70txArTFf
 Ot2+dM6TUxgfUCaPRpJ2vNhdRZYbFNRtxC6c0hlfX+1W7Xp8O5FlWhAS4XRdLGS/KsbmV0JGmgT
 ZRgkzF+S8OXm1Lnl03g==
X-Proofpoint-ORIG-GUID: FxAZWJAKFMk0lVe_jqIHRYq0oAPnHHKR
X-Authority-Analysis: v=2.4 cv=cabfb3DM c=1 sm=1 tr=0 ts=698cc8da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=A9ZGKesYFCFhwj1snpEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FxAZWJAKFMk0lVe_jqIHRYq0oAPnHHKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110142

The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
Update the divider value to generate the correct output frequency.

Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..6e88f0a8d9b4c014928b095882b7150cabda6895 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -378,6 +378,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1, "clka4", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1, "clka8", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2, "clka3", 2);
 DEFINE_CLK_RPMH_VRM(clk4, _a2, "clka4", 2);
@@ -840,8 +841,8 @@ static struct clk_hw *x1e80100_rpmh_clocks[] = {
 	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_ao.hw,
 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2.hw,

---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260211-hamoa_ufs_clk8-9a7970ff90cb

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

