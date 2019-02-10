Return-Path: <SRS0=QJXt=QR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B1C282CC
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 22:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7085C2084D
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 22:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jjJ/LUqg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfBJW0a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Feb 2019 17:26:30 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:38963 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbfBJW0a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Feb 2019 17:26:30 -0500
Received: by mail-wm1-f49.google.com with SMTP id f16so13359975wmh.4;
        Sun, 10 Feb 2019 14:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mfga5LPr/J3+vtuLs6sE/4iTgznBPBA3E+j5LobqNYM=;
        b=jjJ/LUqgiivo4ybNNx8VXJ8xpv6uAvDtXSJzrKyfkTKApoia4xS0nG7OI7T0mvIuU4
         +HJH7CobjoW6z9FeJLiMP3fmfyPTG+j13M0Hd5184Tc6j6Sa0El4JhZZT7GQ7buWUada
         oteoPBKBReaD+TNTa/bDV2xcwRX9VXKPdvHu6oNWf59yDCVhd0dIK3kTLb/TMalC3sDM
         AcETk7TCmZuN6ZQoLfZLh7QnZ56OSCpTBFpKC44+IbfDvbmrqRarIHwGMdkQAVEFBnP3
         Ep4CriSqdmwX0fUz2F95mXKZ4nilUEtWOuxfCEOayUPhUyZ5+6OA3er059Ab+y1Plr4y
         y7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mfga5LPr/J3+vtuLs6sE/4iTgznBPBA3E+j5LobqNYM=;
        b=P2eElwTsbgSEVmW4yfgFwaNpvZzcm37cnR06dudCahVA3+d7IjvptQVi6GMw2n6STu
         nMKUu6n4cs2WsiQTDc+vvJgAaqR4wreaKqXUo90fe+PQJrrK56qTqLn8qcPF63CC5vaB
         Sr2tXOgNRrx+OuXeNiDeeb946JuuMJkmXqLIMW3gyNvlqXo5eUnb5NJUhC7PbMrtCl2A
         1MwZmmY57gOKeCJszNzUO1EA5yg7G9m/w9QXQ00AGwwx2ZVP4mJewiODThjVb+lPR0KI
         gkoTkDilgh8cxZZ04EcNoXrJ8JN7kTOeIkDkfI47aiHxN/R3iVSGlFApiAoQ/H2EVd33
         mR+g==
X-Gm-Message-State: AHQUAuYAJ5p3m0dDO3Xwubf3DLMxgMUZJ6i5uga1MQOYVVVfHW0tvwti
        DBIpiD/LgkNGkySbs+2bQYjSScbR
X-Google-Smtp-Source: AHgI3IaXjoT47lxbtsg47YPQ5DqyvjDltZAZSAX75NeQ0BzFEG8dXRQHyoZhkNt/5q7WwIQFRaAOzg==
X-Received: by 2002:a5d:43cd:: with SMTP id v13mr25276183wrr.194.1549837587435;
        Sun, 10 Feb 2019 14:26:27 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD70B4600C064670D88EA61CD.dip0.t-ipconnect.de. [2003:dc:d70b:4600:c064:670d:88ea:61cd])
        by smtp.googlemail.com with ESMTPSA id b14sm15523330wrx.36.2019.02.10.14.26.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Feb 2019 14:26:26 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     jbrunet@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        mark.rutland@arm.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RESEND PATCH v2 1/2] dt-bindings: clock: meson8b: add APB clock definition
Date:   Sun, 10 Feb 2019 23:26:02 +0100
Message-Id: <20190210222603.6404-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
References: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU
post dividers") added a clock with the name "ABP". The actual name of
this clock is "APB".

Add a new #define with the same ID but the correct name. The old #define
will be dropped in a follow-up patch because each commit in the tree
must compile on it's own (the old #define is still used by the clock
controller driver).

Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post dividers")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 5fe2923382d0..8067077a62ca 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -104,6 +104,7 @@
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
 #define CLKID_ABP		124
+#define CLKID_APB		124
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
-- 
2.20.1

