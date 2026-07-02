Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDA369D74
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017240; cv=none; b=qqi2qfPO6hIhAB059M5D8gPCy35PsdBm+Z9FxqO/WXPbbGNdJtMY0E6xavMT5Lljk2wbbQADX42GglmcFWHovbNHQ/pB80YEZkcvEZyRiA/T4I5YPXXkAO2oHt+oxcMh0w28CaF0bos+tzXodJE80l6bRFTuz4SWD/P5m8QEu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017240; c=relaxed/simple;
	bh=EOgfoYeY4WTgFl4ClE1+FDjJyJ6SR4YpCFjo5v99KmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPT8nurmlcCM55WrawqdwK1tEv8By+xE1hEaU3vGYfxtTGMe48mxeLHVFyFD7VQeAydNSSM/84HMnPt69S4J7FtHFo8uT9qwVYDBYQ/rJ4zdfvaMf7TeU5y4PHNB/jzJxocRf+2AjKlfvcG7STjt5F0975jS8hojhS7bj6vb0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mype9uga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECCekEgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mype9uga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECCekEgp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3MBh548955
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=; b=Mype9ugarMKcCsB4
	+SyTQaIyCZqdnvchScpItWTZ4uMgeqW6DtvD0aD54VVJ0cVsU/E3aumfyk7Ra24D
	MWvuvQ7Ao1Ny/pk5HF7dFxbdckWkcOaSeqhUhEJey9iD774FjyCxWiBXRcyuXMTz
	poK4lphmGtZZM01+H4tc0zytX8i1lVAZ69voLMpjqxrxlaIsAaNDKIyIIC8+na9O
	6zif2BZtKnjXLEQrfE5pAFGnW6T+DC2RVc3rbo7a6FLWvxhMia1ezMzu0FFJeTRq
	IdfxQP27VUdFIucpSvfcziBXjAMDiLQht0/RkZnmhJQ8o06vGVaBzGE9nW3J8ZZ5
	9lI9cQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98k84y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so2654171a12.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017237; x=1783622037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=ECCekEgpoXczpSf9lNtIWL0RZ7L4fM1t94toFD20M6fS/71yycsV5pdi4gYjXsp2Ch
         O9ZfbOfG6z+iLnH9OG1Nwc8yiJmH8B5hpY9Z7dW29GGf0eojiupU/9u921smIPjZHW8P
         ivl9c/M4tNyOE/70L5RzQDOPz2nVW4XBucjHhSQFr3Wn5lsufmuZK+BIo2CZKnPzyPzW
         kdg8q+37QM6+5dxEZSgYvq1bnEWmVS4XR0Nm1mW0OtwqQnql03cekMLI7Arpas9MCpuA
         hyjeIYSokU6INwfLZMfMfD492wuE+yjuT65GMmPjxGC9hKROMCICrEUDg9Wj81LtDAPf
         IMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017237; x=1783622037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=GxvRdYaGAq0rD18Dp4YuxgpFCxns0RuWMPtb7HJPF/qw8dUwMb8NFcfGmz/P9xBFfL
         teS0JkX9LIW6JReOPGJSUCY2OX0958XCbBVe1dNeDkqDFfBSkb4pR4IVk5WzdkstfJZe
         4PggMo3cbArSY0A+ZkDxG5bh5f7JnxFx8GSuoM46H2EVq8yzJHDQVHQrUkAUx+FTu5J2
         vbs/nkH8cdJ5RsICc8OzHeXTr8+frPn+rWmnbFpU7zInfJkd3KI2zAZsj4mLF6HRvc7b
         7/S1sNF25o79/nV2mdyu0iFhqUxhw+0kPjH3+52QmxDn4KpWOEBIuxkZsaM0CMgXV9+1
         kRJw==
X-Forwarded-Encrypted: i=1; AFNElJ+TaUEtMCZLR9x9dx/zOy1/uFm9lfY9KSn73eY0/S8eOte6h1+YV0ucujM8iHKok4zInzv6IiuWorU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwLvVIFXPmxS+IfHjO07qH8zoxWNYPE+RQWGEBpDI+5HBolx0
	b9Q+t2odbFIFSFHSmTBapssK90exZxusxncF/lBCyMkDs8I1M5h+S7DomBdg8npA1REfdpBwvCF
	7WOj1K+VBB0gu4eQqlMzQRZRuO4/Cx7+5yxkuD0nJEi5NdPWWyPLNRnuDElk75FM=
X-Gm-Gg: AfdE7ck7aAjFoNXLawy1BGCFz29rB4k0AgGlXoNLIup6HcDXzIVQyctzhXd1dbG58ku
	VSRYugO+Ah7XU6z8FhaOC4FKZ92pCppY7/Nu0RliLm1ojZdsC4zNkTIrBOA5orxIKRjIas7mB1+
	ioBRn/x4sp1hTnVlPkAG39fARAZzm8xQaPP4EjMTCkT2ehnxfgWkxyzSOTdINEFqBokf9HZmfqp
	wuleu6ZS8NLwDMj6G83sReudUw9Yqrr4u9ZZjJJcwkk36ii7meYt622u9ZSIl8Xoc68Qw9KRRLv
	Tv/Qdh+z0T+8t5nZJ1rbXd+7ii1cMBNSJDdns55ZS0BYViGqP7RqHAn1VmUcfJjTQajvsjNmMA8
	7VmWTx2ltIsKAxNhNB6NbvDDJZ87/lrPe/G2PGhew0w==
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386833637.48.1783017237064;
        Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386786637.48.1783017236588;
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:33 +0530
Subject: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: amwIaYMgfx6Kdax_1SD418DGTnRqmhUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8bk67I00SNv+
 lzgnx55GgwFV7nwDsDxyx6bJkMchirqHgRynOHDYztSnXNvZaIq3XCZY5zw3uU4rmlGtHd37g5d
 8iMXLEMaJTqfo8nExzGtRM7aUQ19qC3A+uTvpijJY8hoUJx2OttiR6eOhmXdSkWjzOX15UO/qIJ
 238gZQ9CENlAZysa/gONyrK967GDip3pdl2g9jSQi4uX+kQZvzT+9UbwR1ApfhyBL8BdmyehzTX
 lTK8P3EIw1sGHVpwLrA5fO5TGhZx3uGuIfFX0viusNdqy6rkfZRCG3bbVjmoC9vvpgfqBITBtkA
 3oGykWgAEqxdt2mIuZoII6kZYKbnnpF1L0O+K67Qfq6UipksQ+ExLuN9noJgF9OB+KcDxMAp8dE
 vwz7O1dK8T5tr+jEYlYa6LVqc81XT1dCt1bjr1m+5ZQp4CsIHS75yu+QPajYoUkhFEsInWOjfdx
 YYbt6zoSenHbMXLtGWw==
X-Proofpoint-GUID: amwIaYMgfx6Kdax_1SD418DGTnRqmhUg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXyIPsOdU+RWSi
 yWJbZHu9u7K1EfpImF1hyJIDxSPYaw7XPuMbO/MQNf47lH/ADBDa0ErtDhMslQJX24uJLTDoB2R
 wgRHvxKW6v14cvA7qjIueABLpvh0dY8=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a46af16 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w9HkOJeuip43wi8LW4MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
hardware default values. Incorrect settings can cause the GDSC FSM to
stuck, leading to power on/off failures.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 3 +++
 drivers/clk/qcom/gpucc-qcm2290.c  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index af5527f6a6aed94d372f5c54fa353ad4160549fe..39960cb5c26a9f7372ebafd14033bda697575416 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -463,6 +463,9 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 8d397cadc86aaa1666e27c8c4185b9b3de13cf94..4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -296,6 +296,9 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -308,6 +311,9 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},

-- 
2.34.1

