Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AC2580F2
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847103; cv=none; b=hvJZU38pxCyEq6cn2v8u48hXoUNiPBaDKOBqs/phz268r7jSzozHTRXcQj2emoNz90w6Z09MiMFAbcMjTZmfGpHXdO4sMXNuVw4N+j9K0IUchIOxLTpoEyENCkVcYnwPiybTe9eJ8R16IxxSNY2qq6PnVBiuuLN6UvXh2tIzEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847103; c=relaxed/simple;
	bh=EC+hbL4fy1RDBuD3ijyTuRjK7ngIuSwyzpe6h6ynI2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nnfus7E75yjZO+kiy8fBmL+qzVKQlHIQjua7olP5f06txC9zLUbcFN6eGMe7wnas/HnI7hwwzwA1tzX0W3YupX6RFZe56IpLWNeHmzL/Mrs7zAJiWGGvbVZwwHLhW1qzXflQfTVrC+gUyzk9lgWlnM0rE8I+i+gMfN6t5sbJ6cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHWVZL0r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHWVZL0r"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a07fac8aa1so21258825ad.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 00:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847101; x=1770451901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=LHWVZL0rYyAVJNEfa6PKbbZW53nFip6n7TPJXNDVDCSXmkhylB0og7dJcOzOPzxx8Z
         ohGAxdwMHvKiB2NkTD4Akv8kjQNMsz9ckxPkadAXMspWmaD59AkyA8pOql5c9sDLnm3C
         ZXHwg1FVPyGTqdB28tBuhJo7mrUy7hnAEMDCxY/vwdb7qJCdGsE2qouMG3w/ptyDBuB5
         kq3T9/RwDjAnIT0dTWF1YphnQAWvwiw8cV9X6wL6chUc6NAtOdVeUfy5PW7Pq7iqKQOb
         JoVwF2i/RthkeBDjH86Iizb36gyyZoGpjbniPaB1uaxhARZoZxxad5NhGnlvbZPKwGY7
         TGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847101; x=1770451901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=mFFvgVuu3MaG/HkKmRyWKQSlzn1L0dQqCcOgQowl/4/Uo9xGUFtdedJEuG2/eXdX7q
         7ZBIjBRGTuxI+TpZBIuTB2F2dyAIdgM9u5PbeBflBtaQ9DS0CZCtQUhPgbd/L++NQpsu
         kh4RJ7F/KEtvWhPGnycLuKk5iGcIIlE82rcuLfTpner5YXtV6dc359yL4aYj2knsNWj4
         aZLR1J1oggDjvazXVZp49/zJi3mDmsIDv+OhGXBBAFivqam0Lzq9qbZatTbppSxocBIH
         UtjIhHWbQkAMrnAXZR5rosctHOa1+fC/CGJ1I6xSbRldHIdvbjxDvGrWShwLVBUczCiS
         chpw==
X-Gm-Message-State: AOJu0YyXYcHVUoJVR5OVVuApPsBCwEFaRwxpJC53VaI1zVD1UvNTFNy1
	+9jO0B9bq76CbabdrEOESl38pwyFvSXjo+kXpiDUEApJOCU/ip2wz7q0
X-Gm-Gg: AZuq6aJVRGUFrMJ/pnBGm5MY8edTZJCvadxc5qJ/m8pfJWxUSV82yjR2qzC+aAoQMLB
	PxXzSyqXIwc5g+hTt2eBGu1t63wzpPTGm1b0PZ60dgAxxONGjXak68QnxD2bYLq16drOqfxfYEE
	LxJEIQgC6e1kCjW4aQPV3HTjTp7eplatCFWEk2qdaJ2CEFjuDHmUrDSTIDL9wlBfeiWN+Ntkf3O
	EO9fbetlAH1nPNeFmEERc3av39B9LZkzwTLeH/4Zoeik92FLgNdgUUltE3qEn089bNTS0meOY4/
	5a8pO9q56FNAL8n3+47iHX7UqBj0x0rcWh92gfSCPU6cAmwHUI56jDBecL3YHdjGFLRPYwhJzpy
	OpaKLCqWs3LMozunUtpqJsCcR4LzDo7E+XpDRCbV6eebeAN9SpHpcaiU17cyaQvUVoDcXZqdpA2
	kIkmFtAo8=
X-Received: by 2002:a17:902:f689:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a8d81503famr59926225ad.32.1769847101113;
        Sat, 31 Jan 2026 00:11:41 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:40 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Sat, 31 Jan 2026 16:11:33 +0800
Message-Id: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW5fWkC/23MSw7CIBSF4a00dywGaCHoyH2YDiiP9sa2KBhS0
 7B3sWOH/8nJt0NyEV2Ca7NDdBkThrUGPzVgJr2OjqCtDZxySVlLiZkfBJdNvsjFdINSrfCGS6j
 /Z3Qet8O697UnTO8QPwed2W/9p2RGGOFed1YLqwclbuOicT6bsEBfSvkCEr9ATaIAAAA=
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=644;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=EC+hbL4fy1RDBuD3ijyTuRjK7ngIuSwyzpe6h6ynI2w=;
 b=SF5MP4ZPO/jYldFRUAkmUvBShoXhgUIO110zw5ChaX4rFg9vK1NmvPTMYmkhIUqBssqF3N9R1
 kUY3rQpu1bPAR0kzx1bLdy4lfZEHnRa4s6C51KwS5qLjnZPNVls/JRW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

