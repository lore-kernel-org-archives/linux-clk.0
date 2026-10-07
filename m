Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04533FE05
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358340; cv=none; b=RYnWQNRXwXjCfN3xI3OB9rJ1KVFHjnXfaTPWsQQPMXh3/QA6g7tHVizYbinnnPvvT1TJuCvnYO+/IAI4NBVcstAyR5uJ1p+zpbfQke7VhQqZmGxx5kYhfqxRZ5FxbJLiQSbJUSZ9zuFs+/NV43Du6injlu9y3BvgvPoWVmb1S/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358340; c=relaxed/simple;
	bh=9/0X5x1xXm8iZzxib+GdUs/t5i5t4uoWiZA9k58E6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEwJBgxIbS81dWqTgx08kCfiMO3Od+6Oe5nzky3ZIFXTiq0vz78os/LlAEzQWI7LiLm687s/oDDOBOGSbPQ2J9ksO5Cu9FPhz0yLtyPmdWNj86i19HYF+kMvOz4X3TVT6GSe/kbTEU8FQy77wpFgtAPqzeIE2NHmOuOjM0BreUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuXZDIYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzZnnXII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuXZDIYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzZnnXII"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U9B03264018
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRw
	Xr61wMdo=; b=KuXZDIYXhNjWX2UAjQ2k1PdIRJNrI5cxJVLPWSTq1YJhTl5b5+q
	s9jEfkvitihUgM918bI6yL6429+IeBjgbzHYB2a4VqZ0sO4QHMo4owUJIyKDzot2
	iTW9O1FVo+szxpwsBZ7O2ijLMmzFUou5jEs0EQSQLCvL7wdngpYDNpkQ2M+ntwQ+
	BQTuuRzQUojg8TCxv8yN0ZFec8A4E/JTXIy+dg+q2Qmpk0tbJ26RV52HlRIAc19i
	pFLS1eUaghd2JEn47pumuO0wNqX2y59aDmY4SJ2dJScsB/Iae91MBARlnTbg8jW6
	0LlPtaP+/8/Nos8kfTQGgbYYs/xF6qb8ugA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6092ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 07:32:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so3088699a12.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791358337; x=1791963137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRwXr61wMdo=;
        b=KzZnnXIIxUIURnbQvB8pjZQ/ahpdX7EYEs88yOuwqxK+ua+entJAfaUO20dSqTa4wG
         iiAfKf8BeN2Wsf28nnrsKz2XW6QRVaGEIBsJks+SvfaFysK44M8GOoNX6soj62ZEYL5q
         tqRC2pwKzoWkrtNGUnMB2a4NtubkcHzQjPQnNXuBm72MP16tA7rjNFdic2oYPiDFRCYd
         vFBAvCsPzDkZR3dtdWdOagy2zImra7cdHURdKW9mX7bmR8krcoamxs1FMKmvuFrDFCQ0
         CyezDGvtcrBsjhmzuuHS4q/u8ygKbamgxy72UYz+llFVFojwSrBYAc9u4Q3Svw34Nisx
         G9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358337; x=1791963137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRwXr61wMdo=;
        b=u9m4OXKh0ZLlFBvk3D9kI69Opu+G+B8rVFa4Er1Xs5Tra/uLbjUhkA4Pz2evK078hU
         kiwQVCW9vgQ88Lhe3Blom7lqQXLRY6jxelUs1HYpSrXseEUeOoRHqZEJouZfibsGIjEv
         y14WyoRpgfjgaRAxYoXQcJEUuzgfPOUcdRL/HKVNXFWrete2aDAc+7FYJvzQ/C8EoQIu
         XFl8hx84RNQ0R/4RouJie/QsLLZmNVFxjJRPB0t8jN6pBCcBac1dQzrB4ofE+qg3mC/d
         m+UNbVrAVax34SxI1jelx1p3TRxIhSCxbEi5cFB69KUPj6uFUzGsvwowEVk8EhHAntxJ
         Zu0w==
X-Forwarded-Encrypted: i=1; AKwUvBxZxWtsZgGT9YOIt4Kg8i0UhW6SYtsTtBtZhesanSFskf900cNJQ6V/o/W3gGUmfaBmOuEb/d8tVHo=@vger.kernel.org
X-Gm-Message-State: AFuF++nyRIwYodgrlbLIWnrXYrfKyWX9w6sAK31uMn8veMvJSIffQD3T
	DCncBCObLwXUbDygBAmnHGzd86mFHQrXUmQS/0WGmqIOyfw0daMz/O0JWsMk7VnMDKx43viXgl1
	5/nw8eWCmiJ8ChV0xp8G4dp9bFdoiHl2xVQv8HPzz5R1p5xwlJ0vnP4Z+HshSEzo=
X-Gm-Gg: AYBFou1tos5Bggy/eQ5yr9tLXgJEUMLUaUEZzJ8cFRHZ4rUNujuJYWH83rOYhchp/b6
	h4dn1qWXaErhkZkfqZRJqc6ljWykDCQykELlWdDgxGDrxu1aa8ND4wcnFYx5FLZi/mUBsEverBO
	ZF7YCtSX0Z3MqJ4t1Se9DH5MMueHLQXtYZa9w40UOoYNQxcsU0J5T1c2eZV7rwi8ye1jHT0Ov+N
	mJpYuAFISmZ/YQxVKb78+/PShnNuALn9jmgqySOhCKLPIsOHRx+ApkWG+88VgGEnS8Gviu7NBLv
	6X3nlrRTAafsyjro5h3hCGkN1nTiNbn0wp2+AuV4srRGx9R3Tvr9lxp5/D0sc0ueZG6GdIWIY4w
	jHMkabMTn+u5Op+tac7scA3o17jZzJZZxhFev7uEeAq6Cx5XzGy6QuR1WlPk=
X-Received: by 2002:a05:6a21:3995:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3e13405391amr1044483637.22.1791358337264;
        Wed, 07 Oct 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:3995:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3e13405391amr1044459637.22.1791358336760;
        Wed, 07 Oct 2026 00:32:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4589sm956037a12.24.2026.10.07.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:32:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: negcc-nord: Keep the AHB2PHY_0 bridge clock always on
Date: Wed,  7 Oct 2026 15:31:46 +0800
Message-ID: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yL_AGDPp91K8cu0TSynfaIuFmZTDoXF9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX2x+25zzKRcBL
 a3zXYAELLw4jxCr8g0AoWMm4cYkiOJdWrcM5XomMoRh12dfcGcS7eo2f6VbaVDwn0+wultBlErq
 cojfEY0H3zqoS8xgm+5EtJF6B2boCEA=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac5f582 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lWL-Se4DGgWCUzFVucoA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: yL_AGDPp91K8cu0TSynfaIuFmZTDoXF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfXw6RwRpa+LmKO
 h1DN2phn81jILa8mFzaaAn+7vcszO+LV1V3ve/mheSD0pHhhUTN5qkg8mTP0tYNoi6gE1ecC9x2
 2Ml4ZUPcgNfZTzFopKFSZk/Gnb2OYtCI3AERZEtJwETjHfoMgInD5uQYXLJpR/aUzcrKAG0k/bm
 XocemNJv1cGZKFUZE+hTQvLsR1xiiQl/PFPvS+vIMXGHFmMWgfqTsc3k5cjV0i02bKGqXMUShmY
 vMLWlZegDRnBZtZMNd8uXC/UQGQVs1pdw8OVRQMliOcezZ5UKAYeH+N1hzs108VpNaRXTOqhp9K
 zprm0Pt8TZPWOqlM5uWT+3IhVixFHk1qfk4vynXP6RWFWKPrm9j3oRPoSVYtDVfDB8+bjh0ulp3
 e553Xmjp+VmV9pUTrZ3FOSzoTuTTiRjWJZox/5/9Hu5NIlEM9kyQFlSoDWdyvuepguTG55ldxDO
 LkMDBRTmoBgL7xk5BQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070028

NE_GCC_AHB2PHY_CLK gates the AHB2PHY_0 bridge, which fronts the
USB2/USB3-DP PHYs, EUD and PHY_REFGEN_4. It has no consumer in DT, so
clk_disable_unused() gates it before the PHY modules probe. The PHY
initialization sequence then never reaches the PHYs, and DWC3 core soft
reset times out:

  dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
  dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core

As a result, USB on Nord only works when booting with clk_ignore_unused.
EUD has no clock binding and may be accessed while the USB PHYs are
powered down, so modelling the clock as a PHY consumer is not sufficient.

Mark the branch as always-on, as is done for the AHB2PHY clocks on
other Qualcomm SoCs (e.g. Kuno, SDX75).

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278ba..9c9b4a83df1c 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -812,7 +812,7 @@ static struct clk_branch ne_gcc_ahb2phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_ahb2phy_clk",
-			.ops = &clk_branch2_ops,
+			.ops = &clk_branch2_aon_ops,
 		},
 	},
 };
-- 
2.43.0

