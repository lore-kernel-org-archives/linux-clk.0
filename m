Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA074A13B0
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853125; cv=none; b=umb2iwskJuYyj/QagxOrgIWis02UtZZ7zOczurKqBFg8l/BPvctjEt558gYfUMvAYtAOGThXJFKcrev9YK/znOU1ylT1jVPZfZTfs2idWeDJsbNOqc3rR6l1DOUjV8oM2noL9OrA5Iu1A+sQhL4+nhIuppedozeMSIxmtGohY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853125; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlCV5FBw2FQmSwzsQUN2RSWU6ja1fET8QZk3AiuMaixmWen7vBnSoGAszfgawPJvjbhR9mz+2m+ID9v1DcIEsFMLVjoRGDQm4JOXZcRAW9RtiNnXM0srFQB596JKNUcY7Uewf9xPP811/kLM838LWkrYMCZXnpxeIpZc7IAqwu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFjphGD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGKkloIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFjphGD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGKkloIQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXav34178250
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=dFjphGD1N1rclYjX
	8PSV+w6jwQkIr9YsWFTgstUfoQy0sQTtmwYkZwWGWf9WrrKhCCKDRV9Sy44n8wgX
	9/R6ju+uTmnYRNLj+F+bFhRAFosKeaoHAEdxTGctP4oFWJxbfstvSEJUzPcSqTvQ
	PNhSNznNXpI7RwaYqH/7/klKwEofU5m8o56E4GcbHF2B02b5CeFb4h1MbghFoCUj
	5CVoYfBPrK+W2mzMsTawrpG/17oOGRoBu2cW0Rr+OReb1yrcvZn3KQF8wr4wmVr6
	0MwOr0Bz145oMEBJLNBBgoFa5ucHyykmQjLc6lZbG9nt5zqEaGykFAl2Pl/yEXZh
	n+8o3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw1203-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:52:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso247165a12.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853121; x=1788457921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=OGKkloIQZCYNqRsq4nlpVvITEsr7LRElGFP7JZnhPYItECyap+1/eK33XW54trtgh+
         yVG1I/6qoP8QNUhmYp1iuQc+1fjYAkpjV6A0fDSL2uIpIG4MH3i3UqNzVZAl57iHS51V
         r0O4btIzSIuoZ5bVWoXESoGRlbUwaN+kyhmIiZYoW607zoGX8wxaI3ieMkIJRf/AbWSC
         dRNW6VJN9f2XCy32mGNqd+d2M3KXYdrBXmb3VhQEMhGnL/fzrkYfV8BtdK9AM6FSO8m7
         5Yy7ckN03M0RhN2LZ7HK3c7dp70sTrEYll8QJz2RuFrTb2l5RCnnjRqOzBg01UrcBsXs
         ky8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853121; x=1788457921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=RdwwpzABp0WXo/R2FXKqqytkYtb+/6Q6vkGE8L6KgkgVjWxCLgbHgYO18+giOMS7ku
         +qljy+9nxU7nIoOd5dfMcRBY6uUPZDeNE7gI/jUuSFBEHt3juhgrsC4KzBSu+VoooQdz
         V+w+PF2RnW/ARuVRip89JN1WQLKl71rQrjVXyztXkv077Tr13F5z3+SA2/vM59tivHu4
         wztXuZ5QHREut7Oy5+lb7wfE0ILdN1Mzz+DAk7J813jkrVCP3mDdOfHUBAfB/twdP1XA
         p/FHHcxbobyqjyaNY3D98twRlJxBZaIScTgYT31TXxOKC+cB5mYu1FQGnxylGrQa3zQ8
         jtKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdL99M67PO7JQXJa+ptpdR4Yd8u4UBVuD8d7dpMSmxzIZGEgb+LJYsC1TFq5290MPoxT3i1k95flA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOWM+TuxZCT1YzAOI1r1vSKcldxtnDuULXxsaZKZsT2T8zN37w
	G0plmyAds0lHRMn1fmVxDDkXwO8tl6wthUMqirmuF4YMtQCxFhTFaAlGH0G2pFDrap+aJq/nDh3
	i9oNY5SQVQ9erkpUWiiFQjcICAKQnRjO82bqILR/Gl/sQ3tp0//A6xcI63mN2Wlo=
X-Gm-Gg: AR+sD121mOhdxS7GKRxexDJkj6xU+7WxDmHwjQ62lYvhe0LIZM447QWohvqvNv9Jf0X
	iOSWZJDJxF6H9A8OpPCTBu12ONB4Cvhv6dP3c3K1S6fjntUBJqj+wQ9R6vUBVB8hf2AaPuTnsF+
	4QZIKJzZSMVb00mrDfq8OSngYst80EFURt1WCsvU5ndLRcPr7NFkpFm7etq2w7FkF4d1tXcIUR/
	b/WoBWsAJ0Q6JezJ0F59x9W/a1w5lmgmFvPI3kZjorp76c9+7Buk2HG7/HulUnfAEFpC1AKKukR
	BDuQVULoKuiivbXjlPb4mTlBIjyHe9gjIGbpIW52YkSLGQj7JvaYNESuGb60yNp32AjUgDhSRa6
	L2zHVm3oYuHOJUIq9QA0AxzCv4xzwgMoORwIQMs9lCYqy71zcXUg5eCvVrOatQZUTbl9ReD5ZJ3
	qUWb1ckPcQ7ZKxQrS3JqMINpE=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355855ad.4.1787853121188;
        Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355045ad.4.1787853120764;
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:08 +0530
Subject: [PATCH v5 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-5-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=DJ/9X+zyxNdrjvjVzxUgzWUEDwu9bnEmv+BH8gG9CMZaVCq54yxqRXbSgGYGyRBaV5davTHKd
 C5aYGAAFLH0AN+pHU9UyxhEQe4FgERHHN0OYSx4KeaK5c2jJs9Qpcx0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 4KmoYgOhILfHYGj0Ib9pgoe-NWx_MRzB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX5Cuh/r4ereMB
 FZDx+qRYYFfziWqAktVJxFyoTlRHY2hNu3OanxYiKt23yCa425yaLa2TsTElemPSiZZWa0Zw8S3
 mBAmuSIpgwG0sfkc3x/1lBa5ygUiw2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4sWYYTLkt8KS
 qRhPCAJBU2nC70MKdALyjg7vv4JA07CKAAq0NqE3ujx8Up8PSE2jfrC0CRSOQOBiXUbflPmOGXx
 O/kg3ayw/5rvOoHlWSsIlsj+qHRut0LvdCT4yRl8ssimoQTgJOnWJqQGZVrkoQ7qtHBu3Jq5+gh
 pbt1n8UOANVPSaTdybpkAQ2w/w/8TqxJKvXITHgPa+A7NuRusLI2q97Cy4Wi4rqH5Qt/DZawg49
 Py241pzXI9rpiZY0s9Amnk32FLz3xOKw8WPb5WVp1FYOGxxoTshJADmhBAzQ/+yIbcimtGKXaDc
 V3bQfaKQSlq378wNr0ypKolks6CBr3crGeQi58U98YF7O2mUFnmvrwzfd0/bsmQLCuMPxvk22OT
 I8RAuFHty/1+o2m2BgF6PsjzpZmY6OlL0xuxtLgXVUD+huMlaqMPfyMIzscQFtSsafNCVXpLVLx
 uOpvYXuBL8FDibKxIyA==
X-Proofpoint-ORIG-GUID: 4KmoYgOhILfHYGj0Ib9pgoe-NWx_MRzB
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907942 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

