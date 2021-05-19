Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6580C43461
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC35613AC
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354441AbhESOlR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 10:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354479AbhESOlC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 10:41:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE10C0612F1
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:39:06 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gf3so447883pjb.5
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GuVgCqdDVbpVqTxpQsc56DvhHyMstWv4OtUHtXIMiUo=;
        b=KMuY5RNLdpiEhbr2tQeG5s6v3pPiLIlI1eHS7+xBwnBDl4QKs/qJkehAf/jhLtG9Ka
         SIMGaIbNYqABeb8L6/tNJJplCjRSBVzCW/91ym1uWcj4oIftLXssT1qc1fFe7CBBo63I
         FzGdRLgD3Pui+VDruj4QV+i8iAdPOYyfQCtyMdpEp+y94hmEG/3uioaphf7Too+y87U7
         Gvmcr6KoudOm9eLo8Nj4ZCZQ09SIqlBLVmTdNVPGjOso6Bsmmq5Qf29Zwj1vGLXMilAy
         DTGU6Tb4sfRlAdr5Uu05Su9CUhbunrNfACptzwkqPBYyBBsIYnA8EcDXchIHgO7aXyIU
         wrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GuVgCqdDVbpVqTxpQsc56DvhHyMstWv4OtUHtXIMiUo=;
        b=qIjoPlhSGQ5J2vlZPmJ4NYz9HrUqZzjfOhG9nTWJtwpYlvUImXuARCU1Bb3wBAkZl3
         6/pkzIvNuHIeFtQQDWtwpz/XmfgDpYclhm6Aa4RQ7c9ntdmpcJ/PTcjmvvxqls66JMM7
         aK4MYqeaCErXUH2ho2ttXGY4UeCzNxp5gLrZnSbGV0IZFDknneYL+HSO5OUT2n/V8Odb
         5YyrnBcSjLxlXpQ7MXW94HfW7JI3ot5y8kWddvccSSwy41Yz25imWwx5FOAwEaqM/blF
         oFWMOGQMvtdbfOLDG6rkgVQDh3ldkb+t2MUvOvxJHrvFxiy+MGHcrN9WhpFhywu5LYwr
         jB6A==
X-Gm-Message-State: AOAM532o7LvLui0KNa8FRVwO9frV90WHkBsM6sn8LA6TcMoDPfGFpFdi
        DbAYg4VAaE1uB19u7tFX+E77aQ==
X-Google-Smtp-Source: ABdhPJx6hdlVq88LAcpGG7h74r7c6fsEv4sgmH5s5r4MC6EmcaFYn3potNLrbADj38Bf6Dwiy0Ztrw==
X-Received: by 2002:a17:902:f545:b029:f5:4b82:9cc9 with SMTP id h5-20020a170902f545b02900f54b829cc9mr593285plf.68.1621435145578;
        Wed, 19 May 2021 07:39:05 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:39:05 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
Date:   Wed, 19 May 2021 20:06:58 +0530
Message-Id: <20210519143700.27392-16-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

QCE crypto driver is right now too silent even if the probe() is ok
and a valid crypto IP version is found.

Convert the dev_dbg() message to a dev_info() instead.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aecb2cdd79e5..8b3e2b4580c2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -179,7 +179,7 @@ static int qce_check_version(struct qce_device *qce)
 	 */
 	qce->pipe_pair_id = qce->dma.rxchan->chan_id >> 1;
 
-	dev_dbg(qce->dev, "Crypto device found, version %d.%d.%d\n",
+	dev_info(qce->dev, "Crypto device found, version %d.%d.%d\n",
 		major, minor, step);
 
 	return 0;
-- 
2.31.1

