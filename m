Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9C4D2EFE
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821579; cv=none; b=Mo9uHeFWC/3Rxyh5pTDLTMrCqIgNS8AW1NhMlnkCYAZ/hOM2U1eflcv9YdgLQo1WgjrJZW/hEP16yU2/4aqvchBhjRZUeQjILJg4m324Wk10wCA5UBm1NImpMtuI3RSVEvmUNp31kXC+Ctrz/4rFAhB8wZpRRy053/ufPnJQbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821579; c=relaxed/simple;
	bh=3usl21QCEfGlb15Z/9fJV1UfOjLgGDOlhTwfEYuJuKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hC0KcQ8BHaktSW/N89oWCMfVRwqtEgqNPVB6qdaSyVEM6u3PqY9AG2MtUQqbeXv2f3K88FHwlrBuTG9RdwRJgCA10nRjzY8iixsS2+v8wSeDKl6DrLl3DiJ5FOQuCwcZ2ZPVeYBTEYrcPzv5HO1sgUSxtrtS4r0waIp3cmcpSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaTfCP0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPAQ5gcV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaTfCP0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPAQ5gcV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvd4f038297
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=; b=WaTfCP0md1kDMiHb
	pGCB+1D2vZOLaLf7GOfqLiEBaJqjD7HG3HyqUdYIh2i7M/l+wFYcLe4SRBgrvRKu
	89VOb/MKvaRkSrFRreuQmNGjQ29IOw94pEQNZG9OsZbPtImJBfQwLRn+1wG8VoBl
	K2nC+UqzvzlxOSIFANquPKPYeMxoaxrWZ7GL6yi5B1GyO9ZI5lxGeHxJIWdAM75k
	b9QZPiZBwnvZN/36xEgKjsmr99mfxsrTFFX+/31T8LL8fUbwtS4D8yaTMIL7KB7C
	R6+CBKDYMzN06brRCihmlSJGKwwZkelSLVJEoxnDf2/TSkebUlOXPbZ/8eCI1783
	IPTrjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc45ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so19277775ad.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821572; x=1785426372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=bPAQ5gcVzZODHX3n54+SnWRjDPQ0xQGEsPw/gkpfCRtD4b6mVm/LyTOrQusI6ahW0s
         K/NPXlbhQQZyIEbiVem6VPQEqv7dp/Zm92WmVspFXljt7lSOE6VlfQm0nhaQSamRSoKn
         MGr2udkAA3QyJJwKMKcuTCu4Y7ZUe8f960vbG2R9a0c2ypWmYKHfIBdcnWMUqZSSM9wd
         IHW1Sg0SteDhdmrOFFkfm55wbwLmaAXz80+nW3/xw0xw0PxHD+bK11xtmXlNFaoVDoIB
         knROwF4bli3bWVBAl9Tiq/1yTBW8YZ5zY7YIulnF6J4XvkXoSvEpxO7arozPj4TPZlRu
         6OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821572; x=1785426372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=aJ82BKwLFPGFdQJVYb+ZlBd9uDZoS3syb8V09Y0dSiafi/p4gsrB/eX+dE4noA6q+S
         p8AJ2nZ9qzhETVvP7mKtJkOhEaUileGD8Zn6bH9AAHCaHs9VTgM6gTzb+iCgCArAtdgh
         owapgWzhIuxsQTZu1WG8CyKqhC1CD1qO4BRYLMzfQVCCwEBKgm/OouuV83ubRduIGxwZ
         ykvivnP0Td6tumebmOUpe6F34gz+UqKkjpgdO/+dO+gIVej6ZI8KU0Nzp1OWazDduYC8
         Gm/2PoTGYN/F+Tp0HK3vlERs2Hj4dIVKkK41tQyxik41K6O6nog9FqlkgrbD/lKNv0zS
         Y6ow==
X-Forwarded-Encrypted: i=1; AHgh+RpAWxyGgplaPuLMI8UhWp8zepMkqs6FjFd7fa52LmXtLWin1a+mVL2yDk9n9d/DGbzCLbDsCAxcLMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3t1tFTz4Nwdk3cn7n8KT78ERdqWNot/8YYTwqMBBRsmaXzJBS
	xuB33avFzWwPerDskL7+aSx+rq9vH05Qry3KSi3QIdhD/5ZVupuB96nHymLEGpep05S4XgbGQe7
	WYJJbnfAe+VHnwKyzu8OAh/DdBncOkg1cqiSayjw3pZ66G8YHrCX4kGLfZvDe9UI=
X-Gm-Gg: AR+sD10uzoVppBrrPY3i+92DwJ2qvjRvAQKoSF8t3+yVpOjycmgK9qpYnI684dbPB8r
	oUN70YaV/w1yJJcUWZO24lu4S5Cx3zaKx54BPB79Cl+/cy53F/KDPS8BFC5MTAVDaAxcg6vXQgi
	KPagX6I4JkQyCp4a441XfTcVs5vefzK6Q8pbyecPtm3PzCCQXXjQOJ/XSy1FvwwrvBxA6YDrAro
	uVcDlwyro3JyoZHR1YdFQK0APXfrxTuV9+hc5EUR+oIsD4I+MFufIXDnOnuUZZoo5nXjkQaE9iY
	oiF2PIDJlReOKg5d3H4BbcM3iBr4bkRXYtMuafslc/oT2+AWwnqhF+lmwuJ5SUdlenubvZt/SNo
	yRStQ/0LHmzcoohewhaB3jwd7U/g3UIg=
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100415ad.12.1784821572121;
        Thu, 23 Jul 2026 08:46:12 -0700 (PDT)
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100095ad.12.1784821571557;
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:50 +0530
Subject: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: jEBvOVZpQ7ajOmE7GkAicrt9CpXlcFPz
X-Proofpoint-GUID: jEBvOVZpQ7ajOmE7GkAicrt9CpXlcFPz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX+dOe3+E9nAps
 HEc5H1PozF8IU10qYbGDTFTOTUXuhiOd3q+6EO9wgC8MJUmx/Xj+9DyF3YAIMxmHZSoOqZjjolb
 d8iMjf6sykgPWxXjjS9dMbTeXUOfTcE=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a623745 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX0JGxD3RMCZuF
 p1r/1a1lh8a9sJyCTw/9yKZabzo1tyiesVFTUxpGnuqtGiwiG1ji4/0IWoprt+ZJ+5DGS12g/Ob
 wAXvMnGpAyypvbw8EemsQVq45hSQhnnRBen/s3ucZH+XCeX76+MeCmuVbL3vFeoOzd9gFT7pB4K
 r9ZhBS8qWpyXEIgndCxyigY7JVEavqxBcDmkk/jI0psteyJbpZgAqIy9XImC1WQbKDKZVJVX23a
 F4UmhF4La6YVOwA2mEl0U1AI28FF1lCKeLBmKZ8Xt6vQmdTQm6cdU5/XZea0MxRbhdVgyv76ozo
 D6GSgS0Nge9LC2t9ASEKP1wHQ+LTEeyrSP0EHxIvgFcHLQQ+rm3M6c3P5iBpu9r02lE83H/U12C
 6CwZ7IZmIncTF1wiqflakiUy1TVCRj3BjBAmCkpz0UpWdzVuL6xYccetpBu4CYCHPfC2+wuTj9Q
 WjXOt6aD9/xxV5TUZxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230155

Some clock controller descriptors do not define resets. Avoid registering
a reset controller in such cases by checking desc->num_resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1

