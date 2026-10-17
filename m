Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8593BE643
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213113; cv=none; b=ZRvuGL/EtG9lupbF77QjwpsxFxX7+/NLcgUXhFpKM74xhkSyQLKHcIEJQLmR/FL4+EAk8TXX6UqUrBtytLXMsSrCkpYltrw4jIGm1Ay8Fo/H06gC0gH6B3/av9cgsPXpmFbUg1uzT06PR7l+8u8rQWYLaH320TQxChxcgthvVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213113; c=relaxed/simple;
	bh=hAkM+QMIr1WwT7Vb/or3nGf70MZ9cHw2QoAdSm6hPo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICFMgFnWt0P0ogcTyA8XK6qA4/rJ4tesCWRUuesVhVcPUh42O4WaYvFarpuUL5o4RSx58JV9SO8Bo8DjVMGg8KlTlcZcN7zGZ6ByMoiwROYKY74OIS0VtYMTzACZkxh9oLWBltSNC7/JLzpS2ZBxrJuJGsoW5SwaL7fSiaeTdhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR8I0h8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/bfCWkg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR8I0h8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/bfCWkg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30Rcb440185
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZ
	imB5MEgM=; b=ZR8I0h8UXItqES/+xp3SqSHE8JOCVoBc+/KiKW64Qpmxlg7hs1Q
	5TIs08Kep0jXfwwKuveMS6MGKvrmzNa/zpnBj+y90B9URJP7clKxyYDydAaHuRFH
	e2jiRgaDX6iubOsivBlCB9gBabpoQgmKBcfBo79w6d7ROUiDNdY9f6SCEMrxkyGa
	d4L9JJPV+FgRHoIRFN8amorVN5e5UTd5LxbYsO+uaNpTAWip1ZFCyYSlk5nGmMYU
	wInOSPjs9DP1rCrczAO1d7cKMH9nzX1k0BhS5Lp+cFIiBzj/ICaIp55/jR/MJawV
	f6rWXhfJB67HTX95f/U8dpxHpF1srHw4M7A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxg6m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2143853c88.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 21:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213110; x=1792817910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZimB5MEgM=;
        b=V/bfCWkgHxwfVxSo4nF5q5Gb1rlz6sFoAgDlIXvW++RXAwmxPZQ7RONGDgEBqQp7IC
         YhLoFlNeB/QpLcRmvzho1Q+v0DCn1xP8M2HqtuYlpEIyQ4S0eph9KjLvR0GHvObsXIdU
         sQxah1mGVnN1BikG1maKG8Z/Unn2HiLRuoumZ2CtYSXg+iE7yOIDzuvSNPc6Agofo2+R
         CWeP9hIU7IXmW57P+OfWGIgX1X11WxsQ0O4Tj060jPMRY2Rx4Vfy4HIkpPx13EyTaXHE
         FLaFPlyof+PIjNi6HIcNciA0ZDv1pCmKp4KP+OwBkeYYVSgDQ9zyQKBma3RNMRc/iwpb
         byZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213110; x=1792817910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZimB5MEgM=;
        b=HxsqHnvZcD7rQ2o+MW8rauKMYYE7Y2di31OTAFQNQduniyPb2w1uFaTTJ91eOM1xME
         JC9pny/oqgNSGI46GOFEi/pjW41RL057xDzkzWkhFKyM5zqCScht9WK4DRw9tgdZUqhA
         xFPqpPb5rCMpyI6Gsn+sSXa2sPJmwT0JNx8+HY4rdhsTmZHAS0+/28XDlvZZzypZ96mo
         EO9DwFlRHKExsJ4UqPviDXdtbhQHw8KQ3+1bFSyUPuDKqERCUzSsfy4V1rir01zvAsWh
         z6t8W0eZbzBF2+DShPIGa8SI0RZiWBFyLEa8btSC/sMFbmPEN6Ehc3cAt0LUK48olIkn
         UxcA==
X-Forwarded-Encrypted: i=1; AKwUvBwfCd3gIweJOo7ypp4vYyON8yzQMXvB6ongd/WCsMd//eidHAkG5LOhcey4d8Hev3ME4LLIpkwCjuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXrqPz/sMNtkXBpWJqcCsV3JMGN2F3o0A3QZlFzm1lw7/9U+SM
	lOUOMMzqjyamsIUiu8Y5iDuTz7E5WF7PFofBFQmgY7DgUbMUZm5+dtIVWABhJ7+Rc7XMBM8sDS4
	1BJ8RSL+fsA2UPfWcnbKSjTeuj1ZH3W86TdI8DEfqR0ATcOEKW3xroL8/5FmSOTU=
X-Gm-Gg: AYBFou2OP3tMhFkgALOSf5tQGMfxbxptZecJXwAX6JuZBYItjfLbXtB/j+WFWovM04z
	c7neyyL8aEKgRu34AfqACLJAXXfPWoI7u+pMVRsyRIXtoXfBLq/8qHxFqT369lHv0lDcXPhew6Q
	+nFGMvZKX7DZHG1xIUdKufBp0Wd7arkHastoleyMhHu/9pukNHbbqBBfOm2cHuzcjphpTUS9Veu
	aaCYwsnbpipBwmzkRXfUuVj8XCLIZRVP0YNwo+H20obuSXHBi+w7lWYoe7IagSun/og56s/X5nM
	WJw2sOFdjhVTtUcxgi0EJiDgDA6lOM9G2dnYWW+2GJX/38kb9Plw5JJZZ53YricAyyPf2EMB/at
	+NMsiODZiPrY9aY0yEw1qo+NcZpVeEcunAFlNKBsrhKHbqQi8LGcggRtBwKE=
X-Received: by 2002:a05:7022:170d:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1850cda6f5cmr2762158c88.3.1792213109424;
        Fri, 16 Oct 2026 21:58:29 -0700 (PDT)
X-Received: by 2002:a05:7022:170d:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1850cda6f5cmr2762134c88.3.1792213108884;
        Fri, 16 Oct 2026 21:58:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:28 -0700 (PDT)
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
Subject: [PATCH v3 0/4] qcom: videocc: Fix sleep clock on Glymur/SM8750/Nord
Date: Sat, 17 Oct 2026 12:58:13 +0800
Message-ID: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX7zEdbj6vqkYV
 r+OagXJglxMfafDES2NGSn0n5i9ISbQNxqeKzYePrKzDOM/NGh9ngc/l6SYXsrwsag9JRuY3bef
 pjUpP5Gg9Fy5uu/j3hs1A+LmX7hHCLI=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad30076 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVBIRhUlJonL_QqUTF8A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX1jPheV41jT0+
 57QxHaMKeAuqW6bWlnwXvP35Er1m6Nm08RXVlQ4yGXHBFCFKHWHA0018YGgySNAh8UA5E3Q5mC4
 ZPOjlk+CnZ3YEXLNFZ8crjPIxoDfvw3tIjzV1PVpceE/gNsv8y6qt2259orT8eAHun9biBL4UWU
 Q3T16oXg/soj3Ef+qsN4KLdOiezaMJ+g5shm1Nt7WTl/xI70vgyNIfQeYcoZzAbfuZdig12dAtb
 Zc6SZr26TLkcgA7GxfGHudtrvz9YUZbv3z3tgOYjXU4EF0vmTc1Dt2GCQmtmdB2KkwapjP3PfMn
 +NCNnrt9kpWgZQFDGB82iZEUDLhw0yrLhIIU7aKmIyOUiZbjBN/fOGhbmqexPD3axGjEI5u3cmt
 V1ef0Qcv7eZWxc+tMCfLETUq8I/C+5rm18uwSxM+Cx4z1C25HIi4uoMRGMsFQ3xm0h+9lQVX52h
 QGh13/nSVlalbl/JBvQ==
X-Proofpoint-ORIG-GUID: VPx1f7oQSDGdAcHpS509N1iWNIUI2NM3
X-Proofpoint-GUID: VPx1f7oQSDGdAcHpS509N1iWNIUI2NM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The video clock controller on Glymur, SM8750 and Nord has three clock
inputs: the board XO, the active-only board XO that feeds its PLL
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

Changes in v3:
- Reword "always-on board XO" to "active-only board XO" (Thanks Konrad!)
- Link to v2: https://lore.kernel.org/all/20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com/

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

