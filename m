Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61285C7EE22
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 17:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbjEBRGm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 13:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbjEBRGk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 13:06:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122341709
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=teoykMSKWvNuelz3FlN5iS0dm7a
        vkJXg9LbNugRtXA4=; b=j9gBx/Ufl1oedtl9C+qOyy8vUXxGHlKbIkvWLQWc8uy
        xJTKzM+iK/nIsGKLLXNaEsQNX5SAZUkleQbWpeLZ7Vk69SD7pkaUod6DQtLbgCKd
        956AH6J7PcEgrH3eg90jMPU66EC3x+t9Mceqqw2WhWRRwp5oi0W1LWp8oQ8MY5qg
        =
Received: (qmail 3809168 invoked from network); 2 May 2023 19:06:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 May 2023 19:06:29 +0200
X-UD-Smtp-Session: l3s3148p1@s9PV9bj6OOEujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] r8a779a0: enable PWM
Date:   Tue,  2 May 2023 19:06:16 +0200
Message-Id: <20230502170618.55967-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Having another look at the specs, I finally discovered a testpoint (CP2)
which we could use to test PWM4 on a Falcon board. Thanks go to Kieran
for setting up the scope and do the actual testing. This was the last
missing V3U bit from my side, hooray!

Phong Hoang (1):
  arm64: dts: renesas: r8a779a0: Add PWM nodes

Wolfram Sang (1):
  clk: renesas: r8a779a0: Add PWM clock

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 50 +++++++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c   |  1 +
 2 files changed, 51 insertions(+)

-- 
2.30.2

