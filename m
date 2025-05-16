Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600E22D7A7
	for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383385; cv=none; b=nm5+qTovsjqhe+v/bI2zRcoh3tTjBdlyD9yjBV6IpvQTRrDKRo9pAY4YsydPber6YMfFLVECP2+cBRSeEOt0XHJJBkcfmmb1Bt9xnXPSA4HRpXemKGyiXsRJ6pUfYlgJoZz/Kv4vcQTZB/NdAokC+sDrdHRJtXBL56S64bn6BQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383385; c=relaxed/simple;
	bh=3oAqLdpofioLRO+ZMd7laToxcoplseFefLVEcL35UuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fWhNqQ6m8PXvDLJ1uShjx2AzL+naimtZCrLBawxkJpm5ek9kOhUUNAdPC7kPthLEwhQcbUh8bWCMhOirfBmocf3we9THSxtUMucNGTmfSpdgymXxkaqD+vlMh8LMejGH8KhU5neA0G9RGljGEUHCNqyEWBjpvpO7GlRjtcS6STc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ACFtu+XM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ACFtu+XM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso2001499b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747383380; x=1747988180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3A/y9lV44RNMvt/SwD6LadHVjF3D4qz0TtE5xp4LxU=;
        b=ACFtu+XMTgLH75rcSsUjn/stiki7wSCGzxcXYDijZTG1ICwFfggKJrF/jKaiosbUXc
         9Psw35dYAFdi7J/S3s+5QhEeF14bSDE4R7wWYERIGkn658v+50FifSXFiKpiCBRmRbdg
         eZHVv9C+LMw/G7NtpPCj02ts+SVS85fd6hSMJCTyaLiEr6ZPT+G0Xtyv9CTDAElr+GUi
         3KBWZJbSoCJzossvPvU2kntrR5HHEnbrZoNDaMqhD5Iuo3o7hSajDv+Y0eXBIPoc3rvz
         7IBi9F2ZQrNmCBF+WgFV//lVBRkxr3qpL42AG1U/kzakITmoLxIF+pCPAUJj88jPGJNI
         eksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383380; x=1747988180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3A/y9lV44RNMvt/SwD6LadHVjF3D4qz0TtE5xp4LxU=;
        b=Sitxwzw+X/p9EqqHxKu1WIyZF66WjJ7JcLdVh5T42tRTAJKURcC7DP46ohLKezhP3T
         F7s6MKU+8tWhoF44LR4w8srNPgypb9Fz2WYCnPc7ThW9FmJaKZilNpF7lP5ZjlS1Q4ub
         I/+Z4VudOZhr47Qrd4+H0KST1Pndbnd8YG00MxTb1gyfpRRP4FbB/KEhG30omB/XLgtz
         qxTpF5jeaqq3IxH1S7lFEW5EEK6cuSLCOyvWEwaHciAd9GYSNzu3vUqRd7X4iXhF3q7q
         Z8h0BeboNoeA4bVnXSpW2SqEZTXKEzfnYM53AcTS1ZudrBxJXrXe0Q9yABwxDH05Dy2K
         aLkA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6YxLcbt6C/uCwlWpmTCMa+pgy729GfajiQGBM2qpbDWDjw3Rm3CHg10HvoTwy8HY5jWlzerBJ/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqmodXoVM/B+fdZh/cM2KDD19N7VGg/dQLPk0Xc0iGHIqo476
	ZNaRi8pTj9/Bewmy4cOettJBE6HBMZijFCMbxtmJ2WGsMA0vLNBUPmIC9cAFipHkNNE=
X-Gm-Gg: ASbGncuIQcKfHfUsUpgZWQazFx/gdxmdGbqBAiLzF7pWurkjqIXAFZEd7TB9UwBtUkB
	911qCFLok8aqZTP5mmO9wdw1JTCFeUxyHP0vBnETFNfghcfSr6LWOFFepEpficJZ/OU3WHR2bLp
	w3V+LERsCcF9SxoOfsmcjigdWIV2lrKkFf0pFXjwz5yb/6iEtDn865+3PGpgviN/NyuMBX56o07
	K14NQGQyO2pApOI81mjJ8SjGrVplhQxC0+9TT33GGjN4m4W+zJtVosnugvq0znadVxwbYFvvlWI
	pXaQHgzvikEwwk135KhpPbeTJzHiX3nLCRAGuqlns/xkR6l6EvRdABE6RE/bJQtl9EeSg1+RYQl
	vwkJOSpjg56TL+Q==
X-Google-Smtp-Source: AGHT+IHQ2bTz8PCbIjboyHNgGlHzWE2OMhXaYM5Uf+vtwwDeH0Y+c6c2ytTxnCqAGRGryuYKc8knUw==
X-Received: by 2002:a17:903:234f:b0:223:47d9:1964 with SMTP id d9443c01a7336-231d459a55dmr31119835ad.34.1747383380431;
        Fri, 16 May 2025 01:16:20 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm9397695ad.133.2025.05.16.01.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:19 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] dt-bindings: clock: ti: convert to yaml
Date: Fri, 16 May 2025 01:16:09 -0700
Message-Id: <20250516081612.767559-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert TI autoidle and fixed-factor-clock bindings to yaml. We are fixing
binding warnings only. No change in the existing dts.

Changes in v2:
	Patch 1:
	- Dropped reg and example.
	- Updated description
	- Fixed the subject
	- Fixed line re-wrap.

	Dropped clockdomain.yaml(patch 2 in v1). This will be taken
	  with prcm.txt binding conversion.

	Patch 2:
	- Fixed ti,autoidle.yaml reference.
	- Added constraints.
	- Dropped description from clocks and clock-output-names.

	Patch 3:
	- Restored the license.

Link to v1:
	https://lore.kernel.org/lkml/20250404014500.2789830-1-sbellary@baylibre.com/

Sukrut Bellary (3):
  dt-bindings: clock: ti: Convert autoidle binding to yaml
  dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
  dt-bindings: clock: ti: add ti,autoidle.yaml reference

 .../devicetree/bindings/clock/ti/autoidle.txt | 37 ---------
 .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
 .../bindings/clock/ti/ti,autoidle.yaml        | 34 +++++++++
 .../bindings/clock/ti/ti,divider-clock.yaml   | 22 +-----
 .../clock/ti/ti,fixed-factor-clock.yaml       | 76 +++++++++++++++++++
 5 files changed, 114 insertions(+), 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml

-- 
2.34.1

