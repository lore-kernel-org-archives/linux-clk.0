Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234373D1AA0
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407340; cv=none; b=oM1OPyLavKrDlmL5mQOWLtRIgYxCjjCPy9XuwHHCWK0D5Qgq3VWJrmnrYwYMCImcrC4jIQ5Xe0J3iZPTyK1Ifa0hrnyS4MWmeV5hmH0AqwfUAeg7RBHTsemlB8s77RN1SqceR8cO0/x90Ty4fLVRNW+qBPPaKqav0sifuj9XXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407340; c=relaxed/simple;
	bh=5aqaw6YW4IIMZcy7fC05XqRq1jJUB6isccswDaJb1rM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ns91JNczhOcWVo3vKUiU6571p42QFvC7uOzy9PE40+0IMHe/pS4KBfeg+70dIeEMGM2aj8pQ+sIMTEIxzIJB5zP47t+HvBNt9m1WGkYfGR2HK8jMNTA5lL7lGWf/UUXvlOOcXXc6VhxEPGeCd9qlBxSI3k4+jcPa7I6WaiZCazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrKfhp8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqgu+jit; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrKfhp8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqgu+jit"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6676WFL22964352
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=plZmmgW/vfRTlgrCgxSjmy
	yjMpbVJtQhI7sienHZwio=; b=XrKfhp8GnFmsxDsWTi2OQVe9UeoQghwh0iI8QC
	ol2G+E3IqPduXGgeO6nwMMBqOJrToUIlXTDfWmjg/+U29z0/keDH7DlOPZRPseB0
	Dr0NHRRksIAa2Iuwqavoj9Lsst3q6p13aEyxXkKpb/5sKpzk921GgcxZoUXnSQJg
	RvsrdwwiWp0hqtc9BkeI20LKHoPXcYHrW/AsQyL7p/8Jnt11GqWw9tt7UbDkehBZ
	lT/nxhoHIDatwGFOUe2q4g2rl3vHXU3UU3o4k82DWc/UAJjKBZggssWDwsADHDg8
	eJLp7eMIRGt8fTksn3hkPXW/3ZgPEC+4cWu7VvIKwk0e6Glw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a82v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 06:55:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so5615247a91.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407334; x=1784012134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plZmmgW/vfRTlgrCgxSjmyyjMpbVJtQhI7sienHZwio=;
        b=Cqgu+jitaydOCCGE8EM78FflkOYfhVf5wtibCMw+jfS8exRraV4TQiRfTTFHoP5QT5
         rcb8w2Ch6LIM2ZPlqpSUD6F67bDo02VYmCpqhcahHCs6Aq47ao5yRbBTNNword4z5314
         GFGCvoMvZu7db/3dNiRpZgfY/zNNCTd38Ihf6iMTHiL7R/ktPHM+HNZys71yaYGg3L6v
         7S+M7ap5vmrNqaee3vKR3sIrqz33Tdcn7UCE7av45tcf6G6A9wfSWml84bWVTB7e8oqL
         t/IV8uHPPkIMIyv5yk1qMHb4O71j0x0fFp58rN5gWC6e/bXWltfKF2lxy98SKpZqPSHW
         2A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407334; x=1784012134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plZmmgW/vfRTlgrCgxSjmyyjMpbVJtQhI7sienHZwio=;
        b=l4o0PomHwjdFzaN15G7H/HzqIannMvQEJQbUXX7GoN8j5Av4pukQjnQY/wVDWeAIsR
         +uS6YG+j3J/ZcmSzozvygBgKnOmC6Dp8P0TYWuO9tWkX2GascQFFINGgOqsfyirxxEng
         evP2wpq8PIeizJhWzM8QJX/3AhKyrLlS6iNFGB9B1f2wD0zL4CMPwU5NrZE1asKZyA+A
         sItQkOjXkRfeNwl2E8n1CJ1Kyn3QTFvhxI3jSKxaTSErI6XJRjpDrKMAWNKIW2vO2yUT
         YbfbV6ss/ZtrbZD2q0m5Kpkd3CFAvDV26RJLBCuqwibuU5tzjaRtLlfnofJFc2Qdj1c2
         AssA==
X-Forwarded-Encrypted: i=1; AHgh+RrT3CDw3C/a3vZvuroMEOwBuxy+MjD1Aqm3v1x2Dt9EJbTc3RBMsyz/HgWZIFFXxmZcUWak2txoOfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jnVi/e4V8jugmaXWg6ckAJx8pVFKG7xRqEsPVcqJPEpRbaVk
	akzXPaDuwtr5fCGMzjSoXJYz4PMuJn4SqfpTGRdtC3YB0iGgffzccMi/BMmcW0hE4Tv1krIxF/G
	cYS/TH4+psDInEvgsdQqef9mn5xe3O77aKrpiOsSjpRk3V7W3xZz0y9C13MNhohg=
X-Gm-Gg: AfdE7ckj/jLRI+WhR8mTHYfxKyB1QUlQCPGsCLh5Xrg55FFMPlK1h4s9y5DTvu4GjGO
	UYhZ2ZhAmL5kRAsXyCWLE+uMSf+y9+oAvEzoXEcmqdTMcg4M5lXX07i8D1bDaGBesZLlLxYH5Wm
	6m9aDKm+dca6dEqR6p83np90SCRJwSMVDRt/GCTPvf2w4BcKKouFyrZsqJWLo+HjSVhkMNdHFJ/
	3EF0uNSKvOqpKcu8yb7WB0IjOkVNLCKLiMHzudxXTWzOjt8XVd/bPzP8YzrEbTY+ouBnefe3xhX
	vKseaCBkdkrUpp1+mimWgfZu3L63/TqUqdgMYucWaPm7O1yrLpDEN3aA7Pk3uB+49qiROddGcjs
	8reDvXBJbDrxyviH5E24DfADbgAeSTyeUpymIEbUr6EE4TgJt7S5Iz0SN63R0/l6RWEP3Lvjma2
	vObWIvf7qpZEoPes79s/OHijwEo/e9EJWPjhHh/oYYTlekqQ==
X-Received: by 2002:a17:90b:4d81:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-38755c4aae4mr4027494a91.8.1783407334178;
        Mon, 06 Jul 2026 23:55:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4d81:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-38755c4aae4mr4027454a91.8.1783407333717;
        Mon, 06 Jul 2026 23:55:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the clocks needed for the REFGEN block
Date: Tue, 07 Jul 2026 12:25:22 +0530
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqiTGoC/yXM0Q6CMAyF4VchvXZJBVmcr2IMgVKwasZYhZgsv
 DtTL7+cnD+BchRWuBQJIq+iMvmM46EAurd+ZCN9NpRYWrQVmu5kJMzO1thEHkb2Db0meqqpHJ2
 xH5xtyUG+hzzL55e+3v7WpXswvb892LYdF7wPh3wAAAA=
X-Change-ID: 20260630-b4-ipq9650_refgen_clocks-39c80df96ac9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: QAxF-VHn-H3CU0FWYOtobuxIK5G_pB-B
X-Proofpoint-ORIG-GUID: QAxF-VHn-H3CU0FWYOtobuxIK5G_pB-B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX73K+ORDZFYem
 RHPNI8OMje1h1rJ0bcARc4UO2kcvDurf3UTvHskl+WFQ6W9//lWUpqn/YolFk+5s8e2NYB6mPp8
 RwcpudK3rIIhGPPrKUV7A3WCuFVPI9w=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4ca2e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fnfbLKXFiFqjf_-Ytq4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX9KJL8yCD2f7e
 6i7Hr3sXcu6jIvEqfjxAjGyaN9bKhI2fwTcHBNWiencHnt0xKNL7YGhnlg1xRK5/+ohUeyTHMKb
 1kj71WBh01r8XARB4pJCMJjI8Kv0DEChpNQ8LShtrzDKXytuiv6b53OpQAqlC3fumlhZmUowAMp
 FZYi8vMdeJrXZqjQYxq8+cAglXFjqKHCsYRivrZNRxF63jgfd8dkDd5MRRTOXb51jkiTCSFP+0k
 s61+vw6UIshR4ZLYvHedIMvIr9HPbejZ5eYfcq+NTJuRAYHc8GUn0S/9nvDloRgLBvKnorQucYF
 +b4OD79J8425Dc9fzlrbqJTDi7MoSimW+Tdh2jtQyyHX3B1Aln5oRUBEqvE3BfHHuepxlTztWCu
 A9/T8Ciq1c1rWkr+sCT1zxaTY94wBBB/69IkSzxrmalLO+Imi1jpzLydEgxXvKXK2eaIs9xGa9S
 zFchRrV0JTmBND+k1+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks. Add the required clocks for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
---
Kathiravan Thirumoorthy (2):
      dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
      clk: qcom: ipq9650: Add clocks for the REFGEN block

 drivers/clk/qcom/gcc-ipq9650.c               | 89 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h |  5 ++
 2 files changed, 94 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260630-b4-ipq9650_refgen_clocks-39c80df96ac9

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

