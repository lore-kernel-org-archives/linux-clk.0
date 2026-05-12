Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5E397B0F
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591698; cv=none; b=Km+cqHLZrECFt9qZKUYNXkq6Lig+2CqlsfwmqSq+gpKVxye+i4x7C3maHlhkhlwaOUjivucM+T3fNd+N2o42UM6LFMy7UNqAz2XXl1IBvFJ96exQ2rVcQcIRXw+0nd+IbA0nTwJry6yV7ZCy4EdRafJOnAVzjGpq/nBH8c2AnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591698; c=relaxed/simple;
	bh=Xx7quDkGTcXqy8A34xXdgDjc7f6bHwDcpF39fYmOOE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JQzQp7Yo3VuDoXAvRiiHisUXTrWMH30QWDGX2dZp8R36Y9SBA1hBD7pTYONivkozGWq7wZGKnJ0jge5e1jvUpsLMSZjO+L6GqMpFjpKdt5Rs/IlxmVhmlK1DfyBy3mtECmEe0iIXUdwtu32PmUC4qnuks/qKOcX3m98+F2uc0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDnlx8D2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X71l0Ktw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDnlx8D2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X71l0Ktw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxSiR129277
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C/yuXAzMWs2KK27Ei39QEN
	QP5VvtJshpMiuvn624gtM=; b=nDnlx8D2RoGgZmrvMqJf5TuwRfKX4bS7fjvR5l
	MXcdhCWsrfLTFWKWs7ajF8ThHiwbf8VrFBVM+WCCw9uexC9oq1eGN3f9yZbz54l5
	K9Qy47Ild1L7wAzIv7NT6w8wIqjJKVJqEL6ZzuwHF6wUmDzmxKUSGHbk1TEId14l
	BsAm7i9aMGftjvqC2Ssv6nZ6XZE3HqH5hV8HX1Cj9C5iCe52ddU0EWqrCSfeKWRC
	qU8dcshSE8AZx5+DR23Q6R94TH01ve0guvGDDJIGcM/vBOW5GKe/7DRTjwSPRRFj
	JY/K9GMBRaJoU6nPutcJkic5I8mGU9WTQCxdWPf07x5RqfSA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn07j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:14:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95f85a1db6aso35100241.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591695; x=1779196495; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/yuXAzMWs2KK27Ei39QENQP5VvtJshpMiuvn624gtM=;
        b=X71l0Ktw/EldQasEMA47QZCeM7wznw1mcZBEDFUxTlGSBqXP9DzEYr2/fx+t3vmVr6
         2CllqS0E4L5jkt3hGxibyTVg49ev3Za8rGnNL4SjFFE3THYGYhqpnE/SCke8WgPI/jhN
         HWYAoJ18c3eGg3OLrI81EoFYUGVWeE4JBYMp8me0YKsl4RA374RYlUgS8HxoGs3UMWBh
         LxwxkeZzpsuYVRHquvUDH1Auah/x0pBPPLtudEmfpExbJxTImJph0u0xwpwqvepaQvbc
         /vwD0pPGBUrg1FIFS0uN1dtxVkDblCrAi2soCUQMI0sA47UghM6/6sdPWPvZzy4LqkDr
         6/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591695; x=1779196495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/yuXAzMWs2KK27Ei39QENQP5VvtJshpMiuvn624gtM=;
        b=KWIV4ynGGzdiMhCRr8eyNkxHxsSyJAW9hH/g89RTy3X5K7dAyJWnNtmkICmyXCEMbr
         UdL+QNL7kmJZhZAgXaFFSzu29bb/NgO8H4oKcIcIu0EECMrjtwBdR0gESJmf3j2OMYik
         R7O3F5NYuo8fZ3oDxHT1Spg0s+L4Ig+lsxFmPatDpAaJ0eRKOReKc+/juxb67pOSHjwl
         aa9UAlLZcttOy1pVtEhqEyx7DC5o6xDBZ4CBP+f5rhHTL2FZu6pbiUf475+PBxBUtdf4
         xEw5+HonDenUvPuboa0JegTAnl+HLJwgdmXArqjAhUY/bK/edDdlp8AkGOoVsg9sE9p7
         ofGw==
X-Forwarded-Encrypted: i=1; AFNElJ/wAivp9N0/HbIUAshQNWux1ErST4xMEpMTjEH1tpkyLJhsbsZBIXhqei4OW3Stdi4GnFbZAfwDBB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztx7Fh3gD2KJ7lFHxPAYSLA4cs4Io5uJli5SMKtX2eAcJwF0id
	DqOC2WG/qbkU4UvPkF7ByqL4gQWqok3cS3t3Msp6RSV4cECMYMIImQmx0bik3O7yZy9wRUnBuqh
	emlwJU50f38xZ/s8TFixRH1ug488o5x4Enedu74Mg2spwOV1dx6l63e6Thjwjeoo=
X-Gm-Gg: Acq92OHMRZY1iPDLBMb1sA/HLFuwS03nQuLiaj1mRZjYUhv3V12WMMYIp0oR7t9KlO7
	GZyuRVSzddfgsgXv5WLI5yWPbUOOC419uADFzrr2AiZDbyU+tZvIkIu85CqPwe92WdJR+7qMsbU
	ZaOpbuDHc02DiS0uY1dLmJyRJaCAITWv4h4rX6arBRWQvVGrAHhxzFQ2Cz+4Ls6mdjEBvDax9XD
	qRd4SGWyCiigZFlmN+EGAiO6SyYmEtbIMlV1xDO1fYGltQFPaoTOnf8fGB7lmB/BZOEHS77jeNJ
	s0yBHSPfaJ5+jwG7HauwUv1HdRBUGib+luPf4le1FyL4sUEQUUd0g4KmHYL5G5DxtErwAHepFBU
	Jjs2SqCyt7SHRo7dpTldFNpZiX/ctMcxLP8+IY3tJbY6GP3NehRCPlwFG96S073kFJ0FQDKhTbs
	G7p7VXX5Mf/S0tPM5TctCd3XV3Joe/LPFvyD0=
X-Received: by 2002:a05:6102:1483:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6333040cec3mr4176973137.9.1778591694991;
        Tue, 12 May 2026 06:14:54 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6333040cec3mr4176926137.9.1778591694506;
        Tue, 12 May 2026 06:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] arm64: dts: qcom: fix power domain handling on
 SM8250
Date: Tue, 12 May 2026 16:14:49 +0300
Message-Id: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMknA2oC/43RTW7DIBAF4KtYrEuKhx9DVr1H1QWxxw1SbTeMb
 aWKcveOk0WzKGo3SA8eH0JzEYQ5IYl9dREZ10RpGjm4p0q0xzi+o0wdZwEKnKp1LVNOJFccF5J
 9OksaPFgl+6A9QsDGhEbw3c+MfHpzX984HxPNU/66PbPW2+5f4lpLJQ9OW0TnwJv2ZSLanZb40
 U7DsONFbPAKPxioIgaMud6ojmu29aGA6UfMlDDNWKP66Dzapg+ugJlHLJQww1jgH0ZlmrrzUMD
 svzDLmIoA2tlOW29/wa736WQ8LTzs+T4icYiEciuleV+NeJ6fh0gzZu5fvwHFty++JAIAAA==
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xx7quDkGTcXqy8A34xXdgDjc7f6bHwDcpF39fYmOOE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfMHm9hknKKYOrEEhLmKfvJM32CvqBnmoOft
 Cnjs5mdhJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1dCgB/4uWnaUyze6CAarR7dazGrInghX10aGbEDFcg7BxCj91GMd9EtngJG49JVUGJ3/gj560OR
 wa754NH/HnKRRG+qz/hy5CoPTfxChUdGWDn9KygAysuqbYIdwmHPj+lZR4hj46IuwbykRda80Ig
 e1Gh3HZm3pGCQQSaa2JobinfOsGbaS7Yy+eC3YeWQjEegKaLghfoNq6kjhS634+Z4B4buW7J3Rl
 pNKz86xi8G5cW74+5rrGM7i/BJLEFf6BP5T/jonLgvzrGwwYRIZ1ZTVEHuZjylrigaT9JKJn6WE
 yCRiwrQxD9N8sFhVHYnW+GD+lKmE/EhXNbqV1L6tsWC02K9q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 65spVLpBsBRCp3Ot_CHlfRcuwUuSYIEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX1mZyJvlWsmyL
 6/z4UBFtUfh+xm3CtB7+/kUzEPW0lVTIlXcRbQ5ugRIEuDAhfUdP5gFiw418WdDIOLiJZ4WQkSC
 /wqCytVT5U/6NN36SUi0BvF/rYYW032SRAzDqc67ovblcs3SFHmqq1xHP7fq5YDyp2khHRXfYkp
 g3ptY4a5KLCpVZrb8hArBb+AYMc5WLC19k73eroVA4P1DPNnaJON4QCYHlTZ5h8L6JQHZ1/PD57
 1wuXjHpwNdUNG2IOTPmOXKUTV9/L0/mFQ4GKc6e1epCfDiqJg+Vclj+H7c6am1vp5aDRA9icq7e
 cS09MT64RCrEdFIyPsI4lzPOMASrD5TJwrl0+lFSeY+0eYDo5b2b03AjihVmZLLwXPZBzOUvuP/
 r45RLXGRqI8n8jrAxSIPxYUlr60EsniyS+x9Cd3vGia1eWOFJLEtoxF2W5iW1lmAk47bBUwy+NL
 EB5L8HCPMSy9vln4Z1A==
X-Proofpoint-GUID: 65spVLpBsBRCp3Ot_CHlfRcuwUuSYIEy
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a0327d0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0RjBngDeADCmygnGHrcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Dropped patces, applied to media tree
- Corrected levels for MX rail. Dropped the review tags from the patch
  to enforce the review of MX levels.
- Link to v5: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

Changes in v5:
- Fixed maxItemx -> maxItems typo
- Link to v4: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com

Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
--  
With best wishes
Dmitry

