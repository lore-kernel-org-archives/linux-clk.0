Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F176039FCC4
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970291; cv=none; b=aNRYVaIevJ8zUgBGrCzzOtE9+BtkXCwgBAKGgx1dEHX7eAaeI81HXe9PmFAgfJLC7CPpug+BaJLiE6Ach/UU9mTvfpIQhOyiyozeP6q57qETdwbMI/mpTJ1311ZsS4/U0VFZX6hg5et/tPNupiHWvZY2zaL3NqGfmhRUq9WEH4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970291; c=relaxed/simple;
	bh=zz+RclWqsBHriP60gs2OKPtSQkQLmQXJLfyVb5BowtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5bit/rEM10weTT9oTt8nuoeTJ9BFh06MM7fpti1xNfQLyBQOl+7jBXGOxZ1Bn0AG4HkyUhVq9NuKA6Hx9HXgDt5ILzfKEbMTJoepFT4DQ5vbN/2WADzBQji3hSRY9FAbe9wOVkA/KvMT6IEcBcXMdBQl9FKqdRCT1qDaORTwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTGuX8L0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1w38gLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTGuX8L0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1w38gLZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6ZSb2357676
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 19:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sVFnUaPuNHjd50COa3GrnnxVhvIYQTPbzvF
	59R3fnTM=; b=QTGuX8L0weP3R+aTs1uRkInD6b3CE/DvlY6sjv5rI7iT8ZUZD4J
	vU5YOEPHWFo7SxMcq+ZpRESotH+ilzfuHcKiMoVZh6EMmyfmm7vvH8cuDJ9TfVyJ
	fBjkAOxonakARLpDFG+3tw1N5maDNKA8IN+0hlYxV89vFdTrGl+A85r1m405uxHa
	jvfE6Bu7JcikNyiBPLHQEUGio48fSjDJNMmuFNxasBUTeeD9IJ7DdADaWnnRrUS0
	ltDHb2I8nU9D9SZLUT/Pb0wpCrMrqw3QjO2fXRhDKCnMW5tyMiT4LAewwsvy7Z93
	j8v64i26E6/QgfqKPFKLXi6/ri3Za0Vaw7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh3yu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 19:44:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1936747685a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970288; x=1791575088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVFnUaPuNHjd50COa3GrnnxVhvIYQTPbzvF59R3fnTM=;
        b=E1w38gLZQJVpRhJmflzUeCNqxV+aX7aDAoibxLq7ICzD8P8MKAvRlfLMV7Rl86lbfH
         v4p7+VIgpy3THXm6qlwnSlX66KQofVAK99aj+8IfiloO3RoZ2TId6RY0pfAbeBdkr3D3
         SqWfGeBSC+8mC3G9RF/gqFMXmmviBXq7S3lmI4C+M5VbXJPxilGaU6gCf8BGprm7cfTU
         rxiazKBvcZjaQ3lCq/hL1lcoeKtHpPM5Rn5wQTdgVe39wZFkkvCK3KozoVNoJnsCGC1Q
         nCjmBhqsApPEaasIkFbfHV4tfSann8yVlNlX0m35awy6tPO38b5u/f8JGQ+uND/X6t4t
         j3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970288; x=1791575088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVFnUaPuNHjd50COa3GrnnxVhvIYQTPbzvF59R3fnTM=;
        b=eVXjW4Eri3X5JCEdjZE7Zd/LvR8xiuU+DlYlhlynHlFRQ7/co9KfWJXUtd/b6qmR6l
         bL8G5ZcHKXb5YgZvttaclzBmzxilaKsuvaJdLgii4g5sr0LMIK1WmSyH+g4+wt9i8tBG
         axB3GV3uIRcfNwhw1lRCn+0gIXu/LjS3OwqsjLF0TAJY4iS2cYU/R/g4ehCz6SGQLp7D
         CO99cycHlCYGDrYyF4Zy50Zvt4NGIOkg6yZlcwXDqUrZexCu0zEKs85dp1Cauvh2TFzP
         rC7Gp3L43/dOjlsECPcPA2X0h07/1dlZx/zItE468mT8nrH9w++SOsW9KtatMPUnwaIM
         dOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHvhhPS7ZjO+jIavCOFLtjIFPhczKWqspPQMQVHCPpKFJfM1UKlpMGEHi9MjD9ER6v+1a6WAFW5Yo=@vger.kernel.org
X-Gm-Message-State: AFuF++lkE5lK0bnDqwdEIkTBBvP8x8bcy4ZoUiFEF/+nqs4Ah+wkHbsS
	CMbn/npugnM4iBZhQic29YRYP05F/0plE+te64nCIfKqgGMSWIg88k7Xba8Ax4z1rnP+iO8zrD8
	kh/1Ww03l5GoLiCjg4Ng9tJSz98wliy5MMis9Lw3RiHZUlUXia582Vhkg3qGiatc=
X-Gm-Gg: AYBFou0PVTcWxrQATQP8xaSx7vG1cdTZgsfdblt7rjKSsU9bDHFFcMRHakI0bxIqpY6
	j9j2wUMrUD+A9Wps9ugoAU6QFYURLiGA6IU4Rl0TZMP+9pTyBmKAWMyDvydcmyqvP8M1oIPDTul
	c4shEQdacGmQ4zJO3rMPcCN1k68zU9+pOCdAHpELLlJp3MnHyqx2xp9UtM6/e1DkYr8Knyol+sB
	G+LWIFiJJqTHRJQOyUCNhwIsm3jE2Iw5IRxH0Q467s1doN8OJw9bn9iPNI+zJXEs6JvdDgP0nDC
	U099KlqgS6TSjz/Uc/hCbwtluqY1iP8mRag3FSxldPxL7RFO5+P7Hqo2zkQ4hjyV3iNrytXZTPl
	avhtC2Q6eChx6
X-Received: by 2002:a05:620a:6f04:b0:93c:c96c:a592 with SMTP id af79cd13be357-93cf17329a8mr663085185a.36.1790970288049;
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:93c:c96c:a592 with SMTP id af79cd13be357-93cf17329a8mr663077985a.36.1790970287421;
        Fri, 02 Oct 2026 12:44:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Fri,  2 Oct 2026 20:44:31 +0100
Message-ID: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfXzAeuEXbowQyi
 3kxLgN4YYEmDu/toKDV1dQjsqJU3yqOdgSuBgg6XMJMXSp6F8z7mRzQ3OA6obaA8E624G61Rei1
 iJfsRUWxPy356yRZEznv2W1gDlKKDHY=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6ac009b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tj6v_WFbzlxhzRuvkX0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX/oFroMVA49kj
 KkX9LNHnv4+2GXdynre8JeHl85OxJnz0N16rdnkNBKwNxlfBLRFxctc74Wflm++NIc9CYb4c/JZ
 kRge/SQ6A1jtAV5zgQkDazIjPHVe+fpUn+9+jplfgu6ElGSHAmh1HYQPwypoQtRYZXDOwjsrf0x
 7KTEZayMpYimNu69Vsslu/M1GsK+eBJutFUq3jAzfAHnndLWDN32XejnuJ/4FQOTiu7bPcad9Hk
 MtEgC9TQc7GugGlbPxpWrsqGZe4yOQqhRzhPtfqT+iTnLKp8n6NNjqcCDTiedjxtytjMvnlEUVe
 MtpmMK0ToWCf/J7zanPduGGGcgrVxqWhViPyulDhQLZ4VFmMaHdIolZ3GjFfFVYz6hbCQfcz9WB
 SddT7F72x+5/q1yeIeKEtbFLybYQU5xZwj84755lAV1Uy/GkLRrNeGlIegr42j2ouxoAJpC58uy
 2em3Mq0i8AsToGF/Fiw==
X-Proofpoint-GUID: RQpI5ooxOQaDlKyRZKmJyrXMjhPFridW
X-Proofpoint-ORIG-GUID: RQpI5ooxOQaDlKyRZKmJyrXMjhPFridW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

This series adds the two LPASS clock controllers found on Glymur:
LPASS AUDIOCC (SoundWire RX and WSA1..4 resets) and LPASSCC (the TX
SoundWire reset). Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

The programming model is a near-exact match for the existing SC8280XP
controllers, so patches 1 and 2 extend qcom,sc8280xp-lpasscc.yaml with
the two Glymur compatibles instead of creating a new YAML file (per
Krzysztof's v1 review).

Changes in v3:
- 1/4, 2/4: extend the existing qcom,sc8280xp-lpasscc.yaml with the
            Glymur compatibles rather than adding a new YAML file;
            drop qcom,glymur-lpasscc.yaml; update title / description
            / See-also (Krzysztof, v1).
- 3/4: bump max_register to 0x3020 to cover the WSA3 / WSA4 reset
       offsets at 0x300c / 0x301c (Konrad, sashiko-bot).
- 3/4, 4/4: pick up Reviewed-by from Taniya and Konrad.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya).
- 3/4, 4/4: pick up Reviewed-by from Abel.

v2: https://lore.kernel.org/all/20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC reset controller for Glymur
  dt-bindings: clock: Add LPASSCC reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml |  7 +-
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
-- 
2.53.0

