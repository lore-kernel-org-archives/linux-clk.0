Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D106033F8C5
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699953; cv=none; b=haNpoERZsrGClomOxKYSIHDYAbBWA2t99SzyhDcoKDsnGPdI7hdLJAewao95ItU76WnYwYcQL70bMcFQ3IbW6uRq3gI1u8vfzS0J2UV/1joYoi6+X+MoBnQkbHKtajyluOVXV5ZEm081udnxswIG2Fu4h6sjOPIevdZLuGbfwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699953; c=relaxed/simple;
	bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i923w0Zt2QTBPwbBXPDimnNw/LqpEum+tijH4tXBYyX+XFP7V7cQCUdYwXa4nbASjvUW//RTCCJp2Y4P8SNDPz4LDGQGGr5rkipio52HObxrBk1pCOHh01WWYaYwGKoW9306/1YfFXrHhVZd1sp6/WMihX/bPwsp2zaiPCL1dHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rsk86zoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SleYJRfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rsk86zoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SleYJRfz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53alv3662156
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=; b=Rsk86zohmWmpCx4O
	C0c74hsIHQFJnqCTgRvf/oxOlx77q4SuZn3Y7sBF+GQ3xtk4jq0l0mIoATe5J+Dk
	RlieT+efHiuTgAAV1gDvBQCT1i0Ng+YTGumOVPJvxaMTGaoE5t+0BqqNxiBWaJ2v
	q6AOhYDCxW14voHiPM8itu53K5bU9W4XULkbu7qM7TLIuJ+jd//S5ZtThTQmktX6
	KXeFc5sjSVaNlQq10AnPshOP4U0C7ZgzY4bkPhVmXysW76IxmmbrLWgEs3FCmtSv
	RqmnIT62dUKrWQAMkMO0pB64tm/+I/3Rv9s0JTnVtWXRAXAVV7nmTNpP4jpwx0Mh
	GK6Z4w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2dsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:59:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso12891891b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699949; x=1785304749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=SleYJRfzlsbzpZ6RCGuNtwHKlGeW6OCpetD86RzSMyYzmZKob4zH+XTMfxNJBhE83Q
         3yi/ZBr9slXZHUrzd81uMg3LbaXyQ3HfozQpDrdDC+mE4RQaH+QeeC8d763ZFe11/M0t
         mTGa1BiQWu0DSpj/ze65zhPpCKSZXXpTxbd5xkr54kPxDFGSzzjqnG7ejuEKxRz/AChi
         aUJQPUNdp9fNMWpchho0aSuOnpehSmkOIk7hq+PhmPP4qdkGFuB+3HAOTQk4pcKB7cMC
         XHSWm65HQTfOWpV8CK5ECNe+9KoKktOAo8bl9waZsXovOu4yvhycSNE4btqRawm0PdDB
         Ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699949; x=1785304749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=WKqwoleCBOGJ+S3IlXEOd8bhlvUjcoLvTmdXYWbU0mldajp2DdCsUH1V9Mo1AbdzK7
         n/mT/SIgLSCAKehIa+mjDKcSgLMuMzX7i5/xMm4yYlERlvzBB/g9R3fPS3/Hj2PJOeIP
         qoxyjJLq/2/Uuyln6oDy9YI/d+sCL+uBJEdCZ8QWJ12LxxkhxnU5EEDTDkbkG0obKiby
         M7twRoaOL2md0wQRUYXM9XMlr2TsiDutAehwsmsiXem8ZC4KiTMUhwm5q7RAxpY9Ci0k
         xzUo8DY4fwZsXCxBW02Iu7qwmpIVOBMNpOySeAMIWf3ZDw1NLEhEqWPSNGwkYkgUKkpV
         zFRw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf9YhQteuwbY+K7FtoxZD7kug8pao1JWJoPQjkQPovdk27jFb4lhA16wBO7WgrvXS+g5yEBD/LDgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysC8BQ6qE7wzHBO2yY9vSEfgA+d7BYkQk/hzb1iguRwv/dGWm1
	q8MfGW6L3mKhIQeGOPd7bFe+PFqP9Vg0zpWJHLtPU6z7PgL3IDnv0MOuAiYE1peH40kcBNTYXIA
	xWU6gKO3pbs92EteVhMW1h5LOxeJqkpqQy8rBP17M1/pHMctUrCexwmC+2IWJrmU=
X-Gm-Gg: AR+sD11UlCGvyFVUcXM3N7raKvH+eek6Q4bk0MWIOMpql+9R4Fh45REvedtf+Qya9wQ
	zgNnKdXn/q1RGcwjThPb7XmN3S+2LsLd+C+CEbYT+tlK8YsG6VyOMGM3kijBzC5HlDz83V4TjHB
	2FLajGeDlq0vOcunA2gsvdxlHdYQi96weMr9HLa7sAjCQ4WFFTP3RIgE8lazQrRwZA3UANuT8Yx
	eymKV85WRU/W58vTa25op/IGWICLyuseAPB7hs78zSA7/K7XnN/CRTqpGBM/rmNhdOzFebsTfqD
	s49Od9XajmNp5E1RCBNti/2NU1efUUuUZ20HveguQCP48Nv7fLpYePcjPCceCeRtztYtAlj8DpC
	xwn1/Pv9AtRkzdT6ZJRt4peSzotlN8QJ4ylGBPfj5Mhc869U=
X-Received: by 2002:a05:6a00:414d:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-84c29444de7mr22076432b3a.31.1784699948985;
        Tue, 21 Jul 2026 22:59:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:414d:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-84c29444de7mr22076411b3a.31.1784699948552;
        Tue, 21 Jul 2026 22:59:08 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm554013a12.12.2026.07.21.22.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:59:08 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:59:01 -0700
Subject: [PATCH v10 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-tcsr_qre_0721-v10-6-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
In-Reply-To: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699937; l=1658;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
 b=Kzy6BE7dRky8sbCMSKKKiIfUCmD4bhzi5gUM8+Iqx9sZLbFR6w1mY0kjFPg6ecfOYSiCE0CQo
 UIlyRRZ2VaEByFxboaqH4QiEkXdJyEdztElpUewBTvD3/VooYuaOrfT
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: kiJBUrURpzDj2cKndqLZzUgNGhxtiP6I
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a605c2d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=n5gI8yOKKvUJs91qd4MA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kiJBUrURpzDj2cKndqLZzUgNGhxtiP6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX7gxtbDLSR+fv
 PMF+8z77ZIBb2V59rCZhqvtjvI+0ENgNeUnXg9nQPookd036CpZofc8t53BlLMkmVmysAYilmtP
 1dxQyQm2Ma0sV7AlZt7B23slHe+yfeHvfXos5ECRq7ARTYXyosGRW/nzDDonxQ+5RjsxaJ6xZCM
 AOcZA8GbzoanS581FVwaLX2OhTGL6PHw7iUAiq3MNs/bnL+hoj8GSBvMBn8n5XnQLfXPjXH5N8/
 iWDWVxQHfdjRqpQETgNJyTXLlh4TyYFhCExjjn6MNYK2g0cHzFyD1VLNsSUSnHOUpytVhDQptcC
 XnlnWrBhkKvzkZfSQhoFULZfJh3GbzRUD4y6E1SGMm0DMiMod728lURL7G0t/1c5I0/QuHU257i
 MRDPgtdK7FyLvcFoI1lb2e9737MkXAlENti3ThDtFydk1T/zgQxjXrlXJyhTv1hgwGqaHV8JIaF
 5v1VBWK9v1vjNtZ+FWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX7/EW+iza8ygX
 dD1u78QZ19W+/NhWtApahY9gDvm2kdgz/jg9bmLAIpAkJLo4NEbV/zl9uxddOqOW9zhYDH8oJTd
 hOAHKrc4NtjTiPDeND2jw9n4/6Tnrr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220053

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..44766a73b0d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,23 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

