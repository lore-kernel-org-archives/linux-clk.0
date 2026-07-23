Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6241F7F2
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802136; cv=none; b=qhHfJzoSdlgx06fpIlWGrm4VQ7R0LSGtE3gKDx5KqbH9O7rxKsZw+mmgaoxUgBtwyeU/jxKfx+ZsMzxYVMTaH2dFWFVkjPpFX2Gy98UcM8Z8C31fcVBt5zKsUoShg5nIGk547dbmY2FLRRisFhoiVdj/jGoOXPPdvWCaF4iqqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802136; c=relaxed/simple;
	bh=vnZAqLwPovH/ju9j2Cyh+UYxWO+gHOZuE8JwAskYk/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X3fJpPKlwD7xtaC2rRZv7rEp+iEu/r4lEIMCE5jrc4knl7dQu2HolKL5T3xtG9GJ43ZUBXTelCJdK7fcELn4Si1UTyJG9+gO5gOOpQGHN5WxFJkPmW7jDua61QALHds14/w+mU/CXZI9VH/rVuL4eoc3474gPQigwyMPfmOrn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=TTyfVDmx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="TTyfVDmx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so660934a12.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802133; x=1785406933; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzj0fk/cPMNrKTYV5MOF5u7NMggcty/MWwr6k4CAmao=;
        b=TTyfVDmxeqUq4WjNoGvNSJTmM7RhVus8Kuqja150RfRrMIDRTmj4zxvFrtau4CRyFS
         bIDHajEn5ahUw91+F3AF+z+HERNTZZ91lOLiNxUV3Etnl6E4VOpyfvZVEnDHNX55dR7n
         JzyE/FE0+IB4fNfEUDqIROYPFSWq6IbOk54ym+NE2e3xUItACgJMQv8a68ESVR0M7d0a
         +ae+HzQm8cxcVlGh4XDdwUl8gMnQeuW20K4Dta8vXHLzQeclSCk9fq7ZAdypNp3fV7XT
         VRpM19DUxgYsL104IPYW39Ya9cWmGcZdssIs/Hfi94o3mIobqfnEUHVNbnLLaeXZ8/Tc
         x5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802133; x=1785406933;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzj0fk/cPMNrKTYV5MOF5u7NMggcty/MWwr6k4CAmao=;
        b=A23hOU08r6aT8I2V3dZUpjabqZakN5MAgekYIbgvZPC6vlsIlsxiE1t2VRNG+NGq69
         r4RfSHCPCLqlSuhqIouNrnLq8Au7dE00S6EkXBk6F+/2w9J8YvPeS3twrg6RBKKS8syi
         PZ6WN0VTrDDZZOaFlEe6DZiBcE5vEYx1fk5F8P5oV0vblHXOuci8ncuFrEbjEz+UFLFM
         AsdvIq+BvIebAYHLNWZ+/v/ZPAWMCUvbvQsEyoyBK27u/muMXmd/nk3VqrWPVzWmBQeF
         p0Fa0MIfqlOaxsSqrDDp3v7O+gu2Zcu4KiPaXmOESXjcckdoRr7Sn0F7NsKGVx5u7MD9
         OTAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1kA/t/fA97iCkkb8YxY0V2Ru3Ykl0xcxZPH/ggJ1jziSvQo0Hn1EnHW2jga7sp1Zl/Dvs/QxtK9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtIjw2gLVeD+60NT/pt1IGuzhOz59BeO0a4xFs3grqO2xj2DNk
	BBPY1qDnV+PXlZbsakeoWmX+ImQUULQhK293G9EX0sA4yv1DGXNEl2NCPameSuH1g1c=
X-Gm-Gg: AR+sD10A3DroVczNMdKhmuzCrok5qzpi9SSyKDBbuQdYEbe1e+xT+/yhzrcouTYKjpb
	6h3LuUp/RDm+cGDK3KncLVh5+V5/fMkE/YJzXfiiy7plGglyOCvz9GcCckRzk3LzmXIgKl6rtDM
	qsqccBoZpQ8gjv2O1MLeWVPt65jVQlSBcIycoDNBDPeO4+sBOGpE2tJhsKYHFAyDHTCHESY1bde
	aao0MJe8AxFGunH1wp4eXIskyeHZLjOj1FrbnjrHLppeu9zU9V2nJQZZ45ghtAUUiefXrshPgnM
	MNxm/TFGB3vQujHZw2f4aiv3JkXB8lSF+INpwDnrKk0NB0Hoew+ZkpnsL5qY8uPDdOc1uhiPeyU
	T2jDXMBZJ1Km56zgCulrhvitOqGJZhq9x2Vyh8rZHvUYxeWz4Ie2ib4cZ1DeQCSSblI+C3XU1Y7
	XCXm8CrI6ZDX6yGbgjwrqm9w==
X-Received: by 2002:a05:6402:360f:b0:698:4291:b85c with SMTP id 4fb4d7f45d1cf-69f6b62e844mr1014125a12.8.1784802132716;
        Thu, 23 Jul 2026 03:22:12 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:12 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] Fix RK3576/RK3588 fractional PLL rate calculation
Date: Thu, 23 Jul 2026 14:21:57 +0400
Message-Id: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2Rpa1BZO/ofhAGUrqwSaLRIN6
 b9b8OxhDi+ZebNCQCYMUGUrMC4UaBoTqEMGtm/GOwrqEoPK1SXXSgp+FmdjhOPG+mEQ7lRobTu
 Tl6aANPKMjt678Fb/OLzaB9p5s2yNnsI88Wd/XOTW+ytfpJCiVaZsndQ25eoG8h75OOIMdYzxC
 87QhPjAAAAA
X-Change-ID: 20260721-rk3588-fracpll-f4377cd80983
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vnZAqLwPovH/ju9j2Cyh+UYxWO+gHOZuE8JwAskYk/k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvZSt3l+8tDEaeF+5ZclWoXF4mTeHPNpu6nBsnjpi
 xfn3mTEd0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV7RIMf7gCWNtZbgd/bo03N2560bkzYeHSyfVvQjtDO8y2xFuVCDAy7Ju+aX5
 2xjVn98mXPH5nlqbvvFez5/WkKznH/7yfL/9MnhMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Fractional PLL rate recalculation for RK3576/RK3588 doesn't correspond to
what the hardware actually does due to two issues: wrong denominator for
the fractional component, and wrong signedness of the fractional
component. The result is the kernel-visible PLL rate being off by about
2 MHz for the two affected PLL rates vs. what the hardware produces.

While this fixes a real bug it's not a regression, as the issue was
introduced in the same commit that added the RK3576/RK3588 support.

Note that there is a separate unrelated issue with the rate table, namely
the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
which is just above the TRM-stated maximum of 4500 MHz. Also multiple
entries in the table end up with Fvco < 3 GHz, which according to the
TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
To be revisited and optimized separately.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Split out the denominator fix into its own patch (thanks Heiko)
- Reword the commit description for clarity (thanks Quentin and Sebastian)
- Add relevant clock derivation formulas and key constraints directly into
  a code comment for easier future reference
- Link to v1: https://patch.msgid.link/20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Wyon Bi <bivvy.bi@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
To: Liang Chen <cl@rock-chips.com>
To: YouMin Chen <cym@rock-chips.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Dragan Simic <dsimic@manjaro.org>

---
Alexey Charkov (2):
      clk: rockchip: pll: Fix the fractional part denominator on RK3588/RK3576
      clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement

 drivers/clk/rockchip/clk-pll.c    | 16 ++++++++++++----
 drivers/clk/rockchip/clk-rk3576.c |  4 ++--
 drivers/clk/rockchip/clk-rk3588.c |  4 ++--
 drivers/clk/rockchip/clk.h        |  8 ++++----
 4 files changed, 20 insertions(+), 12 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260721-rk3588-fracpll-f4377cd80983

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

