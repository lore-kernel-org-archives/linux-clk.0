Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719582;
	b=N8IPNYAYdTy1Pln0uTmefqhxV6YM0AobBTIDYX/L3rbPaxlG1B6sCa/TGSDuS4hngC2o
	 1CYVcfZXd/UmZWei9GPiMLXkDLHextcoSgHNHgf7/ayh5d5VUiIjNvLmuREG6z9bU6X7m
	 O2XSXM69zwk2bMqDxbxmDEsmWKcZmVosnNP7jU4FlmJrCalDgUk9fViHM00FGKHzacBxC
	 H+z6OguJIcQTbvB3986ZOw10DdLXAQxfbYI9s9ZH6mFaZYOQh+OAmrZ7R7SxqiQUUKmeX
	 rRltZkdRQUeh81pu0+D4fFydsijDcF93cgdrdZ8mNLf+0rlAtun9JWbBkFdm3RyZIvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
	b=JfH07wRjcinJ/0QXngtZ9TQab5aXRH2cMnePAv2H52xFWKrzd2J0d5Xj8/Yzc8IVhl/K
	 ySeMoQEGnSc1eILi2RpIPCdnCS6zV0Kh+2S3BSCWoOJvqkvfIZFvcD8d2e4Tz7H52mp8h
	 50crEbk+dJeTrUvCLo6uKJdF4RrVNrmwff7S2f+WwqJMlSOYcE6ZZpY7Tni4eTPnXMSK/
	 z4SkyFYz99RG0Ay+Bgx0NcEeFikzusoNMNYPjKjqVQIpMkt1Nt3ElBc/cJoZenMk7Yz4X
	 Ee544DbfBI091Sivb5r/4GHFCcyZnzEvXPR5NR8bIHmIUxR42f96QvV8C9CdVKVGvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307D606A31C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A307D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGcE3J596877
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKnwJGn1kbNBw+OYy82caU
	/JC92cEMMnvBlOquiaj/U=; b=Cu9Wzjj7rorA/u6iXgCIiQ/SUnhbjxcPw6D0t/
	yzeHlTiXtf0S0fhhEG3F6gbCIHuUQlx+i+YHFzCB6PhjrA0adrp8H70mai82PMTq
	3FwFFSniXsdqIDXBFxDPvwHI9e3WK+vS4gL3WWXqmQgf2Fo7O6jXtDDGf8VNDDXM
	dtvdXPnjPDIkHuRb8VD6Q0ie+KWvtyx2r/DSja2F/Q3tyZHKGZ4R1W5at+Ei7KO7
	a9jq2aQN/f8y9gjCmwG4FEV4LcPcrnzKK+G9Z/rHW4hxuS2MIXIS9HZqi11WbM9g
	ZsmoTG8dX+QucmIdvvpczclncmDj77KseVifa0mP9rDtU6Bg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90dc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b56c696405so10472197c88.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719580; x=1796324380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=B2uKOJtf1AV0wfvdDz+dei5DW1Kf5asGqvbZKU8kjHeVSiCa7YUZhJBDGZV0YTti9o
         SvF9LDld6HaRVDLQCDT3QlrV8auMvxLtdIxK3jvBs6cRY6JIiaw4t3DNMdTYmsTLLUBM
         hFj/JOHzWxmW0d5D4CF1gesUghyIysv/YVTQbu9pcjq7JO9ECVTCW3hjS9BqgPLCVUpq
         k+l2soD/ZKhn9OyHGmcdueSHXseFDY+bRMVr51cW+ljxWWngJjUe462J/ZCWy+9J6U4V
         vAzC+kAPl0Hc5m44O0n+sKab6Rwy6vmF6Ux0HaiM0ALh3+/XXcBFQfuV2o0RyYCZtyx2
         2BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719580; x=1796324380;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=EfTIbvMzcrUIIvoJ8Z7/WFJrJGWh0KGj0XmMkEUcxd7K9Qdpp3oZuBbP3Agqw5IHjm
         YFsZwHhMf1uS55Uy6VN395u3mLaxDI1m4z8CpsxzePfc5o5ss2pMxGCA/RnYB+bvedlO
         QuVwEg1Ox3OquJGVvS5J/iOGy9vC+HyU/28f6i6YRC8SNgj/ZWdKsarT/n+UIsEcTVfq
         ND73VmS5JoyvUncTWQ72wx/ss7tUMbsUXwRvInWrtGOnQ0MCSx9x26zCmctqKtPQ6tHd
         7vBUIFN/we/o2OU1UYMWBf8YvrDIdyackJxaHj/DbVPzacK95a0h8rLW7R15R3LXQOAk
         7kgQ==
X-Forwarded-Encrypted: i=1; AL+hErGG1yAVgZ52S5pxABb3JMMr+vXmotUvA+Xj2S1k+/xkl5vjxU0suT0/5gd/PDfky9c6EjYswUupEw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8bDtYbzzgoh3/jhfTLGf58O6kVB1Z+8ixr4a4MIV+M7cBk944
	g7qLR9yqTBvB6L+Ab0e58fllw7yXbxayS4bCiQEepLnN9lQ9d709CsEJEpyviwSdkVGDDh1nLXG
	GNfNprwOeAe0djlm0keoTUf2zs88kt24KQ3lcQ4FP9DV8UVNo0vxBsO9GTjSWjwA=
X-Gm-Gg: AZFdTZdiC2CY2HCJXBh2prfuGtPTq+8JPNkIWkYRu06iiZHKAF5Yylx9B4qYMDJUhwY
	u8Q+6KSZLVM7vUtKtG6UF1w0ogbyBIgFEJvASQu1VIFGOGHCzbEAi0Ez8pHcYsVoqoGIm1G/e+t
	CipTJ4ROBkVX/ExT2C4lxiEWZanetSCsQ0nvh86C3LIkOhi2mfBOaRNp4ZbdtSlEBZKPj2BE0p/
	n8t+0padegV/wQT4z+6KJxJj5AiWQRRtGW2ZpiQ3TAs78lBu2bxSFkjuU9TZQG3O9jZuWqUhAZF
	A+eDoQJIttncn4wkqe7XUAaMNtgrnKP5RA85kf7epc8A6Fk+GLZ+62LNwv+lpqRzDMaLpHaNtJ5
	nLu/ECxKDaYY0oC1XADNwl4JKVHXoR5RYDYgjE6YMGb+z7ymEUDGQtYjOKSzPr9Nzp2m8Y/K+Bp
	ViumuS
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262174c88.12.1795719580018;
        Thu, 26 Nov 2026 10:59:40 -0800 (PST)
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262137c88.12.1795719579488;
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/8] clk: qcom: gdsc: Allow USB and PCIe GDSCs to stay
 enabled across suspend
Date: Fri, 27 Nov 2026 00:27:08 +0530
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAASBCGsC/y2OSQ6DMAxFrxJlXUeEIaiseo+KRQguRC1TnFRIi
 Ls3QDe23pf8/DdO6CwSr9jGHX4t2WmMIG+Mm16PHYJtI/M0SZWUqYJADczGInQtGaBAM44tlPp
 +N6pRaZ4oHm9nhy+7nt5nfbHDJUS9v0I+IJE+9RW75DKTSRaXkIXKSwUSZqcplvC9eD8mIrEE/
 THTMIg4ji+NJoQjsL5iI64e/jULXu/7D8gvyVncAAAA
X-Change-ID: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ZRgubNFiQ0Uys4ShHXwoic3uEUWNANmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX8hoX5u7xM0ws
 eZIpzYk1UyDLVuU95zLgroipxrhZKd0bj686mtHdi7MxbvVtPk7uOZj9rXdd7BJQ7tw6fNjQdaL
 hD8SxkIsdtFzITxuDCuKBLDWNGi8PHZY9+Nx7rqp1X5skGxI770jAWF/W+PdpG6RvaDG8ip/4yx
 46cetwqtFYpMgpzuBXAbUBUq/tHxjyoLFreaz9gBhtsaDmm8yF5Txmw+O8IueYX/KA5ny3tNbZg
 78C+hAnk744VQ0napDF9KvwpFFEXVkoYm4e1kKigJKu/2yHfDZS3mAULnxwGAZ6BGq78EijZ2nf
 gzuBQIuHI5aD9MDGG52Zq4nvfFrP6B4jfNX/VhSiTAEqH8uMsK790tzulamz5dPirz6Ae8byALA
 kd4vMFXmFwVSbys1tLEEvLSzP4xaykN2MNvD+LySaHyd6HLKylEb/Ishls/HTr8NIeFUOIbI5Il
 fVPS9e6L8s7UcOVhnqA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08819c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IPO9h8n_qQbs29NzXk0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXyVl9N06eZ32J
 ZCDMsadBBcqCrMFbXQ+N8URAGz4vBCAYf+XccXFygdTl5dDnSXUNwTRg3HrgwUaTawTJQyhgrFG
 1lHtk6rZ8IDGOPkldutRCW6J9aZjAOc=
X-Proofpoint-GUID: ZRgubNFiQ0Uys4ShHXwoic3uEUWNANmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

USB and PCIe GDSCs on some Qualcomm platforms need to remain enabled
across system suspend for certain use cases, such as USB host mode and
PCIe non-D3cold. These GDSCs currently use PWRSTS_RET_ON, which keeps
them enabled after their first enable even when consumers no longer
require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers request this behavior only when
required, and clear it once no longer needed, allowing the GDSC to be
powered off when unused.

This series adds the set_hwmode_dev callback for USB and PCIe GDSCs on
Qualcomm Glymur, QCS615 and Shikra platforms, and updates the corresponding
USB and PCIe consumer drivers to use dev_pm_genpd_set_hwmode() to control
the GDSC dynamically.

The clock and USB driver patches need to be picked together on Glymur
to avoid functional issues, since the existing RET_ON flag is removed
in this series. This approach can be extended to more targets in the
future.

This series is based on top of below qmp phy suspend/resume series and
depends on it:
https://lore.kernel.org/all/20261113103111.156476-1-prashanth.k@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled across suspend
      clk: qcom: gcc-glymur: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-qcs615: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-shikra: Register set_hwmode_dev callback for USB, PCIe GDSCs

Krishna Chaitanya Chundru (1):
      PCI: qcom: Keep GDSC enabled during non-D3cold suspend

Krishna Kurapati (1):
      usb: dwc3: qcom: Add support to keep GDSC On during host mode bus suspend

Prashanth K (2):
      phy: qcom: combo: Keep the PHY GDSC ON during host bus suspend
      phy: qcom: usb: Keep the PHY GDSC ON during host bus suspend

 drivers/clk/qcom/gcc-glymur.c             | 46 ++++++++++++++++++++++++-------
 drivers/clk/qcom/gcc-qcs615.c             |  3 ++
 drivers/clk/qcom/gcc-shikra.c             |  3 ++
 drivers/clk/qcom/gdsc.c                   | 21 ++++++++++++++
 drivers/clk/qcom/gdsc.h                   |  2 ++
 drivers/pci/controller/dwc/pcie-qcom.c    |  6 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 15 ++++++++++
 drivers/usb/dwc3/dwc3-qcom.c              |  4 +++
 9 files changed, 104 insertions(+), 10 deletions(-)
---
base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
change-id: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
prerequisite-message-id: 20261113103111.156476-1-prashanth.k@oss.qualcomm.com
prerequisite-patch-id: d39d8cf075595b668e85fbc6c3cf7234c318602e
prerequisite-patch-id: 5f7421fa9312a84661ff4a87e946f315e8dc27e8

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

