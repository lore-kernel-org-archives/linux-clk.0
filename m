Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EAAECAAD8
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 15:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbiIUPlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 11:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiIUPkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 11:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC9226C8
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663774743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7+IfXo3QneUTvZNphDXYsfYPPsR08u+bVDwtrNeIpao=;
        b=ETuq8bGKqbkiMH+XXQKPeUt2oUUbOhSww6uJSoD+kr7lRZ0yzUc9tCfePM2M3vw3alT56q
        AUTe5wIAxrRYHreUgQC1Bq0xf20LsCx7oiiLKP7rTkr+/3tujwJJNAVQksNDJQbbyqOy+Q
        5NdQSiweq86iWfTrFo3axic7S9/2AaA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-YH1kpIuONU6ARnUMBsp6pA-1; Wed, 21 Sep 2022 11:33:00 -0400
X-MC-Unique: YH1kpIuONU6ARnUMBsp6pA-1
Received: by mail-qv1-f71.google.com with SMTP id nm17-20020a0562143b1100b004a5a3002d87so4495756qvb.8
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 08:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7+IfXo3QneUTvZNphDXYsfYPPsR08u+bVDwtrNeIpao=;
        b=Sb5pkU4GIWViDtWuW6BormFjCLRdcOBTFt5exOiVKeCZywBp91dVzfkBmUHwpidati
         Mx539+7LLYd70wJIMqc0S7AgR7ac/LHGgIUcXW5x3t9ZrNXyxpPBU7z0Okue1xnMHst9
         MVg+pOjPyqI3xTAn4k28NfjuWHnYInn7wTtL6OEM9jirk+NS/FcfXsGR19tMpeSi8RSP
         4OhqPVd/9zuCr+YZMhXJhPze5ldTxudMZc+BEjllkzu4Fck7VUNZoxXYs4KUH1TOyQ4g
         VRIvWMIiVX/3550rwsZ6yovuYzBUsGbVOmScXvURxH9wvv7WPcRNap7RCYB+2V8+I+qs
         NHLQ==
X-Gm-Message-State: ACrzQf3Srhl4YsoRFtmUGWCKdbIdmFdIJOU3+ksIMe09r9x9DP0NOttf
        39U8K5NK08XAOPdBaKI1UsHjp+95kjQdQ6l0UVYAR6BHSKFW8+z4FEiBVHAkE3s3JBa3rNVLKCJ
        HuC8k/XzU5Q6NcF8wZKaB
X-Received: by 2002:ac8:5895:0:b0:35c:bd1e:aed2 with SMTP id t21-20020ac85895000000b0035cbd1eaed2mr24073973qta.618.1663774380015;
        Wed, 21 Sep 2022 08:33:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5x+IR5tky7En11b9XPJIO6r4GWLMl+xjgqJY4mIPE+hIi/vN1wx8EqtfecainIssiPt2yGDw==
X-Received: by 2002:ac8:5895:0:b0:35c:bd1e:aed2 with SMTP id t21-20020ac85895000000b0035cbd1eaed2mr24073961qta.618.1663774379812;
        Wed, 21 Sep 2022 08:32:59 -0700 (PDT)
Received: from halaneylaptop.redhat.com ([2600:1700:1ff0:d0e0::46])
        by smtp.gmail.com with ESMTPSA id u15-20020a05620a0c4f00b006cf19068261sm2100324qki.116.2022.09.21.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:32:59 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH] dt-bindings: clocks: qcom,gcc-sc8280xp: Fix typos
Date:   Wed, 21 Sep 2022 10:31:56 -0500
Message-Id: <20220921153155.279182-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

pipegmux and SuperSpeed are the proper spelling for those terms.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index e33dea86fb9e..b1bf768530a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -33,7 +33,7 @@ properties:
       - description: Primary USB SuperSpeed pipe clock
       - description: USB4 PHY pipegmux clock source
       - description: USB4 PHY DP gmux clock source
-      - description: USB4 PHY sys piegmux clock source
+      - description: USB4 PHY sys pipegmux clock source
       - description: USB4 PHY PCIe pipe clock
       - description: USB4 PHY router max pipe clock
       - description: Primary USB4 RX0 clock
@@ -46,7 +46,7 @@ properties:
       - description: Second USB4 PHY router max pipe clock
       - description: Secondary USB4 RX0 clock
       - description: Secondary USB4 RX1 clock
-      - description: Multiport USB first SupserSpeed pipe clock
+      - description: Multiport USB first SuperSpeed pipe clock
       - description: Multiport USB second SuperSpeed pipe clock
       - description: PCIe 2a pipe clock
       - description: PCIe 2b pipe clock
-- 
2.37.3

