Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C142FCBF
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572615; cv=none; b=CWqhsabgnT5Z+bEqKabYXCe29DZRUzTYRz0/ElXUL616xH9EtXCZ+Z5h9JSeDboFk399uFacVgfxthfoqrIpf5CWClx/upgwa43YP7TuwGuOcdIKTYayw6YH2Wj4VCQFf54NZWvFTPDAO0Et69NcOr5hU1Wo7/wG0Hkp0aVrOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572615; c=relaxed/simple;
	bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIPYXfMSGbgwedWki8tCbmkHdjAz83InHPnOFllPcYKYqtQ/y09Pk7gYcK3G71SQZPDQCTNduom0DA2g8H1CL0vZvsVLdUH0fB9L0tcXGrhoDJmQy4tKalIiqJB6g/A8GiIvfC+IL2YGKEmL0wo/CJrlGlcJR+/c2CfOSUVp65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJRFXpio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E61yxeip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJRFXpio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E61yxeip"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdoU3194971
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=; b=WJRFXpioY6dt0RUB
	XEIK+k/7wOxrg7FQ96NpXpfX9YsoFpOeB4onmaND4cN4Ms05anRH/sUXRwmbutbt
	BvBz8A6VJ5ihnGj599tGP/Y296YfxKyAoTA6ANzh7dcgSNtIsAWciNDRmsR+cS4J
	Z7UyI5zU2pZdYcX+SznpEdOiYRd6ZONxMFu1OsN2YYcQuNQwZupy7qAMVePVIA+g
	MREFy3OPf4QQAsZl7Wb1nH0lDJ9L3Ayqj+O6hhP8ScPWHA/2Nrt3uHIltfDfZA8Z
	BDqCgz/22eWlKujToc8c+KtbopD6Glrvu6ajozgwQ6yjrMhQPinmi0puE5ZpBRhr
	Jpcwjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs33k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso33439636d6.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572612; x=1788177412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=E61yxeipiRMQMydQdNnPkLqxPYSlN9ZFfZC5jnsJJ/9FgQObXWIfSBuMQRcz+Tru9V
         WrJNHJJFzP9U/Idp//Sa0upjVSkG4Azo5cEAR63M6TgOh46Zra5W55cVBMiULdRqtnRG
         +6WOFoMmoUTdB1hOePE0KRr1I5Cz5EZtRzRSm/lOy8JtjirCFeUUe3R52jxbU+HbIUDZ
         Bspo6HSqPucig0BVgWVzX1U5baNqxCSTeiaP9ybumFdpJmmdpWSFJndmJVfmPhCZuOAG
         k4wULTn+rkLczFz9kixbJ3yZHj7wO3VOVLu79eU/vAQO5jEoGBIqX92AIVNHqGI6IucF
         Utow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572612; x=1788177412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=J5PEbi0JvaohYPuB2R5YPyd6uesJVNXw3RBxxa5cDndD+4e0tXA11CEPO4s8qtRmfA
         PHfcWPEGd5zygpMPMfPMGsnV2VTOo26QdO+pWK4OGozSSvZkizj+u2KIbb1dwPJCDMkX
         6w1hs6vN4pfx5rbj4twbR1SYJhH5UVBoFUY/0ia1HCfmmWF9EBzAsMY8byR+T2MefLwG
         cK+/8uBK/qrfR4tQ2kRuuIabitgRvrPUfP0SlxOFWCH5gI/Kl1tUKkyVv/ZogyQgLfjH
         RvFpuvwQnDjXjOXCqlnZVdzznJB7/nQ1ONuyfCojgx14u1of/DWsAdD+NRPOWbrJzlwZ
         KkPg==
X-Forwarded-Encrypted: i=1; AHgh+RooeaTz2Ma9B3oDyfqSXLKBYej189Ui8GmpfLPXiqiQGynYRx2NuD/XV48mvKoI2wiK6/LZTp0aEFE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFCSUuuoozjVOUqrpgS2H1hiRN84ZksVtgqvLvfWm9Hv8yf1zP
	ie5J/1pIn0qJ5Bx+aviPuwEocUVwWdCVQ6uHPvNBoAB+m0ZO8n8wgykLm6e1aSl6soENRRMprua
	5wkWuRm9qpXOeSsLViZXr1jii2cQib4U8JXd5IulC62I7bRjFg3Up7faf2wtS9Gs=
X-Gm-Gg: AR+sD10boxVQzbZ8FpL8GSvNQoO8cn7yGxM1pRbEGe0KnysEhai/KsmfKGjefD3x3zj
	dJJw3A+n1lufJNFMHegmcvRmWIDe//lYKIhFe0dFwwb0kQSC9lcTLAQDkg8NJL5maKUnNSmHahg
	vVEy6JDf+V6mxL0uWT1HTUJuf2NkgHYfsHb5Cao0rHH2PWfrK9iuLm8pCsqiQ/MyJO4TnE7dww2
	RBDUBBHeHNnXBv4amHPYfpI4NiblkdAYQ8Gjbmn74UZgCIot4Qey3DDgc8hb+3B80xBtrkGzYqb
	ruPBgfGAWZvQoPO6ZsFGhVMdymGzejQEAXMV/A3tRMu/HjKeHLl9DxjmUYW0ZQKtczuPibE5cdk
	kuf6nVQ8J
X-Received: by 2002:a05:6214:4113:b0:90a:74d4:e4ac with SMTP id 6a1803df08f44-90c80c5b401mr247807196d6.16.1787572612364;
        Mon, 24 Aug 2026 04:56:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:90a:74d4:e4ac with SMTP id 6a1803df08f44-90c80c5b401mr247806206d6.16.1787572611849;
        Mon, 24 Aug 2026 04:56:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:32 +0300
Subject: [PATCH v3 45/47] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-45-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDEBPC3xba6latoF/t9LFzOBt7P5DLSZQbpxr
 is0oq2I7giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaowxAQAKCRAbX0TJAJUV
 Vp6XD/9OJKHwutumaL4O2BWY/owij5y+W/1aUMg+6zXbCIIArR6h9N1QXyVxheegq1zvL0p8Jcn
 M2Kja4tcw8KMEsy6rjcGxIWp/hWFZcqssIdvmW7iAVfvT5O+Sp0Yb45TGNaoLVvYXO0dRinfZNR
 xU3Qcnk1qbdLC3sQsdXWPtlkHUS/MTbIAJ3NjpDwvwx0bMibJFJkBs7lRDm7ytupi2cP6leuIiP
 WaaQ6jO0bGop14pXFH4uA//pkNXWquAJwRmQAM+tkdlVI2Br404chklKQNiiC72H+KTOPcZy7d4
 yifp/1+gv59W1AvBqWE/QRYTOR2yTrP1IXGGFaB3Gy6dPo3bpsxnoqPJwVMHCu5JafqhsnDdmR/
 v/FVG31HXXIaDtIBfmIVumzLuRlk9rPmU2YW1yxdm5bCXXT8HZdTBn/P4udWMuOOuxd2G2RoBZm
 wzNaNpA90H29/KVOozM7ESDtZnETdng1yPzXfPqqYhRgLO24+GmC/fMUa7UNDhWyxdXK021ylHl
 PrSBHPbuP1tn9aw/vVTQOAOj3aQZz6oH7P1quFL/qfFXD3lBlj0GvHdlDbuVuUhAGFTkWHuCmu0
 seGRAnzl3yvNTHHcSKraw38KYLhwdyKolcM1wp/Fp9tE9XFgQUbsfkey3tXcP3aDFMcsN7eVnQg
 TWvRBRVd+uU1GAA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX80YPJvgTqRU6
 /E7cNUN3kgToaZ8mwvZEVyWl/t2REpQvDtLx/QJbpO67ISbrpz2VsZqyoY7ij4EVu7QS9dbY7lg
 gQ/5zrz8hovXLgloJv93oi8UfebPwP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX5XR0dNikDsgU
 uYhH7Xf8XHIvGQvsct7x1IH6GEnRLdHvlS4Esl04kQr3BMbAa+qWj9/2hA2Lx+A3NB5tYfGHltn
 5YwIGZAjMj781avnffhTUqRy/d7N3C7ywSgxNi9nURdlEjNguDhBUtO9kTyeH3YfNDovmIH6D3G
 +be9yKmK/3o8gqgLEmHN45m306qdnkUGXedHkqnh5ciDP9MwjB8ZMHI8EQnwoeZUbVaMO7mEDQg
 ydG7aMBb9kmw1HmGjMn/HxXKWCIuuEaNMgRXCGWBLkRvPxqxy2zd3lYHbKHtXW3XQkRTDVU/J+Y
 ZZPsidMJR26Xzd35X53Rsx4/W9QXhZaBUGaLXWTHpJCF3zAdTDBERadUVp0dllCYaSTVdtsWs0l
 q8/Qr1KhaUmiW1TDjK4rqTrnrhJEDN5/u2b8A0DxyrLl9C2ymlZ/xL9EhkTu1Sv49+56vHsMTC6
 GMV7JR8TXrD5hrrGtAg==
X-Proofpoint-ORIG-GUID: 1RCg4744bejGciPAGz7yflj4iG1Q8ZMy
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3185 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1RCg4744bejGciPAGz7yflj4iG1Q8ZMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

