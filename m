Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777535DA6E
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105103; cv=none; b=tDjntmklTjeHMPS4uXEi75x0ra5W1bPjkwqOziI20aicaXRylhRBjVCV4Uk+8jSp781yEn/MXZgbhC8N2/yleTltT6t+Tpp4w4x26ynLiBPvCzHH4+kgkBzVzwqCwe7Om2dlDbE5gd6JZD8sRlr5OBogIYbFhaoWR8ofkyeDBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105103; c=relaxed/simple;
	bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BR9wA4n7iaIbIUGBJgZUYcEVdLkzB2A1uQg+tAIHYl8E7uNroHEOXlW79zPkJRH/gKhwzIbRzgwxdprYkxy3/aC9kkbUsIeSyTVlvEUA+u8UUceqkHQvBuBbX5TiWU4be0MZNPQKP1r5UBgZMQ+fYxs03dBTg3HNO7qxxobAW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdrEeNpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4nemu6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdrEeNpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4nemu6y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59F4I2427850
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=; b=NdrEeNpt83Jla76r
	iSnMxqV2vobIs1RxWiAu4zHsqbyGv24INZQwQC2id+JJzL/k3q2RsbX6Fuc1Czgm
	qjuYAws2cMcNvyRWtc0UlFBw2t29eP3ekv+i44jhbC3tKDcrHRRUwNj8DkmnscXv
	wZvVVVkyDlg5djNG1fCr/EHkEy/0/c1kJPzoWq3ZeCgqhxkB0YfpgPSyoGsyz4PN
	lfO9XCaWV2ZycE7OPdvW75JEb22PQya8NFnrc/GUJuDCLyjcaPqwZegapkEmtk61
	IBBrlbsncUA4kyxQw+EYCc3hpiDU9QypddZd71QwLvLfVF5XCwdwYL7dhfrLM7jJ
	NUBgSQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtscxd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ba395b047so460817eec.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105100; x=1782709900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=c4nemu6yjGSZubCyu8abzOrfwf64SH4dLUqSK07HfRMef9JfsBxvq5U6xyNFXBZi1l
         MTGTWth9jeoBCAJXTmatTANm5vt712Vnz7l0c6YQcwSXfT8hs5Elh3ptINm3KizMwOBt
         iA2BDJH2fa2WtwES7cJBTBrr9izX/Fht0bj3DmEwVUt7BFCH6rmtuZzWN6fRxywgAYk/
         9nFHhp6Tjd3pjV/oO+iFvDD6sgA9eK+dq4ABKx8LzE/l0Im2tyGbwaT9oJebz0ywJzQT
         k5ywvnnzeVq88CvAnTXxvxQwC4QhbZlytsDxnEKu8OIK4PNLT0ayCfig4GyU5Wfr+5q8
         EPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105100; x=1782709900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=Qe3kCTHF3eV52dypdLF2r/veB0DYFX2lHZcj6HnGdRS9I0gEfCpdB+qpJn+WuL5fRS
         CpufBW5DyfGZkqyhUM5BzZsIjjpx+WiOfjH+cj/VPPypoMly3WFM293H52lve7EoOONj
         Dvbi+fxmfFC5tOSv3SEXryLeWcd/rDvMvXv8bY8FPZddwnxIqZIY66yVa9wD5f6kE8ef
         Gn9D6Fglv/2FGtXcTHjcT3E1b2f93yFWujod1Cm875AU6YHdZCZq627UJ4UNvJqNikV0
         87sghVznPTohIY/H1NlXzYnNaseW0kvKj7bJ8796xiL98ke1FW7dQvqWrYJQSb00hqwL
         hT9A==
X-Forwarded-Encrypted: i=1; AHgh+RpwHUZbuamO0TpRNW1wB0u2XIDGq3twxSQ/YxYglEG4eGIemP3qT1ZNlhHUX+DuRuOa8wOitzSS79w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JItbGEYp1yI9BQUX/Pz1haUUBaNL/+3uM2+iyifhVBA1gvvz
	F14kvLgA/45NV8BxfY2MJeVf9F8/e88mf9upEyx5v6VXFwgNXba3/LbJXVrv1c2SALCYuCGGEkn
	gGDFkMGZhS0/g9wzTyL29x8Aro2GPQcBnf4QVtaxJ9+LMRjjheltz8Gz7tistKhI=
X-Gm-Gg: AfdE7claIAULSpp0mpD2MaLFXH2LUlx/cPpOROrB4GyIeGbGPoOdlvO2GSJvMwfkmMQ
	bUqUpDSFxXIHPKS6/T0xXvZ9YVxPFhXm9+SSjR/RVg900SbBewWhGRYVwSIb1iB7u5SxPfRclil
	NGHRT0ecoFoF45zt9CSJm2HeAeE5Fu7bN4Db9VT7DLYbo0UGn4lLdaV0Y2yYfw+84EUsjLnXNZY
	/HyTaEfVNxE7rDz95hgsQWDW08eGisrYmLsfRrj+zu8kjvSAICCe5dwJYLSNS9Mj82miJLbbxuM
	LrK+yVL2AQIF9Vntd8WkT40jvGMSsU8FE2ZXZEPSllQxKsYt6H4Zrz5B7jR3T9hWFhfqEJo7Nlv
	GvYdIY0xpFHhhNHoXRRcRZ6iWySCyYpCQtGprJbkhoz5YEPcSUNs7DVba3Q==
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186952eec.29.1782105100376;
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186937eec.29.1782105099882;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:29 -0700
Subject: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=1625;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
 b=ERbwFbugGaGe4P+UwsrTcFlyaZDuwjk5RauNrGYedxo6+Ewtx0mEWDY13Y6WufJuVqSDSD+fd
 m+gS5ZOKEWhDDNJbK/ITdLPWSgFTQ1cooMDuviQ4ndPaeQa6ZD3Cqqn
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: eMcrMcf9_6aEr3KCJJFF_ihJjeqd9RQ1
X-Proofpoint-ORIG-GUID: eMcrMcf9_6aEr3KCJJFF_ihJjeqd9RQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX+6mBX8QD2Aq8
 rsbd7K+9AJKQPLESSyYo68WfFy6KYk3KdBZkWJ6ndx9KqxNIi7IsPSfL3Hc+5l6FnYawUxYZiVc
 j0SbtBJAq3Mh4m4JbCWoYEEsiLgdzdOfDCZw1Ub2wYlfz+DRDgm3KjuVNyd8gUGH3Mz9stTi2IW
 /0iK1Wf1mms+H2SBllyTVPHht9ocKI5GGm5rQqjB7ulDZOOpxyj70AyuC12N1z2kONqNrwugJld
 9fZqyiHLoLCvMLc4x/VipD/42TGp+S6jWjiX0Qn3I6tIV7EHvO2hTWh/1k0ibw2AV5zC8vUfP4w
 ehBxLaJpJcNBBlDbKFBk/EmFo78HMjm2RtEOxQRW5fM0azwBKXOd76RBwCGWuLkdoeszYl7jE3n
 i3SfZIeM8PqDJeFLe5AvDvc7dZ8Vh7HEDO39nZMucI5tNEQYZAr4TFkp5UpZxrGtixEwPRVc/aY
 CWiMGcJZ76GPouIfjxQ==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38c40d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXyE7cxt3LAG4K
 MyJKUiC137J1rY4Bf1PMYc4plvM54t5MYHM3dGSrmw0KufL/ScAcoUmZxWhJA/EqKgE0RFl5v+N
 9pgDWwZPDZFQOd9sUpLZGLgyXuzDymM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
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
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1

