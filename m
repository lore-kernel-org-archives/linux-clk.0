Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38243C001DC
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jul 2023 13:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbjGZN0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jul 2023 09:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbjGZN02 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2023 09:26:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEF4FA
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 06:26:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so10785983e87.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690377985; x=1690982785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwjQCpCfOEJj4nimKSDJjPHZcz9ikZvmWQ7qOX3431M=;
        b=zT/i9uuRDt+yId4R1ojSpNSvcir6tRZadDAbV6Wny2zZu0Lyv3Wv+qbzRW5a8XiB4A
         ZvF2LIdzy8OE0XVEGVU0tDXtZjZQnJKlV+XxK/97TN3oTlKMkPy51JDAQxE8M8HhQfFL
         jRUDCgvwqMi+Cpd+6Ka9T7e9YiRY0rNwwFJphX4b8amOR6SUFJ8lCLiNzPEvVHtKSGP4
         S+QwI73+2ZhZcQmEEYq1HzjiE8SCNEzQJRXDUyZdolOFo6Ai4jtgX7tTpwxTgIMkf09X
         sNBzxZdAgeutTn55bW9KECHSF6Sf9qzfIt2g65GJbCi5vNZrZcOvqhof8MDPwdS7CvOF
         UVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377985; x=1690982785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwjQCpCfOEJj4nimKSDJjPHZcz9ikZvmWQ7qOX3431M=;
        b=jh+fS/vyRaOALmdOP74q+RLp1VGdu9rUs+D/9laWYEtUlreOga5J5n6oud/282nQa2
         +oe7SRFtu0Wx7BldPr4rpFfl7R3Eriz26kgJOjv3NFGDa+PZzwUKbUqkB3o6UiKGMXie
         ehAq3XZCn2X+nW5p3zt181rqWyeRO55dW0ioIudSTnXW7q57I/ODjFbQ+OA23jx0lqdN
         K1er5/nJevuUukfA4/kf5i99M6x89xa1z7Fo/nIwfOoDjh8/t8DrSixorP1s6VHqH3/D
         3q0GMtqQIgGdZmcIQUMG+GYJDUXO737+/WixbOGTWd2iHtXWqYzTCq3MVAF19uh65wGB
         9s9A==
X-Gm-Message-State: ABy/qLZG/ozShJ2vGJkLm3JxQKrELNCshxrfywpCUa15ya99Hr2KNTzn
        dXmk8gcyYqXKuFzIhWicJBnGGg==
X-Google-Smtp-Source: APBJJlH/LmuLVACTSaYxROWypIaDANfYQnUj51ToYkVa4kNLyMfiM+WXzqvCURYfxtTMOueXEG0YTQ==
X-Received: by 2002:ac2:47e9:0:b0:4fd:d08c:fa3e with SMTP id b9-20020ac247e9000000b004fdd08cfa3emr1296999lfp.42.1690377984838;
        Wed, 26 Jul 2023 06:26:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl59.neoplus.adsl.tpnet.pl. [83.9.31.59])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b004fe08e7dfbdsm742265lfp.44.2023.07.26.06.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:26:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 26 Jul 2023 15:26:19 +0200
Subject: [PATCH 1/2] clk: qcom: reset: Increase max reset delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-qcom_reset-v1-1-92de6d3e4c7c@linaro.org>
References: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
In-Reply-To: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690377980; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3BR/u3fZ23sS3+cIHldabWhPszlrqMwlNCmlfPyu0J8=;
 b=Mn8YoTIjy0jBDF1F4mmrxLegHBGFymzW0x8yviOJWut/dGKoR7DuQtPkKRGA5V7MYFxpTQACp
 2hzWsnFMoijAgoHUDZIvSRJ3l04idJiHatC6NuG1IqwsnnSRDCz5Ux9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.41.0

