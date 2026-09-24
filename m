Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC543477E58
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251639; cv=none; b=c3n9P3aSr/zEeQ82Dv5a/rHbclcLxG373zNwmfY40usixDXHsMww1uVSk4NyRGfidnLhGW5xDFkyx/+gb6lQ1rsX8YdveLXLM4rIO2MwZtXFW/YLjwLHQ5utjiowHELlxPQOvwpzc6t9XcfZC94N5nBoOcGFm28AdMHfxlxwuhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251639; c=relaxed/simple;
	bh=xmHibZql2cbCfwH2tMq2yYIoAv+AaWfRsZ3z/d04h8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ETPTztG+6wBOVQy1YRYRrQrNki/ca1EEpScGM6MA77SYjrjl4gu2QIAA2jOXC9+IOPIZWZYzXXnq4pgOVQAKHk4Fcf8TNU89Dp7Dl1z38cayggbO0PK+k+CyZjQRI+fZatUoe3iOTEP/CP2qXpyfFGnyP2sVeir4oa2Qx3eGfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKRj8kNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmJQUxty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKRj8kNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmJQUxty"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC58au805072
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xIO/96kxFY93eeioOz2tQv
	G4gc22b+Gs1oDe6SCgnn8=; b=JKRj8kNFlPLT6e0Vo2mn3+2wllvZRruzGLnXuT
	HqSLSv+88Abz4PGpNnlyEBReIsGfH47dnpDJ4rRNmMCOaeV+Cba4/aRI2Y2hrypz
	ufBaoByUy0lEyc3gBAxm8m66jlf5mckcHAMvd1J64GB3Wn0o2to6W7r07sXKCnVh
	y/j5TsT4UIpF09jNeOYKNRsCwT/DRNuEQtQbSjySwwd0EW1pB9X4TXltTmTNmdbL
	I9xpIRkkbDXyn2imSSN59rx/RglvueHcvNnYb5rb4lYxpxEQDgyOeLLg759Xyja9
	Onqr8ZccvHyAiZ3xZNczno1RU77JNO1PXt5Ojq+nSiiT8HMw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8ew6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980b637ed69so294038241.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251636; x=1790856436; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xIO/96kxFY93eeioOz2tQvG4gc22b+Gs1oDe6SCgnn8=;
        b=KmJQUxtyNJQke7JIY+YRKEyqSFH0sL72MPZ/T+/YR5w6NyL3anZ8UjtvL2NS8WgXid
         LsuxMnb8IoSRAHvv8rSkoKSTrJjjkjtXWKsS4hmhx6cu3j/51Bgx0wQiNxTPN83ilI5P
         suStIXeeGZ6/XPJAa87dTS7X/s2PqKzAU5Entm4HrVYB4JX8iNHuNZYjbkA7QeEeKwDD
         uLNwEN6MEHVOEhCV1qn8ZzA4bXHe5Qu/R/64iA4HpCaqIcf4epdEoA7QS7g7x37u9pzm
         6o0oyTCICB5BQHYQDWKtmDWGjd7m4Snv3XnXildybGlQZTmdp2VfvMZpS0yUNxrX5Kgw
         yERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251636; x=1790856436;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xIO/96kxFY93eeioOz2tQvG4gc22b+Gs1oDe6SCgnn8=;
        b=w+4ah/Wnc1/zkgw9qV9bfs6LtR9QqY5JGcmhOQd2vL+g2xaNKZEDuSmI0paWTO3YMJ
         UA8ApkzIOo27zbIQXhbZHsaqngjqjK1BtU3BV4mnTNANpLI+vuZPJ3IDyuVrdVtv2LJN
         hl/pvVMS6Jfupd/j1EpI83esBp9EbLRyG7q2j7t65nUnzoo8Ah95VGXEVJHhecaFhrmJ
         +lBgvu+HQvF+u8KVCuif7hURNn0z5Gl6QXBGN6awLdeJ63MP+LckvPfdAGNAPesLiGHc
         +c/vh10kt85W58VgYd60xubdV+tsamiWQBQ23sNeiTOh7x2DvBdybXqK80dY1Ombemye
         xkIg==
X-Forwarded-Encrypted: i=1; AKwUvBxwf+CcgA2E8gQJrgHWA6M5vZi1sOy/N3VzrNjIbK3tPN5MUbAxNWxrW060vUQw/6ga/oSm1/2OOpU=@vger.kernel.org
X-Gm-Message-State: AFuF++m8xZgYM3Dc0ts7qCSdaxGK8Qix/QPSJoKof4Ur/IiXip1y4cLr
	TXtBHLAmBqrgx80zyD3CL+my/cZUqmo8nTET558R5z1iWPr2MdfKHufnUF/N7Yq2/u4w01lLRNy
	MT+kDpzWSwRShJ7DBRkoChGMMgD/cMNYTtJxVjF8Put8LHVXdLXNVuYqKbBNggEFvkT7F3fo=
X-Gm-Gg: AYBFou1REacNdb4JJEMCmTDE8/NZ+QKEq0Lk6uncKB/vRGIH//IvBQZSuLxJ5NzQaCg
	XzvzzmFCI9MHyykdUyM7cpu7qqG3FGge2oXfZkyyZ4y3l/Ycd93qtgB0cT3gOgEJgZXLRRMsKG2
	Yvj+DuXaAD08TbWJ865iyeXO0XKhqd/PQrsgPFCT3A2fzHOhsUw/wkAekp7YbGCh/mqwyQXx6Es
	z3FThxAL1CRN7V8ilgs1CsYQTfqViG5OPyYbj6lsJciW8w77FuhbWsut83GZZKSNN47pX6eJ1pe
	sBcmdzR0UZWNfbYkKIsKQEIqbxaDSnbQ0vah41+A9k4+WOH7T2npgOfPEv4f+VpHMecpZQYrECp
	9NNoqCYz4
X-Received: by 2002:a05:6102:5792:b0:7a7:195a:1b2b with SMTP id ada2fe7eead31-7af1f815d47mr917073137.37.1790251635710;
        Thu, 24 Sep 2026 05:07:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a7:195a:1b2b with SMTP id ada2fe7eead31-7af1f815d47mr917051137.37.1790251635032;
        Thu, 24 Sep 2026 05:07:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 00/48] clk: qcom: Use common probe data for always-on
 clocks
Date: Thu, 24 Sep 2026 15:06:12 +0300
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQStWoC/5WQwW6DMBBEfwX53I2wa1zCqf9R5WCchbgQHLxAg
 iL+vQvkUKmnXlY70mjm7T4FYfRIokieIuLkyYeOhXpLhLvYrkbwZ9ZCpcqkR2nAtQ30Llwh4j3
 EBlqsrZvBtnc7E4SODcE1BHmJJs1zU+VaC067Raz8Y2v6Ou2axvIb3bDGvxwR+5ERht0mSksI3
 HX1Q5F0+Bhgx1Dv4jcf4/6hq53jhYzMgGvB3UYiqLvgIFQVISd9KKOl1UcldTEpsTJdPA0hzts
 zJrkh/PvuSUIKKrNKY5ZWubKfgejQj7ZdDznwEKdlWX4AvA98WHkBAAA=
X-Change-ID: 20260916-clk-qcom-rework-legacy-always-on-clocks-8be60886f844
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8396;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xmHibZql2cbCfwH2tMq2yYIoAv+AaWfRsZ3z/d04h8E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJBa8+YPMjQGnKwd/hszH4rAxb8eYPDSM1V2
 0YXuPen4SCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQQAKCRAbX0TJAJUV
 VsWAD/0UK271cWx/6D4GajvrSdg0q8YU5EXbZ/KQFXHvRjZnlqNDbXpyx1NSv7tPq7s1r5up7I5
 sZXBBKokV1peeLVVwAwxsYgBxldSF+54SL2VX6wXKivQB4Ivd/9F8pdtYa2AgUCNv0zyu4M671t
 baxmbt6gcawLz13Fy0mWaaRIobjzDCkFf8ziBILwpUeU15JiOG7tamD7Rduikz5mXKoi2OXm6Be
 BNUo/grjUiJNOZtYPsDtkiSTHfPlcfHzU0fTgkA4B9Y5IWK+2x/Et2DWuM3BSK+rZQP2M4wtMLc
 lYTX38OCidtFeZF1AldwVkmzItwiSawyhJB62VtjdArNFBgaXVpOUHvymAy86qU0k5/eDWKqjhI
 cKnr0SmZVtJpSpSxvQzE8mW8FCnwI0aEYjPSr8i+2113nGC+413Wd8hQY3MGc4gievBFdvDVB+b
 wKhs6ow7l+KeI52lQSvYtvzwtpyiyPtvtqah5n9lkTxhykVBn8lC0RoYJAG/s4s2n54uBXwyUbd
 snd7lp38tS8CEH8SAK+gLmJQCQ3dmY6c4bpj8N7uU+dmHldsW7HEYOMI4H4yWcE5HFD8fIyxHnR
 T8bWy7xaHoMAKHV7uM6a8HbBoP0f9kirprIzZF0PsHUDMC66VDlekkobfgRLYSBWOBHHEJDMnjb
 hMjGOIEZaozX4fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jT60bsNEt5wHZmdmHsXypOk8JL9oXddG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1bownKE5XXAc
 u4jcno8ygG14ghCyU1nEcs0+ZknKgRpbLMcVkRkpVoCtpLvjKc6zF0IJBObBPNcJSfDhjJmkoBL
 oTwCVFkRCoR/okaj4g+XKIvpd/2QGTyuyiJVtkOzG50yAhQyP0navaGJKTBoD6u9WRADUrfXF7g
 loQbqZ7csNd7Zea3nf/ZJf8Df9pWQkNOJ4+CQrVHk25rT76yhyxbE9BO0atnbNBZ4deho96dSZl
 qKnfAGhngCkVuLmKlMeCL3aOUXJZwYUBOR1AVJyV/Psf71OrEnLlGMqBe31bcF0qmPspVcpih0f
 mJnTEhBdLT9NNrZaBbVDiwm396gL6l2O0gbR8iZ40M4RXKLo+IhtMheEWO2lYe8UthlogVzSbuo
 TTnyMJ4mZUn9B1LKywIAQkjprheT++VV6s/mZrqTisTt8Wb7eRZbhcG1tohSu6R4rHmSzQEVMj5
 BrpXMneu5aRaLo+5YQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzp48idO/3f5+
 vNjtkEZbPaCkzCGLp2ncIgolJAy7jl6Z4Q1b0+GUZCsH/DE8KSDu9RE1M8OmCEDN+IufA8bocun
 TEzJK2KcNM1d+iMqJB1QwUMXH/P84bQ=
X-Proofpoint-ORIG-GUID: jT60bsNEt5wHZmdmHsXypOk8JL9oXddG
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab51275 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=R4yQLYBIWIdZ3r_OYs8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Many Qualcomm clock controller drivers still enable always-on branches
with individual qcom_branch_set_clk_en() calls in their probe functions.
The common probe code already supports describing these register offsets
through the clk_cbcrs and num_clk_cbcrs fields of qcom_cc_driver_data.

Convert the remaining users of these direct calls to per-controller
critical_cbcrs arrays. This centralizes branch enable handling in the
common probe path and makes the always-on register lists easier to review
alongside the other controller data.

For GCC drivers, also describe DFS RCGs through the common driver data and
move auxiliary register programming into clk_regs_configure callbacks
where appropriate. Drivers whose initialization is fully covered by the
common path can then use qcom_cc_probe() directly. Keep device-specific
setup in the remaining probe functions, including the separate CBCR lists
needed by the SA8775P/QCS8300 camera and SM8350/SC8280XP video variants.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260923.
- Picked up Konrad's R-b tag for the entire series.
- Use the common alpha PLL configuration handling for GCC SM6375.
- Use regmap_set_bits() for the GPLL0 active-input configuration on SM8250.
- Link to v1: https://patch.msgid.link/20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com

---
Abel Vesa (48):
      clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
      clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: gcc-qcs615: Use common clock controller probe data
      clk: qcom: gcc-qcs8300: Use common clock controller probe data
      clk: qcom: gcc-sa8775p: Use common clock controller probe data
      clk: qcom: gcc-sar2130p: Use common clock controller probe data
      clk: qcom: gcc-sc7180: Use common clock controller probe data
      clk: qcom: gcc-sc7280: Use common clock controller probe data
      clk: qcom: gcc-sc8280xp: Use common clock controller probe data
      clk: qcom: gcc-sdx55: Use common clock controller probe data
      clk: qcom: gcc-sdx65: Use common clock controller probe data
      clk: qcom: gcc-sdx75: Use common clock controller probe data
      clk: qcom: gcc-sm4450: Use common clock controller probe data
      clk: qcom: gcc-sm6375: Use common clock controller probe data
      clk: qcom: gcc-sm7150: Use common clock controller probe data
      clk: qcom: gcc-sm8250: Use common clock controller probe data
      clk: qcom: gcc-sm8350: Use common clock controller probe data
      clk: qcom: gcc-sm8450: Use common clock controller probe data
      clk: qcom: gcc-sm8550: Use common clock controller probe data
      clk: qcom: gcc-sm8650: Use common clock controller probe data
      clk: qcom: gcc-sm8750: Use common clock controller probe data
      clk: qcom: gcc-x1e80100: Use common clock controller probe data
      clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
      clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
      clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks

 drivers/clk/qcom/camcc-sa8775p.c      | 36 ++++++++++++-----
 drivers/clk/qcom/camcc-sc8280xp.c     | 13 ++++--
 drivers/clk/qcom/camcc-sm7150.c       | 13 ++++--
 drivers/clk/qcom/camcc-sm8150.c       | 13 ++++--
 drivers/clk/qcom/dispcc-sc7280.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sc8280xp.c    | 18 ++++++---
 drivers/clk/qcom/dispcc-sm4450.c      | 15 +++++--
 drivers/clk/qcom/dispcc-sm6115.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm7150.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8250.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8550.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8750.c      | 19 ++++++---
 drivers/clk/qcom/dispcc-x1e80100.c    | 15 +++++--
 drivers/clk/qcom/dispcc0-sa8775p.c    | 15 +++++--
 drivers/clk/qcom/dispcc1-sa8775p.c    | 15 +++++--
 drivers/clk/qcom/gcc-qcs615.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-qcs8300.c        | 51 +++++++++++------------
 drivers/clk/qcom/gcc-sa8775p.c        | 55 ++++++++++++-------------
 drivers/clk/qcom/gcc-sar2130p.c       | 45 +++++++++++----------
 drivers/clk/qcom/gcc-sc7180.c         | 60 +++++++++++++--------------
 drivers/clk/qcom/gcc-sc7280.c         | 54 +++++++++++++------------
 drivers/clk/qcom/gcc-sc8280xp.c       | 35 +++++++++-------
 drivers/clk/qcom/gcc-sdx55.c          | 31 ++++++++------
 drivers/clk/qcom/gcc-sdx65.c          | 31 ++++++++------
 drivers/clk/qcom/gcc-sdx75.c          | 31 +++++++-------
 drivers/clk/qcom/gcc-sm4450.c         | 64 ++++++++++++++++-------------
 drivers/clk/qcom/gcc-sm6375.c         | 46 +++++++++++----------
 drivers/clk/qcom/gcc-sm7150.c         | 60 +++++++++++++--------------
 drivers/clk/qcom/gcc-sm8250.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-sm8350.c         | 52 ++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c         | 51 +++++++++++------------
 drivers/clk/qcom/gcc-sm8550.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-sm8650.c         | 59 ++++++++++++++-------------
 drivers/clk/qcom/gcc-sm8750.c         | 76 +++++++++++++++--------------------
 drivers/clk/qcom/gcc-x1e80100.c       | 61 ++++++++++++++--------------
 drivers/clk/qcom/gpucc-sar2130p.c     | 13 ++++--
 drivers/clk/qcom/gpucc-sc7280.c       | 22 +++++++---
 drivers/clk/qcom/gpucc-sc8280xp.c     | 15 +++++--
 drivers/clk/qcom/gpucc-sm4450.c       | 17 +++++---
 drivers/clk/qcom/gpucc-sm8550.c       | 15 +++++--
 drivers/clk/qcom/gpucc-x1e80100.c     | 13 ++++--
 drivers/clk/qcom/gpucc-x1p42100.c     | 17 +++++---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 31 +++++++++-----
 drivers/clk/qcom/videocc-sa8775p.c    | 17 +++++---
 drivers/clk/qcom/videocc-sm6350.c     | 13 ++++--
 drivers/clk/qcom/videocc-sm7150.c     | 13 ++++--
 drivers/clk/qcom/videocc-sm8250.c     | 15 +++++--
 drivers/clk/qcom/videocc-sm8350.c     | 31 ++++++++++----
 48 files changed, 873 insertions(+), 629 deletions(-)
---
base-commit: 4d7e75152b01862a4ec598435d79a81c4b254dd6
change-id: 20260916-clk-qcom-rework-legacy-always-on-clocks-8be60886f844
prerequisite-change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214:v2
prerequisite-patch-id: eb58e7f69eb18fb6f7d490e8094d8a3f2c0d0b2f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

