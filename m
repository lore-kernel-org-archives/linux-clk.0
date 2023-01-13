Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69679C677F1
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 09:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241136AbjAMJLD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 04:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241198AbjAMJKY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 04:10:24 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1C075750
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bf43so32216463lfb.6
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eCp5P/TMVFbFTF7vzefqI/ZA2E3ZQFeIqWdTLT1Q4s=;
        b=HM8sx/v06ph5D8nBfI/gnRCdbBcGkRlz9G9eAMxhTOythqrp8URubU3w0Lgiz79WZw
         QNSsCo73Lii2SdrN5ybv5YUTWia9Ovm5suipcsjNOmN95vKh569rtoOW4wVE0LIBlUyd
         w9AalLd/3+ycJlKVD8/cgEDCSy+wrnEajMalxLhQM/QYQFVYFaNB9p8UHxbRmZ3S8UMX
         6ZuZSat050V3jpP8J4VnBTZMuFnj5F1d6kiO0c45xwOUgjYVRyzlOTFkI+zqZi8jpE4e
         tBW4fE5JPPMgVSedwCJxFuzLWkRzmGL7+LwX1o3+OY7lOWcBN5u/gEUE2xMq5WLseUj+
         zgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eCp5P/TMVFbFTF7vzefqI/ZA2E3ZQFeIqWdTLT1Q4s=;
        b=jHu73D5kq4Q1X+nVKTY+BotF6SSdWF993TsZPq0eUWaIEGNi2SWtuNOwqMRNloJOIb
         YAmDtBpNUX37ZkEFVO6X19LyT9HqFRnkmhZ/4i43BBPDewugsWAjqWjMnVG+MeY4MN0F
         fLEbE0n7r5NNoL3ZeAcarIQM+lVuKNYqxe4H19HKBBGkIJjrugmFd/+AKTTcSHhp+UYj
         yK3VsdE7R7pyc/EvwfKrpqNa33cFzGbxJjXTVUwmCaQGG5cqbhpxeUoHGvl5GCM8UK2D
         v8d2jT6wdwq0HmSJyLCg1K7i16c1eEWC8nVlIjwCisJM77blzigLfIGGdEGr5dILrJwi
         s1ug==
X-Gm-Message-State: AFqh2kq0wmDD5BmhHfBtsAXIk6PsNShhoohxX0u3iuxGXoKR28UHwSYe
        DnZpklusykt0/PNj9FZR1I493w==
X-Google-Smtp-Source: AMrXdXvxZZm6392EWT1MaPSsii9UKpBAx3zLyhu7p6kipsBV5ZZLuiGSTGaIIxTXTP2frdfKnSVPOQ==
X-Received: by 2002:a19:ac41:0:b0:4cb:3471:ab94 with SMTP id r1-20020a19ac41000000b004cb3471ab94mr9933151lfc.31.1673600870936;
        Fri, 13 Jan 2023 01:07:50 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:50 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Fri, 13 Jan 2023 11:07:37 +0200
Message-Id: <20230113090739.45805-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index b8a44ef0540f..5e7c83345774 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -141,6 +141,7 @@ examples:
         reg = <0x9820000 0x1000>;
 
         #mbox-cells = <1>;
+        #clock-cells = <0>;
     };
 
     rpm-glink {
-- 
2.39.0

