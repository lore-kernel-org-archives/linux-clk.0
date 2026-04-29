Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D221841323A
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482550; cv=none; b=CCTeBTNV4VYLNQu3b52rmqad4QfofFqF/wSsVZwN317cbYbjKZG/2ir7Q7o6QeVj/b0uhYTqk2+1ORNDgwdKWJqyiX26/4JttAYS5efuh8kbUTsUIV15ZK20jE36JUxLvL+48lnEYW8YdjtxFUx0ZM8/tF/Ci9XL8NB1ZeVJPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482550; c=relaxed/simple;
	bh=3ukGjQkgcOyujuxOwfozhWdE/4CyKPr9Iuvtl55GFSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EeJmhSkJmmVz6pUuehpsS8MjTE7zN2O/DM6L/MmLcBjof1qy+zDLtGkMYt8lDOY+CAyP1VLrfeSTUprkIGvAU0EiKgr7LNAfvhfP4d5JYsBIf3loBJnE9npQR/BdtYx7lvyTGXap7d53NYxXStluwJKZ1ho9bRHgDF8HAORo1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEY9tahK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kk63e0g7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEY9tahK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kk63e0g7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFarcP901600
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DG
	WTFXWnf0=; b=NEY9tahKmvNgsybfATUZaOkNEhC7fOWNN1qSBmagwuLfbtIBL8Z
	f6sG9upgftfp6fHjQcx8Ng/PfqjmhGGRFlflgNoJpRysLP9kwW9CQgvnZuIz+blG
	fldmmc9lCdnQXCHe24E4mbrQ/4kJiM6Y07wf7xzA3Sa56fhI4EZsSKGkyth6umIT
	HjFPPb5t+x7DKmXkvjN14vpi69U/oy28p9QDVAGOTtXAJJYRvTa1OlJvBk4j1mHE
	cGjVLqcU5sRZUEjQOTPQ8Et+wBFKT3ZU0Qx+/e1sAD6CO2SKtiMZJFSSYTuPNdxO
	8b5doezvob5U4VpeV+15saSETDNd+Q5npVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9jt2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:09:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605664a1046so10991137.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482547; x=1778087347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DGWTFXWnf0=;
        b=kk63e0g7SOoKNReW4Yhz6W65udjO8M6t5mY7KUcyD/VmYioFdLB98eX1Wv06/QFOdK
         M126HfMbUhS2InaOT0LcAwclfgxo2jPivycSq/WVmg7rDLUJHmFcNUv1k1e6gDFewFrd
         GjiMZKSJFDwMCR4dohhsLfy7xHc2E3OKyQ8kazqXl08iAyQsDkEeEgvD1Xlq8AGmBlRL
         C5GBTmSD7KKfB3LQE8DsVr+rBxhx3KbTZLh+055wlIVNCkVSHxRtDyvNUHeCFXCbilU1
         LrTeuAl3BeiHMRz6vR50J4CB8XoOX3y3Jfq7H5ohbvVdmHzQeNv8prVnz9Q5/7GfdQ3m
         HHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482547; x=1778087347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DGWTFXWnf0=;
        b=QDvpg7IBNz9lkfxtxICkdcEK6x/lvrX32BIZ8AcFF7POym1Urf9AhS8HIh2WhLzgvc
         +Wf7QloPIOaBhUH405CVCuk6qIJP0aa55LWRRIT9OvzVUS9swNHHQeTvGX62JjZM/Cv3
         Ny8zNTi2CMgtkMpgL37SCu1Pqi/lWa8K1enf4zwcMXUMGM4JTCw7gN2AmyzgNruIkj33
         VUr0x6ZbdRprrK9WCzNU/sbVgq3QfD7WOCZC/VoB9IeU/QX5ZXz85wxfn+acosri/jwb
         ZU03ysJqh7iHlt/feSarK9dlbdR8ue83MeKnRD1xZOs/ovEZMdpvTS6/bd8A3cYysAQ4
         cuNA==
X-Forwarded-Encrypted: i=1; AFNElJ/K4tIVs2llvEMPgRrOwPpDR0mbJN9eA/bBTNUNvmpR+8oLxZvpJdi6v0kc25Hpjsl1U36I8+hY/JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJu2zuccklB4SakqEvcF4awVpTff+cdjDBwB2MOGvD+8HG0O14
	wUsymhyZR9ZUgxNpaXvwn5XWp1gx/3Yu2WcYtCuwWc5pyiuwucyhoP6LObOBtwnpGH+01qCBg0U
	loqI9ofUrHYfeXIj0kMvjrNRorNPxH++saaRfayqpUTvswLg2EefFe7qCMXPoMkE=
X-Gm-Gg: AeBDieugRnnHSeioLVE4XrOniKvOQvn24doWWcSAMQw0gb4Na2m40XWue2YlODDWTPe
	NJBXUPvHlfBG+lSI43bfjJJKM6+obZq7GxnwL1DPJekfk2tHmyEJwEkoHjlp2+hvHgnb6pG2pN6
	4zLNaQnwU7Zvl/E0U6V1nSQH9NCpZzTsMpccgbTPSNflf7X2YI4SFfz7y41wiFnK/eUc5ob23Pj
	OxsSN2sAOyqayO9lw2fTB7i2F+aB+7Kn5rQdFuRa0fj/4ApOjNbRdRFekkbNYBga2/wmelkHRp1
	ubqd2FGoYCqg8SyiFRI+rVl7MHO+MNm/MF9lYjQiRv21gU8KWuUnujsvSC8YsiIh/DQv5frBfi9
	jD02ENfSFyQTjquLlpc/1g8vGdq92Ax4Gs04WH0NL4WDTO5Q=
X-Received: by 2002:a05:6122:3906:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-573a5518300mr5157024e0c.1.1777482546981;
        Wed, 29 Apr 2026 10:09:06 -0700 (PDT)
X-Received: by 2002:a05:6122:3906:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-573a5518300mr5156981e0c.1.1777482546589;
        Wed, 29 Apr 2026 10:09:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2e8a6csm34918405e9.5.2026.04.29.10.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:09:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Wed, 29 Apr 2026 19:09:00 +0200
Message-ID: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3ukGjQkgcOyujuxOwfozhWdE/4CyKPr9Iuvtl55GFSA=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnyOyuhJa45RXpLwBFAxFyXQGDPy/qEtUf7O9WX16absaTHh
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp8jsrAAoJEME3ZuaGi4PXGz4P/iBB
 uJxcX03jzpzBvBiMpskZ7/4uSVzThalMfzCYha3IGAMssXDHtvwpeNcA7/u+AxHDPuHxrxvn/2u
 MB3xMCjIJB2Ot6fCraC0N4b0TkxzJk0fEwY1ra1itgZRW8IdDlYIzxeu8ndLrRuDInrGa4YcH7K
 dC2nNi6c/HDYlEH46YSlxDd8ro78vOMz+itRiDqQDp5aCELnFm7jscABFpeyyyOxFqHadUkVvyJ
 jC0xcmnCPfUMCPnB0AaUE7XmXpi2Bia/+W1BooHr7f8Vi/feY1uBq8XgeoawyP287cA3Ex3Oh7F
 GIJK43s5dyMm7z6V0uARWyn3OTSEBA4F4gdzR+Y5j6Dbw0QWN4f/73AVO0V1PrXVJmRizdJ1oeS
 RRQ1O10WRZid5kQbepMf/q9iKSsTd7prlf1ApQ5clo0nic5AREwk/F0E5iEERDEwRWusXFrMTha
 xnjQTBeW/0PF0QMmMeRxiNmpErewnq31xDgEHqvdwXRD1J8PEXnPFQUdxKZ+PqQjKGm6YnpvxOU
 5yuJCUjtKLhRRjyJ4WLeFwgMHLKJdNmaMAbB2U+90Gc+DlgKRaNVAIJyNL59XxqbLyefQucIsix
 OQGziwVt71Fpu/OOvtJxIM0ZT+HZAps+IAEhAF5w9BNTN9LUQj2Bqnf10lWufmYdyOae69pAdPS HDiBN
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zQxEve5h9jKkurySFP3oLWSvZOpaOkm3
X-Proofpoint-ORIG-GUID: zQxEve5h9jKkurySFP3oLWSvZOpaOkm3
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f23b34 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VRa37pfzgGlg-717BZ8A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MiBTYWx0ZWRfX87pjS7pYGZR9
 ij2lHNREq1Ka7HRU/CzZh+vFLXCCW9fDmck4nZtnATsiFyDAioDL6OmyZSJlHlGdV07eEcsRh55
 Yui2MSTtDkb2aT0X3tvEtQH/rVSOZTy3SL3Oc9DnXeBpIW+o0aAk0rkNjIuvyYuI51elQh1z+br
 0TK0IPlWKI45QFfrPB2cJ87Ss5u5Q0kYG2KlvBMwfE9DFFzFlm+cRaKF+JkYdNC8o075LF73n1q
 0aPg7d9XKzKep+T8jiWadduCafeK9IlFCYUIYq+Yswj/jNVvP9ei3CnvcWM/mBKaslcoUY3L5Mk
 bGnbcD2hHDAFYfso5fgUHPZiiba9I9YisMNtuykjz4YImUnHj0H2QN1b4s1WIvVlLJOZjU2PkkX
 fHDbtQVNDS/n0zKp5o1wHZoBKf0E2hjzuFpXgzmxr1MLIkl7FBzCK+Ig6VUgpquCz4yw9Wm9TUr
 wRulyT+uXqcq5X+CYtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290172

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
2. Add rb tag
---
 drivers/clk/qcom/gcc-nord.c     | 2 +-
 drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
 drivers/clk/qcom/negcc-nord.c   | 2 +-
 drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
 drivers/clk/qcom/segcc-nord.c   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 3098d8fac0fb..8a6e429f2640 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1850,7 +1850,7 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
 };
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
index 5d52c6d8b5e5..1466bd36403f 100644
--- a/drivers/clk/qcom/gpucc-sm8750.c
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -421,7 +421,7 @@ static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+static const u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
@@ -430,7 +430,7 @@ static u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
 };
 
-static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
 	.alpha_plls = gpu_cc_alpha_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
 	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e5..2cb66b0691a6 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1945,7 +1945,7 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
-static struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 163ab63c872b..961cae47ff7c 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -626,7 +626,7 @@ static const struct qcom_reset_map nw_gcc_nord_resets[] = {
 	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
 };
 
-static u32 nw_gcc_nord_critical_cbcrs[] = {
+static const u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x16004, /* NW_GCC_CAMERA_AHB_CLK */
 	0x16030, /* NW_GCC_CAMERA_XO_CLK */
 	0x18004, /* NW_GCC_DISP_0_AHB_CLK */
@@ -641,7 +641,7 @@ static u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x1a044, /* NW_GCC_VIDEO_XO_CLK */
 };
 
-static struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
 	.clk_cbcrs = nw_gcc_nord_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_nord_critical_cbcrs),
 };
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 1aab0999de4d..c82a56d97154 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -1568,7 +1568,7 @@ static const struct regmap_config se_gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data se_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data se_gcc_nord_driver_data = {
 	.dfs_rcgs = se_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(se_gcc_nord_dfs_clocks),
 };
-- 
2.51.0

