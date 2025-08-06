Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643F26F44D
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472111; cv=none; b=N2jYfm8+2I4+/zZuJwaLtRyPaXMSbYaQxiqiAczLwlvtR+CZ4oimFEFoNTMP0seKzJEYc/+PKvaMuFlamIgJGCy6wGTjkyBTlDElt4zD132O/SzZNczBeOO4SAy66u5sF/eF/6FGiPRGilwWu4uktybYg03AFoVxS14fjAr4S94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472111; c=relaxed/simple;
	bh=o6frYcY7Lsqp/TYdOqMn+UDCAwEy/GzCfBgnWvFYZ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9oyYveEbW5OqAdoKSxx+BSMGt/9QWwk1GG2sGELRxSk4rLDMq7RduTZtUz5iRsAOpcg83uEL787zYRvZFcJhhSYU7F0s87gvwi1Iy+/vebB6Bcq+BTAQbcIzHIWXrNNOyadyb8seBZOg0orIjiD38bDIXPApTYwevKmlvOkowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ixC2ZU6v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ixC2ZU6v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b785a69454so3319486f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472107; x=1755076907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCmcTtEoqltT4XvF6RcXsfvI9GESa+FLu3cPaY+Dekg=;
        b=ixC2ZU6v0WQX6LAUaysTCu4VS98/wvjFUSZGjhmMXZD1sTja6OzFhbcruMTpQC04eW
         LDJd8AW6sfDsPlbZSSaURzGRy/5/TnPT1PH990bly3yasWWRCpbFda2g03E0uwAu6+Im
         /ynKIAYKGP5JtCs/Ix7QjutZevdg6R9vSIc0EX1udGLkJ+gciqjXFPLlsZr2UrHnXZtm
         EBHiz8quhrhca4rFrRQ0iaDL2O3dgV0vDmAR5OOk9Y7xEiOEgfk5AXzRC90DDxbIKFX9
         NfBlDCG/fS1RfLVd3wPKK7Mv2yxoxSosYx4WbtI+Sq8kyG5vH1997L8ClmWyBDGtRq4H
         s3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472107; x=1755076907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCmcTtEoqltT4XvF6RcXsfvI9GESa+FLu3cPaY+Dekg=;
        b=L5OfX0wd2eBxF8yOlOeSaA+8Y+rBI7lA40TYIX/o8fmH5KEm5MFJBAxlmKxxCXczgt
         raXfZBEWKgUA/vRcnfwuX1H2hJp2EkXuGE0z+vKnslapV7aJ+QGU+UwMT1OxJaNWxyiZ
         fX32kNb77otfllbSnoiqa/q3Ayu9z51tA6MCQI+ch8tTYfog9WySZAI5XIOUu9ege+ig
         iRg974t1MxYzHXaCNjrzmhNZ77HFNm6l0/CJE2X9noHp3D2dDk8uC0VFhfClbcSgTrJy
         6mjVrWhGz48lfwUZ6OQJcrc+dQ+UqDrw7LsP9GI6aq1UHImSMXB1wHBJOdbaPd3UMX/t
         LJoA==
X-Forwarded-Encrypted: i=1; AJvYcCUEfpY6Zcc05blrqo6DiIOhz1PVjUaqIbgtxeHu8AkV0wCcXgIEH+mJlg95X4F7aMLokJ+xxj6CRdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtoZuvFOcCbr6G3nVlsj+zoCCqGxi+v14KF2ozcRmcTcMMlPOb
	oY7zDDgmCEvjZFlqV+EJnxd+TNg9PyasFwTOZ/xHVYEkLWgOGNKJDAb5BTRBpvPg/nU=
X-Gm-Gg: ASbGnctzvLusukLKo2UBefelZdqxWjQMDUnzpO2sGjXTCt14J8WWLTHulW38L60n0O0
	2m8JkmFNzKEyLUtEFJQI0bI4bBYG3kHP8uBtTF4vIU86fW7FZwPAlXEGhrmorhqf8klwTFwurpe
	1vAoAtwieiymXrZrG25uWFn4jTTURYtUjGcS4pwhzWuuRGou16uGvsqo7pgKe3r8h1FwxQSQqYe
	4qhGsXV0HBzF/urwf+21EtawakFfAuJ3RWKNT/u36FGys9ALoMJHl0Rdl+ErC2qNZm56Kc7Isg4
	gIiwsMJmCwPsNs4ZabvNaqOFwl1DfxtQFcgprW+znQ1IB3+U4s4x9h+FkSVkEhrHVttS71DQ3pk
	yH26rxI7r/i92jK+rK4IQAEIyeMBGti0qMRow8g6FFOKIdKGcO7lu
X-Google-Smtp-Source: AGHT+IEHNDD/VeZixPPF3+j4rzuPukE1duE4HTtuQxdZ2VnScB3EPBLRyNq5U40z9paD78Zr0FtZeA==
X-Received: by 2002:a05:6000:1445:b0:3b4:990a:a0d6 with SMTP id ffacd0b85a97d-3b8f48e9118mr1269308f8f.19.1754472107499;
        Wed, 06 Aug 2025 02:21:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/4] clk: renesas: Add MSTOP support for RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
Date: Wed,  6 Aug 2025 12:21:25 +0300
Message-ID: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds MSTOP support for the RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
SoCs.

Along with it:
- a fix for RZ/G3S MSTOP was included
- a cleanup for RZ/G2{L, LC, UL}, RZ/V2L was included
  (patch "clk: renesas: r9a07g04[34]: Use tabs instead of spaces")

Thank you,
Claudiu Beznea

Changes in v2:
- dropped "clk: renesas: r9a08g045-cpg: Add MSTOP for coupled clocks as
  well" from v1 as it was already applied
- added "clk: renesas: r9a08g045: Add MSTOP for GPIO" as result of review
  process
- added "clk: renesas: r9a07g04[34]: Use tabs instead of spaces"
- added MSTOP for GPIO in RZ/G2{L, UL}

Claudiu Beznea (4):
  clk: renesas: r9a08g045: Add MSTOP for GPIO
  clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
  clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
  clk: renesas: r9a07g04[34]: Use tabs instead of spaces

 drivers/clk/renesas/r9a07g043-cpg.c | 140 ++++++++++++------------
 drivers/clk/renesas/r9a07g044-cpg.c | 162 ++++++++++++++--------------
 drivers/clk/renesas/r9a08g045-cpg.c |   3 +-
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 4 files changed, 154 insertions(+), 152 deletions(-)

-- 
2.43.0

