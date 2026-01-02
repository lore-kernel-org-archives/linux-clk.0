Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709CE2D1913
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347027; cv=none; b=uuxKWFVbSwZvXFmuSXJ792iRg1lHroKNuFZqwHmelmGiK9djH6ZGDOfY+f9DGGMiMKkWUpH27B6lbhRFrDig1idmY/5huC9lFWXJBznzPFWfEAohnHIijZZhSLjnSXPZHFltrtTq5Bk5tY/AtpyOiVAzz4oJxdCs3JE0RWXrUT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347027; c=relaxed/simple;
	bh=za17AyB+OVyeZLPZNTqwYBIrPw/xf4d5/jl5MyUbBm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0b0a8owYWKmF0Re9qQidtFOFybUVNlgpJA6LDJ5boGju7DlQ6yGLfse/YuZgF3T1A3l2wBSyMwW5b9eWmRaUSvlf+dX51hPo2E6bOsMRPQOqI3CWs+D4ycWHnCIRZ/WeRQVCNFG67YDhxwX4575YGRjwT61RGZZ4KGM4OxsHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rx7sDcN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/0rG5kq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rx7sDcN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/0rG5kq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vwtf2310152
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 09:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=; b=Rx7sDcN16xgEg9NZ
	O/JlvYTDierU4FrvSARTnsmy7AkUmdwMI+335Ie0NpnBHpJuGn5/NZdrW/17r9p3
	bvqbd79x8eArbzRvFt+xxdDP4r9k00No6D7ob2edjsKAOb+uTp18LtP4HWUZd23t
	FtptWE79hfDa4jSmRkDMVYvGSBXG2gwiYRAEy0sbDFaUnsrN5BLTan453HWsmcXd
	Hj3TVKPKtVRPU6/vwAiTxfZw3krbJrx0X9pjYMiOpvOADQur9iE5kjq+FXp0zPws
	49bzS3O6pWPcBDF2TIdwkceMPi//N1K8i/6tRt5jCtBPzf7ikexCI5YYozFPXByE
	osyuiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9spnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 09:43:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so405315045ad.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347024; x=1767951824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=;
        b=N/0rG5kqy/R6s46/kHzLNTMbvitWwFLh9RRTvlgsAYRbNKIkQdzk1vE7Yb6w7TFlGf
         Mvq7SI1OU44Uzp6qGagf5xNGktZqdvYytbiE3tgwUzHqz+vB/MWJKoIs65CgMWQMlOqZ
         zHgTdxyxiPDQ2Pc8FlSl7T/fjBUX93vtc2x1fZG9Jw7tc9C4NZrVhMDeXe9SuVTfOPq5
         P7xLy9UgkQq2J8boxCTGSVoE2QceklBXLOXJbBE2RY0rN0FIp9zr+uHP/uL4bWoaY2Lg
         0RQsd08WgWM42tbw5Si/IsZRQsiqZCnr9tW+PkoiLlAVtms8j+288eV5Mv4tUme4HgOh
         EufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347024; x=1767951824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=;
        b=e9tNPJ/FVtdsr8PVmpKnpPvwhtGY14ggwx/i1B86WQ4Vu74oCuvCgubytC92J7cWxQ
         vDg9E3/yA5MVNmFzXuDKq5DH7xC4yH1wM73qikHP5x0/8yIFO9xLJf/fABQ30OH8kLlN
         IMVvYgNk+zm9uieBaiM77tTXz5KJ08PPKaIinI9g4tsTwEitA1F/JkxGk/FG1ZpP+hTZ
         2cxKRwDSx/gaqPnsJICUQ6ReJMzL7ujD4N0+Do97pZUWb+iPKEPGbAghhPmM/g7bUxMe
         DvQyLeop7p6pebWUfnNHiWGEhfF+DJkU9hinNpCY8FKx3AdRxPp0EmnCqUDw9tG/vYrQ
         Zu5w==
X-Forwarded-Encrypted: i=1; AJvYcCWkCqUJB2M/ujt4RVCdrSSOnkcvjd3Qo2t6j1Vm8N8vlVDKW2qMQGSrhM/3orlPYSlWAZOG7+gpbbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmjok4vVizoi9WCKeonaDlr0kK/+8EURBb0F/uURePrG1jN0/U
	3orvPw6SUHUpgXbwZ9dlr/vgn1gIXiXhghXZOdIJC/OUr4heXVNGx9hyFO3jU5HoZCwlpeg7sCa
	L/j8Ww81X6Yy4Jd8J07KNE8suIP3XcCp0Ui3abLVlFwAgQ/8lO6Xk+Mo253LeM58=
X-Gm-Gg: AY/fxX5qynv8NkQU4oPKv09bZMCmH1tvDsaufqSvGoQRVRgbBAeS5P9QqYCu+BDfxP8
	RLXnZs76i5uqBh4rILSJKIbOswoKQaeEXfahgIF35i9PoUujvb1C6DJHctz5d2XOmNgAJI235fI
	MN/fCytx8yu1SnwXy1I+uhUi8f62qM4t880YRJgyT3dHI1QCwgKk0nK6lQqRthzheRbXvcppjxp
	o+OGTQnhtVaCOdVPdj9uyYH8KsiFIljnAKoE5Z3nLP5ikfAC7bTjtb6fDQ9ZCJCr+TZvYCAr0YH
	ECsSxFJZHOgdql4rtn9JhOF8TDUMBeHG6rCQqJBfjGkYZ02jh/aq1dYMxMDKBIx63jQxyonyXrc
	FiY5EUrfTK0tXglLG0yiCyc+sxBwFCAXHG149OgF+q5If
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr405470045ad.46.1767347023963;
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEidZlQEw2lZuB/a9A1tSdgI/rgTD2eYdotce7/zJyLNRyh1DHBKjtZsDc7imB5NUctN0yew==
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr405469765ad.46.1767347023495;
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:04 +0530
Subject: [PATCH 4/7] clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-4-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=2871;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=za17AyB+OVyeZLPZNTqwYBIrPw/xf4d5/jl5MyUbBm0=;
 b=I1uC5RFV0qWbiD9rxeFWOBy+/xhlePZID/MCvmI9h6Rgwup6M6VvJhkQbEM1/Wj0OCPz3TDb1
 Ld0VVOBH/hJDrC2RAjJzg76gwUSycPdFg+ke2a5u1LLhtgXF2hxfnBN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: u_epXKhf1SRjXC5i7vKIh3fhDUp021Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfXziLdrJnl2f19
 hENaepz5vj1ZQzu+fpnQ3+4iQh7i3ERAvEbOw72NkyZ+FTyjgc06aEg0Lw5hJ4T6qCx5rqIDhaI
 ZkCt4nQtJSO73lzk6AL/tTM5WVy2MvE2xBrBe0K9DLUISqjeihzM+7WkYCiirzJcW2Bjr56PY6I
 uV2zlUwKl3mobiAjz6WVZitpM6E8UcTY7MAJi/hq6+/S7ZWu+EZNwm+hEF/N8E0twTB+CVFAwO6
 hLiQnxa/3IjGK0DOPLfKWMX9tX6b6Xx2agtdIFL0754aJtM4a+FAebsB6fsJOGf3QG3eBNJEsyu
 CIzIHtyk0Y9TkLbKj2ejhLjFCYOfu+VfUXINnPGQOlkXi4BtG+0N9QQ6KJnLET7KTQVC46WeunC
 2SmR2Tr6wgX9p2SYj4VxxHh4cNVDX6NaABJx9lGfa0/bFo9Zimt4ipYZMrWk6ttNhhof4tycF95
 /vfQVWxpZAzGDYIMVNw==
X-Proofpoint-GUID: u_epXKhf1SRjXC5i7vKIh3fhDUp021Ht
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=69579350 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=APsdKiKIpUGVn09es9MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed594618b8526651968a4f73b1104e..5c66c1264f35b083d046d2c11f430f0f113001ef 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7647,7 +7647,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7659,7 +7659,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7671,7 +7671,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7683,7 +7683,7 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7707,7 +7707,7 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7731,7 +7731,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7755,7 +7755,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7779,7 +7779,7 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1

