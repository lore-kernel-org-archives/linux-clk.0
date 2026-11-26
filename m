Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719612;
	b=s8/3i2ns9Orfs3RyfgtmG0L3qli1dK/uOoF6PD1k8Lj+ipwQfBUhlKoDhczrTDbVUgS9
	 pPIFg01/OXTr3D6Zg9x736jStYju5by8rWX7tmqHvnyDdlrqsfEQBYrGeyNnO2+/uxsTw
	 HqXUSQC8EJjnP/rnnJMFWx2J96hL72tv17tMrF7mCcXsS+POFyxdNCUlk7cq5S2dAlOjR
	 OJKCavvblqKzp/U7ea+VK5+s2/8DBBRhmd/Jj09XoizDyNxY3nB4aXTxsv4mangz9kuIR
	 oBIUR5pMwTBNXKEjTgHofaDCo8cJSEzExbndKS4HjEhSlI/nu6HIhwcz/T+28lZ5fqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
	b=m9QoVqvbYRT6MCLvhuFFk7RoLDpbjmqeOve2Ns+2qEdD1yT0kpFU0raaHP1bvTcS7t7V
	 KBiDO5bmUS12WQdmRHbdaH417QqvHbRZNBASkzDZuNWzv0UcN0RGhLJ0bK5Ko1TIbA9mM
	 5HrzNVP1W+X4FRx2OdgJgYFn0m6WnnCrVAspgDtMn1TLSqK1reT7fxwuA/l6vV9sPi/dN
	 mbu5MoiFc/0mvtj6o5Q9tRpuFBiSN0XW64Q2WCsSBpS1q3adeegCMwb88i+9MPW1oaQ2b
	 7N6kcsgx/g+lM0Jd4thomJzw7iZ/U4UQuVWubnLvxVR+WWbrjCtakJzZV8M/H1x3lCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5xT4EpZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TavMYgxr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2D606A6A3
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC2D606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5xT4EpZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TavMYgxr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuAgv275283
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=; b=T5xT4EpZWtvAT+SZ
	blTm/3lR53uV5o3B97RR96hZ71sYYPLk25oxDULtBk38KbnqSzZ1bKHTqA3bkSXV
	Rj2bMCPVuSoMu9/KIqp34RQz6BIoN4jc8NDiSABcMfB3FyFaPI+Ts+Qv5R1y4tdc
	BI4NE2Q+IBsA1mchp9rcavH7fa5G1semK7BH2JjOiwlPmj4Zra45XYAHVTrZvccQ
	n+0fbe6+82PIsFJUfiGh3YY1+kOAhsk+jQmuUk/jHJtpU6wTLQ2FLtjTS+Ey+M7r
	mm5TzxqVysAntcmm54DI3RGrLFkf9QTpLST7xeVbB4o+j9CAF2XXBwO4ZEcuSbGH
	V90XoA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8227c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b592e9841bso1629414c88.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719609; x=1796324409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
        b=TavMYgxr0MylSuoQpSpfhZbVzcpnQraaz5xt5LSFtALfyBBPTgKIo2D5cmSHyKHFri
         Rkw+u3vaC0so21PBGM1D2qrXDYOzZDnxQMpYPgnuiA1vo4lAk6P3ISykmB2NsigrNS4/
         8rhMN4GUl1G/fjWQt3HIYYIYFLfTIPZuXIxHbmJ9veVOdhOK9d6OCoZAm1vd3AtOOmLZ
         9UoroSvOF7O1VlSp0CN8uYypB3FSi9BdT7K0LZywF9/zk2GCJc+n2NnrhFBNe6uZPJFi
         8JWnQrbL3kc6kIomJ6Khl0D8si3QtkTS4nUqAAPjFxfBZZfqGMOT7snWvKKYnH/zUyFI
         d2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719609; x=1796324409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDb1bViDSMIyx76M0CQL8Q8fh+r/vAHy8VyY0ktLyHE=;
        b=MAU5uWKjjQlmNbp86vi/PnKwl+l4bxAFHmJwatgcUOE7IAxfb7C6SLFKhTWWYqNhz0
         3Z0LQ4jQLDMtMw6+cfuqkEMMMg5JP0HvlaDfvr6Bd2mMpCvhmGDfbP0IrxJHGjIDVvfZ
         NKugfvAxCxCaQ826+rCPhxR3P+fbtOVVl8SvNnWnFN5YG/njZ3mGtz3mhplzhErTuhiQ
         Ol2J/f6410UoXuqPZfSyoYNG45QP5D7ZwSF/7fDTVcdYTkJdVIltj7rKnvzq/tif3pIo
         LTMkYkf8a5/qofPZ75e9K3BUIYYEnhz64DP+bQE4b7kA3lpc/5aVdNhGZp38EqR1B8Rw
         EpIQ==
X-Forwarded-Encrypted: i=1; AL+hErF7fupZ9ojoaE4Czx36B1/Tc8p9IwGXMRn8Yb6Imb5e27bb47r71Ztr8R86c1+qhlVQ0pyCofCSw6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LtWSa370qOwxzvGQM7SEA4aV0KxyPWDzkNIEccz6i5altaxPH
	3JsnOvR17MqJRppUheFgXQsbrpCdTu4MrGDVY9WgoDO2AGxR1Ij/eJDdPF8HRoOmiANhG+tYhju
	3q5eDtkMlAWTRbdyr1zh5pBIxiak6zH30+o+2UUH7iBga8pcC1lT5/l1KJL4EVxg=
X-Gm-Gg: AZFdTZcd+AWsGE1Tud/jUTdU43REjbjtsMX2BGYZ11zo+wLuSXpSKfcuKPTjB/H6zT9
	DCthJZdSZKs8bonvFMAg6jNEOu8HdUw3ev+eeGnpqwuR269rn1E7FS/aazAY1tJtRhN/HjXuZJl
	uEvkuGiNjnLtCLXpMPoEKl2k1f4DvZnWbNSvCgEqmZYxixYCkoGbwddf4yc+h9qP0YoHybmW8gF
	839CKSaCtaF80pFtOfdQcfj/l0a6pU7ZD6sHrb7WJk7C56EMb6DMYxCPjyXQitvfBZEDipyRqS9
	hjxLKiCSf+YEObp4uEAIVNxTr9vvU4igE0umTTntGiSkqRX1fwOLt89hIW6lXP2FoN78cnbLJrR
	l++Es4DkaLvW7Ja3lq1UiSUPW7Gm/N1rxScTKihJeGLBUjOK+cmlJAI1++i8xG/EjmTYcLDRkjI
	xJ1nWw
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr34051529c88.17.1795719608707;
        Thu, 26 Nov 2026 11:00:08 -0800 (PST)
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr34051461c88.17.1795719608015;
        Thu, 26 Nov 2026 11:00:08 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:07 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:12 +0530
Subject: [PATCH 4/8] clk: qcom: gcc-shikra: Register set_hwmode_dev
 callback for USB, PCIe GDSCs
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-4-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: T18UYEB2XIUwRtd-Fy0fSVVSFx3pL7is
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX4I9Yn6v8//xs
 RpJ+sdnUusHj3BOuYPFjb9NmaUrpbQtBLQMVYoeHKZ6YMWQUTZkZWx4lmAjSZrkXwWWg+OY8nWO
 1Lnm6NQ/H4Iu+ORzBX3CHYCCv7xOa7s=
X-Proofpoint-GUID: T18UYEB2XIUwRtd-Fy0fSVVSFx3pL7is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX9i6eZhylM+cD
 LeBYmNHhdnmsBmERh0Lvg/pHB/qPplE60jcgs39GysJKT+avhuDyAFlJXxpjTEL/Wisx0WkHUhP
 xAIDVTVnvKnDtOV8aq4GSmbjuS5TFCnYe0B2TthG+Ax6BXF4cTxk1umcsiVhn7cCfhb/Ol0ix6z
 m7h9sIpaiirsUoci+swm6T5Gi/VWvDk+1ZitrOm7Yx+ekDFzGy7PVgifHAZSv96ESbKV0lOQ02j
 1Fm7/E+GVuNVLuaCHku4Cirk2pHWWWsZG+iLhy8rEh9H0DMK4ErgPKXoumoRlhQ9TA4EzjZxpqJ
 /CIK91FNXrHe/+nJ9flXDLa7FMirtjStAH/dyBjVJrUhcBpLjd7K8TxYUt8+75/CdCQzots486L
 JU068UjI8WQnOcbWGyp6z2FPQDhD9UCb/hNnmAVG2RMXar997lS/d9xFPDh7YzRt1NeuaDftxuR
 Zo9ihy55dAXclnairJQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0881b9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zroWNzDgHOBiqxzc7EQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..075a9a5e503d0a1aa9ea2c772216a19f0feb16b5 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4036,6 +4036,7 @@ static struct gdsc gcc_pcie_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_pcie_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -4048,6 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb20_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -4060,6 +4062,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.56.0

