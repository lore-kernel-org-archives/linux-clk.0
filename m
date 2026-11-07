Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074821;
	b=BBc9/H2uBuAHHVJTcqVppGclr0ux64NOzUAVAa5/6Lx1146SBjmXTFWR9PTQiHfGsQHX
	 QkYD8YxxvKsE4f4w9kbUxKO9Z1GUARyIkgJc+ckdLpDFa1pOWMf1nHExgwzzRIVehKFNf
	 eD5Dxm9t6vjYd01yI+rH2NkSwwaJ/6JvL3mKWw4hijMA/WeqJY8xZkY65a93rRcFsk9IZ
	 RhfzwZ/OpjTaZlTF7Ro6a15e4Bc7lL5WAVZl/G6yP2l8GhJOkbSO3RNyf8PL3x+dFoEan
	 u0XYRrxvFRhMRfMQlrgwxAWavPKGExYeGp/HxZHga7QPmYUXUBZXUQv6sR6LR/J5Amg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
	b=1U2bhu7MiJQRoD2/z2kO1ubQUlasiDn7YIFe+IEqyEIWac4pJlv8+lKZuKbAGxQdEZAF
	 s36Nyi8gJTCcmRysRI9jlToJe+D/0YpKNxSDeBMM1Y51RlNtNetiYa1mD54Ret0XMVKhK
	 Mokpl6jWVfGt959ksdQJq07RAT4ubKntt2It+ACBZEshbiJEMDhKvZBCK/39nxH+9BATC
	 78M72kNmm4nDR42Gu7gwKJqavFzDVJUtU6jyNneWgzz7/CvUhDGX1Z3jsZNy1Ngfy2/hB
	 HO6l+//dFhzpfBgge57MFTk7jDdNsSJTHzhJ7bXuArDkMlVuoI2adesxyWwXwnWi9DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF07606A33E
	for <linux-clk@vger.kernel.org>; Sat,  7 Nov 2026 18:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF07606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Hsur02471571
	for <linux-clk@vger.kernel.org>; Sat, 7 Nov 2026 18:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=; b=c+FXOOV4P8LCuKF8
	9DYVHgim+w3rFMHfQZByV6EWS4my2MLU79ycnaWLfTibNV4kZP6snIGgMcgficp3
	2OWyTSVCusxJScLN093/538olFGoYQj1QjEd/l9wyJNZeDXwvvD9Mf7RjDLSIEog
	BOMLEMwMPduVZh86DZXVs6GGqa58mKk1YGEIcQGQ6FXRsaxeovfvBgSLktGvDpEi
	hn5rl1xW/uraHscCYLqUYqLh0VcNMyhIc3sOfyd7NHwkx6w4O3r0DZiYbg0qa4Vb
	lm5yn3QXem7VZUx8QLiNYi7J9QRDYaxC5CO1IldcdBRj8N26sLrRQ2nlrt5xmbaX
	lav3Mw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99h8rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 07 Nov 2026 18:07:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso5318011eec.0
        for <linux-clk@vger.kernel.org>; Sat, 07 Nov 2026 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074820; x=1794679620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=YlVXrR18NxkBaSkupYMNuhlH9Tgln//HRUGwg0z8PQTW54gRptnACes8sPbqC1NGn5
         U4Qy9RpyZFuRhUvNORUUX3ZKxHSg3agXbNMF3vtDzaQgPWgNs7Jhfy61PWOjbu1OUX2E
         /+FiPrxOd8nxMu1hvpGAyj4B9Ru7CBNinapIOajlorjdEsUradNfzMPIbWaVgNZSR6KK
         h2fM1moWsOqe0MgfqC4sme0QlI9KhKgs9yzDwmi8wpTBHxt+D2eR3aF5dnPKkA9nCqFK
         tq9Zc7ZT7EAT85Qkhk0nwQ0OzKqApBt63le6x4dX341cimKPsbtH3mZIaVaXyDy1Rjua
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074820; x=1794679620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=sF7glj6/VfvbE0r1twxjaI7v+IGQDYEm14t68ZROfc/srT8c3qUNuHHZfNDHlGrgi/
         nNm52kGQcq0hsfChfSXdV0F5723y2/KWsFq1pSnM7TrQq5LzU/xDZJxaAhFXQp0V7dL7
         1qQYb3wWLopyHCffJFfT1FszQ5T78iypemS+Ba1O4uZdCYw5Rph97p5U0b0WmDlG0HVF
         //nRRdWojApXnE21kIDoxr3hWjiw12tfyY/yHLJgkF5t900GkAf2hUkqLNzrqekUkv5p
         ueei9SfUMIY9geZ/XvZDXgd3qa2JxGSAXLyFGPRTVgAzHhcEX7WdtGAD+RYSjb1nCui8
         0dFQ==
X-Forwarded-Encrypted: i=1; AL+hErEY8jfnHsHkHTlpPWWf4FxRQg1tjep08IaaoMNJkva2/eOtrnpHzoeZcfgx0CAKPgV00kn5QgPVmJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+efwaYdiIyUyYlWLjqqws29grmPZVM5LuJV510QkxWMVgfBsEf
	L3K6//rstGA1PS2VG56fERtiuTpAMdOiDpV6XsLyK20fyn84KY8MXx9YNuXG8NTUzZCMpmJa+x3
	ZMrs+G1yA3/5HnIIJ9HwY6IoioXqc/o9vYHolfGfOW3l4SUWKz+ViF8o4xQjmAIQ=
X-Gm-Gg: AYBFou3/LakCCwNpdAX91S/En1zGvLtPiTHdhlJosnexV7Q1ha0KZbV6ph+F2DllqCo
	yR+KEemCAPXWsxQbM7pfnmJlBMqBDswf24fXjXOBHSTZPbfjjW7yKLaUEqLp2sQCu6pJTQ8V+A1
	3grSs9uLX/vW8r5IqBuGKIdTxtVnzyqMdJoFRGRXlloTvEMBhB77tVHv4XHD/ldr5j3pinCzUif
	4ygT/GujrrjhXVFOwHxI5gm8pvMbNIVpyHfCgZ/rAKWy8jGZz8J5B9Yg03AiV5h6EteijYqFLz5
	iSIbjoWrPkcI8CFZIKC9Du7rU1qFbd6PZdmianvMa+U0qJsjfIuBsSfiLMzVIGtRD3AZd3rcRvV
	sutvBOAiO+/lJheVMbHBeKEodPyi0jekF+Pi/6YGhwK50Zh75Hne+dFaiTIUf7uYOS8tikId+
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067076eec.21.1794074819344;
        Sat, 07 Nov 2026 10:06:59 -0800 (PST)
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067032eec.21.1794074818692;
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 23:36:36 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks for
 Nord
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
Message-Id: <20261107-gcc_i2c_tsc_support-v1-1-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: sIBb9S6d1Xm-NeE5771Mtfk3l4sBzSy8
X-Proofpoint-GUID: sIBb9S6d1Xm-NeE5771Mtfk3l4sBzSy8
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6aef68c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX8EVhVvV2PLLZ
 XxLeWT8vCbmvoCwwyy1c3WwyAM9zU4MY3WB0/a3v0LkTc5f6JjnV28e7XQxEMA46RBlbViKNjNH
 59l9oKtTHFsJw0ArzXkciZUkFvGAlwecwYe8lB6hzMmx/8Nw16pERdfXiKZbvRSt5p42jOfBC0j
 t3BTbyiaA9gSx6+XfZlSS53chzl7/WSgiLnkJ6XkCxztxgHedKejA/YsR9SeuruAO0FWeB4Zm5b
 iW+npH0to+rQJWpan0AomFY856b9EuduNqLQCOT3TfQsmY4V1cT3ihEhA8TVRAP1Wh68YDW6lXM
 tI79Y9ah7+aJJMqiUvgv6frOpnT8qoKtNbbWy3iQJ5wjhTRieqF9U3Rs9WRANpeUZp4/r5Hs5KN
 c5CyPe89Lo6u3WBq3GZjHxgw8M7ot5oHHu3wKd8lzHE5yj2X6mT9Trrs+lyIxhM1ZWkvmMQcAU9
 30kV7Di5zQ3oHZ2i9hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX5li52NIuRLKa
 KiwZC3CSq3VJYmZMaQO60arcUIOJtCp6k7OM4XxFZ/0J3nldYoTUEB36HLeaFFvRLN1k+OYGhoV
 r1bOgssIvzSiAht/8dHca/siWV9rqb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..921b216103da703818fae4d4a572a6a5288e1513 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,15 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_CNOC_I2C_SLAVE_CLK_SRC				79
+#define SE_GCC_I2C_SLAVE_AHB_CLK				80
+#define SE_GCC_I2C_SLAVE_XO_CLK					81
+#define SE_GCC_I2C_SLAVE_XO_CLK_SRC				82
+#define SE_GCC_GPLL1						83
+#define SE_GCC_TSCSS_AHB_CLK					84
+#define SE_GCC_TSCSS_CLK_SRC					85
+#define SE_GCC_TSCSS_CNTR_CLK					86
+#define SE_GCC_TSCSS_ETU_CLK					87
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +105,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

