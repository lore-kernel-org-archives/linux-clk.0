Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6004CC761AF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 22:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCTWTH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 18:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCTWSd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 18:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC879360B0
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uADkhSDU3kNDzAhx/ALq71/R+qHbMHup0NfIf4oXRRk=;
        b=bAOQ/wnAPB2pqQp9ZW/9j3a0vAI1BaIGY68qGiGTGrBezsfYSS2r5j+YDSXlKwy8yyYRXD
        hPX7pnezb8OQl9ttmSgXydBO0msx/AYy4xyuY/raGUx4WZG98BBRREp8sjcKgnkyJAWbEy
        Z7+i+lbMF0i+taVBeKXQdbk0mNh9A9I=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-uBgZbL0PNNCDbq3d9Gw1tA-1; Mon, 20 Mar 2023 18:17:05 -0400
X-MC-Unique: uBgZbL0PNNCDbq3d9Gw1tA-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-17772c5c940so7742150fac.11
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uADkhSDU3kNDzAhx/ALq71/R+qHbMHup0NfIf4oXRRk=;
        b=8C9Lh9gU4z+I6lVl7Pi/MNXW9lTDahLKwLxPCj7+MNZEco74/wXxAB6qwq7iYzIs4O
         fpm4HQz6ZIVVk32HcgKTnBC9PJbRtCcNAXMT9pIAkmZfHe3h+J6efTTiqLwO67FfDmnJ
         Ahr+uTcd4NoZpQsVjPe4rEratKcNv4KBmnxydVYqgVsesNbR2dORQjQr5kuUdLJu6+21
         svVJQICvXptXN/N7NxAM1LcWE37KeyogAo3p9cVgdGbLtz2/mvTk1978e0ynregAdWNq
         gMppqk7pg4UsXHtjt7nArTRayLfcfGBWj305fb9zjLb+B6VkHKGuK6OdYflLMC8J5zop
         ymkw==
X-Gm-Message-State: AO0yUKXGgT5TGdTmWXGD6SOMYH2ZSpnUBBI/93exsa904T0mlPuzJITi
        rWEZ+x8lFOtHF7zVqK4L/QiDj6GF/40grphicJ9n5JMM/MeH9jTOunbpnpjai7PVGr7MhA63/l+
        iaZTUZYGz+1SA+gatF29q
X-Received: by 2002:a4a:d38e:0:b0:53b:1086:7a09 with SMTP id i14-20020a4ad38e000000b0053b10867a09mr949135oos.3.1679350625162;
        Mon, 20 Mar 2023 15:17:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set8HeXukDtyerKLEQLIGqNPkUK2wofZTtG54Dcrc14ovssGSEI09uY51mICdr2wdiRw2g7QDRw==
X-Received: by 2002:a4a:d38e:0:b0:53b:1086:7a09 with SMTP id i14-20020a4ad38e000000b0053b10867a09mr949133oos.3.1679350624966;
        Mon, 20 Mar 2023 15:17:04 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:17:04 -0700 (PDT)
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
Subject: [PATCH net-next v2 08/12] net: stmmac: Remove unnecessary if statement brackets
Date:   Mon, 20 Mar 2023 17:16:13 -0500
Message-Id: <20230320221617.236323-9-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The brackets are unnecessary, remove them to match the coding style
used in the kernel.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* This patch is split from the next patch since it is a logically
	  different change (Andrew Lunn)

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 21aaa2730ac8..6807c4c1a0a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -281,9 +281,8 @@ static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
-	if (priv->plat->has_gmac4) {
+	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_READ;
-	}
 
 	data = stmmac_mdio_read(priv, data, value);
 
-- 
2.39.2

