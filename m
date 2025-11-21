Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E782C0296
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716147; cv=none; b=a3ZdgYtB0BYggEGQNkQ2dP/cGGZlE8/5MfyoJ9CwQ899TpDuxGKDcsBv2pbS+i15S8d5i4lvF7UJfkD209QeC36T+bayqTfmmnkOKcIk9E1lhp9VVB9mY6xNZIFn4AJXYXSyMWAeiTY6LspvJ8roF6WZzDdr/7oZPKjG27fFg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716147; c=relaxed/simple;
	bh=dfzQJVC7+HskfHckgversV6c18hzVgTv0Io5z+9VUjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cizEd//hf89eQHf1lMN7WWFN5ESyG/CVGHeL+3Tt85m8C4koh6WpVIzk6sj9hm1nOxtN1ze97FpsLGBNDpzbtT/E7Z/Hg/9ZDvE+4yUf7f0Vm3BjxcLIw460icPWYspyUSAZ7+b1ZPB8M2rc//WIsSEfushz71qQ7yFB7Zif9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxQKUmzn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxQKUmzn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3b29153fso1050216f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763716144; x=1764320944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VNuYKYyYAXvFeu+2dsgCHW78TdE/IKv83bgjDFmd1M=;
        b=XxQKUmznuSVy27OHA/M6E89MaY9eL6sGlwTEi2na+tJjo1aYjpOgDTM/GdFG4LuI14
         NFdYDRt3Mlz+XAfmcM+3oiOO8qUZ+KJ80hGogfFX/c/3ZDanavnxdE4oo4xEmjb38uxe
         tpnAUVZAV9lDQrnSu1EWp2x5dQ8N337XHjTtYAJe3hQNmyh8E8oyLnk7RIup+tvJUOlM
         Cif3I0YfRvTetyTVn6qGpvAmUkH0uQOwDcB8+QO8tKRXmcE5IujBsSLGajED9GhSQFvn
         AuXN+RCFShfciDY1Wddsdb10+Md6LdnidyZbBcC7sZZg8N3ty3WQi4mp4YuXzaIUQbG5
         e7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716144; x=1764320944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VNuYKYyYAXvFeu+2dsgCHW78TdE/IKv83bgjDFmd1M=;
        b=AItuUJhtJMYQ6TnMJJFuN3v72aHlAJGw3RL8mYLyITHUzXYzMiLvzZC8mBnRTMZNJX
         XrjFnfllWLSRPU2/AP2CjvbHdoj/Hvt3pF1LadSmmo8Lhhtt7vaS+PqEQxpFoqLIk6Gi
         nOfaqNOQN4L9VTmJAd2eg7iodZo4SLwwvEHM/2MBXK57Y9uQ67zJqygfZlz1li+z3AEa
         pLvlFSFCIq6+eYCzEnXej824IYPZYlyzMI4DMwED5qEY+3tuBBkDZMQMEN79b4+7ySbQ
         T1sbtGUc+eVP7/Gl3+jXmqmtM/nn764p5gqgOIBdVjwOF2bi7WY9F0ChP2ugDydoh02v
         nROg==
X-Forwarded-Encrypted: i=1; AJvYcCWftZC/j/QT+HbFaeCnmWJCrqI43C1r1XoOR9lXCiXNoUTJGy4+r2HlNqfDaelp5voWkWXbdbxfQ5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/xkDHyaKmWdTqpuWd8xQHvqjY+P05m459J3K/0yJBG4DbAU7
	/DOjbD4Hu3nUAjdQGn9/pxgy1v9zLkrvRqK2hPfg0Po+EI+pQg2gm+qr
X-Gm-Gg: ASbGncs9gMrXoC5J3ljM/8ciYRMMl4zNQdyT8ytSruIw4Z6RfeyYanWy8qrwoUV2n0y
	NiLW3t2WMovgFvBiyuYwwc0IoT3kzEt8QfKOnKhUeS2wB1Z4s31oS7LY3GEz8rubyjKxkXadoxQ
	nmZgBXsE3BVuO1FyvWJX3L7Eua9H0k8UNgzH1MhCKr/mGdBEojbdO3mcikRLreYfeC+nzdCFlVl
	RsUiBoTrBhulZiyNgNPUG5kF5c4+3DwQEXggca+ixQg5m90nkq2pQul4NMjieHIjT1RZMoWbBM0
	r0m33bCUt5uV2pl9dJ/4R3dMW4IfMjZgBn5ELG8ZThnF3TPVrEmQVOyUc1nCbbW6hlcrhqdB9Xp
	qa/tyrU/1YmupYtmSYSIPzmBu+vzdSgPhwKKgn4iIq27rQb0LOnbX8jM4Qe5TbEMz7u6PGS1TTc
	AgTQOwjQSP9pcctt/YLQOI0+KqBjAxlBNx8Sw=
X-Google-Smtp-Source: AGHT+IFic+NZ6mRJVG3/NsgYDO+LXGnsRyCtXTsDhLGXPmT43NV5CXuxv+c/pV7z2Td8e8dk16WAUg==
X-Received: by 2002:a05:6000:401f:b0:42b:3bfc:d5cd with SMTP id ffacd0b85a97d-42cc1cd94f3mr1522051f8f.1.1763716144129;
        Fri, 21 Nov 2025 01:09:04 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm9762811f8f.36.2025.11.21.01.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:09:03 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a09g077: Propagate rate changes through mux parents
Date: Fri, 21 Nov 2025 09:08:53 +0000
Message-ID: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable CLK_SET_RATE_PARENT for mux clocks so that rate changes can properly
propagate to their parent clocks. Several clocks in the R9A09G077 CPG tree
depend on upstream PLL or divider outputs being recalculated when a child
requests a new frequency. Without this flag, rate adjustments stop at the
mux layer, leaving parent rates unchanged and preventing the clock tree
from converging on the intended values.

Set the flag in DEF_MUX to ensure that parent clocks participate in rate
negotiation, which is required for correct operation of the display and
peripheral related clocks being added for RZ/T2H support.

Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 7367a713991d..dfd77a1ecc92 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -78,7 +78,7 @@ enum rzt2h_clk_types {
 #define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _mux_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents, \
-		 .flag = 0, .mux_flags = _mux_flags)
+		 .flag = CLK_SET_RATE_PARENT, .mux_flags = _mux_flags)
 #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, .flag = 0)
-- 
2.52.0

