Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA904A92E0
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266332; cv=none; b=AFeivi9MDdWVTpEvViz/KpTiIoGPPsdN5P/WtWXnfNoGnYFZUlnC6kkhw65EENBk5RN6RzM5TNkAo4dLMLxoEyxvlubOmmv5AiGv5l4xJqFL/d8ZjI6IvplXv06a7eoap9CtEmaKbPm7Jilq2VBu5WIUy/2JjPwNCTRX/LQt/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266332; c=relaxed/simple;
	bh=/O2oE55TkYbnpIvKwb0/1s+B308H3SwWLlaSWMfxGs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FjBevGlg6Qul5LRlOVTjFo1Mld6iTVBIuFDWbjJLIeT/9rXlMlT+T8ZrwJPQ3T4hxZWm3W8dSUZifM/obPkDHWIzeMHba2G5Ny+vVvtjLNIKsUKKnJYvvZdZaMGVIXlS09UwcTRT/5dPrNvz7R6JcTWgeLjz3aSXmu2Zm4K+YgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef4RGaoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFEaZaXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef4RGaoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFEaZaXl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeaiq2854995
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t
	/FuGrVsc=; b=Ef4RGaoU+pgseqLTVZrs/QL6j3yhqWKdrWgnZ8tlcJ6TBnoYNL/
	kCI584CSK8vfjBFG88bdDlugSjTyLoIXIWIbUPyYM9gUuudWGC+5Ub+rgONsWqqi
	oS4l7f/0wKBruK4dN6klZuC5h95IZmMVzXIeezo6lt8pZtk0ZSjyod7IxuJDvZbA
	+TKtTDY2q1FhV6MS3G0JhNCyrDYrSVJCkkmtkcaWx96z5IBa/h7tvKTtkEziwfYn
	fwF8ze8ta/Gn37FgXucRb3KdZUiz3Ew0VW7WaKXCCX/ULDPG1B2NtfbxZpNYGQoj
	nRYBW/SAoqKbDMdPJ8oj5bX8YYMca69g//A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfguer2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91242b356cbso472696d6.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266329; x=1790871129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t/FuGrVsc=;
        b=iFEaZaXleAiXBbp7pDAGsB/E7ET3ro+9JxobNBRVksLqdXYLQJDpdBSInNNlM2pv8x
         5FE519QOQcNCjNYo1Dcu07EPJQmvy/7TTeUT1DboswvIaW5lFO3e9zKRppfxoK9lyDe5
         xYYjgIp/e0Y/JDVSOiiBUYZm8Idyu1hykywrxTzU87NkpjHCY5lTj5XYdaYR/2S4fiN/
         K+/YPVsGpezZedtcIOASWNBNEiG8VmMMBIyOoWsZxkOZ+LTrbfVRGOsj0t++Wmne9qMe
         4+YrS8JFNgvsXe0coimTyq391DYBSI7CwEdTSgracsjbOpZ1Cv0jbnYtYKR25N81Aunx
         C3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266329; x=1790871129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t/FuGrVsc=;
        b=KGYuOnEz2cHDXDkkT+BrBdrF3NcRMiUsYzoilK2kCY6U6hd2Jt76murUwthAoEBv+a
         2xNXYknELgua0mK4Vhf7linfvTklqWquCbyXjlON2xCtfa51mXMVS3hIrt6mpP1wxHAF
         8889Y9qfhe2RY8wzblUIA+P2+HkahooNG89AmZpFhGmGnf5YP3+oM4J0ahRlOn9WfjYX
         +3+zlnA1Kx12hfsVM77MyZ1uz9x8RXHNii4M46YkO5ccS9osjDWAK+3JDcj5FWk1VrIZ
         +bMQGMm3IsFDZhaWD8AiOMEjGDjLWd5XyLOoMZfbtF5GOG7cnxIBT5zCf0Mhd9s5UtAx
         vPcA==
X-Forwarded-Encrypted: i=1; AKwUvByTZ0FD4CNkSId8ZRf8ygffzrbW2IQgdWTTV1NRacCIJ0HEz0hWCzlHByZC8IqlGbYUrmkl+vArWT4=@vger.kernel.org
X-Gm-Message-State: AFuF++l0mAuNhIpr79oboNHB0SsvrARstPUiPrIz698tAXINzl+KkWfp
	S2H044m5Jxg6ALw3xs6Uo8aRl1mI7iA0SCgZ14LX0addrAm1WQEnOpRK6INxf4ZtpV2MblYqeSg
	6uZ3c0proZohvl3K2lCJpqV2vYpwBxgwW2/mI3NVFnLCyHoQdGaQ0nrE3EkLkzio=
X-Gm-Gg: AYBFou2eziHhVesMF6HFxXVr8UmsesUJEuv4lJ5mga6W7llFm/OZkngCZ49tc3xqvbv
	BfjyTU/oM9zwG6QZU3QBm+RpavPMz3b9eTDZXqZizom/OaJQD3HhQJh80VABlbl44i89Qlh68Pk
	j4EF08CYQW9TnU2tVmZTGOOTbZpfXF457x5hXiBvI8SUAlVR2SwnJsLwYPHp0FpgpoZOBIHQMmS
	vNWW/BcJlNcJ5GY1BSf19WgHIxNKqtBqyx5VZJOvtDGsSf9KRM4eJKMhRiM4pT6w40MRY4XQG1R
	owguvZCHrmLzAzYCOGh42iecvS5DiJGrL5R/P5DnvMmKSrXcDwRrbl/9M1mqmVHiIFrwf/JE5RZ
	6EwB/N8zmnPEgBVa09XkJK8gGp1CCk6/XWUjvcNan8bSGGCawISLWhrIUThM=
X-Received: by 2002:a05:6214:246c:b0:912:517b:7bdb with SMTP id 6a1803df08f44-91421eeff50mr30499726d6.38.1790266328176;
        Thu, 24 Sep 2026 09:12:08 -0700 (PDT)
X-Received: by 2002:a05:6214:246c:b0:912:517b:7bdb with SMTP id 6a1803df08f44-91421eeff50mr30499076d6.38.1790266327491;
        Thu, 24 Sep 2026 09:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:07 -0700 (PDT)
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
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] qcom: videocc: Fix sleep clock on Glymur/SM8750
Date: Fri, 25 Sep 2026 00:11:49 +0800
Message-ID: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab54bd9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=L1W_g4kGIw0p2SgLEucA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: FZbc2wd2gCktQmUIXFAfy-72DFwhcrL2
X-Proofpoint-GUID: FZbc2wd2gCktQmUIXFAfy-72DFwhcrL2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX/T6dTK9/balG
 6tY7PYCNgnmKOwXJUrJe5u7njscAgx9IJ4GxT6wL0bGSPGOeOufq5aKpa6Sj/QfauuoiCjQfmlw
 tPIZCf9/Imz8eX2adxKgiZ9P24/R2Ls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX8646G9OgJGhE
 1id0eb2BEuDnzx44WpLXatQOCID+/8ATqVvhSX6dPhPGhn3Si1dKixqXfKLC6ptgOtYw2J4BnBw
 veCqG6h3ePuRSkY+6LQCyleodyp10yHKXfFmXOwCurzWh/ksTNU+xzHwfFW/CivgteMk30POOri
 fdt0slQMR7EyC9BS8ZZo6UnDd0eraTF4eRYj590Vd0wo3Ey9xeFddJTWn87Fn4goeBPhDCNDlyO
 D9lSGZh/3A4fB5kBCbp4QBYEK5+YMCnRRSlqmtdPwaQdZ28cuRKbbY7o2JtNSRFl5MnnTDRm9ke
 jBRHO4BkG/0zbfftXgTz1bNzFEUJiyioi1nmfD1YBQXspbfgnashSc/JAAzLLYWtPaLf1oyF69e
 E0RIg3Ep+Xh3vvecSNHkvksCSkoOx3IEi+xqulACO4/A15vtxQ9T40on1wul7dbymB3Mg8gf1S1
 40r0q63mDuH/5bYf9AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

videocc-glymur.c (qcom,glymur-videocc, qcom,nord-videocc) and
videocc-sm8750.c both declare three DT clock inputs, DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
DT_SLEEP_CLK.

qcom,sm8450-videocc.yaml, which covers both drivers, documents exactly
two inputs: a board XO and a video AHB clock from GCC. No device tree
can therefore supply the third input, and video_cc_sleep_clk_src can
never resolve its parent. It registers as an orphan clock:
clk_set_rate() on it fails, and it appears parentless in clk_summary.

Nothing breaks at runtime today, for two reasons worth recording:
qcom_cc_probe() does not fail on an unresolved parent_data.index, it
just orphans the clock; and VIDEO_CC_SLEEP_CLK (0x8138) is listed in
the critical CBCRs of both drivers, so the branch is force enabled
through regmap and bypasses the clock framework entirely. The sleep
source keeps whatever rate the bootloader programmed. The orphan still
blocks any future rate management of the video sleep path.

The two-input description is not wrong for every compatible in that
schema. videocc-hawi.c, videocc-kaanapali.c and videocc-maili.c really
do take DT_BI_TCXO and DT_AHB_CLK, and sm8450/sm8550/x1p42100 never
resolve index 1 at all. So this series narrows the description per
compatible rather than changing it for everyone:

  - patch 1 lets the Glymur, Nord and SM8750 compatibles take three
    inputs, described as board XO, board always-on XO and sleep clock,
    and leaves the rest at two.
  - patch 2 adds the sleep clock to the Glymur videocc node.
  - patch 3 does the same for SM8750, and also moves its second input
    from GCC_VIDEO_AHB_CLK to bi_tcxo_ao_div2, which is what the driver
    expects at that index.

The sibling qcom,glymur-evacc.yaml on the same SoC is the precedent:
evacc-glymur.c has the same shape, its schema documents a sleep clock,
and the glymur evacc node already passes one.

The Glymur and SM8750 changes are not tested on those boards. The
equivalent change was verified on Nord, which binds the same
videocc-glymur.c: before it, video_cc_sleep_clk_src appears in
/sys/kernel/debug/clk/clk_orphan_summary; after it, the orphan is gone
and the RCG is parented to the board sleep clock at 32 kHz. The SM8750
change is by inspection of videocc-sm8750.c, which declares the same
three DT inputs. Both should be runtime no-ops otherwise, since the
sleep branch is force enabled as a critical CBCR and index 1 is not
resolved by either driver.

Shawn Guo (3):
  dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
  arm64: dts: qcom: glymur: Add videocc sleep clock
  arm64: dts: qcom: sm8750: Fix videocc clock inputs

 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  3 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          |  3 ++-
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.43.0

