Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E93563C7
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099093; cv=none; b=WqS4aGo/hRC112+67LbvJFFCHl3ITVarH4sAyI1tTMxt/55pX+ZkRtc3zWDwZJsb802hMduFe65JeXQiEmNUxna8uKR8n7nu7Ay6WAxB7Uud+7UANxaRsQ5PzZIyhqKscLvTRl6X/0WEbr2hQ1lrtQf9HdqeO7IcSXcTkk7Wf2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099093; c=relaxed/simple;
	bh=lOIwL05Tz/flXBhzxXOkVqAstofU9cbqGe1LI+AkESk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAY/aaRrOf7zfMBcu/i85TN93d/NOhbOi3FNXh9iC6InVsWz1isnGKVQUaotfNkQMjvnCrlh9cdtc0juwxeKDrvBp26T7KA2m7+7V3O/c8PdqtUFxe0+agE2EWZEgATjmWCTlPGqO5dW9YWm1ROlYdPHaEOF0SoiNU/rR1RTP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu9th0+2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu9th0+2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so324141a91.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 20:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099090; x=1775703890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHHx3XxBCiRn9ZL9C1k6EVrQcl+iP3VVeW/3ubciWys=;
        b=Cu9th0+2uq5EoV8xq4AEIuNwgMuHouv4NdTJgh1z/yddMjEWh/K/dZwY25PZ5xrwFv
         2l+dnMWxcINZjlF4RlTGBCZNunM5FGNplOv3ygv6mcV6fGca/IAJQG7DcP2RP0I2xfm0
         jXP2rzgbKRzhNCfx8dt8757A9AWij7nxScSTOBy/bDLHwi8K8CF/kf2LNJxYMI3qEMcN
         twnB/1toOjCOtWv0nQrcYHHAHBNDuQJ5fFhlQEnhHXUKQiiJgMaLYFeOYo1B1sOZs8vt
         coIgnMxf7YeeP5p77xXFKu9FT6ZBSYiEwClI0Ji1LbFLi7Tu/dG+B3+jnoHG5ABA+fcp
         +oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099090; x=1775703890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHHx3XxBCiRn9ZL9C1k6EVrQcl+iP3VVeW/3ubciWys=;
        b=NNxwFTX/Sw+3NR/HQ7h8dkLyaePXkd0xw0ES7Zx+1/dp9FUNkNu5hesu2QH31IZ5K3
         Spfhe/G/Gk/jTBYcGDmlgUkOjcfQxuCdbaTNxo4Z7X1oG8GX+ZbIDRAmK9eLenp3OFe9
         TmTCEQR+SxWjLn0chAcnQgjvHu5MXxgODZs/2FdS7sbDH7oY03X9tmDAzYTIT5hRCvB6
         mzH1OibiNARR9FsVC6fW+vtp9EACFmScgD+Qdt+QplDdS145omonA8JZ9HRBg5gGMrZ5
         tbuGeoxgMYPA/TXAVZaKNlVfj10AluKMbyQ/XonOco8TwK2UtWIedw+Iv21mNQxEHyZs
         RgGQ==
X-Gm-Message-State: AOJu0YxkdM+buzxJmz6T08VBzUZlU//b1zqLUucr8xONW4P1r5U/DDCz
	YSdsSSbMc2S/WPRa9Zn5OzCANEDnDqvhIoP13PHSh36ED1nR52TyACR9CjH218bY
X-Gm-Gg: ATEYQzzau2zNvqz4HrPYYNoR3C1AXpZWVKyj7c0zc6WqYJunXSPIuxqjdxLxrtASX+3
	qgYX1AxMDGOG0dj6ySnJOhQcSTQjevjd6C9TVVyPiV3zwyMZiBiJZizjUJ8Q8KrmLhdXhFfn2yG
	exN//t+dq4pbCzC+6EeF1FEUzHebil3wqG/xnU2rXmMelw2yWA/qnbrjw8DKrQJ16L72myBS/aZ
	cp48Zd45tM/Ufc8r5eEyS345BghNjrv6KskKL6XFJLRPeiPTuipFL40wrSX5Dl9YNHzVakKmgGI
	xs0z4p+Mt2ky3tt7Ctg0GKtPX/m2532DRnpIcJIIQkeSsrNe/tUtxJ3BATl82I4qpTj37P50xI7
	H1Q8UBVR+5Y9hDAbo+gsvpqWx5OQ+h+Kp8VchoKVuxci6H0fCHY+aT/sRvqiw8e99qXhuGCj1zo
	KSit6Hidy/kFoa7ayf33oGeMbnGqYsAqdvuphl23Z31KUWYvbJI9TIe6A=
X-Received: by 2002:a17:90a:c110:b0:35d:a276:a880 with SMTP id 98e67ed59e1d1-35dc6eb03bamr5152954a91.10.1775099090124;
        Wed, 01 Apr 2026 20:04:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm6395873a91.9.2026.04.01.20.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:04:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 0/3] clk: samsung: use kzalloc_flex
Date: Wed,  1 Apr 2026 20:04:29 -0700
Message-ID: <20260402030432.101066-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

Rosen Penev (3):
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 30 +++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 28 ++++--------------
 drivers/clk/samsung/clk.h     |  2 +-
 4 files changed, 44 insertions(+), 72 deletions(-)

--
2.53.0

