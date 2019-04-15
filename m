Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCE7C10F12
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F73B2075B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi8BP0Az"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfDOKLE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:11:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39009 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfDOKLE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:11:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id j9so21126594wrn.6;
        Mon, 15 Apr 2019 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1utUG9oo11jNXQpQkS4fRJ6SG9XxN3l3dVfTXDmhkww=;
        b=Qi8BP0AzvIj0CLEGzLnz/Oj66x7Dup5/AB4St3neDWs+l/i0yiEZGoj2S4lnmAo91j
         6/Qv4T6XF36DDGNKBw+wk0oFjNaEZQipRQAFa25p/OHpCu/QtsYR1hcziqSoKRGMFM9K
         LCDXH/dTI5b0GTYpzcbOvk4ZRiG/pKpdi7ZvbIEGE5ISd8pPn04AmqjSYmOwOHhQ/pyo
         iSrtKlnKUuDzZUg6NFMOpDFbl737JjXPmWD/NW671VrdazNDzygD6zM8hh+3A1v2/wy8
         MYN6yFc7198iiPRhhsd3HyhW8VLm+sFt6x6mgoeq7p7W2zSzm99BSUO+VEsNocKqwZ/m
         08Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1utUG9oo11jNXQpQkS4fRJ6SG9XxN3l3dVfTXDmhkww=;
        b=oUKT7o5F7Yxv79dxGD892HSpbfysk7DTcVl9ejE05+Vb4eLmK1DEtQbdEMethtu3wn
         1Gp27a5iK6y2iZsOLuR13JRh3S/1HtBgMCMAzyvPbkcvwCGdGxZ1BVw62IB9rNdssQZC
         TmvMz+fNhZhZRjLpvDcXuav8nOY1KbN28cKR0mNKiZChbb9cc+DNM2nSXUjnydfaQP0l
         Wuy0p4zXHQ1QFZ5X+qmEF8SEAhnEvSNzQ3/0hh2x5E0mIMncGo6sWZvuIuikmvH6sHjc
         4WG0wLIxM5dRe8qQQdE45T0FIosryJGZkgc1Tv70ALN5I9OgLL3FwRaGj87hy8BlojiU
         NsqQ==
X-Gm-Message-State: APjAAAUfqjft0x5arolDGNfsYoAX5/vCixIO1CIC6HKIazaU8LsiCm0j
        vht1tAEVCi9MuQtYSZyROhWW6ZyZaDc=
X-Google-Smtp-Source: APXvYqzDXCPaXtO/0J6yWiR1mbQTpGNquiOsxi0UOZGLzVVoYvpAf+tZqDLVoX6afIm4E1NjyaPrJQ==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr25387wrw.68.1555323062247;
        Mon, 15 Apr 2019 03:11:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.11.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:11:01 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH RFT V2 6/8] powerpc/512x: mark clocks as big endian
Date:   Mon, 15 Apr 2019 12:10:44 +0200
Message-Id: <20190415101046.5872-7-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These clocks' registers are accessed as big endian, so mark them as
such.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * switch from global to local flags

 arch/powerpc/platforms/512x/clock-commonclk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index b3097fe6441b..0072330350fa 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -240,7 +240,8 @@ static inline struct clk *mpc512x_clk_divider(
 	u32 __iomem *reg, u8 pos, u8 len, int divflags)
 {
 	return clk_register_divider(NULL, name, parent_name, clkflags,
-				    reg, pos, len, divflags, &clklock);
+				    reg, pos, len,
+				    divflags | CLK_DIVIDER_BIG_ENDIAN, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_divtable(
@@ -250,7 +251,7 @@ static inline struct clk *mpc512x_clk_divtable(
 {
 	u8 divflags;
 
-	divflags = 0;
+	divflags = CLK_DIVIDER_BIG_ENDIAN;
 	return clk_register_divider_table(NULL, name, parent_name, 0,
 					  reg, pos, len, divflags,
 					  divtab, &clklock);
@@ -261,10 +262,12 @@ static inline struct clk *mpc512x_clk_gated(
 	u32 __iomem *reg, u8 pos)
 {
 	int clkflags;
+	u8 gateflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
+	gateflags = CLK_GATE_BIG_ENDIAN;
 	return clk_register_gate(NULL, name, parent_name, clkflags,
-				 reg, pos, 0, &clklock);
+				 reg, pos, gateflags, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_muxed(const char *name,
@@ -275,7 +278,7 @@ static inline struct clk *mpc512x_clk_muxed(const char *name,
 	u8 muxflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
-	muxflags = 0;
+	muxflags = CLK_MUX_BIG_ENDIAN;
 	return clk_register_mux(NULL, name,
 				parent_names, parent_count, clkflags,
 				reg, pos, len, muxflags, &clklock);
-- 
2.13.2

