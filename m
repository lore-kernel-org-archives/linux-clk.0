Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC54F55CC
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417274; cv=none; b=S40fp75RbIKQ5h6OB3JskeP59Dr81IDtrGndQHNDChHvm3IkD/9TSF6AF6qkWYzqu3+gHfTtkBXrgptXlWH0PiNhZNEzDTgrGQ84ViU+Oi4kJGX/rLUZwlUkioGSpqTPDBli8uvPPNHbZ6a3BuX50kxe3zjFJbc76hRSjlgAuDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417274; c=relaxed/simple;
	bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6orJe5P5A2HsQmVZUujUsUCpzs03ZKyXqMufs0ModaPHZ/clkfD0VG7xZrAmPwREb7n8sPi66uKhwtV841bPV/MOyPsgJumjS9h67pWQttheYK1GGEnikOwB4mHbWFSnNSPyiI3JujdUcQES5Mpdnk8z2mvUPzs/Iv8XcMI/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz9ywKlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdSZEukm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz9ywKlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdSZEukm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ox4v1168075
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JIsIH+g+At8ckqxE6xPOTK
	qkjwbD/YQT1Oj9C9sZJVM=; b=oz9ywKlox3/Hy3jO+MSH+1cj3CijwlwykxXYd4
	GZvC2emjfUt5WBFb7WEAYtBl9wFSvGBIU8zjO0NhsWmtd6WK2o1RtWwl1Uoh82Xo
	b4zoV2va99Z6+d5vER3FLuQgnV3Tp40gDhEJ3B0KP5+cWoeHmAfdOrgn532vUdPT
	LZU6uzljKM0XD6vSNHffqfOSD0jGcq3iwH4tllUdqfVe8eGNboCjhs0pXzz0zR40
	/98TvsPQ3E1TGM1ZgcoOiEHS81ovLqafbr4Qx8gC1N2juRHrqur7ZmOqsNvQxyaI
	3T4IXyd5MUKDK425E5EC7rD/KrzH5QINhMMnla9xH9Om7sdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9ayq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so439868185a.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417271; x=1793022071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=XdSZEukmrPJT0agyfdXt5+nlZKqGDjSsnM51GsP4lPfUpb23XMSc3D+U5aQqvhGW6E
         N3K1aspIHC4KtpJwWYHnweFH4pGz2nqEJk/dbYspFlz3cp2dsgvu+lqemc+xQ22zVuXg
         q9oztJikReOgcyTKCcJb0EYJjuWtz/QAR76Nxmm4hnu9Albi8E08N4gF8z742lVnkyfr
         s2vhjp49Itmh5htX2nzXT9LrslPXUuvr25aDIbipHCzKgkEGvHRlHjrjjdM7m743rpz/
         DYXemCv6EC2skqRVZaWoux7kAZIAZDvHZlAqn5jdS5bB16u/XXS2OriETndWOc7NBdox
         HJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417271; x=1793022071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=IDLAx9mEuqZsfqgpUBKW4PpTrcboPju4mxoXan86IF1rtl5fJsowMaqMqd0SUArAsB
         oJ5JW65Z896LE4T9HgNZ5kTLP7WqTh+ZIY8/ZlQKByQscKCJ5lHV7Th59EwXpawshMfN
         nieNKwle5Vv1vnngIvtRvHXpCAsgWK7mSZARvadp+Gu+QNWTx1qyD0f2aHWNd4/IbBNJ
         nlhikp4NW2tDcOLLMEetFVFSsgXhWpqjMjOvC5NlKv1aAh1I5Eif1SXc88L7v8aenbWD
         0DGYQD1MQb6JPm0G8qCYnYQNWx5/MRF2N9KQgkntO4lfLze1Q9a3UPlZNAa1YeHfVIPb
         zwew==
X-Forwarded-Encrypted: i=1; AKwUvBzYyhyzwVv1JVa7SxQ1x84jMzjCnmfKYW4SAe6v2twTG3ZFgBcEEBzouekjiCbw9FwkJefuXfLCNQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI9FT158lqxRC+xiGayb9NHNEfhAWBIuctKeJKMb6jZSFE3hTB
	mlKIsTYGjhCqMeMoY92vpa4v/8MwBRdhIga5XppT/ylukBfF4jxHw9jSWL53U+OVY1wuXuG+X2a
	Bo2psyXDqlkMPc4lGPKRFOb731ep0PyZvGgODLUS9K+NvXf4W4hQ7FbThJjn6w6U=
X-Gm-Gg: AYBFou3+G0d2KhI0GT2h/Gw31TKDt2s38ND1zPVEtBWord+/GsfLN5LvVryxwz3orQi
	OfZj7ESY8ikvJz/Q2zjv1eKX6wK7R4VTSKRMvVbtaO0BTkB/U2bxt/Ok7g8+GURAlH3rAMKPkZG
	K82s1ZUwF+is1VI9S4YHrJs5XLQB9VRB3qWaa9QUqp4f69RQhwxRI5c9L3w2b4b3CJKZCe1MEZv
	lFBG4tvw1uOJsl7sTVfvgxhQbAqcu4Oz5AUqjGZXLiFJAJ5GVZ/mptBElY2JUsFaBjKU6ZLHqcW
	Rfll4dkAvACiffuanHiFNod13srMCUMkZgPi3Eitm2yj63mDHCX1CGVSg5yUKT5W3e9A8EaGlph
	9qcEywAEPPuxMUdAaRwHOrziPOiNevFRp4mwyZ2epNB120Pg7+F1ccllPRsGci+u6cZCW1VMRuW
	Y8CCzg25aeZJNU
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310687385a.74.1792417270511;
        Mon, 19 Oct 2026 06:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310682585a.74.1792417269933;
        Mon, 19 Oct 2026 06:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] clk: qcom: several fixes for stability on MSM8996/98
 platforms
Date: Mon, 19 Oct 2026 16:40:59 +0300
Message-Id: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsd1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3dziXAtLSwvdtMwK3eSc/OTsYl0zY1NTA1OLpOTEJAMloMaColS
 gLNjQ6FgIv7g0KSs1uQRkklJtLQAQUlMOdgAAAA==
X-Change-ID: 20261019-msm8998-fix-clocks-6355058bcab0
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3tJd/TqO3nKhLXa4q4xYfMfvjF8OD+hnJ2u
 ndYqcs12BCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd7QAKCRCLPIo+Aiko
 1YEUCACyZyC09kHN7FKDl6bZ1ufmSOc5N8Z8KKObSXnIP66Z0Sj3bUq6li6L9U+1l8KfM/WvLZ9
 zzrY5UMnwR1ftVZRJl5UBmMeXddc1pWNxhNibhNRfSHvwR7kzkvDcfITaNUYXWFM7UFhu0dQpNU
 iNcu/79sKraZVkrqvqHeaFb9/lUeoxlqy3H2767JSor+iYQ1FoJa6/4C1KxpLiZt7GM/wf8Tt0w
 zFmadcBj3MhXTQ56qTMmLMzl5TCTSzuEI7tjh/h/eIyuTaBjcxvcSWtiPQFG/tbJMpe+EDIcR1K
 k/MRzxGTYsHCKK5NA+PSEUZ9A4/hV+FLrrB5xx44T2FioLOp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX4PL8Kynga7L/
 jjK6YZS2++l7e29RDOHKuNwDoJoHmD45OXnVJC4x3EVgbtjLxM2wUj5sDqQhGnVp3EqO0g6726k
 Q0ylO0EMb712uFGO3SdNqrRbAnCv6ew=
X-Proofpoint-ORIG-GUID: EEAXQ11cXA90OAP-Kv5uGK60s21QFuH_
X-Proofpoint-GUID: EEAXQ11cXA90OAP-Kv5uGK60s21QFuH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXxuLmA6bArgC6
 oERlvOqP/0faS1k5nKDO1N4tbOQRd0SVl/2vS1mhQmRrKWKRGGv2NPyYlGqMEwpGwN4QriTXkNP
 1VBQXdiQSPLinGShkYxjhWjCnrGYEJpnWRj8wPIbsCrucOWcAmOaDzWrZh7nza9S5efkV6gq7IG
 gjetq8RLdRKsbYUpWIU4aH649LfAC80vaGqOy8jaKfSyyjCAY8OjIQNv2H6cAweQ/RfMiZNFswc
 IMXlbPr+AKy/BmKOzI02Z+7U41pQ01WBgS7vKCrayQzg64B2R+6K9hyvneNpwRDbW+vqXZmPGMr
 uad3L0UBUUXltmdceOBF6GGT8PWFi2iqqqBt0mQlxrVw8d+q0pIbBVy4wfZs/h3LZYBYH0bo67t
 nr4FWYCXwB+6sezbvyeJ4pMDEObj1JZPG+SETlwrEYb9nKdXc2OtCKL8kmUezfkoj3XTFdy/QYE
 BbKX+vGaqt4UC/xJApQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad61df7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGoP7NTG_pKSZ3bbB-YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

The MSM8996/MSM8998/SDM630/SDM660 platforms face several issues with
stability (e.g. setting running at the halved frequency after certain
frequency switches, resetting if run without clk_ignore_unused, failing
to scale GPU clock, etc.). In preparation for scaling core, cluster, CBF
and GPU voltages, fix these issues affecting platform stability.

Compared to other patches in the series the patches for MSM8996-Pro were
lightly tested, as a part of the larger series and only remotely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      clk: qcom: gcc-msm8998: leave the GPU BIMC source and SNOC DVM clocks on
      clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
      clk: qcom: gpucc-msm8998: set the droop detector bit in the right register
      clk: qcom: clk-rcg2: forward the gfx3d rate request to the parent
      clk: qcom: cpu-8996: move off the ACD leg while the PLL speeds up
      clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk always enabled
      clk: qcom: cbf-msm8996: program the MSM8996 Pro post-divider
      dt-bindings: clock: qcom,msm8996-apcc: add the MSM8996 Pro compatible
      clk: qcom: cpu-8996: program the MSM8996 Pro droop code register
      arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  4 ++
 drivers/clk/qcom/clk-cbf-8996.c                    | 10 ++--
 drivers/clk/qcom/clk-cpu-8996.c                    | 36 ++++++++---
 drivers/clk/qcom/clk-rcg2.c                        | 21 +++----
 drivers/clk/qcom/gcc-msm8998.c                     | 69 ++++------------------
 drivers/clk/qcom/gpucc-msm8998.c                   |  2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |  2 +-
 8 files changed, 65 insertions(+), 86 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-msm8998-fix-clocks-6355058bcab0

Best regards,
--  
With best wishes
Dmitry

