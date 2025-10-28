Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09675346E63
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670310; cv=none; b=O7CTnNy8KzS1Ne10X8aUobLGzpmXPV/qJMsInDepP1syv8XjeWz2b7jL5d0CtVgcTok5Src+7t+/MmNhZoDgcKWEFMRlOWBOjQqaE2aONJSmqbz9jXsZ5jMHNhmoajna66H/3WCfzw6e4PmWm46QHpi23Sk6pOwJKkGKZXY4CuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670310; c=relaxed/simple;
	bh=SaHXQvdh2UGDjNMvQuSgMOQm+hQXIPvqzOzIWG/Ij6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/Tpos8yPmvK0OYSihnbJZwnvnrAPCy7ulNf5mKV8R1EFe5dfDflUTSSRw0i25Dw1nfmVkDQKk3QB+wEjZl/HUMVvPSrv2wshKHHyT2h0GoHxe/twYFuJqDgiK0xLYkc2lBw2dkEBZfXy+IanEZvF8uoX0Snk3H3Mp1+NtVnfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erq408jN; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erq408jN"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6cfffbb1e3so4528340a12.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670306; x=1762275106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TW6r50dwFdVWTwN56Kmq0E/zepcTiRFAnQQGIUFFOlY=;
        b=erq408jNv16Q9doD68JdqRULGj1p/PJAq6kgs+7DNFb/2HUz2sy0LnfyRRv0P0bm3k
         dxYHRY+k+mueEy65NNEvsEMIWODJrFQ6b6CPZtrIybITzscqMoy0FJSJp7xmokmHqCHq
         XIsEwlbIobxNqZcfLPzQfcq5CQRyryaklmK12QD/aN6Kt4gOvnRHOmIRH7mg6JYSZ0gy
         QmR9KO1idaWteW1zdAPBG4aEQ2PmT7uLRbFNs9E4wguhPkNtmvzhnOgnEJGBSxywkTQa
         g+O3DIw8fIzrU3ablHN5pRcqsJ3g1AHg6BHnS73OmoShJKatRvhd+8EdSaKolqyDewk9
         MzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670306; x=1762275106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW6r50dwFdVWTwN56Kmq0E/zepcTiRFAnQQGIUFFOlY=;
        b=wEWGJgPvLDT/204+82OMcZ0txxrQuCg7mcTTSlKUAsmevD/kxO4Exli1sWKAORNxFn
         Ll83COarHtVW0QWzWEh8tX+QnDCNfWE+AJoJ9+8FZz/8LlDZAZkfPPIKvvnK4kP9hpUO
         ifd3OvOLkKf5ZTfATvLOypSYCle7lXidRMyxUUoTh7ZBRNLyuGNb6qbjUkX9uGgUqHb7
         aHHmPBNLr9g9QvcygyfVSD3Qn7TidjKpZ3lfR3dFQEKTrlSu91TrbMT//IH/KLzhiQCx
         LJWf+lYbB+ZmbnT+C6uOlimXi7KLeeMPQHSl88bW4MTHCkSGG5E1ucpPdx4ItOop0MmA
         fDyw==
X-Forwarded-Encrypted: i=1; AJvYcCX/qrGKQUXbbF6xeiTD0sqv7ymSzgeT4CdKMXKf3Oh6JsJ0vEevF7Q96TGHjP+gzrcjQZcOfiwksKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUsdYjXmXxxPqzabKval7jPoBhMoBKKjqTW/WOoU1r6mN6PfJ
	XJV+RleNnZyEa2jqLScMhu80ItqWKyrJ0HDjK094Sl8Ac0wYQosdfDBZ
X-Gm-Gg: ASbGncvWfp0zE0qGR+j/WUhW6g5wEshvJeZOsWxNh2o2xwZLNDyYnpRL8BOMFxrT8Oc
	/AlwlXLl8+b0F0pU91/IyiAbXGOxQIT0/1TrahBAZwVFnrE1ApKM7weIeFo5VhIapJz7VfIASPB
	DeaZ9Xav6dT1Wu2xr0YpEOE4fuim12DLggZH2Ia0D7q/5RWPFG8U/h8YPjPRul42kjqNH0iLeKL
	+aW1djZ5tu26eLZw0DoLlZPfJewu18w8Zsqa9C3lgNg9lRB2iLrlev52IroZIozZQsX5iwx/0Qq
	sfwk3ZHB04+9DtCkw0Yw1QToiq7ujSw9eZuViyzdbowPr4121r81DuNFrM8Bl4SPFGsx7sB57SC
	5wecHFotTzUth2cK9EyhuTuXGoO2qjDc5pBBBsl+8iMAFHhKCrlrTQf70aR6wePboI62lqJnIOe
	9mUfqJUsrCeky/bbVYSfwgTA==
X-Google-Smtp-Source: AGHT+IFa+t0T9JhACfecPKraiGSJrNfChEEfsYiWyHTAHA4vmk2NppgRgurHVrK/RhTfdJWkTbdROw==
X-Received: by 2002:a17:902:e5cc:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-294cb6916bemr53051615ad.52.1761670306208;
        Tue, 28 Oct 2025 09:51:46 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:51:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add XSPI clocks and improve divider clock handling for R9A09G077 SoC
Date: Tue, 28 Oct 2025 16:51:22 +0000
Message-ID: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series introduces support for the XSPI core and module clocks
in the Renesas R9A09G077 SoC. It also enhances the existing divider clock
registration process by utilizing device-managed helper functions and
ensuring proper propagation of rate changes to parent clocks.
Additionally, it adds necessary clock definitions for XSPI0/1 to the
device tree bindings for both R9A09G077 and R9A09G087 SoCs.

v1->v2 changes:
- In the fifth patch, added a custom divider clock type for XSPI clocks
  to enforce hardware constraints on supported operating rates.
- In the fourth patch, added Acked-by and Reviewed-by tags.
- Added three new patches 1-3.

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: r9a09g077: Propagate rate changes to parent clocks
  clk: renesas: r9a09g077: Remove stray blank line
  clk: renesas: r9a09g077: Use devm_ helpers for divider clock
    registration
  dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
  clk: renesas: r9a09g077: Add xSPI core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c           | 186 ++++++++++++++++--
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   2 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   2 +
 3 files changed, 174 insertions(+), 16 deletions(-)

-- 
2.43.0

