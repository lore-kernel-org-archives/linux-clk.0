Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FF1C48BD6
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 08:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 477E02084B
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 08:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kBorpXNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfF0IzY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 04:55:24 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:44536 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725385AbfF0IzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 04:55:24 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5R8sI3R009643;
        Thu, 27 Jun 2019 03:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=VkAcWT3URKdmT58/R5+h4K5MWFQ/lKfEPyTrhQNNgbs=;
 b=kBorpXNGlFPmg3zIFXRI1fC0tsUlcHXTlDfUiHhNmsVfQ8To+UQ9Rc6VCfJAJ4yxWjIl
 273MKX4E9EyrIsQqKjQxoWigk4VVndL5uzwN53leA/3He45Cgyur6sNqBvpxmnL+y5id
 rP+WuD5GOpMXal1jJ5GjSqfZRRSud6yrO2Kym5jAhzrplyuPsj8sK3My67FjH172SFIO
 Ie3xVkSM36fP2395FkuBzEKf07N5aqpLD3rV127+Hw3XjCW0skUIPVdyqhZ56vCB/1IV
 b414nPfGnglMLTb7M4ymqDx3xEtVXfo6IdU/m6FlVflPOuFXn0dUDwX5w2rbG/hhNvvQ bA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt9kna-1;
        Thu, 27 Jun 2019 03:55:18 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 4F31E611B6C8;
        Thu, 27 Jun 2019 03:55:20 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 09:55:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 09:55:17 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A333445;
        Thu, 27 Jun 2019 09:55:17 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] clk: lochnagar: Update DT binding doc to include the primary SPDIF MCLK
Date:   Thu, 27 Jun 2019 09:55:17 +0100
Message-ID: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=938 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270105
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock was missed when the binding was initially merged but is
supported by the driver, so add it to the binding document.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
index b8d8ef3bdc5f3..52a064c789eec 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
@@ -40,6 +40,7 @@ Optional properties:
        input audio clocks from host system.
      - ln-psia1-mclk, ln-psia2-mclk : Optional input audio clocks from
        external connector.
+     - ln-spdif-mclk : Optional input audio clock from SPDIF.
      - ln-spdif-clkout : Optional input audio clock from SPDIF.
      - ln-adat-mclk : Optional input audio clock from ADAT.
      - ln-pmic-32k : On board fixed clock.
-- 
2.11.0

