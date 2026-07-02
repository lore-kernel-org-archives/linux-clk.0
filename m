Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF23A6B8F
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015908; cv=none; b=oJDqANo/aV/dDaSKkG85X0Y7/MoDTcL2FAdsUNCocVnmZHKt4gMowPnpO4lAv2sg6OMDfeDcTp8pCbpWdFdRyQDw+nRJPwKlpZvCPregmT6EwE0ZFk+kjsxmoW+jlonqQ5Jfx9zdVwBwSsB96yluMuT8HImXr+crpwLBwLBfHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015908; c=relaxed/simple;
	bh=hwCMbQOiZREN6cIUCJHWWmm1HntdXr3h4PlM+Tbadsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2LVJE1N9Jmo/UuEw8a8xWc/mB3MZwhF14FP9FwHmxl2ODoaLnnPdpBgKO8aCpCxDbtUzUatPUIW4lIGB0QiMn+bosbXv1U2oIhCZo0e5mqZqs0n3RB+UVaCQQKmHbLyjTsSKifd1S7rhsYkIvJRA9DJ53wc+80+0CLxYT+mD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Boh8qgvP; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Boh8qgvP"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9204711e831so170775785a.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783015905; x=1783620705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=Boh8qgvPRVtyxiQWLHjETETL+CqebcD1iN2UmwYm/bWAL6b8ZjW6Jj7Bs8xd5av9ds
         DinP93FoXDvSVJ4SPRPluyqRXt9K5N4EmGJqumF2YQYos2EfW0AlQYTybZD1pygMDvbk
         caK0BjsnDYSUdyss2EybRTxYv5l4JKs3RGZF+w0lMQk4u6Y+p3dw0mYk0NfrP8H6E9V6
         enob59LsJ1UcAH5qi0IMSMnNlUw7Qi/GvgPJE7lnfSrOE6zmeR4it14nZNeY2QjFj0UQ
         ApACkaFh1XmFR8xbIqn4xLKsWb6NL2XVIHpMvpXo4t/bHh0psStB+jTgfAnrvsNcK/dl
         48fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015905; x=1783620705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=ffqyiFdZP/FCrtzEPGXuOxFPn2c4SgUCzy0kLJYwQFlvYwY3UVqbP4FCJaDcHW+Vex
         AdARhgzhv6htGXMbIbwHrkjBNIghdkamhL/KpK9J5dXE43gnx0OU8mNL9Ul7EGc6Is4L
         lNMKClcXpymknTZS/+4DWPTOCmdsOVosEZLHlvKqGxITdh3b+1yqUAvGV2Nlh6XZ733B
         5dnChGOauBYx9/jSIZ4gfeuDUF6M3ku3NIkTbITBvGkTeP24krmcSdn2a3zZM5lIX8zt
         AXKg8dYgF2zk5ttQWLioOM4x0UmjXaLxBkv8kP8BSLN/WOjiZBR4FwNHpy54hKbACEXV
         zm8w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ql8HlcmJPZD/POmtS9g2NbuK207Bdp4XuK8bw7+gHbBOunSfzxRMTx9kxv7cWGySYbUQcLSM6v+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFicOShSovppGisIBbJgHFgxwGs12Ujhn2QvcbkdA/AKOFJz6N
	7jAZnjdkwcvBh5P5JnLLBTNDXTm998pCfWKwe29bqFbuurMCB0dkJtGC
X-Gm-Gg: AfdE7cnT0sZPoEyTc7JGMkESwsKZzE1TWcUzcWHcZTalKuInyAkm+97ACpUntjj+Dde
	KZcKaheKa3Kv+eG/5VzJ3Ias4XBDYmrDgkhJDLfh+p9sln8vJUF2zWUEd7XRD5w0/NZ4knvbFeO
	0bd4JGbNVWW+hL9yTZmmX9sZPHWAr2Vugn/IPMLHvc80cWlOHDB3l/pRuU/uQOxd7xY2VRoVLwN
	rXmdUO2jo5tJsnpjsOqwg9UUwvRuFpo82ZHu0OiDYikvmOTFSAXD+b2ugEI8XHZJolYSFAt/Dfl
	0mhOrq8HB8HKc6h2PMsX+MyKx33uFlNC1TiHifRDoTNnKPmO9Ntb0tnstk5hsQuZ1NXjFBgoXPH
	uHgk0BMGvem7qDjOaLgWXQywG6IvY8CO+pk9Bd8LJEKufQl8WBsvMkzVJ+L/9pFfhSaexlPUcb6
	65SXhkK0tudxiqIdQioKk/snjft2/sGJ9X0ONEZJDisvoy+2Yu4GY9WSZ4dpI02wNV+xHEiZ4=
X-Received: by 2002:a05:620a:3722:b0:92e:4927:1ffa with SMTP id af79cd13be357-92e7825b2d6mr905846685a.24.1783015904823;
        Thu, 02 Jul 2026 11:11:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80194291sm274217585a.37.2026.07.02.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:11:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Date: Thu,  2 Jul 2026 14:11:40 -0400
Message-ID: <20260702181140.883070-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Same exercise for the reset map: I compared all 121 entries' offsets
and bit positions against the public A733 User Manual V0.92. 115 match
the manual exactly (including the multi-bit GMAC0 entry - 0x141C bits
16/17 per section 4.1.6.212 - and RST_BUS_SYSDAP at 0x7ac, which is
what makes the gate offset in patch 7/8 stand out).

The six that have no register in the public manual, in case you want
to add provenance notes near them (as already discussed for other
undocumented IDs in this series):

  - RST_BUS_SPI4       { 0x0F2C, BIT(16) }
  - RST_BUS_SGPIO      { 0x1064, BIT(16) }
  - RST_BUS_LPC        { 0x1084, BIT(16) }
  - RST_BUS_GMAC1      { 0x142C, BIT(16) }  [GMAC1 question]
  - RST_BUS_GMAC1_AXI  { 0x142C, BIT(17) }  [GMAC1 question]
  - RST_BUS_TCON_LCD2  { 0x1514, BIT(16) } - the manual documents only
    VO0_TCONLCD0_BGR (0x1504) and VO0_TCONLCD1_BGR (0x150C); there is
    no TCONLCD2 register set in V0.92

Everything else in the reset map checks out against the manual.

This analysis was done with AI assistance (Claude Code, claude-fable-5)
and each finding was checked against the cited sources.

Thanks,
Enzo
