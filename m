Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D81C6FD19
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 16:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjCMQ7h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjCMQ72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 12:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99C52385F
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
        b=ZAUC9A0WZ8QkaZ3Epnw/gAOs9Dk6D0DlHr5ma9bmlkNExUQBo5mVhJJGxxFhg3i6bG7FuV
        id22kca6cNjpafiYPSNv0zPAkj6yFHkzNXO/6W7HbX6/ngYEr7V7T7MYx7nn2SssApOY/q
        OIXK+bts1F0WDIPKYukjcqEdrzIkS2A=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Tgbl7v35N525zFswYsjv4A-1; Mon, 13 Mar 2023 12:57:38 -0400
X-MC-Unique: Tgbl7v35N525zFswYsjv4A-1
Received: by mail-oo1-f70.google.com with SMTP id e137-20020a4a558f000000b0051a14b3d779so3581491oob.15
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
        b=LN3NGszd+4SurJ8mNWUHd1sBnQ5EpaxOouFIPwk4mlyLrQeCeFiJm9H8OZ41CP84Dt
         0gNCaUCx4GoA92EB36A5uag6BuvDHWhaFye42x2c+M+8x36bROw1of/FpbUOZPmV+Idn
         fH/n5O5UnX6KLPErsYL28z3Piij+ujzt7ez/CrOdihUCbsR+Xf4wkZcPvB/sBJ4yMaIh
         vUhE29epkmKskRpUT0GaJ1hH4Te35fNudIFF2FyMtoZcNcB3m3V84kWT4Q8lvQ0KO+bP
         VqBlaiW+dyk8rrbmH9L/LJNcMdg7N4g+mt4+T2IzVOVoIwtjik2q9o8bFDqHqoaDkehY
         yOtQ==
X-Gm-Message-State: AO0yUKVlzOLtPZGZUyvMDUTl60wffujT/ZDjQ27AQ4JHFHBAr89d9EU6
        Ve0Rcn5sU7LCAfIhl1sMDpYiP4fo11gQIkXaHhEfc646F4Uc/+gcOPAagqlftgTpxxAxBJYGhSv
        IZNlMrvKTsQCSxDpMRLDm
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id v6-20020a544486000000b0038407049b5cmr15120528oiv.32.1678726658077;
        Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set86f0/F8S5PouGiQEFyz9bxsIyQVNlLEzYRDmqmHJ8dbjOt3VXvUOdMwGwjDGA6EL6dvlxIJg==
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id v6-20020a544486000000b0038407049b5cmr15120491oiv.32.1678726657851;
        Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
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
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 04/11] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
Date:   Mon, 13 Mar 2023 11:56:13 -0500
Message-Id: <20230313165620.128463-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
Add a compatible for this.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 68ef43fb283d..89c17ed0442f 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - qcom,qcs404-ethqos
       - qcom,sm8150-ethqos
+      - qcom,sc8280xp-ethqos
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3ca1239da448..f981a89ab2a5 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
         - qcom,sm8150-ethqos
+        - qcom,sc8280xp-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - rockchip,px30-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -629,6 +631,7 @@ allOf:
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
               - qcom,sm8150-ethqos
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
-- 
2.39.2

