Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522633CEBA9
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447055; cv=none; b=bmsreCtu8TkEhEqI5+GhUQE4b32QzhhbSrdo4NtX/GTSGU3oT3NFS8cDvPOuvFOIgnvN1WZ7lgctC6NsL6ES2aNg9ecgd9bqZHRwmID50ut7ZhsVfHtEvt/8F9YtfnWRikkh72hgFOHXc7uws9AqN9qZNT4ouv3bwgrFf6s3bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447055; c=relaxed/simple;
	bh=CUnTFCHWUAyjtA1bNUK8pNRsYyQp335W7fx2Ye2Gdj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhpJyd1JOow6p8r2crrnKCuOrEyP3t9VXzZhGgEbnqT/aWGaRuWkXcQbScMHo6rl234ui8l7QnVIvdDKmDA5EASNzsj6ML2QsrUNK3rVHTdB1vswPX5VsHLI51wu7nAzSc0W7r0Upu4eNW5P+3M07bgmXygGQIc5XABJakBtDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YikxjXnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMM3tmIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YikxjXnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMM3tmIl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K23T3190804
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 08:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0EFWsqiQ3Oi0MxXAuNF7sFIUEOzc5RyDT65
	jmaJtpiY=; b=YikxjXnJgaVl/qCOF6xg6xlq7Bbs7uvGxl85u8njEta4u2B5/Ym
	9VFA6V3nfjElket2ZlvkLGFy+og+mPv8xynt7HKfkJiNBTYhexSXHlXbyYuQ1uGj
	59WXeD0zYyZ92FN8/PqwdNC4gbTTZpUnANK2DKXFsj4L/AYMBVEadHAlfSeU/dSz
	Kx4Jbd9h7CWWz5YPgguY71B4l9yqFH5+4UR00wYX5EFzykVKasAZaM6G0XgM/DX+
	tMdsfYWS190Av/Xa5xwSTYbOeUJrmmNikBFEECh6L0sDY03UQE/KJZNQzxYXp1A6
	ueidlkSHw8eamJnkTzbpS7yHnGM0qdXhyow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69vg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 08:10:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so10247249eec.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 01:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447053; x=1792051853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EFWsqiQ3Oi0MxXAuNF7sFIUEOzc5RyDT65jmaJtpiY=;
        b=MMM3tmIlKr5vX/Z3js5n+egJlInX0wqurOsh8XIYy+lSJ8GON/JRTeHuT2PNpAcRVJ
         AoIDbIE5MPZ1lpgetMG7xPeOP92lPtwH5X+60AW6DBwMx8ZBnHgWQia0EA9LqsvXgUI0
         fivyWYszBjH8KXyt4YKo9dG8G9VHhGPRy5W0Ct9orIj/0znVrVqRy6NTQTi5xCiucBCT
         KQa9oGvxwNM6p5oNoG5V9/2BtSta6Tgn3FOwuwUiWLNso3HUDafhDJHoXERA5WfX0VK0
         Gr4SqzSKWITDpd1Qwj7Uf+rGljJVxfrVleQ+hbUbywb/uP+TbjNZWIZSNa2zeDAjOhda
         iGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447053; x=1792051853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EFWsqiQ3Oi0MxXAuNF7sFIUEOzc5RyDT65jmaJtpiY=;
        b=LJXGecYFVjvEqWxEPvMLvFt0mJ5IeB28yFxSWgq/MnYOBmxcJMvIig5qv+vi09RIZz
         E/HpmjqwywmvHmhLZ0mfzfqA5z/ie3gIIIVEelmKcBXZy5H7J4d63eEudwUvSK78X4GQ
         VC13iWwdvJfveCHn7NFLsNRe6F22xS37MHjpivRW3N5W/GkKSyD7oQCX7TtqWkeZU/1U
         LgVR/UBFzQNr8rZQRee/bMIBDlAOrvPkSfexwblmb9AGoDQrJRwXefBy5ml3f5Dxdp24
         Jk9Y0ff+jWxNeAi5uwaBFdjteBxigXByV67FDXi3fPEu05c1dBcJp7g31vqTFP/okqfw
         iuiw==
X-Forwarded-Encrypted: i=1; AKwUvBxE4dsOdKX8h2IunTMLasGoCsNB5IFz3Oq4pgoOOrQcd0rJTw0iWe/2oomuixUvdwnbYzlnBr7AT5c=@vger.kernel.org
X-Gm-Message-State: AFuF++lqH53Vow+95OC8Ki6umiWibTLxCQFcjTmkE7BTR93763ySnhqT
	kk7lS0aDYHna5HGZBjfPb+cTmm0lE6lCdCxBrRe5tGuZqUIY408MyOWo91cmWRvIr4fd3JphrbN
	OnonryYPZbZLIePECGDuRa8NQe0MX2eVL1lDrbr8TTXMjcpdfRV5xpFgQvdhuvl8=
X-Gm-Gg: AYBFou0fduGDzUS3ntWmEKAf8eOnGJvzhCpy9v3Q8PwSkmJZ7qQKd1JEolBGDVtfXRR
	3NoH7YducIT0YrAyCTVSIsXWmaFoz6KAd8sEdEnEkMDKezi2aYIJ23YDIMYts3xp9s4ktPzmfUz
	xGGtVAkKWDleGuULBeJdxuoVFXkDbmyGJV4BvZAbZ1kibXYKGF3fHXfbwYsUZesj2u4CFteZtXX
	uxbjW3d1DkY8tbakINP1MSmeCqkk92vJWBQOA3WJ/9VgIn5kUR00pXaM+Nmp5qw14pK8F9ZPnpB
	eZSoZKKOxwzix7BKMMaE36CwSQAcmTiOLbVNDQVR57ADuclh9VHu9gEqH4aZj1Tb8w7UOQF7c3H
	PuEARAOO6hTTh1Z4a3uI0mH3ok1Hr1ZAVstzzWntLsgh/m6hhGgtsd+oTkPs=
X-Received: by 2002:a05:7022:699d:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16208807c77mr7082236c88.37.1791447052643;
        Thu, 08 Oct 2026 01:10:52 -0700 (PDT)
X-Received: by 2002:a05:7022:699d:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16208807c77mr7082193c88.37.1791447051951;
        Thu, 08 Oct 2026 01:10:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:10:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] qcom: videocc: Fix sleep clock on Glymur/SM8750/Nord
Date: Thu,  8 Oct 2026 16:10:32 +0800
Message-ID: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GlkrP77f-y7WKnWMOyVffEmWWo0-tgqq
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7500d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tnQB6NTvr8Q-iuunBwcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: GlkrP77f-y7WKnWMOyVffEmWWo0-tgqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXxrArV1G2mWb3
 tZaOSbhmEnPxTTdPMXQL1YHFx3Qagl78du/srXvAZbyc/lVT5N7wBQr16Z+Pksbak8CdtshcPIP
 MihPXzNjPPC/2oM4f3iaylzGT2eKKFF5YOU1hV2vBFByPuX8WLlAovddNO0yVtEl4kY/ue8S+X8
 hFqd+DZnxDBfX6Ar7Y1jgEABm9YF71ld9QpZZDV1uhMhjIy+kXszUNXhsMNyp5VhnA1KFUq2ZHV
 v14BRbCIB5k1guG/o4+KCCDcRW6TrH2yvkqK/ngJRXzS/g1xIoclIjS5aotn7/UiyZQBfXKSCu2
 NDbxBP5a9N5vSAi7aeO3qV51IrUo+aJm+IybQxICPgUCKmONT6T2TPVr8xcWIecDLWmnvbrr/YK
 Elz+4pORoNUmQqFh+prIre1rrKQi4cVvMWeQXfhw4VVbMjg4NPsZYksaGwi65z4Fr6hdr78jAmH
 TXUeZ24ktPzURORNimw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX2ykcXHyzCAJw
 Gvnje/2Wi/R33udUgzZFtHh24hMftN/wYtmtxnswLeMKscbfC38Ckjdql1PQRYWdJnQK1cFS7pi
 khSB9WXXZ5psI8/LfBproy6pnWDkSYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080032

The video clock controller on Glymur, SM8750 and Nord has three clock
inputs: the board XO, the always-on board XO that feeds its PLL
reference, and the 32 kHz chip sleep clock that sources its sleep clock
generator. It has no AHB clock input; the AHB clock the controller uses
for itself is generated inside the block from the XO input.

qcom,sm8450-videocc.yaml describes two inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. For these three SoCs
that leaves the sleep clock input undescribable, and describes as the
second input a clock that is not routed into the controller.

Patch 1 describes the three inputs for the Glymur, Nord and SM8750
compatibles and keeps the two-input description for the rest. Patches
2-4 bring the Glymur, SM8750 and Nord videocc nodes in line with it.
None of the DTS changes is a functional change.

Tested on Nord: video_cc_sleep_clk_src no longer shows up in
clk_orphan_summary and is parented to the board sleep clock at 32 kHz,
and videocc keeps working with the GCC video AHB clock dropped.

Changes in v2:
- Rewrite the binding and DTS commit messages in terms of the hardware
  clock inputs rather than driver behaviour
- Drop the Fixes tags
- Rebase on next-20261006 and add patch 4 to fix the Nord videocc node
- Link to v1: https://lore.kernel.org/all/20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
  arm64: dts: qcom: glymur: Add videocc sleep clock
  arm64: dts: qcom: sm8750: Fix videocc clock inputs
  arm64: dts: qcom: nord: Fix videocc clock inputs

 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  3 ++-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  3 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          |  3 ++-
 4 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.43.0

