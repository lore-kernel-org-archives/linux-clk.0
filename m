Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719597;
	b=t6al+G2THEQGd4lguPNuf8/YmdC8BbdvCtcwsq2fnLww2e9dMLO++bfVJceIuU8Hha7d
	 21+QXo6tqMUkGrXbTK/8UjkeTxU4PqByb8Imy85KGFOAuPOfd68HJPyd3ot0lJIEh4S50
	 IEL3U1ifBuiU5fI+rS1BDkwsF6LctRx+WLC1CQCV8r9q2V6I3oxsm8bYosc9BALnjMjbk
	 5GBzAuf1z0OSevOSvzRo4/fLWbdX8ba0Mkh10RbcxtkGdei4+Ips9G2QiDNGc6U6rGHGF
	 bWCAfEiozOAKWqgBWT30JUjQQqhe2iCUAizgP5qiw3a4qSPPNdMkzm7qsiCRQG7V2wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
	b=ImslmbEwTT9zaR6KK3IhlqIpFgz504E5wPbr4xFJz0qb3GLbS1//uy8Q0oAEG5fkQvvq
	 ArLIxFeCHd/VP9HQ5Nj9OeBV/fXwtRwQNXD7V0yRF4zARV5y6ghi8ZmfVXnI5Rnn4D+BZ
	 FmRMQcnmdNv7sh5s6MayYLT0PyqVnbGNVSpCustojD82CoIECh7ltZl6HRuRCUnMKzncf
	 ENnsbVY/7GGrsgWMks303uy7TLHZOpc7fUhoFbIYSBEOQkwuFVz98aCJDhEUUhTcH56Ya
	 bvUYSEyBWYv4IAnguBccsNqAby0HWU5XLiIhcNrMcQRwPSa7nJiIYi5j7qB0/6LyyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acmWy3sq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70878606A326
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70878606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acmWy3sq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFv2So3852174
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=; b=EuCqEniAuaycpS+j
	QAyhLkuo95LaWZ1vhIxVcP96OjX57gFDo+foNWMeoJQlj5vjDv/WKuOlh7xvDlVD
	3Iy2f4BnNeIOnXjudnz1p+CmNnTuT2tKhQQN/H7ORm6kgASgScdB2f/eHJTmTDaT
	5tGBhEqmfaow4nB9bd7Mi1GkGOeEj11gv4+Ga8v1u7qSwku337TrNk/m/YMXaZtE
	OY1xY8Thz67zyEtZsF6jj9B1GKlrT0kn+m8tLhvgTSSZzsiFhMS2/11XgexFWiVw
	mTAJJ0rHOFQeSqQHM54PkN1bKCqMcPDIKxD1S/eB2NfTX16C0RylWND3gdSbPJ/K
	UxMdMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7ga607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so5052167eec.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719594; x=1796324394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=acmWy3sq5XAUOhSRIvAKpjUEuXIVAdv96s9ET7FVYcn8yRWVuapaFnGkFUNXAAzLbU
         lt1KG3ZAo1OW51krIM2BltPE6OURiMKW+u5Z9NAhTNJmZR1hVKUbDO0AGHtf0edC++0g
         cmIrR3eHPdPaBCFkBcpuCuEr7pSa6aYXCaULgPoHUxmmOdFg63EqwpRmSsJ0jxG8PlBn
         TViUEFD54aRIhz4OnHthgM6lvDXvrN948YbeJ8xLOc8WnkPWvI7+2y9EnaXZ+MGLiF+F
         b24yiNLLtdUMEJSsDCKhQ4QjiSt3YOxOvrP5arqL2pOzRRb+Q3DlMcepCqYfgZejxZkW
         i1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719594; x=1796324394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=OXRY5K8C+CPnHJe5RZ9bqYzge03XBdSEqIT9uhtuoljP7M4O8vAiMwF9EpWdiJxv+A
         zm8MDR9XBjXGFc1d/nyzmFL0NDkSioYHu1HYO033XEJf9YpE6pXb0HAYmLgNz/tMp/b0
         OZE/SuWXSHcVY06gBdSfty7hVaUtji0mwntqFvbKyU5SiK63PoHkcWSxJ7JG80kRkKcm
         MJqoKyHZE4BoABziHK5oCRW6kdC/JiZi5xZgWBMhSAHiPnO4kA4ag2mMtHneWlDi5pXt
         0+6hQXPWc/WGTElUTT1WCh/Dq0U+odF4IBGPV26HQ5SGmdJmVX5la/7chitbLrkSkpzT
         eV9g==
X-Forwarded-Encrypted: i=1; AL+hErFpwIq8o+gwc19uO4mpS4e1Y8TcrHOL7mTsxuZEN9wetQN1ghcMfSsC1RnTmE/PSgfW8S4TmcXXjS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vPN/ncFxD7e4W2bm9tlEDlNEiInNNrJNU+jSUlxTaDW5E3cQa
	R7abT5Ef7oi3P2nDGbcLjCaqIn/uNnFu5aw/YkeTN0EWNCPDKiYNlb5GuqNssYKrrqHgXRxD9R6
	sj4psTQ2AQblvuulu59zf8lDK9ZK7DXX6hVHMBTYaaVdSW+KZ+oQ1yqw1UD0xotY=
X-Gm-Gg: AZFdTZeBcsBt/GzXpbG+uNRfkw4KNEARJUSkngD9a3kdfx8k6SulvYtXFrRZhS5vwPA
	/Nh7SyxXFUHgmYT0qrdb3OoVImiKJ0C5OIJWnaVWvaWNtxnT8GBVpW3WvKjTwXbj9La5XsVrYT9
	u/Hv7I49HvOZjZKI8XrpxlDuXbIF2FHKgAepUB33ZIjBrLURe0N+Bltp/nfyx9lpiQX6hEHd31h
	2d3RUgsRqLV2EHZ8iWub9+oVW2t+vBfWilb5rXyDuhlBzGK6IN0n9ZopPR5AibhnEB1shAvAdOJ
	/4kY8lLP6/tQ/zhMW7NRbZkZ3/RecTiCXOOPHZo2N+6X5AivZSNF6YWmflGgBt8N7NO1YiHwZaT
	JQnqXjEGBXxE4C2NlYqCotnG4GW1zDEskNjVy2uMgAjoG1X0bBzkhEIEqcQcTxz+nEJ4yk7P+pF
	Vtho/a
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23679989c88.25.1795719594265;
        Thu, 26 Nov 2026 10:59:54 -0800 (PST)
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23679971c88.25.1795719593789;
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:10 +0530
Subject: [PATCH 2/8] clk: qcom: gcc-glymur: Register set_hwmode_dev
 callback for USB, PCIe GDSCs
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-2-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: jJEPSD3p1Meaw8mjmkSGkGaBOawDaO6c
X-Proofpoint-GUID: jJEPSD3p1Meaw8mjmkSGkGaBOawDaO6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXzOeNLLt4xwTI
 TRH/YDBowyIdlyfzK9pRakWCawTbIsnxxuT61SnWDylvySHNYMtjd1jTntQszNuYFV57yrjuKll
 13d2W/Q7npm/p7FfpH7GCAC8iiYgp8Odp/9e2YOe0gaUyoSTYy7cwqGYPykxw3dzMPRrDQDt1Oc
 WSo6A87zH5nlrkRF3SSy7tiLgZWAJk3ER2jJyp18+Mwz5xf8Tk9+B2viBb+L+NVqAR4i+Ky/1H4
 V1YZ/C8JXbO++q+60f0KOr+y/Q59qwnv5NN5knq3i1GGwjVMRZzSesdYNGmjcshwZFyUbxsBuMc
 Fahg+sU7vQpxOQWkWvXJ32vXJFcG/azCiH8Vkb7goDaKRCiRuwctKGySgvBFJBGRsPte+B6eFop
 vmACpCCvTz+xexdpDpBXRv5wP2RcROOedHEQfWlw9Kmce+o9YUiyAn7FhtmXA1vlYfiI9VCS7cs
 LbMcQTCLCCLKr1J0R7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX0klW0gOcgdnI
 HLxxeZnuF5VH8BkkOPJxJqe9dy+M4LCNZIDMAm1x98xaD9ZBLvW7kLNxEM0Qg4BsZaBqHT7Jcj5
 07a2exehAH4hxBGQsRf0XCEVpyVKYBE=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0881ab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DIGDBJpTELtvEum99LgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases. Also drop
the PWRSTS_RET_ON flag for USB GDSC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index d8d33eff419eeb9885f8560c2c7c71d542371658..73013133fa27cf0b908a8e5552a6fe981ab197d4 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7557,6 +7557,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7571,6 +7572,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7585,6 +7587,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7599,6 +7602,7 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7613,6 +7617,7 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7627,6 +7632,7 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7641,6 +7647,7 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7655,6 +7662,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7669,6 +7677,7 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7683,6 +7692,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7697,6 +7707,7 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7711,6 +7722,7 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7725,6 +7737,7 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7749,8 +7762,9 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7761,8 +7775,9 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7773,8 +7788,9 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7785,8 +7801,9 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7797,8 +7814,9 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7809,8 +7827,9 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7821,8 +7840,9 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7833,6 +7853,7 @@ static struct gdsc gcc_usb4_0_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_0_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7845,6 +7866,7 @@ static struct gdsc gcc_usb4_1_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_1_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7857,6 +7879,7 @@ static struct gdsc gcc_usb4_2_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_2_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7869,8 +7892,9 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7881,8 +7905,9 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7893,8 +7918,9 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

-- 
2.56.0

