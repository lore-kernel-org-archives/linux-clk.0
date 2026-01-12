Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650221D585
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183951; cv=none; b=nq1S7ppGINqQzp1MIQT9hszX40bIG1lSTI7SpRg25gGbmZWm5wn9A2FUYpOJNT289VKzBARI4UZd37kGaxngjb1RgYiSNhpluGDLPo1ytHMa3wIQyFQqGpr0c8s7i6WaCQSw0n3GKi9T+rOL6I45At+yi4ImlCEbK8cDL34LLY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183951; c=relaxed/simple;
	bh=2BlhUsS4xNMTdhgfx+eAZEQtXcOCqdzdPpjVk1yHH+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=huqagS0Dkf7Cua3f/KATECNkSYdRvQSTBj/MtG5Qmggvg6fCfLLOzSgx8quxje4Q+eTAkbdb5uxB6IDv0PpgixxtAcQrcPyMdDFWqdYoMx8zRKlUsDAj4yvw9GVl9Z5xdxAxtOGB/shQatfE+pbrKuRlHUHrtYKDomICv0dK1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlnDCzrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpLwOoLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlnDCzrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpLwOoLw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BH04dO2443039
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j85QxI24ViGOOXRBcvaWOC
	hh8mwsIkwiVf/oKpO4hF8=; b=GlnDCzrDjnd4XMhjl2vfimEy9TCJm5QC8dZSvi
	VsH5Fd1e7hFr+zs6jp2/MwuSqx8PFNQKmyK4CKbrJBFmWnAMAccWQwhA7YCB3rPQ
	ysBjmdXJsAcHsWhQCY+YqeLA2amfvfImDDH2exh24sYmf5kuWYl3ims4cqzPKav9
	6HVZ07hCRaITnR6VGSojntH3NsjbUkfQkCCgH95Hyp5SIB1lF4zZ/05h/XsciCIA
	+lv3BVzAJ1xGEp1Mrv9S9qDUzFG0bBfBjnPE3pbcL0JCebgU+UNAD5QiQRJb3nk9
	qp+of8teXAdzYeJSzFUIemF0o/wVypYMVaGyUxDARNiq+wGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57b5na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3a245d0cso1527295285a.2
        for <linux-clk@vger.kernel.org>; Sun, 11 Jan 2026 18:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768183948; x=1768788748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j85QxI24ViGOOXRBcvaWOChh8mwsIkwiVf/oKpO4hF8=;
        b=IpLwOoLw5sgYsWy3iI/dTUyEJWDrLvW4m7/OZW0r5kI/M5fQhmOTWvT4DF6FmNCFD2
         VTNPmre/dCv6sjeYZM2APNdldKZVrDX/+Jc+k3ho3NlpHzRMuE3vEYnihWljhVO77Vx4
         Um4WT+GczPGZpKYtCdXBNgmdE/0TVN3mSdzrhwuJa89IHRfm0eQKs8dsL/SYh/krCBy8
         VfpSlD8j50aikXnmnCA03zjImtHHBbN8j7r74JBuYHIeE++S+lTendHGQ8PMCjC/LBOE
         J0ro2FSsnvA/2AWpAu2IgDC7xSHex1+5h5oYpJ+GoX40YCoaPRU6zkpYcMHcqkkdd/Zu
         wZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768183948; x=1768788748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j85QxI24ViGOOXRBcvaWOChh8mwsIkwiVf/oKpO4hF8=;
        b=bqOMpdiQ2IHnVnL8p5s3o2bQBbjIy7yhQh+528saHwiu0DDiFoQZwte+MsKthQdo9n
         uI6kiD1+JYOeFTcrl05qogtzoYGZDxnzqXWiAnbrBWYGYsImkkakiAZfXFqPurcvPGM5
         q6Y5du06XLyJwnA0sJWas6yXlaA7Ej6KLc/mAM6XKFQOd1dXN7o6FWrx5risct6KnMRP
         M69XNFI/LhaIy4+1YQiWgmEJjxsFAMsy/p2/75UtzROwoqFwqAvIc6yoPopU+BzurDLQ
         7t6FPgp9e9GrXkYaKtL6N8fPDM/nvgUZ8EAODOlJMZxzHodkEjJRsgsaZ9ZAjRXiV667
         OZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmEiceduDk5GzAs+OjtotLPIqsxqqHdcJcErlIWx+h+IeCn39hI4SvdEa9WWgOB+uqdD3tszT1XFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwctgsEIwkfiRG+y/rf6lEAfocduMND2NhmLeVnQyBNI9e5YR
	jJJqfqlBEDBKSBSQN6FBZet2sHM9WJvg+Z2/tId0sCO7anBo/oeBSxPfGq6JQGqsMWFINlSron+
	hmsCv1SNc/Yp07BOCKrBjg0v7CvgThtuDLoAuxRbJzgzDhYonhKlIWHEAIfCjrM8=
X-Gm-Gg: AY/fxX6G5S9PgK25PORxMu9dWZeOEagQZw02AU2LsU8uRyuuRCRGFuEZ+bGWs8hg4ff
	kbVFGeursZTTJj4d5pJp+XVNKvzb0YqLWUjA6WbJy34tS9wLY2sjXoT93mV4Qr7tK07ifWoEB07
	i1nS0jApXkYhqLGPZVn31f2FVu5b/NMFqmrqw8ArxjALkT6dWM1egfJMj8pmPjSo4yOyx00XCpx
	VBMFU55gKhf4mGMDcUXehdNtm5hrGUaS5KR1Y/7bj31DIn2REKz9sQX3hKNAkikNqDwlHfP2WoP
	lLDWiKZ4Ulnr1tX1HSJk0VPSjJ8VovRq+YUsja8yT3QNZ1cOOMGksQZZ95/mXq8Z8TP+NB2EK2Z
	MpLZ07e9a7/NQueIXhxAgrYyPGoekQSa0sdmEXSBocJx/upWAE2MZ0g5HD0PH9htobzRIQ/8+ac
	pHGlyjaqko5enlQ8QMRWAx2d4=
X-Received: by 2002:a05:620a:7119:b0:8a2:45ba:1b5e with SMTP id af79cd13be357-8c3893a26d0mr2501017385a.28.1768183947793;
        Sun, 11 Jan 2026 18:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9EmI2cUvmWEdGcohzxg4g1rY/a+H8Sy5Zdnq4TjKqeD/pZK0vzS5CIgtbI3f2e2VkW+4vKw==
X-Received: by 2002:a05:620a:7119:b0:8a2:45ba:1b5e with SMTP id af79cd13be357-8c3893a26d0mr2501014985a.28.1768183947240;
        Sun, 11 Jan 2026 18:12:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm4499529e87.30.2026.01.11.18.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:12:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: dispcc: fix clock ops used for DPTX AUX
 clocks
Date: Mon, 12 Jan 2026 04:12:21 +0200
Message-Id: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVYZGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mj3ZQC3cTSCt3knOxiXTNDQ8uk1KRUg1QDYyWgjoKi1LTMCrBp0bG
 1tQBAuXyGXQAAAA==
X-Change-ID: 20260112-dp-aux-clks-6119bebe0e03
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2BlhUsS4xNMTdhgfx+eAZEQtXcOCqdzdPpjVk1yHH+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZFiIpVSahIzB+QwGT9cIQa0BgTTHt05wiMH2j
 EtYSLfl/i+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRYiAAKCRCLPIo+Aiko
 1Z4QB/wIOeg3/Tu+w47k96dZJz6yImD2p2uKjhW7cYsBgI4PA+yUuIRxqlJMzS0wFGAHJXhlBbi
 5kY+FsdaZZKsK/tonkqs/JG0FLKWnVoERxkFUP9GEiZjy8SVCN2iwU5gj3qgG+RmiIzMZe86GYL
 TuCh1X6fs+SjqGaUpxAAkSAEvHtuIXh42pv8g3wEvS/Hgb/28XiFKKcKUebL3vtqtnmDq5w0Omz
 dYvpqNzhFM5ee+r5YjT9VxbiMwZ1Rn520QVaSog/2/lRaB0s04JhO/mMRiRxhf1l59/nKFDHo92
 VAgsWsrSwlIVcBhWBweBb7k9brQJxN/AvgGoN2tJ9X2fDcEM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964588c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kmOxBJin3Kk7R0DW-kgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAxNyBTYWx0ZWRfX+7hyGzoWmWsF
 f1xjBzF0cX/hA4oPIDNATQrmQbpRpzVSLIgzVd+6Uh2mqby5JZoMHqMtDXTZApr911mIYsL4+Rm
 k30DXzsPla2KpqR0/ZAKXQkungHNrhktAUY8/uFQqikWNaC94U11SE7olkXUuyqhZnngx9ohtLz
 CbbUBEkRLLVnNMQMHmijqIW3g0VDLnCOgawyF3f0C8YxKcrj+ZCbHGAs4nOvIAgR77gHhQnUD7Z
 vFZbtXx5vuyp/jrdcrnhvU5QRnZdtfpNNy99fKnXDI3JxH+MGVzRq143miGTJ1J+SoIgV4MWkov
 2ViJwJrATbHw4929ArNx2QAlyp4N2MicQTJW+YWqUaOD7D9gMdi/2neJDQk7ITjiqWunBjYeVgL
 Z31P9Ss970BeSql2nuUrvDiqUrdrPl3w2yXv7YMGqBVgOuJQZz3ub15kyd6AsYUgX5CA8EJu9la
 /884BuCvZVxjt9bCGDw==
X-Proofpoint-GUID: MrFBJHe9LUMK-K3IVz_lzgpj_ay2ylil
X-Proofpoint-ORIG-GUID: MrFBJHe9LUMK-K3IVz_lzgpj_ay2ylil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120017

Correct clock ops used for DPTX1 AUX clock on Glymur and SM8450
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

 drivers/clk/qcom/dispcc-glymur.c | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260112-dp-aux-clks-6119bebe0e03

Best regards,
-- 
With best wishes
Dmitry

