Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28DCC433E1
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 00:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9324C2078D
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 00:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uuFRKK5C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732900AbgFIAIm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Jun 2020 20:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732828AbgFIAIj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Jun 2020 20:08:39 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90B1C08C5C2
        for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2020 17:08:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ga6so563034pjb.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2020 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zZLqW696D3oJO7I1O1uP6fMk6BzmiZ27tURGZGJzCvY=;
        b=uuFRKK5CrSYPVUF5XSKvu0NnNeYlfOnW84DbGt4odJ6ux7EhMcbJDV0oS9V6qmn91V
         XHtsH0iTL5V9K0eMEPx+j/yAOzCLxyXO6sTZmfam7WoZsJc7aww7fKFzE/UghOI3zosl
         yD4fix4j2B1LG9muFoFVapucNPukNF4tMwfX0Ozg9iewJME9jbIdyIY4MlTBy+RTUPkS
         RebJf4nRJ+eJoqeY6lsq+1a4xFbTwcwbYpLxbLWlAvFPU7+on77WaQt4LEC/2AtX5rvh
         JzTuwo9IxZQf7iHbWd9WtUphfj5D6AGPXcjbUSUNNL6BQZusTxmwe97bY3DaQ7eczKo1
         kOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zZLqW696D3oJO7I1O1uP6fMk6BzmiZ27tURGZGJzCvY=;
        b=B6M8vDp+LfItpmDZ9HGKXIbHCysRoVpAG0aNM5awP7rTa0tZQ0Zf2qGxCz8Ggm6Zxa
         PmdIdt7noJzHCD3LR81gUYUEimy7fgR5PLm04AXqssiA7mttwR6Fj454HWSBa4yZkxNB
         C/9surO3TzlNZR8Do/V2PqhYyywaT5cFsXUnpWNaMoyfbpt5L0Ne1JugunFCk9bo4mvZ
         gboSU9xwOBlL6LPdnQLCSlmlBgFDHk1euTw+S692pipXoPuL1moRlXHmx2tvUhyhfdQs
         HIkCNkrchTHwO7mLbRMsqEuTzjIjs6WJvglSAd604lPO6B/s7Luf3aGd1/QfB1DNXBtP
         TDTg==
X-Gm-Message-State: AOAM532ryXLof440ZkkPMblQYeiJL84yULCfXjeKVrMLenVxC0rd0izL
        y6JN1TC24lHX2vgfvQDGJls=
X-Google-Smtp-Source: ABdhPJwZZiA5EPvRneVKyBQGDpzZ5C/B0lmlCTMEOfTxV0VDio/sQxUmgXQfh93Fr++wNS8zj8vG2w==
X-Received: by 2002:a17:90a:b903:: with SMTP id p3mr1921857pjr.4.1591661317320;
        Mon, 08 Jun 2020 17:08:37 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id p8sm6768516pgs.29.2020.06.08.17.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 17:08:36 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: [PATCH 1/1] clk: add lock protection to clk_hw_round_rate() API
Date:   Mon,  8 Jun 2020 19:08:16 -0500
Message-Id: <20200609000816.23053-2-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609000816.23053-1-sarangmairal@gmail.com>
References: <20200609000816.23053-1-sarangmairal@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_hw_round_rate() calls clk_core_round_rate_nolock() which requires
prepare_lock to be held. It is possible for a clock provider to call
clk_hw_round_rate() API without holding prepare_lock. In such a scenario,
lockdep would cause an assertion failure:
clk_core_round_rate_nolock()
{
	lockdep_assert_held(&prepare_lock);
	..
}

Close this gap for clk_hw_round_rate() by correctly guarding the call to
clk_core_round_rate_nolock() with prepare_lock and prepare_unlock.

Signed-off-by: Sarang Mairal <sarangmairal@gmail.com>
---
 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 407f6919604c..baa7b7f13f54 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1405,10 +1405,15 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
+	clk_prepare_lock();
+
 	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
+
+	clk_prepare_unlock();
+
 	if (ret)
 		return 0;
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bd1ee9039558..431047ead9a9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1144,9 +1144,6 @@ static inline long divider_ro_round_rate(struct clk_hw *hw, unsigned long rate,
 					    val);
 }
 
-/*
- * FIXME clock api without lock protection
- */
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
 
 struct clk_onecell_data {
-- 
2.17.1

