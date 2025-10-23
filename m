Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B4254876
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253667; cv=none; b=muXe97YwRCXU/JJN4+4S4VUCAZ2mphm48unRohQVZPeEGrOjaYzBGq7cS5iOK5izfULtg2gSIOi30lutE9OwxUn4okiY92eHwcRbh8Fj33FGIryQRqxuqaLOdOCLec8a+uQ7oW9HABSg8oIswD4Ls75luE5eP20MzHvZvlwZFRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253667; c=relaxed/simple;
	bh=QswsVxb7CR7KAytVqgYUW39GsQhUVHWw83KELUyhChI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kr/L+VOs96OnhymAIRF3I3Lh3h48wbjp1hiozgaENm62xiGgrURKllERqxnY+yajEmZzeaBFKOXWvtKMmfeZ6m1q2xA6tVOicGhp3rghE03zfI/t3awYiViL/ep35hPrFoRcKrI4/nTO0VsiewZdnh9iUvSMiqwksTjtFNmWKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LptrfI3D; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LptrfI3D"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7835321bc98so1147975b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253665; x=1761858465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pRCHPQhpenSm0p43Ve07VuUVPD9MPencJKGnmFr85ho=;
        b=LptrfI3DJU2B9m/LWQwUB+RcOK07enwCBBdMk2Hmp/mDNmqVjVtc506VcONj4QtO48
         EjkSWMDlZpGmYT8Kt6iuW3f2548qLzwCq4+ErdGtIo0VtLs2SFJAgJr3zbt+coROAGRv
         rFKhjyRUN145dytkMeoZuXJiV1DRCuKOfuYfUCelL09Wx+m8Zb4wb43zTIL2wGACcArm
         yCth4DVUWmDZJ9vwPYmgrtnybHJNSJtXjigi2L2jzUdLQU0jroM/Rgx1EVEdPNlrO3WB
         6eoAmqCw6Prdp8f3pt00yZV96rAtgVtm+9tBavdpqywM46YvuGZ0F8ycspIHWId3a+13
         +Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253665; x=1761858465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRCHPQhpenSm0p43Ve07VuUVPD9MPencJKGnmFr85ho=;
        b=xSI7TcaotR/Zbx2GThDrDQZfIVAIwuUMIYR0UkmmbaEJvJeKEXPr4bUSa+AJsUviFW
         mYXCkfG5s8GOLcSBAal3X0hQjyw4YPk9WyoQbO2wf0XkykKaKmU4V9ZEkKAgdFk//dhQ
         JBa1+M1HeCBQ3Y5ug4fiCx80afY+KBm6E3BOtD/McG9lg+0P0wDov0v02n1MHqO7Nrxd
         XJT4kDV9SMj0cQ9KMcQ/UdjVjA9Q3Aa9CbNmtFrYgXOy7gLpQSL5KlIeLsG51CQ5H63T
         YoDgj+fqldSfd7KZDv7lpLOtwwcTCOttpURGj0Ey/i/C43OZYoVnJc6rjYeTva2L9ktl
         M4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXsMID6A8kAnbvpn/znV5iCzbF5r6DfdHaFZwmLiAvaTrn2LrvUHohvz0aCwBOFprBbLUjxMd6Qdi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJQeOVEaQNWXz6cWwlK4P5eZW7FDMqQrLe/Vs4StgkQQCJ13G
	suhAKa7fW/8+bRt0jEv8tXm9wgGVMzX2WInu4d7htPSL7YxTfwQpWDDq
X-Gm-Gg: ASbGnctQCah+ODjKdvJoJTd0a5ZjB91C28tZBAJ8XjlkgDOfYMo0SSoQoI0zLmGyg/T
	hy6w3FZbrbcEwUVG0A3bYZeTvXvX0SYHqc7HfJLEl8drVLM8A+CpjdkwELHH18DmZKgjUriWwqO
	8i/g1tQOmMuOIFEAz1gnNJwiLF/xbviUWHO8ZeqEvmrayEpW+0cCjjsl1LHHYnaflgC3RIOcnMG
	1ZtxzrLVyQHVHwjy0U69guhnGrH4RT3ZPRslpgckWNppmGLfGaJHFj7pkBsvG9gjLtXAMTDLPCC
	Q5IGdjMo3XponqtDFwWPhw70u2XF7WqATtk7flfMcunliPewFpUCghMuzAVzcBCXZXflbjAHboL
	w8YLx6E4ikoVnpuJ1zZrUtQZ8yD0klWpyYZJy03JhJTI93EHdDbSMZMLdw+L0aZxADCbeX6Z/y/
	DXcFQr6YUrzwdjtr6knwN9ZwbqRsVmS/TQqZtt/mXw
X-Google-Smtp-Source: AGHT+IEC9IGbZpflD7H2AaKcdyAZ4qswSf16TABaK+UleDIIM56YdcbNkdDFASJD7aYBk8i1wn3Wnw==
X-Received: by 2002:a05:6a00:a15:b0:7a2:7964:64c0 with SMTP id d2e1a72fcca58-7a27964678amr4134281b3a.12.1761253664951;
        Thu, 23 Oct 2025 14:07:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:43 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: renesas: r9a09g056: Add DSI, CRU, ISP clock and reset support
Date: Thu, 23 Oct 2025 22:07:21 +0100
Message-ID: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds clock and reset support for the DSI, LCDC, PLLVDO,
CRU clocks, and ISP modules in the Renesas R9A09G056 SoC

Note, patch 1/3 is dependent on series [0].
[0] https://lore.kernel.org/all/20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC
    modules
  clk: renesas: r9a09g056: Add support for PLLVDO, CRU clocks, and
    resets
  clk: renesas: r9a09g056: Add clock and reset entries for ISP

 drivers/clk/renesas/r9a09g056-cpg.c | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

-- 
2.43.0

