Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31440A94A
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199567; cv=none; b=bw2xdoGKkpVPyS6hqZbuILfp4LTADgUpymbR1XcHrilMSmsyQjLVxkir7UjC/POq/fx+dpkuJzn78rqigEjYTg6cWXPKAaYFbnkPMUNLJ1QzPglo1a2dqKJF61SWHMWvAlQ4AunU5q3qsXfMuzQ1bEHgXy27w5ULg/+IgtjeUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199567; c=relaxed/simple;
	bh=+eulYr1rGL8hjIZswSmmoq8v2VwYvYXeWvf6YAu6DuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mM6hA9s1tLAp0+n+Ij4TYS3kTvu0hDjPdsJjnNE+gNYg13Pa5vu3oDPzQxsO6l0RkH5UU+oTfgnGzjp/Po2OYlhg3WZmUFEU06ry+zsz3/2Qyr+hPpAYWMq9UVv3MY/b4/SzMsT6mhr5wbxKwf2k11Kq5Nsv5wF+iL01fS+jrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlMQRV4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezWY6WRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlMQRV4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezWY6WRe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rhGY2416094
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=; b=KlMQRV4DmKtRZSVA
	KTw4q6jnpC62l+AreJWtzIM2KE+hlH6CMRw0anYM9ivWlddIpB4tHQftSyC3L0GF
	FmXskLFn7ZJbt/H/ka/yyyDCWKFsW0EmO1LS3+aowNiwnIaOOnaDQaHF+oVv5GQG
	TUAVfhEd2nkmsyIqPBYbcePGQQ35L8qj1HFGGqF4LcMTCyt3JTJqcreA2Y09mrUU
	yd6wSkTIrO0cOFvsQ73OuDmYQocDLIAP0lPWoKCC1vb20/2pJOLsMweq+kaIL4Gh
	n2Q426gmWm9IfHMcMN2iKMkukRhsPI12MyTdk1Cq6JKniXEH12Eb/9s9+v81zmCR
	MSaBlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rfju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so9545529a12.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199564; x=1784804364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=;
        b=ezWY6WReZ732eH4NdDUkxqtQfbgKq8luuGiySRbABXAQT1wGDzXSSKzJZV1DhYroYO
         5ucUh4Du4bwYG1/wkZ3U0dMw/pi37yk0yb0nwCH7PGI0/n3xSOjQPJEcMZP/VSAP4uK3
         tf/CXQbBJtKP6y0b74/FYDOxGA8HwcbEvnM0zzdYGoOJzmGGCyJ6MY+B8jONz7jP6cT0
         E4fJ3e9LboUt5bYnG5f7125HBmvK/YnwUrc0abZXsW1qlEVIDVWbB8JLIy60S4QcsZam
         yoQrnWTElhiyIhosNUFby4TniAQIRy+1dfyu0w40aeR+wafSKFTfKAA8iVQICyZUTI3Y
         uX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199564; x=1784804364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=;
        b=Ul3i/YyWQBXn+GvIUROsfIYUEcuypHfYY1yU6yDLQ2DGQXIlWRcj9Gw+GndqheDE+A
         rRB81BZ+LMCQsr78hXNgFxf+ZdVT1/O+dov10HGtkgr6HdXCdpo4Aan8eJJ/CIqc9jQF
         +OxMKLjdT9xJMKZJ5AgonHIs3Ywx45w43wI+wpu3NRjjv9YC4oCIOy6tEDfEr4HW5Vfx
         nmr6zdaaKteS3wQuSguc4A2v8BOGnkazeqXwgFQLvd1kA7eYdYu5OWq1z39zmzES/v8S
         TPhImh7AEY//RqPzJ6RZxujvXbzk3/J57LM1MUUiTf0PEzYWXDTbFj3gr49f8TTO/qIO
         WqUA==
X-Forwarded-Encrypted: i=1; AHgh+Roqj+fN2zmNvV1VmAv5tTsPvQabYmF8FIczuJ7EdEX1OwssX2KOLl2aqxqfcohmcaXejaLKV1+mnzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzacF1avOmAE/l4pr2ceQHDAtN/i6sszwroeFhy/VSYPX6eQDFQ
	ny9no2W6SC7xgO7Z0L+7/Vl1r0i9s+C+y6Ym+myIuE3xh+Jw20mWShecqI+OF+pP+7ndcEzeFW9
	fn3ZiC+KSSikYz8Txgqum2yp+1lLk0B90/7YRvf6hpiLAk2cHodnOsExnoPBxD6k=
X-Gm-Gg: AfdE7clrD96kwEdlHRRWZle3dZkcDHhrQGNYqDtYPig1EmZR7F5YucP7J7CNbdZGk7K
	J2MHgjgf+LzUj6/vCOH3NXeC0HB/iazLa/WYvLvTv8xcs7gEU9XMgA6SyAZJxzzU1+1XHZBzuVX
	GFKyep/gYlR88/FNqJ+8OjZenvb/Tal2VTUbM1e3e7br6IE6JQcVatklMzdCO3gcaXu1GJ12yv9
	gHPMJ4PxQoCKReMLj+bO9KVGIYzwXSgpogMft20/vcSJ5EEvh/H8O/u64jnw2WjbUdZUvdfRUOT
	aFWM0GWQK0BBi/oNgks8nMd+TKAKcLJUvuwTCIGtxzJlOZ9juSQmz6SGLHH/bwS8EGHS7wSUmrE
	3xBPU1nYWOCmVVZlWaL/ABTzH
X-Received: by 2002:a05:6a21:610e:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3954d2965mr1398185637.9.1784199564137;
        Thu, 16 Jul 2026 03:59:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:610e:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3954d2965mr1398142637.9.1784199563661;
        Thu, 16 Jul 2026 03:59:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm11175385c88.9.2026.07.16.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:59:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:29:11 +0530
Subject: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX9gCXKJ9kjAl5
 2Gy/hoP/aGpYa3C7UXzwaeAIaMyEIn8CXGtUNc5G1gQs9Y/uKAWYt1sWRqnF8Yv200l7M3DsE9F
 4jCD0Lwgtoe044dtYlqF/kSKRKex4jAtSvXY8bqNj2EohsfyE0HjgUSFvkQyNneS2XDeh8Ro3R/
 fHgNVkca+lt1DEUOv1863Dzd3We+YsSHnE2wqj/8n6sQEdm3vdYo54FmGykOf9U7bf7OaUD3pWh
 XtbQBHK9QelDc4Qw2pvAwGPpG6aS12ulRMLrtVSRL7zN3Zc5TrrSaiSFHjy9UL2PMGTdWBNR92R
 TBMrpoAQVu2953FH/V2Qk9R8qw/7Wg0lHRfK4ESHVa4SY4FbiUCJtoOn+EZYDol1ZSJA25wC6h2
 N0xx9e723xUgVe+sa35a+TIm4SWb59eRQ9uGuYF5xeMI67XdeFkiPxAce7FntavAxItCBcMsIpf
 ssPB9VO4HhDHpxSITPg==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58b98d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8Gc3ZfdGl9KvgkgJgq8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: TRpxXAwCyI0hzBhqpX6nHL2iF7cMu6t5
X-Proofpoint-ORIG-GUID: TRpxXAwCyI0hzBhqpX6nHL2iF7cMu6t5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX7jHhEEwXEw4W
 OTX85a2w6NalFel54zDvBQpN+JqCZXDN09RmV3EfZhteShTdsSRJqRZZC4TymiYk8nDpfhrl8cO
 v4bOrjd3sPfRjtXzsdLuvXqpDBcquRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160112

The PCIe and USB3 pipe clocks on Nord are sourced from their
respective PHYs. The halt bit for these branches does not toggle
reliably when the PHY is powered down or not yet brought up, so
polling for it with BRANCH_HALT_VOTED can spuriously time out.

Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c   | 8 ++++----
 drivers/clk/qcom/negcc-nord.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 7c7c2171ac965f396a000f34dcc15a3ba185a386..970a3e1a5864aad98f3cd3efb08efc429c65e94b 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -701,7 +701,7 @@ static struct clk_branch gcc_pcie_a_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_a_pipe_clk = {
 	.halt_reg = 0x49068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x49068,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -850,7 +850,7 @@ static struct clk_branch gcc_pcie_b_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_b_pipe_clk = {
 	.halt_reg = 0x4a068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d008,
 		.enable_mask = BIT(24),
@@ -995,7 +995,7 @@ static struct clk_branch gcc_pcie_c_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_c_pipe_clk = {
 	.halt_reg = 0x4b068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d010,
 		.enable_mask = BIT(1),
@@ -1140,7 +1140,7 @@ static struct clk_branch gcc_pcie_d_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_d_pipe_clk = {
 	.halt_reg = 0x4c068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d010,
 		.enable_mask = BIT(10),
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 355850a875acb0973fbbc3865f83d6e4df4c62fe..3427a0375373c6843fd6bb02e0e05e51380b15ab 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1641,7 +1641,7 @@ static struct clk_branch ne_gcc_usb3_prim_phy_com_aux_clk = {
 
 static struct clk_branch ne_gcc_usb3_prim_phy_pipe_clk = {
 	.halt_reg = 0x2a074,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2a074,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -1697,7 +1697,7 @@ static struct clk_branch ne_gcc_usb3_sec_phy_com_aux_clk = {
 
 static struct clk_branch ne_gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0x2c074,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2c074,
 	.hwcg_bit = 1,
 	.clkr = {

-- 
2.34.1

