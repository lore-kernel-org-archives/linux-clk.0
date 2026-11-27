Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779709;
	b=3BSmYlOMUqzqpYYfuPl987GbenAr1wuUsoycGL6wrMccgMuAmqwSNz91aJMPXGhKmkl5
	 cNQmh6akYSO+uMg8yWtA1CUYx9DV8bMPFXDPLBhmYah7MVHyMTI3/vr/AYl7VUHkVn3L3
	 JndGHALHrfx2JwZJ3duC50SefgpTvdYyDpwhpC7wAaPy0rx7oHAEPxs4icLEgg2AKVTFu
	 H1LPy5MZ+rSkBTWxFRpvl+SN9t5AHYWqMpcS17aYAVjTCkEgKsGgVgESy75FfiNoGySMd
	 JlifkFTvIZy/aMG1CpUwObxRfERS0x0jZWPJMi+rJoXKdViQeVVQyhHIVg22/sA6vKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1BEwneZsL9U7mYVDgyc3ySkJx0YQXCOxH187pmARE/A=;
	b=fTJYRq1A4mKZl3f0+/Zap/MtNJO9PotH0JcuvaTHbFqGD3UcxH5aXtCrSqtGgw68FoNX
	 72lXA5kU/p/jw+Wd04tTsqejLoOZpuLNx5quxDsX1gB1scbR/bc/CVpYO0ECZ+yN/6AQN
	 SeTHYAI/qjuw/APAMK1wCKOamTZQZAYc35uRl1pnzQlD8ISy2cvY8GVEkIuskmmL6RYzL
	 KGGdXPiQbxFCVrTfmXFN90pHsxG+AyDJtsWw7R0sEtqafS7HmDMtQCvsku6c+pGKhMuoS
	 dECxNiO+4r3WIShmLAZzJ79/YBcHBHju6sF+Q1j9hyEewhxobDSzhwFzl5eWvaigzgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="khzo/t3b";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyeqDBr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958760A260A
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E958760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khzo/t3b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyeqDBr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApi0h053015
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BEwneZsL9U7mYVDgyc3ySkJx0YQXCOxH187pmARE/A=; b=khzo/t3bbliNw//g
	6ekb2KuYSvRDoikAKPiykx/hlhfm7H/gVmuQ3/2nO5eo2q1TvRpobDe1CYrB0Cg5
	vTiZ+ECQCo29/gF5pPR80Cmb06bNrfInEYdqMvaYsK82G/tWb0ioVH2NXTJGzoiT
	8kl4qlqy/EFxNBKBFEHFDUo4QRAGU+xeIh2T9qDcrkt0WcZFY2LeAL5NnZ6X6pLh
	RHYlIzKXMfTq/hDleLZGlQewF65f9Yk+3RI+BOphA59xQIzFIbli+44XPV2QR8OR
	ONQprwviZqtoF80zuhI4VOp8Rf1sLvUgjIa2m66+IQO8m8yVZTjhEvfFZbHfmBqU
	u44ORA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s87e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1449297085a.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779706; x=1796384506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BEwneZsL9U7mYVDgyc3ySkJx0YQXCOxH187pmARE/A=;
        b=fvyeqDBr28fx6mdGZBLyFMz5UMBbpIBQ5HyzdO6bB66Syas+sj0kx/YsJh/HUdm/gF
         bI8rQ7PEJ6itr4igzekh5MSctYo8mp3OyQB/0Wbc41AqwgSn0oxlmaae64tkI+0+rMhg
         5cCZ1pJ5Ti9Tdvqqqp+UgiG+33f+9y3b1pokRhJ3+CDw1FHsaNPj62Oco/5XuVCeG9mY
         w74aBRB9mr0lIJv7og4TpAn1UNTT+gQOKnGaym3+xMuWJM5rX35iY92zwvIWWFwXXAEj
         JxNR09xVIOO4agaEWzGQpE1sYXUmX+HyoeW/H4MMb5DUPMHCbwUBRjoe2kPt/EJ5cedq
         vmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779706; x=1796384506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BEwneZsL9U7mYVDgyc3ySkJx0YQXCOxH187pmARE/A=;
        b=kTB04yCyMQKzLVCLkDdwpMrlZB/ROJ8BD7ZVOlCNM346anqVnZqD8Tf9CUTCh2KLU/
         Vo1xz08uQzzRGxQ5fxlOK3GmderY6Xgz4nJ0gg//QRptsXpMRFl/+Uf+rBKXrA1YIp6G
         9ggxoaGlFERBLAzX4U2T0viIZ22l7xFvWp/UfLPHjyU2U9BGf7DUIGAZ9DleSqKb6t/1
         2jlQn2s66mh4f86AG++KhmztfGyAFez7+VGQdqyckKeOz0wbaYJxiznkt+bMMtT/P4oV
         gkvFa7YEEW58rFrTzyHsjbvJF0Q6a1kAz0JSh2rkS7GDZdZ7PaFTlqULgBJdQidlX9bZ
         pvpA==
X-Forwarded-Encrypted: i=1; AL+hErE2niao5xWFeUlt3o9ZwwgrdbH5VBWGYFYcppZy+rTBT1hQeuoZUPTXyF3sthCjKTUa5SMhjz8qNCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k7Xe7eNdQTZHwsHKYgQFwRUjdKj4mSbx3dzQiRUWgVtatUPfh
	ykfXanQuFuHIXH1OJzn8YrQaRNnZoKZ1Hxg4U7HB4bTwd12KmnPltFJKqQmxi1gfn6N3ULVQdgU
	kwr+SvBGrbC+k4mCsG7xjfPTkTb77wTI4IjVfJge4UuLfijCHGuk6PDVuahy+He4=
X-Gm-Gg: AZFdTZflmc6yEhepCKSjbeU2hItepM0FvCFq5FJMrYY3h2+0SHr4GwbXwo8e5Ti4E0o
	J620C7bN+EcYtTi4D3AfszGL/9bT5Es1hKeI9ifDR7w144ET7m6Zi21TEzT5WjxJUYQstG0mSRv
	fnB61zdHKZwEQzT+38iEYmi6HqAoyVjA+DtORP7Rz/vxZDQxGZytJ2p+QbpAkQrk+jqVC2Oc1AZ
	0gg1KDQsdSkG4NjcmhgcPrvXJ5Trb3yv4ceP3TzNRvI/Q4RcJWZb4ZbxS/9lBvNsCRFP6YLEmIm
	/ZrvK041C3Bfb/vpXNRcS72RSo1IQ4DxcNZorBFmBmt2NFuIZr9Xk338rQfFy+9uCl6QEYWtztI
	eu9ZwR1Tt564bmf0g6j95q/qjj3EkBCVvQ1rmP+jt5rH6OsKCsU45rZQ4AEcKtmp7nYT9ApQClL
	Zf89RRMJiVehmTtKAeqkI9fiEe83H52ZBR/J79V6FaHwuO+U3iHWYKUJb97CFMCgk=
X-Received: by 2002:a05:620a:f04:b0:949:7bb1:ac5a with SMTP id af79cd13be357-949ba96e76bmr4139161485a.16.1795779704561;
        Fri, 27 Nov 2026 03:41:44 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:7bb1:ac5a with SMTP id af79cd13be357-949ba96e76bmr4139152085a.16.1795779703469;
        Fri, 27 Nov 2026 03:41:43 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:31 +0100
Subject: [PATCH 2/6] clk: qcom: add the Global Clock Controller driver for
 Seca
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
Message-Id: <20261127-seca-clocks-v1-2-1781298e658b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=112569;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q4IUphIfrLhNbZfaVs+xM1Tq+Vu1TsJSLAgHIRZeGto=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwMhbCEWyEPSwhvn7/pvnGcJnG9Nbr9Mtir
 UIiYek5e2yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w/9QEAC19Hdy9RnKuC3pbe43wZG0AuNzi0n5lr8XeLq81otEemxWfrgCSlG/nTwg2QIanAWgdsl
 vsBAivfUw+n0/gwaSukCGgBafe6CBFflPgvhxZ8VK0AaQFOkOtbxI4nbdn8355OOXlaX2BsdX34
 EfhFqcMKwx1QRYJYWhz6j13SZs6EZ0cZWrDu6aXc/DLCSanowO/rLdOpm8b9GyJWnUMG+2skI69
 j9qwSHEfIC8HEnM0g6IT50cWnNsDSUQ18uQ7beZlzIBZGAWHa6WVdYHUgoVyqI4euDNTsVIZV5h
 5Lrl/uBGZE0kdiQ9Bgg79hX0vJfOIpB9MvQj/2drroiRDUfXXWmSFWJ/++agw40XV21CX1A5BF3
 OBezZ9faOf0NvQV73bboX8Z6816PZ+0Gl9JPUii5l9G9AAgfYnqzmdW7wD42A7D2L5j8TeyPH2I
 zwIQ4PQ5xr5AajYYrHx99F6O+8h3UNKbf629vSET/D+i7Sej/9qQ768EnecNiFUYWB8iZ/nQZiD
 kAy4ksra4wW7DHRrHHj1kUALEuxWgPX7vXzS5dwNOZt4HGrolDiVzHqs8IKF5bzBxitkOnlAdyJ
 yN76dPOKQCy/JK8NITImJjyPesKPcPHgfAS1gol6MLEpspAzguSTKEv3C4TiSZnod+tPSPIfgEl
 HSUnoKJi7K/Saug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TCah2ea6s4fDdMkpUG6c7_gN5VeUhxFJ
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096c7a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gFFiMsv70wEPLvFZIPAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX1PpesN7c8HzL
 UL8qlG8bHQylZ7owCqEzi8dAe4+Fbo2uq5wvQ/h9OIhE/dSYN9TRl9EhOu8nNA245u7zlUL5XN0
 KjP2eYGcMDzkqwj9sSOKdTJVgOI+u/c=
X-Proofpoint-GUID: TCah2ea6s4fDdMkpUG6c7_gN5VeUhxFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9koE6E7zGfuC
 JQWyHUeaGx/OLS0u/keCy5MSJQiSh+jdFl2gsAeiV/E6tU9pfKu4XfTeofcpTffy7Ul7Js1TZRL
 fjrzKmQQ6bMaUQb9Qr+O6Zk5TYa5ZWosQNiwTtErAhW0/nS2l/mVAchjiYUKCIv608vUzuyY/jI
 f58rPkKjqo37WrMPcurtI4MnlFkehW6m7A1HWZSzXgVZRz9weGH0UJAaDQUvfk5kjKN+Wk1ExLd
 rQPhwwSQsdDKKUtiigAT2sMH1fOZLvzRUd4w7ztb7FSYVuB3JbAwZm5MCNmuD26Y2MOOf6O4hcT
 0XZ+BA7fViL4/Ikq1y+zb7hrW0bmEh9MyqCuNyMerH9tWZGYSAoHsYxBwWZvQBrxs6xJHJcJdx2
 RWB+iCePCRpP0cndrts/1fZmdLwWI9cNIi6ShPFgMWL1DIi5tE9MbfvwdJ45zEc5WIy9H7rzHmv
 aLmXUwcjoYvaQij1q5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the driver for the North East and North West modules of the Global
Clock Controller on the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |   11 +
 drivers/clk/qcom/Makefile     |    1 +
 drivers/clk/qcom/negcc-seca.c | 1458 ++++++++++++++++++++++++++++
 drivers/clk/qcom/nwgcc-seca.c | 2138 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 3608 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b184963fa3d885a7661ad982aaa5bcbc0..0680926b0ae0903d46fed642dd60e6187642e56b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -328,6 +328,17 @@ config CLK_NORD_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_SECA_GCC
+	tristate "Seca Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	default ARCH_QCOM
+	help
+	  Support for the global clock controller on Seca devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI, I2C,
+	  USB, SD/UFS, PCIe etc. The clock controller is a combination of
+	  NE_GCC and NW_GCC.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f84d7343a3a475dd9ef1fa77bf0de25fab0d9e75..270c1b97b41f3db7f1d2fa98a262a8c8e189becc 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_NORD_VIDEOCC) += videocc-glymur.o
+obj-$(CONFIG_CLK_SECA_GCC) += negcc-seca.o nwgcc-seca.o
 obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
diff --git a/drivers/clk/qcom/negcc-seca.c b/drivers/clk/qcom/negcc-seca.c
new file mode 100644
index 0000000000000000000000000000000000000000..116d713cda01a82e097a152a2769c3cbe9cd0f08
--- /dev/null
+++ b/drivers/clk/qcom/negcc-seca.c
@@ -0,0 +1,1458 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,seca-negcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-phy-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+	DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_NE_GCC_GPLL0_OUT_EVEN,
+	P_NE_GCC_GPLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll ne_gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_ne_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv ne_gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_ne_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_ne_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct parent_map ne_gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+};
+
+static const struct parent_map ne_gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map ne_gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NE_GCC_GPLL0_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+	{ .hw = &ne_gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map ne_gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static struct clk_regmap_phy_mux ne_gcc_usb3_prim_phy_pipe_clk_src = {
+	.reg = 0x2a078,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux ne_gcc_usb3_sec_phy_pipe_clk_src = {
+	.reg = 0x2c078,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_gp1_clk_src[] = {
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_NE_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x21004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_1,
+	.freq_tbl = ftbl_ne_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gp1_clk_src",
+		.parent_data = ne_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x22004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_1,
+	.freq_tbl = ftbl_ne_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gp2_clk_src",
+		.parent_data = ne_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_qupv3_wrap2_s0_clk_src[] = {
+	F(7372800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 64, 375),
+	F(112000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 14, 75),
+	F(117964800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 3072, 15625),
+	F(120000000, P_NE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s0_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s0_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s0_clk_src = {
+	.cmd_rcgr = 0x3816c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s0_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s1_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s1_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s1_clk_src = {
+	.cmd_rcgr = 0x382a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_ne_gcc_qupv3_wrap2_s2_clk_src[] = {
+	F(7372800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s2_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s2_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s2_clk_src = {
+	.cmd_rcgr = 0x383e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s2_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s3_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s3_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s3_clk_src = {
+	.cmd_rcgr = 0x38520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s3_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s4_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s4_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s4_clk_src = {
+	.cmd_rcgr = 0x3865c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s4_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s5_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s5_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s5_clk_src = {
+	.cmd_rcgr = 0x38798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s5_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s6_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s6_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
+	.cmd_rcgr = 0x388d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s6_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 1, 30),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 1, 24),
+	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_sdcc4_apps_clk_src = {
+	.cmd_rcgr = 0x1801c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_sdcc4_apps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_sdcc4_apps_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_usb20_master_clk_src[] = {
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(120000000, P_NE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_usb20_master_clk_src = {
+	.cmd_rcgr = 0x31030,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb20_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_master_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_usb20_mock_utmi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_usb20_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x31048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb20_mock_utmi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_usb31_prim_master_clk_src[] = {
+	F(85714286, P_NE_GCC_GPLL0_OUT_MAIN, 7, 0, 0),
+	F(133333333, P_NE_GCC_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(200000000, P_NE_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(240000000, P_NE_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_usb31_prim_master_clk_src = {
+	.cmd_rcgr = 0x2a038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_2,
+	.freq_tbl = ftbl_ne_gcc_usb31_prim_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_master_clk_src",
+		.parent_data = ne_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_prim_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2a050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb20_mock_utmi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_sec_master_clk_src = {
+	.cmd_rcgr = 0x2c038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb31_prim_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_master_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_sec_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2c050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb20_mock_utmi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb3_prim_phy_aux_clk_src = {
+	.cmd_rcgr = 0x2a07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_3,
+	.freq_tbl = ftbl_ne_gcc_usb20_mock_utmi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb3_prim_phy_aux_clk_src",
+		.parent_data = ne_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb3_sec_phy_aux_clk_src = {
+	.cmd_rcgr = 0x2c07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_3,
+	.freq_tbl = ftbl_ne_gcc_usb20_mock_utmi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb3_sec_phy_aux_clk_src",
+		.parent_data = ne_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb20_mock_utmi_postdiv_clk_src = {
+	.reg = 0x31060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb20_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src = {
+	.reg = 0x2a068,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb31_prim_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src = {
+	.reg = 0x2c068,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb31_sec_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb2_axi_clk = {
+	.halt_reg = 0x31068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x31068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x31068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb2_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x2a098,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a098,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb3_sec_axi_clk = {
+	.halt_reg = 0x2c098,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c098,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb3_sec_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb2_axi_clk = {
+	.halt_reg = 0x31064,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x31064,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x31064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb2_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb3_prim_axi_clk = {
+	.halt_reg = 0x2a094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb3_sec_axi_clk = {
+	.halt_reg = 0x2c094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb3_sec_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_frq_measure_ref_clk = {
+	.halt_reg = 0x20008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_frq_measure_ref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gp1_clk = {
+	.halt_reg = 0x21000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gp2_clk = {
+	.halt_reg = 0x22000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_core_2x_clk = {
+	.halt_reg = 0x38020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_core_clk = {
+	.halt_reg = 0x3800c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_m_ahb_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(21),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s0_clk = {
+	.halt_reg = 0x3815c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s1_clk = {
+	.halt_reg = 0x38298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s2_clk = {
+	.halt_reg = 0x383d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(27),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s3_clk = {
+	.halt_reg = 0x38510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s4_clk = {
+	.halt_reg = 0x3864c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s5_clk = {
+	.halt_reg = 0x38788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s6_clk = {
+	.halt_reg = 0x388c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(31),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s_ahb_clk = {
+	.halt_reg = 0x38008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_sdcc4_apps_clk = {
+	.halt_reg = 0x18004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_sdcc4_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_sdcc4_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_sdcc4_axi_clk = {
+	.halt_reg = 0x18014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_sdcc4_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_master_clk = {
+	.halt_reg = 0x31018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_mock_utmi_clk = {
+	.halt_reg = 0x3102c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3102c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_sleep_clk = {
+	.halt_reg = 0x31028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_eud_ahb_clk = {
+	.halt_reg = 0x2a02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_eud_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_master_clk = {
+	.halt_reg = 0x2a01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_mock_utmi_clk = {
+	.halt_reg = 0x2a034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_sleep_clk = {
+	.halt_reg = 0x2a030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_eud_ahb_clk = {
+	.halt_reg = 0x2c02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_eud_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_master_clk = {
+	.halt_reg = 0x2c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_mock_utmi_clk = {
+	.halt_reg = 0x2c034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_sleep_clk = {
+	.halt_reg = 0x2c030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_aux_clk = {
+	.halt_reg = 0x2a06c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_com_aux_clk = {
+	.halt_reg = 0x2a070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_pipe_clk = {
+	.halt_reg = 0x2a074,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x2a074,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_aux_clk = {
+	.halt_reg = 0x2c06c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_com_aux_clk = {
+	.halt_reg = 0x2c070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_pipe_clk = {
+	.halt_reg = 0x2c074,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x2c074,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc ne_gcc_usb31_prim_gdsc = {
+	.gdscr = 0x2a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb31_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb3_phy_gdsc = {
+	.gdscr = 0x2b00c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "ne_gcc_usb3_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb31_sec_gdsc = {
+	.gdscr = 0x2c004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb31_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb20_prim_gdsc = {
+	.gdscr = 0x31004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb20_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb3_sec_phy_gdsc = {
+	.gdscr = 0x2d00c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "ne_gcc_usb3_sec_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *ne_gcc_seca_clocks[] = {
+	[NE_GCC_AGGRE_NOC_USB2_AXI_CLK] = &ne_gcc_aggre_noc_usb2_axi_clk.clkr,
+	[NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK] = &ne_gcc_aggre_noc_usb3_prim_axi_clk.clkr,
+	[NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK] = &ne_gcc_aggre_noc_usb3_sec_axi_clk.clkr,
+	[NE_GCC_CNOC_USB2_AXI_CLK] = &ne_gcc_cnoc_usb2_axi_clk.clkr,
+	[NE_GCC_CNOC_USB3_PRIM_AXI_CLK] = &ne_gcc_cnoc_usb3_prim_axi_clk.clkr,
+	[NE_GCC_CNOC_USB3_SEC_AXI_CLK] = &ne_gcc_cnoc_usb3_sec_axi_clk.clkr,
+	[NE_GCC_FRQ_MEASURE_REF_CLK] = &ne_gcc_frq_measure_ref_clk.clkr,
+	[NE_GCC_GP1_CLK] = &ne_gcc_gp1_clk.clkr,
+	[NE_GCC_GP1_CLK_SRC] = &ne_gcc_gp1_clk_src.clkr,
+	[NE_GCC_GP2_CLK] = &ne_gcc_gp2_clk.clkr,
+	[NE_GCC_GP2_CLK_SRC] = &ne_gcc_gp2_clk_src.clkr,
+	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
+	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
+	[NE_GCC_QUPV3_WRAP2_CORE_2X_CLK] = &ne_gcc_qupv3_wrap2_core_2x_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_CORE_CLK] = &ne_gcc_qupv3_wrap2_core_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_M_AHB_CLK] = &ne_gcc_qupv3_wrap2_m_ahb_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S0_CLK] = &ne_gcc_qupv3_wrap2_s0_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S0_CLK_SRC] = &ne_gcc_qupv3_wrap2_s0_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S1_CLK] = &ne_gcc_qupv3_wrap2_s1_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S1_CLK_SRC] = &ne_gcc_qupv3_wrap2_s1_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S2_CLK] = &ne_gcc_qupv3_wrap2_s2_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S2_CLK_SRC] = &ne_gcc_qupv3_wrap2_s2_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S3_CLK] = &ne_gcc_qupv3_wrap2_s3_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S3_CLK_SRC] = &ne_gcc_qupv3_wrap2_s3_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S4_CLK] = &ne_gcc_qupv3_wrap2_s4_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S4_CLK_SRC] = &ne_gcc_qupv3_wrap2_s4_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S5_CLK] = &ne_gcc_qupv3_wrap2_s5_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S5_CLK_SRC] = &ne_gcc_qupv3_wrap2_s5_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S6_CLK] = &ne_gcc_qupv3_wrap2_s6_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S6_CLK_SRC] = &ne_gcc_qupv3_wrap2_s6_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S_AHB_CLK] = &ne_gcc_qupv3_wrap2_s_ahb_clk.clkr,
+	[NE_GCC_SDCC4_APPS_CLK] = &ne_gcc_sdcc4_apps_clk.clkr,
+	[NE_GCC_SDCC4_APPS_CLK_SRC] = &ne_gcc_sdcc4_apps_clk_src.clkr,
+	[NE_GCC_SDCC4_AXI_CLK] = &ne_gcc_sdcc4_axi_clk.clkr,
+	[NE_GCC_USB20_MASTER_CLK] = &ne_gcc_usb20_master_clk.clkr,
+	[NE_GCC_USB20_MASTER_CLK_SRC] = &ne_gcc_usb20_master_clk_src.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_CLK] = &ne_gcc_usb20_mock_utmi_clk.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb20_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC] = &ne_gcc_usb20_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB20_SLEEP_CLK] = &ne_gcc_usb20_sleep_clk.clkr,
+	[NE_GCC_USB31_PRIM_EUD_AHB_CLK] = &ne_gcc_usb31_prim_eud_ahb_clk.clkr,
+	[NE_GCC_USB31_PRIM_MASTER_CLK] = &ne_gcc_usb31_prim_master_clk.clkr,
+	[NE_GCC_USB31_PRIM_MASTER_CLK_SRC] = &ne_gcc_usb31_prim_master_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_CLK] = &ne_gcc_usb31_prim_mock_utmi_clk.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb31_prim_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC] =
+		&ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_SLEEP_CLK] = &ne_gcc_usb31_prim_sleep_clk.clkr,
+	[NE_GCC_USB31_SEC_EUD_AHB_CLK] = &ne_gcc_usb31_sec_eud_ahb_clk.clkr,
+	[NE_GCC_USB31_SEC_MASTER_CLK] = &ne_gcc_usb31_sec_master_clk.clkr,
+	[NE_GCC_USB31_SEC_MASTER_CLK_SRC] = &ne_gcc_usb31_sec_master_clk_src.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_CLK] = &ne_gcc_usb31_sec_mock_utmi_clk.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb31_sec_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_POSTDIV_CLK_SRC] =
+		&ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB31_SEC_SLEEP_CLK] = &ne_gcc_usb31_sec_sleep_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_AUX_CLK] = &ne_gcc_usb3_prim_phy_aux_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &ne_gcc_usb3_prim_phy_aux_clk_src.clkr,
+	[NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &ne_gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_PIPE_CLK] = &ne_gcc_usb3_prim_phy_pipe_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &ne_gcc_usb3_prim_phy_pipe_clk_src.clkr,
+	[NE_GCC_USB3_SEC_PHY_AUX_CLK] = &ne_gcc_usb3_sec_phy_aux_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_AUX_CLK_SRC] = &ne_gcc_usb3_sec_phy_aux_clk_src.clkr,
+	[NE_GCC_USB3_SEC_PHY_COM_AUX_CLK] = &ne_gcc_usb3_sec_phy_com_aux_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_PIPE_CLK] = &ne_gcc_usb3_sec_phy_pipe_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_PIPE_CLK_SRC] = &ne_gcc_usb3_sec_phy_pipe_clk_src.clkr,
+};
+
+static struct gdsc *ne_gcc_seca_gdscs[] = {
+	[NE_GCC_USB20_PRIM_GDSC] = &ne_gcc_usb20_prim_gdsc,
+	[NE_GCC_USB31_PRIM_GDSC] = &ne_gcc_usb31_prim_gdsc,
+	[NE_GCC_USB31_SEC_GDSC] = &ne_gcc_usb31_sec_gdsc,
+	[NE_GCC_USB3_PHY_GDSC] = &ne_gcc_usb3_phy_gdsc,
+	[NE_GCC_USB3_SEC_PHY_GDSC] = &ne_gcc_usb3_sec_phy_gdsc,
+};
+
+static const struct qcom_reset_map ne_gcc_seca_resets[] = {
+	[NE_GCC_QUPV3_WRAPPER_2_BCR] = { 0x38000 },
+	[NE_GCC_QUSB2PHY_PRIM_BCR] = { 0x2e000 },
+	[NE_GCC_QUSB2PHY_SEC_BCR] = { 0x2f000 },
+	[NE_GCC_SDCC4_BCR] = { 0x18000 },
+	[NE_GCC_USB20_PRIM_BCR] = { 0x31000 },
+	[NE_GCC_USB31_PRIM_BCR] = { 0x2a000 },
+	[NE_GCC_USB31_SEC_BCR] = { 0x2c000 },
+	[NE_GCC_USB3_DP_PHY_PRIM_BCR] = { 0x2b008 },
+	[NE_GCC_USB3_DP_PHY_SEC_BCR] = { 0x2d008 },
+	[NE_GCC_USB3_PHY_PRIM_BCR] = { 0x2b000 },
+	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
+	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
+	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+};
+
+static const struct clk_rcg_dfs_data ne_gcc_seca_dfs_clocks[] = {
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s5_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s6_clk_src),
+};
+
+static const struct regmap_config ne_gcc_seca_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf41f0,
+	.fast_io = true,
+};
+
+static const u32 ne_gcc_seca_critical_cbcrs[] = {
+	0x30004, /* NE_GCC_AHB2PHY_CLK */
+};
+
+static const struct qcom_cc_driver_data ne_gcc_seca_driver_data = {
+	.clk_cbcrs = ne_gcc_seca_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_seca_critical_cbcrs),
+	.dfs_rcgs = ne_gcc_seca_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_seca_dfs_clocks),
+};
+
+static const struct qcom_cc_desc ne_gcc_seca_desc = {
+	.config = &ne_gcc_seca_regmap_config,
+	.clks = ne_gcc_seca_clocks,
+	.num_clks = ARRAY_SIZE(ne_gcc_seca_clocks),
+	.resets = ne_gcc_seca_resets,
+	.num_resets = ARRAY_SIZE(ne_gcc_seca_resets),
+	.gdscs = ne_gcc_seca_gdscs,
+	.num_gdscs = ARRAY_SIZE(ne_gcc_seca_gdscs),
+	.driver_data = &ne_gcc_seca_driver_data,
+};
+
+static const struct of_device_id ne_gcc_seca_match_table[] = {
+	{ .compatible = "qcom,seca-negcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ne_gcc_seca_match_table);
+
+static int ne_gcc_seca_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &ne_gcc_seca_desc);
+}
+
+static struct platform_driver ne_gcc_seca_driver = {
+	.probe = ne_gcc_seca_probe,
+	.driver = {
+		.name = "negcc-seca",
+		.of_match_table = ne_gcc_seca_match_table,
+	},
+};
+
+module_platform_driver(ne_gcc_seca_driver);
+
+MODULE_DESCRIPTION("QTI NEGCC Seca driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/nwgcc-seca.c b/drivers/clk/qcom/nwgcc-seca.c
new file mode 100644
index 0000000000000000000000000000000000000000..59352c1a73406d837bf2b1dc18b9ba9a0b3162a8
--- /dev/null
+++ b/drivers/clk/qcom/nwgcc-seca.c
@@ -0,0 +1,2138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,seca-nwgcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-phy-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_UFS_0_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_0_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_0_PHY_TX_SYMBOL_0_CLK,
+	DT_UFS_1_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_1_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_1_PHY_TX_SYMBOL_0_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_NW_GCC_GPLL0_OUT_EVEN,
+	P_NW_GCC_GPLL0_OUT_MAIN,
+	P_NW_GCC_GPLL3_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll nw_gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x76010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_nw_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv nw_gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_nw_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_nw_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&nw_gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static struct clk_alpha_pll nw_gcc_gpll3 = {
+	.offset = 0x3000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x76010,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map nw_gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_NW_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &nw_gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &nw_gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map nw_gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NW_GCC_GPLL3_OUT_MAIN, 3 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &nw_gcc_gpll0.clkr.hw },
+	{ .hw = &nw_gcc_gpll3.clkr.hw },
+};
+
+static const struct parent_map nw_gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map nw_gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NW_GCC_GPLL3_OUT_MAIN, 5 },
+};
+
+static const struct parent_map nw_gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &nw_gcc_gpll0.clkr.hw },
+};
+
+static const struct parent_map nw_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NW_GCC_GPLL0_OUT_EVEN, 2 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &nw_gcc_gpll0.clkr.hw },
+	{ .hw = &nw_gcc_gpll0_out_even.clkr.hw },
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_0_phy_rx_symbol_0_clk_src = {
+	.reg = 0x52068,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_0_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_0_phy_rx_symbol_1_clk_src = {
+	.reg = 0x520f0,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_0_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_0_phy_tx_symbol_0_clk_src = {
+	.reg = 0x52058,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_0_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_1_phy_rx_symbol_0_clk_src = {
+	.reg = 0x3d068,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_1_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_1_phy_rx_symbol_1_clk_src = {
+	.reg = 0x3d0f0,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_1_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux nw_gcc_ufs_1_phy_tx_symbol_0_clk_src = {
+	.reg = 0x3d058,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_1_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nw_gcc_gp1_clk_src[] = {
+	F(60000000, P_NW_GCC_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_NW_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_NW_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nw_gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x20004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_0,
+	.freq_tbl = ftbl_nw_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gp1_clk_src",
+		.parent_data = nw_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x21004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_0,
+	.freq_tbl = ftbl_nw_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gp2_clk_src",
+		.parent_data = nw_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nw_gcc_qupv3_wrap0_s0_clk_src[] = {
+	F(7372800, P_NW_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NW_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NW_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NW_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NW_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NW_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 64, 375),
+	F(112000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 14, 75),
+	F(117964800, P_NW_GCC_GPLL0_OUT_MAIN, 1, 3072, 15625),
+	F(120000000, P_NW_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s0_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s0_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s0_clk_src = {
+	.cmd_rcgr = 0x5616c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s0_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s1_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s1_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s1_clk_src = {
+	.cmd_rcgr = 0x562a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_nw_gcc_qupv3_wrap0_s2_clk_src[] = {
+	F(7372800, P_NW_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NW_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NW_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NW_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NW_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NW_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NW_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s2_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s2_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s2_clk_src = {
+	.cmd_rcgr = 0x563e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s2_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s3_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s3_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s3_clk_src = {
+	.cmd_rcgr = 0x56520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s3_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s4_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s4_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s4_clk_src = {
+	.cmd_rcgr = 0x5665c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s4_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s5_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s5_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s5_clk_src = {
+	.cmd_rcgr = 0x56798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s5_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap0_s6_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap0_s6_clk_src",
+	.parent_data = nw_gcc_parent_data_4,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_4),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap0_s6_clk_src = {
+	.cmd_rcgr = 0x568d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_4,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap0_s6_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s0_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s0_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s0_clk_src = {
+	.cmd_rcgr = 0x5716c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s0_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s1_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s1_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s1_clk_src = {
+	.cmd_rcgr = 0x572a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s1_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s2_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s2_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s2_clk_src = {
+	.cmd_rcgr = 0x573e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s2_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s3_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s3_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s3_clk_src = {
+	.cmd_rcgr = 0x57520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s3_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s4_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s4_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s4_clk_src = {
+	.cmd_rcgr = 0x5765c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s4_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s5_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s5_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s5_clk_src = {
+	.cmd_rcgr = 0x57798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s5_clk_src_init,
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap1_s6_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap1_s6_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap1_s6_clk_src = {
+	.cmd_rcgr = 0x578d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap1_s6_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_nw_gcc_qupv3_wrap3_qspi_ref_clk_src[] = {
+	F(7372800, P_NW_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_NW_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NW_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(64000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_NW_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_NW_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_NW_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_NW_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(120000000, P_NW_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(150000000, P_NW_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(240000000, P_NW_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data nw_gcc_qupv3_wrap3_qspi_ref_clk_src_init = {
+	.name = "nw_gcc_qupv3_wrap3_qspi_ref_clk_src",
+	.parent_data = nw_gcc_parent_data_5,
+	.num_parents = ARRAY_SIZE(nw_gcc_parent_data_5),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 nw_gcc_qupv3_wrap3_qspi_ref_clk_src = {
+	.cmd_rcgr = 0x58174,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_5,
+	.freq_tbl = ftbl_nw_gcc_qupv3_wrap3_qspi_ref_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &nw_gcc_qupv3_wrap3_qspi_ref_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_nw_gcc_ufs_0_phy_axi_clk_src[] = {
+	F(120000000, P_NW_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(201500000, P_NW_GCC_GPLL3_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_NW_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(403000000, P_NW_GCC_GPLL3_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nw_gcc_ufs_0_phy_axi_clk_src = {
+	.cmd_rcgr = 0x52034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_1,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_0_phy_axi_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_0_phy_ice_core_clk_src = {
+	.cmd_rcgr = 0x5208c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_1,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_0_phy_ice_core_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nw_gcc_ufs_0_phy_phy_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nw_gcc_ufs_0_phy_phy_aux_clk_src = {
+	.cmd_rcgr = 0x520c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_2,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_0_phy_phy_aux_clk_src",
+		.parent_data = nw_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_0_phy_unipro_core_clk_src = {
+	.cmd_rcgr = 0x520a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_3,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_0_phy_unipro_core_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_1_phy_axi_clk_src = {
+	.cmd_rcgr = 0x3d034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_1,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_1_phy_axi_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_1_phy_ice_core_clk_src = {
+	.cmd_rcgr = 0x3d08c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_1,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_1_phy_ice_core_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_1_phy_phy_aux_clk_src = {
+	.cmd_rcgr = 0x3d0c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_2,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_1_phy_phy_aux_clk_src",
+		.parent_data = nw_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_ufs_1_phy_unipro_core_clk_src = {
+	.cmd_rcgr = 0x3d0a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_1,
+	.freq_tbl = ftbl_nw_gcc_ufs_0_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_ufs_1_phy_unipro_core_clk_src",
+		.parent_data = nw_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div nw_gcc_qupv3_wrap3_s0_clk_src = {
+	.reg = 0x5816c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_qupv3_wrap3_s0_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&nw_gcc_qupv3_wrap3_qspi_ref_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch nw_gcc_aggre_noc_ufs_0_phy_axi_clk = {
+	.halt_reg = 0x520f8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x520f8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x520f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_aggre_noc_ufs_0_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_aggre_noc_ufs_1_phy_axi_clk = {
+	.halt_reg = 0x3d0f8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d0f8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d0f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_aggre_noc_ufs_1_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_hf_axi_clk = {
+	.halt_reg = 0x16008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x16008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x16008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_sf_axi_clk = {
+	.halt_reg = 0x1601c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1601c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_trig_clk = {
+	.halt_reg = 0x16034,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x16034,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x16034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_0_hf_axi_clk = {
+	.halt_reg = 0x18008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x18008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x18008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_0_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_0_trig_clk = {
+	.halt_reg = 0x1801c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1801c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_0_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_1_hf_axi_clk = {
+	.halt_reg = 0x19008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x19008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x19008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_1_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_1_trig_clk = {
+	.halt_reg = 0x1901c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1901c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1901c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_1_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_dprx0_axi_hf_clk = {
+	.halt_reg = 0x29004,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x29004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x29004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_dprx0_axi_hf_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_axi0_clk = {
+	.halt_reg = 0x1b008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1b008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_axi0c_clk = {
+	.halt_reg = 0x1b01c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1b01c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_axi0c_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_trig_clk = {
+	.halt_reg = 0x1b028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1b028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_frq_measure_ref_clk = {
+	.halt_reg = 0x1f008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1f008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_frq_measure_ref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gp1_clk = {
+	.halt_reg = 0x20000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gp2_clk = {
+	.halt_reg = 0x21000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_gpll0_clk_src = {
+	.halt_reg = 0x23018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_gpll0_div_clk_src = {
+	.halt_reg = 0x23020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23020,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0_out_even.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_core_2x_clk = {
+	.halt_reg = 0x56020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_core_clk = {
+	.halt_reg = 0x5600c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_m_ahb_clk = {
+	.halt_reg = 0x56004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x56004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(12),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s0_clk = {
+	.halt_reg = 0x5615c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s1_clk = {
+	.halt_reg = 0x56298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s2_clk = {
+	.halt_reg = 0x563d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s3_clk = {
+	.halt_reg = 0x56510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s4_clk = {
+	.halt_reg = 0x5664c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s5_clk = {
+	.halt_reg = 0x56788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(21),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s6_clk = {
+	.halt_reg = 0x568c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap0_s_ahb_clk = {
+	.halt_reg = 0x56008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x56008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap0_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_core_2x_clk = {
+	.halt_reg = 0x57020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_core_clk = {
+	.halt_reg = 0x5700c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_m_ahb_clk = {
+	.halt_reg = 0x57004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x57004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s0_clk = {
+	.halt_reg = 0x5715c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(27),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s1_clk = {
+	.halt_reg = 0x57298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s2_clk = {
+	.halt_reg = 0x573d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s3_clk = {
+	.halt_reg = 0x57510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s4_clk = {
+	.halt_reg = 0x5764c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(31),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s5_clk = {
+	.halt_reg = 0x57788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s6_clk = {
+	.halt_reg = 0x578c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap1_s_ahb_clk = {
+	.halt_reg = 0x57008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x57008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap1_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_core_2x_clk = {
+	.halt_reg = 0x58020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_core_clk = {
+	.halt_reg = 0x5800c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_m_clk = {
+	.halt_reg = 0x58004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x58004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_m_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_qspi_ref_clk = {
+	.halt_reg = 0x58170,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_qspi_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap3_qspi_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_s0_clk = {
+	.halt_reg = 0x5815c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_qupv3_wrap3_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_qupv3_wrap3_s_ahb_clk = {
+	.halt_reg = 0x58008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x58008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_qupv3_wrap3_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_ahb_clk = {
+	.halt_reg = 0x52028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_axi_clk = {
+	.halt_reg = 0x52018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_ice_core_clk = {
+	.halt_reg = 0x5207c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x5207c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5207c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_phy_aux_clk = {
+	.halt_reg = 0x520bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x520bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x520bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_rx_symbol_0_clk = {
+	.halt_reg = 0x52030,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_rx_symbol_1_clk = {
+	.halt_reg = 0x520d8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x520d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_tx_symbol_0_clk = {
+	.halt_reg = 0x5202c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_0_phy_unipro_core_clk = {
+	.halt_reg = 0x5206c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x5206c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5206c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_0_phy_unipro_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_0_phy_unipro_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_ahb_clk = {
+	.halt_reg = 0x3d028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_axi_clk = {
+	.halt_reg = 0x3d018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_ice_core_clk = {
+	.halt_reg = 0x3d07c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d07c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d07c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_phy_aux_clk = {
+	.halt_reg = 0x3d0bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d0bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d0bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_rx_symbol_0_clk = {
+	.halt_reg = 0x3d030,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3d030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_rx_symbol_1_clk = {
+	.halt_reg = 0x3d0d8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3d0d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_tx_symbol_0_clk = {
+	.halt_reg = 0x3d02c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3d02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_ufs_1_phy_unipro_core_clk = {
+	.halt_reg = 0x3d06c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3d06c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3d06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_ufs_1_phy_unipro_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_ufs_1_phy_unipro_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_video_axi0_clk = {
+	.halt_reg = 0x1a008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_video_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_video_axi0c_clk = {
+	.halt_reg = 0x1a01c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a01c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_video_axi0c_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x86038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x86038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_mmu_1_tcu_vote_clk = {
+	.halt_reg = 0x86040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x86040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_mmu_1_tcu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc nw_gcc_ufs_0_phy_gdsc = {
+	.gdscr = 0x52004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "nw_gcc_ufs_0_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc nw_gcc_ufs_1_mem_phy_gdsc = {
+	.gdscr = 0x3c000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "nw_gcc_ufs_1_mem_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc nw_gcc_ufs_0_mem_phy_gdsc = {
+	.gdscr = 0x3b000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "nw_gcc_ufs_0_mem_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc nw_gcc_ufs_1_phy_gdsc = {
+	.gdscr = 0x3d004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "nw_gcc_ufs_1_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *nw_gcc_seca_clocks[] = {
+	[NW_GCC_AGGRE_NOC_UFS_0_PHY_AXI_CLK] = &nw_gcc_aggre_noc_ufs_0_phy_axi_clk.clkr,
+	[NW_GCC_AGGRE_NOC_UFS_1_PHY_AXI_CLK] = &nw_gcc_aggre_noc_ufs_1_phy_axi_clk.clkr,
+	[NW_GCC_CAMERA_HF_AXI_CLK] = &nw_gcc_camera_hf_axi_clk.clkr,
+	[NW_GCC_CAMERA_SF_AXI_CLK] = &nw_gcc_camera_sf_axi_clk.clkr,
+	[NW_GCC_CAMERA_TRIG_CLK] = &nw_gcc_camera_trig_clk.clkr,
+	[NW_GCC_DISP_0_HF_AXI_CLK] = &nw_gcc_disp_0_hf_axi_clk.clkr,
+	[NW_GCC_DISP_0_TRIG_CLK] = &nw_gcc_disp_0_trig_clk.clkr,
+	[NW_GCC_DISP_1_HF_AXI_CLK] = &nw_gcc_disp_1_hf_axi_clk.clkr,
+	[NW_GCC_DISP_1_TRIG_CLK] = &nw_gcc_disp_1_trig_clk.clkr,
+	[NW_GCC_DPRX0_AXI_HF_CLK] = &nw_gcc_dprx0_axi_hf_clk.clkr,
+	[NW_GCC_EVA_AXI0_CLK] = &nw_gcc_eva_axi0_clk.clkr,
+	[NW_GCC_EVA_AXI0C_CLK] = &nw_gcc_eva_axi0c_clk.clkr,
+	[NW_GCC_EVA_TRIG_CLK] = &nw_gcc_eva_trig_clk.clkr,
+	[NW_GCC_FRQ_MEASURE_REF_CLK] = &nw_gcc_frq_measure_ref_clk.clkr,
+	[NW_GCC_GP1_CLK] = &nw_gcc_gp1_clk.clkr,
+	[NW_GCC_GP1_CLK_SRC] = &nw_gcc_gp1_clk_src.clkr,
+	[NW_GCC_GP2_CLK] = &nw_gcc_gp2_clk.clkr,
+	[NW_GCC_GP2_CLK_SRC] = &nw_gcc_gp2_clk_src.clkr,
+	[NW_GCC_GPLL0] = &nw_gcc_gpll0.clkr,
+	[NW_GCC_GPLL0_OUT_EVEN] = &nw_gcc_gpll0_out_even.clkr,
+	[NW_GCC_GPLL3] = &nw_gcc_gpll3.clkr,
+	[NW_GCC_GPU_GPLL0_CLK_SRC] = &nw_gcc_gpu_gpll0_clk_src.clkr,
+	[NW_GCC_GPU_GPLL0_DIV_CLK_SRC] = &nw_gcc_gpu_gpll0_div_clk_src.clkr,
+	[NW_GCC_GPU_SMMU_VOTE_CLK] = &nw_gcc_gpu_smmu_vote_clk.clkr,
+	[NW_GCC_MMU_1_TCU_VOTE_CLK] = &nw_gcc_mmu_1_tcu_vote_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &nw_gcc_qupv3_wrap0_core_2x_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_CORE_CLK] = &nw_gcc_qupv3_wrap0_core_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_M_AHB_CLK] = &nw_gcc_qupv3_wrap0_m_ahb_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S0_CLK] = &nw_gcc_qupv3_wrap0_s0_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S0_CLK_SRC] = &nw_gcc_qupv3_wrap0_s0_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S1_CLK] = &nw_gcc_qupv3_wrap0_s1_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S1_CLK_SRC] = &nw_gcc_qupv3_wrap0_s1_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S2_CLK] = &nw_gcc_qupv3_wrap0_s2_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S2_CLK_SRC] = &nw_gcc_qupv3_wrap0_s2_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S3_CLK] = &nw_gcc_qupv3_wrap0_s3_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S3_CLK_SRC] = &nw_gcc_qupv3_wrap0_s3_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S4_CLK] = &nw_gcc_qupv3_wrap0_s4_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S4_CLK_SRC] = &nw_gcc_qupv3_wrap0_s4_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S5_CLK] = &nw_gcc_qupv3_wrap0_s5_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S5_CLK_SRC] = &nw_gcc_qupv3_wrap0_s5_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S6_CLK] = &nw_gcc_qupv3_wrap0_s6_clk.clkr,
+	[NW_GCC_QUPV3_WRAP0_S6_CLK_SRC] = &nw_gcc_qupv3_wrap0_s6_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP0_S_AHB_CLK] = &nw_gcc_qupv3_wrap0_s_ahb_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_CORE_2X_CLK] = &nw_gcc_qupv3_wrap1_core_2x_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_CORE_CLK] = &nw_gcc_qupv3_wrap1_core_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_M_AHB_CLK] = &nw_gcc_qupv3_wrap1_m_ahb_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S0_CLK] = &nw_gcc_qupv3_wrap1_s0_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S0_CLK_SRC] = &nw_gcc_qupv3_wrap1_s0_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S1_CLK] = &nw_gcc_qupv3_wrap1_s1_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S1_CLK_SRC] = &nw_gcc_qupv3_wrap1_s1_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S2_CLK] = &nw_gcc_qupv3_wrap1_s2_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S2_CLK_SRC] = &nw_gcc_qupv3_wrap1_s2_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S3_CLK] = &nw_gcc_qupv3_wrap1_s3_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S3_CLK_SRC] = &nw_gcc_qupv3_wrap1_s3_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S4_CLK] = &nw_gcc_qupv3_wrap1_s4_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S4_CLK_SRC] = &nw_gcc_qupv3_wrap1_s4_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S5_CLK] = &nw_gcc_qupv3_wrap1_s5_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S5_CLK_SRC] = &nw_gcc_qupv3_wrap1_s5_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S6_CLK] = &nw_gcc_qupv3_wrap1_s6_clk.clkr,
+	[NW_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &nw_gcc_qupv3_wrap1_s6_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP1_S_AHB_CLK] = &nw_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_CORE_2X_CLK] = &nw_gcc_qupv3_wrap3_core_2x_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_CORE_CLK] = &nw_gcc_qupv3_wrap3_core_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_M_CLK] = &nw_gcc_qupv3_wrap3_m_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_QSPI_REF_CLK] = &nw_gcc_qupv3_wrap3_qspi_ref_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC] = &nw_gcc_qupv3_wrap3_qspi_ref_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP3_S0_CLK] = &nw_gcc_qupv3_wrap3_s0_clk.clkr,
+	[NW_GCC_QUPV3_WRAP3_S0_CLK_SRC] = &nw_gcc_qupv3_wrap3_s0_clk_src.clkr,
+	[NW_GCC_QUPV3_WRAP3_S_AHB_CLK] = &nw_gcc_qupv3_wrap3_s_ahb_clk.clkr,
+	[NW_GCC_UFS_0_PHY_AHB_CLK] = &nw_gcc_ufs_0_phy_ahb_clk.clkr,
+	[NW_GCC_UFS_0_PHY_AXI_CLK] = &nw_gcc_ufs_0_phy_axi_clk.clkr,
+	[NW_GCC_UFS_0_PHY_AXI_CLK_SRC] = &nw_gcc_ufs_0_phy_axi_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_ICE_CORE_CLK] = &nw_gcc_ufs_0_phy_ice_core_clk.clkr,
+	[NW_GCC_UFS_0_PHY_ICE_CORE_CLK_SRC] = &nw_gcc_ufs_0_phy_ice_core_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_PHY_AUX_CLK] = &nw_gcc_ufs_0_phy_phy_aux_clk.clkr,
+	[NW_GCC_UFS_0_PHY_PHY_AUX_CLK_SRC] = &nw_gcc_ufs_0_phy_phy_aux_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_RX_SYMBOL_0_CLK] = &nw_gcc_ufs_0_phy_rx_symbol_0_clk.clkr,
+	[NW_GCC_UFS_0_PHY_RX_SYMBOL_0_CLK_SRC] = &nw_gcc_ufs_0_phy_rx_symbol_0_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_RX_SYMBOL_1_CLK] = &nw_gcc_ufs_0_phy_rx_symbol_1_clk.clkr,
+	[NW_GCC_UFS_0_PHY_RX_SYMBOL_1_CLK_SRC] = &nw_gcc_ufs_0_phy_rx_symbol_1_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_TX_SYMBOL_0_CLK] = &nw_gcc_ufs_0_phy_tx_symbol_0_clk.clkr,
+	[NW_GCC_UFS_0_PHY_TX_SYMBOL_0_CLK_SRC] = &nw_gcc_ufs_0_phy_tx_symbol_0_clk_src.clkr,
+	[NW_GCC_UFS_0_PHY_UNIPRO_CORE_CLK] = &nw_gcc_ufs_0_phy_unipro_core_clk.clkr,
+	[NW_GCC_UFS_0_PHY_UNIPRO_CORE_CLK_SRC] = &nw_gcc_ufs_0_phy_unipro_core_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_AHB_CLK] = &nw_gcc_ufs_1_phy_ahb_clk.clkr,
+	[NW_GCC_UFS_1_PHY_AXI_CLK] = &nw_gcc_ufs_1_phy_axi_clk.clkr,
+	[NW_GCC_UFS_1_PHY_AXI_CLK_SRC] = &nw_gcc_ufs_1_phy_axi_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_ICE_CORE_CLK] = &nw_gcc_ufs_1_phy_ice_core_clk.clkr,
+	[NW_GCC_UFS_1_PHY_ICE_CORE_CLK_SRC] = &nw_gcc_ufs_1_phy_ice_core_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_PHY_AUX_CLK] = &nw_gcc_ufs_1_phy_phy_aux_clk.clkr,
+	[NW_GCC_UFS_1_PHY_PHY_AUX_CLK_SRC] = &nw_gcc_ufs_1_phy_phy_aux_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_RX_SYMBOL_0_CLK] = &nw_gcc_ufs_1_phy_rx_symbol_0_clk.clkr,
+	[NW_GCC_UFS_1_PHY_RX_SYMBOL_0_CLK_SRC] = &nw_gcc_ufs_1_phy_rx_symbol_0_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_RX_SYMBOL_1_CLK] = &nw_gcc_ufs_1_phy_rx_symbol_1_clk.clkr,
+	[NW_GCC_UFS_1_PHY_RX_SYMBOL_1_CLK_SRC] = &nw_gcc_ufs_1_phy_rx_symbol_1_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_TX_SYMBOL_0_CLK] = &nw_gcc_ufs_1_phy_tx_symbol_0_clk.clkr,
+	[NW_GCC_UFS_1_PHY_TX_SYMBOL_0_CLK_SRC] = &nw_gcc_ufs_1_phy_tx_symbol_0_clk_src.clkr,
+	[NW_GCC_UFS_1_PHY_UNIPRO_CORE_CLK] = &nw_gcc_ufs_1_phy_unipro_core_clk.clkr,
+	[NW_GCC_UFS_1_PHY_UNIPRO_CORE_CLK_SRC] = &nw_gcc_ufs_1_phy_unipro_core_clk_src.clkr,
+	[NW_GCC_VIDEO_AXI0_CLK] = &nw_gcc_video_axi0_clk.clkr,
+	[NW_GCC_VIDEO_AXI0C_CLK] = &nw_gcc_video_axi0c_clk.clkr,
+};
+
+static struct gdsc *nw_gcc_seca_gdscs[] = {
+	[NW_GCC_UFS_0_MEM_PHY_GDSC] = &nw_gcc_ufs_0_mem_phy_gdsc,
+	[NW_GCC_UFS_0_PHY_GDSC] = &nw_gcc_ufs_0_phy_gdsc,
+	[NW_GCC_UFS_1_MEM_PHY_GDSC] = &nw_gcc_ufs_1_mem_phy_gdsc,
+	[NW_GCC_UFS_1_PHY_GDSC] = &nw_gcc_ufs_1_phy_gdsc,
+};
+
+static const struct qcom_reset_map nw_gcc_seca_resets[] = {
+	[NW_GCC_CAMERA_BCR] = { 0x16000 },
+	[NW_GCC_DISPLAY_0_BCR] = { 0x18000 },
+	[NW_GCC_DISPLAY_1_BCR] = { 0x19000 },
+	[NW_GCC_DPRX0_BCR] = { 0x29000 },
+	[NW_GCC_EVA_BCR] = { 0x1b000 },
+	[NW_GCC_GPU_BCR] = { 0x23000 },
+	[NW_GCC_QUPV3_WRAPPER_0_BCR] = { 0x56000 },
+	[NW_GCC_QUPV3_WRAPPER_1_BCR] = { 0x57000 },
+	[NW_GCC_QUPV3_WRAPPER_3_BCR] = { 0x58000 },
+	[NW_GCC_UFS_0_PHY_BCR] = { 0x52000 },
+	[NW_GCC_UFS_1_PHY_BCR] = { 0x3d000 },
+	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
+	[NW_GCC_VIDEO_AXI0_CLK_ARES] = { 0x1a008, 2 },
+	[NW_GCC_VIDEO_AXI0C_CLK_ARES] = { 0x1a01c, 2 },
+};
+
+static const struct clk_rcg_dfs_data nw_gcc_seca_dfs_clocks[] = {
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(nw_gcc_qupv3_wrap3_qspi_ref_clk_src),
+};
+
+static const struct regmap_config nw_gcc_seca_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf41f0,
+	.fast_io = true,
+};
+
+static void clk_seca_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	qcom_branch_set_force_mem_core(regmap, nw_gcc_ufs_0_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, nw_gcc_ufs_0_phy_axi_clk, true);
+	qcom_branch_set_force_mem_core(regmap, nw_gcc_ufs_1_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, nw_gcc_ufs_1_phy_axi_clk, true);
+}
+
+static const u32 nw_gcc_seca_critical_cbcrs[] = {
+	0x16004, /* NW_GCC_CAMERA_AHB_CLK */
+	0x16030, /* NW_GCC_CAMERA_XO_CLK */
+	0x18004, /* NW_GCC_DISP_0_AHB_CLK */
+	0x19004, /* NW_GCC_DISP_1_AHB_CLK */
+	0x29018, /* NW_GCC_DPRX0_CFG_AHB_CLK */
+	0x1b004, /* NW_GCC_EVA_AHB_CLK */
+	0x1b024, /* NW_GCC_EVA_XO_CLK */
+	0x23004, /* NW_GCC_GPU_CFG_AHB_CLK */
+	0x1a004, /* NW_GCC_VIDEO_AHB_CLK */
+	0x1a030, /* NW_GCC_VIDEO_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data nw_gcc_seca_driver_data = {
+	.dfs_rcgs = nw_gcc_seca_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(nw_gcc_seca_dfs_clocks),
+	.clk_regs_configure = clk_seca_regs_configure,
+	.clk_cbcrs = nw_gcc_seca_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_seca_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc nw_gcc_seca_desc = {
+	.config = &nw_gcc_seca_regmap_config,
+	.clks = nw_gcc_seca_clocks,
+	.num_clks = ARRAY_SIZE(nw_gcc_seca_clocks),
+	.resets = nw_gcc_seca_resets,
+	.num_resets = ARRAY_SIZE(nw_gcc_seca_resets),
+	.gdscs = nw_gcc_seca_gdscs,
+	.num_gdscs = ARRAY_SIZE(nw_gcc_seca_gdscs),
+	.driver_data = &nw_gcc_seca_driver_data,
+};
+
+static const struct of_device_id nw_gcc_seca_match_table[] = {
+	{ .compatible = "qcom,seca-nwgcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nw_gcc_seca_match_table);
+
+static int nw_gcc_seca_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &nw_gcc_seca_desc);
+}
+
+static struct platform_driver nw_gcc_seca_driver = {
+	.probe = nw_gcc_seca_probe,
+	.driver = {
+		.name = "nwgcc-seca",
+		.of_match_table = nw_gcc_seca_match_table,
+	},
+};
+
+module_platform_driver(nw_gcc_seca_driver);
+
+MODULE_DESCRIPTION("QTI NWGCC Seca driver");
+MODULE_LICENSE("GPL");

-- 
2.47.3

