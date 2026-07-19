Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5D2D3A75
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497846; cv=none; b=R9jS4DWrhtdEyOFlGx/yqVjB0w25hEbMfiP1DCoJOlls7KgerTHur38i0f6GqxIXeqZaVSbx4VX/8dG2+TSaDy81tAZaAQCKpA1m+gaIJiVn5qhdPbNdBkGEdIgFXqfGuDlGzoYX01rSUZrcnYfF0Vy1AKhmcHi6icy7i8gE8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497846; c=relaxed/simple;
	bh=ImMEQc8V036XgFro0YZ75qNqprVm/a715A3QCjmfGTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZfRa+kPNkOtIMpIFo88IRe96spIddfxkqdMzDgIV3M6TSfvRiwZEtfG5HjGNAe7ADkIplboBMuqmcqsEeuTulbpycFVELwneYO9fkaLCcxVcZaIMtVeaDzPVfokoi7nCihb1oUFJpFeFxSyjXL7bd7O4Eci7wDx8gKxSOvPwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc+sYklj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc+sYklj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caea3f742bso114580685ad.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497844; x=1785102644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=Gc+sYkljFk+epI45HA9TSrVlc2CsHHNDp2ifbu/DC9ef5j3xVkKLU3tfjbASFK4pkA
         irjKM/CsHiTr0llN6Cli4tOMw4yybrQiC/ghYMgSSNHGYjOhuv4Jjk/NjgPl3kffbLC7
         VNsj/qmUyI8ZIdK+lvOI3qcN3UFCQm6o1QgckSSVzake7I1n5UBDYqkYx8aPlP3PxpLK
         /tpvlwCun/DATw82/VR8vYE06xe4lAuM17UIWPyvxCtsr3PdYrfEqQjDtLbY/Mq7obzW
         Brv1ktGe5pNJOSIu3oN4LGcm0xgiV/7xNuf0QMCi+XnqsE5NH9GGdxPP+wgE6P+1zylu
         6cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497844; x=1785102644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=kQYW6lEKFeUWTCOr4/0DBBpscETsaWsvoSKIUEDtVy8ddwVSJZuqA74M85S1YzhSgy
         n948aQN5wybxbtMAYlmdejri7KO9X0qZDSFW21MvGaiB/lYpMS+uVgdeOox/K7z5ep3D
         db/enLZR5sR75Z1YJe4SmM91DNu4kdujk1cfdZrazdaqOczMyoN3zwW1iO30b5Lne6Pa
         bdx4bjyDWrzOE4X3pMLBQsqrDDZALBLFokTtR65KR0yQorgWzl12UcOYH+K9IH25CMrE
         Mb6nBmcYS06OYmT9cI1YcgWUh6aWFYHcD9e+eeV+WWfRmlI8WNKcNgDDRF19mPqCmX4Q
         jS1Q==
X-Gm-Message-State: AOJu0Yw7jv+hyMYKtGMU0B1XMGv4NCL6+2PQPw9kUvFYkixH71UUkiWu
	kXNJCpzRaOCnHX2jOHONwmueDUblpHCZ7tr/8QKs6g3UwHnxexiTxiQ57KrY6fpi
X-Gm-Gg: AfdE7cl10oPz9+8t7mI2JuNL3pW2V77EvO48qMawaveiAr3P7Ejo2jZkk6vyDapjH6w
	EKG6tJw94FllPLrWwu365T6rC82CjVrZ11aQnPoYjc06nUa6h8plJWDbgZCOK4evNPlNxvAAG3D
	48PSAsWY37G0tZMVHUO0+rijOb+7JShi2UKzhz3Q7i9xkixI5F7y4htTsV52Z2zUG85QHkG4nPp
	M0uKQaxpMoJVioALcyUjJWUHmWA7dQrASKyP9lojWPJQ7nVVLRFBRsTnNESi2OclN8eXT1RjFc9
	RcdOVYulIddpkeFrKw/UoyUMgqqGPDnhmPCQoNX1DIF1zQqTNiHzD/gh4m22zSO1zVP29l/Ss5r
	cktuVZJhyMTngu1eCNeLsC92z6AoloZiou7gtron//e/H1Jlbdlr5ZBS3ijQNRSfOjG48su85KF
	qgv6tXSUXLqzzJPgfJV9bqLbb/Oat8a4pLgWARMDxY5jrJiBibOqQpmzmbKJyPT06APlwuOfJca
	LFGpbJX9SPoz6hTsBK3qXdTeNnIdFvdY5N7ztraYK72duZOvj5WXeM=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr127277915ad.43.1784497844128;
        Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/2] clk: stm32: fix COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:38 -0700
Message-ID: <20260719215040.767232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STM32MP clock drivers have COMPILE_TEST in their Kconfig depends, but
they fail to build (and are not even compiled) when ARCH_STM32 is disabled.
The first patch adds a missing bitfield.h include so the drivers build
standalone, and the second wires up the Makefile gate to the STM32MP clock
symbol so the directory is actually traversed under COMPILE_TEST.

v2: split up in two patches.

Rosen Penev (2):
  clk: stm32: add missing bitfield.h header
  clk: stm32: allow STM32MP COMPILE_TEST builds

 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.55.0

