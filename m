Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884072;
	b=woJFp5oK1+SBtiQL/d3M0o9ek7JiE+I+LiFm3JG+8cO31jRgotSYfJq/EA5F5UQvMSdZ
	 HO7/F2TpNGqokDmcKH8HGMX/354G2LmuigsbTZHOAglthGCL49QYb7Cg1MfgcmO5h+gZx
	 IXUvW6DgEkD7czCRwao9LxNnTg4EAl/Onj32kJaQcg2nokuiW/NhXaW7r4L2zF98XrEPV
	 7r5DbpJYAtM+GGzQqy0eGzpJQS/48JwUstDOY6VZjaO3BpTOsPB+6/D2vdoc7gxNfcQTH
	 xx/F86yZmdIFnWjxfVSttJyN5FvhsEJ1P9GTIJBVL+IiYehVn9G5maCo3CNw8NxrVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
	b=0Qjqwz5OgHF9l+t9B1Ya0qa83WC+mm7pLi3kcqS8TxEAeIyJxiP0AEI36Dn6tweIagtI
	 GDd5IVS0EWliueqRU0824WBkIjVxykwKH5FWgeL8DHAJMEhLcWECwtvO/6HG6G4lMUJry
	 oPvpjGQEx4vGGCAOupDnDaCK7ffuIW2YZlGzg9zu1GOKT2XhZPNC/6LMfu1fRyWUbQ74R
	 LZloCmoRGVsh7VHdvAIXAwLNhogxbllvpIyp7QG7KexICQ0mxbH9MfVl26spZ4mLmTC7K
	 0rgT4HRKJDflMveB7aoyk4LG00lUC+HfcjwuHO68D4VysCa9Nr0+RO04KwYHL7zwndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n7HkO/LI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95B606A31B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C95B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7HkO/LI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tcfD1028251
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0kaq2eX5JhBwGzI8FjgMD7
	kHw+EoZ1YtEVJNHdDTAco=; b=n7HkO/LIWLbIooaXKMNlyOgDVocBx1Smgvx+Iu
	mcOk4BtfrroQoPPbbcbJi/PIDgYJH3tbDpBTE9jfLrWZ6yLUGyICUMAXg+sj9VMz
	wx/ctuLPp1ba88QcNfLbn2eaFrEbmkGIiAx86PjShv4aT+SCjCU1Jh6RQ2yBlFSA
	44MX5DzlWP35eP8ijX9J1qPWAkwe3i+Dmv/tiuxj0PNrpRkmft2tupfDMqSKLmBT
	DZ4uo5B7pb0LoCS3QtAT4R6yygrkAip5Z+EmgWIVbfWXvh+zNxZlgg8T+/w6CAo5
	TVgFd+rN95yyQ8wmjl9zh2iKcvyHBc+fkse2VU51h0z1cCNA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9wps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 13:07:50 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67686ccd1b6so3239635d50.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884070; x=1794488870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=Wqjt+DRid1edpBwCvhFmiBZ1NV+2agKZn5xroDAu0syH6VmrCBKYZ2XlQLzbtyCqXp
         oe+JrU0XaHUM+AQhMb1/MiQZinZAgpoRktE35Y1O4TknNkuZlFoMVNob2whvdOcI99Jm
         LWLCqvBYsE6qQeTmqThaszdoWUlNDjpB/oczUSCWdC+B/YoUG8+zdGXDtJPRz3TC0tdY
         6+1/Mx5emugoCvmyo3h3qD3+DRlH4K5fDMson2m7+hogPqgrIQYqIxrlsSer4idjUQgw
         rdECnMXuFgSLfixkU1Bg6g7x/NtZ8mSAHmErNvABFkJG4EBYJiMxlzlthWpewB02J036
         AyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884070; x=1794488870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=WGmKbR7ek90U8r77L0Y93p8vQ2GwwPKUo8IrXmCJbI7ZxaCHtQAb2JGfA/DNTatoDA
         oQ+0XhnPT9Pu64/srbatkaY3RY8yo8iWQCG4FSXdGCExwQf/NgCwD2ozrSMrKNFAVXZp
         1PsjwXZSCyshoMAad9WQ2ADsUGY1cY+II/6GPrdLATRJqA7bH4XJeEiVY1FCGXEV/zIU
         biKZjRAEEnRRoFFRjupLHPmPYETxn0p3SHWjcC+h0C4WpN6r6XHXcXn2ITpsuADJ1CWa
         sJgKqDjx+rpIJw2nfSr39qdVy10yd+3+vIx49h5wldh2pdioSrPtmk3PkRtfsoSN6QyC
         dEeg==
X-Forwarded-Encrypted: i=1; AKwUvBw8pJFY4CanUnN7bTYH958rP1MZ6aesZ6wdXzWAZv8ZOCrMQb8oO4psjlxtlwmDUQThsMO/gi29fAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dej7QxArRCjoB8kMK5MboIfq1o1w8mOlJBi6RAxG2cgI2TcgK
	/Y7XY4xFHuSKPRo1GBqbZmSMsfeaimi+Qvbx2j5j/XHOyA0C/NhCOG4JAIxsbHVY2fJi+KTIoV1
	lmK6Ut9FhdvfCWPePivBXPoKHKn6vp6jJVNfC4b4HADAUhsVO9yerr0PwTK63JgQ=
X-Gm-Gg: AYBFou1sLBgLNK/nPapqpme467pryRRZZjIkM/B8LPzi7+z0RQlJmmLK0x7KOajxRug
	/NaeC24YBDHhhMxoYLU9VtSwnTQ6Pk7kijcs2wL7O63om8uEhyvRNyVynn5jMzgjCWYIQj3dcDe
	yC5cBLmV1ryDXcL1w+/kt9w2Y5wdrLSLBnEBtkXSCngy+ZI3mtpJD22gnXYtv3D6R+Th+RLwJke
	6uwSW7Qmnx7IqmtRTchb3Kp7I1+9QmdCDcTSxdcnVQc2Q6BXJrT/xlpgsINQSYfVF8htLmC3VQJ
	RlF43XcBq1pX0Wpowx3VlLcMxNJbGgL294lw+kCXTMlQ/2lQwPz7HJEL6G2fL4VxlXZUi8MjtCl
	Nh/7KiTQfdnimgEfRrEmPzCHR6+0WwVxvib8nIKU+o+8I6/nmiLmrEqqiZfO9YoNuZKiF/b45/5
	XYgut+wgtEGtp90FIS
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599076d50.92.1793884069714;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599060d50.92.1793884069087;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:07:48 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Thu, 05 Nov 2026 05:07:11 -0800
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9/7GoC/yXMQQqDMBBA0avIrA1kQlrEq4hIMxnbKRg1Y0tBv
 HtTu3yL/3dQzsIKbbVD5reozKkA6wrocUt3NhKLwVl3RbTerDRPgyzrxaEdkiqRGdkHR030ERs
 o4ZJ5lM857fq/9RWeTNvvBMfxBaAEMQR2AAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2682;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=FwCPPd43C9+UFSP0VeeVecOu7OTjX3+26VD0c618IqY=;
 b=SCD5tZUyjWGsUIgi3dbLM6Hphh2nWi8p4z9NkYkuElvybRF31+EhpUuN0eDq9i/1HpT9fBEac
 xn0MMm22K2lD6Cir3JolbsuwxGvtY00njX2xbn1QaYW9yk3A1bVZJJc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: iNfhJttV45zg1MKq1j1NZlV4JYk9ayOW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX7zrbFmIw2Exy
 HkTFVRsym0dmapL65gNAbNmaMJtcRGHnHhXFSsMQaBbkTPwQEGgC+YhMD6ST53yj1b873EG2bdv
 SeVhQErcVFyYopudUiAB+oILy6ObX14=
X-Proofpoint-ORIG-GUID: iNfhJttV45zg1MKq1j1NZlV4JYk9ayOW
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec7fa6 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8DxjrM3GApEK5qXUAGkA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX8Pr887uvRWAR
 /OcjWV8IGNFhSVeD4ZPEku2NxdNwyq6kuw+sjQRsL+b45lxwABuJ2bjDVd4a/UKRe3a5awu/XrQ
 RY4QOh3X+DLT/bDo8WiC5AC7JHhlaSUcBXQ6l5QDTbDRFWoBjMMrvrY0pAo6Jliqo17Z1UWcVhp
 8oMTQJAS9EDB+s+HBDxhMZ1q4Ikwfx4665sOK3mYfWa3/Tcgms0tFCo8aHEOmUrek9J15g5EjC1
 KzhzbdenPVwpiBs1Zhh+3+Mkv6uK14It8FkKfHEql2ywMMNnurj9NE/9jhJ7QvhDbEZxwXSOmGP
 Lx8XWxJWYCNzMLmdrixVKmcAxxE6n7/+LI+3vDOZTFyRx6A3A7yyFLclK55dY83vDMGDgVm212U
 m/zVAgku0jTMKbCYLy8TViUMP1VsKlwi230Sjr7W/N8KMmwep0S6uPkUVqx04iRMJwLCK6vTEx0
 bWcRuXbtIa2NiZG5gwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/5  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/5  NSS clock controller driver for IPQ5210
3/5  DTS: add CMN PLL node (carried from the CMN PLL series, see below)
4/5  DTS: switch xo_board to fixed-factor clock (carried from the CMN PLL series)
5/5  DTS: add NSS clock controller node in ipq5210.dtsi

Dependency:
The NSSCC DTS node (patch 5) consumes CMN PLL output clocks, so it depends
on the IPQ5210 CMN PLL DTS node. The CMN PLL bindings and driver have been
merged in v7.4-rc1, but its DTS patches are still under review in:
https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

Patches 3 and 4 are included unchanged from that series (v4 11/12 and
12/12) so this series builds and passes dtbs_check on its own. If the
CMN PLL series lands first, patches 3 and 4 can be dropped. Patches 1-2
(clk) have no dependency and can be applied independently.

---
Luo Jie (5):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   67 +-
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2203 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 9 files changed, 2531 insertions(+), 5 deletions(-)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

