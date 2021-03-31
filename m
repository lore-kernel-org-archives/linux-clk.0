Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6880C43603
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 20:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D691610D2
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 20:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbhCaURe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 16:17:34 -0400
Received: from st43p00im-ztdg10071801.me.com ([17.58.63.171]:53169 "EHLO
        st43p00im-ztdg10071801.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236639AbhCaURV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 16:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1617221840; bh=D4dih7IDfleZeM1jkz2mIoV9uzt0mlpafIv8IABeh0E=;
        h=From:To:Subject:Date:Message-Id;
        b=T2mR7WQ4Gx0/6kxxDvhUB4cyNhmFYBSxIgxN3ICnSS2R1wwrZZMlnKvB2VUfuLONG
         qKQEEPTubQKA8A5BzIOzdLSxtjPyovV1KK6lojSPe+7s5N3PhFmozNSzO4NiRS3Sx5
         1Y7v5GqIx6IdF1UzI2VZEgap2qigjKdOJbU3r2CxToJI5ppykLpRUN1BIgr2mu+noc
         0LFpsiyCZXOH8haFUBfyt6DqLSma1XVkhTZ4ZvxBg9bZatLvgXpHEWyQk37JhXHolx
         zgBMZflQRGGLR+tUX30lIWOo8gekIN7tbgEmsjVFDLvxg9+w+tl+cY+MT5zxU4Bjuh
         MgoamUcRfRuUA==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztdg10071801.me.com (Postfix) with ESMTPSA id 6BAF9540116;
        Wed, 31 Mar 2021 20:17:19 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH v4 7/7] dt-bindings: clock: st: clkgen-fsyn: add new introduced compatible
Date:   Wed, 31 Mar 2021 22:16:32 +0200
Message-Id: <20210331201632.24530-8-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331201632.24530-1-avolmat@me.com>
References: <20210331201632.24530-1-avolmat@me.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_10:2021-03-31,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2103310141
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

New compatible are added, supporting various kind of clkgen-fsyn
used for STiH407, STiH410 and STiH418

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 Documentation/devicetree/bindings/clock/st/st,quadfs.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st/st,quadfs.txt b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
index d93d49342e60..c4ba2adb0b4f 100644
--- a/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
@@ -12,6 +12,9 @@ This binding uses the common clock binding[1].
 Required properties:
 - compatible : shall be:
   "st,quadfs"
+  "st,quadfs-d0"
+  "st,quadfs-d2"
+  "st,quadfs-d3"
   "st,quadfs-pll"
 
 
-- 
2.17.1

