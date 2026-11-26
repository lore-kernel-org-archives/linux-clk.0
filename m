Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719618;
	b=OIcPNw8HZz/FjzBvEp2IZ59XE0ddOLSTEqZXYrKSvLhoexVjKvpugYej8u1XbWaAd26x
	 zXnhYuh1iYNPRTdR1hSTlBNQl64wuKGxc2KZwL/boZO4mWmvnVHjR7ung/85kO/IgLxm+
	 GGa5JqM/0vVDbGgFk7PJcVrLatVaLN5DJdMWa1npBreN/l9the33/R7aW+kPb8tgAFCal
	 c6zClYt5xoCi9/YLnE4u9BcH6nwDBDmkJ90E4spo7d53uWsGWmmCip9rQd1nGM2hURcYn
	 R5K0m5jtP7SXFzO/GuT3UtVSxcg+xyvmVyfRbvk0Xo/KMQA7bGqDEXep9oDwaNXxSTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
	b=gt0XTKv/ur/pKP4Cy07G1FyhzT3SAAyv20csr9o08SakMaAquMwI1hb2+sYiLKstW0wd
	 jL9js3PFnU3KOYXSRbbO2yEVb/rKuvMYRtEFiM7BeBkaabSQJM1FXsxLwGMKyaGssOFHK
	 xTxztClGzVuMusMtvNJpjXWDyAdZVLUnc2DrW5SuJSbqhHXhTyOvxsvREVs+r8KM3V67I
	 Bo0VLAMK1iIyOAhmsV8ZVNYIV4YfepR66W+ntLmtSsQZBCIrDdrurjmbp2fB2MsLr6b/1
	 NLMgxNCPuLvxqTt1K1fnXYJC4NttmtKi2p1sC2psmI9ubBv52lGp80UaF39r+K3EqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5785ACR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D2606A32D
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17D2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5785ACR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGciKj597751
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=; b=RORMn7lU6cjZUu9n
	rBkXpGhdt03vuQ/8JNw4HTz9VLUfhi8wsI2OrO0yC7CFvPDJaBQr99JQ9Bcj2Maw
	CT/w6cFZfk9zqdByUUNYzlqh88xjQ0OzDisuhWy6SUrebwr8Ai23u54uPukPiA9x
	AfDDx6k8S+uVwPRjvPBbbh25yEAr2EvqydMDhHCrf4opCii9eacFe/AF2aP+icwM
	7Y9JwUinzImZi5wFyvXuImg7fE58GMr2r7OJYntRjSyEXF4GE6dqIqW7AZvjH9yO
	9Hbz5LrBu/tXvxH3zEGvSSxHaO0w64b6/dzvvTR/vAJwoXuktMm4xitYSG1vI3as
	qnS6jQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90df6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so5053400eec.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719616; x=1796324416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=C5785ACRL/xE3g+whImGQDFsgV5aWS34tPslLonRiK+ZpOSAZzArTXeB4nkjxQtgoX
         GJC7uITWj/gM9jaHn90/hLejBEi7qTWRyBnI/brnTbgun5ZTke4qIC2tfZwUKNv/xJLU
         2/RtgFjXUOuOhKWnZhxqLWXir+R7ZaMGfVvRxfMgW6DMdTDjFQlhqmrIV7ItEAwhPwV3
         o2J31ENzpK8ZP6+pGzqk1vzqG0qn7Ba9VWFwdZgNGyftlSe+J2IhHJb09Cfi8qPtRY0b
         UTsfiRbUF1lx1QjryINqxZpg5ojJLNYE1P6z3wnDEHvi83UXtvAcNJpXiysmh96tmLoY
         kp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719616; x=1796324416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=RG+92KH7eZpGQf7LvmFfpBis4OGMXYaaK93O6WInGINsgXrN2qkYZIXFdocN5b4tqM
         ZnwCOSaQ1RIQmtGU05vunt7/FQYV0SC2fX+YMKJZYHw5C+izxm2ZgmrzXakT3hfMMMmY
         CPcMOKrGKW7FUyJ7UjnaK2L0EiQfK47w+wJpnqp5nKkDg9WB1p6M18wOmqScqA8KxsMp
         7ENJ2GWr3a476drDNoJh2Tak9t6BwwnuW6MQTXYNDoicC5mZdE2WAk9SSfgRi+Zn3e+O
         3YhQ49Rr0EnnuS2VgKR5Mjmdc1Uadz991K/h8xr09TwNz5WFo9KlWXVsA3ldatAyQUDF
         BrMg==
X-Forwarded-Encrypted: i=1; AL+hErGIMlHo8RtTUKdaaTc9RiMrKE1zxxqESWFWjWqP4JhC1NM5srNNlkeGjPz/+YKFqAVpT8XxE36h42o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mzYl/Z2gtRo5vThQvo2OmXdOvBH5FcfP08L493bmYnBFC4+Er
	bXQGunCCP6VOfO5dtaNtpNjcxrqBHwiqk+H11WNuJD43m5Hdd8iO2OUbWXyO+03/brgb4tjfAMj
	/qTochkCJtuA/UR3+ARPo7jpcgPjk4gB4CDpH7Ybzd4NIyoiYnK52zP2dqgQ/FrU=
X-Gm-Gg: AZFdTZcI6uYWGePzABuNYTlBwweZfVIW2K20yHo7+LVxF9S2tv9gKTJtyadeeM1S5sT
	tXG4dSUJk0cQZrLphqbP19oNWwr/8ezKl4eJ8Lzhm7S5rjXK8bOxXGpPSrYlsxvyLrAQzcUGz6F
	4iUZZhpnLJPoNowgsw9TinvCP9IITSb2GAPkXq0YBnlXlsFTznwgR847fI6HIMznXdfH7xjyADI
	PMPxtSNwj/2MYlOAmVPhqoJFwhjuW2bYjatoxJe9SK/B+9qnAKfwOjFrma6HDk/6siW6S1dtC6D
	6STaOH5x6Df4vdjEFLH93MF1TzLWEG03wy/iZOajtfqKZ9qyQ/odSAzI/fhfnTrSp19Zkt37q5r
	1qr0KKsXrYMwLJW/MZpbJZBD65SH1lAWcW9BwMdRnl/KYh7AKNp9yvrawN2xkWJvsAeSsZW2LhE
	R3IHkW
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745128c88.31.1795719616388;
        Thu, 26 Nov 2026 11:00:16 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745075c88.31.1795719615743;
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:13 +0530
Subject: [PATCH 5/8] usb: dwc3: qcom: Add support to keep GDSC On during
 host mode bus suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-5-485a08ffdc6f@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SRY2yE4RlqouTVzaBfTkga6BJAjG75vl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX0tYZND7MVDRd
 B4xnHFSPBT9cXr6q54QQpIblDy8wh7pXiE71PlFNwwwk41bFnijQX2bgei4PbFwdGjXa+IInug5
 m/oe/9UH+0H3oAVZQ2ON9UlAoge5QeCUt4Y/hNt/khLb8o6mesxSbzEMSzwIPKjP7lFAgFy+Q/b
 heelkQkzyrJImv3U7mSCl2qOEkWPuHYbiyoZTJGnn4ovI31rX9NvYXID70KfaCEnn279IzYDK50
 A/MjpSFNyeMAsnlGx2FDxUgsNATmyxILNLW11C7AqQ/A/QBi5tyQ7X5m/bS4uix80n/EeoOQDKC
 bhdsJOAL9PzdLBsPwHmJG1AUaYYN7pL7kMdY6PVqRgdY/mRPmwySlSDZ4xudnwHMNX7edKs9AEt
 np1958Q68+KgAGLoaLgKJYdlJY1oO4LvzGcHqrxTCydMh1NpOnZZzXSckayZtX7O0vqGddolq/b
 6WGS1SwmmZQ0oY31KYA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0881c1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=g78jQFkTSXp5-VZghQ0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXyw7vwF8jyRdC
 cg6u2ssbrECO1CTvs/vk1DgJIAMuUrKwL8M2KqHzTX3NbN16ytNOZ5xNC7SkHPrHFABcAvcorYJ
 0w+xqf8FSUBxQ+rw+nCGw/xELpeDMd4=
X-Proofpoint-GUID: SRY2yE4RlqouTVzaBfTkga6BJAjG75vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

When we perform suspend in host mode, there is a xHCI crash seen on
resume. During bus suspend use case if the device is wakeup capable,
the GDSC needs to be kept ON to retain memory and avoid SMMU faults.
Set GDSCs hwmode to true to keep the GDSC ON during suspend. And set
it to false to ensure GDSC is turned OFF during cable disconnect or
non-wakeup scenarios.

Co-developed-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 5a68025ccea5e5df8860f540f718262b7d8acf8c..99dce28dda065583b91ed965d917e977519cfe58 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -391,6 +392,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 		for (i = 0; i < qcom->num_ports; i++)
 			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
 		dwc3_qcom_enable_interrupts(qcom);
+		dev_pm_genpd_set_hwmode(qcom->dev, true);
+	} else {
+		dev_pm_genpd_set_hwmode(qcom->dev, false);
 	}
 
 	qcom->is_suspended = true;

-- 
2.56.0

