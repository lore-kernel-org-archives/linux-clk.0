Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779709;
	b=xJivoylsTTtXomDKIbLG8hqoKbmJndolh0zviqX5Ipm+6NZcU4A68jAe6o0dafjchtgH
	 cHc9sfXYX2ivlqLjuJiJQMEbuRj7kMIS8zXbDJTR/aS/gBTu8nWnKAlSVwjPv1rKWIijN
	 8+cbDmqCEmtWrkNR4msmLyfIzqyQwGKt8aEiFAw+XCqg53soWsXOQDT9jfCNBNqZKgdg5
	 BPFvhgjvApBIT9Rg1vJBMt3ka4n7vh3bJR4o8oPIK4aTZxebpkrrqB623qQsxbj1C7low
	 LcgADdZb3PVs66tx6oDsoAkEW1h8G8A4+sjwOHYWfBXonoT3FXG8DRvWJYyayFDkT/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tC1SvomcZHWP/lkVdzHQ2Y2uZvyTI08g+KjRKK8wH5M=;
	b=ir2QTM6SMgPFhjyvzQDigEFPT/NSr4dnjMrqJQ2TJ5isJYUtuB6J1mngaN2TajH/dIfL
	 XEt7DZKtMdCnxJG11c8fXW4KEMUCATsohnoyAb7r1Ksn8f8TNX4PmaN9X18q64264m0Wi
	 G4pZSb7Jro4L9n6tFpcPRcFhJWF/8Rjf8rZCsbWu4JPSwxvJYsRano/A5htPjdGfC9l23
	 kFphhCsk0sxE8002d0FWmfkCFTuCK/sFSUVGkhlgyoLH4Cfl30bHMchfTbBlHPSL+wnpr
	 YSNcH70PFCinjUAJuxjo6cpLB4eSGWv+CszNTZbBE3BrRgZB+iCpdf9gtoRUR8RXHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCyyaz7w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJxjnQXM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFEF60A261D
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFEF60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCyyaz7w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJxjnQXM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApDxU2677321
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tC1SvomcZHWP/lkVdzHQ2Y2uZvyTI08g+KjRKK8wH5M=; b=XCyyaz7wmipTH38w
	u5R8F7V1aFMAir4o+5hbtWxOYLHpmZj+y90GA54Xy84qiQvliTt+aPL9CaIsSeNN
	VVEov6Cr6hYFLiNCjMPTBPiAtkyfEwLsG6+Ky7JHu3aPrMr2jWlqRPW391dprABx
	yjeZYNXyzFt5LSeQGIuMaO6L1AYhinlSk7XMfydYQMGexnnh2ifCy3GI9mxBFh/6
	5sTPOgCKZD3J7wDxvTevdYnrXe0K6XUts1duT52hBEd/GHHm68U40CALcNsfVEZX
	Trmrrj7nmD731Ex7Y2yXX/DD3C5Hi9ZbL9vydn8QKP6nJDcuVJ1ESsWAt1ua6SGU
	kwbXLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh97q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so1728896185a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779708; x=1796384508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tC1SvomcZHWP/lkVdzHQ2Y2uZvyTI08g+KjRKK8wH5M=;
        b=PJxjnQXMr26JFSBf9T15WLsCJJDU3C+qrO/MpTbUrer8qcu/PRfPeoipzssR9QK/K7
         ZxXDyAxiuxPq0j/Ft5W1aeXHKjAoy4b4/Ptra4Qro8kFkkcJaecXERkY1xsyFVrs4Kzb
         rVzMfeXF3KqWK0Ogo5vUnIc+HnfohDZgYnMFmK+343OTLU2eb4a/BAJJXyayJa6tvwq5
         G8+A7CroyxJfkHipNgyVLVWqfkbi7r1enu9s2eft3QjmsJBJ2kT8JzMkh2NTv9Ya+YCr
         YFCzOXbv0BZraV1BlLG+PkCbhvqmBiPVn79PL8uMlVRFFx8wVjsxeOf5I2NfzepxKE8r
         wPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779708; x=1796384508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tC1SvomcZHWP/lkVdzHQ2Y2uZvyTI08g+KjRKK8wH5M=;
        b=2lkfZULn2We3aGVDFjDGqV7uyjVk2PCDiIrJS9w9qK+18LInrNBzRxIpuFW0qDHDir
         WP2IfR+l7zBwEtNXgKsS0QP7hIGiYhFSHfkDjbnzP05+oM/vLjO721/4bLNCIGxbk1bA
         c9e3nOh3TBbUMJhVh7L1cfwrnPn5nH9e4WEKz1cvGKZ/9F5613rciJIh5uMIHI4dP7kM
         r1Mkn0Iy0tMsUhp7lALz1YdWCgpPu6aElGKKWufPKCvKfMMRwM/pTHxuPWBY9tUNUpXh
         q1hp3/dZNXji4/SCiZQubg1y2cYxNvHSJolZNimS2RgkrpXf/pQRSrnB1XlW9kFSyf6q
         ZWOA==
X-Forwarded-Encrypted: i=1; AL+hErHa9yIXjAOYaFcrn7wEkw+pxFVQ5ZEG0RCa3zhuaHl8LOuwyfQJq+loISvX+FdH4IVoM1/cbk+QxT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ijB5P87sl+BWhiUWtl10B0ii2UBPoIrPZkz6AkF6WOvr5b4Cp
	GWhaEZAi+0yNhW1m7o7Tm+YwEher/HbSNh70fAMDSJsCJ7s1KDAEtXpN+ZqEFo6mVsrPmAszyn8
	DgKyaEBlfA56K1xgHijF1vGgSqsArif1jfO8M8WUAESwgMjvw+6+H2PPkg/fyros=
X-Gm-Gg: AZFdTZeeEOZN6k7CN9MW9PQ4mEmN345lhYgFuQJBvduE4d4iLbqKckMp9AYm/CRGn4n
	tV8V3EA/3jQ3fntReLLID4uyvYxNxNajxRHgsMamLwPXryO2yzCz3kQfxc+9p0FRmdXVTzD7e93
	4y8Gq6CiyzK5ozN7WMoI3YCYjEd9/naJEw8JhwawX5LALeokPq75AC+Jq42P5XAyJACH17q9SIh
	o/NV3cX/1/5R7LG6LDmZz8D/9BfqMeda5yfMtDcWdzvSH4KT38j+gOXIPNIayUDkykRFLnH1e2e
	i1tXWkTMicVZMSMsp2wWaQioQjKWR50Li99USxCraJB6a+4USkcMXBlXEIZPbsZryVp3EJSaPuz
	8H5gjyNBQ/UHCSrtnic0RrWOCpdOXBLlWOF1A2bS8XWmquMiXkrcmhd3fTd4GHoujiq03gEHPCO
	kr7uP/BwFIXn7k8WHMTeKdau5Xnsw73RQC0FB++XMZRRV5N+P+J/lwyFdbCpWE8FA=
X-Received: by 2002:a05:620a:468b:b0:945:f60b:b3a2 with SMTP id af79cd13be357-949ba848044mr4171013685a.12.1795779707588;
        Fri, 27 Nov 2026 03:41:47 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:945:f60b:b3a2 with SMTP id af79cd13be357-949ba848044mr4171009285a.12.1795779707091;
        Fri, 27 Nov 2026 03:41:47 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:33 +0100
Subject: [PATCH 4/6] clk: qcom: add the TCSR Clock Controller for Seca
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
Message-Id: <20261127-seca-clocks-v1-4-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7348;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZTwgr4QhwhnAFiINivlGeIk81prO67mgvQO0Lm12M0w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxw9QC7fxf4h9D7J1W4Owjzt4DKryewIAXbr
 vWuGaAXKDSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w7DbD/4sxGKjXI3sAo2JdEbBBAgYgLU1GgZwsmSi8XMCq3ub97kRzsR1ssHuJJxpiMSHuUzMVrH
 qxKC5gxHzkV3GrwOVA7L2UvekJXYiAyqg619ICrksJiShbVA1yeLEuCyoxfKifipsaxfA0nb7aV
 wpw2QuE6yW0LVvB9MaGNZjiJNv4jzgfqedMCWKcDhSyAbzD9rCkIgFwOuQ7sEXH1u2M7MmCiIQ9
 JtolQ4XfJ3NmvEMGzwdVxZyweooWjZsjmEHrA7kGoUgvMBUJv1vTy3+MhnE26yTabQRtrmXgfmh
 JI9D9B/J9PugkzH56nNTgoiMm/eZru8dvAtC/hRAWjDfpEHzH2RI6vxKqUvSMA6IRF9lNqs4xOm
 L0YXP5+ggTxDVrl9DdK0dv/sgvOLzPNMs8iLcA9hCcoWdkSPQLBfJNFhL3DY/XOoPwFxfOI5U8x
 5LKRtiPpgXl+GkjBRvqnDT8uJiZOtROEAnAOvcTE5KWHZjRijy+c4wLrwnbjxLd10Y4Le+vyPga
 VSbvlNyxMHg6ct3xGYoplypEu/EoIMVdh5To5GN3k76lET6NSU5OdZJOqqEDUTGUELCpGwaUbFU
 Mjd3iPntaJiuI8whyYTjmvrQ8C4qqvmwmb+zQZZLP99KkT9Doaf9n4RF7Ft++oaTKwBP8HXypbO
 3RPNsoqoCDflSlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX+VTAncTONdk/
 CDMFlFHTZFUwUwrWzBKhvjQeGH+kMKclEeDnWU9OX02Q/f/6GEGYIS/BPvIGX+T6yul3ogOr5NU
 om2hnG7X7SgbosY7bNwCwKdJa9gLYRA=
X-Proofpoint-GUID: wgY5IcvzF9SemdeEwKSRRI6I8jLAGFqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX3lzfafdM5S2n
 Wr/lBqhBMpq7y/j0dum/pf9HOGckG+Ruguup2vCTMWWqscPuMbswpexmvfruhHy6Zh9X3K+3mP/
 A5B1bm5NcNV3ZrWPWco+H0zY3ZMsus6zupIkRXeTY8hYiz2iGGnbRsyCTSgqMXKlydexqk5uW4Z
 Qf6kWDkGtUZbjmRnYGi4gjBTaTcPvxMAaygZPADuGrKd6o/VNK6e9RBCSASR6NXiU04Bo5DghVm
 Z/rxupmV+rZtAn8qzz5kIwIKKS3ffhaB8p9SbjiEoBynIeLNy1i2dRGGMAqIsIZzezgl9SjLYuj
 O8Nc58mMmZeZH1OJTJaJ/TXih6UnE3ids3G5RI4iqcJuTH+1kyUnuiBvVP88ESEXoH4We8BT9E2
 dPuZLadXsX2ZgCL5VdU9Hkx0b/RjB6WwIH4Ub8ruVVxoTipTReVCwMD8lrpqAKW0YD2kg8UvhFI
 gtoppiUFwlQcBt8SkjA==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096c7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VnYT6g0mnRZfrR4KwsEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wgY5IcvzF9SemdeEwKSRRI6I8jLAGFqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

Add the driver for the Top Control and Status Register Clock Controller
on the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |  10 +++
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-seca.c | 147 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0680926b0ae0903d46fed642dd60e6187642e56b..13a6deb0db4f0524e0c2077a66a024ec35167ec2 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -339,6 +339,16 @@ config CLK_SECA_GCC
 	  USB, SD/UFS, PCIe etc. The clock controller is a combination of
 	  NE_GCC and NW_GCC.
 
+config CLK_SECA_TCSRCC
+	tristate "Seca TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the TCSR clock controller on Seca devices. It gates
+	  the QREF reference clocks of the PCIe, UX SGMII, UFS, DP, USB3 and
+	  eUSB2 PHYs and votes the QREF supplies of each path.
+	  Say Y or M if you want to use any of these PHYs.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 270c1b97b41f3db7f1d2fa98a262a8c8e189becc..34746aa9e0193993748378163f6fc2dc00ac18f5 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_NORD_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_SECA_GCC) += negcc-seca.o nwgcc-seca.o
+obj-$(CONFIG_CLK_SECA_TCSRCC) += tcsrcc-seca.o
 obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-seca.c b/drivers/clk/qcom/tcsrcc-seca.c
new file mode 100644
index 0000000000000000000000000000000000000000..f24d9d2aad69df7fc89e43fb35426ebd3493bc1b
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-seca.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk/qcom.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,seca-tcsrcc.h>
+
+static const char * const seca_tcsr_qref0_regulators[] = {
+	"vdda-qref0-0p9",
+	"vdda-qref-1p2",
+};
+
+static const char * const seca_tcsr_qref1_regulators[] = {
+	"vdda-qref1-0p9",
+	"vdda-qref-1p2",
+};
+
+static const char * const seca_tcsr_qref2_regulators[] = {
+	"vdda-qref2-0p9",
+	"vdda-qref-1p2",
+};
+
+static const struct regmap_config tcsr_cc_seca_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf008,
+	.fast_io = true,
+};
+
+static const struct qcom_clk_ref_desc * const tcsr_cc_seca_clk_descs[] = {
+	[TCSR_DP_RX_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_dp_rx_0_clkref_en",
+		.offset = 0x5008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_DP_TX_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_dp_tx_0_clkref_en",
+		.offset = 0x6008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_DP_TX_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_dp_tx_1_clkref_en",
+		.offset = 0x7008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_DP_TX_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_dp_tx_2_clkref_en",
+		.offset = 0x8008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_PCIE_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_clkref_en",
+		.offset = 0x8,
+		.regulator_names = seca_tcsr_qref0_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref0_regulators),
+	},
+	[TCSR_UFS_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ufs_0_clkref_en",
+		.offset = 0x3008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_UFS_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ufs_1_clkref_en",
+		.offset = 0x4008,
+		.regulator_names = seca_tcsr_qref2_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref2_regulators),
+	},
+	[TCSR_USB2_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_0_clkref_en",
+		.offset = 0xb008,
+		.regulator_names = seca_tcsr_qref1_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0xc008,
+		.regulator_names = seca_tcsr_qref1_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref1_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0xd008,
+		.regulator_names = seca_tcsr_qref1_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref1_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x9008,
+		.regulator_names = seca_tcsr_qref1_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref1_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0xa008,
+		.regulator_names = seca_tcsr_qref1_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref1_regulators),
+	},
+	[TCSR_UX_SGMII_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ux_sgmii_0_clkref_en",
+		.offset = 0x1008,
+		.regulator_names = seca_tcsr_qref0_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref0_regulators),
+	},
+	[TCSR_UX_SGMII_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ux_sgmii_1_clkref_en",
+		.offset = 0x2008,
+		.regulator_names = seca_tcsr_qref0_regulators,
+		.num_regulators = ARRAY_SIZE(seca_tcsr_qref0_regulators),
+	},
+};
+
+static const struct of_device_id tcsr_cc_seca_match_table[] = {
+	{ .compatible = "qcom,seca-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_seca_match_table);
+
+static int tcsr_cc_seca_probe(struct platform_device *pdev)
+{
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_seca_regmap_config,
+				  tcsr_cc_seca_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_seca_clk_descs));
+}
+
+static struct platform_driver tcsr_cc_seca_driver = {
+	.probe = tcsr_cc_seca_probe,
+	.driver = {
+		.name = "tcsrcc-seca",
+		.of_match_table = tcsr_cc_seca_match_table,
+	},
+};
+
+subsys_platform_driver(tcsr_cc_seca_driver);
+
+MODULE_DESCRIPTION("QTI TCSRCC Seca Driver");
+MODULE_LICENSE("GPL");

-- 
2.47.3

