Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987923;
	b=5K1b99Q8QU5kOhoW56PX1qm8uOcq46Gswcrv8JtadTpMVKdu3KcgZch+DBHjq0gymIao
	 gnBrY8b1t1t5H1Ds2tcM5hAcPEpTtRympEyCfeJmlxQ0Y79Iuxxm4fvk1MVEzeOmuYEdr
	 7gIzjfPQU5OlvCCXwmKbCxhmbNaWNtOb4rhOhmDtjIUBRbV3KCGI5v5I1MX9SFUna6zXS
	 jqTuMrRzAw/0zWHm87HIl8fHzzTpwsMgvEIRTlqEt5nvIf9vvYkLLEmVFRkdxv88M6tFP
	 FpEOma7RwpsH9zRAQICaUUSPwE4E2NmgC7mmrOzcStpCHMHKThbY4ri4jbLQUTCDdJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
	b=dai7Y9N7ApYMfWlG104Ie1CuWCfmu65b8yEVaknaZHpbsk2yU+uPJ2gL1f5DemD4s5mT
	 wS3rlQjvDEbl1LO2aba0Fahalcrtk+j7w2So7/Rr/3DjAQbixmgiHlY5CxLGJVp2mjC8A
	 YTkIE2ohlc4N17g3rvB1w4eM+XcJtknx2xMKn/cNe9UjBGGVP9mLQa6XNnMy3e+TWmJpg
	 XHjtd5MXNNeGe4e/psMPSzIY5/WUUJyWwF75z8vh6hptAlxR3xtlCM+vq+VVRyvRjYNEw
	 Q2+DnM1coyppUwVVsJZrR/fBFHZbxYdtYK8PSq/kwNiLj8hsPlBIliGqyb5X2j+6qGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E4606A332
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0E4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V25T2106361
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=; b=n+fy6kSlAp+Qpq6q
	hl5bpyy6cMt6ViMoQJUsMHvRXU4/qfxwimtvBG6qIQXVKx4cQaLwZh7WJ30jzp9Q
	OoAFyEGIeIKB+WpybCAx7ydQtKAIt9iT2ZXJSaBcaGebZe9mtCwSeTaWGzWfqwSH
	AGnd+CEWiy0dgNiWcyL4r+FNKkGs2VQJ7O/A9RZ77L5Sd/MVEKviY8HEoUm1gX+M
	CR93ijddScY30tWT6PsHtB/3s9ehdgHyVYrR41onVmpDsqDYMzGaIHpgZNQwZJJ6
	S8pU5bzLEZAusELHxVSKN2E4r6kKvkEKeyKFteL72anrW5+a6xcR00Tg1DvVCuzV
	ZegaxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8stmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131befso124302885a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987921; x=1795592721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=Xz7fDdmCFtMBKePfbig53C7bnJbiX24Uzjw/CL+hpPXHYn68UkuGlUFSux+kAT/rKN
         uS8vUBsuPPIg0+bgroZJT5ZVIldSER4KU6Z+5LxdsOfkAjUuO022oGA1KC+w7i3e28Es
         SnNTwDvxPNugfB+MgzyNivlRC83C7Low2Fgr5WGV3NUy8nUmhXs2aq1VXwhT8iQMpNcU
         /ORXfmUXn+7WYG63Cv8lCJApXG6ZKZDn27R2iucSW5wTuWiGOR0xCDO34KUYCsFoiofh
         dVRk1RjRJYQGerxK/TVv3GbRMpnaer4c24RSv96mSS519L54YQd7GlJawV4g8pYK4FG/
         LQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987921; x=1795592721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=t93MnKXPwINKrc/fzyzsRBrKlL1Ilcv7hgmn+VofpSmlgFNBrmJOM7yjbF/fTd7zVO
         LFI9oyMdyCsOcu7fefIbYbZKMqWHnm+UR9vcnJLPUMTnB2JoBvoCdBu/6QcBEY9LVXia
         cTZgFM8KoYfRRUpLzN70ZLitlHOf0kilBYRIVFbqiyLms0AZmQNPVvdFwsN+DN0fYXDs
         weOH7fQDBRufSZZgaACMCRZuEBrO+DP/POuBRNMVgNEVDJWm7ERMASXyGN8BCSNV3Bu8
         V/kKGccWD83ub1J1cl7BBqUyXsUsAycKi14kykilBWRsuNRqM8WtES48poK4W5Egt0EJ
         BKPw==
X-Forwarded-Encrypted: i=1; AL+hErE/+wGoaCsAZdAi1z3CKb7qKNVbo3TxPEKUUWraf+Tdt/6vly2TX8nj26wua9JePfXqLyR1+qkm6qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8C4LlvUdKTdDsnkXbbda8Qw8U1YgOD77H3vhbjClOJZj3A3L4
	dcxL0y5Ryel+4TTIr7tKkH98ppEtP9MGVNfe63/jGQGYYMSd57uo9vPwta3bJu3xa0qmiupyPLA
	psA/sFpJopaEjnL/oX5zzo0cXNqPJmnSNWqxpNi3kSRlErg06cFpoD1mo30U8wegn63Tk4wfqKg
	==
X-Gm-Gg: AYBFou0m0UorQLC1+oug2mFix+rZlmV/YmDp6xNEc5n48+fsHQF+AtsAChn2ab2jzCJ
	IuyS2ni9NjRCa/GLnjdxldlwi3rtfXFZMUGqECjhBYCH8RXde4O0frrou+MRULuBiv/uHryUIcn
	MTk7dNp7D9CtLkzk3sCrZBJXWQ9VHaV2WrcBeFT8lgqz3ZGsQk55wjeAdvHmXbD5gqgrdDr4jBy
	bTXdKx+pJToDfzLmSPu+iJUGV5E0MdJtvMo7s9uAgs323U4no19HOzTH0dqTDvxxWBLdFoyWdrY
	CIL2N1Uu/7GKqgS5/q7AGvtQ2V11OEg1WObS+6tpL6gBM/UPMYlEcUeIOqR/aZmTmlmHRehr13b
	DFPkL2YdhAjx7tfIM+2cYG/uaIb3v0n6CwHTcmH9Q6b+aQ8GIHY7HIECO7t68rF2jx1wOPT9x5i
	Qu7FxQ6UrBeH7+Aq/oRPneCsccKsRp4fKg1H/43GVh
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375421185a.48.1794987920783;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375417385a.48.1794987920242;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:05 +0800
Subject: [PATCH 1/4] clk: qcom: camcc-sm8750: Declare icc path dependency
 for TITAN_TOP_GDSC
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
Message-Id: <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1293;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=79IVsXZe4aT/7ptWNdZZNaBzR5Xk7vaBEe1jnE3m98M=;
 b=Z5efrj+oMIDOmtqyXtESvKHicOBB40oIrri7Qja/vMJb8yu2klcQ2oTmlLcnutvKXS7fjGc9c
 Y3dRuCZ7itcAMWRSDdKW1ZPtQ/iu3/w/1mBNcTzkiSvQbPHi1Idu9zE
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: CB3LkNNegmsO-5Bn859sZASn4O7mWE0A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX8kJvjGqz+UI/
 3izET1c4tzUUxl5lSDEtmKPapBIx+LNrgZjCzoIKcCsGx2WD/Zt3hO/wmeFMjFxPV1xjrrpdett
 3idYBQFjTnV+wHEAyJT4AQTFpHUcKII=
X-Proofpoint-GUID: CB3LkNNegmsO-5Bn859sZASn4O7mWE0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX48YnGWa0EWBN
 HdYvVGEQKK1RtumGvq2MeOKxoG/i3ifLFsOpah+OSA/vaxDFTw8fMo7nFqXXE9zo1uQMNftlVWO
 TFGb28bV8tLe97LJKzwUTSHThvLAAGbHB8jX2HgUkQ4LdXUuP7cVVLf+mFQF2j4q6zJZyXgk6ZR
 XSUeboS+HPTefX6b/i4UDeURZjwXvrLAK77LkZdBVwKUD58d48olfrqABOKkiUmKwImuSH5dgnB
 1SAnrIeBzDymYYAs5gJwHD7Riar/cRH/R3kO3NpFS7OXtgkSen4ZXiSQ9Jg89NK0vHjH4pIgfwv
 Q7RTZzoDdFFvKDfStNdpcWIZJtLeajG8LhgVXWk/xLie3/ekbRoAcSj9gyHmBGu2I8vLoLXM7M1
 gwbLUdmA9qI6TXYMzEeK5N7zIoNwCtFgIUeZ8dF1QaVooeG6r9xNQP3w4IjCn599sD2DfuLRY+9
 G4lCde5LtvE/J9lZckA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5791 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 4dac298f06b188e78a61121bc9452f7246e59c56..96a2a50a02bbfcc3730bf6737df7bf09d7c09fec 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -25,6 +25,10 @@ enum {
 	DT_SLEEP_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -2432,6 +2436,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

