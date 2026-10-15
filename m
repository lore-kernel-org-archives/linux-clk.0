Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767352FE4F
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083305; cv=none; b=KUC+BzUFXmQnK/oU8c4PR/WytQ9c6CmMba4KBv42myKKJDVJCqnDdHFR/9w4tW6SjRZyjQq09cNneI0yHxJ62FYMhWxiF2Jx2YZz5NcE4m/ls5K/2qQDK8mqr8Vqty7uaZw1X9xYpVzJLX4zIdIHK7OdDtgeKSqJmhs3bxkQXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083305; c=relaxed/simple;
	bh=33w0zdjcE6uxwqU7ll8OOTlJSYoyfRiEeotGi/VFEE8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Joej2oGBlMtjW1REcYYhpeN6ICbOXN0yWpwK5veC3hkygr+DGu7ia5MNDafC/eAKtrLVlvR//aDM3rl+/FmlBjwIzxJvDw4HJ9MpSGKlXghl50ZluozRI83bZJ4M4dfIJ/dwvlSzwtf7KdfnP3oNYvjqSeAoImfmD4Tl35Fg5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZetZSOHZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZetZSOHZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7256f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083286; x=1792688086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9A4R0ld4xtPUzYOLQ26dMhhwMrPELtsTfbERqTYNE9Y=;
        b=ZetZSOHZqYLVRfUhAfT6BTgqYVSrRlw5R4rVfPCFwNoKniY3J3bRHQgExbuvMMQoQa
         5hqkDhC6hXPHmsWP6cUfaQdlj5m1aAXDyjlrrKoTlTycUwqHoFacxtFpmVYF0dLhk4NW
         N1My4C1voSm1hQJT+PwNro6IjWVNkP5TJFshQEtdDzkPPLrxMzb0fYZ4OPGfS+6mLQes
         OQcdLNQbvKHEor41qMzXkEOwd27XkUu4OpUfKztr5RrDfyUimRR4mMucLafFvFsaDyoN
         ktdWJPR0iiwkQpIpiVM+dfOiabgRIHO9BaZi3j+xSroFBihPkqW5HcI/KpPZrmRD0Jf4
         8p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083286; x=1792688086;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9A4R0ld4xtPUzYOLQ26dMhhwMrPELtsTfbERqTYNE9Y=;
        b=Wl28W0mo2X+b50awFPTs12RnOv88sJvHuV7feFCZUM0rPKGmPG6PWGcRvFM1pgL1ui
         1Ys4+/BuDziK6Df1Is1uBqz215BSh/UgR1cfNhAxw64kTIW4DwG5cyOhADaw3IRsKw8h
         vOKAdh+hImjWLiMDLPJhpmrj1Gh+rFvQ60b4sZkHdJLLJQii4TfuNL1ahbvcqn9Zyvrk
         wM654otdz9/aBz6c2AOjFV2ycglF5PBbhQlfYhC0ZWw3U13f3kWbvkieItLIMzG2fse/
         qZuZwhcOOIxAgdiX0nsKHW3LwZWjeMVr4Guxsw+1euytUUmpuG9td0zQ3NEcINGuCPjm
         6rlg==
X-Forwarded-Encrypted: i=1; AKwUvBzy/CT7R6PclH4nFuJJaAkQx8erkognP3VuT05C88IyhWqnTzonr0Cnr9X3RTf3/LWCeMuRTpir/Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnnRoLIbg5aAiTU7D+KtXX/DqSGh/5CVKrWXMqxYTXJo1UYxAT
	jA94+NV/AusPzi+1viPNB7UzaAzcuHvJAWCMA5im7kZqZe3zpzkV3DgKBWOGyFIrJsKYTW31KfL
	P/U0T5K4=
X-Gm-Gg: AYBFou0PjlZ8NcRKMIegs0Ec4b08gI97wFnLukh8ZEiNcBSw+bcu7sXmxkK0pM2g1d/
	QzCehwTbuhIhAwfMd1z5lR90ZC7EDvL4a/C8+FSVgwXgg3auQY83PqNh80ZvgnTy54zLsyVVlaA
	zR7HJqE2gN+5X30oIMRfQZO82xE4pK5MmNzfWfpmVSWmkkD+gNfVUMbIAjOvB9cfBRgjEJbfnLW
	3JvNEEEBLNxiBcFDGc2sMEh9nfe7F7LVAJN1QMannYg7hj8xt0AFXOcKE9QWjthlS0ZfXGp329G
	nYapu6llZce6MvpJyruAWQYjDBLbauWeqvdQMh9mJtMF73W3IqQlm+Wp+2OWDNHX6KFuLTHMWDX
	v9SdVkNUwtqBSCAcmqNyLNKIkVb3mm7d388CJna86sXk+BMEobUTbpdvpd3G+AW2cg9Mp3J1lZv
	TQyDyiLjDQT7vm0V8VXO9tLLDugfG2rZO5f/fLDBkDlMPOHeyoo7lBVMq9Hhn2Nl0JTUz1wvs47
	tb7ATbQWdbqYGwsRELKiCTVjCXyHzWWy/9tJybLiem/ZAju0l8YEWRd8GyyjIlRJ6ding==
X-Received: by 2002:a05:6000:4553:b0:488:6bcb:ec92 with SMTP id ffacd0b85a97d-48dbaadcfd8mr27221647f8f.17.1792083283972;
        Thu, 15 Oct 2026 09:54:43 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:43 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH 0/4] clk: ti: fapll/dm816x: clock tree and calculation
 fixes
Date: Thu, 15 Oct 2026 18:54:29 +0200
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHJvaEZJbkQPWYPy3u6Tk3i0On
 /q+9wLLRthCHlxg+BAr6+JBYQC6r5aOURpviFSUkqIYt8rpHnl0q0mwmTNKM9TTiBz/A0pqBf6
 9GW7l/MpF+dvu9cDavTm47wcLSrPcewAAAA==
X-Change-ID: 20261014-patch-ektor5-dm8168-clk-e426101415b0
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=1668;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=33w0zdjcE6uxwqU7ll8OOTlJSYoyfRiEeotGi/VFEE8=;
 b=bZPgsiJnDeGOKFJE78I2bUEqqyxEubxzl/T0MZ6XjjKEJTiC1lK7Vrq88pRK36Y7k1LfrsZ5D
 YZPBhsudElNDZlUVtAOrdi74WMMJewl0pvoCOVCtc0jU7oGv6zfB+2B
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

During TI DM8168-EVM board testing we found that the clock hierarcy and
clock calculation was broken already on 6.12:

    main_pll_clk1       <--- main PLL should be parent of other PLLs.
       sysclk1_ck                   
       main_pll_clk7            
		...
       main_pll_clk6            
		...
       main_pll_clk5            
		...
       main_pll_clk4            
		...

This series brings fixes and additions for TI DM816x / FAPLL clock tree
and frequency calculation.

Summary:
- Fix clock tree hierarchy by not using ti_dt_clk_name helper(), that
  causes the first PLL as the parent of all clocks in DM816x.
- Add sys_ck alias required for DM816x clock lookup, fixing a boot
  error.
- Correct rate calculation logic in fapll driver.
- Add error logging for clocks failing registration to ease debugging.

Fixing clock tree hierarcy is critical as it fixes DM8168-EVM boot
failure in 7.3-rc7. These fixes are affecting DM816x SoCs only.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Andrew Goodbody (1):
      clk: ti: fapll: Fix clock speed calculation

Ettore Chimenti (1):
      clk-816x: add sys_ck clock as sys_clkin_ck alias

Rouven Czerwinski (2):
      clk: ti: fapll: remove ti_dt_clk_name helper
      clk: ti: fapll: print clock name that fails to register

 drivers/clk/ti/clk-816x.c |  1 +
 drivers/clk/ti/fapll.c    | 16 ++++++----------
 2 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-patch-ektor5-dm8168-clk-e426101415b0

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

