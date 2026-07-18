Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471D38330B
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379423; cv=none; b=u7Gy9/0HzjMRYrFwGBxh3lVUFiIySjxfOo76K6ilyosQVrjRQE1aqF0KVGaLfEX5ag1RNEAEqfsmOBp4tOfaQAZQnQIrOEJbi2OEYUNoSiTtzPL1XTVaCVhLr2qPENWvDtFZVIEQw34wlsq0H2W/x++jq1CcE50oAUQ69u9jcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379423; c=relaxed/simple;
	bh=JEaURC2GAdKCpgplPXU3Ks3O5o4wm8ukuVJ+QKcFKVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PY1oHHi72WV5ppLa+Eo+R85+nrIiN6sLSkfW9+v60sL2osn/tZZGrfvqGs1k76NXwv/9T6YkCYDw5KkamS5pCu+VzuxM8NPK6oVyGUvIvXfR1i3fCy+lHyR6sbxt/IF2yob99XUBaNZApIWWuTniBT+fujE5TcHfsCssJHiRc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI3SbZ+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM4SkcG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI3SbZ+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM4SkcG0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHAJg1489957
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=; b=TI3SbZ+mmehC4mLi
	ti6yNHOFTHhL6kaRaxMmK7rwgGdWz/AciVvrur7MqlwOUd2sGh+6SziOOx4ffyHe
	PlCCxxT93iOHIDm4vi+gTVp046GvZEKG7xCOeRKsVLltqh6FEU/Cmj0KaOyBYDUH
	cS7SY/Gr7C3fcrdU0On0ZzWLzwpMPkEzSmCtT4kcfP0dKydbrHkReGbcTsy+N6pE
	gxeXXctb+G5V+u2Ek3ROigKo50ZsCUNNtGycntzTNYIzwq4qvkNrHSHbGpWeagpD
	sOPRqT3MAwkfIkt82vBNp+DMPv4fNqbfg3+CgI+32bvB6g+cmfDv23h/nChp9jZn
	kgmIwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aarsk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso153003125ad.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379421; x=1784984221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=;
        b=WM4SkcG0weEwkGHA7cBNdw1ABExgjcRdkVK6BGlzzeFaxPxFJUkDaTeq53CAwUF7v6
         SzW/qUMiLbbaaukt3MLQwBj8lwv9ZgkS7JVPz9w5SzYmE0KLLUfnn6yCx31vxUpWt5lS
         G/Mz1nIr65CWspeHz6p/Hc5xPJzAM1PHVn++KcXQaWQfbZ06lWdxcLnhzm5lMhpyQcve
         D5ci/sesEKeZYCsRekpVZrfE1TqiDSPvqHBA5sj97dQV6VKRWD+MR243u9DU0Hxw3407
         LlWA3kONQ1BiS38ig0V/cb9tBUAsb+T7ATr4OBD1EZtuqbkgMtZsym3z4mWQ4Qhx6Qmj
         wZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379421; x=1784984221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=;
        b=a1MFiMPTCD2nrxU+Wj+mSHSgN8L0SOJIs23X0b9TQ8/99iipmFDZNsD+SMai6afRvh
         jAppaHjUe/CkGDBbIMAyfsnnubD2WCBo/KHxZcdruA/8wzQMf1ney0k2gwL5BtDYsgWW
         VZx9WWkUQwUgdgmOv1+1n/oizYe9e2EGQNkraitZE9FxsoIhDE9CddFp4Ee6zt+yQ2Aa
         BkIwAJED7Y1HokoedkFGAl2F1oYiXe52gRKmsIWksNP0udWYxcPaA6g94vL8Sd6/Opl7
         noL7hP7ckDEdqtLOq6r48IMpJ7t7bDYnTVLNxGzQXXSUgqK4AljMYKNlVxMFw5R3qJbC
         h2WA==
X-Forwarded-Encrypted: i=1; AHgh+RoOHoRqzvPnGgEf1+HWdUqLkLjljTmWm7xYhGdoGWdL6cjMQaIRlEztGNbjcxMMhQDZ/AbpbpLefFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWahsgLFYfsnoCwXyT3KCMp0MoKFF21Ib/NgRs+ay0tM3nCBX
	7FbkDCAY6xy3y1maAHyFPybJzWGfce95Zxu9DiEnrXC2LOyjVjX0CZ6r9EYZfaf2wi2iERw/Ivu
	i/n3NDsn/9IHkVxjdknfQ6nt2oBQv5Q1wVlMAOR7GlIrcofW/hzifdJgSP/U81NY=
X-Gm-Gg: AfdE7cn+SBNSRtf5iBOVCnv9Jlkd4/34PguW9/WiVrRMAezfHsBrbw2bhtw5oCGI4xX
	sAXoktcrr+ZYJHFM/W7e0eZ/sFUqRnT/fa7rLwq2gqViMov1OTlvqb9oN4YXmFBSpHUPDGFP16M
	uN+2SQ6+AOpgMhb+xrg0/qShPRieB+1fk5TW9nlq+o8OtBgap/t7ooDD5ip6eIu0ABvCvHZEhzt
	UahTSru8ShhlzZsol78LR5Jo5u9YtbmcJoVPzYnm6q/9BgzVrMRBn59vSJeAl/7hEPdy9aHa3gk
	eTyEuErIXYGZLwC5UQsjhoE/lNIIOocbFoqsrke/nbrhCRvA/l8rshJMYe3ZkXQSd79tpwR2bkW
	rDJ+WXyqpZDsoTsO6BAUum65azfv3Plw=
X-Received: by 2002:a17:90b:5543:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38e4b516631mr6802362a91.27.1784379420889;
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38e4b516631mr6802336a91.27.1784379420459;
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:13 +0530
Subject: [PATCH v6 06/16] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-6-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 7yne4q1QGt9eU0KFZRl5Vqo_vPbj96nB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX1+R5TdAbA09S
 mBEaRvVpiEfwb0d3N7Yfecl/fzBwCzktnyfeQz/xnD++bN77YZlnuKqQYqOxacO1qIrgucegSGp
 1vb56is/D12PNYIkQyrGq2X03ujKuyw=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5b781d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GcpOkd73Y67OKsgM6LgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7yne4q1QGt9eU0KFZRl5Vqo_vPbj96nB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX2Xdu1I/fak+2
 IyITk+6mncc6D+9YYoiQgtAwXOY5HkCg637ulb/hqigCZas6QRxUEaqmqhhv1gu+fT34VnUoDV1
 vHMCiQsiVV7kLRgdB0Qiz4FxFk5WcQGK06nUKGvJn/f0Akap0pASCpWiyY71JEftriiKNqXFGc0
 kQnVKFEFmS4JpwJPqIQcm478oO79+yL5mqyW7zH4GhKFRnfb2FkzY8/WSEC+hgcX6JF9zISU4sC
 3fMsJKg5G3Sr8fZCzqgomyGuEvKJrhaXicxq6PGzhsj0jtCeYzh9TPydD6MlzO/ms/dPN91mazO
 x43pRCcUljwjfNpiz9G/9pNTpjGlsQYU7Vd90xRqIubQN4NHbCQcxvZuTkV7AZ7TAl5YpcFPSEr
 4piGUDhAPp0f82WDne5K05UIYiJGhprAACYhpTsQKDsORYlDqlelp7zn4t1NQSBPvNGzAI5QnA8
 W8sHXwrhh51b+I5+Rig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
the register context across GDSC power collapse.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 5f5bc5b1e09e2207466d2972ded91140ce8a6ecf..1b796698dff5abf50e57d90b92a6a429ee078e2a 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -455,7 +455,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 3b130f69bb93898ce49654f2366851a7c1c94524..8d397cadc86aaa1666e27c8c4185b9b3de13cf94 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -300,7 +300,7 @@ static struct gdsc gpu_cx_gdsc = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

