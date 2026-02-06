Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DD3A0B36
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377418; cv=none; b=PRxgva9wsq5tNCx44VZzdbIQlLTcOrpl22Fw8mGwVXB1WK/4NyL9Qha8F5Mjeg7MyIk4kbOrvHXlW63UTNdqGh6cvO8zt7qkrLEeoohd6laZg+BAdyru4MOxEYPoxGhjWMQPlM4GUnvgSb/ZMI32lmsLC3/XRQN78/1rBiPKKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377418; c=relaxed/simple;
	bh=R7DUQAuvYhTSo94YH20cF6tnTtvfZT6izsSg22thJ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E8nwcP454BYZm8sVaPRjB7DTvVbQR4eqGV3jHZ1nxyEYQE7e05UN6UYE2JptrAmK9mORbAYMFXNsBlFSrQHpnaHRUTR98IOtzwcJafayqdrvwDy7Kgsetgp5pKSSaPSidjv+4wr+yjst5gtkeFpDwX4UeMpy/E1Sdnzrv71sg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I04/5I+E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I04/5I+E"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so19286085e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377416; x=1770982216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sotv5YDzx4AxonykCWo6bLZEaSi1omaZJtDitN3zGPQ=;
        b=I04/5I+EJzA9NK0ZcllVbiKlB2gSLEW/K3BJITJPm/FnZCAzVvkAUtQWJHMmH0TL5D
         2iaH3gGK56uIpUoIG/WilnhkI+3TjIbR7X0JMzwHkRID9zNS1P9wlHsUYi/yhyMwJ/+o
         rpE2dphSg8KxvcNuVGcAQD7kY5XX2oGI9bwinsuHUA2YGAC04NYRjQTWiG5by0NxQ1Zl
         HB42b9HQsenplvRT8BF6dxnquRO88/orTys907eeQjgY0Anljwh/Y7P9lc8+MR3y7Byy
         hlP18BrLErv4SSINvRE7E2u0jW4jv3A54RyD0lh1oAQa4MXSiseR5tkJ4si42TMnMme8
         4xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377416; x=1770982216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sotv5YDzx4AxonykCWo6bLZEaSi1omaZJtDitN3zGPQ=;
        b=n94MFTadxhChi0QCYntbT0iqj0MypFJqC3l4nEpRDYiV5iiVWydopJn08ip8teYxFR
         0DO3/8t4N7wbVuGiCWqTCQiGHXTXFUvJhlznpiLuT56G6USjIHlhVKR8DKM2SOv2O/r1
         XaZZF9FTBfpgPTMV/2bS2KH0AEXbXbmDCsAgYsdHUP6RAP7CnZWJMskhqlDJQIorcHZx
         uF0F/E+BI3lpQTshNr39v0oJE2qtalMHgiaK+tm0XKJPuwdT+34sbJNGu0Sop2nXVURp
         tTRQ76nkiHFcFcfpP+A5bUP/tO733g7E3na+BSHnUEBeidn81V2i+maFr+FiHbDIXt7b
         Y6iA==
X-Forwarded-Encrypted: i=1; AJvYcCXtb9qGZzqzfFDST3kBG2+gGsXvnJ5tPafiN5JcGZPR38IfPUbo31YyfGeGKtQDpSxKCXnMRrKrDTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwyiUMc70qG57BqRAvBg0D8JSs9nww1rxHCEEw1yir5mP328qw
	hx1uDHK1tJYJQvw/HUKIZ8q8/yEKx/csRksj2yGOXyvzt1ZBrpE1Sleq
X-Gm-Gg: AZuq6aJXZg4w1iwbS8XsjV0q+05v0rZM9qrI1IjU55n6jQ6Bmqdy6eMpLI6onMwMihb
	wkXVbO5cu4sh/GhLQM8XDbqgz279tsiYJ1pwONhDdFr4lUlKRpwKA+I5wwyoP/TeVrKYw3tuhHr
	/mg955usEuwNRJgx74kA6XfOPXpY94QEEeNqpw3yQYWhc8y6Mo73YiJH5Qixe7KfV3LoGJ36M5p
	8IyE1enGn7P6lT6SEA8Rr+mBajA20MDsHG2j8wFmmiHdkWfAywJ7VhWmF5Srvczu+t7AYp5XXuI
	ioOpSGzBMRACDUYPRqb4kMstArsEXU3VgpqYDcZr+DOR/soAp8rML3GeVCU8OLodjPQYghsScmg
	A15vmuS7dzsW58OGwsKv8yhJ3izXnDJ3lm0hBZrZ/jy4xAy0+Xdm3ZwbM4S9vG7nW3Ri2ezOjPo
	t/czi2bv/nKp3ZIb1UOQ==
X-Received: by 2002:a05:600c:6986:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483203ab641mr33367465e9.6.1770377416468;
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Add support for Renesas RZ/G3L WDT0/CA55 core clocks
Date: Fri,  6 Feb 2026 11:30:06 +0000
Message-ID: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L  WDT0/CA55 core clocks and reset signals.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20260203131048.421708-4-biju.das.jz@bp.renesas.com/

Biju Das (2):
  clk: renesas: r9a08g046: Add CA55 core clocks
  clk: renesas: r9a08g046: Add WDT clocks/reset

 drivers/clk/renesas/r9a08g046-cpg.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.43.0

