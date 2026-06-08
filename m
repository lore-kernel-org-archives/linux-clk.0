Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C2335BA7
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921384; cv=none; b=LTA9ndpsiTJ+bgC+CjwgTevTMkFc7sSOWj93t4T3fOK5UbT+LflFGPZnoW25VeBfU6M8+F1I2R0sj89Fd4rtaBIZLHnZuZ85hfVCRbEu6d5o0Hs/QrGDLlQwzlNis8HT6FdAEgekPzB8v50J4vMoKO/D7XyfPV1yDRl4f07jODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921384; c=relaxed/simple;
	bh=4F7gY46dZri99qm2y2Zpu2VG+g8+kLFHTgK5fDVba4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WUq0TN9pPm5PGnaF7UWkRZe9CvQ2meb3UX6O76d1GdkzsqwbkZP0KtNG3CXE0FdT4RarU6mbF95Bwon6srsCqOa4geRjgvB/0u6nJuxkuU6Go2ZjyCyP7EW71Ng5G5n87ShoOwF3bSHQLdthH2MVXnRNtNsLytS2fcTqeX7b2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijMABQTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxI+Ko1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijMABQTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxI+Ko1u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BC1sn3455365
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 12:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X69rCPirG+wBx93FbgpUBH
	+X44jjs27nxgLICDNALu8=; b=ijMABQTaxlkG5CoaiFIbilzWulZfKOFKJ3edg7
	T7fiEOcJ5FkuUNbA0EpTyExj130oK4sOtEHyNKGV5oy3kLffUs7VoE2VZXrWOnJ6
	Rs8PXmS48Th0JojL394nNYpUWQnhuEt4NLpbTAU+fLQgt6ozTxnkbkOHxqZLTb/u
	NAGID/003G1SmxJCkGYENBEqoRC2Zo9aHxmndf2x+mTdprItuIBsK2cUt8mNxwbY
	Sy67X2VyaWUIaZKB0VoPfzkz1QPGVAcLv7nNUSq+dUA7qIx8Ha9YPjyN4t4bL3yy
	LwnbYFzI4uvTrYbV/lhoSqYHmQ1gFs/GHSz5ftMtCLasnOUQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0guvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 12:23:01 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e9c004b182so85433397b3.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921381; x=1781526181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X69rCPirG+wBx93FbgpUBH+X44jjs27nxgLICDNALu8=;
        b=CxI+Ko1uBfG6kX1hjG4FNmvMUPX4DHgRepfQn/12rbI+xellNQ4cNfIaBvtuT8iSc+
         8cYchYTdiMaQ3/GlKL8P6ul4RBwzLyovoramP+B1GCeBHM+yTw4r6ZuI7dCn7VXHY3z0
         ao9rhiDFQ8pswlD5zpXtEa+7XCUIuy44yplf3F5/1FQCkrcm/GvjhNRBKOEaylJQnqv+
         BwA+CAGnBQQLXlX2pb03B4FGzKp57MTm7Id4dqhJNlwXCunkTh972AI9ChBs82Vgp4dE
         LXjhvP4s9SA+U3nWX6LjRQcEZvAS+gQBwFYHqwefmpLY1zTnOlHKCTatEA2v/7nBnDHX
         snkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921381; x=1781526181;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X69rCPirG+wBx93FbgpUBH+X44jjs27nxgLICDNALu8=;
        b=ByASqwvOT63udMRcVYJwVUp5nyPFKR51mB2ixPhuKymNlS2Ktv05K27NIu0RbcQHr0
         ZjKFjtHdLPM3YS0k9O/TBrYjU1ZxGgqxr/nEm1ryP/x6X0j+k/9QUblrXgen9mEga/pN
         OcryqzulOV26oQ0TsrELUIqk5wlt6hIj0yWc3EeevBQq0DrtV+bn9guLi2k+1VKq+je2
         TECtdIqy4i4bLHSNBR3s3LeAgpQmFRVCZqs4qDOOXRAheqhyxJ3EChxM8ULQN6QlYgzl
         FySkxQJtT4a7gozPOkFMAL0lQ1nt3OQdCpvt6dDagJ4gFO2x251fWBudoJXgnoGxs6Os
         bLYA==
X-Forwarded-Encrypted: i=1; AFNElJ8eCvahHQE0+MB2EwUuDd2nTS4FNUc9yi5QAUINR2CrA9um0BRLBTlUqQwrtcsohllIXnnmGkHaI3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYhIxGwHJtEwb9VVe8ekpFR8NriHwCBQ0ilMnitZizWR0ffFJ
	fTFelHFtsLi6gKOd2sAfGlE3EeQTQHAKqvpI+3whODKNYL94X9SrSBKHfg86nx2z2Ju8A1roPKr
	7cyfEFQqckcmTLBhNGoYq5aN7VmioyVgOg03eAiVYXN3mHqAd68iMUcV3SxotgNU=
X-Gm-Gg: Acq92OGqlQLBFmaSX6o1uM0+gOuP3S1v7xAsC+0N9DgNopuaYIBlXYiaObYq76X1Owm
	BTrKHJhdboV70E+6Nl0gsJrleeTqkq63GgY+uj/KSz/PTnXiQTHIFZXAWn0UN7qYyeyVhh7+UYF
	SfFQVZshnLQQ2BgkiOwE6pQuKAsn3ACt1gdra+3NeiohHkLYKyqkkp9UEZ3JiQ2qF/FTLeO5jQL
	s9O1G/G0j7rilVcgdJyu963Cx0lJVZMVI/BqOowxyDvWgilIEa2uFCxEqSVh0BJm+kEiA0o+pbL
	mNP64YebKdonjlGCNp1NqSwzccXD27S28jbw2GaOZB+E/ySdwHzJR9eiuhy5ap7GR9xUao91h6j
	BuGKdODQ0iIirMS9egv3G+1VerSB7psI8mLg+nPtXLEHaMLI29GzAjloSm4Ktb1k=
X-Received: by 2002:a05:690c:b15:b0:7d1:cd93:c8f1 with SMTP id 00721157ae682-7ed0c22f784mr142914967b3.21.1780921381067;
        Mon, 08 Jun 2026 05:23:01 -0700 (PDT)
X-Received: by 2002:a05:690c:b15:b0:7d1:cd93:c8f1 with SMTP id 00721157ae682-7ed0c22f784mr142914587b3.21.1780921380568;
        Mon, 08 Jun 2026 05:23:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v5 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Mon, 08 Jun 2026 17:51:48 +0530
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2zJmoC/4XNwa7CIBAF0F8xrMVMgSmtq/cfLy6AgiXaVuG9R
 mP6745udCFxc5M7yT1zY9mn6DPbrm4s+TnmOI1UcL1irjfj3vPYUWcCRA1KtDz38ZAM3zvH02m
 gdMdD5gJa5bsQgrTAaHtKPsTL0/3dUe9j/pvS9flmrh7Xb+JcceBOuk5rxMZq8zPlvDn/m6Obh
 mFDwR7wLF4YQlPCBGGNFLKxRiiooYDJF1ZDVcIkYbp2CjFgh7otYOodwxKmCDNgtA1WKSI/YMu
 y3AFGD3NjqAEAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNiBTYWx0ZWRfXxR1B5luuOze7
 yYfcE7Dyvgeh/k7AqRj30oVt34EtbpvYv7XcnkH8xbbBAYbf8JQ4Rep9tCjz/eThu8o+H6NihJ9
 zWLyJuhwLZNy76wxpIzIR8ThwiZEdeIv1TehipvOvKm1To39oJ78zqdM+e2/bDl9ePBCQquJxXj
 b7xvys5Zs899ATVXd9H97CiduPz6h/o8FtTEOX9M2z0gyENcBV6ezExnQbDfHqJDwe/2D+H52Gc
 UkAoQTalw++qnYoVGC+C3vzFibafydSFhjBN/mMghi93zhrMj5irwzwAzzdbCxhvusQQSL57gtU
 nSEJZHF5dSdWpguxvVl9d9izRriWeOyGN8bYkw4UNkglngqTRrDaBPwnfegOJn8KL3cRP/EtPdO
 3zeAzIa5jqN524oDwkhKYnuDvQe6exQvU0PEAvQfSpWf28UUxGbNdbu2b298F5KYcGf7tQYZY7v
 AplTJk/rBBZ60rCElhQ==
X-Proofpoint-ORIG-GUID: QXy0xV74NcKEiz7MtvR5Rmxeych1vQ2Z
X-Proofpoint-GUID: QXy0xV74NcKEiz7MtvR5Rmxeych1vQ2Z
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26b425 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=byt2Oo71_RUV7fr4z6gA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080116

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v5:
- Added missing RF_CLK1/RF_CLK2 clocks support for Agatti [Dmitry],
- Fixed RF_CLK2 rate to 38.4MHz, applicable for both Agatti and Shikra.
- Dropped Shikra RPMCC driver patch.
- Updated Shikra RPMCC bindings to use Agatti RPMCC fallback compatible,
  as Agatti and Shikra has same RPMCC clocks with above changes.
- Link to v4: https://lore.kernel.org/r/20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com

Changes in v4:
- Updated GCC critical cbcrs list to add GCC LPASS clocks which are
  required for Audiocorecc register access.
- Link to v3: https://lore.kernel.org/r/20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com

Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2 clocks support on Agatti
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   65 +-
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |    5 +
 drivers/clk/qcom/gcc-shikra.c                      | 4431 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4816 insertions(+), 29 deletions(-)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

