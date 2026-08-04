Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2B547F2F9
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865838; cv=none; b=d2cRUSKLrwt+bmXSdNdTqSuRE/UIiyfKVQMl1/AFymoAx1eYjvu7/sp/vYklm5R90Y2lHfdGfJaVDKCWu264j+Uv/ezZccNE9xWbtC3+N8H0Nzk3ctFW9Cu9PD8sE5nCParissXEHL4L2qDL28BuAzijDRD3u06m6hmZ5xxca6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865838; c=relaxed/simple;
	bh=4HLWFOIJoKrAfczj8cSYP5QPntOP9ZRMrRl2nIPmrtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J8CwY9yJ75xc+mPTQiMxlg2iiGzOt2qsx0aUyRrDYKCS5X/W8F2b7X3+y0O3dmT+Q8CKiljM4e/ijhn1vbhG2Y95I0228uYOcpb9oeYLKW7SFjCH4Bve5so1FnvMK8KlaRGMqbAmzwPzF1H385GhN+YJEq/vYJS2idGOufCzWyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9dOD2IF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSRuq7dL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9dOD2IF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSRuq7dL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674GgAmU774970
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCj2HtSGnhXe/Ygho7KA2q
	0SbWlkqUr8cQ+cFl5j0aQ=; b=Y9dOD2IFK81gElcd1KYYdzgmaWqFV6FKlLknQA
	W27ku4pHnad6XFinvORylWWRwyuRa9NMUKPwuGxMc2ejwrI2YFbcP/SeDqGiQY15
	LC6O3ebT/8+G9ug4BWiEO2oNS08tjmvwImlDwrpTKeOVB07qVbd6cEmO1QU7Be+I
	ItahjrfHPQJ3SRZBYsu240+sxqhsRlFmWQ5EmMJakMMmwDL2sb5I2pLPPA1L5Ouv
	GTOHuUovrYVpvR7oRGi5IxQCv9APVzMC9wncfMVpk3uGdQC0ekDQV9oFtG3+LvlN
	1z70dLK48E+ws4FPrQ6X9Hx8F/L6BRXQtCpDWTMbghkZCv4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku30a5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:50:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so2146445ad.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865830; x=1786470630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=JSRuq7dLHP9H4dOp1ZXYNHy1LobXtBk7jWvgK6c2TnBpVutNCHKaAh37VEviniTaar
         rjvwyWwk9uToSaOToAGgzG5kTw2CM/pGKnItL6/RuP3EKpK1AFq4wb0HaSig2GYxnsk/
         bzaKU4VUQezzwOFugeZLRG61Bb0m46ppAGVpPuhGKNlXbEM4mC3s0G5ZA96kECVuYbCu
         7HyJ2Sh/4Rbb3fhIH8/Td5udRDDbjMZ1xM7ApiQrq93HfQYJDWrfnipmluykRSy0TNV0
         s4RCG9RiO6GObDMvmm/c8+QPjfYTFu6xR6HvA7coCLpAm/rc5miLy5y7s/5fg4eLxyVF
         Hr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865830; x=1786470630;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=g2apwdNyhwNTtE8LGUpQsldk0gDcsp3urdIyXdFfO29Hbfv+UQPKGLLiVyV19YFddt
         HS28FNYl28VcJiNDGWDEy1ksXiv9WfWSrBESUhSEAkiZBGh8DX5gFyZoxe32jtIxCtDl
         FFT+rYCKkDINglLkV+FbtYsoVFxlFYGJiEcehZrGIUkDmY/bqKqVNtl3FFjHBOZtC6vG
         MiJN0hAZ12/oCEouxZfTsoCR94b8WzgCczuVRdbi2gBheleMAbecHjBbr/nhSr0JN/TW
         odifJqpquS8woyQXrg3qPAKnX4Bqqf/lIMDDBuTKFgZ37iCvnuBXhqcDwksCisLexJF1
         CPaQ==
X-Forwarded-Encrypted: i=1; AHgh+Roo7A7wtyNvf8ASeURaQWuG+cim0ab6NQRml/+liqJhM8mBDc4ccWuWbtUJWfxbX1iy7ZTCWSbG3AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YytDt7A/6h8GPHrc9tRKmV8+WfBSkWFWru6oGUVTB4suBqtIvel
	XlM+lnf3Cr5MLDrYzU7jvZq66wi7Pk/SSN70KPrgRlXxrVZJNJnWaTuCWE1G++A2bH8OtlY6vr7
	L+12SXsWgY3XN7I+CFe9vZht/itcLk8C2biZXJULAAQBFi+ttkOKoHZB8ZPKvRGk=
X-Gm-Gg: AR+sD12wUtiyAPo9CeYpyTXEECrbFVZfNySnZic9oTnpBtDg7rhH/aAUXrGRe1fjh7t
	EPnE6P2S5hySoypOqkKfme+r4JfVLqFKGA6DDk+MTRXGMxx7l8RkAx/eYuLLxkdMKPDBQ2CQ6Bs
	ji5C+opZpRV/E6p4YfFIhTllxf1Ydutg30I+Pj/Vyd8o9dp0qH3iY+kRlm09gB6cwbj1W07DZD7
	MPybGsOMe1H0347wKUZGoEWlDRV+VQAryljbvTwtgcafAp2+N3cC7+8lgPEVBCXYt2rEYz4sCQ1
	rRdDzbjyMtdhQ3Ax3n+gxa7UjUAperm6+9Nh4K3R4aA2/no1gowSJm17Irqu14M7RJD3zNPwNeI
	6N9u4RhPscmi5Zj6FU1XyYolG
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4965095ad.32.1785865830514;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4964505ad.32.1785865830115;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v9 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 04 Aug 2026 23:20:13 +0530
Message-Id: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYmcmoC/x3MTQqAIBBA4avErBsQEcmuEi1sHGugPxQkiu6et
 PwW7z2QOQln6JsHEhfJcuwVrm2AFr/PjBKqQSttVacM8iq3x21DIiwOrY3eBOcmTR5qdCaOcv3
 DYXzfD5WYpL9gAAAA
X-Change-ID: 20260804-eliza-mm-cc-v9-66fa4d99b2ca
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: U3Ahux9r8UqDoFRpV_vfiPW87sPWryvk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX/5VflH4hv1Qm
 lnKNro/F+3Xe+bUAaoM9Wben1NoM4JsaAIbD9p/gQGeu2sTHssyRmqZ7kxW8m/nHLDketynAE2V
 pw8H4KuBcbG20aHuNgl2LMnk+iX5o2k=
X-Proofpoint-ORIG-GUID: U3Ahux9r8UqDoFRpV_vfiPW87sPWryvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX/XVL7akVVYUD
 7uNQ457VDtbQSub+gDDXERNvpRdUl3rPjWK8l2HpCRrwH/trK4pzUhgx83tbDrE4WNWinARKwuQ
 /ve3DAKCBj3ScOk0SbySKhdbSmXVlbXhibHJwPmQp+vVj1G/qh+Tc3CanY95vjHnS0qIGjZFKl8
 ndudNgZLAAUZk3mSFa0IFOhWbh8Pr/15nSNXqSlLENozkr3joOP7NqXqZhph0TOwNEh3GZcG7II
 1c/LXUocxldrYhAtMmFqwHPYRsW3PQdsrk0/B7y64VAR7raiwt2zB/s2Wuy4wbFr8iVrXhESEwL
 sUtl5oUAJm0l5nIA2Y0tAaQjf4uxMmCnclu8yREc+UChlB/w2CxeSvHAgGL9kyOzMBwj3X+d8U7
 5JzBr7CTajwd2gsFvWw/tJBel69nb7vHtSgFe2UyjfViSYVFuGSN1/upDjEByx1YNHfT5jRhIlU
 ce0uzfhDkBAsL3eVVIA==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a722667 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9qvLLBMeT0BavxF-EG0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v9:
    - Rebase the patches on tip of linux-next.
    - Added the RB-by from patchset v8.
    - Link to v8: https://lore.kernel.org/r/20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v7.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   31 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   76 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4727 insertions(+), 4 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260804-eliza-mm-cc-v9-66fa4d99b2ca

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

