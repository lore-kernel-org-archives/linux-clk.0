Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014201;
	b=hkLYk8YLefCobndIEUSi4mdO/z7AAxZkapmVS5CB2KEFD+1Q5LlWeNkdxtE/rf/ZIKOs
	 Ld4qDkNNk1t+XVgxHlzCEui34uFVRmA/lSo26aFH/XgExBCONPF6+LRyOXOWnUKW6TFqx
	 JroWlMjJoXh56Ma8by98behyFxIbC1GAM178VmEJNCq5ky7ajEw93vzemEvh+y+bikWfe
	 qMJRWby7nBzUm6HqrSBvT/IKaEju/SZZsS/wqlNGIvnUtB8uBmqa3nMg4L5iq4XilEwGN
	 D7EMXMAtJYO7pR3aURS+3oBco9aU9kl8ZvETI6MipsLPf/mBywMWccl8BqAxdpNW0cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
	b=gfWm59e+IQi2yxr6P98gWX+a2WI64bXB8ESoZHXhohqHd+nIcu0CGzq0Tk7McanslGiT
	 GK624xyjUDLYkMWzXI2x06//fUHhNwX47a/TyNqp5iPPmeabLAstt5XYKQeKw8cK5FKom
	 mvKxqkaYDcY8pOVLjWRcZ2da9YNxBX7JADz5a4EmUdNp53ScLShj1VUG2r2jmUZAZqVbI
	 JUNchA2kV5caO+WG4KBLRgJ0Qaw166gjkEUoWXVEhx9VTKafzUaciqItaqaKNCqGC6fMM
	 cd+IRfFKY+cWktgbyIK/7iG3j1Gmg5a+B0/DtXo9tQXqW+d3c/IRwnlBIk8uA7AOv8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ov+GCi7x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+wMq4gU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECE606A33A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EECE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ov+GCi7x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+wMq4gU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0243631949
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=; b=ov+GCi7xKRd1I+Ri
	qOWyUO4k/s7FTg8ltD/EBkUtEUyOLqARivYn/syb03lEcSoPZq1RZq7egxrpPmQw
	5pa+pCMQaK+Bzyq6RUcPvCMN9ztlg+apmtkDmQeAChqKZYBsyAYIk1A4F4CYyP18
	t1VLapeJCnzxxa1BpVpe/ZHQ4NO4kJ8Vd+j4+ZKXc6YNtwSC5Q8du+WFBdLsz+Se
	MpAKVlwswpPPnKGB6TXf7M8lOFpJYx8w7lsor5ziMmE1H616MJem/tVgCGpq6uPb
	b9I5yw/ofHr8epUT/tbdK0wZbDRdVaT0XS80kNgOFmx4W2bnzXqDl+da0XCiq7aC
	4MOCSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf09t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2896997a91.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014199; x=1793618999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
        b=e+wMq4gUP8j0+R5hbzHrNRtSPebOZ6rbDcUsXbotbpdDJKfemQd8T1U5xFNC+qwBUq
         l+VqkRvo5CjrjJPVymvEodSwu5Td17DLwsacOvlptuptNrlqE1futlnpMgZORzQ9WSQ0
         vohozbB0V1YkjfC7tEzbKbh4Jg4GzS+AWfVBTx1BdiH3YSFCEuKHKkxzevAM9zlxsjbP
         j1D/0d1L2PEzgd/jJe59JVXFknyOBLnnKkmIm2q94zaEA1vNeFJQQ2XmHRjMCJl1yiVH
         6Cdml58Av7T7DzPrincUyxdE2ISQ6FQmDI95T3cRAapCHeIdoZl2pZaMcrYMqXGf/0LY
         tbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014199; x=1793618999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
        b=H43hVdX2pVB3mFwiCrCBnauLn9UyrZc2ZM8O8oqO0DROKickaBIPO8YjCn2S5aLx+e
         gTUQzCQYOTxI/m1bMzLV9Wz0LznDvZoPQJdSvIZHjjuaAYUXRDog11DIeLsYe6MJOV7d
         1lVQGGiuDM/GY+v6qdukgHaGKiQrnjL6sad6NMPlQoxzL7k7Xx+kQiba14/vzvdcBp+7
         TwFu0rCIq5lsFd9aopIlaBW7cY6P/FSKcOcZtPAhbfSmUckKqJT8uRRuFdZUYtL0iYRp
         e+ve8TSmTZuQ0kNWA18TH2eFmrmNVCDAv/joa73RvyYZ8Ix6sKyxfJWOVihILJehyx+W
         7TBw==
X-Forwarded-Encrypted: i=1; AKwUvBxI4leaBLFipzfz96GK9NCvSOUrUzQVdhSAbCj74Mr+6qHefatFIjWaqGWrRCceGY7OJfpGaSqM+RY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm7QWkmarAzTFjg9DFtJC4ZpucBQTk9U5UXQiP/L7NtjN+hsZ0
	2oxPa6+kuB/81D3XZWak2PKmGMVzAxIL5eKaUpmBqWbSdeVTuk/ktXbStmLWkxrw7kdq6y14NPd
	W/3shOZYNgQsv0hGXvTJ3nPnVejScZhCucD+CN4j+JeXE97GAWKfm9qoBDqdaFi4=
X-Gm-Gg: AYBFou3EP4/V7uvVufdBjL+5t8vr0bl/Y/mXSYPHXWdgciUZmy1pLaSosAS/z69D2Vr
	HaTZfNlLJubgOVgUzYTAlogsVgewWGSxUGLo1ormWqKX4QsVoIgxvmVueIVlah3GPsTqWo+0K0l
	hme9Ak5PTWUPDm48b78vXIm2Eq9tyOQ6997csMnK6x8WlMkjVfW4vsEQAYE8UIWBSsiCyySDu7z
	IA1kLtQs4bFgR8fuOuv8aPeKHf3/Td9i5wbpKonBx0i56e0k3tJV0PZ7wWHNhaZSPHnMaWMbwIU
	f7A2wN99uQ5ujEwx4dF+7+5KsBsrQoWkdP6t2HTLmO1bioWNv/HTwq1O6mktPmmnAUAChbWLx1x
	vHJmFrUo5CkSpUcxEfcZb1u4=
X-Received: by 2002:a17:90b:3c8a:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ade9b2c4a0mr5122123a91.6.1793014198102;
        Mon, 26 Oct 2026 04:29:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ade9b2c4a0mr5122090a91.6.1793014197529;
        Mon, 26 Oct 2026 04:29:57 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:28 +0530
Subject: [PATCH v2 02/12] dt-bindings: clock: qcom: Add PDM XO4 divider
 clock IDs
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-2-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxkPTWeB2ghc4
 rB3XiHBElSnKt++hdqY+SJ7k2r8mVYt23GoHYW6HieYyp3dQWAQTZ4Tts1npvqk4bafxbOLJsGs
 Gki2TICALuteqqXwV5bTzE96zgnWjWM=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf39b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JzXKva1iMknIiGK8KiYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: OSHw5AWkaFpPGwd8DDpxJI9qrCVlLsgq
X-Proofpoint-ORIG-GUID: OSHw5AWkaFpPGwd8DDpxJI9qrCVlLsgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6xfg89sXaj2R
 02v6nBPwtM07BtG94wJEMQSLWpq1Oq6bGVfwn+s2hv/3uSxN+3wDAykIbk01o1WVxlQwz4LVlMw
 ca+bSevd1BYDar+Zv1eHqOi5rgcqi4ShGegYzhHiQOX56W1NJD58nT+2A0KVfUg7l/6+LGuiz6h
 mPKfWK96jCB8615NgRiG+4ca8AkWe9RRRVh2QsZg4Req64hRCzhIuOMkLYLVYsNbJacta9a9kMG
 ivER/7NI1ns3iqNxcuQvCoVlWJoEhgcmkTwG5RX7YQz5jrwRpHYIylQ47ddAml7TWkLPgm3mr2p
 cKIEFgRruSWORworA7avTeBBrrB1nMLSCrNV7YlwajRIY0b8E00KaO6Bfb6aMkvYNn61dENwSMM
 8XVU6TMSflMQifj23f9Srm6uAqSAmXImK/huDEg1CBRVuxTRClQxe0FmZXS8wjP934veDYwW1VJ
 wKmwjneGWJOEyFW2X0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add clock IDs for the PDM XO4 divider sources on QCS615, QCS8300,
SA8775P, and SC7280. The corresponding GCC drivers use these IDs to
register the divider clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc7280.h  | 1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h  | 2 ++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
index 3d5724b79bff18a858bdbb5c1654c5174e8cb23b..68dfd6616ce4b1c1e41f11603be639685301129f 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -192,6 +192,7 @@
 #define GCC_WPSS_RSCP_CLK				182
 #define GCC_EDP_CLKREF_EN				183
 #define GCC_SEC_CTRL_CLK_SRC				184
+#define GCC_PDM_XO4_DIV_CLK_SRC				185
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,qcs615-gcc.h b/include/dt-bindings/clock/qcom,qcs615-gcc.h
index 9704091636b87108a2a8c5ccc4a6b293829d8272..cddf21466a96a2990f1aaaf7c655fa6a4369ccbd 100644
--- a/include/dt-bindings/clock/qcom,qcs615-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs615-gcc.h
@@ -175,6 +175,8 @@
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			166
 
+#define GCC_PDM_XO4_DIV_CLK_SRC					167
+
 /* GCC Resets */
 #define GCC_EMAC_BCR                                            0
 #define GCC_QUSB2PHY_PRIM_BCR                                   1
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index 3c674c7baaba91815b13450e647b41053bd7330d..cee26f50092044f4a0b4cead6f669f0ccf7343c0 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -196,6 +196,7 @@
 #define GCC_TSCSS_CNTR_CLK_SRC					186
 #define GCC_TSCSS_ETU_CLK					187
 #define GCC_TSCSS_GLOBAL_CNTR_CLK				188
+#define GCC_PDM_XO4_DIV_CLK_SRC				189
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gcc.h b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
index 01f54234963d6a531926103f8658307d4e0662f2..e101c9b565d650495e63f5f97b3458375d0e85ec 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gcc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
@@ -257,6 +257,7 @@
 #define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK			246
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK			247
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK		248
+#define GCC_PDM_XO4_DIV_CLK_SRC				249
 
 /* GCC resets */
 #define GCC_CAMERA_BCR					0

-- 
2.34.1

