Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060671;
	b=zBwIsERjF1K6vux2dDb7IDt5Ar7VI1cveuPMXk0uV8F25XxzDj7ADDLxoRNP7aAWTbam
	 Fb/A7Pk3XJkVqcF5qtu/ytdn29Hurni9dMV540O8Dhj6YcFXMnq9sL6BTa4YOzdm0ngvj
	 o1Gdvu0+kWe/zmYs/B0pkrkAi52F1Lp8P5ovjlcVYA7UFly1YP20QQ1u8loOeTdIadmdL
	 /25zKrpe3hFGRuZbvxpkesd+1vNGEbP5v9PVfNmGkHq3BMk3pd2eLmCV8L6nduWe3KTr5
	 X+mBDey/sn9EAjQiA/d6gD9THWPBgH82m1LxidIDJ1C/QJ6HJhXTH3oGy+2fIq7HUPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
	b=Eg7kmDt9+ycoNOW1EAVFkW21Y2BZAwmKO3p28zfy/gcuFyzWE3tNDG2Sem6xf+IB32if
	 CQ+SqJR+L1jePWJQNQMwR4QxKwrwG0P/ygPJ9g35jXPKy4t2fh0hu1MucGb+Y0pk5oZNo
	 qFJU/Pi7875V3pwFiF4ZAJkWbAoQ8rWiKez4QSU0TFymjyMhSBbOQ0SbWfw0D46UKhP2m
	 JINKtNtnJxXJx483R5y8M7WH+S6SicFfIbQ+dLvjPKjsXF5fm0YRDfcqO4SUI4deAyY5g
	 eK2Pabgke53y71j/LVafLUO9FE+xnMS5B0nOGXPJTfW0yLtqcVZGQHrUo+OglZI1lKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTHQsB8K;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF90606A31A
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 00:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTHQsB8K
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so5238825a12.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060669; x=1793665469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
        b=YTHQsB8K71Utnq1y/7rscr+4aTy1kBdRaMpUyWRrzDckgv1pLXq/TxGhXAEchcSdZ7
         9BqLp2KGclRoUTiijnG7++I9eUCao71Sbb81RgOcvd/5nlvCC73iBasFeNo4YEbLsNTI
         w5ZWXvKqTYb4ffQl8pP6I1JAPotaWVPotKTkssHxy2c7V8ciZ6W1u1a9Khl8GpAcYHQh
         2O13EijZdnOiL9LBqmDV897fU92zp/L4cvZmi8iw2HqpLycd4DMAzn7fxunnHMxoOk2T
         fA2K/oaHJ82YsvDOLPHJ5LJzw1/LyxhbG2ouQUfdx4j99q+9Wu/cZkjDr7i/0fYnrLlD
         Uw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060669; x=1793665469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
        b=h8bjS+grpQHL1sPARm5pGFFx/cGxvexQEuKZaVLTVjLaTLeGvzfznrcgSS8+2gbv8I
         L3pPfnC8CXEA8wuoc+D3AQX9K2PtaOVyVInnlTMxpSQo0MIbHBj4HiaYMiVkIPMuWny9
         LHMqZX7odkXp5wE67pRoLdr9IeuuiCPHLMAMR9w9jme/VXjDU1lAaJX1iqAVTB9dsz01
         w2mcVIumkrrbrc+N3q5qpDF0NMCCigFKKIo0A8tlBR0ZcqrBivY4d5wSYMN1OCaaMzH0
         9BAoVXWxZ5ZnOkL8v+BJYQNvKtAjQDBac07KOD0i3P+LQmHlgBHj/ifgcXW38Ky5ZkEN
         nmuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8VngwB96YTPmHMUdPOuUiHih60l+U2eMbuu6cEvS1Q1QE8dhkv9/56b+pU9xHfeUDepWKAtq1ixk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL69FXGzZy+jRGOjRleZORCMo5CGTcHyi4w8DVbM6+efXiFiQGa
	kXg7RC0Ptxkox2C3qqKipNGD9yUWMFBN1CkS7U95UQLVaGvMhiy02qGI
X-Gm-Gg: AYBFou0+pGC3U1LjAboA8/Nmb2XVDT0OWrTcFkM303BnhB1ZNcNByiUONygQ5m5LPv+
	ARTC1Cl7VQode0cT7kEhPHDT3Yv+4mdYrEv57q00+UAM7TVhQhsl85qe0euUVkyfiqfrPMHwO1z
	o3+735ZYRP6af9S6sqOFVS2fRQIu7xyZMPq9FTaVStC1J2MEio8sxDXyKewDJQCi45sTeGCFyeT
	hyP9BX7p3COd8+cuXgJE9ZND5Va1akwtOv/Qlodcxyv3bM4mwTBR5kK4TgIj5/+EDR3oRjTokM6
	9GM9RgXdQWBMQF2yI+Fkv6UnhOiOYw+ldRp+j79gyaxBnWi+Jhg1R/RkxMCbxfmuvHqMxVSalwm
	yu9b8ZcbHf64jM8kXG2XP4hULDPwvUgSBU6VFjp0WLYAWeiL6EHaTt/GSt9UPzEFltjJY6eq9sk
	ZxU3M15DVCXvtnNLkIh3bIUGdmti7G/Oz8a7n6XGqSsWHqjdDHCZpiw+h0y/oguF9f1S36daGPI
	GEGF33+Gk2ophGIaiZWWOi/pp9nMVhCdzkxFMcc0/GO+7AWQIsBBjmUs+ias4U=
X-Received: by 2002:a05:6402:3d1:b0:6b4:35af:328d with SMTP id 4fb4d7f45d1cf-6b442fc9e5fmr6712467a12.14.1793060668811;
        Mon, 26 Oct 2026 17:24:28 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3975344a12.22.2026.10.26.17.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:24:28 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikolay Bryskin <nbryskin@gmail.com>
Subject: [PATCH] clk: rockchip: rk3588: keep the OTP gates shared with the secure world on
Date: Tue, 27 Oct 2026 02:24:19 +0200
Message-ID: <20261027002419.2099708-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The secure OTP controller (OTPC_S) shares three clock gates in
CRU_CLKGATE_CON18 with the non-secure one: clk_otpc_arb,
clk_otpc_auto_rd_g and clk_otp_phy_g. The kernel treats them as ordinary
gates: clk_otpc_auto_rd_g is disabled as unused at the end of boot, and
the rockchip-otp nvmem driver enables clk_otpc_arb and clk_otp_phy_g
around each read and disables them again afterwards.

Firmware in the secure world (OP-TEE reads its hardware unique key and
the secure boot state from OTPC_S, and programs them) has no way to take
a reference on these clocks. Once Linux has gated them, every secure OTP
access times out, and a normal-world nvmem read on another CPU can gate
them in the middle of a secure access, including a fuse programming
cycle.

Mark the three gates critical so the normal world never turns them off.
They are 24 MHz gates for the OTP block only.

Link: https://github.com/OP-TEE/optee_os/pull/8034
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9bf3..8e0f408fdfad 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1158,11 +1158,11 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(18), 9, GFLAGS),
 	GATE(CLK_OTPC_NS, "clk_otpc_ns", "xin24m", 0,
 			RK3588_CLKGATE_CON(18), 10, GFLAGS),
-	GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", 0,
+	GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 11, GFLAGS),
-	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
+	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 13, GFLAGS),
-	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
+	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 12, GFLAGS),
 
 	GATE(PCLK_SARADC, "pclk_saradc", "pclk_top_root", 0,
-- 
2.56.0

