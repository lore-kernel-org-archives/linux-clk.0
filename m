Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1376F28136F
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576542; cv=none; b=BMOCGaIZVuFn7Wx0sQOG9+BSteHc6Deigi2kgym4t0OZG9jXihLOMmDQDVN/t0l4s/3XykhX95/MZalnz2Mg7heyhCFSTFSG5uHoTGKxU9odxkmzUetwdiK2qsTCWv5QgKlfqn8tSKoYhYtI5KuKetWoOefuYySBJ882+dD8Dew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576542; c=relaxed/simple;
	bh=RuwOw3DAHE/Y2QWOnS4biJhtv9S/TCB51Bf2DFn+Z0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gL5TwYcsv66Yl5w1R/KzRrE49HiPMVtBJTxF8G38pjQ6s7JqvLZ75o01NfRtiFJ8K82C0Diy63m0H3U+5s5+udbWMJCPZA1RczyLI8+1/DQBQqlG5ncifP6AaVdXBd0MyD4m1oqKieXY3chGIg2sSXBTGCqKaUj9+u9KiKS7oBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buMhrigV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yoe8ayy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buMhrigV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yoe8ayy4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8KIn4721901
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o36W/UCDfdM
	Lf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=; b=buMhrigVH4ZDUFDrWpm+HEANSyS
	ldTIrLwuW88+WwyQut3wdGNdZndgnO+SOvmBJxyP7/bZPjeGVMivrqmU7hIBlYMh
	fK9ugs0UXN2IplbkKRu5KfjRdypxg6jdG8V7QkHXfDSjb0i7z2guIbt3F2iNv7T4
	PahEUx4Cg04Xt/c+Xm47p0q+wxm3qeeeTQ/ywjPVDer/TZFb7u/lgljNcSM//RWs
	UlpXi4gbWwQtr4K74iZB2jmCWFD15POKZHT0XHJJVbyuefAqSj+rkt8MqTLcXlYO
	Kmst+H+fToS7rSrMdt9csgX5YSVnnNeM7C49zwDx/lcBLpl5EBsTAKkpARQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta459-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so162642491cf.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576539; x=1767181339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o36W/UCDfdMLf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=;
        b=Yoe8ayy44qsRGwvPe+2P58CJdS5neu5jtPxEYz+wbsliYRkP/2Ooxhuj9FQ4hwPyWp
         aCsb9tgSlNmyRCz/xNlBOim6cT6Tm26GmRy9rMBehdrgRT5ci4w4UOVkQ9ew9ExOX3A/
         AazQk2ad8e0BqpO0yMK58vodRNjZBGxyXwpciceLk6pWCea2SqTSPcBrgTXvjLQhjRvX
         dk1fdRrLX1u8hERxOEC1nS93ModZPr7hevWiNdJKLqQXPil6GsaGQArUaL8z7qA6VFjq
         VbP1yI816XtuB1YuWxmPMqvT0Q2GyA6MUZxv2pVCRgKijsPvH40yK0bbrWwkDMeV8xqW
         3NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576539; x=1767181339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o36W/UCDfdMLf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=;
        b=vAoJMXZmQMrshR7uKMkhIPBy3+EbQpag4sk2F3oeZ0iQdpdxI5mB9/zmmqmX2UKctD
         LKibHqIOaXngZn8TQ+2t/++K9OeIsHx2sfSulgI3Tp+4Z9vUwOnTjJcfHxZyesn14A0l
         e+GfqDPS9ZM38/hEKs0rn7ixByLFf1YzHXYzRf7YfSvWCW2zLGa0fqAUav4qGM3w/gAw
         JlspGLTGci7oev9VdWiFgQL/6mWGLiXUARu0RZeaTjPcGKDSAdTB8kBzDgL/wLJXb9qi
         YcHtqjHvT2N3DLqaV5G+AVSEMZRWEwIaUeWUDWASXPevOfUI+K94sPnFQP9/aob9D2Ei
         SHVg==
X-Forwarded-Encrypted: i=1; AJvYcCXRPB6M9BgSrgNppybxQScv/c1xFPjIc2ctROAuRDMKWXGpLn0dVdM2KO4MQe7r9+08SRE2nEEZKn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fQT91OeeXZQKw//IVfMgOqxsclYARzMZrUAprAji5Qln/pI9
	/xy8t6sbPFr5++BCDG82+fnM7W6MWT0ROLxaJWJFNBzggCQxTgf4M5yjrl3ejKrtfUwWiZ9d2P7
	xneoHv3UCqJL2Dt74dxDIwb/zZGEYvpn48QEM+rQcWnxXQS/B1lWCyRIy5mvOmx8=
X-Gm-Gg: AY/fxX6OlgKdJslhtWXAO/2P1Vz/GkeJpL4D585hcKucrZ76jJYheBfwRrBt2rcHzQ1
	JDNdi8EtYLI9ot8TD3IdH81+GbLvPpgFP4WvBcddWXByoREUsJsiHAzqloDg04IMXxB+Jb+Ogzv
	/T/zOpbfdYIovtrSsiqlbsC/HZGXtTy3XEf9J/rWv5cRhucl9SEnLK2MGd8tBt2f/X+cgbC9njZ
	yQjKoXVGf28xV1j/uQEBEimy9bc3vaE/RVE/GHY6f1n8+Sf2r2QPqwqM47JljOcPiCf1U9M5AIY
	Z/UOfEqxFVLNxZ3tQPIQAWNpQG42ppUlUr/RvVLYvjohPstkYdIPxzSZd9wO/jrldtT8MElUsOV
	vSI7MKQ6BDeRMi44OxN/bPclaBhRRmHgWqmzXmQ9624htHFJg8zP4HEtcwg8iIjfjktkUIw==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr263159491cf.49.1766576539266;
        Wed, 24 Dec 2025 03:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI4UlmGlu0MWAVxKPogR63RT71nHEFMEspnUNlDF8ULNBFqE58DEi7/oDJNk5A9lg5v8vC5A==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr263159281cf.49.1766576538846;
        Wed, 24 Dec 2025 03:42:18 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
Date: Wed, 24 Dec 2025 12:42:12 +0100
Message-ID: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RuwOw3DAHE/Y2QWOnS4biJhtv9S/TCB51Bf2DFn+Z0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GT6UGXyVn6co3YB9IIpVrQAKiyF3irFAvdQ
 NTfPzvs0BSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRkwAKCRDBN2bmhouD
 1zZBD/9zbcAbN/j9Ty/PuH0sKooc3rFnFKjPFG32zHcTCdoFfNwJ66T5VOYPFWSo+DV2mn00XQO
 h4VHFLSMmxcymj/zHUvw4JsmymhKUvCSN/4BMzzrOpsmRshlJTqSqR/RdlzOy/tHWxIQeNRFYM1
 5fBCDNWuW9TXj4v1G2P6bcMddxcvUnUwmf+ElBwHXu7mJYBgnPlibQQpiMwhDFlijA9ZEtbUUWD
 K1pHN6Kb5vEGTq+sKpKI08OxHVI3KaTYZ3hBXQBmu0ZeGKp5RON0xI+I7N5DPdHZn/UZo9FD5we
 XePjyZFsFCTMODj3iQ1ykYeQ8yzeCEg4Pb/Squ/vEBTwlINlonJUGJJ0daxgoXT5qW/OyfNhokj
 aENHYVgiz4jR6OJiQluacWOaSFOpNcCOkpTjztPQLD7LA42y1Wg77LWGge3jo7sfcxgviiWU5PN
 fnmarFtfhh5zg/FcOYs0UaSKgYikIBrjiw+harlE1WS3p26QMQm9JpaGdlPMkSb7I/iOS7rIiGu
 vSDQrR5AYq2BtdnTciKtQHSRgIUVuAIscvDlGcJQfzAwkb3psYkSeGS8maH+2PFFHwoaKODF+ct
 QdLeEZ5V+3OWewJtSSCzWROVycMi3OuRgcS+46K6UudUNTr0HSlV/tHD3sr6ZdY1zw2yKln6CtT jkFN0gbT82ZPXig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bd19b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iRxSLFVWlc-pLDnZHRAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FXymQOpzpgzugpDQwJvIoYmPPXzLhT9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX1alNDylIP2eN
 7goKtvWmWx4TcgoGZ1XIMxWiv1y3SFb44HeejR+gxbuwIaMXovkqGcSGAd9WRmYkVsHdS/8G8QD
 RjOX2dHiXhi4bun72yEJUvm5VkzGfEqJ28gFTvNmR/loVeut+AtuHYBTDILZtb/OKZp2c+jnPas
 lqculncR8L19hkodFXpOrjXeCOZYdZemFXUWTK6lzCurzt9tCYfgRQkF0juwCvqVtPBbJKNVkUH
 MvMUk4ac135mbqWDwZ1HRPwOb3khFvlvsdOyTHatEF3kXCyz0wBCqtQbNtN5a0AUx02sdCWS4CQ
 EyWXTfKim4OUVsmcTgV6vl2X2eLezRzb/wgY+Zl72uEabCT8sRWgvDMdSVUOyRoKoWSvBzUv6k6
 kgqMwVPPxoPEGtW19g+QIfcnwTVO3xFafsJi8TEX5D5lJYh3I3lj7/cLWRhARxJep2m7fKnGp+6
 LxJ7Akc+PoVCB5q5nPg==
X-Proofpoint-ORIG-GUID: FXymQOpzpgzugpDQwJvIoYmPPXzLhT9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101

After renaming round_rate->determine, kerneldoc does not match anymore,
causing W=1 warnings:

  pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determine_rate'
  pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype was for zynqmp_pll_determine_rate() instead

Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to determine_rate()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/zynqmp/pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 630a3936c97c..6bc2c3934f56 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -91,10 +91,9 @@ static inline void zynqmp_pll_set_mode(struct clk_hw *hw, bool on)
 }
 
 /**
- * zynqmp_pll_round_rate() - Round a clock frequency
+ * zynqmp_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
+ * @req:	Desired clock frequency
  *
  * Return: Frequency closest to @rate the hardware can generate
  */
-- 
2.51.0

