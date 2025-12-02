Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B259F25785E
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671207; cv=none; b=YLf7CCeXZlWeHJIUSm6F/X99rh+qEyMH1Cl4EI3J76xuc8xIx6ajwMh7+dglU4uH9SPEtN66/rzXFPHXV5iVogRiyj9TnAq9BSKvjBnVegc4uTCNU9ojPJI4/IpoJeBBM13MBeBRIxjQ4e66yDK5Yi7uiIoO0tyoSXQLHHEJC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671207; c=relaxed/simple;
	bh=XVnP1fisO3gYA+mP9TQejhTGNM4CXK+qwk0ltQTW1M4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjQiD273fN3fin2mjH3nQ7IbOBbaWxYfqpeO83P65OE+LN0CMp2wzHTcdWPDfTfEAasPX0+UuOQ8J8QY0kp0v+3ViShVgv1XHVDh8MkyIZbwg+qTPzvaoa+O6BFsUktmNHqrLFdkUWrKtbpCwEIgiGVPlNB8devKVTzyYpI6xt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd5RfVCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxFCZG/W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd5RfVCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxFCZG/W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B29kKGH1090571
	for <linux-clk@vger.kernel.org>; Tue, 2 Dec 2025 10:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VrUz8PGW2KF5hQpyTzA1xT
	f3mo1AjxCZZSaanbzdKYI=; b=Dd5RfVCognEcboKe8lyMiN/Xwm+gtb21hXd2S3
	CettWgI1R8CpOnDC8q5dSOv0JdvF0hRBOUooCagXTcF1L7iGaOQjw5IHsjAV4qlk
	AIcZfMllxeGUMJSwYPkx35b48gkMB+L+cgqgi3QKJp5AB52+zNBNYOSDtwsbRSoK
	4BHhVVY5pu8/C7qjhnzF6ga1ZDLMrowENFNUucyvUrPqR994t597ALSEnjvq/ImY
	aZe2CHtJ3k/b6g9e5rwjs0K0ashcXUtds8zXvViT5dvQuFLlxmwuvkPiXgpypIHC
	SjYxLdbcKvNr2WapMwwNofu8JKKyFS0IYJHYHZR1fFskPORQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu12wrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 10:26:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so8143526b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671203; x=1765276003; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
        b=UxFCZG/Wy0vBOuWkrNnmVumyRfRLN63lZpgZWAN2MVNXqc4M3WOjK16G5baETkx8k1
         NLQv4mRR1lHSZyXE8C77K4fFTxKdzgOanMwCTHEKMvmEzAHfbHdzCZhnh2rS4/6k8YDX
         5N5aYvUIFMk8DABNHKJTkzJhz38nZlY1Fe1kcFupFyySk4FeH0g5dQjRQl80xt+cl3+R
         Z0bZIPHPoP3AGtij8gw4mw78LppAsJVQFVdcq2yuYLTrAUMgIiJhlyCnohgBrdEpni7w
         oqU00lococYTfQ3qNngfqcgmC7RZYGov9OPqF+8nSOH/tbQrwILpZ0bROePzcQCowYow
         hzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671203; x=1765276003;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
        b=hrEzwkAJUmNxvrQgkZPP6W79HrCKUqHeB66E1QN++OBv1i0fL2gsv2lub3iCo7npOw
         PFgqYM3eZcXs+U4Hdj+a0QhoMWmwwEtbDml9Fn5c2xpYMqyXlaphMstzgFlO72C0D/Sc
         htwtwrQUJadmTZTheN3eUJXxsT4tR1yDfTooW/fc42NjLcs6cEi9Yw355YtGOBUpiCpM
         FCbdTnLYdLZ+Oyy+uz9ORg/q5Wu6+LwTEBdUoRuF/Bl0dKWimGRj6Vss5JrQeNgCn2+W
         OWSjvT21UCwQRB5hv+1YIipwLL24YrYfWEK7/+pUEnLHgDK0JdMphboN/8hE+BqqUgGK
         HzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVnAZPvC3RpWQvhzoYTiRL5A6u4xFnoBQHwiRPMqPaBVVxZZeIfPXnunQ8CjPbiL9mXU63SeMCsEC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGQMSb71Yj9HoJ9eegaPXLvOwipYXJD5gTMEmkDHle6nuLYuk
	kvxNAf42RvBIyNVr6hz4eSSkdHPEjKDaOnOhvHFoOcZZ1U5PKOvZD7MgTBk7JwYVfPArWsTb66u
	yVkykak8xQAwssv31marQLxtYVP7Xy6MQYG0cr+Z2+MwtR/YS5dosdMQ90S8iaDs=
X-Gm-Gg: ASbGncuVza2+1IXcQjx5C8y5xdbEIjQBt+YH8I7lMq77jh6rqLqX37NWwGHtsePOoFQ
	DDLzjXHH+UvyuBGO3Dr+Ea57XUeKgqmgxYAPsbTydZONY/ChYU4zxwaoNNNGTkUhLdPvkjLmDlL
	tj5qqQEFFteFf0rKQDvN8oYmSRgrLs561hWONPqxpiBJc+yIqdU2K7BWrayEVAj7jsnCk4ZNc7K
	aeR+MFQJliuA4iRvfCU4+rq0Hw4Ls/xRH/06/9iq0DB7CxHxT9J0dsbDWN7wyhTB81qQE1Sxchy
	svI9rt3h0TNVukhoiUGVklZ4Lzx0udFkJTcL3GWy5FSFFy7bNi2d6bZJcXxmdR5Y2llK/5zVvty
	i8dQZyNXQa7VPiK4PM/71r8w8Kzu6wyutWQ==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id adf61e73a8af0-36150e2b4edmr46198291637.3.1764671203418;
        Tue, 02 Dec 2025 02:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqbxAi6x2C16q6RSb0ek1+DoOM9LaefMRtdRnCp29pa73Jqf77f/0+GtRe+Jn5R0eGnnhL3w==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id adf61e73a8af0-36150e2b4edmr46198272637.3.1764671202970;
        Tue, 02 Dec 2025 02:26:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:26:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] Add the support for SM8750 Camera clock controller
Date: Tue, 02 Dec 2025 15:56:24 +0530
Message-Id: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANC+LmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFbnGthbmoQn5yYm5ysa2RqmWRkbJRiYWpmoATUUlCUmpZZATYuOra
 2FgCGaOyxXgAAAA==
X-Change-ID: 20251202-sm8750_camcc-259b232d8560
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfXxuUFj8shaSm3
 bfC7ftN/FB9o6ZPvlq//vxIFf7l/a98mcWSfjXH8hPInNp6a6pmOyzgeeqtrldPJ9k/sQMIzSgd
 V5QCsAG3n0TOtJX9/Dsa6nI/fLLPS3rImFh2ka2kjTozsjfU+0rlI6tffqsaRoMYyuCzynJG2fy
 kyO1xxmLsUYoovKrlUAfY0wX6BgZZzytIdMxyRwmsWcdMlXOhd6CYEEQp6+kJ3gH/2+DO1Y8x3Q
 62AJ/MeSzvLeWqlKrd+tidwfWL7dV8VhWqcge/HOomfQGQsclyA3OydJV2BvEESoiMWD74Xhalx
 SHFgtOR36d8WTQiIr5LtGO0rvWuw+Qi3O3LPLj8eB87LaquSGpZoALUrIY7k8ife80kbzn27TEC
 ULj0QR7ZdjjFllUlD5h3FyWY4Mi9UA==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692ebee4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V3dEWrsxhXhpuwuaMIQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 0Qq3NTQP61XFfASYNXrsoYk1OV-DRHN9
X-Proofpoint-ORIG-GUID: 0Qq3NTQP61XFfASYNXrsoYk1OV-DRHN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020083

Support the Camera clock controller for SM8750 Qualcomm SoC.
 - The camera MCLK BIST clock controller, which is required
   for functional MCLKs.
 - The camera CC (clock controller) for managing camera-related
    clocks.
  - Additionally, the Rivian ELU PLL is utilized within the
    SM8750 clock controller, so support for this PLL is also added.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 ++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   14 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    2 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 ++
 9 files changed, 3377 insertions(+)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251202-sm8750_camcc-259b232d8560

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

