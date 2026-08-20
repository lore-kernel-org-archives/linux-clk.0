Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7B40B6EE
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220528; cv=none; b=YXzqhQRXrZ6qLfrZjr8rZ0nQSnduzQ2Kzpm9bC1T92xRk61D2XynSWXfErscbrekzqqHudmnmLk012rvhYTzZEKW/f77HG5fUyP45LFdtdeLcPavQwUnuM6QN1JSr3N7wOsD33dM1Ts3CZhOc8fIUJjrOhTQYjnQkBLHu6kHaik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220528; c=relaxed/simple;
	bh=69EYmER/wRYHxroWVPhTseRMEty4J4R4DEbNjzgmx4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdDeUvZch8rJSYA1/KJz9w4gGFyqyPGZpGoLRpigpixwuHiq0MsF2r83iENWn6xrmWCAYhYdW8yH/ccXzoM2cWxYTiYYNHB4p9Hb07jllCo+dZ7fBI2kvFYoc5DqJD2j+oUv0Vxmo5Mo25QNUxl8RfFRPRLLvrKYrfE2G0cxKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiLFARs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glDiipKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiLFARs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glDiipKW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6NHaF490435
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=; b=CiLFARs+j2VlQvRd
	8PK3mfDOrfhnwTGWnVFea/iFT32MFq8lXj0LhEXw4AljHtsd03NBKp7v3h9F/Wza
	6oo24Tg2AdCLLsk0hZX0Eb+5BesIUXTdIbHUzY0ry/Tacnk9tZ4WT6ckfTvAuIqa
	XtYF+0sdYtAqEjV2ili27h90havq6vHQeg1etzlOU7mv19+RUxyOcGC4jFk+eu0f
	34iTkgKZPGCL17hP1YW4GA1iW7n71uhyxYaXs+keroCU34i/w4B4IVY3V1SDV2yB
	jghJ/DIXqmThI/xPaxwsr8zZbR9gFGTbkLSDyZIEuQtW2JblZ7W+yqAqTHhvqyxp
	oi0xfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervmcxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so330424085a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220518; x=1787825318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=;
        b=glDiipKWmJbxGTCeMXkooaTLIsJ/iuMIEe51MB46a7QBh6jfc0t6XUDU7TOfkV5zPz
         sTaY/w/ZrP8n3hWcdJf5n1yoeE3r5AX8PfvQAgfySjosyhwxttVIsxmI2FgYR5QPnsiF
         BFbG/QZmFRoAhv2OvAGjR8DwmhPrWBQgy1f06nFJtL4SFKD4vecsu1IbEFu601vzLf9W
         xi6u1uREMZWBvquK7UJYr15gdatUFQbdLLSZuuqD0ELr8ig/83nXBWV4dBkxmq4T97XK
         RuhYlahxVl5W0ZuftQQbru+v7malMfPIGc+YriA4dIwsJp83yHFisFE29dGKFWJAzvhz
         QJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220518; x=1787825318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=;
        b=VH9S7/+xMB5mjjO849C1mNdYfUe7QwBBlPhESkiwrtbwVT7n+fFLY6EACNHXZnlYNf
         Hjuz41/GDyv6dC5CiZi5JO/Kgyzw4/BH2pbgqgHbOyUySZCGt8FZibqWZ5TZS/hi6H7T
         F57/R+XOFkJQqIRnFu+MkKLkCMKs+mv0kBYwAtXiFDzMOrjZzN70jPa5UjEvE7dLwk/P
         sBDYcW+7VLs0IIVG2ubdbDjIImaS+sU5kFd2+LG/XDf8N/HVk9pbc0cQZEpUgXVdnnaU
         4hF4IxunghdgvjVkWwFp9Rvf1xTW+spTuQqyDgaTwsNDrt2Cncjjdkue/Dxs8ZL8/0OJ
         z8rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU9nyo8qEGrAMepnOQUhtJ+3qXdewxLD7hBE9p+9JIINAYsagwZibOhSUoa2H472Vqrrrl6N7ozaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC23Zd0shHXt0XYa0a3rcyDfuts9hjjo4tbl1W90R2Mjv/CBAU
	kpfoWYHtw/xwh0RNu2tCwILP5EX1JLOsSqngu4iV90IAdeqvqDjA8HlBo6c+72nmVEcML2ZWWao
	DapjasX10/KIXrvMuX6zMRQT9LI3kK8yAlFiPSeuw3bR9PurmRfawB56lYzV5Rzw=
X-Gm-Gg: AR+sD11PlUx2sLhmJ/r1omIy07vPx4/Mq1rWosDabTSLEfAbv3JAPXo7iUERFJI5Dol
	naWIhkwryTuORwLovf4OvaQ+X/eGbmby21A78h6sXqMjT49AapU4qOOzUd4WLQvwvkOiLLP7f4a
	LuWXvhD6P+Sf4eRcKdPLxZ+7m4KBhpQdzQeTKNL89qXjSL+M00BEOaqQuyXD/Ig20RJT2X1sMYG
	UqHwTFa9ny7Atoowj5Gxv26wz30TAAZ2WKJ4iLbJcS5TKj77AY1R8rJBXuJ4yZ4L9v9nxPOCfbs
	x0yOuLPl9fm22uvBg8HyVYBdV09vautexlEICeqHu3Eq/6K1gs6FogZwdrV7GRZ+xPiLIlMaI1P
	zAAq4o0Ro
X-Received: by 2002:a05:620a:28c6:b0:930:f129:1a45 with SMTP id af79cd13be357-9371e2ccc34mr1085909485a.30.1787220518280;
        Thu, 20 Aug 2026 03:08:38 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:930:f129:1a45 with SMTP id af79cd13be357-9371e2ccc34mr1085904785a.30.1787220517788;
        Thu, 20 Aug 2026 03:08:37 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:04 +0300
Subject: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=69EYmER/wRYHxroWVPhTseRMEty4J4R4DEbNjzgmx4M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHZ7BzeuiO0ZRPMYzN/OucaVTSTUcO/WQgmi
 ZW3tbSrFiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR2QAKCRAbX0TJAJUV
 VvHdD/9JZRF6rbmu+efL1lo8dvTA+btyAIjEY2J4+o+f6ET/NM5IBWC4SeiFFM6Eu8Cjtkj4t5x
 lC4UYkJl9rKw3M4Hq2DOKZYNj843EZYHTqn2/n6Bf8lyoq5b+SK/87g7XUWwrBuaVpFEPSYnGGS
 /taOI3M5kzEkOGC881Yu8dbyd18ZopxfFPZ1aPYO6vSx1qgD4P7yy2eV+lwZc8wwYIrCkzoFJhW
 Pewu+3UOK3KCSb7DV2fsNKR4/8DrG9M4H+3csDWlQbKhmX/ZsZIvzgT0nmdYs4s5I97FzaBOqLX
 HdYKD1cTekO8D7bCqa3gWfg6GX1ldkW9Tl6ZS+1N1yd+RRCYmBTYdxiM/PFiz3dSuMNJR7KAmCe
 uG2l3whw68zbhLfRtk2xkv6CxbLPvtY6EbH5feeutXcAb4s0myxTme3uKnBCWwS1bUkOeJTTv2H
 SEJVV0p1t+6oDtKB/oU3V+edBctMU1Ksbj3ceDrGun1E2c1F3nbnOufixJIUvsVYGZjMUAoZ52Q
 wXGjOCngO+a96Devhj4juiGuXhNooOCgl6oyZyJ8FK2jZ5iTkaXnztVEHoJm88FkiSnqtz6yjxw
 aXFbmrfd9TEOMtFNSH9z+qnApzRgbGs68n+nwNZP4CoGKCTnqg9xc3Tx57vRTLXnmElLzbE5wye
 TatiTLP2Z9yS4Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9Lg-_4JeqGDcVZEuwf-5cFHLKISKn28a
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d227 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX475oStIVyWnz
 n4cbMQl9A060aJm6/Tbc3uJbDWNfwRS2Qs/X1K77HUnTnmJHlm3+q/CeBqhlWmlKVuPKh5vGgax
 YTLky5rVwb6LXZoBTE7MjtgLu2Jfxq6+H9QzSpQyyw4lqgp3SGgrezux5V3cx/K0b6ibHSAfY2j
 3xWqkutgPBxhrReJPlByW8Q40pYjX6FGtLDODR/kZmyHpSM9XEv4q94rT2dTnfWmwYavz+sHU1s
 HKJMCDyWMGmnjGfrowS8mQoQJpvAiD/6VzVCwFvyS3Lc69zcwESHi3AUSw0IhMmoYvm2Z4pDeVp
 TH+BgSIMAVRyAXSMktr9p261L6NcCmdi5TCgJFOriJlW2/Z8H2l4IAeiRbVq9LOxSd3btFNSowe
 w4wY9fNlo/ECeB+FjVzgTMc6lRL5f1Z07L19v58weWwloXRk+/MbFGzpIPnKTwWo2bnG2Yyft4T
 GG56LcIparJ4W40uQgw==
X-Proofpoint-ORIG-GUID: 9Lg-_4JeqGDcVZEuwf-5cFHLKISKn28a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX8QWpZ6DRnx3a
 2XieR45wtzmpeX/AMGQogQlLsZNcpk8f4q/6SRNcsVPncnad/X3mcdQDYMgAStNoIUsTMYL6MVu
 UXMwxQivmHpl4ivi2+BQsVUDVJkWZ+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..86c2be3804c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.resets = gcc_sm8250_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
 };
 

-- 
2.54.0

