Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1829DC71144
	for <linux-clk@archiver.kernel.org>; Fri,  6 Jan 2023 20:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAFULL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Jan 2023 15:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbjAFUKe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 15:10:34 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687968409A
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 12:10:32 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g13so3520176lfv.7
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuUy5yyevuXzH7JuK2+w6B5BQU4+qQbNBPhTpPAW49E=;
        b=zdSvQNRvc4UnPxfIb96X/vFrLp8/WzQ6E4EABtgjLnw4h2FHxTs/iykysWMX0BIyQf
         Bi3SYVTDHy7h8fbJC2Q5yvGEFIHfzBnkNeVfRnACDt/RlXjRONWn1mdvR2pOwIhwcX7X
         jqejIBo0Q6skdgHFSmkAKRtPMvlS9DHgog+RWSDhX6JHaSiZpdQGkyAADQV/NOYYXnTb
         mi0uM3z5xDHSqBhesr66HF6IhKTA7+6QTzpKBkmCRJMsSONuFxmVKSXP0O0ElGJfVimo
         3Gx8vKLG5Q5tjUz/RUudCZKyM8zjbEdZuQBjSE2nTOAg2YlX79hH5LdHBdOto0HkDh28
         hLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuUy5yyevuXzH7JuK2+w6B5BQU4+qQbNBPhTpPAW49E=;
        b=29BzRNPJlXDTOgJj9JEpp0kyetvi/a8YB1L75HsHC/VCO/O3OSxRdIPyik5tPucC97
         u1hEyzqKe4nUETdLWSHhkjpQqn4YpayiZ4EeUw0q7SavTmViwUCOyHxfPgK8jKeZbBzu
         i9vsM8tEODOWidYhBu1izQ86Z9h88cdvd02zk3kyT6WyvYyhz9Ecbk5DMhs4+uF9KTq+
         L1TU4isESIMNkUgiyznEAsU1nJO9eyO5zzoWAX40tx4QVBN7hq8zTcnxpDCnjmVKIUa/
         LwvvcrqFx2R2LI9hsBN7CJoX6Q9Y3WpPZZF+CHY2std1NJdMPSXPZKIPcyTe0Ej6+m7O
         Th3g==
X-Gm-Message-State: AFqh2krytVgGcghF/nR4G16n26uP3x2+pru1kdUlazsMa2E9ntda5D2i
        /jUVPCTrm5lSm0Wz3RgnfG+80g==
X-Google-Smtp-Source: AMrXdXv7Y/4iNUsUw6hS7Lbgq03gUAjyZCLZ50ZgqYhkOjMEiUmdv6BU/LrEeejlecWintFTpU9hGQ==
X-Received: by 2002:a05:6512:110c:b0:4cc:586b:1837 with SMTP id l12-20020a056512110c00b004cc586b1837mr2684617lfg.16.1673035830774;
        Fri, 06 Jan 2023 12:10:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f14-20020a0565123b0e00b004b7033da2d7sm260875lfv.128.2023.01.06.12.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 01/11] interconnect: qcom: sdx55: drop IP0 remnants
Date:   Fri,  6 Jan 2023 22:10:18 +0200
Message-Id: <20230106201028.1809541-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
References: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop two defines leftover from the commit 2fb251c26560 ("interconnect:
qcom: sdx55: Drop IP0 interconnects"), which dropped handling of the IP0
resource in favour of handling it in the clk-rpmh driver.

Fixes: 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0 interconnects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sdx55.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sdx55.h b/drivers/interconnect/qcom/sdx55.h
index deff8afe0631..46cbabec8aa1 100644
--- a/drivers/interconnect/qcom/sdx55.h
+++ b/drivers/interconnect/qcom/sdx55.h
@@ -6,7 +6,7 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 #define __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 
-#define SDX55_MASTER_IPA_CORE			0
+/* 0 was used by MASTER_IPA_CORE, now represented as RPMh clock */
 #define SDX55_MASTER_LLCC			1
 #define SDX55_MASTER_TCU_0			2
 #define SDX55_MASTER_SNOC_GC_MEM_NOC		3
@@ -28,7 +28,7 @@
 #define SDX55_MASTER_QDSS_ETR			19
 #define SDX55_MASTER_SDCC_1			20
 #define SDX55_MASTER_USB3			21
-#define SDX55_SLAVE_IPA_CORE			22
+/* 22 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
 #define SDX55_SLAVE_EBI_CH0			23
 #define SDX55_SLAVE_LLCC			24
 #define SDX55_SLAVE_MEM_NOC_SNOC		25
-- 
2.39.0

