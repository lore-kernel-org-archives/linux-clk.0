Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437021F9F7A;
	Mon, 13 Jan 2025 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809860; cv=none; b=pihVAIKfoizvyCI16IvervrwHiX1yuk5ax19Be/E6It8sAVf8agx0jEXFq1w7MzE+404E8BryI9VzUqDFV1hSAHxECATJoxYfe+jSgAybiwrxxeUJrBRLlKhEBDYrtAUKmW1lN2AUoy+I3VvGEzW98zkFXyN+Ue252CXBt+rjCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809860; c=relaxed/simple;
	bh=AAvpsXF1+H4gukTifuHEMsVKWNGupmyCd2o92xQZzTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rT9bu2xsDZl5ZJFS4+962fuGSLWUrV0azJnOBPiUA6ry/Ua2qyyMq4fzJjjTxuUgsAcZEaZ+YRbg0mp9mdZNvomx9bKNy8dctdp9o4EVb0Aaaizzguxxke+uGVQMo00hu482SZW7w8Pr5FiLWKN+9vkN/JuSupT5w7f6j9ceHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ES67ri/s; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ES67ri/s"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f664af5so55805765e9.1;
        Mon, 13 Jan 2025 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809857; x=1737414657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoW7D7fpY5zn1VtbIuKRdA5nocvl44YbIESlTnz4Wpw=;
        b=ES67ri/snb2+NYsID1TwDPa6yIMTKikzzTEmAPczOiU2pZ2npE91Z1ustFR/hx1ro2
         1Lm0HVRrkJnAXbWMEsaHw2fvzv+LZV/7FzX9IZEacC64UvL7Dgs4VF3iHe3ndzFKthKV
         yQppIXekxT6027mnuKwiiHH3Qva64Enqs3xRyMio/m1jHzfHo4K2Pu1532At9/iSMknh
         tloiU5whztcKU8I9CcTTRerBm/LfUbxSNO7MYlawhBrYX9loW8r/IER3RolzA9SPWueM
         lIbgusWsRP4biPE84mgMX7NBRhQmcrXQG1PumgN8Resi26PvOq07ADJG7/pZaZrVNCYh
         4lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809857; x=1737414657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoW7D7fpY5zn1VtbIuKRdA5nocvl44YbIESlTnz4Wpw=;
        b=dy1txnkJa+HOTHIYSowGpoNgj5fv805sGVMaTngWOYEcLpHkZGByo5OIC2WU592jjv
         pIrKuAh3JWbRinE5LcsVl7LyrMjBReSFf8a/lGaPpTwF5HS6eHPhdIWtvIdCpla1PgfN
         +/cf6FT9ZQv8HQVwxSUkIMnmL9Wf46wU0Jx1+TGdP3zXHWnoLABKP99Xg5J9wxZZ710v
         x2utopacT6PwEAi7VLOjOnaU2y+K1cOuvUpeTG4bMryv5JEEgsVYJKXVHAvsWJ4QEna6
         /nhRbjIuqE0WOVr4h9Rajr0K1ZT7rvnk8t560ra4fGpazdRwOPmcYEzNbLiGiszWO4Eb
         g/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOAPjAItyfRwZmBzgGnnxN8NdZ5QJzlnt8hke6xBv+BSVk2dyUeCiRtpPAkx12ZHofnlzkdJQhGRWU@vger.kernel.org, AJvYcCWwABTOR85dpBYnkdP3U/fLCzPqrjf9AzbIsxU9BfDzhWNJi7iLPZ2dsYi110y8/7ue0reLRhdcJnqz@vger.kernel.org, AJvYcCX5bE92y6sN2Y3pKxGtVqPiw9Q+Vuw5Aw6KW0P1X4Xgw3v4BxB9uVXTuO/tHP5pvxEdy317oVEAHvT+YUZT@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxswCIKwgg6ZDl4RGcW1hvl+4ZoYkq+/nMHj9BZ70OSytETDY
	9CUTClBLIS6fLlFeE9RieK4xEaK8s7HPpOdJza3rkxRI4rdthPb0
X-Gm-Gg: ASbGncthNo666SMs7DoRy4wFS2i3V2KBH6xAxvC8Km0QmoncfFJ0IyMlUz5sa5aTt0w
	stAC7NxkkfN1SpXH2lm1AqDmPKqPG23/Nk63FriMedVuuv7fr4Zs9WdQGJOgAdGsd7oBOAbeAHP
	GFxruBtka4Fxl0jk0kl9FA5Vo7jDKQWN3ga5hyFnu2iADZVWGiY1+Rh1vyJz/qRH91pYiOYXVMU
	UeSqvEKjF6Lr1g0iMFfx2LzCsRheO+E1W4W6fWEtL5x811m9nbfMEenl5h/V3J5qnUhc3g+t5KP
	3Eh3mRRIsctozHXCEoG2rIdykg==
X-Google-Smtp-Source: AGHT+IGfWKYTvLE02nqegFqwkla6p3hgdw1Q0e5yhkRsB+PIQLGYAy7dUnN4VRPjIiHeFQXxTiJaHg==
X-Received: by 2002:a05:600c:3c9f:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-436e2686716mr201060575e9.4.1736809857286;
        Mon, 13 Jan 2025 15:10:57 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm156091075e9.15.2025.01.13.15.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:10:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 0/4] clk: en7523: cleanup + eMMC clk for EN7581
Date: Tue, 14 Jan 2025 00:10:01 +0100
Message-ID: <20250113231030.6735-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series have some simple cleanup and the additional clock
needed to support eMMC on EN7581 SoC.

Changes v6:
- Add base-commit info
- Rebase on top of clk-next
Cumulative changes before cover letter:
Changes v5:
- Set clk_data->num before accessing hws to follow counted_by
- Add ack tag
Changes v4:
- Reorder patch
Changes v3:
- Rework num_clocks for en7523
- Add ack tag
Changes v2:
- Rename emmc_base to emmc7581_base to make it more clear
- Drop additional define for EN7581_NUM_CLOCKS

Christian Marangi (4):
  clk: en7523: Rework clock handling for different clock numbers
  dt-bindings: clock: drop NUM_CLOCKS define for EN7581
  dt-bindings: clock: add ID for eMMC for EN7581
  clk: en7523: Add clock for eMMC for EN7581

 drivers/clk/clk-en7523.c               | 24 ++++++++++++++++++------
 include/dt-bindings/clock/en7523-clk.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)


base-commit: 58ad39edcabc988aefe0482b6e0579b93b0a4301
-- 
2.45.2

