Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0102627F9;
	Wed, 12 Feb 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387616; cv=none; b=gZgqAOft3hr2xV68sr6Zun8f7eCf1cWtqPG72TghBH/DeoUjYwr+Fjo5izSIA7rIxVCp5dgrPv8RwEuDzLUprq/8uzXMgohDwt0bU2IVU2hkPyFt6blq4ghUuHhjz6+OxxFJp9Ysqzzol57XuxcXyZV4qPi4KqC7LxoC8tGCws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387616; c=relaxed/simple;
	bh=iu5S2qQhfIA+bGk7zgBLx2LsbfZVYXtbMqlErEDJfIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okzFRrtfzus1QU3kf0iUpuxlGdrt81GFjriatQ3mMWkWj9aRUiSKyOXk4ON7Y2X5TIyVxAyjlhZmBkidpy92lbXHDp0nS5uIHyrRzFcgDV6V0ZFLEufPbC/ATZMTw6EQ0Al3SKXSMF0qovWI3rHeAoL1pnN6S7z7Ujyzxs+j1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M13oBsj2; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M13oBsj2"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-726fe6dda74so86882a34.0;
        Wed, 12 Feb 2025 11:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387614; x=1739992414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4uvvNTCn69pMo/6V+tni3pi49kMJUjjGQzaJ92qEqLI=;
        b=M13oBsj2/zjN5yuDafKBW+6rpnY7ZJzrVObc59uiR0wMu6cXKLoDy9B8OY/EAPJwp/
         hbXWFwW2y3GxnuQxnjijBMbF19g0Sf/vdYzJ87F4KOiuOX/tg33SSDFLnXup9VVw9cFB
         RzEn82ssf6DNKvU8pbV/Rtl34jZN00KutDLfryiqpG4EbDWeWluIHAMN358HQu2PT+F5
         FURlrrAUZqbdBu0PUpUYo0CR+DtUXTmHkxNzGwE5iPwm3CqSQe0i1tUSZhe0J3vyR7JE
         ZoBP4QmhbFiup2krI7u4QE+ABv2DsivkWxIPI8zVW11xivBgLozp19TAhd6fKF3xtf0a
         GfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387614; x=1739992414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uvvNTCn69pMo/6V+tni3pi49kMJUjjGQzaJ92qEqLI=;
        b=jZ23K0e7BplvAKXheT4yt6QKhqSLIQGj2ltur3rgNya/+KyYQcba7rKHciucT+NRk1
         yz8MA864HjLO7w2v5EEew0BjFFpKicRMPg1C94f7rwvnGWiTlTo8vPYS8P0mV7VOPxt5
         BrKxs81+3c3WRbd53w5pila1cw1aqPbvqGuU2lVxRe9YKSdwQMKshq6axyAbf3eD8BFy
         X6hWzj2l1Aay6FjY/bxHxZJrhnV/jj+3c3PI6DsC36vbepDcxsm2GOlL3M5keVQE3k5/
         owdOkhl2IORBhcnpPpMCA88/3useag3G3HaI6pyqvXXzTByoG12wWMFTHuTw8y2ZpP8/
         /FgA==
X-Forwarded-Encrypted: i=1; AJvYcCUE2HEuGxyl2CG/neGIl9VDoQUwkXy2Nzjrix1fMJwPbMSkXm60prwtS7SmqVy2cav89GkmQNmE0yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW27hHuDGgtv11zijvmbAWcTOIxduQtqVs6tYK2awyEg3Iddr6
	HBNviKS0SpLhTYaQSE23CbaHLJgfxYzXX+6ozZkzHMThrJG+I9R7
X-Gm-Gg: ASbGncs002ev6M9hGmBth2v/UVdIXCebutxEAXl5XXjsSev1LTx8A0kDO3E2V71Fa3x
	2WFvXoByqIDESETFjY7/BSHdNxLS0BbnXVe4ga4hrTt4NIAcj97WZlCkQbXt5ayK38RWNxmTgOO
	fw0eiTqk87Wvyta/rvPuM7P9292UtGQ+T+ncdUGJtlJ2l3AZNIfpebSlAtjUXutS6kKE4QtQ10z
	UtAUwnZrA5ebPyOnNIx2x21t3Kgg8l0NTDW9u1oMM7iRk1fasoJYtRoeFA6Sum7xTq6nfbdDauC
	soQzfQqQ3R2ejT5pI8bDEHsb+nMDlTJpGg==
X-Google-Smtp-Source: AGHT+IG2Pv7wZCojfRcIagqlwoNOupsL8ezR2SAwZJ+ouLoR02Cx6tYjcppbrON4JH6T8Sv6ArDRyA==
X-Received: by 2002:a05:6830:6483:b0:71e:7e4:c54e with SMTP id 46e09a7af769-726f1c33b3fmr3043630a34.3.1739387614229;
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726fd014926sm356033a34.32.2025.02.12.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add Clock and Reset for TCON LCD
Date: Wed, 12 Feb 2025 13:11:07 -0600
Message-ID: <20250212191109.156766-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required resets and clocks used by the display engine TCON for
LCD output. This is required for LCD output for the DE33 which is
currently pending acceptance into mainline.

https://lore.kernel.org/linux-sunxi/67acd970.050a0220.1eb03a.101e@mx.google.com/

Chris Morgan (2):
  dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
  clk: sunxi-ng: h616: Add clock/reset for LCD TCON

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 24 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      |  2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h |  4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h |  2 ++
 4 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.43.0

