Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85D3C64EC3
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjBFO5T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjBFO5S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:18 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB561EFDA
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:12 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id sa10so4536535ejc.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
        b=g0lk6lQ9/5qDlN+jx+cIKAK+CzDdnGuY79fTWxVVVflZQYXH8iOFmI4KMOSOrIvhyB
         yvGuhqjex8kNCLXPbiLkRDL2D7Pdf9T8r2q2SilOM1VHQB/sYjT+WEhT340g/LZBcyEa
         98Zxsn4QZcvfL3KJGXgA5UGz0A9/r0gU+NOeJ1YWeyYRhD7kBdkLnjBmhTG/yi0jbDTR
         MV9bFXXpKsxbiKaZXHRzUWiUz3dO2Vadji/AGOZzxHcmsK5bl2Z7UbdVObYptduxl4Nf
         O9X/ICh1iLtn2b3dbyqxOTZcnbOuSBaXM60072rlPwt6zxl9Dzf3AUlHF0rVlKlmn+wN
         kOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
        b=h8qG54BloHWpl9+4LseMY3hh1WnC+1KEsCzpU1sHz12wqkJ0sQvK7E+fXbPakwQ6zL
         N9CRVLvbHQLTKZw5nDXGrRtArucDTF3c/cP5KFWg3aq8bnhFp2f1e76BWV0WFOnYmklk
         /MgJT6jPy8ge00ac6Dq92w1xfso3xi/t6oZYCohLjmHhWKYoT+HZmkyfp+j+MYKviCN+
         eaTg2aFiWzxwFf3UxFABIlGwg5XBf8AcNCtuMEsEEH92+usquSWFfK/lFoszpqO8gQX0
         eOlWEyXfha9U9hiRFyZCHcS9v5mGdWMmQBpk/tQVa43pNRuJrrFIArQIHdFBFNWl8hYe
         SwdA==
X-Gm-Message-State: AO0yUKXJmxfcPhXyC4OOPvvQXo7/mrSUIh+BiCEjjvp8bwNOJTDst9oQ
        5Ma/HPYZp72yoiKTefcVdvbA+w==
X-Google-Smtp-Source: AK7set+fswQrgLJfUMmLNflu3azfuIvJJxV2viagzNwy/64d4QWg+EyABuN80ZeWFRLqMjPKz502HA==
X-Received: by 2002:a17:907:6d9c:b0:895:58be:957 with SMTP id sb28-20020a1709076d9c00b0089558be0957mr10435653ejc.2.1675695431555;
        Mon, 06 Feb 2023 06:57:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/8] dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Date:   Mon,  6 Feb 2023 16:57:01 +0200
Message-Id: <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add define for another power saving state used on SM8350 for the GPU.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

