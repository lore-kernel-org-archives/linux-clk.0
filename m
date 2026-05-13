Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B483B19D5
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651807; cv=none; b=ChXxtR5TafZcclbNe4Y9/RFApfFPoSedrSqj8ZUo3V4s9aPb4eRNPzNktN1GoZZ/ArHk9BIPJgX9mCpDN4kviFk70lFvrRgxln0A1ELwSw3JPMLFDOGdEryI4mM45beng3LPFFEN2etN05CkP0zAahBFn0q2I7b8kgwlBPO8de0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651807; c=relaxed/simple;
	bh=a/Y7s23XK1yuZZsanB+vxOxeClflBxCK/XJXdhhe2R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4b4yGFeDpktjkIEBFr0DJBfH9LnT/FMgI7MRRa/mHPHVvsgwTNSV580YmRjze1vL/QJX+qmlx5tQ46Fj79+k4c4HdH6AZGSyjzi+sPSpxKU2d2g7e/7BOo6crTRoFS8lzsNfuxDdNRaR9Tvr8YmjcggiKr9QoqFhFrirSqiwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qj2jcW2N; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj2jcW2N"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-362e50b4641so3922742a91.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651804; x=1779256604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkpgyOl0OeakKh0bSkim2LmtFin1UzqZ4Tfpbdh/KSE=;
        b=Qj2jcW2NwV4rPKoM1NXEg0zSLjigvf0BDWRhtIpZESUr0a1duT9ZW3tugz2br2WXv7
         hDkpQHUbjncB7lC3G9h2hB8tTLWcUWMb+8qMygzBPbSHj1n8wor0Oa/CHJ1qoR0+2ut9
         MpkcqaGmzgn6l1komRbcjS723N4H232iHyS13sFPKSmYjaqgQpHBnW6aJjqBkAU80iKF
         NH86Vt/DupCLl4ZpuufoilWQzLrQOh5ai0Q6RMW4qJOI6sNPLODAlxaxP+U01119cv3e
         tj21j2MEsglK5whE2KV+Cwu9J5G+J0TeDnbQVkWmX6Zc5agNRBjPTWecu86XDvb2Y9x2
         NIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651804; x=1779256604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkpgyOl0OeakKh0bSkim2LmtFin1UzqZ4Tfpbdh/KSE=;
        b=Hnf7QjPQM7QKJLM8mvjBI0aMDkhljYz/UE92yfrB0dFQD4uvCvNVYURsuimQanbceZ
         IoGSiUNuHcYn23V4n1eapY9aYLRz5bDMiULjJfWZq0r1t65uwCr1TwrFXAoYKG1ziHWT
         z/jTTSeGvEO2gUeLPmLAQqqDFUmPOjKuDUmfpMOAnNWXpaMyHKyD4Z02/b9Gs+SC1P/t
         CKoR+PoWzcNAyx5dHvxm8MTRFkuFfFHmLodcVq9chdbL97jk+HW11kx3ufv3DsXzQfE0
         pNcuyXoj6/E7O4kueuGSOOSsFwLptbMXvp5M+2EiF7R+WiGwDbY9VWpgkfqQoX2+UPN5
         /voQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G6LV8FJWHtCFCKqMFCbXBFPFlXbqOSmHolHEkZql1PxrDJGUMHWzyDtocmn3kzyKxFsNucIBts0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJb8OeDyeztzpwQF6cbFoOO6GtYcOufywRiFdtvYsA4EO0MyNs
	YMM9LcbF8o7TdMTRNqtoTQKhI2+tN6zkOR+Gq/sFcf3Y3rBINUO0rE8+
X-Gm-Gg: Acq92OFgaVt5BqtDDb0B21ttdH3b/0q8AQTioBM3+It82UNCdL94em/FQtncYNW26hi
	XCFX+HsIXHXp+DO5Db+X2pHfM1VciIavqna4xEmnS4CUfVjoGk+gGimnsLdltIkEmUyaM1tNelt
	8Ay+UZgZ8UbSAYkr5QQhmU4YFg8pFVTnwImA1XNATtAmMJrjjcwy403hRHJysyJXIb0u4bPLKk9
	BfS/ky8R/T4N48vQUGGDxzlrJ54ethDqFITQ/GbPWJc3FapSRguh1aH6LVMFhxYhp4zIowZebBf
	/JpB+4C12zWgRBZlgrZFR4hp5q6oItrs/51AVkFFKP9KLmni4AIWjIJW3pv7R+lYSrmuCiRtrvb
	uwezbZsyYp8DutvNlDux13tCzqHG8ChwO6N8Hcavlh1ffgLAT+Quwr9nqw3KCJe58PzCYH6Twoa
	G66v3d144Z38m5BHaanV7GWRJrCDR7r+1ZMnyqaXmzYNl0+Zpv7viUQpDHb92li02FJgSEQrwDk
	IGWSKZ1J2B1
X-Received: by 2002:a17:90b:2541:b0:368:78da:803 with SMTP id 98e67ed59e1d1-368f3ab6bb5mr2401771a91.12.1778651803953;
        Tue, 12 May 2026 22:56:43 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:43 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Wed, 13 May 2026 13:56:23 +0800
Message-ID: <20260513055626.1070533-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

v1 combined all fixes into a single commit.  At reviewer request,
split into one patch per logical fix:

  1/3 - fix div_u64 return value being discarded (affects both
        ma35d1_calc_smic_pll_freq and ma35d1_calc_pll_freq INT mode)

  2/3 - fix PLL_CTL1_FRAC mask width (8-bit -> 24-bit) and update
        the fractional-mode arithmetic accordingly

  3/3 - fix ma35d1_clk_pll_determine_rate: move find_closest() into
        the configurable-PLL branch; unify read-only PLL handling

Joey Lu (3):
  clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq
    calculation
  clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional
    calc
  clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

