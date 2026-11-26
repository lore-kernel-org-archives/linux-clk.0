Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719643;
	b=Onvk4wBc0YTCYJ/kIIuV6gWZGH9B6ybxGEEtXwtLeJ885pS3zFiwbkPuBNVdo6+1Mb9u
	 zMx4+/Af4isHJPZvDteODfrAjYTZcfqpmxXwJZthQ8UoXVBt09FrfZzDfDjfhRf4iH6U+
	 pA8MDl9K+vyRNU+EUbYLi04i+xqyalqeWcBTMTFqHljjz22SMUyAmQ7jidZYchoDBYSrx
	 IuhSmic/XkUTJdWwEzwPRwnW3U8/fiywGVMGu9vl3pTme0u7HEHwXsouEvVf/wg+2Knnj
	 lemCT+wKkNLMhjsk4qWaLS4wSgyOKIGKjP6lM92zecjesSFbvch4qrZ8ezZASKZInXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
	b=g93OSV0aF79DYr6KZbaQx2w2XH5Nd7xsJCzwDvFysC3Wt7IZ2Tcm7lZuXyoMKQnU6tVI
	 /FLWmQpNjUPs+RifWBb9Gxlo7b/5CshM6G7fMr7bfE6AsS33+Hk/3K25bKI1RtcAZfw37
	 UzW5OKh8hijebFhv2Xkc1ZfUVPfkiG26Nqjk7+YqNED876wNsBY3A9o7F7tBxRQlOpJub
	 rYCfMgRYO3yXp2/5VMAv7DtO6zlY8oCc0+AruS3vSolHBn35vUUUkupYKp/5PEsMGJxE0
	 LnpK3+cGkb2T5BSs/bjkZzgr6IpD1maYm/gm2lic0OvuqrIAEn01k4LqKXGFufMKk7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F4606A33C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095F4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuDif2068417
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=; b=KckpE27Pnc7JARjp
	MzLs6mLmrBzDyxPH+8dr0RK9QQrlA5YHJ4hihocS4UJbIu36aKKeYt8A6OTwSQdC
	3KyxHR7ds9lYXsZFHBi/OYlf2lrFtkRT9VXywuQHjxV0bFd6J1xvpF7hJhB3Pz4Z
	ucygLQrTkRlN03NBrKunYg+1PRvwVOAtxEtyY3bLhtThVcWOZoGWqVC3Je+0y3YJ
	RdtrwOkiqgwG2Zv96p8a3E6uyuLW/qqiDAudAcTXX2qT92Wwq6FnBuZ9+CdDjSPu
	CPtxnrembLe2oCmgkn2iz0YACPJqp7PhDlQYN3Y+2wL3seP70law+vgCg2UW7Ja4
	HkFS2w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y49pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b56c696405so10474648c88.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 11:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719639; x=1796324439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=K+obZYRxwYumv6ZiG+MSWMmB08Z0yH+xcgtgjqpZ+XKG8/IZTGJ1qJZN/VXfVXAzwb
         NKJpQ9Q/L+40R4zWuoAcH7/pBLH4//qyXGJqLLWdtEY0zMu1BGATX1TJedKq3k7CR7yY
         6h0zcn6vKtadxxTh1tybGvYHVmesaat1kwXSMv79SeWY/gY0ipnh20LhKJDeT2K+rSjx
         zqrpbyWwoC2vUD5EGv4kaLiFNeGE4Zb7xUQfJhW5RHf5ZU8F1pR3F9K+p+1sawhWS1ea
         w2gWwWGPg4kDZUcAIbHLghoS2fGtcHZwnUAu36yzbbwMWjXjLSHnQPutBfmniQha1fRT
         skag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719639; x=1796324439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=FWwNtCTK6grH8QdIvTG3k60vpblMeUFc183C4LEfaR2DlA2EevGOL5m70ncJdTgz4j
         o6ey9lsqGYHjAtErVQ29+iK1xWVIW8VZOsV+swZZp2OaCiTi0Kei6zFXWoFke8oNKHLY
         I+vTkYimmFGhNXUgNfVm+6Tg/QPRaD6TmtwCfhr6ufXcqQtoMVoq6fEcIxkkfaWSr1AE
         7WOBY/MKqc3FwJ1p4ecq1PDYnSjZrKS/8031rQXSSloKpF7HhuborpmCcnJFUyy4YSP6
         lwclog5XumeKquE1ULfHk7op7oS3HnpUK4qwHwew5TUCITT7oC1Qh+QubcUGPyttdrHO
         nHnQ==
X-Forwarded-Encrypted: i=1; AL+hErGuUUZTKR86FX/oHE8TR7sEptAtX3a1us+uD3hskr+3CeiVBRAK8cZkfDARKyM8wpN5bwinLwVeMbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ltiso5VQcrc6RPLg/DIOlGjaH4GL68tFKYi583t1i9nhp7M8O
	QZJsna/V+1RoihFBCprJCmk2fDGND/1rfUWVCaAdfFDDpZ5zBRpcZ2NH7ZIiChifdxLeer0cSvn
	czrx4fyFJzzVUMCg9xJw1A3gZszntt6Nuii6qHY9+16abF6eMvA+77g615e6+g3U=
X-Gm-Gg: AZFdTZdlogpQKX/c9ei7h/eWTiLOpa+k0y8iQ+Qxb7ATeGmS+MMM4YLV73/RZ7RyNnz
	LYooybUDypwfmMCfSLt0KC+iHx63Hge1tdQWOUCmO0dXkNS9xedh9rwKiZfdxULkwGpm5uH/488
	v9bSlGruollO5EG/dQLsqtUlYNw+/KViwKUaCWg/cpj03Xwe9a8XQodepyYc/Mdz3f89UafqH0K
	zvNdVdw5kW7Mwl5mmiJjBjJDI3cNUwdSfMAhDL8av2XJeQ++R5ssfiKRwBAzGdrPxCAmD7/3WZr
	Gf5CUeTukkptaN8PkOXwOI5aZB0JyEF7dRYdK4qhXSeHPmHL28PEH0kXo2ugnKn9ScZvFP2a+RV
	1tDzWfyO5TI+Ip+iouE7CnlrKZ4YJLTUQvdHKDdUIxfFw8KD82AOJiFfyABdxZcU4df6czKvERy
	fSHiiS
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317838c88.38.1795719638651;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317792c88.38.1795719638043;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:16 +0530
Subject: [PATCH 8/8] PCI: qcom: Keep GDSC enabled during non-D3cold suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-8-485a08ffdc6f@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX3x9FzLdDEuRi
 0SK8dS56gtMCqhbpkrWGU3xO+6TwUugkEDkYZxIse46Er0opeSFPvsDv8GMSZzN9PuuoKCkuz/8
 fHH7V2YC9ULJcZros/1cByww60nD9lWYNf4KlRvV3S+aWtSMOfFlCFkpnwvNTQ7HMYQlF4Dk0zm
 0RrANzwHaKbQtWtUr+iKAfuNQvUu9IHBRqJWC8/AfXVj9CludpO+COds4lYRf0D73lICVuqA5Wh
 QQo56yDWqbJxe216eshymrF4MiC4WoUfe4Lub9k7OgADaQlu9f7jyP8v2mBz6oV0bH94GrBxDBv
 vXbsrFM7eE4tPkbL4B/fGc4Sloo3QepUqO1xCLyW6UbyYJHNS6j2WQl8+I0IGvcD+1yXaObkvCC
 LbGPrzIuq2hsfYAnJi4oNElm9yT39NR0Yi7FPL3yjGzYVQRafCtBN54ay09sEXR1ZhopvBcKu/i
 ZCSZUXdbDZ2Doc1di9Q==
X-Proofpoint-GUID: 4CChKoNz-KIYyZi9myy6EP8myXknIrFG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX9WHarzo0yjdT
 UK5Tqv352i/z+KgEhLNNzK6hAQasR52xgZfVdquS5drwq9JE4i+BqLzd7u6z2D6zBsdqPPUnDdn
 RLCHqyQFVWvhBzfZOR2Ptz8GGJ1S7Js=
X-Proofpoint-ORIG-GUID: 4CChKoNz-KIYyZi9myy6EP8myXknIrFG
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0881d7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qWrkvF7FP1bAQ4F7tlgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The PCIe controller powers down the link during D3cold suspend but the
GDSC is required to be kept ON for non-D3 cold usecases.

Set the GDSC hwmode to true for non-D3cold suspend paths to keep the
GDSC ON during suspend since the link remains operational and the
controller resources are still required and set it to false for the D3cold
link shutdown sequence to disable the GDSC.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0a22b22a40aaf2ec75cafc12b054b..a4cbd7dc896e5472dd2cfda3846c6ff38cf34ef3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/pci-pwrctrl.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -2495,7 +2496,12 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+
+		dev_pm_genpd_set_hwmode(dev, false);
 	} else {
+		/* Keep the GDSC ON in non-D3 cold usecase. */
+		dev_pm_genpd_set_hwmode(dev, true);
+
 		/*
 		 * Set minimum bandwidth required to keep data path
 		 * functional during suspend.

-- 
2.56.0

