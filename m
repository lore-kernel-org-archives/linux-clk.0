Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719589;
	b=2Ro/TafaZeVyvdumHF8/iAwGolmyIsesT0Ti+vgjJ6EaxyERAwS4j+eNaBQdu9sTkwSH
	 CPf6LVpfoA5SQBYjkItme0vE5D+PBaeo9xmhSHDKbZhdAMN2UkLlDOtWgdf2atzqN1ZkC
	 LcfTizfWlzUnw8u10F7iaoDGhlClKnaL5tjV8ZWFQOKNi6XyOusEgOmJk5I5X1g9nhWdx
	 zKchKOr2dJ81zdJgxqGZoHGqMGaFyNdnzEyJ7nUpBcHTmvy1MQVPVyNCsf+AHqmOmyHJm
	 yAoT0DrNN19zAKbMXNEPWKJV6EH7AWyVX342c+HPLaXPlrK63w71BXdzZrbeh9BNbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
	b=5eL9/HCK1d3yFSDmwIuUTMN3HPlibN+cw5XpIdlLm4H61yeqxdyK8l0KColP1LM/rhXm
	 N1Owd9LMi3PtcLl13hqbFxi7LNLMpk8fZHfRiVC6jigheZdJyz/SSScnpruakoREj+OK0
	 PsSnGBs3czTTSs+iUOEpzdvPsb7M84E1HQLqRPRzEwJND+2Qwv3CPr0XvBWsNTcOP6ZCb
	 nxuZfKHH/2S+JU5wifq87UEqStOyAKEsub0/nlcbTgV3XgxyYGxx++H6XZyaKj4pfDe8w
	 U8YO8OLu07mWE7by77ETTz4zyz0xDiv92WYXGokdFhLKRa3i80dxPQyWSa7IqxL/eLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A8C606A327
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu25T1847749
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=; b=MK+PgnPwU6+GUzoN
	AcnNkwEYSUDutNe+H0SmSllz4ZaJzG76xQSMz3DJsiuF5Jfn5ZV1xFW960GJHveo
	7YuUMcG77MbXc586q1hIhg0i0DMsie+u6dkAGWXMlhScwL9e8dsRGXyWlxUWuq9X
	pXn28xEzU1yOKA5VeCPVeAzls9p52Bf5ZO1vS2Venca/A8qLpmYdvsn5aG5W3VCZ
	FWve6x+qpHMQ0Zn1QNt0+p7GahqCyRTn5vawV9RQAuhkpQf4fbPko5k1PGiAm05U
	ao+IsY1fdtlnsB1urjM0aGrodwgNPrODwj91vto0rFXUSgNnCR+G7kP0VoPFy4wt
	jwNQ6A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tgk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7501511eec.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719587; x=1796324387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=A+F22DCcF3PbLhvOQl/jCrD5J0quqQofaH6H20jW6qGF9+L4tArM1IgQwwT15qGDry
         JqQZkzMH8B2RiTp1cDzNuXW0zPrRChTvZOEWsojFqjdiWvbpnI6WodI9hBA78+gN0aNj
         Tm47UhuXnAX6hi+G12gXKSm157SJ93rXYmS38zBbI641ixxWRkrv2caAmrUqrLYLlLVi
         6nBscLxQHADWoQi4lLtkC4etbvLVVWnteDUQXzZrv3juDrnkqi6dFatpca6XjGEWa7fb
         OJBpTsuMjTU8Yj79/+4bCSba1x7zpt/dke9DlGyfu9RJGCpZSwzYnnaB7xoPRovA88Ft
         tMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719587; x=1796324387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=N7vIdz5ELjJdk0TxAuCTXCMZvnAKHKVV/+Qo+5h5qpF+a+53VjvQ2JR7nmBRMGZDnJ
         qnGTQa0DmyU7S0EvcxNJkEkw77FcxF4SnRZs22bnZ9t8hRnJKIHANrpoUiMb46ME5NBy
         UkAoIS0xgD8dIr0bPs6lr7RlxYoQgTvXssrCBveeOZMWhxOAopzQE92+ZGlT0g69PdQx
         WV8eaIMueXIOgTxklEp+0JXtZxZ+lRuNFbD5h/C5x+tgQB/jHXI5QKHwbQa4jlRQqvON
         2YyJbCC/lovZK2LSWB0/WKLfh1BWD3yan4XiLKPDkw6FYGdq4/iiekN4nacN1eZ8Wr4J
         y5LQ==
X-Forwarded-Encrypted: i=1; AL+hErHH8Wsh+HeiAduvkhMfaFnnARdzEbYLRENfIsvuUyL121xHew+767VeRDpvt0ft0XWRFrZK8Lfh7oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uSN9jTI6JkU67nQbsAB+sEoTIORceSAx21L7i6EItKPI8wwQb
	e3YKsjo78SMa7Rhj8lWDMtFO7wvYXHriwEWej7RTmmIPLZWNpNYzVRpwtRgFJoOa04YP+77mrlb
	MobpRyXZHX6IxI4Di3X560X9j3/vx+ExI6DkIN5UyuEwL8QCYz6dD447W9UM7OmM=
X-Gm-Gg: AZFdTZcZyDszfAdWQhaLJfBpwnXLM1ar5mKL5tFpiUqHvlCfBnCLCrwWX8SXsZDfP6+
	uMhP6YxrVwJ8E26HlVH8xdq0FqzTv/4IM6yp7518M4H7Guv19aLyrXsNGaidG0l4XQ0G6YgG/Fc
	cONRVC3yEkf/EdC1kcXMTJheR9FTYRJfFSVkF2v5P3rULBkrwtzdZqfTj76Ui5inYRK7aOVact3
	qA4HbwhOQ+6BXpFHBra0GdQhnVY+WyUTp97QtEbFfYzjNpQLxKc2iVFVhiyrRX7hcgSIV638Enm
	1i2ZIufUIQyNbObgwE411Fd0whEC12vUnwm1R6Ggkw0cv7OEQx7Hg00ZbdxtJCJw/DnBaOqH6rM
	0MBCX8D7Gx5CT+v8300pv7vjbkOGHUeZWIdt+qPR6wpJAtdnpcJmNSlX1dIWEuPZv2qaML5tcHv
	0Ov2Ik
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29817023c88.38.1795719587139;
        Thu, 26 Nov 2026 10:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29816968c88.38.1795719586636;
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:09 +0530
Subject: [PATCH 1/8] clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled
 across suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-1-485a08ffdc6f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX396M9eLsJoCZ
 e4TN9d4AXXhqSz/SuzTP9QjwrCu9wXWpofoBNfRfmMpMqccTFgJnS3adZEuSMTomEiHs+BSRXeC
 VmmQfEbXN10G+osFv2dwt/hOrqSXjt8=
X-Proofpoint-GUID: z7qF-cev6DevKbTu8es5M-OnITNlEpq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX43s1vJJ2mqwf
 P8GO854iWkQAvKH/nB9R/lBnd8eWUyv0xWnexUOY8RmSRsbKM+smZORdSBee4ai3rSrpqpmDL/A
 dhDQCZdfIw+svO613mpTCknJDrPv/2rHZwhajviaPymMH4WrKMoJvXqjNFHxVbvqtbwww0/96Jb
 bLuCY0Zlqr9kpIJN3O5C6J3k1DuvGKO/Vi2CBz1O7zmrDHCLtXRPz88/HQBoPF2NbP7toWukzvq
 T1+zCgWAzaVoefCDtpQGamgPPM1hMlWBB4TsUCrgBn4B6h7q7J8370Bb/aQmdrpLr8M4COgocUE
 yOzwHCDm+wO/nsJ8cu/2uTei3StR0hat4BxW/kPAf8ULUeTLu9/h6/QuzrwF5F5fa8kicTC6qN4
 N0TGfMD+FMfil8XRi8m+6RwhXSG/SROLL3rjAbsq06R5YEUBjCIP+O1j50yngsOj4/PQP1ik3JX
 dSnALFDjnowo2BcpOKA==
X-Proofpoint-ORIG-GUID: z7qF-cev6DevKbTu8es5M-OnITNlEpq6
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0881a4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NuUCN_VPl_z90dSYpTgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260074

USB and PCIe GDSCs need to remain enabled across system suspend for
certain use cases, such as USB host mode and PCIe non-D3cold. These
GDSCs currently use PWRSTS_RET_ON, which keeps them enabled after
their first enable even when consumers no longer require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers dynamically request this behavior
only when required, and clear it once no longer needed, allowing the
GDSC to be powered off when unused.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gdsc.c | 21 +++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14eb7b064f988bb4b330c8784cab82e43b2d..7b2b9ad0485e6035af6c72d035ceb2bb8f4155e5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -345,6 +345,13 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	/*
+	 * Skip GDSC disable if consumer drivers requested
+	 * to keep the GDSC ON in HW even after suspend.
+	 */
+	if (sc->hw_stay_on)
+		return 0;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -746,3 +753,17 @@ int gdsc_gx_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_disable);
+
+/*
+ * set_hwmode_dev callback for GDSCs that let a consumer request that the
+ * GDSC stay powered in HW across suspend, instead of being torn down.
+ */
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	sc->hw_stay_on = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gdsc_set_hw_stay_on);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 2f9665b664e606234fcc632c3f6b302a448d06a7..12bf74a1b2a431cefdab955de15ae6b01db7a10a 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -79,6 +79,7 @@ struct gdsc {
 	bool				needs_icc;
 	unsigned int			icc_path_index;
 	struct icc_path			*icc_path;
+	bool				hw_stay_on;
 };
 
 struct gdsc_desc {
@@ -94,6 +95,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
 int gdsc_gx_disable(struct generic_pm_domain *domain);
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,

-- 
2.56.0

