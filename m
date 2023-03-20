Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A59CC7619A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 22:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjCTWRy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 18:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCTWRs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 18:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266F2B2BB
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YlOqWVli75QXNprPmQyXqnWUqk+FMVr+7rpbpXO8i/U=;
        b=Hjke4Ju36G5wc2SZ2+ojpk6gzJJ48iDilmS29P1C9q+oknxFqzO92qUwE3RnleRh5dyM5m
        jzm9qThSSAR/i32M74RWHXKIB86RPATz7nSO2wCaSeeb8Y510BugvFc3MXQ9AIFlWCNrM0
        jvHPueCK5UoeaxCFbs4ZRSitTqLFcIM=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-lObv70D7NvG-YuRyN3dlWg-1; Mon, 20 Mar 2023 18:16:37 -0400
X-MC-Unique: lObv70D7NvG-YuRyN3dlWg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17270774b8fso7725524fac.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlOqWVli75QXNprPmQyXqnWUqk+FMVr+7rpbpXO8i/U=;
        b=eG0ykJ4iHSr0MgKTHFXxnMJxnTNYP0PN49fmi0VfB3jADzZwV4OVunbVNOMB/DF5Uo
         OFryYat7RFAm15/ycAhhwLLShyx50PfKMAaBaZetNgWdO9C778lqRwBuqZAyUYnv9YsI
         SgW2/wJOoJnkb8rj5EReKqoZJ8MoHY6dgEon4SU7FqIx+xC1M2am7bEkP5eDunTymO7L
         FkVtGkgAYWdGe5v9aPViLMqn0o+CFNbiZN3apepj5YWFUhUHdLbeNQzojPtWuvF46lE5
         axEs0+RyA9CeNizfRvH5gqZ0YDaHR2Pxx7IdO4cjScjEet3rm3AJUfG6cLX9GBq78HYm
         TwQA==
X-Gm-Message-State: AO0yUKVxITqcbXR32XgggQgYqFk0TmFiraoqtVoZXl3JEHFhejGQvuCs
        iNFtTSwQcMID0WK7NCUjzFrK0hh2ysW0AQBqUsXVWHrEvfFQCQ3ZQmz2VspW8zD3b8ItM9E/etr
        8e6kXhRVQW2ag6Xj+yCU2
X-Received: by 2002:a4a:d50d:0:b0:525:432a:90b0 with SMTP id m13-20020a4ad50d000000b00525432a90b0mr826252oos.1.1679350597018;
        Mon, 20 Mar 2023 15:16:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sFN8OAUwmdLsJ9ZBRkT2O9PURonEVDvf0kVHAlkwFMtWoYbZeUAmr9vMfEPdP9CsKmxVlEQ==
X-Received: by 2002:a4a:d50d:0:b0:525:432a:90b0 with SMTP id m13-20020a4ad50d000000b00525432a90b0mr826216oos.1.1679350596785;
        Mon, 20 Mar 2023 15:16:36 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:16:36 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 01/12] dt-bindings: net: snps,dwmac: Update interrupt-names
Date:   Mon, 20 Mar 2023 17:16:06 -0500
Message-Id: <20230320221617.236323-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
interrupt error msg") noted, not every stmmac based platform
makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.

So, update the 'interrupt-names' inside 'snps,dwmac' YAML
bindings to reflect the same.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* Dropped Krzysztof's Acked-by since changes requested
	* Changed interrupt-names items per Krzysztof

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..df4c5d184446 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -105,7 +105,7 @@ properties:
     minItems: 1
     items:
       - const: macirq
-      - const: eth_wake_irq
+      - enum: [eth_wake_irq, eth_lpi]
       - const: eth_lpi
 
   clocks:
-- 
2.39.2

