Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6E1311AC
	for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735657313; cv=none; b=ROHp5rBplT139SW+JQxipiShpnDvJJWew1ByWZN0oArDFvulNkk95eE0e9iqfWP5vTypkAcFbd/46QkIBsesg6e2McVTpT/rslVfjgLL9pVzwmzE8Y1/lFabVFfdMsR7yCHDD8WrC6DRMSj1dv3O9su4t+XBYlYsUqWGr8u5cV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735657313; c=relaxed/simple;
	bh=+ukRS+U+pDZ5qsomZDmtD+TyJSWssHy5ZeC3wySE+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeYDseTDF4PbjB6kyrtoiUf3U4Xxe36nB4DOW35SpnhFMOC76a7wFsQnmmIj4uj2mh6506IC17ZIb7/mRXZY3aKSJ1ZmlkI0m686Yd1Gmd2xeD7K59Px0O2aW/6u78IpUCgOB8C5XhadgD6A7pyVMPZe47keXGRudFjp5JXIQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=oTbm0gYc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oTbm0gYc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso304890966b.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735657310; x=1736262110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
        b=oTbm0gYcgo8N+XuYGL5r6ux9ffj/0fJHROk/QaWGvQW3WRq1PI8GQiP/tdXm2temU1
         l+x9M6/kBHidQsysBmtUehLEOE9HBI+/Vyt9tI+0k//lDnOJOL+0T5Y7MSu07AYTJ9BU
         NNdgcBXUPlDfNNqjnlyxZ48HwxSl7EKdvggks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657310; x=1736262110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
        b=BP3dBKFbJ/+pwtzrzQ4VK4gVCYLwNb5Ril6JvVFU8eX7KZwTR7j1UCPMsMzkt3fNaf
         XaAb7oJmcxoFFn9QPbJnhh8RnO7Ifs1mPo+VTDkTlqrbsVfQrBUfyqffDhRbWc1XiKi5
         YE4m61eEHdiOSyS3ZUNGGchkxboxW84v6RBy1uiGndWzWcN+zA5aV01lpz8KCRy4Bhcj
         zMJ2W9S631g5PvR6Bg9szgUSZvhB58rRoS5M1jqX1rl56Ec5Q0mxJ23zNXCi6uZR+/MK
         OF9MHrVLLhJeYpEv2pxFV3mDdzqBCH+HMgleUMmP1fVXofb6LP2SSMJCsMjqqtMbSJJv
         zBOA==
X-Forwarded-Encrypted: i=1; AJvYcCWwPNP/sfYIrOJm+DnT9vnVOssJc17ecHFceXn42nQjYHRKzL94kjqmje3XSaOtbVST8eI1NU+gDu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzuWsGuGdWkFDX1+3QFDfOiO2a+WcuZwUYJqojlUty15pA36Yg
	8jwvmuyasvXWfJdszKZpPzWKDy81nVkvY0tsUu0kLzVHcuQB+CsyvT/nSwzeH0E=
X-Gm-Gg: ASbGncv5D1CA8F1PUpdPss4pGT50A23gTexqRQMj0W4fbwGBbRsiXFSyxKo+lypCEjK
	F5UmGQppSexGxi08TjjxYgylTNs4RGIdyjSPmWgsfhORxkrXUk7MXUHtYg5Y6tNJqbcKf0Jo3oV
	qLG32KwVqCocUQXHF+GPe6o73onFozPi9eSMgmgYhDpcIQvMGQEb4LfY8f2cVbe4LR+RNAdvfBL
	BcEgK9B2wviMGP+oMCQQ+8LPghvflyiJijNbcrTRofAFyeOSeVYJtt+srggBPAQ6bBEv3QFxpBt
	jsxrKe6SsEdd3T42dRh6jA==
X-Google-Smtp-Source: AGHT+IGfEOn6eiAOcKUt+G4AdS/vhANNPsxMNquB07uGQCrXQb511fcC05DereMIXHKoyNQ8gZOavg==
X-Received: by 2002:a17:907:3f0a:b0:aa6:96c4:ad62 with SMTP id a640c23a62f3a-aac34217fddmr2955209066b.58.1735657310070;
        Tue, 31 Dec 2024 07:01:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:01:49 -0800 (PST)
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
Subject: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the reference path
Date: Tue, 31 Dec 2024 16:01:41 +0100
Message-ID: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All other paths referenced in the file follow a scheme starting from the
Linux root. The patch adjusts the single file that deviated from this
scheme, making it consistent with the others.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index ca75b1972470..e72f46e79b90 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -21,7 +21,7 @@ description: |
   =================
 
   All available clocks are defined as preprocessor macros in
-  dt-bindings/clock/stm32mp1-clks.h header and can be used in device
+  include/dt-bindings/clock/stm32mp1-clks.h header and can be used in device
   tree sources.
 
   Specifying softreset control of devices
-- 
2.43.0

