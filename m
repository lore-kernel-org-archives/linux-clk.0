Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB433D3D18
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877035; cv=none; b=TD0PXItCFVWY0JQ5X678kR8hAa/VD4y6F1XqypuhHzPgcOX5D9u+8Ad5CjsHRbmJsIJhPB7um2GZLOMUdyqTdSEHjEoumTcMD39lw6Ej63qchcxoilmd6wk+5hEFQ4slDnyuTJPt8pODJT2ks7haRqAc5IzpdAwlkAo+g1oW23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877035; c=relaxed/simple;
	bh=/vArxv8Iu1hIiC0JFEUFIvov3OvtxfueqgaiTFlSbWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knh1HEDsmjqhRqfdhle0S115Ihuj7X2q9lkP2uS+FEQTMhQUfEZde23xPH0zmPmgNi9XID20h28liAiwjGEBAyCrQiGxQD9Gww6ksmRfywWyN+MNfr/+63lE7xHwhsGLBvlHJaxZHlbz7x3nhq2WVBj9JS5uceCnJYUGskXr5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2eHvAuY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2eHvAuY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so790311f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877032; x=1775481832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2V6slcMaf2PvdRJBKeuviXzRYISWoLZtYB3+x33gQ8=;
        b=R2eHvAuYcmBU5U4UOeKl2alfww9smTc9xp+jtcarD/ToXz9ReefSo2rOSlVev9tTbS
         qFasKLzPakCQcoxeqYH5EUs93TkxIzl7WaISxORN1EfQpALwegPPk07MCuv0Uo9An+6Z
         iEbyZupiL2TQUHk3WuF1dKsyO+eyMQ+9mYfk5GvYztcdo9qJvgG8mrD2D1Y/hJf8PkbK
         A5xF/64ZcUZUP/7fPVXyEkwV2sURvd0eipWEgxsdAAssZfjnIUVwgw9dy6pBYorVCGLk
         S6DanqJiWCceE8+1FK2Lwq3lWHZqeALLB8yT7E4W6CEMjFkxBMXrSJAQJeyfQGEpv0Ca
         Rxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877032; x=1775481832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2V6slcMaf2PvdRJBKeuviXzRYISWoLZtYB3+x33gQ8=;
        b=dRVRM7G4V9LL3jXX7ISj3dPveNsJ+fOUHvZLLB8tu4UfpPdXKx55r9Lk1J3EOcxOXQ
         HEmiO5lVyfRExZahMo8ikTiC40KUKR5io9UYR9/NnqmqnPJ5HX571UqsdivVq/rl5JdC
         06VKha12zZ9TTSuPN6WFbRaXeqM6rxVKrQwTvRBmWG/Kb0OuZEvVAFqmXIgxrKJ+O+Yo
         Hp0i2U/fbGHsbggCVATBVX8Zk1tgJOCBcP+2pG3tln0RRHr1Wksye2slZ09lzFNlmCdn
         iPHvIAqdLfZEhuYTvtG9+gGv7ckbWwxBKTRxBvR+/1A9WxlyrjKRLj0pb8nSbJABlFpW
         3Mvw==
X-Forwarded-Encrypted: i=1; AJvYcCU+fBoj23dhzrmT15Sq9YQ+8otbsLd9Z8EvckX39BofDNjkhVkOAR2I1a/ale8tnFNMDQg11l/uHDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtLlMJMGRwl4Vu1V12LrRkm4zLNaWFypmFwZOjygpzSUWyIvN
	4cctmOTjUK3tTeHNkVUquvT2QYz9J3eqKFsiFdGJp5NJYXszLlTcS4GH
X-Gm-Gg: ATEYQzyOWYXm4kQFbcwyPaTDNfen12637aeOwkLcxVvy93QqtCGZZv8rxFdKPFhKAFZ
	CIMoYoQ6hdI0kSgLem0eC3Wt02xl6gytQqhR4V5UIEKMI/Y1eE8LcJlROq548JtSPx+fYdjUrAT
	UMm9Ku7dVuAYdSvuD6SSteMYzjEsZb2iSadxablM0zlQNHxT/h4vxuYLnbkdFxujnOyx/P9LuyY
	0k97P5qdbYzAOlo44j0qo66cmX4UFb7lofVCcD3PWeHg37z+qb652RkS96SZEe8MyR83TINEzJU
	3CI+iptLklSx/MaKqdmxlLnsJTNoiXuLqtRuw4ZBWAlbIPzhihHJgmLvauyJ+S8MybsJZOeHINY
	inRAy/SQUfYwHVVCeLCPKSfqE5uRGpSSd6z7LfSdQ5y3+Lt2wfFdYXRfQgde14H0K6GBBvOwXlw
	DD1WuV7ksjYJ1vSZTgsBTb9tRnHVqb/A==
X-Received: by 2002:a05:6000:290b:b0:43c:f976:b8de with SMTP id ffacd0b85a97d-43cf976b9famr9542201f8f.20.1774877031672;
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
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
Subject: [PATCH 0/5] clk: renesas: r9a08g046: Add {GPIO,CA55,WDT,SCIF,I2C} clk/resets
Date: Mon, 30 Mar 2026 14:23:37 +0100
Message-ID: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series adds support for {GPIO,CA55,WDT,SCIF,I2C} clk/resets for
RZ/G3L SoC.

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20260326110648.29389-1-biju.das.jz@bp.renesas.com/

Biju Das (5):
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  clk: renesas: r9a08g046: Add CA55 core clocks
  clk: renesas: r9a08g046: Add WDT clocks/reset
  clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
  clk: renesas: r9a08g046: Add I2C clocks/reset

 drivers/clk/renesas/r9a08g046-cpg.c | 69 +++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

-- 
2.43.0

