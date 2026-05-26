Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C24255F28
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800115; cv=none; b=re3C/Yxalm6aWjk7oGQysf+u6fYTbNw8Y914L+oNMGeEXgcb2IHgJbCaXapXrl5vv/p2t5YsJL5iLa0IydT7HOZMSNXiqYknqqHZivJaEtgINTdhs4rE2X645hbyQLMhMkaiylX54qlkqWUb7KSSrQKeXx0ClSRlBLsjdeSfYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800115; c=relaxed/simple;
	bh=E8K8gxQ/TdZcVbxk2ueWju5PhjMe1cZYpqIaYJ69NV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnMT0Ied2geLXZI50Z7uwggrGi/HH0iUb9A94Ee3ptBy0jbKLiwf65IQpdLLd3dpnvv0rfYcesdHLWdD+AR6pdfJz+oouhuNSsMIWIsbcBgFfy+/1pdiKpN+s/7dHBD0EvBOj+bTJu6NGkLXYVOfwuhjeJCNKJHsJej7lESoCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYzDduqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5R9Sruf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYzDduqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5R9Sruf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZDh1575457
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=; b=HYzDduqeKyoKFnef
	aQL+jikR0NzEeR2p6v7uww8wiqvzHTqq0Bdr+V8zRPj+rODUaCVV4gH6WhGzLgHP
	pMZf2mm4DeYOznyOLqEkpuLVHCqb1gVWOzyMoWgUJnC2tId51ikemC6ZVy+b1cDp
	lJXNeZphzr6aXS7GrQ7RCVyw6gSeY4qKbgepbrb57vZyr9z5tWxcumUBIkJWukdx
	Q999OQzBtjg8KhlCconLXbj0eSyp1nOFks7eOjlGYZl/5RikuQpGxN16ECXZlcP9
	C4MGlaMGIQh270qd5T3IsrCGiSn+eu5XmH7GQMIa6HkANDWsXL7tk+Jf376dcpn9
	llIITA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwv1hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so113506015ad.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800112; x=1780404912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=a5R9SrufMIq8eUsS5mApyR4ccDFN2R1MQelqV7kmaWkB526Hv86aVoUh+CBsff6jqM
         iSh+Eqz+9ieI/ZrWhrskuOGkl8tayjQRWpzlk9qo0YaI1XdDEzjakRk1JXkaWdehpRhW
         StT5/h2moZkovJCYA36W0s/4CwihTM/RFKQRSKCTJQ1io6uva+WOoRZNzamNly/9NXtl
         b7sUbBwW5KuGp37usrRJxcNDCZFXXfEV0eqPgxY11aM1uY4+Wk59fLMNy3zszEI2gKy6
         pUEe5zzqVu2WIvLHqn0gfNh0M8Z7PUVthNjPIO/wvuzRxBQ8gNSx1v+FZI9p/WblYKCm
         mkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800112; x=1780404912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=PJaOa3P5kFiWPq0zeZ2z/iuCfeaLonOjMOV/XS+oB9+ADJVYJjEUYcVKz5auXFrnMQ
         3MZCZ5wGv+OuskYXO3M9Esf6MWyHwZ+ivCjBmjdwoPXQpHIFyxodacCfIw9ES/H7JaU8
         lSPbKSza70uY3edYsdlHipycoZqHtMml+eoJ/Ni2MUbWMgk3BDxPt9Fz08wMG/13C1cF
         NxF6MIcq+SM0UAJDsJGyJsODjBALT3GjoNhAhqa/9dt99wxxSXkdhu29LwVKrUAfJ4zu
         GwIZFMVvzwFJpNZcMUw85DOBekQerPMIzWJ8Oi0gYgzYJ22t5FXsQeMTNGDODsiepGIX
         wxzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dB2QkeKkAmOToCsV51B1luFmfqG41/dAkqvJYhfe2jGdrJcQXQ5TYusQOok5IMkxbtPn5mfosq2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08g7Mu3GcRJykQHpsE7FOSF7TQjz/OxB2EDhscCfDJkII6w9g
	bXd0GptI4u6cmHN63LIT5ujOt/UWxPszVmtKyDHY4kf/TzTegSYsS9iZDICyBdfSaH5FG2aYEM1
	MoBkIW7divDo7C2PYoSeuqBagKlA8utTVHcUDz4ayKn6oNthLXHqEao0txojyFNc=
X-Gm-Gg: Acq92OEj8fmY+PrrZJXkkBghwRjZn34WbKredXhrdTPjYAp9fT8zoie15gy9aNmNrcB
	swqBxddLmBY/14U3AtLlmeEQN06nhRIum7NNP/M0lq6lW6crKMa2P/wYAC6kzNP2WoFFblJC+O0
	uUGScvF74tdo3VM0JBh0rZtmvX7ZKjZetSQ71FKJixVeNPxWgz8W6OTsMj+8QJZs/5FV0xsEShy
	CDVe57/AdmCWUjLtgwP8xpSVb0o7s6aQiC4T9D2m6+pJezud0YqpIHBpVwK1KmR8dHgW3JY64zN
	fhzagvhIfTq25xo4af04JPUs/SBwC217OqNqlf+acFO3ld2rQgJ5Gc6Nm6wPaEtp7l1l0SWVxVs
	nfDQ8FyPDVqvpSSfkwnH4uIUDE/MP4zlSCTvp7yXtW8dc+vhzGTAw
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191747215ad.6.1779800111725;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191746875ad.6.1779800111285;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:10 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _p_1qw6jpjufMwvhA9Ny9eAvBSYlAXqs
X-Proofpoint-GUID: _p_1qw6jpjufMwvhA9Ny9eAvBSYlAXqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX28pPfytNqD3V
 oc5noVvi2oOBtd34IaaixAWos2qd4Tv8NCqCnch2LJr2nBsxoJ8eX8yMNSpM8JC2ThYACUFNfVI
 62X5FoaRHwWAnpAtvzYPT5RxwND46gxim9DpFHW4IoCMBXMdMaajpPsD2LalVjH0DqXxyWPeU7H
 zIozHHQhsJiSOYLeQeWiD5Eucl3AJTBOM4ZmyuePIXhSIQFzoTXticKVo7FwlvfxKV9wO3LMTO5
 ETOLRYciFMKWVpd4dOeJwe0s5AwbX1CXQAlKz4kP8MVk7OI/PxABsr4Ea9kAoOvLH2+3ERZLMHx
 mB36BDc1AGBbh4N9YN0NWKaqw/pxNjKEpupEzSVu55UnG4H9jr+WQPRdCv74CFAVPSMqTPVMGHN
 2YiakL4j5gBQJrKEtjk0LxILjC3kV5hOdjJnZHE4edmurtOyJ31GU3cyURymDRld3hFkp/eUSJL
 2qG0XY1Tm2vYsQiQlBg==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a159830 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=T5k1B2oZpLT1qSJ_dCsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260112

Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
 	[GCC_VCODEC0_BCR] = { 0x6d034 },
 	[GCC_VENUS_BCR] = { 0x6d018 },
 	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
+	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
 };
 
 static struct clk_alpha_pll *gcc_shikra_plls[] = {

-- 
2.34.1

