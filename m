Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D5FC43217
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 20:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352918AbiCUUJk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 16:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352938AbiCUUJh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:37 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B87103DBE
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r10so22252875wrp.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mEFtl1Tv/8nxJX+EKBZcS0Lbq1ln6/kUirDV/Y73Tsk=;
        b=F3u4P2haN80NrYC3ry5184pwPLJ/YQ3Giy8swGovoQmMsCQ6epOO6PnK/ZYYrgUlG4
         XrFw44QYsT+1XIdOx8Apq84YhG+Bmip+iW14+CfVb5HO9Up36ocNDiqUqWFpxlCcVnYU
         MXentJLxLq1zjQ5EbW+iCgXlPPXr06Js/lSjzmXhCa9Tzp9iEqGMsgbr7PWoFB3HyB+j
         olxsoLTCA3bzP73p2v4DC4Vn7SqT+htvS3Bw/Ynaje3tRX7TcNRePnKo9XOyBJOsN05q
         Y+iplil8uOnefQb9/1ELEnNGEP73Nt+vqB1dpisFP2PQC7sTR15IYQBp+ejIJyfjcuAK
         EYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mEFtl1Tv/8nxJX+EKBZcS0Lbq1ln6/kUirDV/Y73Tsk=;
        b=go005gLFYjsT77817U2XjSdDlK39gpKkcsKFNlNAmIOXWS3B3RfHO8jH+Dc83l/T3q
         VtNnKySKvmJfP46F8Kns5f6VvHi4aoy5yBDs+vYJuqpFGHMkbhaIeEZofVZqXpqCOFbE
         4Q7M3mHbYld+LSe0QsWC3cAbVborqHIbydCPs4LtTRXXe7QQxIyt4TMTj0h9SD0pP5OY
         PuJ8ellrjgG+T7/+0ScdOodPFvYvNz8vrdh8XJkEsI0omxvJN7sIq0lPxtSDQI180LnJ
         2fAOBcg1ktD2V6N8YVGI4rLp6R5utTvak8T4eE7cGxfWgomB07fANDyhEti6IyZc6fW1
         IEBg==
X-Gm-Message-State: AOAM530jTJnJP0zojQC/IG2JrbGdUIdNUQ7H/7Bhhtqy5LJB9A0W3GLv
        fe/1xMDtz9RQSdn8A2kd4o2hhA==
X-Google-Smtp-Source: ABdhPJxkRI1qN0mzT6Z/8NVjt0akO5/CVOtecvW98ZeN8iahdZXAXfJOQaJBPSBncrIHwFoZBScOrQ==
X-Received: by 2002:a5d:59a1:0:b0:204:1777:fc08 with SMTP id p1-20020a5d59a1000000b002041777fc08mr3923959wrr.545.1647893272263;
        Mon, 21 Mar 2022 13:07:52 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:07:51 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 04/26] crypto: rockchip: fix privete/private typo
Date:   Mon, 21 Mar 2022 20:07:17 +0000
Message-Id: <20220321200739.3572792-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This fix a simple typo on private word.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.h b/drivers/crypto/rockchip/rk3288_crypto.h
index 2fa7131e4060..656d6795d400 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.h
+++ b/drivers/crypto/rockchip/rk3288_crypto.h
@@ -235,7 +235,7 @@ struct rk_ahash_ctx {
 	struct crypto_ahash		*fallback_tfm;
 };
 
-/* the privete variable of hash for fallback */
+/* the private variable of hash for fallback */
 struct rk_ahash_rctx {
 	struct ahash_request		fallback_req;
 	u32				mode;
-- 
2.34.1

