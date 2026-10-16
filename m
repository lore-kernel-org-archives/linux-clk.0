Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AA361DAB
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141954; cv=none; b=gPCAkNkosYM7LtBss7i9qEgBWJ9Ao1szZxn5uKkazVkSueTIhYGW0/SCFp1UIi7jzEX0532HC+XAqlLPD5FHG97XO4xIFTah1L+8aEz4g4fNIVwPd4bsGT1vttLhg2G6+XNQUSqO2A8bolvcAFdRbWtng0NFWmF6OcUA3ufI0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141954; c=relaxed/simple;
	bh=g/gsbt7EIm1j7HvPMcOkx0nfYt2JIOIMaAqDBNU31qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rfa9G7zkKCE+QPb0g9xAxz7Odp/b0Bo5poEGajwLdC2O0O7eAsFVpP4T2l4xHJrSQnE7n9U18+NvCUUWO8MMNo4lU428xWhq2vyD3WKw6D7H7kLxqwhQS17SVWMa63ENhoLp4CCCNGOWFvFmurAbIcq01hO0lySCVBtbOHK3WIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DunqSjSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc6km17f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DunqSjSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc6km17f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lHL11797626
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=//RczmxSMnpxOSf8tkC2k8
	XiomaCqlwdhQzjMC4NzoE=; b=DunqSjSKYXUnTpLS4f/pVICisgQAdryBVVAeIw
	w71T0q01frlwN/OAjBDjwYrhv276xg8wvPBhUfBucfa60Ngu0Z+7akWWTH19d1D7
	WuyjVIA/89eYGunc7igjNgADtI/0CENBa5NYEwtN8Lu9n6txorqWQsVq8Mui+LTE
	/xr8CBOGGYuM/d2HwFyrNR1LYFZrPGaKxGa9/o+mLbvCWsZ1HUJ+narmlcZctebI
	5nBezS+zz2GYxyQiobp94LWViop1dFZXBzFbkUOCTNA20SmkgCfO50Q/mn4XO51m
	lLRso41f2rpCTiPS+iQHE74AzCXNQdm5HiMQCXpH/YBfEZ9Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a89vju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:12:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so12701753eec.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141952; x=1792746752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=//RczmxSMnpxOSf8tkC2k8XiomaCqlwdhQzjMC4NzoE=;
        b=Vc6km17f4nZm+y3ViuaaNNGuzPX22fbbq832hVyi/J8iFeFG02gTswVwrGcW3Dvrcm
         FXx3ka/Ebygxgc1Wx1yosl5vRFbZTmwkLcDwc4HyJKNz5HhxgMGgHIPf9g7nlRlm+krQ
         cBw22HNrmnto6R9SD577PUgf+WCeeY7nlrk1uvYW5BXXXZHCGp79fh1wOJOEmxYS5ttT
         1b3nd71/lbL8bmzs98Q5YhcAdB0g6tXlO9Bj7rTK/JAVaHlZKbfffV+ytLP47IYRKyRU
         b3YznDBKJZL3pXPjzR/E3cJ6wpuW1Ec19piNkJ3Qcee4+S5DlY1byzaT0QxxL8IF4N76
         N9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141952; x=1792746752;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=//RczmxSMnpxOSf8tkC2k8XiomaCqlwdhQzjMC4NzoE=;
        b=c+BtuVVFOHcUILmrgukwM2KsmtwXrUUhy+tO39GVWiibW9qK18Nxs1c4d6EyjCff+T
         7+36N4VeO2vPexl5rT4dxkmaCaSKBS5vG3SKGm9WA/1KF1EI4amImgpGNH/6uLrKOS+b
         qQwysmBnXuBw2+0XDk5a5dkcW6lMlEFFiLS0bkgg9GpL7B8knd5s/YOmDHqGqUqtXaJE
         OByEToYXtI1IDEyuVoA/lvJM1gw1sE4/ryPjcV5L9dWwD9zx4ZfHfa5A0lqpoH3oZRHr
         0PF2xaa2CUd3cQv/7/Z6Hp2XjMiUjew/jZAVzZddzOm64zU05XG91h9bNzUNgqO6/Srz
         2TEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKvPe+TudBt3Dt/md6WhcIj3vADAwlXxmGbG+YjtsPZI2B8IKC12keAcHdBPKb3ziBiRdXXAJRlJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/mUl39u3Rec8Xds3c0rU8P4pM9pgwqGt9HGA8XHuOssfPFXe5
	vrFrmx4Uero6A+ugbvkvjyIe7hBT3CY4FUez7cEhV61EspEbjzg/pp3mYv/hAqIfO1kWqiXltTk
	00f1nIn9Xna7Up4RgScgYBxtHNDLw04HYlHTb+Wj3xiRz/nEyKqwaRsbRtI+VEWg=
X-Gm-Gg: AYBFou2oNRBiAYmFDeYcIgOMi7DV9irwnopKCF4r4yihqleABWserazRn3emghrcD4/
	BS0q/ZfTcp4498GX6Cs1CRkDT7mmG7R8alpNhTXGNEF4hQupeyF9w1hPsUPaYV7RBsdAoGV3Pxs
	2+EB5z5ygOAyNHoxZAKxsKP8LVaWHiAcOOTvhFzCS+bzgZj+VjPv6clkC/1m4jrOzZOLjhTDPYh
	4hq6hFlTOopc8fCbdseF0efisw7j054iiuK8Sgd+daSKptBjA1G4dRSfeV3ubhj6ytD7C8GZZ7d
	klvh0giMJZfnebnGE64c98kJedY3yGnZcb0jMsgsbQVSNPRy2MKSxqP9ZqdTlODzF6NC2qwzoH6
	k0bBVDfaE6znjMJhFiHI60EFXV8lPTyk=
X-Received: by 2002:a05:701b:4286:10b0:144:c128:4c4b with SMTP id a92af1059eb24-16a5e49c474mr28272716c88.36.1792141951634;
        Fri, 16 Oct 2026 02:12:31 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:144:c128:4c4b with SMTP id a92af1059eb24-16a5e49c474mr28272690c88.36.1792141951006;
        Fri, 16 Oct 2026 02:12:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm4917628c88.4.2026.10.16.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:42:20 +0530
Subject: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHPq0WoC/yXMQQ6CMBBG4auQWTtJ20VNvIpxUac/WCVQO8WYE
 O5O0eW3eG8lRUlQunQrFXySpnlqsKeO5BGmAZxiMznjvDXWcw3jrDxklvHFfcFbeckxVHC0EOP
 dGQJHrc8Fffr+3tfb37rcn5B6DGnbdnioqvN9AAAA
X-Change-ID: 20261016-talos-gp-clk-freqs-update-d1ec0627ece2
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX3l3lES2/3RFN
 OvPMxaaMYsXFjkUERlzrFu+ZnnF/sx1QS0OePdimF5KNe5TcievFRYBCacjP6MP/UnWYmvUnVss
 79XT+dCLIvid3DKeGOkEEOksL52lnOE=
X-Proofpoint-ORIG-GUID: Wqe4MBnUiUm_QWXi17lddSV8x4WstIkb
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1ea80 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gyo2YFX4Vz0PmhbgGKcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXwPtSWOd4L2lO
 1TtZxW+db34r+vtYrmbvW9CLdygpsnMYNuioB8sJY/Nch8eUPZ1BI00fhi+zTyLJGODeFV0LMss
 ZzQo1fPA8EdN12a+IZzmHzuRk8W3a51xve/CcPQDX5gE7HYfTkz8Tio1B3xigyrstvnacf0hp/r
 g96durpFyk0if8hdnE5wwAjQeMr3LTnGkHRFkI0nCeQfosbmMbVT5szPXmS5u9PUocNIwnDDFHE
 tSIrtrb15xzAPfUYw5qrm1KPvN6jgnmtmp2lKZDSEKtEAIewAq/tm0Rwz3QQGxhkPOsbdaPybpW
 QMNmxNK4z29v2X9loTNyHwctqJs9CEwGKgF+K0xLKTLXDvCbRm1a/AtbABK8yEhvrwWM9hrORWG
 upLas6S9rXMLJp7DACPuBbBC73Wff6M854Vb7hPIDhoed9j1Dvy/peIHJPLUrWHSj0sfEyd2d6T
 as3pccWNRbY1mAqNHdw==
X-Proofpoint-GUID: Wqe4MBnUiUm_QWXi17lddSV8x4WstIkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

Add support for 10kHz and 100kHz GCC GP clock frequencies required for
display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf..f205de3a9361 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -419,6 +419,8 @@ static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(10000, P_BI_TCXO, 16, 1, 120),
+	F(100000, P_BI_TCXO, 16, 1, 12),
 	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
 	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-talos-gp-clk-freqs-update-d1ec0627ece2

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

