Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BB5C43461
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 299316134F
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhEBMVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 May 2021 08:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhEBMVj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 May 2021 08:21:39 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1A2C06138C
        for <linux-clk@vger.kernel.org>; Sun,  2 May 2021 05:20:47 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i3so3228758edt.1
        for <linux-clk@vger.kernel.org>; Sun, 02 May 2021 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DVP6tvcY63isDzrbgebsNJ+d5nHbeNK30t0HTq6Wq9o=;
        b=Og8MV0xvowL/XNFJbuLBiawFbDdqVUe3M5x6cFxDxOtAZ9uAWLJdG0el6oiCBtbjE3
         Uy89+c9bsXRg316V3OblZgQITGvdaD1PUEa20SLG3gt7upEeAIA0yDlAW+ePzXt2qVi/
         UE5qjhdKEofCBodirCKhTv2yP88/KhjYrMGeWlLie0BDsV8kjYzlnUGS1VnrL0O5UGxV
         gzV9fVS8qapyfiknVpVrU/uHJ23mXtcf/FikaVhs19EaMUVPikvGcpHzseztvw6rMkVo
         SmekMdwy3e/N4qJMCX0luGIXAj/DC2u6RpW7gmEpNN1e5NFbh6Ukcy555ZBBOxhMbnov
         zFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVP6tvcY63isDzrbgebsNJ+d5nHbeNK30t0HTq6Wq9o=;
        b=ehiYZAA8iC0Bk+mFN/oTfZBfSkywHmTUXHemfnIbX6ZgvrbdODiGexViR1URHcvwYk
         4JJeUxPwwXRV0fug7LRVEqIpIdN4ps44lDnHal2nAL6QJb+t2lHurBFnXXWPDt8kZPo8
         azOV5AzZYGnysHKKeEy/aOSqMjEO30nH8y0p6VOoFVA1B0Fohnq3KgtndMJTSOCaVQ/1
         Aa9szb9LTqu/Ig2VRCiPJRcCZxkMdu/nEcufvzTiWLffOgpIRhsfdrScFWyop2ZfnisL
         dqj9GxiQzClJRL6KgFyVqU1IuPFegXlMzW+3L5Aj/uhsALXvQxDJdOf/5I+17KxRWWRj
         b+QQ==
X-Gm-Message-State: AOAM533hPBJByxaDQjr+9vZQKecfM1B8yZDk5OX3TdNomD5+DslbY9qx
        qEy6z+oSRqWcZ7UxoOnYD9c1BA==
X-Google-Smtp-Source: ABdhPJwGSU2RTKhUOnidg44VV7INqtY5vNHzHH8BZy+McrojNRPs1BvDK/zKbJFPPa1OjSEe7j1/3w==
X-Received: by 2002:a05:6402:309c:: with SMTP id de28mr15088836edb.191.1619958046471;
        Sun, 02 May 2021 05:20:46 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id p21sm10064085edw.18.2021.05.02.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:46 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id ab01b034;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 2/4] soc: qcom: smd-rpm: Add MSM8226 compatible
Date:   Sun,  2 May 2021 14:20:25 +0200
Message-Id: <20210502122027.9351-3-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a compatible for the RPM on the Qualcomm MSM8226 platform.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index b93218cb50..abd4178ec1 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -233,6 +233,7 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-ipq6018" },
+	{ .compatible = "qcom,rpm-msm8226" },
 	{ .compatible = "qcom,rpm-msm8916" },
 	{ .compatible = "qcom,rpm-msm8936" },
 	{ .compatible = "qcom,rpm-msm8974" },
-- 
2.25.1

