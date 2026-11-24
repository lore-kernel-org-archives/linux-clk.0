Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550507;
	b=HcgDixKaK0Hh3wT1LquNr71duIf8jZO+L7C29jtm3dzZiHF3yqItelYxEtr4iNI2US0e
	 SHbMr+3ARp+Ty0UqUw4qcnbzpqJnFmbO6AvSAHqV+kL1DG+DKQHAm/Un4+rMj4F24563s
	 7xIIv+diA7q4PO31JYO37gEBdLkrkYSdAk4H8osHRZySzr4g0QJrFtIfDp2sEZpGAqrKk
	 jdE9w2JAfKk9UddJJmMlZtMItweJCXTWuck18ver5p6y3qiesxMVqwUV43Rt8IAxycLni
	 ShYzZSZwKdeLL5uzjfxhUmvgfRwfSY2M9WM8Hxo6ixy4YOz4IrIFSR+T9wsxdjQA6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gj/kn9l+fhSXp56Q3+GOh5NkCUQo7/TJhM4aJB5f4gc=;
	b=cFQvu6Ki46okl/Ux4mMTiolTEmbRDpuzR4Xkles4+4TFMG2MP5TmXUZspHKUPYNCOjUE
	 DPrA9U4mW9Kojb8t9zij1JnIiFUlyFcnIcB9ID/HPuJNxwu+zokGVeACYqRPvv1zJ10v0
	 ho1obpKs9YAN/HGSF6YoUSr6Fd2IKGRN1wHUHognVS1/joFemUAYrzSOgQKWda1cRa7l/
	 VIrtmoy+l5G2Smfr9WgmWnLOIfw8vDXfrUmF2KBsJ+JSwMsLB1VVxnL4PmyznmR9vsass
	 DoJrV873mc2li4XJmW523O2WtL8pLLF6kc+0IHqlzlp3LO+BEk5bdUdNKYXBtv2pLiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dtm5d+ZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htAh209L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAB606A330
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFAB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dtm5d+ZM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htAh209L
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLKLO1723061
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gj/kn9l+fhSXp56Q3+GOh5NkCUQo7/TJhM4aJB5f4gc=; b=Dtm5d+ZM7JgrLunu
	2Z63ji5pjQufUi2hTt1AJVMsLsypSZE6hingaRAGB0dTUU2LRnXAeBKKbgtgnTHx
	4aJOn+SJ973ufJzkuU1v2fcWLo3idQfkvR+UPvdYHtRYP+caQDuHoPO50H0IwjqV
	C75ndWHBBAfdULKfNBKAv2tFUTBFTL7EGUd4gxLnASlqQJ4tTxsN8+LrUQYbLPPA
	W6/LmZlwRABv6DSpmRN45BY//wOOgjHABJhAqNSuNK610BisEuxPxFOkd6q804QD
	N/rHYk5nwLhtqZ63UBWA0dD6a4QZBtG/siG6znkB+zYgILheH09SCEVmxlbg4bFY
	NIN63w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns84qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5727556319eso241791b6e.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550505; x=1796155305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj/kn9l+fhSXp56Q3+GOh5NkCUQo7/TJhM4aJB5f4gc=;
        b=htAh209LMgGvS6vGz5HcbxhYba7Jna0AyD1+azu5v9PcKv69aO3vrUF0PrSX5oy16Q
         YyBoT5FS4MM9cmVr9XzE+SVWp7WF/zu8JGLt8jZda4TTtHLwl9WZxtItEgNaKb44ACkv
         dYQZfyhJf/VzHryGtexTvL0f0TZcVcmdsau2apQok/7hhMDfCSKQ9wwwkFYqgjqEBfhE
         5hM9FXEmUKfSnpvSXmkbrCkkFVI+yqUkfqRlyXJXDVCpJxCRIL4CO+CYAckVw+G4bxFI
         c1FbKev05q8/3Jb57hI4PWX6Ycm5SsVt0as62XMfmL6a+g36USfFRQyGyVbRI3b41Uk5
         cY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550505; x=1796155305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj/kn9l+fhSXp56Q3+GOh5NkCUQo7/TJhM4aJB5f4gc=;
        b=Ncxc0V5Fi6hyew5fEzBreyl5OHKCIAB5+IrJRPrkjfqIxvdzEgIvlrk0PeyWGtla8B
         4b/Y1fsoYbB9BTOb5gHBaFeqvJR08myi0TxYsWGlgt68bSojpp/uiDzjw/pKAIN1hZVJ
         AnsZ9htMYgtAgVlbXsO9cXyPt2fy6PZ8bQwwjRunAjJLuVaIyjPOk7dxAPlyLgkOr7Sq
         INW/5pTx6W8R9Te69qV9+Oxp3yp8rG7Atd6dpatgcTVcRiR90JJJKmhry8K6qgINNrIh
         XxM11ON8vHxKAysG296GKSJ1IpEcFnX945MAcLXAzm482WoJTETrkhwpzeTbbvbKoVV0
         hz9Q==
X-Forwarded-Encrypted: i=1; AL+hErEuIcfBcTE3l9dNqBNiAZ64QOTL6+A37MXnUN974WaiX4V00q9G9DT8YZ5EEuMVte+nDHvK94fzLWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//xM79DionHK8m2VUm3kIj0uGWdWii/p/a9fX0MgK1Y6GmEFf7
	r+Qrd2zwaq74TCI+QKuLz4lyMTr7qtBw6FUbd0AdDnC3AQfLlIp2HTyaKDaBUTI/7lXEH3Rxg3S
	p+INJXNhVQZ2W0xIz0KVc1jtw3+EjbuHr5zT3jMHDDg+MrJsOKcxBHHZPXd5ZJ2Q=
X-Gm-Gg: AZFdTZefKqy06XwUOvwkoIGbWZEKTPgTstxtFxqK49T1p5tsWUpj2Swmr9Yaqprjckr
	bxWhbpKzxgVdVsI5X2orUvWdSw9egYqobVvovkKTasJuPs7aaYdeXQEiQz3ri74+cr6XYd6xzm1
	836lfjgQoEQ06b0QT1a8UbfHGK0gY6ZotETZpe/TReKPv851tVjQBfn16EKiGO0BPgKdJLY99mn
	fVsjvno2tXCWe3HBHPAL6Rz+ldDtiDBjzrt1Izggm/6criBfKAB1ZwL42GCly67uWnDFZhmxn9e
	37W7zOXfyZw2gE3rWqhTBc4C2f7DY6c+jvfiV+J8+D2FBIlNuPqKf8nimDSDrpU9uR1ShOag7es
	gIUHs0QI/heFYiDqwg334Vo5ZPWu8XkqUnT7z7iVWSaAhqACLkKMSi3tSzrvRT3WxGlzymhX8js
	U3KlUgeNE=
X-Received: by 2002:a05:6808:6711:b0:4f3:6ac0:27d7 with SMTP id 5614622812f47-57a05ae9f8bmr19596410b6e.1.1795550504405;
        Tue, 24 Nov 2026 12:01:44 -0800 (PST)
X-Received: by 2002:a05:6808:6711:b0:4f3:6ac0:27d7 with SMTP id 5614622812f47-57a05ae9f8bmr19596357b6e.1.1795550503630;
        Tue, 24 Nov 2026 12:01:43 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:42 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:30 +0100
Subject: [PATCH RFC DNM 01/15] phy: qualcomm: qmp-combo: Add Glymur USB4v1
 PHY sequences
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-1-a9b45c69cd38@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=24153;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VTCdxgczJaFC8Z8ZruEP7jhvV/7Zr66OykE3/cdPWIQ=;
 b=rKkpRLVDveQ+hPmS2x9Zldm6glEmskUuq+IuXXUi1jQqP5pR70IXCd98HghDYNOuVZ4oiRlvM
 TMca79bGnV5C+W0RBxzNfCtELsCDsFbvIf9DDBJwGuC2fewzrO5Qu4g
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: 3mkXyI67pslGZHz68LzPFbVG5kVR8r39
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ed29 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-OXa-wX8nAFqS9btLq8A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyzT54mNmUJOn
 DidW9CTl/Fox88CAUK/ONZI6x7RjyIT/EMegvSlLxChH0ong+UJgWgPmNgLfV+n2O95CTxvAJfE
 OJiLPdbBfC3CQDGA8iLWLQHnudf2e+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6ugtrh6sfOJu
 y7yuuDGldNWzsq27lJA3lF6nk19qHT9u7R4ZXkJFvnklz2yCfjVzSAN+mgX7WdWpTS2eQ2K1yA/
 nv8h/dGa7ySD2/LY5LluSYSGIr/YiQR07z5p5oSGaDYZpb4z9fdprxauAGx20Rw9+jLrNfAa9M0
 m2ljeLeAxGutMCRJoLnM5cAIU6X7lb5N9eiDE6t51O912beSGzPyIyd98Ct8SqOonDBXrvsGrYJ
 Ep6RwuFkYnVOmw15m7OnxJVkrhg5qDGXrjFfP6CE92CfLtCeFP8jg5GeYNhC9q6MVQyJfHACI63
 nQP/WGEhEWs35KZWBClCwDW1pH67oLSb6Hg87TddxbnVMwQZzXOMEpDiDm9wnwUsWN20Qdh2fqG
 /aGHyVr+DHOpICGJNNU5Sin3Z5jsQOfWkNGwBchf5JVXGcThf6KAntbJEdegFtNNtPdSSdtVvWA
 Trig7PVMxtdIno//6tw==
X-Proofpoint-ORIG-GUID: 3mkXyI67pslGZHz68LzPFbVG5kVR8r39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Introduce the programming sequences for Glymur, based on the V1.00
Hardware Settings Reference release for Glymur_R2.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[konrad: tiny fixups, c0pll reset]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 297 ++++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h |  22 ++
 3 files changed, 315 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a29f5296e900fbaf534c5de499559a768c42a33c..03fe66dae8b86837fddcc59956529ae374c1f6de 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -119,6 +119,7 @@ enum qphy_reg_layout {
 
 	QPHY_AON_TOGGLE_ENABLE,
 	QPHY_DP_AON_TOGGLE_ENABLE,
+	QPHY_USB4_AON_TOGGLE_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -323,8 +324,10 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]	= QPHY_V8_PCS_USB_LFPS_RXTERM_IRQ_CLEAR,
 
 	[QPHY_PCS_CLAMP_ENABLE]			= QPHY_V8_PCS_AON_USB3_AON_CLAMP_ENABLE,
+	[QPHY_PCS_USB4_CLAMP_ENABLE]		= QPHY_V8_PCS_AON_USB4_AON_CLAMP_ENABLE,
 	[QPHY_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE,
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
+	[QPHY_USB4_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB4_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
@@ -2513,6 +2516,245 @@ static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
 	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
 };
+static const struct qmp_phy_init_tbl glymur_usb4_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE1, 0xcc),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_EP_DIV_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE1, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE1, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x96),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_EP_DIV_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0x4d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BG_TIMER, 0x0a),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER1, 0x76),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_POST_DIV_MUX, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_ENABLE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO_MODE1, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_IETRIM, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_CFG, 0x04),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MISC1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_DC_LEVEL_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_ADDITIONAL_MISC_2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_SPARE_FOR_ECO, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_2, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_3, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_7, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_9, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PSM_CAL_EN, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xaf),
+};
+
+static const struct qmp_phy_init_tbl glymur_tb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER1, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x54),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb4_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_POWER_STATE_CONFIG3, 0xcf),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_POWER_STATE_CONFIG4, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G23_LOCK_DETECT_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G23_LOCK_DETECT_CONFIG2, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G2_TXMGN_MAIN_RS, 0x51),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_TXMGN_MAIN_RS, 0x51),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_EQ_CONFIG1, 0x36),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_EQ_CONFIG5, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_EQ_CONFIG6, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG1, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG2, 0xdb),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG3, 0x26),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG5, 0x18),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG1, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG3, 0x2a),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG5, 0x18),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_LFPS_TX_ECSTART, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_MBUS_CONFIG1, 0xff),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb4_lalb_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x85),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL3, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL4, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_4, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_VREF_SEL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_VREF_SEL, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LDO_TIMER_CTRL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B2, 0x7c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B3, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B5, 0x57),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B6, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B7, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B0, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B1, 0xc4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B2, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B3, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B5, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B6, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE3_B7, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CMUX_DCC_POSTCAL_OFFSET, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE2, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE2, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE3, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE3, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCTRL_RATE_2_3, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_INIT_RATE_2_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_CAL_VCTRL_LOW_RATE_2_3, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE2, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE2, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE3, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CODE_OVRD_RATE_2_3, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE3, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE3, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_SUMMER_CAL_SPD_MODE_RATE_0123, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CTRL2, 0x85),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CTRL3, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_ENABLES, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CNTRL, 0xa3),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_LVL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_TRIM, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE3, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE3, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE3, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_FLL_DIV_RATIO_RATE_0123, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE_23, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE_2_3, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE_2_3, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE_2_3, 0x51),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CAP_CODE_RATE_0123, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_TYPE_CONFIG, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_EN_LOWFREQ, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_FUNC_CTRL, 0xd0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_FAST_LOCK_EN_CTRL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_RCVR_EN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_GM_CAL_EN, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_GM_CAL_RES_RATE2_3, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_EOM_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_EOM_CTRL2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_EOM_CTRL3, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x44),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_OFFSET_ADAPTOR_CNTRL3, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL3, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CTLE_POST_CAL_OFFSET_RATE_0_1_2, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CTLE_POST_CAL_OFFSET_RATE_3_4, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VGA_CAL_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE2_3, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE3, 0x78),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP3_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP3_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP4_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP4_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP5_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP5_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP1_DAC_ENABLE, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP2_DAC_ENABLE, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP345_DAC_ENABLE, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP67_DAC_ENABLE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_CTRL, 0x58),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_MAN_INDEX, 0x12), /* TODO: 0x11 for Mahua */
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_DIV2_CTRL_RATE0123, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CAP_CODE_OVRD_MUXES, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE3, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE3, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DIG_BKUP_CTRL16, 0x77),
+};
+
+static const struct qmp_phy_init_tbl glymur_tb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_USB4_PCS_POWER_STATE_CONFIG4, 0x1f),
+};
+
+static const struct qmp_phy_init_tbl glymur_tb3_lalb_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE2, 0x57),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE2, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE3, 0x57),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE3, 0x27),
+};
+
 
 static const struct qmp_phy_init_tbl nord_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
@@ -2729,6 +2971,12 @@ struct qmp_phy_cfg {
 	int usb4_rx_tbl_num;
 	const struct qmp_phy_init_tbl *usb4_pcs_tbl;
 	int usb4_pcs_tbl_num;
+	const struct qmp_phy_init_tbl *usb4_pcs_tb3_ovrd_tbl;
+	int usb4_pcs_tb3_ovrd_num;
+	const struct qmp_phy_init_tbl *usb4_tx_tb3_ovrd_tbl;
+	int usb4_tx_tb3_ovrd_num;
+	/* true, if the C0 PLL needs to be reset on PHY mode changes */
+	bool usb4_c0_pll_reset;
 
 	/* resets to be requested */
 	const char * const *reset_list;
@@ -2948,6 +3196,8 @@ static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.dp_dp_phy	= 0x2400,
 	.txa		= 0x4000,
 	.txb		= 0x5000,
+	.usb4_serdes	= 0x3000,
+	.usb4_pcs	= 0x3800,
 };
 
 static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
@@ -3612,6 +3862,20 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
 
+	.usb4_serdes_tbl	= glymur_usb4_serdes_tbl,
+	.usb4_serdes_tbl_num	= ARRAY_SIZE(glymur_usb4_serdes_tbl),
+	.usb4_serdes_tb3_ovrd_tbl = glymur_tb3_serdes_tbl,
+	.usb4_serdes_tb3_ovrd_num = ARRAY_SIZE(glymur_tb3_serdes_tbl),
+	.usb4_tx_tbl		= glymur_usb4_lalb_tbl,
+	.usb4_tx_tbl_num	= ARRAY_SIZE(glymur_usb4_lalb_tbl),
+	.usb4_pcs_tbl		= glymur_usb4_pcs_tbl,
+	.usb4_pcs_tbl_num	= ARRAY_SIZE(glymur_usb4_pcs_tbl),
+	.usb4_pcs_tb3_ovrd_tbl	= glymur_tb3_pcs_tbl,
+	.usb4_pcs_tb3_ovrd_num	= ARRAY_SIZE(glymur_tb3_pcs_tbl),
+	.usb4_tx_tb3_ovrd_tbl	= glymur_tb3_lalb_tbl,
+	.usb4_tx_tb3_ovrd_num	= ARRAY_SIZE(glymur_tb3_lalb_tbl),
+	.usb4_c0_pll_reset	= true,
+
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -4273,6 +4537,12 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
 	return ret;
 }
 
+static void qmp_combo_toggle_c0_pll_reset(void __iomem *com)
+{
+	qphy_setbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL2, 0x6);
+	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL2, 0x4);
+}
+
 static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -4340,9 +4610,14 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_USB4PHY_RESET_MUX | SW_USB4PHY_RESET);
 
 	/* override hardware control for reset of qmp phy */
-	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
-		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
-		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
+	if (aon_toggle) {
+		if (qmp->qmpphy_mode == QMPPHY_MODE_USB4 &&
+		    cfg->regs[QPHY_USB4_AON_TOGGLE_ENABLE]) {
+			qphy_clrbits(aon_toggle, cfg->regs[QPHY_USB4_AON_TOGGLE_ENABLE], 0x1);
+		} else if (cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
+			qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+			qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
+		}
 	}
 
 	/* Use software based port select and switch on typec orientation */
@@ -4362,6 +4637,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	switch (qmp->qmpphy_mode) {
 	case QMPPHY_MODE_USB3DP:
 		writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+		if (cfg->usb4_c0_pll_reset)
+			qmp_combo_toggle_c0_pll_reset(com);
 
 		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
 		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
@@ -4379,6 +4656,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 
 	case QMPPHY_MODE_USB3_ONLY:
 		writel(USB3_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+		if (cfg->usb4_c0_pll_reset)
+			qmp_combo_toggle_c0_pll_reset(com);
 
 		/* bring QMP USB PHY PCS block out of reset */
 		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
@@ -4386,6 +4665,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 		break;
 	case QMPPHY_MODE_USB4:
 		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+		if (cfg->usb4_c0_pll_reset)
+			qmp_combo_toggle_c0_pll_reset(com);
 
 		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
 		/*
@@ -4574,10 +4855,16 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	qmp_configure(qmp->dev, pcs, pcs_tbl, pcs_tbl_num);
 	qmp_configure(qmp->dev, qmp->pcs_misc, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
 
-	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4 && qmp->usb4_phy_submode == PHY_SUBMODE_TBT3)
+	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4 && qmp->usb4_phy_submode == PHY_SUBMODE_TBT3) {
 		qmp_configure(qmp->dev, serdes, cfg->usb4_serdes_tb3_ovrd_tbl,
 			      cfg->usb4_serdes_tb3_ovrd_num);
-	else if (qmp->qmpphy_mode != QMPPHY_MODE_USB4 && pcs_usb)
+		qmp_configure_lane(qmp->dev, tx, cfg->usb4_tx_tb3_ovrd_tbl,
+				   cfg->usb4_tx_tb3_ovrd_num, 1);
+		qmp_configure_lane(qmp->dev, tx2, cfg->usb4_tx_tb3_ovrd_tbl,
+				   cfg->usb4_tx_tb3_ovrd_num, 2);
+		qmp_configure(qmp->dev, pcs, cfg->usb4_pcs_tb3_ovrd_tbl,
+			      cfg->usb4_pcs_tb3_ovrd_num);
+	} else if (qmp->qmpphy_mode != QMPPHY_MODE_USB4 && pcs_usb)
 		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
 			      cfg->pcs_usb_tbl_num);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h
index 396179ef38b0d4f0b7538c0d74b790d61139f9e2..d17571eff23bacb7045b47784930263c9ddd6964 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h
@@ -14,5 +14,6 @@
 #define QPHY_V3_DP_COM_TYPEC_CTRL			0x10
 #define QPHY_V3_DP_COM_TYPEC_PWRDN_CTRL			0x14
 #define QPHY_V3_DP_COM_RESET_OVRD_CTRL			0x1c
+#define QPHY_V3_DP_COM_RESET_OVRD_CTRL2			0x20
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
index 4f387c8ed9e55f85ae5c124dfcd20de38454d718..faebfc854066c2d5d47640c9e92fe07fa3c929e4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
@@ -30,4 +30,26 @@
 #define QPHY_V8_USB43_PCS_EQ_CONFIG2				0x1e0
 #define QPHY_V8_USB43_PCS_EQ_CONFIG5				0x1ec
 
+/* USB4 PCS registers on QMP v8 PHYs */
+#define QPHY_V8_USB4_PCS_POWER_STATE_CONFIG3			0x0ac
+#define QPHY_V8_USB4_PCS_POWER_STATE_CONFIG4			0x0b0
+#define QPHY_V8_USB4_PCS_G23_LOCK_DETECT_CONFIG1		0x0e4
+#define QPHY_V8_USB4_PCS_G23_LOCK_DETECT_CONFIG2		0x0e8
+#define QPHY_V8_USB4_PCS_G2_TXMGN_MAIN_RS			0x118
+#define QPHY_V8_USB4_PCS_G3_TXMGN_MAIN_RS			0x144
+#define QPHY_V8_USB4_PCS_RX_SIGDET_LVL			0x29c
+#define QPHY_V8_USB4_PCS_EQ_CONFIG1				0x2e0
+#define QPHY_V8_USB4_PCS_G3_EQ_CONFIG1			0x300
+#define QPHY_V8_USB4_PCS_G3_EQ_CONFIG5			0x310
+#define QPHY_V8_USB4_PCS_G3_EQ_CONFIG6			0x314
+#define QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG1			0x340
+#define QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG2			0x344
+#define QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG3			0x348
+#define QPHY_V8_USB4_PCS_G2_FOM_EQ_CONFIG5			0x350
+#define QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG1			0x35c
+#define QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG3			0x364
+#define QPHY_V8_USB4_PCS_G3_FOM_EQ_CONFIG5			0x36c
+#define QPHY_V8_USB4_PCS_LFPS_TX_ECSTART			0x3a0
+#define QPHY_V8_USB4_PCS_MBUS_CONFIG1				0x3a8
+
 #endif

-- 
2.55.0

