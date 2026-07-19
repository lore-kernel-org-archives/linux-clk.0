Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCF02DB780
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497854; cv=none; b=mrNzsjr57stRcouduS9qzyvyl/G+rpt44NOOYJq15lmUkSU1Vjl8L/Fl2PiwcXnJ6S0LtrtDKmLj4vydexQqEACmq7h5CRxZwUSuqln89COqTzQBeF/QOvucUnqS5NHmtvt5ieOkwdoxgiEs9kW2u3Ci6l3ApPpx5z8gUXU8VTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497854; c=relaxed/simple;
	bh=0uY0iiDoWci9ie3IlgyibA84n8mhnz5u87H+NUZz4Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6OFBbjhYZQIzMbv0EwKkGFZuylFbmRw+mueLnViMPT5KIBl2uT6PhC6omBvJPpnnWtiQfoWpNrdjjYuTcH5+EV4mxvA/zPgnODQtu6q4UXsdyUdXYgNi/a0JkLZpBFU70u6eeutdnm8VqPE6pII2Tgc7oT/cchMxY3QR1W7bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5f8iz4W; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5f8iz4W"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ced3386430so58864965ad.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497852; x=1785102652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=D5f8iz4WZfvo5jvQWYjdx2olt+52IPYfjAn50jJC+cIy/jyxp0C33JopXoNCzSy5FJ
         PppZiqn2d81poiaka2BTck9sDkuNd0+9yYeB7B4R31tVzp6XNiQMqXTW8ANt9c+i2DF1
         ba9BdYmfz2wV/ZeYpcG4fAFKnwNqmsZmm5ju1dOdEK4AHRVObxDEZwhOjnqQoIJIp7ZQ
         rY2MaWLbegBecYCaUzS68J1k6aqORC3uuhfRdsWdaV6gVpKj7DvP1DuKduYW8EUFA5lo
         ViUh/C5094tldxHYK/yfnTlIuLUk8+MowV3gI5ZDVnDM1hGwL/dJkX6ymEycpudeO+Bq
         6n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497852; x=1785102652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=YXtlYz5CT5b8mU1wIl7JpgDXI3GdrSKUyd9gi0tK3b8Y5Uj3HOOogLtAE787IoOTWn
         E335qNtevY9i4yDmhLtvqeVsPLVqTCKe4ht+AQ8L5Uf478OWE3wfBszjYAnH4fpxZoYR
         Scq+m5ZaVKET+Je5n8wPqZzwjKTDkp8D+HCXBAcDMCLnrQknYlAWxkzTkQ/u5L52rCKp
         nP1NFQpZt5TTohtEeMhgRuY8wX0cxbpckRwHtZE9O934oQsKHBTuTEUkYSMtuyiITHmM
         sxqN1r+N+q+FEp6zAGmh6DE2fxhSgHLpXPHGXCBvmlzHykk2dogMzsYVCP4nQOcG2RZw
         Chzg==
X-Gm-Message-State: AOJu0YznX0yhgjMhP3ciYC0A5rW/4xO6ZqcLFNN+grPcq/XtkQnCGLKW
	ZZlAgy4RCrTeboZnE3Xgd1S2fNKWNyd4LKgMqiTJt1nfVZjpsUV9uK6AEj7VSEoG
X-Gm-Gg: AfdE7cl0glulsmSoJqR8mh1sjzK4R5jZedZcaV4alE56s4aUHMJ3Ih3u5gnLDhAmMwr
	bSHkqnmazG4nUa8WXf3LMsTJs/djveJiFjRt8FEKnqfnAqGosbNVg3US1fiqtU6t7z3KZ6Doxpd
	woPAeb0NN1OZQH3PhIGOqAPtZTOqJkAbXWh3N/59l5BTe59lXqbm8s5D9f6SxIppeVV86Vg3i6k
	FKkHqgJ8bsxbh+8JR1HIuulnbIaMsQ9uGGvZceynDy9rrg8mvgfQ19mXQJrLxZuT4ABmj2JR3iw
	aexA/ogAC0q4KNbMLUthFf4LgV2UUW/k3hI8tb16KP/cfERHAnv8gywZK0PCBgoa/JBEQtADcKV
	7NKvS63jlVddzxsYZNHFG1+ATFvNO0QeZYtmwe1IT4hSEHIK+7j2g5KhkCSAX62hlDr17kjCxz4
	IAM7/bWp2iyAiC1NeQHvxJHzM/PTPrvmz0mn4EU3oeH0FkrlK0Ifx2yJ7DXtIBK8rURfhj0Fftv
	DpTNGPMDxQA3PtJSSDVIsK5AzbjHyRq3t10YfZ0uQAOiAQCbLiqT5g5i7/hRYbXPg==
X-Received: by 2002:a17:902:ec8e:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2cf3494afcemr121576355ad.27.1784497852491;
        Sun, 19 Jul 2026 14:50:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:48 -0700 (PDT)
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
Subject: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:40 -0700
Message-ID: <20260719215040.767232-3-rosenp@gmail.com>
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

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8383f9f1da51..bbcedf5d60ea 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -151,7 +151,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-- 
2.55.0

