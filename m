Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFC3164C3
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575370; cv=none; b=D3krPzxh05QqHlGR7325fnxKiDGn+FJZduQW18mTnLVeGZVjHg9zekACZvSb+Z7P7zAppVB6UhqLU67QPA92WFm14BMflz0825DzlxRs0NuIRiOBNObk1Hm49CVfnqA3Mzbl3RhnqgaYn8DTkbXIUsVv+Zz/bOfmghiAAd71leA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575370; c=relaxed/simple;
	bh=7egcwkyNwPYxR37Jus5Gv9CwukNyHGGJPyUno6vqjsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH0DF9BnCpOtQiLMEk1n/2gTsMJw9GOOVXI/9oHYWISsIn5goEAIr3GrC+FrFGG1Wh7lRa5xwKNFsDGUBv+UbY76tLupqkJWeLs9s0tvGL80SeVITo+xZygABTThz0C1kK7pAuMGpjnxbyYftTYLclvj/N3kb4BEAZdum+ueI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f38reHAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+QBeCGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f38reHAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+QBeCGk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9sdfP561247
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jcSKd+jkEh9
	Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=; b=f38reHAGRIFfLQCWezwOLryxWc/
	CusDdx/Uqz+VswmXpFtVU8j1OTVFnMBKHqXV4exPTmq8Hf7nD/8hq2C84yi0mF/v
	W8YhGgh/SkZelfBzWehOzFaNdyQwC20rzteSwoY4cFTSHTtr90skAOqOARPKLcah
	MAwd7uehMnY46KIdjJA8UL1hF+HDPCYMxB2iRYGus5AYxTa42f2l8Zp/5U7IV3Ig
	inL+UMZTf2LmIXT/8hczHCL8lmiiMrqRdsZAhCIrnasn8uea4CgFGtbURef0xgZo
	/XRYLScrAFbtwDb55ckC5Aw/LcL+bRU5qh0FEY5AN8qLlclFL/lIoyvAIfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cucnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso140909981cf.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575367; x=1767180167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=a+QBeCGkDd+HQummNhCm3Tmhut58UG6vDLpbS3w2XXVop0NjCquTG9hvqiH34nnPW0
         bfUha4Wcw4HyeNsBMD1ZCTSQH2Xz3KMWBI6/N+aHDLWIjV4gNIQ+z83u99DopYfEG3If
         3ywNV1dsrG7X/OlBFwK2u/G8nRpadwV+GSnbaOS/pMP/mFC6vPrme+Nq9cpDTQKSrRV3
         HNDPr2iZjVs30TKIVobe5CFxPMWJ/zUCdFTL8wCyXtf1SaQUJf1+upFrzQ3y/mk7PABu
         U5/9c0kk98YAeaAujPYIlK0b4XT9L+Kx+y/czEME3E6hL3KYu0jIOYktw+FcmHDRUsZb
         oyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575367; x=1767180167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=PG2EGaMLMhiWxo7yEyqsgziBN+UPbVVAyQZV16d9F760qIycbHaQGjwlFNiMRtL5gx
         f1N6Hr3Sr+F/sN45JRu0RuAgFW5SPqhgMaLZjtcLr/mSLG3didq6SBZus58Vqvgs1biZ
         csj6a3DAffUYrPa+Pb9th4DxXTf0ozTWwBZZkWHs77FtuBcRKgAxtkcGxd9bL67oYwrA
         RaBKKw5HnZEei9yfwYZfuHJxoR67Me8lDTUawyalSOnVV13Ev5Q4/gyLw+v8OOPLQtDh
         wXUE2UrO8H3ld2KAPH0MW8fUgNbIhuNZnmiyS1NadoZPgtQ53r71sh3JnUnnygrv/Y7R
         e8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2CtID8sObPPIyIvj0NWXzdW1eMdYqOKn+brttOgePtu6EeOImZwlbZDs9lG7Knbfv1oPdG6rhnGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWVmp9nitkUPYL7LQ1AH4i4CMgzk69g/xnRopT6mJig9f2IIi
	kL/cT1Nkkzxk83KaSHCVtm6LVmmahqN6KdfpHM2uure/WBhcwv5ZZby8V5nY73x+WUvMTrq2chA
	9wkbZ50KKgn74W1N8QH9IhhSS5VW83ttUxHLuyCZ1neeUegm6nAcYpjhQuZ12azA=
X-Gm-Gg: AY/fxX5jiDlHw2lpQHkwEXT0IlMQWwZRB0taeE5xH/G5f1RjvhHpoJkGXuhIehaepkZ
	9tjlRoonsILU5yAMSy5yWt3L+MUOWEADEo/ZgiYqAjLfzVGT7HPVZmSrOsl959V6BscQJiHmo/X
	8Nj8vrtsSVg1K+UzQzZsDvfvVoS30t9c+Ip+i8Yam5XEhFzBc9raekmhyzyN0zv85SGSyGeOfEK
	a8EdLOCEPf7nMbUqMdRAhp8Ho3Sm6WsOz2zxZolwKlqQmhYjXA742Q0ip5n/pgsUMdyd6SzVf3c
	BM4aBNZENsMkp1rrny0ueArjWL7ycILZf/uFaRFNBjHoVfShG18ES3aFwNSfE9MC5rDajNkCLXg
	ZimzDxroET2+J66La4euSpIMlmz3XerblyzW3usmTciBMaicrx9XKbIcOrUXwnQ3x1VSZjw==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254206061cf.40.1766575367368;
        Wed, 24 Dec 2025 03:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXk2MlFg1WwJyORFeqArvn3W7h7ibn59i+vAhLb4RFfwFlMM84u21nTU7QY11aHubbdFv1Kw==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254205741cf.40.1766575366935;
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:41 +0100
Message-ID: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7egcwkyNwPYxR37Jus5Gv9CwukNyHGGJPyUno6vqjsY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80AY64mdKfCs0Ce2qW9/YvaJnV9fNYZneYmI
 4QoyhCD9KeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNAAAKCRDBN2bmhouD
 1/WED/9utbqaTmq0XaHHxHeW8MXpfe3OuGiBgZeRSPMQp+PrnpEUURFjOohgTfc6eW14rKD78U6
 XOvImOVzz75zyzGO78uu9nsN+QJkyCAwGberuACdsCq3RpbS+6FW9KS83biY38xBEqUeAEBDBIP
 N9Fd6BAax5Nq/qaGRkZRGl7LQzNPyTyB3e8aZs28pJNiW8ccbZZ6F0VvE+9O3pSfA7joZIUaSjC
 Cw2IHki6l169/9FLSpLLoSwGslJ6cwhRZJUlic/BHBgWruhmmztQT47F+zj4ZzLo9Q8HFE7krYk
 bkh92iAN8OLyq+lnOG/CqxQr+GIeLi40AZP1z1bOjopM3z4eRTgPJBL/0XENNJPFCf9nwlVKWnK
 5Ox+v2kaiUralco05QxoogHafJqn9BVuG5L0m7bd3YZGSvDjdXf/+I2LYOOsM4TL1Np4cZw8Ryq
 tJYNLkkj/tGT+yNwXFU7PO6r/YAU9b2DSJ/sCCspL+QkSMLN6DjA7a5eMjprTV/PvKv6Cu8ZHh6
 gVHGi9nAOZodfa/oPyBIuoxKUsJr9IVpSVnKA/NcrFTOFY6ZAbeC4qFgqwZDsGtrm6OpUgWGHXY
 jxnECp1d6//VnlBN4YUve+hz5d0+2DbnPolQfsOFVu+RUFvEu8rppKrYT/jdRdHYhu+u14ECPfN 8SVh6EqGGL8IYvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: emThL1Sqhu5KY38zXLAOr-jky91TxvXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX4JlzNBgEX3hx
 hm8aBa2QjVtM+hgFVS7T9dv2CrcNSvQleXNM8svIO4LJkjxw/dJElf75lqSso2hhtuuqiDw/HlM
 sGmB98fMun0oNBuVQSry3mYrEmuGEzJ+gp7q0HCbnSqUz39K7witEK5ndt2uBsY7Nnsfiqln0tA
 aeB08IgidBOkMddWTk/9SqGSg9bGWWKxZZ3v9xRD4xioz0UjXK6rZY1B5jXjK+hdnliaoMvQpKj
 NNd4ldDche/SVG1SZQ8ZV4vkmYBA+eDwiS2LdOhE8Lz2f1z7SmXXGpP/0dizTxnhEagGIUQVizh
 GSrmGncIPcMyNwpr1eJGpxNjRLV+Uibm/OvsjOL0+EbcBcsoHe6jU/muMHVRvIQLeXsTfSXEpgJ
 1uhjXHTEK8IP+9Ei58Bi48RUGVpheRau4PUv4/MGJTT8xBuoffz+W0QQm9JEXd12FWxqb9zs844
 8CRFwgK01DE2BDfu95w==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bcd08 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: emThL1Sqhu5KY38zXLAOr-jky91TxvXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-scpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 0b592de7bdb2..7806569cd0d5 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -265,20 +265,19 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 
 	if (!get_scpi_ops())
 		return -ENXIO;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		match = of_match_node(scpi_clk_match, child);
 		if (!match)
 			continue;
 		ret = scpi_clk_add(dev, child, match);
 		if (ret) {
 			scpi_clocks_remove(pdev);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0

