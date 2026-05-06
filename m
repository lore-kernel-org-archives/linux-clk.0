Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05D496903
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086299; cv=none; b=euoEdvc/JOYSKQhEMG7f2CjqrXcX6+9peCdIiCVlRN9z7Jq9wHXVxfXc/ZUZhdluVpS7vwa9iUPAtPXaHA7w5c5c4tv9+xRW0hTNMSwlqkxL3WZpmJBLwqOFZFIoBBDxd9Kj47qMAZifdYjLD4B+5cgqKQ8oi4JOSi1RwsPL+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086299; c=relaxed/simple;
	bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfeidfxSHCNRI2pZV6z06phgM9Qi7DCYEGeBI04g/krHNHvPwjrOg00DT6SIK+h7yQgZu6X+KQkZOl8m3xbNh06VEJ7f4cVE8SPAeen03KkR2qKAtpEj7/Lzwo08qezXgCynEliKb+UWyG3zCQnvRVRohn5EuFRR8tdcmleLx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES7Schf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7+SJ/Sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES7Schf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7+SJ/Sm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646E5Dql2427834
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=; b=ES7Schf5x33FgGYs
	ABkZIZRMtyaA+UrZEF8eJJKTFigwQaJQWU8hNz4Xi0GjTjtZcnr6mYLLwFLbAEdx
	Us3V+nxAJbYR8g7Jvyid8pKoDo2avG8S/Da8Y6z2GRiVt8UMQD5zMnQc5KGWy94n
	d/J7ikRjEHHQpsUbf2OWGNL+2Dkfw6A6scGH5jm/YtmJpqSDA20uEmQHkz2D6f1q
	0iWV2dJ54AH6oX86ygP7QiRfK3ODUY17nT7lFA93y8pnMxd4/30KPC82BhpTPKtf
	2JgEkX8fMtSu6hLGFbqNjkEDIxuG7IxhMsh4EROYf13ArQLM0TfPMOVkVGX7zNx/
	CT6ZSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dba1e866dso939955c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086292; x=1778691092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=j7+SJ/SmaCNaOYtO/o/CiJ5cFOK5nKdbTSANopgANT5XZqm57Kqtfq6e90JIq/Pr6n
         POoye8+Lh3E6ZQMvaTVw0QTj1YtyOvS+qtczjYJ56kcW9h2ooX2JODpHMvfuXGvTbOt1
         8S4t7LE1xROoxMiZ+Xl4ZkcgQClgXHVKcgxpWcg1jIF7aF+N6cY0eacGJ2HZCXDhBd/7
         Vtz/KZ+VCXFFTVHE2dips/QWzJ7pw1EtX8zaDwDfDoWlegipZQufbAWYzycnIYFx1SAC
         YcLpsiDsjl0mYRFAh2N6z8dRHI40iltWfYpdNHKgLnaANCk66g8jhgblnoBvUwQxyw/W
         qd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086292; x=1778691092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=cxS8g80M/wDsrf0rrRCIFu4Mu89Z5lahm8UmJ+cOMb11i/OCDggdCS9+Np/XCkYEB+
         npuY7fhE1tRCmKJPaqPoHUisJPNLLU7NUtjX+uF3X2/TrRKLERKFqDIkUyxtrmEM9UPP
         /osu7C90DNXsSC5bdAPBygiQvmsXT4Z3iQHCdWY9WjE2ywo/lT5En12OqHg21pam9tFl
         SHBuDN2tGd7WsglQbgl7zL+cn8lLdblQB5LD9vJA9h7djN0P1WAMQhhEEb7RbhmrfVwS
         6VpT/NkGBV4+PPeBTmp5ePk0ICeJQSlY7M0F2yKBoHCYSK0XlH9q9erKVGHpOZTI6Gs+
         84zg==
X-Forwarded-Encrypted: i=1; AFNElJ+xO1WtuzuPegRZJKUnI8NtAe2j9X4j1eNVQ6sFWGxP8Vn9AxGqay3sKU3heTMf9WXHY05OgXFvQA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1pqq+pGerRDU4vhL0KIFzg+cLq65S+fs0jcFhkvYfaNBe7HGr
	QxRsSr0xGXpNfe8Th63RWQKy6zVt0T+Z63V5/YiLgwNAqY6EdJKnmJ9JXLH5MhWxrTvCDeqI+LZ
	rD2wKaNiZ7y5ytf1rODjQ7+sInDGs2zTv5jiQI9slj52+wU4dWD7ZfpFl0r+fCZgnLa2CoUs=
X-Gm-Gg: AeBDieulZC3n6vXRRUnfrAsxs1VP3K6Xp5F2NwpHrneEPg7uYI3EW8oG+MnUYCyHqGH
	iikv39d6cSGCHohq5jIwK1nc3TAlHbJ9+oucDlrOVS40I01XKxmzHCFduLYN8ld5FkIvUoDWaUL
	HwLiUGTVwaOVQMyRS0pihtF5/9u681RrudEfE4sN9BFJz1t7khXNcg8w3kOcY3SzgeFEGXcGb2U
	j19+Ukce7WVkm9+CtH3LFrD6AQDBVQNWHGg9D5HzcwPe+rEF8OMhXpGvzGu1YNrmFT7I5xV8h5R
	ItXAAQLDxHv+lx0Uwunwze0R7hEKxRkCE8u3fLTugd18T2hZn+88a+oiqEtvzgogazbryn6k6SM
	tL05cHo9HJCINLnMEP1CTzoTuvvR4SXP8WccVNbJeApUzeV9bqB0GYAZJwR6MBkXgIOejJj4LQu
	xbQYCRPkRW0SY=
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923316c88.4.1778086292168;
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923287c88.4.1778086291405;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:41 -0700
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-2-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2076;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
 b=iOLr6NoF49SnI5ljBUWuP2OuF/tC/zaRawHEDrvrQlooGQgCiw9DmfI655ex73Px9oiTvcEbp
 pZ7MGAgRmAGAG8fao+x39DKcEESOCVNcJwYqu6JQ5qfhH2DP9LyqFKy
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX88lnQJgTYj2M
 l+ArwOyTCQ+Auw4KVtsiaDKXmTQh1oc0OIulfkj9qOnZsqO5fVWpZTmBcjGH0eyLP31xd5QGT/2
 ST3/b8W6bm6Hp9UsRok01AXTz61irc0bxGc8/goKGqIZU3furdFnv2hmYFM0939p22HalhhGNpM
 nzY3oS6Aq9CU/8ZArTp5Gmpev730hdXUj2snhv2Hub8YO09HHerUsnw9f96x5VudYoJOJs6cald
 jmgCAXckbI30RYd7lkyJ/mHLSf2rI7d/RdZS7cKbjth/BgdWERknhAQF7gXq5DCmZcsHZsWcmpO
 GUnqqLwZnwhYMgaPftMIAF8kSeO3A3TjyqEiDgW+TTvjqzao0ft8bQtqLmwNtfBhUSM9IcnXzyk
 uV0T4jnMqAmaqkVri52LCq76mGjp34duD/J0Nq/rysx9j90e2hIhWf3NW0RbNLis7SpqG5pT7x1
 kqgi33NVH0UdfxVk3yw==
X-Proofpoint-GUID: lQv9zgLA2oa1RThBD8lC7FMKe6RLvjm3
X-Proofpoint-ORIG-GUID: lQv9zgLA2oa1RThBD8lC7FMKe6RLvjm3
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7195 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N79QfILmdNi3kVuE8ocA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add bindings documentation for TCSR clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..08824f848973 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1

