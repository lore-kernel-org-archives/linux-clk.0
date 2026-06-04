Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC673C063B
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550828; cv=none; b=lQWP3QDnk9smSNtw0ebNbpQK9hanO8h3Vt7s3im0qpVxKDRegs0GrjtVQgo6Gm1Wu+bhvRMvDka9IHf8LdxoWVCKjC4qb6/aUN2KMdxHaTygNbIcPf4n3B/HeFEtiPSBiQOShECqmFRN1IuRucxnPffNVKc6a4EFisNHSItIbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550828; c=relaxed/simple;
	bh=qzmO9vTT9ZimsgS9gDOezDShy+F93qGz6TXjYzvqf8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MrMGXa88DTWvv0YifPXMdc2DUMLRq78ifZPF/JKXu9zuBI4N/CfqJsL4gkWc6XXtJIg9YQd2WqDxD6q+SNx23789wEjumlHgwVCvTF0UvDU/XPgnzQjpkAyVCNxTxvKsTpceGsDTC4ewCHOvT7y6Dm5hH0OETsAP4aWeW01Ho4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGIYaoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnGHmC4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGIYaoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnGHmC4B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540ntdw313659
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=; b=fsGIYaoEXq/YkYZ2
	h58HKfWQxZW2f4Zxl3CNMFxWjI3SE5jSZsLv6sj1J0JVnS5fTfmlj3rn60oYHWFD
	LtLlBzLAcE4udR5ABFU6LeuUc9mQFBnINB9yGvmbpNm82pYc704fjKgpZAOXR4eb
	jZCugHGX6K8uIu9dvMGUbfE0wHMy4FkTtPPm/AX6eAMSzHL64BUFC8eSXbcwb8k7
	jFUz5O+2JPP/e9CwDY4j8DGhzYi4JlZXjemjYNhnxEW+xNAj9b6iHncI0qxIIrRV
	KMGjE9fFKH0ugqZZCa1rKKNohFRMgGsbzNLtlQG4JMEQBNO05gLGE2wDmYCcMmBq
	hInUmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0suc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:27:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so263384b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550825; x=1781155625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=HnGHmC4BPKDaPfQ+KmTrTJgAbkYzjdys5FjLCal9h2x8a8Q74MlqTGs64rkQaR0iDH
         itv4pPAwBm70a6AyOtVngcBgT2bQVSR03JC/jbjjPZ8IlcJTI4kXoFQCqHsOdJ8gH/Sb
         4sjxZuzHTBlpNdG1Xtcae3HlDd/eKZCsqw8gXKbaylEFg/9OYFDcXd/KPh5DyMgYhYwq
         Cin7yuDpjNrkJ6cXWQRB9ztNSoORjg9M2FMzOozTlqXtebTJjh7hi7HFNi6FofpB5+b1
         Ky1WHRLUJPTMqy9tPzp3co8nVCmDVVoO7+k0ElOaMmHAOx2COhISuVYf2Z+5VWORQIju
         NEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550825; x=1781155625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=CNk4qCWtSuNXlRIJlv70g+XIiLpa6So+TNLkn/e9Ikpj2n7LZ2/BEGG6fchbaTIQvW
         +kjt9Un5TUsDo8CLYpK2tjIt/Q/t472iGmvsxhF9s6aV7T5WDc13bH1bVXRXTCBh/HWw
         Gwf0PKUEecSnUfAStNQ9qaLxavneRdaHIoyWFnr0aEcBGptlDcjuVBeqXOIby8yLfhsH
         BgbkogR1BVKJl9CuGi5xmTcIzqwI2QbgH2AEr7yNRbQslOlYSfEunnvYiCallcGQ93nc
         pQPUpWUG7BOEijL6PCK2TX9jcTWuDlwwsBl3C4OAR8cz1YqO0ZNvDL5uo4AE4dr9evmV
         1Caw==
X-Forwarded-Encrypted: i=1; AFNElJ/97+EHrULvX+22yN2utfgMU04DBpCSpPAtHMqPuwBnicDNC7BDIvKhr6+ghtQKXETmzrYtFFOpVyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHA6Q8Epepb9viSBPHxw/dL3yJEm8mCnPguK/U1qkXOmsJqOMR
	MMtAg0ngknbBoMKCqsoKcMBkRNsqrXeyNOnx13Lsj7fcqc+mlEW6kk9Hm7QiplX+9UGT5d5631I
	cWODBdA8gH6gO6nvEBdWtA2ZbgeycMk4Gz3ZUejk+zISUdL2jHpiqtBB4QGWe/Co=
X-Gm-Gg: Acq92OGy2TYisN4NxpwZap+KvoMJQfuHnWlpJHAbyllCT4CKmG74T10r0CMnNx5lFpb
	/bLmEPqlbUzw9Bcj7QuiDX/zw63lUTvQb5r2iIfNOQvrLMStTXdy3qAl091C2HGGXBWzZR9WLdH
	ZjGsPHSDJN0DtOlrCybD7zHKjk3u7eZQvD5Dx6q0fqlvrH2ytl5Z8oxV60PG3pXLzpIjfzM0NS5
	zue0IT1gyWoowmM+4V+mkFl8a2gISpPsXtx80mR5AEvsSWiqdGvxFESAeUXOglrsQjOn2sw00Tm
	1u7zGQCvjngc7TDxU2bV7yYpZXVnB9XuGcH0/hSnhrskQU7i5k+ZdvsJsKIOZZ9ylO/BBJetsAj
	+cGEgCnP6Gl6QgG4yEVqnD3Xm0v5MDsk6HNm+Kr6ri65LN6b3eSvr8B0wviR79MM=
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915274b3a.27.1780550824668;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915255b3a.27.1780550824229;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:13 +0530
Subject: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX8OuQQhe89Ncp
 ecRD5BU84mabcCM4PL13VpzN9R3xBM7wmeBcn3Yvsqb3d57ek6RjLZc/Ogez271+zLq8utyXXdV
 cXiQ3Pmtku85g6YVxYxUdB0RuE26XarL46FRCHEg7yKFrhyBNluPXVg9OwY9Xfm9pM4rHB6PQxt
 BBnIkK3By+Bk4oIVrEY3Bdfq3WEMyLIz2loHrSOmR47bJIS6Xrmxx8IjUCnrGgRIZm7W4b7QZl+
 t6Np1bpSRrF38hcRYOps04r8chY3CpDLa6HFrU/Z+X3eiEx3nOBA4wF/CFEQeu4wea8OB2K9rbj
 vIHw6OWXZMlPLc2JJGZBKly1uSruphJCp1u83vmi0hGWTukBCLt51XaQHnHxsG7fT2k8PI+RYQo
 3IJAaToAOEKKfc6xyM4Rl9LM0kUkJrrnb9zltoNZshcgwIZDydq40Lan2MEhx5J1dx1SZJ5RFRA
 Ziga7G5rMna0xt+5/lw==
X-Proofpoint-ORIG-GUID: xgvuJeZ3yXBk47jRjAVdq9L_VIOKDhZA
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210ca9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=USgIuZEjIA_ZHjWqnmUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: xgvuJeZ3yXBk47jRjAVdq9L_VIOKDhZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

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

