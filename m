Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0708FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88C6C2168B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2jFRhKt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391286AbfJPM7d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 08:59:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33753 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405273AbfJPM7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 08:59:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so27983839wrs.0;
        Wed, 16 Oct 2019 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q7jAfBGXHUyx/LUvk2L9tzWYRWPJadJGR99Kjhb0L5Q=;
        b=U2jFRhKt7a8y5JfH55RtR+hxFdogejNwMpy3WulgyA3kbAASWfRc6hAjgSdeuXr+ae
         +72/gcQqsr65JlnOkCi/0AbNKRVaOg4pAkZE9ih2Ds0r7r3Z3IYufIXMpDff2W5Bgns7
         SKUI2itah5PJsx2aKdyFxU+46v69HTPx9lSIrWbmVpP+UWCHCh5BTZsp3DpVrlTO9CGw
         NSjNrcsRGvxMtQQ/0StkPTUtQsi92HAmI8Jt0Hn1MKSBEPWWmJ+JNnctkYm/gzl2kQvQ
         JmCwRAi5rly91sqJkf1jBYpD9ZY5eP/y178x5wY64S91Z1iTlwOAMZAsxP5mK73lVTvj
         aZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q7jAfBGXHUyx/LUvk2L9tzWYRWPJadJGR99Kjhb0L5Q=;
        b=WRVjP2FVHswdB686R+fhVrSj+9KWP8+Dhszsq/JbULQHf+KwC+b/H04D4SAb8YzppV
         FLciZDwuy3JIo6kw1/vzF8kGu3C2cmtz9hU/p+lxoniqPKRujCgZt2IY9tIoIjQyV2IZ
         X3L6745w4PVi1B9s40RHUvs/ssvuNabWVo69d/Ke3WEUKncx7gLJkWk82NbvSIPr+/bq
         pN4x5MV4VN5yJvkcJ5jE7qhYWMk5d8yHD45zKPSnEBf/3siCopE7faddx4saRpBCOOMJ
         iRQQulSjXh4AFmMd9uEYLWDuXWR/SMCUJHtuRAlbNXxyQDLCRME8McLUMVg/SCY3k/n5
         Mlww==
X-Gm-Message-State: APjAAAV9inz6a3PUgZq52uOgBAXYZ05L4ZUVdPgXFNhwFtnOAFWcGpBc
        OBbwFAFysTGAxHpkQV78bvc=
X-Google-Smtp-Source: APXvYqwrFKVSoYywCXHLWUXYfkHwE6xGcuUdFBuSWfDOhB5b/Mnp8xQ1P2CKThYWXiPDGLIiVzp6Eg==
X-Received: by 2002:a5d:4ecc:: with SMTP id s12mr2749184wrv.73.1571230770458;
        Wed, 16 Oct 2019 05:59:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j26sm42191593wrd.2.2019.10.16.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:59:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] clk: tegra: Reimplement SOR clock on Tegra124
Date:   Wed, 16 Oct 2019 14:59:18 +0200
Message-Id: <20191016125919.1773898-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016125919.1773898-1-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to allow the display driver to deal uniformly with all SOR
generations, implement the SOR clocks in a way that is compatible with
Tegra186 and later.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 7d231529c3a5..b3110d5b5a6c 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1005,20 +1005,24 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "hda2hdmi", .dt_id = TEGRA124_CLK_HDA2HDMI },
 };
 
-static const char *mux_pllp_pllm_plld_plla_pllc_plld2_clkm[] = {
-	"pll_p", "pll_m", "pll_d_out0", "pll_a_out0", "pll_c",
-	"pll_d2_out0", "clk_m"
+static const char * const sor0_parents[] = {
+	"pll_p_out0", "pll_m_out0", "pll_d_out0", "pll_a_out0", "pll_c_out0",
+	"pll_d2_out0", "clk_m",
 };
-#define mux_pllp_pllm_plld_plla_pllc_plld2_clkm_idx NULL
 
-static const char *mux_clkm_plldp_sor0out[] = {
-	"clk_m", "pll_dp", "sor0_out",
+static const char * const sor0_out_parents[] = {
+	"clk_m", "sor0_pad_clkout",
 };
-#define mux_clkm_plldp_sor0out_idx NULL
 
 static struct tegra_periph_init_data tegra124_periph[] = {
-	MUX8_NOGATE_LOCK("sor0_out", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_out, &sor0_lock),
-	NODIV("sor0", mux_clkm_plldp_sor0out, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
+	TEGRA_INIT_DATA_TABLE("sor0", NULL, NULL, sor0_parents,
+			      CLK_SOURCE_SOR0, 29, 0x7, 0, 0, 0, 0,
+			      0, 182, 0, tegra_clk_sor0, NULL, 0,
+			      &sor0_lock),
+	TEGRA_INIT_DATA_TABLE("sor0_out", NULL, NULL, sor0_out_parents,
+			      CLK_SOURCE_SOR0, 14, 0x1, 0, 0, 0, 0,
+			      0, 0, TEGRA_PERIPH_NO_GATE, tegra_clk_sor0_out,
+			      NULL, 0, &sor0_lock),
 };
 
 static struct clk **clks;
-- 
2.23.0

