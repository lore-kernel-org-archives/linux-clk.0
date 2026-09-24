Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB6472076
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246422; cv=none; b=A2NLfqVbekZJG4pvZ++iiw6gy0eAg0Opc0IRFuS6tUlawRBbxW98CQTlhpYWG3QFNY6vwvFYBdLzzAR1fyUrigjIAAPgGmPUrtaIJBSMgiFVAZ1vXEN4QW5K+rIdCKfJ/D/vsxxmR+nQAfQhkaqDHLN/tPODKEpSLuBb0y1c5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246422; c=relaxed/simple;
	bh=VONnVvSz+wnKXVX5YulV3pzPfrUVEVaqlrJIx5KLbP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DcI1BnP5PQMEvo5taU6ou4eelVZs0uUmCtJAogRcpjUx1rPU61bpm8TGa+YZO9OANkqeekWvm5Ui47CcPBt/EIWLfzDbE4ll7MmRui31BO540DRQ5jEjoWIILwHTj1bVnJeoRx5LWqTqDC0ea/5J5B1Y+D1NWWwp2B3yS6UPZGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQ7qkmKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc9ydLu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQ7qkmKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc9ydLu9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P0Mm1063589
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r7Uw1BZ6AsXNNu+yH9eyv8
	baRhE3440gT5XSpe1nIJw=; b=JQ7qkmKRg08jc7H2qIxP8lZ8IH9T8TtbI6st5+
	2kXXUwzQknfDEexIT7SMKr+QLE58uMCQRgm7KzpNwBhpv41wYOJi7A9ETLGHhAcr
	ftVnFj0U5CLL/xMVsVci1ZcowTw29iNt6RuMTOR2P4s4bdOYg8ceDOQhAoBG8aUu
	54XF5Wqlqk1kQZcrvEOSZpzrcrkIkFa1ZFIDAG03Dbn36IvwU8AFzzAZmV5FoOKg
	3I0thLhxnPq3338tkWI67JysRl4pXfaM4O35fgnd4C6PsR24eMy6UpDDr0G+DhgN
	jrFjBBoNhOShLddjUYoz9l47tTIGWBwNrB8DBsmNPv4T1Ilw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9hnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso450077085a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246414; x=1790851214; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7Uw1BZ6AsXNNu+yH9eyv8baRhE3440gT5XSpe1nIJw=;
        b=kc9ydLu9Ef0sJCzK6xdnYhx2HECNkZy/JdhPpnugIsFbMAjxcFg4HT25MqkEqdbhY8
         va7mxHAEltPjEzXQ9utd5gOKAHbeGbzZ2/hZL2sLgO6Becbd0hLEJ7x5K69/zyuFOIcp
         YC2W0qi8H3JAPy/bgmNtEwA63hKmHTLrLYmFx+sXlchVzuCdT1rAQ/PvLpVoQsZWNVPU
         84Z5ShitFcCiX0yVQI8K/XuecuJs+JJnw8Zeo59xWSW2daK6WBeM4fjwgu48/p0aNg5G
         u1W35RhJonM55ZCbl9kJU0dgbQQlvf+nxNl7K/0hvJ0UFRiWJsYfcVcmhs+OpglvCuir
         yc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246414; x=1790851214;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7Uw1BZ6AsXNNu+yH9eyv8baRhE3440gT5XSpe1nIJw=;
        b=WGbpI9CpoG7sUYzArMPWsCqbvnkWyL8ygWFG/zhipuhogvIUti3+GCUTntjljSHbJ2
         B+YAeSRPkPh6uDDxW2zwU8DOxNSB74TM/67zl6f9xzhTOoy4N537blvG8eYhMBOqJwlQ
         U/uvEnwmG0KQkX1qqbrJJ1fjnETBy5ECY9CkgHGEFAyAhYpyIS0C5Z/3BZno5GzJBXJZ
         DL3KxlqjTuOc8BfPMInrvn2ndU2nSnrCiHpGfytgExZj8jiegcQNVm0ySr5p2nzXyE+4
         Juoxl/BWkNbQYCJxop60F1AVZC/s7MEjI84FvrM/9HirYy4aGOfWHbaCDJ+nQa0KlMt5
         ffwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYvlXyLFlHRk3pMyZq0mEs6Fla8VRR7vNPjGrfvWJaCTl+w9tkFidPAMNv6axPdbX0iQsuPOCgCls=@vger.kernel.org
X-Gm-Message-State: AFuF++m59W2KIUQZzXRsj3T6qI55+3jWJGV7RymK9on1oXr7AakEk90w
	zFOG6xXhmot9nx7WttJ6mYwQSBfmvJriMtJJ5HwkVTZv8P3nUui/bQs8AC4HvcJwB5w/h3YuxWk
	p9H7D2CMy1pWCUChO9oOID3tG4oeHwn5gnwNdUcTblvIymJ9/XuFNdUlTnbfej1I=
X-Gm-Gg: AYBFou1Wz2hZzceI0FpL6QT6zwJ/W0Q/JqOqQ23vQge8DpIw/d/97zt+Gd0p0MoggPP
	8UZKh0SJQOdy542K5zVpOGOUg7ENLAa0sD+I+pp7gsIu+vPIYy0b9+j377GDiaTvc5kK9zcadsc
	cxV2Emeob2x94sKLOXvHM/C6hGJRBTUUFqVe3VZDuxDFTn3mxu95oZhTfjHQ3vbMpCz1xonzobR
	hcpfelXfXroDXi99ErXjQR1LaZLWqWVTn3C+Udu8hiUK6pfX5qjhtWAvPY+7mMpgI1hP+Bz3My5
	/A5u73UuxBpEoKLoI54hvdpNqPu9i7lwqmYIGrHGS/okXu/5qhc8vSmHnwVOiXybihqmzXQgt6Q
	ej4zGD5WS
X-Received: by 2002:a05:620a:404d:b0:937:5298:7820 with SMTP id af79cd13be357-93c3625a9f8mr203536085a.8.1790246414369;
        Thu, 24 Sep 2026 03:40:14 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:937:5298:7820 with SMTP id af79cd13be357-93c3625a9f8mr203488585a.8.1790246406102;
        Thu, 24 Sep 2026 03:40:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 00/42] clk: qcom: Tie CX power domains to GCCs
Date: Thu, 24 Sep 2026 13:39:16 +0300
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANT9tGoC/33PQW7CMBAF0KsgrztoPHacmFXvUXXhOAO4KrjEI
 QKh3J0JXZRF6MbSl77ft2+qcJ+4qM3qpnoeU0n5KKF6W6m4D8cdQ+okK0Jy2GgPp5gPMCSGeIE
 hwy5GcDU752tnfFspufjT8zZdHujH528u5/aL4zBLc2OfypD762N11HPv34FRA0JjEY3VZLk27
 7mU9ekcvqV7WMuh5p2RniTCRYlEYnlwMNg1bd2+kMyzZBclI9JWE1bBk2volWT/JK+XJSuS76r
 g0IUumKXfTdN0B+OIrTmrAQAA
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8749;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VONnVvSz+wnKXVX5YulV3pzPfrUVEVaqlrJIx5KLbP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3aXnkexjzrS6RXjKir+Ju0M6kdGGSvWNyKS
 p5bEEHCQK6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT92gAKCRAbX0TJAJUV
 VvsrEAC4O1ymc2XnZvIsqnK2Xs/0+frXCQgfqsjli3/pXTk9M5OgRYArXjKIuy9BW2exexu+Old
 cA46vPibIYLzs3aTj3pxaZbwq3GGJWQ+vOkKXTXPcmTP+D+MbpGiFPqdxQvYXPuF2FjTkkTPO7j
 0awBWjBfhCDan/o2Rt8jgb3xXNyx1VcjQWR4FvWPbD/EVYfsGDcW0oFToUM3dABJiw4jDl/GE0x
 X8yB+/SCayhkZ99WuW60b8N3311XaqN04TOanQ3BKB/PLAvg/eTJPyANOivrB6AmpJV9l4CP4hB
 1GXzttsIgJdAlwEOl3BN1umFeHQjgWWzmBIulxnJjrHJiEean9cbtLz6mWyjBaNhglKSBX7fKRb
 fyk3t2Krh/Zr4D1DgbX8JxfwU7blwTf2fFDX/jzhngxuPsZ8ePfQ5diB+FjM3IM0WlNMn8ys5Ii
 NwseTzvSAdkk+C3cAP6pxhhw5L5bbzSKzikU7K8lHn/2/g7VllmI00+DFyqNZNBbKtYxWTIKHoy
 ommTmAs928XqMhMc4MOpN5k6oXRXYwx6+PpErMtipCG4Wg/uzt5VzaO+e9QNwVoOaHBmreMiy93
 6E5y4G5FvYyGJj25i4qMOJ9udJDooi8Qtro2+Zpl4pCyKLpUdXZfbWd1eTXfbE7JxSjz1eJPovT
 1eyW/l0ThlZLz1A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=IpJZQVW2AAAA:8 a=AorRh55Pj3LJC35zYIUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: FuZd5mklpYp-Twx1EXz_0JZOqqC6Q3n0
X-Proofpoint-ORIG-GUID: FuZd5mklpYp-Twx1EXz_0JZOqqC6Q3n0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzPHDyNJCHhyH
 8dKx8ctybhk+F225Ug1d01o1mx0qyaVfOjzQg8cSXPj//X695D+0t8qwqQwHf60SRcgWl8DXG1N
 ahGknl0GDKiQE2451ljYFcT/BACbRpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7Ww7Kq1gVeCH
 /feZZsKvMb7SONgqxNFSMNMcYDgy0y1xDw4nWiogMa6zs4RX948ICd0tXnILL87lnPiAcxXEI/X
 tPWXB1iUnYDaT+4kwTp1jkfU+zXbZnD3Mnbvwl+XCiEyfMbRMeDgaFfs/lH4dVmhtXxZX4Z+SHz
 tEcT7MUEn3b7sBDofkaePcwzz690BUJxFUQr8FWPcvUkk9eIfhQOdkRCjo3uYrSBOAGyGZDg5Pe
 xNxQgzx8AFHBfl5/oHEwCxeWV53kC47KPpuybgCAii0w6k7EhwVbGaMAZnCN99CF9bxa19vQldD
 Otux55VggDcPzhLJXCTqTfNnsGM+5CRoig6jj0GbqQz/67RrJrjM1csHjcD0H6PGXb94fTN9XG5
 A0pBHF36SJHFeA4o6708oGRBmjtvSRTTEIIigQg7dl9jBjn4AnTw7F3Ic5aOkKa9ZVgyZWFo0cj
 l3NeVWFLM8nMgPEbofg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Tie the CX power domain to GCC clock controllers for SDM670,
SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
SM4450, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
X1E80100, Eliza, Kaanapali, and QCS615.

Enable runtime PM for GCC providers without critical clocks, allowing CX to
power down when their consumers release clocks and GDSCs.

On SDM845, the DT already describes the CX as power domain for GCC,
only the driver needs runtime PM enabling.

Update the GCC bindings to document and require the CX power-domain
dependency for the affected compatibles.

Only Kaanapali and Eliza require Fixes tags, as runtime PM support was not
available when the other platforms were upstreamed.

---
Changes in v5:
- Rebased on next-20260922.
- Drop QDU1000: its CX rail is always at NOMINAL and does not follow
  the regular PMIC control.
- Require the CX power domain at the binding top level for SDM670 and
  SDM845.
- Pick up Krzysztof's R-b tags for the DT bindings and Taniya's R-b
  tag for SC7280 GCC.
- Drop runtime PM enablement for providers with critical clocks, which keep
  the controller active.
- Link to v4: https://patch.msgid.link/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com

Changes in v4:
- Rebased on next-20260911.
- Add missing CX power-domain bindings for QCS8300, QDU1000, SDX75, SM4450, and SM6350.
- Address Krzysztof's binding review by documenting the CX power-domain item.
- Explain why the new required property is needed to prevent CX undervolting.
- Include the direct RPMh power-domain header in binding examples.
- Link to v3: https://patch.msgid.link/20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com

Changes in v2:
- Clarify the runtime PM rationale in the GCC driver commit messages.
- Picked up Konrad's R-b tag for the dts patches.
- Link to v1: https://patch.msgid.link/20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>

---
Abel Vesa (42):
      dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
      dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
      dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
      dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
      dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
      clk: qcom: gcc-eliza: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
      clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
      clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
      clk: qcom: gcc-sc7280: Tie the CX power domain to controller
      clk: qcom: gcc-sdx75: Tie the CX power domain to controller
      clk: qcom: gcc-sm4450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: monaco: Add GCC CX power domain
      arm64: dts: qcom: sar2130p: Add GCC CX power domain
      arm64: dts: qcom: sdm670: Add GCC CX power domain
      arm64: dts: qcom: sdx75: Add GCC CX power domain
      arm64: dts: qcom: sm4450: Add GCC CX power domain
      arm64: dts: qcom: sm6350: Add GCC CX power domain
      arm64: dts: qcom: sm8150: Add GCC CX power domain
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml  | 6 +++++-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml   | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml  | 7 +++++++
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml  | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                       | 2 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                        | 1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                           | 1 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                           | 2 ++
 drivers/clk/qcom/gcc-eliza.c                                  | 1 +
 drivers/clk/qcom/gcc-kaanapali.c                              | 1 +
 drivers/clk/qcom/gcc-qcs8300.c                                | 1 +
 drivers/clk/qcom/gcc-sa8775p.c                                | 1 +
 drivers/clk/qcom/gcc-sar2130p.c                               | 1 +
 drivers/clk/qcom/gcc-sc7280.c                                 | 1 +
 drivers/clk/qcom/gcc-sdx75.c                                  | 1 +
 drivers/clk/qcom/gcc-sm4450.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8350.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8450.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8550.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8650.c                                 | 1 +
 drivers/clk/qcom/gcc-sm8750.c                                 | 1 +
 drivers/clk/qcom/gcc-x1e80100.c                               | 1 +
 42 files changed, 122 insertions(+), 1 deletion(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

