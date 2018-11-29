Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3134AC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 535D520989
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rogHK7K0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 535D520989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbeK3Dvb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 22:51:31 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43065 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729323AbeK3Dvb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 22:51:31 -0500
Received: by mail-wr1-f67.google.com with SMTP id r10so2572661wrs.10
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 08:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me0Lfu5BhBpqT9CdhSlWzYxuoOF7cdOkh9x6AmuvvVc=;
        b=rogHK7K0kH++y0ednXP5cVWtEAOsfL2jgfyiecbhwdJCPuUVTYZF99Zg8xq9DUY+Hc
         wX6oOpFbaHEf70oUzyFV5mKcUBEFSV21S6GP1w4FqUrn3tRW+/FlndxpCuwXk3E3SC9q
         pgdLvhuRsNwWP6ip0QiMl1bN/Xved5y+9OLW8S77vr2tpdgQ8Ckqb+O15ncQZY37RkmO
         RFLxXVj8exSgsJDFHFTff8s/IRalyhdYSX3KmUWJ480i1cyjSsaXc0LWx7sgdmbsMIQP
         vR5usXsclWAJjQumh3BIIUQ1dfGVfQ1lqpUQydWFsYPyWPOQvk/flXyCiQvC1YysaFL/
         MX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me0Lfu5BhBpqT9CdhSlWzYxuoOF7cdOkh9x6AmuvvVc=;
        b=IPdndqqqzQAWvtZs1VfFv5tggzU/3Y8LYdvzAebyseq+IaAAeLQ5Uzlcl8SikHgUTc
         vc3xp5zm5qLXAm5BjRcXBiVVrF7j0u/ld4Ju36x5FjEKyNNQ/p6w9t580DnsKiT9Pzg4
         /OOiPqPmMJ9/qHyEL9szuQ64ru61GrBNhZEWqgTCjvkzCBg71RO2J0hhmWop5kV2WxPo
         9DGSWHOuamxbO6l25kF9RqkfDO+cBjaP+uqjESFJOLFWGvrTZSKn5RR/C6NAoPzNV71+
         sZbEQPnRm4aRSqTu9P2PoZa6irWcVk95sAfBT2NAqCAOD18kr55vBVyjouuRWJPz8d/1
         /5zQ==
X-Gm-Message-State: AA+aEWZgTquuLnJJcS0QUcDKs08HroQDpbb0yMVxFFZh+1pipxLYihAk
        AG6L4xQNdxrp/g5WuDL1z8uiMQ==
X-Google-Smtp-Source: AFSGD/XyqyRkcAFp5kKA+MdFtQ28BEmg6t3MEjW6UemCTXoCMSbYGhlrVpJdoLkehKWq33qeKJAP0A==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr2135687wro.105.1543509931333;
        Thu, 29 Nov 2018 08:45:31 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id d4sm2721909wrp.89.2018.11.29.08.45.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 08:45:30 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: meson: add clock controllers input clocks
Date:   Thu, 29 Nov 2018 17:45:21 +0100
Message-Id: <20181129164524.18670-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset is the first step that needs to be done so the
amlogic clock controllers properly claim their input clocks
through instead of relying on fixed names.

I'll be waiting for this hit mainline before sending the related
driver changes.

Jerome Brunet (3):
  dt-bindings: clk: meson: add ao controller clock inputs
  dt-bindings: clk: meson: add main controller clock input
  arm64: dts: meson: add clock controller clock inputs

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt       | 3 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi               | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                | 3 +++
 5 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.19.1

