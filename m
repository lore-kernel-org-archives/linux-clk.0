Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575093EC2CD
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338161; cv=none; b=eXbwLpRcF/6D1B9E7lP/VwI2phAtPNeDtR3IkRs890nIoZ1DGd2YKYpRkgAaYrKoVYWn0S5XanIb+x8wS7tyVWa62/grIOHxPN0xKKzlHcT/XOIvksy//mmGaVK9P/8N6GPeIi3H7vZFGRcAX9kfwA8qVaGVG8U+6SMFZDKVsjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338161; c=relaxed/simple;
	bh=qzmO9vTT9ZimsgS9gDOezDShy+F93qGz6TXjYzvqf8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sX24sMDWi6xShthWDzDXwwsqJme9ayaz24So8nYPMxnX/aB5R8D5eKNAVyKegAmolSzsdgQYTIOdGHb+z9r1J3nb3Y7Etef2DDUjFSRspRWpmiVF75v9MNGn4ol01k6gtuQvgAPOjVCpXRMLZjpFDqcqS2OszISOjrwb0+2wKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC0VP++m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEypq4GO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC0VP++m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEypq4GO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F0fkl3563558
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=; b=HC0VP++mKHGpVFjZ
	E5+/FRQ7dYD5K51//I/3+/1WsNFvX21EJ5GXExiugSlblHXUkoZzkpUTLqEu5U/Z
	S9ULNxDAMuATodw6xTk1vxwYwcAiZqMZYAR9pfhZ2MyoQ1x+3Kj99NRtgdLmMwed
	zItnagWksUpM20PBZcxs/zNQAyz7foG03JSH/96IwVn4819KLUd+W6B2zBUQrhQz
	640Et44tajQnAHSHpamWcY06mqAMR5pCXtMXeBXPABfQRiXJ/g8FKdGrekvsYvRF
	e8fMrfs2iAKcmydM5IFuneI4Ta0IbG0EJNX3QiUwzbS7ddPMHfMzHpjOiyn7ObmD
	7egpcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxtjhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso3266966a91.2
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338158; x=1780942958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=WEypq4GOhmg7I3mQBPo8kVeig3rnoLF4r+tldoB59td2qkymvzmZLsP2HoISnTlLyn
         0JCCjyjOlPesxxF0M5AsegVmphZIzDuOds/ixzSXu+vQTris2oqc8KTyPgiyT6843q+Q
         ObwoWSfIgvxdaYvmMP8LoBQCDH9L1QQF1L1TabultRNk+HlEGAzNyFWkMMQCRF6fyAMl
         AO8+gYWTeI5O4yM+LUqoW3LC0H8Je6BASO6QjrG+pvUNui9TbmnQ9f1UCu9qt34mUC2q
         J6YPWf/yDkzX1A4cHzN/NScFVCKBTyJRkC2z5jYxHJAjQbmWWVkrSQmdJBQPKhk/mb48
         r1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338158; x=1780942958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=GWD5f9ZKLt7Oh/nPrbhIpfHJXTm4cgPSHDQu6hlLL4sqKa5UZnWl4BWHYWStrZb+0W
         +yWqZPZlUj2++nQUGfM223vxFzN0xeNDVssFt/9FK1yeXMdv3cn1wcxmuXOqHNwXR4H5
         sp8mmYLWfuBBYGcztzfU1CCDCJFJ4HxdmhZsDQ5yeRi2h1YrCjAFpw/GlcHL4ecd/sIx
         E8v9S8SXgY9EjcxrpEao2JsdYy9wip17b7diKDY9KIsxp4YIhBZSAInx0FvJ20RofZlA
         PhaX0iaLueDtTSxYvC4C3gCI5ypu4m7GUaOV80gtPexc7KjmphrEFkAYqIowop+1yBZd
         1nTA==
X-Forwarded-Encrypted: i=1; AFNElJ+Xrh6F8r5syokBmp3RQ/1F1eZ/tlNQVymH2SsNlyo03LZDxm5i0Vf9WI81GLcwwNYtsDJimDxEBso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTKZvp3j5vmMxTYXCkVgDwaiq3sDT8VEwXbC31/zwFiDRSnIZ
	wTsjuXfnWeTv48Cp7z02EquT+k3MJxpjQnBY12HnKuktYu5r7+XdQNmDvScduNXofJl+d25z+or
	L1ii6r4FxPS15f9oVjJoJ9BG4qdoQkDqFzYLOiWYiifZeR8QDoFQOQuAQel0+QnA=
X-Gm-Gg: Acq92OGDnaTzQ+VEaMidzDphc+RBBDNaXmZ3aSysgBcrDZxou3xnmQ1gX+aXL1oN/yF
	X8XAILV56j9iRDseBJecE8Qp5IDRLFo+USs2vBbxBKUEJZeCbxsKcOnTtLuXGpjT2FeE2ShEGoG
	ROJy4w1sRabQh4DxhzdhuWYbfW13TlocYfXAV6CZkrnYEqpUjTrPv/vJCLKa0hOX/0b2MaIdJgV
	NO9DmH+QpPIBsNcuKxFT+7atoVtYRMzWaTpX1A1lj+ug/R4ACNtqb7pHbTte5YcJliy0GLfV8K+
	UMeVULw6JgZN0Fk05snDWFRjXvbUPb4TI1U+zlkfXLWbquGn8FjlqwMVjE98GeMD/PgDOMZc5Za
	itCFqbEJnPUu6AoEbMAaWwBRGhFqaV/xg20YN4NUvYZ8MjVWX9yWwOCp0oilbhRo=
X-Received: by 2002:a17:90b:3e89:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36c68481f2bmr12400976a91.26.1780338158244;
        Mon, 01 Jun 2026 11:22:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3e89:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36c68481f2bmr12400936a91.26.1780338157775;
        Mon, 01 Jun 2026 11:22:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:29 +0530
Subject: [PATCH v3 07/12] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-7-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hs3oCE_EDMViUkxEO6R7zgJFLEonXIg2
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1dcdef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=USgIuZEjIA_ZHjWqnmUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX/AUX88Oa+3Ag
 2Wq+GWtGIBQENu6oCuKwqo3poyypI/ee6ZVLqeyqgBFDCoSs+C3KSd3iwhyAplEwRPbhHLeOehp
 etYaYzb7A+QKWedNAQPccq8hoOUtvH7mT2VsBhjHfmq/95MVxO7aH4uG02f+o6bmwCVRt8dzo6t
 Wy90w6LqixSLNR/43mREHQq+K/DbhxxPAZ0SzQhED2qGIWeGUVCnV+/wuisAAfYZOEW9oJYLDio
 PPdHXdOoATxMq/qEjQMsXN6BRgcxIZMJ4ibO9cU2DzE8WpX3xx4DwFSdUtOxWXrti1VhSz2b7Uh
 /fXq0fRtl+v0lwxSG0FvOy82QtdR2pzlTe/T/kPDZK+kb4u27nc3Hn2fSkujpbiWWUkV4QlLNis
 mjFluXb2q0hftULRAH4nqwZfLbsqj7LjZsBPXUnNBxXgOxe6pYfMXkDCRGIU+hD4dhuK14bzURx
 dx7D+GDIJrzqKukh4ZQ==
X-Proofpoint-ORIG-GUID: hs3oCE_EDMViUkxEO6R7zgJFLEonXIg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181

Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
default values. Incorrect settings can cause the GDSC FSM to stuck,
leading to power on/off failures. And update GDSC flags to retain the
registers, and poll for the CFG GDSCR, and switch between HW/SW mode
dynamically as per the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1

