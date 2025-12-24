Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A7328603
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575373; cv=none; b=iJtrkwvgWmehpk9gGT9FDlbl8TZm/sXkXgarl7wpNfVY8BzpoC4kSufFDszj0QH5B9on8QDHlPQ3TpaaQBHjGvrkUhcV+n+U5r4Xx/IoooCq+GhythckeahXWQEQrcHfhxsIecqByrwEpgU+mMisUWMJ6lKJd7h/uzYW3DS07OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575373; c=relaxed/simple;
	bh=pSKmaxlE6I3zeFW27kebuzva4yYi3an+fypyqrcpva4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWtx384jLJfgnG6vPFvKAEFnFyz5OAgLr47aKq4h+7Fx8ajE010gD7PIY/c/4BACrXtgEAhj8dygvuVAfAlPWGr+4n3ggZhKd65ZozyRM13284askULWkBerKuv/ED+n1xS7zbnCkFNQ7RCUyM9bDxDjWA/3YWx8Y8IspK5g+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhgtsILN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihPXKLzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhgtsILN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihPXKLzQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8ariS722153
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COM+zBrXCPi
	jvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=; b=hhgtsILN1FEAkQCuaXJj7LxNBuz
	gMTjKGZGC6tMLPfF9qNNIcFp665kGIJ5vihNeTVFj9qUtEpZd65Pllqja1PFRXRW
	Ul2EFV3yd3Y98/pSVU7vFxTqbxSdG72DDB4SxbqCICK/WNExrIAdGMmC//0Qx2Kq
	2RNzaFPzLtHAE7JldGEPbMdOCfaBX7pwMLzF/WliArG0eXI6Mk3ssukoLfi6Z8it
	HCJKXdQLBaZ65i/8sD3phXNFnpKk0UczpxrZ3qGFKOHP0lDi611L3nbgXG+hI8Zi
	oygHw0F7n54Ac0TytOED5ErAMcit23GkLyWblk/BwQD12uj4q2QiOimAAug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta2vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:22:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so158739141cf.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575370; x=1767180170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COM+zBrXCPijvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=;
        b=ihPXKLzQz8ISRNapU3BM8smEKbMKXXgQ6m5vLGJh9ujOWqWpQDldPCIONen9XFfV3Z
         XidOdTkcYumc9l6Hqp2DUuIHXG1sL8qjylCRh7qkaHwjejZomFHpFB1YuVPWKBb4SYKV
         mnXWwLCuiAivpVfDyEfG2jpRTXJhPYptq3WHzr7JV0TMYbPVkQbcnD7BN3WtQywCLPTl
         mYaQecFGdBR8kGeQ0uVqa4xNpkYoLpPtcpobRsLrOHvLg+nbudAgvXyuzHLKfcOtoJis
         QpM7qa+lDkNhNrzxmuQd8f2zzTe5/mirjKehMg2bBwcK5uSSC/JJB9XOfAuXZ6hmOn7i
         V6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575370; x=1767180170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COM+zBrXCPijvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=;
        b=i22L+Cp8Xa3rm8OY8KkK/VH2j+ib5FGXPIGybHMtiyqWoCw1yZZ4/9O6pPOfyvbHR/
         Sbn4lPdEZsEZJt0NZNxdMTd6ydaDfSWVLqTlODAYNj3RoaSeLuRCU9yW8jYQfky4fJEj
         qKTqL304Y64xvBUx7DvCCrs4M2Vi5Ss7bpv/j/0+EQLqza9pmNOm8fFIa4U7v7U16HsQ
         mTSwfDtRty5nmPo0OB91+xrcsePwyCsLru2E01d7fHPNVEIxjCV/poHUxbW+/5gCmFAb
         9hIaC8QDinzUD1nf5hDjh509Q9HtDNbf4/6N9xcLaPGXYY7ugYNXaMD4CNahP5t8WX5h
         HGqw==
X-Forwarded-Encrypted: i=1; AJvYcCXnoWFjo+V+BgZ5//PKxtLsBgCx2HX2FauA00cs1SyXMog5ud0c1CIgvZr+aLj/nLfIGbMAbikscgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytEu/LdCKvNygGl8uCSqpzBtvua4qKCBhgS8id+5nJ4uNXS8lG
	viuJ0WY2t/z8N5FoVvMlGYALGYplTbbNh5oo5Z6sV7JA4791IadTvDxUlumnOScHQrS42BEuEUb
	HkXs16hDR5zOEZm3nvR/nIJClM8vnvZdxZtgrP1p2xDzLjtk2nj7I3wFFQ9OxrZo=
X-Gm-Gg: AY/fxX5qoXFbbe9qd+ZIPxAW9+m7oiSimnYjHWM241XdiqTsNGZagzkUI4m0Wd+pidv
	MLDuVOVL739JiDEOBLpzgJ5uzUS58W0DCXqZHAoDXnlZCAYMWfY6b4QYambyhrNzAL8J3uPe/cC
	7DGikpUxUnh7p/eemphxZ8OVqxZRKtmzr55bsOsd8q2KkHltSZVhUob2SXkZ5a7VpBKX+nUKtfc
	1qjPnzt0M2BZ7roELzfi0+VBIOsq14tVQUBgwJJGMc3t7/T/i2sUXtlv4wr3FbN3ebhxkRr4aB0
	wYx7A96l+cMM8N0kWa5vKCEBNuQiPNu/zvRMPDV+O33yJ2ZI05vh3RZmSPXwYtR6xCFzWg2be8Z
	7RoF6xLUNMTzjlGsa6A5C/C7S3+VhPxJNbz/xUBo+rzugZU9ajIn7QQN56CagEAqT44I37g==
X-Received: by 2002:a05:622a:4809:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f4abccf0a8mr210421441cf.17.1766575369892;
        Wed, 24 Dec 2025 03:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR87w4gMis8CMvpQOWNQdWf9H3SRiK1lC82XqWNYC6vKIKwjEYpvWSpujAmg5WZm0kqn3SVA==
X-Received: by 2002:a05:622a:4809:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f4abccf0a8mr210421221cf.17.1766575369458;
        Wed, 24 Dec 2025 03:22:49 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:42 +0100
Message-ID: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pSKmaxlE6I3zeFW27kebuzva4yYi3an+fypyqrcpva4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80BJyjiWjILXGQMETRyJ6WUzhIQs7qaIXMM0
 VypiGLMctmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNAQAKCRDBN2bmhouD
 1zG5D/9Tg/0wMnhQu/f8GRgH4yIsyeFSDvZ2TLmwvkl0WfGFwPIoVnBumaBfJSzJFyVf5YfinsI
 IgdaE0VvqtvqL3b5zfXNoECv/nyI2X1MySzuZuCgQqxnvtYVKodsHAxsDWXY2j3PjRd9yg2VESA
 Ha6mWj5FDpWkCnsK62sBCyoHcIwFh1J8E6WdXckzaFiPKdfqw1eY7J2xdY2Dw6BeerZyk5kHGTa
 vUCoQJlboO1poe0sefzn6KKjmNU3cZVjg/y+KOHfAcMJ9fAPNtaUaI1+keOWSrdzI6cqtjRiUh5
 6GQoYoIfBSPazAGPsWqo2QQOXOHkhtnNjeT3cQVZyWmQwXiOx9HFZuJsTuHdtOkjFR7Erc+cA9L
 tB1F/74oUhzivjhLDh6VLY+43ltaW2CME+jXtwjKAjY9wwXyunxzcGaLNawpT0slb1BjVdDFB+L
 XZGafHynLMCQf96OV6LeS5D3ncGZsG+PqrsUOZkYnXEV1u0nSL6sxA2R1WFoxyS+vGr3fDIL+h3
 /JwUFO6o+hbhQ0o4ZGHC5vobgfBdCdFhPgC5Jp7TRJnUofXKFqpTN0Rdk4qdVtN0lUWoT+CM39y
 VfAg4lgH+1JkkfLOtcnwXkf31+719JswBla3FduA1ZNRbYbLQEqLIDg4ru4nD030Z7wxeYjcPbu Rx6M7YW5tG80Plw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bcd0a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7JSHx21X_fq2Wc9MUqoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tvDXyjLzW9YLCVZyvgCuWOi71XoavIHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX/wrUpBtnR+yf
 ScvH4WxqLq2baGpZPkYUzn7aFdL9+tbq9kAldyhPV97yLPBZdpITQEAfQPqjstJtFMPxrdRs6rR
 icCHoiiqpCZ9p8RNpU9DH+f6yOVaHhWijJGyT03/WIjPts205wmAEbtdqQsED9kxt0Pij/Omo1o
 GuPdTEgKoOmxZl/DZ3KUhd7qYbe4k+T5NjRWAniS+B9bWbKriTCvObpp/0+GNaF9rNQJWQxxyQP
 zoNkijTOZFK7DeqKCjcEA+PUWRUDdwZLiig519JAMWwZlDCAK5afeqilUxyTmxAJPgRv0fQL1WT
 0CNFrTAQn3MZfEIVZA4gjGWIPKYnJH5OQ5IEd+NFbyEwVi8p93UP3j/SJWezptSrCXem6xtbNi6
 QsBaL/6dd2SWwEqkU5BVV4CW4yjBMxDp21Fz3tBdoohwYmCkkOVxSsjmUaJxJa1i56JGw1OUzzG
 +I/vmc002S8nVe/WHpg==
X-Proofpoint-ORIG-GUID: tvDXyjLzW9YLCVZyvgCuWOi71XoavIHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/versatile/clk-impd1.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 85c395df9c00..328dd47f1e43 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -104,15 +104,12 @@ static int integrator_impd1_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int ret = 0;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = integrator_impd1_clk_spawn(dev, np, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			break;
-		}
 	}
 
 	return ret;
-- 
2.51.0

