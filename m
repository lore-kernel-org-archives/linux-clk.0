Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD30C77B73
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 12:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbjEAM5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 08:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjEAM5T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 08:57:19 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1EA103
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 05:57:16 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so23888141fa.0
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 05:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682945835; x=1685537835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yj+EzAgsUG5Em1uJTZRhqMUdZlbskRY/arS004TCkM=;
        b=B9IWMG27JPGpZI8gUXQMEfsWPYFSYAm0fyRuGrnXSKLDFtKgBWLdfLp/lKvxPYpf0d
         N0LOgw9hLoceoy3ARo4dbCHy9OzED7sM31+UkHwZz2+g/YkX734roDvlz6YJuS/VQ0BE
         00/Mkq1loamZRWlhHOc73OPU6QsfcQ6oOJfNkJiGB28ijZxoZOZ5o6F2St3CzJjUJJxI
         P9W9+ZGBNvN0UPjI7dJuNJM8wwpDnrVrfpPpqL00v4hdnZIOzqYPlaNh/wIYYzJpZoYq
         6Al5LP0w9AzdlpDLD0/KbIzPyrQi3N9NAX3fEF9HgMUGmyBNiQ/orgbKcfSdzrIFizAx
         fKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945835; x=1685537835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yj+EzAgsUG5Em1uJTZRhqMUdZlbskRY/arS004TCkM=;
        b=bJdiJrk5aecTzK4tXuDw0XxWItE/rcHxBYvo57QCVeq/VVTW5zRlPy9nQpJSF2GUtc
         ZT3dN9SYcbIvLvi9W97PuyUjPI5G8YY0wx4qk+q3bsX/ER/kF8fhvVd+vM8rKVyxjkCL
         Z3/3vlrtGTeEvSIB+2LQ6GrxV/OfbVk6LBfOOYl04FYMqfnJW5LVZrfbSxrEPadUnFC3
         7jXmCybx5O9A3M3dve/5QfmThNlL5ZIoJ4kAEIsSJm8nYyciD3kWq4P/CU6um/LVOZsI
         3VI30MWTlIRx1zqoH6xslaTm9m0byUM2HQMV/rAzuJDbranbSfYHZVw3Kh/GtOyKwwaQ
         NRjg==
X-Gm-Message-State: AC+VfDwyMbEnu8KOTlS7V6F4+AQOINgpTfD9bzRjHUDXpQvZz4rijDPO
        G1nxEuZjtgiKHQfKvu+RwRKljw==
X-Google-Smtp-Source: ACHHUZ7e+oXy+s9IC0V3lDiUd+O0BuhJQKzqPklAN2tzvGgzXmg8mGaSTJfk12/xokgMrQrsFOH0sQ==
X-Received: by 2002:a2e:7e0d:0:b0:2a7:f1e8:b08 with SMTP id z13-20020a2e7e0d000000b002a7f1e80b08mr3363092ljc.19.1682945835172;
        Mon, 01 May 2023 05:57:15 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y6-20020a2e95c6000000b002a77ab1d73dsm58332ljh.96.2023.05.01.05.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:57:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] Mark RPMCC XO_A critical
Date:   Mon, 01 May 2023 14:57:10 +0200
Message-Id: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACa3T2QC/x2N0QqDMAwAf0XyvEDtEGS/MobENJsB15Z0DkH89
 4U93sFxBzQxlQa37gCTrzYt2aG/dMAL5ZegJmeIIV7DEHr8lKqMVt/M014mwsgkPPKYKA3g2Ux
 NcDbKvHiYt3V1WU2euv8/98d5/gCNeQIydwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682945834; l=959;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lEfD0mmHrOC5fcfJkFA4Njozsjf+rOEhZPlsR22oTUc=;
 b=G2yoh6Mthv9u7eoX9sRud5gyKYDyxJhZOVaZnHOeWAecrdKPMJ5phO8OQM8Gf38dTdI9mKbGA+se
 yG5/KeSgBvBW5TFJ2RJ8C1iJrnm1FtF3ZQld6UZ/O2FOwIpGIWoC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Arm part is supposed to hold an permanent, active-only vote on the XO
resource to prevent the RPM algorithms from deciding that its main clock
source should be cut off.

Guarantee this by marking XO_A critical.

These patches are extracted from a broader series at Stephen's request:

https://lore.kernel.org/linux-arm-msm/3040c836-4db8-7e7b-3ed4-6d71f0496cc5@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      clk: qcom: smd-rpm_ Make __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
      clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
      clk: qcom: smd-rpm: Make BI_TCXO_AO critical

 drivers/clk/qcom/clk-smd-rpm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
---
base-commit: 92e815cf07ed24ee1c51b122f24ffcf2964b4b13
change-id: 20230501-topic-rpmcc_xo_a-2caec8c8dad5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

