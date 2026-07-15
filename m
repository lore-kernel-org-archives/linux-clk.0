Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B246AF35
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122185; cv=none; b=gLhDBMBvt9YLcXpi9O8HKxHorNJdWiYBg1PMsjALDwl/unvmsII2nUinDz9KBDurLK9BZ8k4HVBHDJB8xY1JmfLPYpHlDV5ehRteMxt+xsSTOmLw9rfqgy5v0KjZoUy5A/VpRavCLIzzcGTO1unzTKP2l+AksDDXfC/269z9YjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122185; c=relaxed/simple;
	bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLbV6wmm1foJ4FYRYDwbjEBcGdp5mNCHrRuV/3L+LztGPwsoqgCkVvqcrN32HDmiVHU/yWcl2M+2VTZK7vPZToEHCwS9Nd3WHimUI1qSKFxJ2ZLVxMzgDdCoTmnDQKDMGVrocBVfBCzfY1cPC2k9QOC9JdFCag3O9jsk0xSVe+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+l62H1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvbEXMvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+l62H1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvbEXMvg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcoSI3708167
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=; b=I+l62H1saf2T1WXK
	1YnkxMhEfOP692fV92c8PL+gTKRVWBRjd6DugoGny0vvSW9T23PNWC1MNmfaiZGC
	DB0+UqrTKIsGnsz/rF3wPfVtSKt4LFBOIyjHntuVY1JNJJIlWr16UK04EUAgiBll
	Gc5xjMheW+WaqiSRQNd+HiYKz2CSA142CSppmtAW1R0wrKeHVbDOn4ekeoxR5vJ4
	2ogx5cclnCzdq/xO5VS8BNAIbE2knIGkxUaFM0OMfWk836J6wGgtubFG4HjeXP1v
	LeKPgPYjuv6iIE/VRTTuZHhioT06u5ZByivVP/J1ZSBx/J8FXp+edw9zcW3jep/Z
	htg/4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgvpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso28140311cf.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122178; x=1784726978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=KvbEXMvg7/qkSDi3RTE9L5D4gG2kwvi6wpWF2CM79ciYw27H3r9vf+951oNDHf9Slu
         l8u/J0l3tamFv9vOh7g6YtKe3Cxr4IaGrdN10uWshyfAjjTw/n8UkUlL34/VuMy+0oze
         ESHpeO7FLv2xqxICdatRzUOuOpdWKUdXQ0TO+jw8zGg696WllMn2LhsupcLZaBJzY3HV
         rBwHpf2JrdRzRxgM2BX6VkVJ4+aSdFVtxGQ/JeQYwyMgPAFUR1GyR6Y7OwI5bhBLzVFb
         MoMiqIVw9YcXyhxQ2jD9X8yLru5GO8yqn8caVrPeGAYYscDphm1kgfxulO2zhelfbiVU
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122178; x=1784726978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=OZd2JXUq+a4BWeGqKaHcxQrP8hhleM/ajbzxWJzwMKQgl19AVAo4QoAztPooki/Gu4
         7CakEzVZJiye5iTiCdNynoOFzp8RmZLT65VLs+BfAeo0GQc+bQPgqcFgCw2W/vNYUsaK
         P1xFrXdQCi5XNYGIMGCuoDCe3XGxvsICmEWjtJg/nJknlsgbHpbU6vXNlq7GRVrjRRNm
         6toDXp6gHUPvcPXMTDuOZmlykLX1Mi58TyP3awg1lpvb5HXFOhqXWKlONKcjp3lcClj3
         ALmu6C42LPJTwRWg2GvIushr7B7/bBxyeEAs9SMWRmAbbz3YvufFx1V4kEbySD6+wcy0
         6Ylg==
X-Forwarded-Encrypted: i=1; AHgh+RqBFBkKBwezWim7uyYNISnuiAcBearUbjY4NmU2wXlqDQ5cn4fRAHrqwJ2iHxH++5h0RgIehi7hZjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVeTTt5EnpJQfBS9N6pWuH/4poGdz2NSEfTwVzzCItBLYcDnw
	11lP3fVOuXvuG38kcfByDBcR02GkIwGzmZ9Cd2s8MKvx4q1Np7CFRTcu5IQjwGrOEtU3WCfK15i
	U+9BqgOwXRr1IaPz46qTN3fGLtownX9z3rgCz1z+cm6sJnc2a2K5wdURD+IMQVwo=
X-Gm-Gg: AfdE7cmesZ3Eo5yfGwk0TjxdnCXmE3AMQwQhlBKncianAWQpRoWyeMEXqYiJ5e2iR31
	Qt7Nkx24baAyRQyNGWDtXCwvqTZNlJNJ9muIGz2K+3RbqHPoB86VBrhh0UnShp1UPSOl4PPQyM3
	kZ+lBEAoOE4COWsg0/d9eI86ZJ8sPCa7IyfxfBwll/1nwhRJMl9HbPqcUKAEeMUybUI9L+sCqMd
	VYmuVZKW6eoTlb3iOApjNO/2Pkh1ULNvLEo7QyMT3r3uNPf6IAfPb+2b73keBSA86lnq0IobgfU
	KVhz3zDeIT4orbubbL/xRDlnD5JI2ieX9N+bDe7mfZFwZxUDEu/yeUvVo/re1FRWEMJCYbHZ2mj
	gTDopETr/sryThRU=
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652711cf.24.1784122178039;
        Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652281cf.24.1784122177488;
        Wed, 15 Jul 2026 06:29:37 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:15 +0300
Subject: [PATCH v3 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s1nYYjdGkiC1id63RUG6tg4KE8irc3UGMIu
 zXIiVjLJSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNQAKCRAbX0TJAJUV
 VonUEACOCuu0EncUyGXeK64Yp/lejNpaw1V/nThxQSRLtH5ZggNao7RREJuEg8tBVSLWDSvxWXc
 UyBjjxfxGvFLgZt9t/b67Bxi8EdmVnSF/n2CB0b7NpHWCxlvItMSsI3sP5CjpmLhfCijKesf4kN
 IoYo7TfPeTFu+T2yoWjBy29ssdmok5ajRN3GLfKLDNm4uesFPDS4gD5Ah55bW5Kob5uxfQXkiOD
 r8wV8cwKSNM+pzfHgwWV5She/Gvfh8MQS2gmMrWx5oPkCVmdp7TRjoNI2Uw2Aq5dpksIpwrnti3
 WR8SjUOvRua09RV7txnMe6fimqPFncsy0E44JhBU3BmeUuBDcS2RutvU/TUfQbFn5dLsyKcpe0F
 7tXL3vbzXBzvz/BaGQU0OH8QhFPqSAiglSp/3Wr3uva2LYZeNfiN8uqVsE2M4FHe/nQzgRWMcJg
 GfFokVlNLearVUOrS+YJqnIhLdxEfWEv5I81ssZhIQJdvcGo7xNrZa1EyCEWd20BtGVOFBjm1HV
 NEELaiOJMwAi4bz8vT/QQJ0mRVxeDBe0CxUkM30kWQP96+7bC25hTWJIKmBrq09ozv1HgLMswHe
 B3Cz+O/EwkwKWwUX7wrVWalaOhlpXA/G7HCTF+ff/7w+8C49c/ykJg2kIIDKAgVEvyM3MN7UCdM
 oLhNkbQqgw9mn5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX98kwJzyv8BAv
 M5vN0MEq18gNyjY/cItiPO1839MVQPUNRnD4/zpl5o10WEuM7UGyJpuzKqoWWQw/hK3p5pzKi8z
 YeVQe+lQZ4CW1B+cUZjnGrLk2PMDD88=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578b43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lkCC1SliCgva2c6dQM89DsG43lkrQoWu
X-Proofpoint-GUID: lkCC1SliCgva2c6dQM89DsG43lkrQoWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX/7KuxJxJBijZ
 ch5sXrtCYoLuiCVzKqTK474NXDYvKo6684/aB08pabUI9kZCH8JQezt5sxkCg/dBtfjiCuxd/W9
 to2VO6ju82ncuJmNZ+n9W1FpFMBsrikH9kptcIQUbn5rUi70r+OXC09qogJH1qdbZruFhWixuoN
 mhMLcjNrkYCtsSBFyxuMpcsPMjKivqdGqiupmyuCXOwE1KtUyvfXRzRFDYecfLX6DTpURx9NvAF
 veANWfnmAKiE8S8jwcYiut7iJqyBN1gCdByE7KKNodNR8F155vY6IL26vsOM6iSxT12y1F4DV/i
 9nmBu8s7ubSSBsHaxKZBWgyr54aqlcupEIJWblfgut1fDq0La17yKfGfoI7c/ERPoSs9MNUOc1z
 vD3P6BVH2EZAdOTJUR2y13PafU00adFJt8FW8BLxWxF7Ii7847ZE6PdJjdvW2SOX6t9GswlYCHr
 7sV9PO5m2kv32bfJ2bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 6925c6865089..2ee4820b6fdf 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8548,6 +8548,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.54.0

