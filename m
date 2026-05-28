Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5772FD695
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935373; cv=none; b=Hk7YJGn8n2sXtKKtn26uwDzjz2coBUqRZAA4xds4lvP66Zj8OM7n1PwZHY4JShrx9a2kDSY0P9WklHLikOiaHbiOp61Pw4o8iJJyUJvcjV9dH8A1bbaMTu/hiEQNhpsIxtx7EcGayz5RPMKUbujeQiJWmXqjkeZ3ZgJ71ZqfHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935373; c=relaxed/simple;
	bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8Eqw6WW5W6BM4QHxGmfmHgzlL91SFU7srGcLosbUKhp9udaWQT7HBG7hak0eG8T3wsrWqoYm/qUsaPysAMgwPW5JZj3OSqPvBSxshJQVivJYLQLj8O3Xq75B2EVFJVqO3YQkVLAYKFrUH+9mN9j2BhBXFadsyZBceUXXyJcKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSN/fdek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xzvy42uX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSN/fdek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xzvy42uX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKmnZT1638523
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=; b=FSN/fdekEh1CeICV
	YTtcHvbdLzZ/kWwJrbwZogLzGwgdS6ZTYw7MFJ9Lh9Y/QxcCrT4+9EJgO9XgPdLP
	vuPLVgNdjdko9J/hlwEayqXVxCqZlKvIKxutEu5e3LbM7dy5KfH7DrfZALPS9OdK
	l7E7bCgVMK71PZgTREA0bOmFEzW8Zm6Ma3ILFwTBr4uuiJm47m2gGaygpqroObAK
	tycWwUoCcVJ/cZ/BREzg0BTKQ7EvagkaTgL+Oydt4zwnOdpDsU1WMSt5CXENW4UV
	BhhiXyVPRlI1xuHyuf0p6EmGRu2TjHJ2uKLxVC4+7zl1YUOvnBjvOzfgjKZnqi+0
	XR/uqA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngy8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so2176062eec.0
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935369; x=1780540169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=Xzvy42uXQgCS2o2VpSiZRsd0H3BVh/We1LFMvwCM6VKyp2NzF6oXOesq8Tkn5gjNgt
         kEDc9nP/oKQEZVlpM3Vqm7mdCiNJsh+ly3IcNf4et98YPeL/Wjab4o2+wk23umCd+eZK
         rESqT7CXaXYqwlpaEm9SqDYLjluiHTrJTWlNZQjiOJfN1Uly8NSeeUEjCsAjhaTLj9F5
         pUyYhvbV60m/m4910DfzmBvMG4PxHxahxaGucwGWeHSNKDT6ZNEQ36/2eOGzUGRfOcTX
         j1HWFfvc+0oZhf2W76j5LY9bsKjyPevp5KU9BjAQZ2PJ0FBdFGW8TFCyADWILp4KQ7s6
         yOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935369; x=1780540169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=VBGuOzBX5Kp4yWeaDrraqHZrl5Xqwv31wVohAs3zbd2e1CwkNeoRPwNJZqIBKO2c6p
         oetPOem+EoVijKv/EdRYFmWyyhbSLk//l2ssx8Nw4e756l7ZTao7i+n7+AUFsuPjqv85
         Pn5+mgsn7AWwIy3T3oE0QrkdjhcEZzZiitfnXYUfmsyymYWIqxUsUQGLYj1nfcwXuwzg
         MSL2XwlvStbNH3nL/3DFHvN/agA3TSqe1q99XYixJEh98hBcSt6GpUPhZ+PivUK8/B5y
         17nCMOwXSvlZ6I0NcJQLdNik6Fwkb3vISFdb11LWYrBKTQfQnyxFdxgVG5NOXHFprwyB
         jRNw==
X-Forwarded-Encrypted: i=1; AFNElJ8uwejwncuE0aGJYFgo1GeL64w/sHcNbCIwaec5eIotabVmuftL8uf5VObGh+BOGSg7EQVNtZS8Yoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59rofcpZIYMhqhdaDXIwhBU7kD+AegF7UpybI9fMMb9hxuFAA
	1JwCRPhl5MTZ+83/TW3oEfPFOvfUzQ40k59pDnYmvjtlCmnXWqkO48T5ILT1TQcub8VkkoFUdVX
	Qbe7CX9GN8zxwmTAWWZbJ0TWQLma7Ku3fvLoYNEBil27/soR9wMdD9cemYVJJd7dUhLcthj7MIg
	==
X-Gm-Gg: Acq92OGk3G8Oe2HMxaZq8Wt7ivUDtNEhG9R7D0oPt5fIAiZ4tpvDddeyZwmCFfQ5BdR
	lJ++51SNv/Kr4g/CD0Ib7tCBlJc8hAKS5CzYyWPnMgumA4e5NiWssaelsyPYNzZ3XtFwG/aZocM
	l6WPJcQ18vKvg1kPHR5t0M0P5ID//UlVCIeu+6Aqxlt04+I3y3p1zqKFO0CPBCULfs11gl+1WwQ
	Ce2crzTGnzO7OnrIk4Q2pDD0ZFWAXiI6U8XvAQ8DAbvwuiuiVo9DD60Ah/PmigG9wb3W+uOnUmI
	ch6dEHyTlaaILBcLWqKYuGRqxBkCYrOaVEckQaAcE1e1p56HK6qsenmbtVNEZHkzh/MIs2gpFqh
	tONCq2QWr4jtVVmoDi/OgteTQtYJS+yqv9o4xWP3lvzdrVqe5/1HkVVmmTMSaoiQtvj8e4BCPem
	4ylBM=
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215043eec.0.1779935369458;
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215035eec.0.1779935368983;
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:16 -0700
Subject: [PATCH v4 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-5-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1589;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
 b=l4y5twY8oeGyvBZydsAuEFQe7hJ3FP/48U8j6FXs/nf473j9OaKVBzNEzPhnUHMnt1jAisqrw
 th8zo/7/mP8DLg+ldlW1xzoqbtJU3yTCyRjcHqwGoU1A9cmHKwrKV88
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX9iKZq39GAGGL
 UJ9No03B1jKBXvWS/rSIFgkCZcJMsAGSUeRrg98ZxmRBAih+nFlnwS7/Mt4pR3Kv/KJpEW8trVS
 vuc0D73n4/9EzA9krUGWX746rlXeJk5FiTPR65mUAodIJndsb+PPxiNWqQ363hOeoTPYeoeCslS
 snmkj0RQOI4Vg7Kv8iALbZzLyhIBC/1TnzXmZQ5ujq7q+AB9F6+aSSet1mJVfRiSdFytdN9K5oU
 EWnH9V9VPanwYP3V3nRx02bifbDqY/C1kvV+Fud4f8elqY/9aVV4rN7EXdo3EW0etCo7DxIvQGd
 EfNwDGAl/0blQs0AvQsEO66r3BOPpC9Xp2SQ4RzMxTn9zBc8m/Hur2SnbGD8Ej0KqwKhP1RuBjj
 g1WHoQwKKcEYNwNO5sPGVzCR8nvMezWyUzgDrTzjy0YFFXKD4OdhVS4DeYYsUvs1pQU+Hg/1+TI
 H0FSddw30nTkKgNNkyw==
X-Proofpoint-ORIG-GUID: RyDAfJQmjxqbzzPQ84Sy8wDYexbEAv7O
X-Proofpoint-GUID: RyDAfJQmjxqbzzPQ84Sy8wDYexbEAv7O
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17a88a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..be8497ef0da3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -354,6 +354,26 @@ &usb_1 {
 	status = "okay";
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
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1

