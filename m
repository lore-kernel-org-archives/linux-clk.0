Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171489;
	b=XXdlGNRzHs8ZL69oaUsXOv743PgMOF90O6sCrbkQld19XxJenPrmoQTkUPJVd/PnRR2p
	 RTseJcwuBIBS+T/aeJLmCh115kKX+axyUrbGltPGd2+J9sXWFau+HMx9a7oMb3qkl113p
	 itrCk1gR3a4ITwZZkBBvbdDtMTqswAMD35xH5X0GAuLbHqQ7/hH4ntxD5O5uq8BKIBO1Q
	 ZkpSGdAa+mO+7Yv/cDJ4PuDbmVsf3l94If1BjhvgLZOHisNhkirArI9Xp5vVnPOD2wCg8
	 drzaqZQchKBaiCbc0oW8RAtljnVGoMSHN96iHa8TLeowQ8+F8WHrxK8JqM8CKQDQY9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9ga9s4FaYGlFWJhY7GxV3+5LLmF/e6Nq1LhLpotH2LA=;
	b=D/dywPMg8c7lCXwQFu5DKNhhfWlUBZj79C7RnFbtPIXnNWBxjzJu+f0diP4vB7p4XXTW
	 GvNeYM6gul/1484TYsXHNbzPD+DXUUO+NBit4wAOpjYmrwuAXm8mHdlea08CiC4AGqRO2
	 6hjt5Qe2+ksS4ed7baGUChwJE/hCuACBzUukDqy1ipf37iOUn2fz4i5gNpc2szELMAE+f
	 k/X6zvPuofEnesBB3zVnJDKSJ9BSkGB9Ptmdjs38fQnNuLIzMk9SSbKdjO9FW+fPbajmM
	 FX3BIIdKJPQWvbyze0xwRpCJ1N0E0Cr8R+pjJ8QrfTsE2ghuBfDhqoQCxZwPZhIhKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HwKWgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PK1r8c/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CAB606A333
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CAB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HwKWgZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK1r8c/x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7euDI3575698
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ga9s4FaYGlFWJhY7GxV3+5LLmF/e6Nq1LhLpotH2LA=; b=f2HwKWgZcfKld8j1
	7/QDVrMXeLYD5PCQxG1w6Lq9fq6FORKgSlUx8mkNQvPvxF9qdyVl08tVKzbXVqcq
	dFRsUkuiFseKmEalVdG013XQ215OVMF+tb/TZKOFTLI43CC2CyaYNTCgEt9WVA8p
	mT4ltxWHCoJPkWYrZJTf/56tziab125xo4v0XRzBY5kVfCAEiJ/LAjYZMkeT/5Ix
	6uLKsZkciH5UoxTS7qsvU88eAtsw0QmhMN1G9JuzKMV8ckCx9YOnU4aqlXVdKGgR
	TQ+Z+k5KN8W2fRVP8HdHT8UP0hh+3UlrRxytQbafS8jYBXApmNk1kiPhmyFTwd/U
	DAFCWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu8116w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso1916048eec.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171487; x=1795776287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ga9s4FaYGlFWJhY7GxV3+5LLmF/e6Nq1LhLpotH2LA=;
        b=PK1r8c/xbIU4uXICPamqUKH9/5DvaSLkTccvOCEDYwNZFyG5/+URVq9nMgfjaP34Gv
         2P0fzMnE8IBmEtGmxlevt2XpB/sRxmnAJxdNZn8E7jWWs4NKik4tFYXmK00+QxyPHywK
         3GqX6JJXx91AY4SbIFb6Gsukr5LBamuDNCdqL2+ueh8qo4NStb1MwiaxNNmZmkd3I48Q
         5+LgEoCsE4F382PWZUqx/RAhPoF2ekDvPGreOlrBOSEJ+Z3gXN2g5grZivN7wQSFbRv/
         Vop21CsSAio//SKiaHz5C4BJVhk/+HXdTud8b3U1VV+vLFaM9afoG5Rm7w1BLNL4CevD
         jxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171487; x=1795776287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ga9s4FaYGlFWJhY7GxV3+5LLmF/e6Nq1LhLpotH2LA=;
        b=JF2OILpjxLZsfH1p+Gwpt50aCaDCTEcIUbzZ/m7G5dxEpo5Bpys5jpFVqLCUmugbtW
         KmOhjH0O7p/Kg5C+bomulf3322vihCWZpz29C7OItFY+9jZxNSDgcCQuHoU4bNfVGnwe
         lOYLD0BKTwR3ThdGvlJeQMc30nHqfWoe+8+QVMxXOlDUsum1zdtrEmY1CoNpvJlpwNzH
         MkHEXkHXnE4YZKUHUzu70/DBgJ+vDd6vkTD8QCxi4fkv4B8lJA6m3KopkJ77hYmv5Fur
         RUj5cdgzJS98ycLQI9syXE4VkFOOQLfIiPZ5pFKegx6+siY4fYfb8otg7++HTf4f5yXY
         aMzg==
X-Forwarded-Encrypted: i=1; AL+hErGBmQcMHbKOAIg2utmiOWxc9guwfyN7r9Ad5udTEf2WG7+Q54ZLtzkp12Jgpb0+OppEcNN2CHpI8XM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++UxlzjQZOBwPOYK5+1Ql6oI7+86XNgouHPY+XnqYakE+jy3qv
	T53NkcuCrdAPDTnK2nDfxdJ5wU49BuIqkOQYsBkGI3ujaOEd29F2H2/4quzzsueMRrvyjmr8CMC
	TLn2Z0rUYl9QPSuEXHx+i+Yq9k+/PQsOMahry14XiN/93TdPHbCyX2/EF6E3ezw4=
X-Gm-Gg: AZFdTZdQmulyEaKbISSpHLtg+BxBYujo/Jj1EEjj5Gr2nKJctGaa3eniZsAHeQr7yse
	gd8VY1+aAGmaxc2LSgfSumkKF4kPr4jK8WBHx6kw4OuwTLWtCCdfWiPuUuGDFWfFe/4YgSjYugU
	27LnbU7qiWdRXD+pNA3Aqn3kLiWa7NZPozp3YB+piOwcq5t5tjqf49Bsflsup2wqwAxH++wfHRO
	1N9UbE2lRLIlfygnz0Z5ZzihnDP/KsCK7bPNsDYQgJ9dnjj/OTqFeze/a1GDUTFWLaLl9smA4St
	ngnMnRcxs+zbd/6i5+ZL11/TJyF1upNEOEIwvxK2GsRzhdMVQD5XUxM0w7lNleo8Z88nEf5x266
	HwWdNOALQaBocWB/Z6XIhMoanjQJEXfgVvoPGEff49NUD+VrGXVTrf9L8HscvPZVPZH3z+w07
X-Received: by 2002:a05:693c:80ce:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-3856f254a24mr2275337eec.20.1795171487255;
        Fri, 20 Nov 2026 02:44:47 -0800 (PST)
X-Received: by 2002:a05:693c:80ce:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-3856f254a24mr2275321eec.20.1795171486791;
        Fri, 20 Nov 2026 02:44:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:14:21 +0530
Subject: [PATCH v3 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gcc_i2c_tsc_support-v3-2-e631872e670b@oss.qualcomm.com>
References: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
In-Reply-To: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX9wIUttEpckws
 wkv8AMrOrMhASVYFpDNrKxkIrVUugMuE8uko6pWrbB0/aTWt6/R5bPhGb5IOTS52t4xyLtiWapK
 +m+UC3brzKxKwv1QxvUHGCHdOMDro1Tbws8TDXCOlW7C+EagNorG6d6rZs7axgS6m2vIohEHUjh
 RxZn/PdxOdmZcF+SVuHMB5X6KctyL/SH61ieRHKYw6yoQRC1OZyhUdzB3aiY0/UJF2YPNXJ2hpL
 uhYi8e9nHeqssWZ0053Jae1nur69v0zyWZH8cnp8FJF4dUaFH2jbycuC2v6SrNe5q7npCBXsqCc
 lN3b7LnlJ44pjBdXvtJ5CgYxUnTjKXDG53HLgEND0ugwjYKYDL/vXLUoFwXk3SXE7lQ6sd6QeVg
 axfLefqFnTX+NlblcRBeP2c9p9a9AXhLNwb2EkZ++fNvNHI1kHnaHMqfYDncp7Vx96FNr4sq3D1
 ABxLREBOgKvpJwrPKuQ==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0024a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dmjuMl4sYXMLEaQzlHIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: KetzyJGkcQqgmpnJerXacDiTVBvBk07l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX1EfcpwqZ5tiT
 /sFl41ueCQ+HvRWAdn+oplc0kHyTIhO0l5MSAKUw4sfbAtcSuYtsMTt6DdRfjK4InN3F5PiQeRm
 rx1W6PbRIXuUu5L6CXPpjWTVwC/0Dro=
X-Proofpoint-GUID: KetzyJGkcQqgmpnJerXacDiTVBvBk07l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200042

Describe the I2C slave and TSC subsystem clocks, reset lines, and
parent PLL needed by the Nord SE GCC. This permits consumers to enable
and reset the hardware through the common clock framework.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index ef97da3852e3571db5c34676a8f08b9650d1e4c6..256d3c18201b4fd0e48bef9293cdf78fb329ebe2 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -29,6 +29,7 @@ enum {
 	P_BI_TCXO,
 	P_SE_GCC_GPLL0_OUT_EVEN,
 	P_SE_GCC_GPLL0_OUT_MAIN,
+	P_SE_GCC_GPLL1_OUT_MAIN,
 	P_SE_GCC_GPLL2_OUT_MAIN,
 	P_SE_GCC_GPLL4_OUT_MAIN,
 	P_SE_GCC_GPLL5_OUT_MAIN,
@@ -74,6 +75,23 @@ static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
 	},
 };
 
+static struct clk_alpha_pll se_gcc_gpll1 = {
+	.offset = 0x1000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x57010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
 static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -189,6 +207,20 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
 	{ .index = DT_SLEEP_CLK },
 };
 
+static const struct parent_map se_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll5.clkr.hw },
+	{ .hw = &se_gcc_gpll1.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
 	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
 	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
@@ -670,6 +702,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
 	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
+static struct clk_rcg2 se_gcc_tscss_clk_src = {
+	.cmd_rcgr = 0x2a010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_5,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_tscss_clk_src",
+		.parent_data = se_gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static struct clk_branch se_gcc_eee_emac0_clk = {
 	.halt_reg = 0x240b4,
 	.halt_check = BRANCH_HALT,
@@ -1079,6 +1126,34 @@ static struct clk_branch se_gcc_gp2_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_i2c_slave_ahb_clk = {
+	.halt_reg = 0x2c008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_ahb_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_i2c_slave_xo_clk = {
+	.halt_reg = 0x2c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_xo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
 	.halt_reg = 0x57040,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1456,6 +1531,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_tscss_ahb_clk = {
+	.halt_reg = 0x2a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a00c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_cntr_clk = {
+	.halt_reg = 0x2a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_cntr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_etu_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_etu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc se_gcc_emac0_gdsc = {
 	.gdscr = 0x24004,
 	.en_rest_wait_val = 0x2,
@@ -1520,9 +1646,12 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
 	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
 	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
 	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
 	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
 	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
 	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
@@ -1560,6 +1689,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
 	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
 	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
+	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
+	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
+	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
 };
 
 static struct gdsc *se_gcc_nord_gdscs[] = {
@@ -1570,8 +1703,10 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
 static const struct qcom_reset_map se_gcc_nord_resets[] = {
 	[SE_GCC_EMAC0_BCR] = { 0x24000 },
 	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_I2C_BCR] = { 0x2c000 },
 	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
 	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
 };
 
 static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {

-- 
2.34.1

