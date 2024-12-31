Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2EEDE
	for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735657311; cv=none; b=ecRoLj1w8NPUKwGf5MTnLq7F54an5y7cf8elxNsgwR6gGK0U4QmRwD1Xys16U20KQ76rVWlgCCs3S5lBmUIXcV+9x5Mo6eJrAYMByoGE3c0WKgJ9H83gsfvcneOhyXGz9mvWXFyrDZNrtsK77ayTk951s80RhwsCkuA6f4LZygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735657311; c=relaxed/simple;
	bh=dO6CdgTSt/+zcXVhJ2Uz5ywJklO9Ho5WIRCjmPAxMTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvK7eKx0IPbtMnZRcWcKXUHki4PgYYySszKlJvLIaXDmEF88jiYh/HKVFKwtbL/ngQ8qRnHYVMxTxZ3lRLj3YdSQsFMbiWEoNvqBkeqkN2kP7/ZfHmOpJvtLHd7P3stQBFPIJYmgj/5oopqFObYhBYV++eZBkgSi7MKJ4YsZ0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EbccG/lo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EbccG/lo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee0b309adso1020904966b.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735657308; x=1736262108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
        b=EbccG/lovL437LA7t63hWEC1h6UiI2pyUUTvdSsF+knZ6rsFNAwHvG2s0RuTleBUh6
         aVzQowLA70GZCBVxmNfZyrytwC2CVilwXSnIUUd51GJZeB1V9JAeLflEl7YjFA08xnbz
         ljUoF5iEkB+pUsM3LZC+D6uMaTe3+xvr7ly38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657308; x=1736262108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
        b=B3ul+8UaoyRCRYuG1sewgoL6lHQUC195QPt9nInhxvW/m4NHSGsnDSG711ROAMtSF+
         r3VdNrdQbDFUgUGSVgFocscM5oA3p8t7yP5IA6SYHDiUhKj9ddnYDateFqw5o2KWyDL/
         LWmVmSaBW82wYL39kLpVtDxerJD8Vx910tTpL83TLInGtS71rmrX4xaYJ3KLph9+qoc/
         9zHMNxAeaSOKEc/3GiEFxdZmCS/ASsDiM1zs8Mhkb8V9qu4ZoJ4ZwlY6gbJBytf/PJTc
         xniUsWPl4e0MnEMALLsnxfg7vjJDbbfJaZ7MbYForTUf8wMePh4wtJ9izCWq3lDcxM+W
         aymA==
X-Forwarded-Encrypted: i=1; AJvYcCWb/949YNHXsYmPMSfXrom2v3mP7Lg8YMU2EzbPIu/bzn7B3+q1hNxGz+yaJd2bUXnCBTLh6lS6qPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/URWJGt28RsAfb+7p1QJzlWJnnGea1oJV4Y/jjnD1awiB9c9s
	lSxnbBeRaCiomnn55u6yyiCqOre340nbJHGkKE/wZYjxxzJW0PMWK5IcqUD/FVU=
X-Gm-Gg: ASbGncuOPQXk3seFcqsXrE1NhdJ8cuLVMSLgIZExvBrxa4yGzlB9FvLvBZg+snO1Pcr
	NtNRUEVi1gDRetP1BHnCKEtHUiie2SgsUqxruipSUIH9fqwm6k/b67BzXyWL5Trg/iTiBUAR+9c
	79qKg1jvlZATtq+5Cs93cwCcaKnr2Zvwr9tw8480SnR9YZL3qKQJeVhsCFE7VAMLPijzW3CTc6i
	/bbRiEJ6121U6q1uU7FPCSbaWDtwpoC3ZGipkkYvaXRMbZlthQIfU6hHjmpS1F0OM4dZsA8udlJ
	kp3U7EfF9TzFOyIz8Ptczw==
X-Google-Smtp-Source: AGHT+IFTYNVf4PANRTY/pECtc8/bJhsdH1GsC3hZP7+Sn/hJKwsBL1qJz0Y+j7y+5zffKEeOjC6D9w==
X-Received: by 2002:a17:907:2cc5:b0:aa6:8676:3b33 with SMTP id a640c23a62f3a-aac3464f929mr3338245566b.47.1735657307900;
        Tue, 31 Dec 2024 07:01:47 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:01:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference paths
Date: Tue, 31 Dec 2024 16:01:40 +0100
Message-ID: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The path of the two files was wrong even at the time they were added.
Let's fix them so they can be correctly referenced.

Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 9b3aaae546cb..ca75b1972470 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -40,8 +40,8 @@ description: |
           = 0x180 / 4 * 32 + 0 = 3072
 
   The list of valid indices for STM32MP1 is available in:
-  include/dt-bindings/reset-controller/stm32mp1-resets.h
-  include/dt-bindings/reset-controller/stm32mp13-resets.h
+  include/dt-bindings/reset/stm32mp1-resets.h
+  include/dt-bindings/reset/stm32mp13-resets.h
 
   This file implements defines like:
   #define LTDC_R	3072
-- 
2.43.0

