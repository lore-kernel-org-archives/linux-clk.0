Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823935E936
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519665; cv=none; b=Ul6sRqsxsekLlNLpt2Vo0bYMkM0ML8ii3OybL0lpeM+PIDSSkcwX0nS5j8pCwkHpmBgf/aOYK5DFxlO5loBRvvHA1ewAjz4jK72rfsnKBJlh3/wXW8amHBVuvRMTf4SnKpjhS1oTbwEbShuM8WeDsLYW9pSsJzOV8l3/yD2OUbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519665; c=relaxed/simple;
	bh=l/ZzLi+Xw8PiggYwGOqk+qJgdituppiEAMJfTNMTdoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T8qXuWwbU5DkLQU1yZXZrbYzzpYc1z+fuBwy+t6XAN+NAH1KuI3SKhoezKF0eBl3uX8NLsAc9XCTH+mQjDEiuwkv5+U1xc6UiT9klMp/cIdaw8/R7uq9hsdTC5MzK4GVOTX5le3NCVy+pEGsi/eHIfuERKwCK3VERkzFHTA+En4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p9ID1Vr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBOtCQDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p9ID1Vr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBOtCQDE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62daU2190420
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 07:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BlxfOngndhpU9Qi4UIuzmC
	qOBD5q32ffU4AryuabIcM=; b=p9ID1Vr3/xglykfVqVOCsJBYWPmU3+mk5aCvaT
	YElPcHCWsJNWG0LuOLsymdqHvspUVVc8dYo0WhHyqIMg1szRn8rfM7l6TTLS9sFr
	zrg3tk/qKUSPVhK/70koC6Hnomn4vi4p2WOIXtCouQLToxgQSDCKbSTti3V+v866
	ALGFzAzm3pcfoE0glrQBIX2fI0m8Z24t8nvyAB9GspmZZ8+qyGq7w1PhUq/lTtOW
	pdtxxi9BmVFJbcSiUPsC8yzaezxIeEcl5bFJ6Ut9t7+JcqFyLendHVn5+bh/NVmX
	7iFRnttua6mOE2qioDi7j0q1wZdZoLtiIq7DvRaqtqejEfUQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g41rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 07:27:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1126503a91.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519661; x=1787124461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BlxfOngndhpU9Qi4UIuzmCqOBD5q32ffU4AryuabIcM=;
        b=CBOtCQDEaOKzPd9dDmM1SBCA6wXMe/CuHnp8T/7mXpmeCqHsce/qeHqCRBN8s1+baO
         hw7nppVdQZ8q/ycbnIg252/SgenMXT7dFstUTkKHbKhcEntUZvBNYmIXGXPJTOCkPBn1
         ywcQDUg1bjpp8YxwVSoEU7jSMqnvevTg+tx6ucBppkeXiKQXyEqjMKUCidnyfId8OgK7
         leVzNlAQSqckD/uRcV2++V4Yu7Yghl3O6ZNfRXk5g0YgqqFGt5itcof7V1S6ESxnyjzR
         M/Pw3GlIZulLik6V2HTQWVqoi2c3OAx9Ei/OdAL9VmzKBSJXN9xT5n2HFFu3sslN/X0S
         sacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519661; x=1787124461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BlxfOngndhpU9Qi4UIuzmCqOBD5q32ffU4AryuabIcM=;
        b=gq/mcGWHWFgPjM7UluQIWso40RBuGXgfrcm9pjzF/mgUw1WQmZs6M0CBMeujbqEYAB
         gT4mJ8688ko7dgSzQP6GLk/F6S8hZR5D4qPqOoOqWk9GFPoqtQnlvV1SpAnlUcFgtJW2
         vUo2lLIqjZgS83JXCPwLXbumvLOcNV/79AB55H91z0H3ntWVCX6vIKI40Md4VnVaSsgf
         ZVHmN5gtTK2yU8kWlizx/u/0kUtHg3MR+dEMtCTkoEnFNXxMSyTKbdT3dwn+nxFOqFrm
         3wEddfuq7rz2t0m9Azgk8eC42Rol4F9gwWGz50VOiGvQUykeN/iDr9sjMJFW/J0DG+pL
         zmQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp8yvZYlUjOUioXt5yYy9bTHvbL9wCOxUSNqANS9bNRPvbWYoP1pcMv/48pFS8TXGEX1fkSJz1bSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxajGHxboGr6qEtHZNSSIpbjmZ6hxI56eDzN9pXzMlbdO9eSjeq
	EUBYR4T9LagdhRkFfvcOgc07jWF/SvFD9ezpPdD8dMhEK8GbvWZcQmQamw38Y2xvwQ06hCJJ0O8
	RZ/0OkH9ISdjIZmRtqUFgy8MwVjTI2TCCJcOstl0qxVleYRoHCoAAzNwMrsg+h12UwXb3h6A=
X-Gm-Gg: AR+sD10o64JYyx0BIVEQVuP8a4GSm+TClTxsGL+Q8hrRDy8OrGROJnRF4WTaIljnCrz
	2lZRgNMvPFzFcZFErd+b1RaP1JiuRoKbN024hA7HbrNVK+MtNyBlFiFDqgcSrK+8aRZzqCwh+/p
	yI5DLrdAjyXpvNvN4UFUzuZmtBXIP/Fhli6RpTiMJ7JLKL6P7MwaVzQMzKuLgFOAAxGxXzoPyCO
	T+OrgrEspDmCdZPEf4L225x3Zv83EqtWoRBrdQ+1iMIKO8tFbbQf5O/2IQBzREUO1+OFe+wv12Y
	oopWY505IIBSug10U2UfxtJVgoz8iPiGPXOEnXmPXmgwg5GAoCvVjz29fgITGKHjGGzhxnF7/yI
	S7XffqZTRJBAzKmiJgPcJXrKuqzJfVEg5jWpHTjzXGe0vIqI=
X-Received: by 2002:a17:90a:d610:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-393014be1eamr3330161a91.10.1786519661135;
        Wed, 12 Aug 2026 00:27:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d610:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-393014be1eamr3330103a91.10.1786519660639;
        Wed, 12 Aug 2026 00:27:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2506965a91.0.2026.08.12.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:27:40 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Wed, 12 Aug 2026 00:27:30 -0700
Message-Id: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIgfGoC/yWM2wqDMBAFf0X22YDGC6G/UiTkstUtVNusiiD+u
 6t9nHOY2YExETI8sh0SrsQ0jQJVnkEY3NijoigMutBtYcpSDe4zOTsHTvaX8GVl1CrWHhvTGB8
 xgKhfeWi7s8/uz7z4N4b5asFxnHfe3Xh4AAAA
X-Change-ID: 20260811-hamoa_tcsr_qref_0812-d4be5858bdec
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786519659; l=3815;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=l/ZzLi+Xw8PiggYwGOqk+qJgdituppiEAMJfTNMTdoc=;
 b=FmilgUVtfZjtb5MaAH6ge0PF4WWYVkJggEmvcfTDmXqPFE+W4l6CwrpZZHWvgi1e7qYChz7SN
 04NCZvmutzAAqJOHDIoF3IcYUUF1fyjLWRfjE4+aJZitmVExDQNRXK3
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: UBaZUo3vbog12FseCsOeP5nNjJ7FeLzo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX9ICwOs2XMYsz
 JY9wZ4xko9ADC6YmfE5eDt+DHrxogS0mjK7IR5fd8zvqySlHsb58PmEbErfoB0omGrkFoHHuAcF
 U90PrHLcyD9p7cuWIsUj2DKpOUxbRvg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX463KAhlZWRPS
 8YOiZuPK6lLGELQJmmbfCh0ZHzaqWruIGLpSEUL9KDR1TkFmTGY+LVs7nZZkWL5f5xngGKIkJoc
 5qX2ZksmILbTnJ3F52Smp9muaQQlru6ngR5ncI90347mke7zpBXs1eagOI7Zrp6Zelx9fD5oX2x
 VNlPLDXCm/tooIAvcYUe88i63AK7DhEemPpOEFDE3cyd2vfPyb/YAbiO4pt/Tbga30q8bDla2sk
 Cs8lSzryfY+Iv+S9XuqQS38YanGazfrw1/ms9TGlaBGc5LNjZw5Qxw0rEquXHKhUBSXZ8LJXyLz
 Q4RN3kBPJ7bNz5GrVuMYXO1LEola2yAvt5yfpM30y7zs50PfoLu5JQTBLDJ4NiqIZQxuiD9ASyk
 KHIRlScMOKHC8e9jV9Dl1wxR/pNBTb3RTzgMrNEv1QCREa3Ch2G31DHP0z4vdaRjYQiGm2nqVBS
 4L3uOa/8NOwTmSfmr8A==
X-Proofpoint-ORIG-GUID: UBaZUo3vbog12FseCsOeP5nNjJ7FeLzo
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7c206d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=eDrWBMRqIGSfgiUSBJUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120058

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

---
Changes in v3:
- Patch 1: `#clock-cells` and `#reset-cells` in `required` list.
- Link to v2: https://lore.kernel.org/all/20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com/

Changes in v2:
- Patch 1: Explain in the commit message about the ABI break.
- Link to v1: https://lore.kernel.org/all/20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (3):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 120 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 22 files changed, 632 insertions(+), 223 deletions(-)
---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260811-hamoa_tcsr_qref_0812-d4be5858bdec

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

