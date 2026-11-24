Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550539;
	b=eydDijn5m07Kn7aa0BX5OJ0+CBFSM64vLT1mPnp/M+7jrMgNQPLMHNX9Anh1+B+Y6cxU
	 K3dwbnzp+HJf6qjM1iO3qPFYB4buwn2GQOIog6paXHCMWARphQ4O9f/eENLNK55iuSKUU
	 lteydAyBk629SJEGeiZng28BAtvILi9ROyQGXM6nk5CzZIU1EIckhlcbg+uhqvr3zoSp5
	 DCbo6l/bCJgzFSeX0V2ebmtKccpZ9b6I0Ja8VPHWK6yk9QBwPJsbvtQd/6kC65qh/fV1T
	 8/6f/CxUPEEIDCpx1yo9UrkRWXaGGpxKLPLxnR7fE2rY0QPX5KrRZfPCBxk9QjfJ28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
	b=X74Q188+dhs3ZyLXFbPa0oPmucMG0K2zM+7LZVY4LHaSTjs1V/mbo/DgSFEmxnE8aica
	 64DALYrVPEUWK789J80ZMr7AKq8LOspBsTJFpRySXwcQIUT0mfiRPE6RzCcHYb1002n3m
	 N/s352LsHqgPJlWq/Mzb6xm85WIlVreVdJ9esJ1xHrrpmVJjPyKC3AHwZ4Q5Qbbbbkb6x
	 bjuhxnyw2El3Vgtde4mYFoApIVXApFajXqBzGMiH7Kug+2rinymfNJxB5ofoxML70EZC+
	 IHDBS+IkCT1Gvj4tkRrBVamQBHxKpmJxCq+n1iMRheq8SMQeDACwEBHxNKYgUnV+jmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5339606A6AE
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5339606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKZas2855050
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=; b=i3fp15zKSnYDtfXL
	12z6eUu4/VTtjGc2lcePyiRftP+y61UDo/+pdLMNaGNwYcd/TKw9SgQizYgxJoIe
	lfWeNQEXGsVa3FdDN5IqqSx/zHZGfv5Il90dCdpUlK+TOoQ9hy0AgY+k4gaaCPyK
	BIMYh0/ackSVhDz8F/Lka77G1RDzM6dcH5kiunCEtDnT9xa8aFYV1WDteRS1KT5V
	0alo11H6TY/2h0xEO6lMSCyRqQObC9BuuH3XsbFRmnUUn4crQ+NCPKcm2pw5NunH
	ZZYNNZLCFpflGr9lG/WUB405kmPWG+8THdm0Nwv6iRHe/iMPVwDeoyjr9QCW/xMR
	cEpLnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf859n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a4540f2so36080785a.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550537; x=1796155337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=ixQDEJ+Uq+T+W8OUIEtBUMjm5aQ4+HEzuyThNyVxQIQonsgavURzKyN9NmortfJIQt
         0Dx78KJ1sUICPxrsl8QChOlIb/rYVDuQao7w71J6R5OrCLDznmzUbuxRmvfAGdAtRowO
         upciD05H3e1oCVrqt7EhITHV84xVUkbZvFEdbTljnk3a+hqO2+9nsDjssgmGSddw+tD2
         yujYzQ7WqscaUTMmKr6bfXCALs1NzCZPeCHwAsh3t4K1Gu4EmzuBvYzXm0afxw4C2KqK
         bMZolIahlZKqeBOF+uspsGn2eWp/nhYFhZpmtkNwtD95Jr+hfWXGRq0Jkp36gtTDHgsO
         3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550537; x=1796155337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=2rM6RSuvolJrYi3f/sjN/ThS7saCU12iaLcAJ1DJou47nU9hFDUfohaJTDAnSi4g/f
         DaxXDjjTS5ED0S4bsSQ4DiFsrZ386dkdsUBDdInufy/siyvyp0Rcaba9IpTDLwd6s0QM
         8iaQTsl5+C2nWXkQe6dQwRvXo8gSQbFJtJTV65BX3Asik3veNldL67Sd74rs52vJ3m9s
         tkbkqIiT5IY0zZV7rNVSAOaWahhwyngAnkWwUX3w5ru9gB9jL+vYqWOBRqzUA7cMRLBh
         cnds8P0QkZ73dvAilLGFo2VExrUXPdLsS4M4SRaWJDthIEql4nvGu0bBkE/2HOqtRnNI
         UBpQ==
X-Forwarded-Encrypted: i=1; AL+hErE34XeTpfage0pmVc32LG/oYYgnhXSH4WqaX6ceoSrtdRp6iVAbSvJfKKbxel7appPePqhVD0fzVB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QZPz+Eryly+OrswZJoi82HwDwKUdu9OJX+Ppdsq56iBT8LfAY
	vERAttlrALiFAhGwmM5TqhFMlppDdvTAmzmtGsCk2uN3//H4BnQB0LiRQHdWoqvFpFUXxOmg2Ow
	PKZhbr9cO9KrwF98uAH0DntHxzR44XEvIUqbAYv7X8DQ155OtFEIoMqHx5sYn3mU=
X-Gm-Gg: AZFdTZf4aocTeo07e43/9Iqjwe1CPCovQmEWT0t6jCwPBT5ZPX8nXo3FFg24mRaNKI1
	IbxwPa9HplhNnkJtRgGuVI/eVucyd5chftRvSg7CQ40g+ZbY5Dw2E2mkggZmDbn0xgBtj5+FtHk
	+o46i5PKmFbAfiUh0V9/AGO7tv263lIB6+IGw3ZqjHGZ0xW21uJ/2VV1rLKceofF4sjqmZ1C2xz
	Aj99PUyEBGE90Hi9GnOmSl8QQrr52U/Q1a+mNZCEleFJZF5TLKIAghINPrPK3BzKPefVXoiCfgm
	Nu+5w11KmTk4ZrN4jJL9bFQd+dnVpO7W2keXcjwHermfm6+oNBfSa9OANcz4JdxFL1UDldlwouA
	14wgCy7Z+w4nriks+jIfBVuTr192ycF/jtsPTY4gExziYtLBHLieAEIaBul66jZxAcpcYntDXWE
	HoPgLTBYA=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941328985a.2.1795550536671;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941322085a.2.1795550536057;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:41 +0100
Subject: [PATCH HACK RFC DNM 12/15] thunderbolt: Refuse to activate
 DP/USB3/PCIe tunnels
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-12-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=818;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=xwW3bA6llgOPKSqs1BeEuZQOAAAkb355SkxSOtj9lcU=;
 b=z/91Ffst28wbqwkdjx3GfJSrokIzn34lkqLhPQ0QHj3mOadUBYwq9mfP486m5L1tFwqCcuKFg
 U9LW3XliwnnCDiVva3RM6Kb1InyIgYlgQjJ+9aP6K43DNws8/DYTDtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7QYGgPm1g+IW
 oPdH+iSmxC00sTU5GbgK6Mj1sw/ln2TFyksl38SeP/kC9nAeGUfvvSoqwr5QTT6Qgpy8shcT/10
 uPPp953RH5rhWskfbsuKPPVjsOMCCdQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwDzLJfa1Sh5M
 mv+Te0QZicoc47PscRodldcEkjS8rSdvDD4rPfonzCRl6ctCbfp82IxTvLBUwtXdzxbi3ep28dj
 RQmwHr46zy2UEtjYxB5DxY+M8H4rXC49B7hmQ80wVKkFIljWyUxF7eKgj5iKsspvF9GNUVHQews
 P3UKnHA0v2NBwHyHRI1NZ/XLYLBzLzlenVozP5e8xbaQR3YAFWNn+4mXIv9fW8G49a5dRCltmqh
 7Yj06XFk2JPVWNrPqHz9U4q9q/a91si+pjZOE1nm4Vu9/u48qAzH07KlfUzkTV/vCD31NUzGcGb
 XcihsBsE3MZJeCgbFmo6b41fYdDU0c13+K0pftvLs/e+0DcHi0j0Vodj1ON3z8Hz8hfhecsNxnA
 fWEyOauYU7Y0hfzBEXEUjMr1NfpNS/stY1pYWNR1dCHgwH+IZyl5mM8G9XqpNCs3U8sEYpIx6jL
 ae2vlpqxztNhu4p2YTg==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ed49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Jr2PhzqEZPgRj7HVupcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DaEC_WyOmunOZDiEOfwuollEhD2D_EzH
X-Proofpoint-ORIG-GUID: DaEC_WyOmunOZDiEOfwuollEhD2D_EzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

This is for demonstration purposes for anyone wanting to try out the
series on real hw, keeping in mind the constraints detailed in the
cover letter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5bb060812770a303cbf2649082a55..8b497da596b99d7f9d2e04636caa9896617af2e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2430,6 +2430,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 	int res, i;
 
 	tb_tunnel_dbg(tunnel, "activating\n");
+	if (!tb_tunnel_is_dma(tunnel))
+		return -EOPNOTSUPP;
 
 	/*
 	 * Make sure all paths are properly disabled before enabling

-- 
2.55.0

