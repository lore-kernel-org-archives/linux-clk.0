Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B2CC001DC
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 12:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjGaMUi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbjGaMUg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 08:20:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0890310EA
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:20:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso7076571e87.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690806017; x=1691410817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNF9IdXEoScQDQd4iXA1YdLLJSZxC/415F/i5Utx2I=;
        b=pbYr8hnfKrNxskEMiBKtY9WoNxPZdEO6NUf+LFeHvwPAPEOkdiAreUI+6hlhyiaJ2c
         UBi6TsKJclWbiGCdX0ujIow0StXJofPMFXbxi7dsqcckpBTOwI4kIJ5K13STB+/z/+kh
         hWrvgDFOADjGY13x9MwNqaqYccyjHFjHQLzwq6sZWZSULiUDRsXM8V+Jfxib/mO/odst
         hOckbn2l1+mrkXznYH7nIk8lnmUn6rMwpv3fhMBmr71gk3kxWN9wfnEeQqX8EXe/sTcy
         9G2K/j20ecXAvLZXpv1s++zJN8KDGSJdzzoWrBYH4Et/Rrd0CraS+xDv9etBHGZm8VHL
         TjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806017; x=1691410817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHNF9IdXEoScQDQd4iXA1YdLLJSZxC/415F/i5Utx2I=;
        b=eaI0mh86wmZH1zxrYQIwlQNI71RMv5YViAZdK2TIxGMixfkXjnh65kf+dB/dC/h6il
         a77Zq8NVG8mVE9u5bEZbfHflMcKW1CEb8CENIte2LpPa7NAvWvf1G1cALSm0mWrIWKQT
         +r65Tet721GFvZt6A0WhO000RfWxzti5soEDVNJoUoEUO3FsOVaIz6zC7hysnq4V2dFu
         Zs/MS2PrNErN2IB1g6r7PEnOSWlk8PJEeJs5vD7w6RCKDkKLExY7DwcykdaH3hDLyqf2
         vaADbve5GNB8+C17p3PcTXaHbOdi085wE+bWDSO5Bmfb/eaqVg75lzFqhdZ9SlPamQku
         TjCw==
X-Gm-Message-State: ABy/qLau/rZiBfjCJyBmUNT2QMPOwWmEPdeHOvQM4If+tbhFVmvkw1gs
        MZp76AX4I8eTW4lfdMViOqLIvA==
X-Google-Smtp-Source: APBJJlHfTowJT4LROWlOLymbpAVr38gTWPW6Gp01dIw8lSG0zl6H2bPPyZ0IO3yHbijO5RfwOc5g2w==
X-Received: by 2002:a19:ca03:0:b0:4fb:8771:e898 with SMTP id a3-20020a19ca03000000b004fb8771e898mr4618363lfg.15.1690806017288;
        Mon, 31 Jul 2023 05:20:17 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512040900b004fe11366146sm2079096lfk.51.2023.07.31.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:20:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 14:20:13 +0200
Subject: [PATCH 2/2] clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on
 PCNoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-topic-pcnoc-v1-2-452dd36d11d7@linaro.org>
References: <20230731-topic-pcnoc-v1-0-452dd36d11d7@linaro.org>
In-Reply-To: <20230731-topic-pcnoc-v1-0-452dd36d11d7@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690806013; l=1116;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+W0uIDuc/JsKDaPo6r8vR/8nsAtUZyS7FUGMmEfo4sQ=;
 b=mjwDmDZetZpVGG08tKYROcePohsp0mFSBaoaPmoS+I42e75UwmMpBAtQaRO1wE4gCVsp35qwu
 +RSHWqkWae7DtQHj3asvZcO0yGj1KBGNZWS3l/6f78yCHljSYvF/9AK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On all supported SoCs to date, the PCNoC (a.k.a CNoC_PERIPH) clock must
be always-on as long as the APSS is online and only has to run
at 19.2 MHz. Define it to be as such in the ACTIVE domain.

Some SoCs use that clock for bus scaling, while others just need it for
reaching the hardware. This commit will hurt neither.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ebb8d9aac89d..0191fc0dd7da 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -455,7 +455,7 @@ DEFINE_CLK_SMD_RPM_BRANCH(aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
 DEFINE_CLK_SMD_RPM(aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
 DEFINE_CLK_SMD_RPM(aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
 
-DEFINE_CLK_SMD_RPM_BUS(pcnoc, 0);
+DEFINE_CLK_SMD_RPM_BUS_A(pcnoc, 0, 19200000, CLK_IS_CRITICAL);
 DEFINE_CLK_SMD_RPM_BUS(snoc, 1);
 DEFINE_CLK_SMD_RPM_BUS(sysmmnoc, 2);
 DEFINE_CLK_SMD_RPM_BUS(cnoc, 2);

-- 
2.41.0

