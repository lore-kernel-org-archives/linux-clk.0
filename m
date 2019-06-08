Return-Path: <SRS0=ATvf=UH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1338C28CC5
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 19:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF2DC208E3
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 19:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcJVLs2B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfFHTyi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Jun 2019 15:54:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40499 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfFHTyi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Jun 2019 15:54:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so2899529pgm.7
        for <linux-clk@vger.kernel.org>; Sat, 08 Jun 2019 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7z7G2uIs0k+svTX+jtZAzZRGJWQLvmM8i7xrZdjKEXo=;
        b=CcJVLs2BWQiGNei2MbtI6uiXWAb/JLA3+6p0R5uSVtGdgJCJSv6yBAMuVVe2LKu7DH
         l8XD5lo+nX6Zp9FSjvnoirPJj3PqQ/uQLGiLqOQDi+pkGFDKwHLf+gmhd/LdE0G3uhrZ
         wD7nPtsQWQn9SrOei/XUq/JRIZcZ9IQ9L7BVNycYvo5T1H4bWY/UCuF6GAqag1LkXIwA
         u7op+FLgpMulPzwHOKMdwW0xiGNuxLft8zAh4E235mgYFprMl4try5pTiEvU2XOMdT62
         XkvugA+tPg7D9SOJP8gqUJF+dr3kDnguAYW3MT2FNgYhzav+X/7lv4015xN+nLneo+4t
         LMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7z7G2uIs0k+svTX+jtZAzZRGJWQLvmM8i7xrZdjKEXo=;
        b=Kt71C/2d00kJKd2x1c1qW9ADPILamzb8MZjsMeSwexB9Tkkre15rcNNxbFIP7pq1UD
         /2+2ca+QypUB2iFtD0DW7KE8zuwvaUIc39eIMD5g3LfRWWb4P9xCnEYSqIZHW6GFaas/
         okak5XzjkImWkTqSFfkyzX0rU4Rj34zO2EjTRvbJ7cnGx7T/IY2yFtL465qg9jlI8bR2
         gRDmLyRaSRhdgFl3/Bh3qbYQ3rjf/WsulHrol9bItcc4jkjUgo0GJaR9TLTpQ+DI1nmz
         Y29aeaOUufqdz9aieZA9Wqm4wQNrLLQr5RrRE7e6BJaknDcXTJ0i7UgdOJqf6pR4WMsx
         HtPw==
X-Gm-Message-State: APjAAAVR2zCadVwEMKljJhDZ6zStzG0TRpvIncQKbMCl2wqXHp5rvObe
        FDlGa5lkTNq7ueW3sx50aQJg
X-Google-Smtp-Source: APXvYqzGq9Wlppe/fkGUI+bPzYy4jai5cTMOZ+AdImb8blZYRY64w3WjFSlIocF4HQh4o4FeAhE03Q==
X-Received: by 2002:a63:cc4e:: with SMTP id q14mr8601057pgi.84.1560023677661;
        Sat, 08 Jun 2019 12:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7185:fba9:ec1e:ad07:23ac:d3ee])
        by smtp.gmail.com with ESMTPSA id b35sm6034377pjc.15.2019.06.08.12.54.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 12:54:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 7/7] arm64: configs: Enable Actions Semi platform in defconfig
Date:   Sun,  9 Jun 2019 01:23:17 +0530
Message-Id: <20190608195317.6336-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190608195317.6336-1-manivannan.sadhasivam@linaro.org>
References: <20190608195317.6336-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the Actions Semi platform can now boot a distro, enable it in
ARM64 defconfig.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4d583514258c..e0b5f4f8c9ff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
-- 
2.17.1

