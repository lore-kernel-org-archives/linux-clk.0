Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7DF3126BC
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497847; cv=none; b=lJ4CTYN+NXhEw9XXQqSB2Qi6PIkMF2vDn42qJSKcn2HBIPBSBF6i0pj/8y76Fwsr4S0az9RN5SNo7AL5J2TMxSJt5rCfPy2+AVBAR3rjrmDiTnFFSLtu21GrRjm+CnxKP5jplwqqur/BP+wpw+4UEeJubtqLiLLdMEOqhy/u4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497847; c=relaxed/simple;
	bh=z2jvO4b7tvtzk/zUy5qdlg4JlkqUFIt42V4sDGTZLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGF6BXURjb5IXoosgRWf97WQN1qOSXEMCIxVAb7v1gHEetB8JxOFhMR/i+eR7oi7kN6JO1M9wmr+wRBjzfNBg8L03lHbbCgxHWKf3DFJsOow1sMwWJP8kmWsuTOH11RxEehdplHaS4a2quiJdDE6ywA2HQAHmTUa4Lkr3odcEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMBByQT9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMBByQT9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceed7018c8so39156085ad.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497846; x=1785102646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=FMBByQT9cLC96gy64fxgmbZrrzNyL1mKscSp7reuIpvATYLiLaJC5RvPmUbrNe//Co
         147OexWQlCphFzyxE7WGpkwBiw2PNJi5urMNMatpc4yzsx6zzmmoDgn+QLAcETKyirIS
         5C1goIa45cCLr41EhzdnDynUOobnZbfeHcTRKcLaT3Nggfj5MiTn+t+3tVOVCi7ujY3T
         ZJulveMge9gFgRwnKI1VqHOPdN+cmUwPgOVfAJ12M6MV/8O6u33SX/RX7BQPcEW5iyLH
         pCsNlm3F7MdiGTdLUg6lSkpImMvTrw464QcaYQyXHHxrj3931yjeX4MjUyMfP/egbs1G
         ZRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497846; x=1785102646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=f/kTCsLbLoI9k3iLQv8bmCc86f/Q2h4+rlUt2KYEZKRQVf1BeNRmGKgpexrkWCNxpf
         Gosi+3+3h46sVRVy7DVinV/jwnXE7Jn7VywuybZotIjJd5oNtOFGOjF17vMsBmkUxZoW
         yJBAyqXzrUti2Z3ytShfCcgl5wCNnxTN/tFrBitHBi8sFf+eNpBy6U83Zj1bmcceLA3x
         abJITCoxyraB+IlWvoLTxrF3u8Z18wgBVKXFov4OI0k54NRyoLNj3vibty0lWzj87UgL
         KVGUxZI3XVvpH1ZSqkWDB/AKxmGIDA2/4cuNOroZwIT9pZQdGn8MeuAfwQEG3gsCA8zO
         vVxA==
X-Gm-Message-State: AOJu0YyH0IdoiPuyt7OEXPQP7f7gvnkpXd5pJX2OqIgY/r9othZ1pBxl
	9ybDz94c28sPwKz9AlJqQJ21aj/6L8lDuWht1yBvNx/Mp2/Zn5ntcg4vE67a7Cyc
X-Gm-Gg: AfdE7cm9ag6IqDOgOSg8KxEglVbpU6OT/OC2jIp/ENL+6pau5uOXmlSaeFSkceqNTY3
	/Y+4ZZr3St4Qhmwm/vka8XpWkEyrVy0yshHdevlCr2hmC4dIvXJ78ev9XqgZ9NzrBF+St6tj/gM
	Ghm/QwkaE+0tZQH528LrzOY2j/qv+HzH35EDGR2bhh8M6x6FC6vE3M7kfdk9MgNHWajNg3gpqkN
	fe9eF0XVXw9k9bKhRxNvpL/ErKhIV4/Z4Vh/zGaoI4AJ0pIchbcZGTnvNPqr/xqgT3b+9Pmk6EM
	aiFvgNNOKa+dZ2GVqSqLKC6sCzLkFv+XgZJe/PQMaKAWcYe7MZoZiOycwvo0D/ljjgAujtNIpvy
	AZp8YyftRPTrj0pYSAhr9+zjN5rxfAQRGfSlvuev50eO5TMKmzo8J2oAyJxkFnc5ZGvp6OlhhGp
	1XeKeG/kzvDL8ECOuA/hZ7TrC6bwbEhrtV0EuA6fxgST0ge2zIA88Xje7+p2/NtX+aYpbGBPUyQ
	l0pHfv8G+9Jpkq7aE2lyVsbSJq38n1fF5hyCNV8JfhTLgpgJRCpMfg=
X-Received: by 2002:a17:903:a8f:b0:2ce:a600:6022 with SMTP id d9443c01a7336-2cf34850c21mr126436495ad.7.1784497845982;
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
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
Subject: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Date: Sun, 19 Jul 2026 14:50:39 -0700
Message-ID: <20260719215040.767232-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719215040.767232-1-rosenp@gmail.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.55.0

