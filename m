Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442B338580
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108874; cv=none; b=serrMfaNXnEdllHT2/TROD3pnzssgVrFJWxOuqGzho5rNJ8+FdqeiCAxu7DfeF3GmNamZ8Q8PqEMHwnHAmByewzyu/YtbLCTesACsWWCdjohDUZP5Es4wvJlCgvSCKCXNFp8sDjnJaZrFvk46kLQHSrHZ1SnG3MsKhwXyGQoWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108874; c=relaxed/simple;
	bh=7B/N8bYheZgEcqaN3WzGWxcHN31o1dyEHVMnE2HR5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdOfad5mnwOKioDdd1+PDDN3XkATM0HQLOq7lTUezuoerQ8n/5ZNzZTGYUEZ8zBuJlCAeLefMBaC4MGqSNlhxep/JBQkEc+iK42+sMYjCqal96SNNL/mnETDuip11DRk3Fgdps14dZAJ+wYd1nkinWBETUhlJSt3Bv6hhWOc6VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKbkQmUl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKbkQmUl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b31507ed8so5110259f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 14:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108871; x=1764713671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vuLDx1Ef/SmnelhDw8gm89IOy6br0fzUT6W8Zs9bgCc=;
        b=jKbkQmUl2DAK/hT8OOiaAQuKWrZukJoamYT9jUvuJBt0PKghnoKvw6PkLe+KogbJT+
         XbsvJfjZ1XkNK5QVn49QvdqD3euWsAOgamJpAz2gmNUZOe8ZzYdMP8lPFI6jA0kahTTe
         XnVXQBRj2OvvRKF+8V9+l2zJzmDNRhBHo7RO2SpE0KLajuJQEna5SPBXJQhuEMODL7fi
         tFkaO06xnznAAfzqL4ax15dMYnQvFzmzBabzLtowiJAuJcGbu80S/gsqsnDWlfuaAG5W
         tecS1oXwbd31cvkUwbzrs4T8PZPavRZkhWO/iArkldmYJgC24jT8fVZelGan+8rE20Rh
         s0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108871; x=1764713671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuLDx1Ef/SmnelhDw8gm89IOy6br0fzUT6W8Zs9bgCc=;
        b=f5Ep6CCh/aLktINW4ePZDPCbUsxfPN/imM6KrurY+NCUKBC3k2we66Iw6X9VcqbPLb
         bUashqUea4QUQcGgjc+yS9up01HF/YCIEr+oNkMi0m05BmDxmp7HVI28WXZbLkFIVf9A
         1iBnsnWA08tWxSB7EyDZVGei4ouKqYoMS44e0utL1XSoPT89ITCrp323e8B7LOeZPXF9
         BqN23DzwYrvAP5N1z+gxD9EuStwvEYaq+jI/jILKMFcbp43k9kIriUGOaAd6UZvNs42m
         BX2XCYn0aMrUAtSwAxIrvYFedsansQt7x0S7Wk3XGPfbKkejIi738AvnUNfhSdGnHbYf
         Temg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2QzJB/1D13aQUuC0wEOyeitOf83paKf4DzFkvsT2q4JyRlJLS1aLn0iCfeOfSpk7QXsp1EaUDDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0b73IfxBfDtRQxPGOP3stuOmRK6x8bu4qQKocYSGcLN45HO9A
	+LwnErDfTg8tIPZecEPQwxClhmlCj5NCQOZA7s92vpaT6Wh2YRPOfUVX
X-Gm-Gg: ASbGncviS69oatmKd7AUxe/osxJdShlXpB4eu2gorMObWW1Wk5X86oIRCYOX6laPMhe
	qujtU+OFqN7eK8Je2F0gcBZuQoQvQ9pI3LYDR7llIfzijxmR37iThmS4SvwceMOrfOInVis1vPH
	REsZSm/7qdxUrwoAxpuA1EFi/rJFGFmZuK/HSrvdX8UoFGmJ+hC6MaHAEmFXx8aBYstzQJKG/+a
	Xf57BS8mccdacttAMHW6Wc6MtNbgVUUXcGVStOnwmol6N4WxiS0CsEj2yOQ8NuLj0sVJcOmCmBY
	49KmLcEmJ7ir36s7xwbcpj5FN1IWMYnvIBvmmo/PaaOXMJZQE1O2BCyhqSoEF9aPNQFffZBmMYr
	5bSBBiL6o/YoSY2xuusrBa+Kz/mmLMWQnstYlre5Aqh4E1zXsAln5vr+blMa+SQZRdRwwgyTsru
	WW7whkbzQmE0ZJ5Ru5Bk1VWD4RI85wPjWrqw==
X-Google-Smtp-Source: AGHT+IEIb48nV7hEk8FbIF05Ym5OcIu5+err3J+K604V2E7LX577SRyHTwpd/29eVhfrTZO412DHoQ==
X-Received: by 2002:a05:6000:2f85:b0:42b:300f:7d8d with SMTP id ffacd0b85a97d-42e0f34a13cmr4464007f8f.34.1764108870940;
        Tue, 25 Nov 2025 14:14:30 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:30 -0800 (PST)
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
Subject: [PATCH 0/3] clk: renesas: r9a09g056: Add clock and reset entries for DMACs, ICU and RSPIs
Date: Tue, 25 Nov 2025 22:14:17 +0000
Message-ID: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of three patches adds clock and reset entries for the DMACs,
ICU and RSPIs IP blocks for the Renesas RZ/V2N SoC.

Cheers,
Prabhakar

Lad Prabhakar (3):
  clk: renesas: r9a09g056: Add entries for the DMACs
  clk: renesas: r9a09g056: Add entries for ICU
  clk: renesas: r9a09g056: Add entries for the RSPIs

 drivers/clk/renesas/r9a09g056-cpg.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.52.0

