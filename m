Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818709;
	b=3zVMFg+qVofSOl5LlbNBkvgeZIl4Z8Wnp3mewPhC7ni3y4GS2ga3SHE1Oz9eWQIZoIZc
	 efWhFHI2zcmpJrC2vwXgpC63SoADvZ3GpAetkKsZbXwyr5BhNUETzB73+TSidjNyOuqod
	 ZIy9BhsJgKsNxXE+S46GwnM3jc3cvArY+aKnYbNGK30/w/FUy2SRwKGWojsDLnoieXfiH
	 vtzCNZBVZnKsah1bwkRYrLZFMsLvFKHmTUo6jZ4X9d0GahCrObGSCr9t+vaWHGPlZvlsq
	 YMXtskmcNdyr5gLfaf8e2uvmMN5srtHq5/9VN3/B+tXqiX5MH7uLJFDphUW4gx/gmcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818709;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=;
	b=UnGqUQtalZ3mNyDkMQoiGthFngPOHsFjCMQO2R2qrryKJ3tD8D61RMjEnmJtAOaDwBYb
	 np2c/YnWYwr6QA5C066i6cl5R3IHRLUWR66PyHRWpbwgef2jPWXK/jJ8Mpd/P3c580zQd
	 w/zHnXPGqLvHITP4I3PgmkN7x7k+OVRhxOGbvYMOmxFidE/MRdoXPDTx0bmhq01OS0/WD
	 KnnsQVrzcOXda96/8kiY/wgo06qM+bl6M2B6d/A5i9l3xnzcRoxylwGpksxD4mp7/8fHo
	 AS6JiouDcBjqb1XdW4efv9r3DeO+XE7BfjK6BLoqJ2Xgrk4God+b2z6qFKmdS9W1v9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5AJNTn6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AF606A330;
	Mon, 16 Nov 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5AJNTn6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794818708;
	b=MPbIWrw6FVxrR6xZ0CE8mcFTcw7W2tzmASHM/oJg1EBprGgOOUMxQkaAmBN8bvzMWj+H
	 OcM5ggFzQ79CaAoXeSwOrt+nssso7pQtlM68JVVUII8QHzTEsjAQ38yiv5TCLAe0gUrM9
	 QvNFLu3HXDa+5RLE+V86PpbbGEcV1biuVNzD0ijVj8PFUkv4lFfnfepQh8qolOLeME/Ji
	 2nuPqCf+i5Xs6HfyYQo7HJLmVIJv4EMD5PUdKnBR3NzCEfb/gtCcne91/0/ZyN1adKaRi
	 4xOs8nedX5rqjJY/wCciJ/EncVP4VOoiD5RuLw2QdM4V5D9K4T30mJ09BH2wMNrxNCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794818708;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=;
	b=EAoYJU/ztWxnBgXQG9ZZ9lHAjQeBrca//o2oayAdQ5Qvow3fIzGXTKd+ZMO11UIE6JJv
	 HH+ANb17SPX6dNJw7e8ZlAwET6boDmfbmudOrBxuFZn8t7RGHqGIZIERVNHl3IF39eauu
	 5UHaId8CkTwKxmkCvBbjTM/Wrd5+Wwt8cIHKkv8skwg+k9p7rL/mSo8uN5gjZA89wNyZ2
	 7dbIEpm4ZoicHz8akRcMsKTlV7rjbjXvqfsz+sEd3AYxC8YTerY+GU18un8ic46E1T6D3
	 UvyZxfwfF6IkpcNvcxV2E0Yfj5syilcOrxJ92m5Ax3zj8uTJVtLeoqPMaYMoDahV22Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06CC31F000C5;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818708;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=V5AJNTn6EQ9c3HGz1uyTPS1q9Jnc79bab49botWpyaSUqIp277tRXcEvNSQ0d7Kel
	 IOuQC81GhFvR9VcqmGZ74BstC5FrI8gV82VupZ7mjNc+jgwhc//SnLi+HrOWLwnaqu
	 EzViuFhQe01DxVQmxw4GDxF4KZaVy2BXOqs9rX6uInfOFelDUuQBUZE7kSf/4uz+/n
	 EtswieItNLG1+31An50YpTJA/UJwfEwSql3QYlG81UFo1CNAFAVIZmU1SvzTTK9kuD
	 lZH+Ekhk1vyaII3QQmOyEm10ew5PbQG+C+KlFo/2tBaEaqGa63Hd3jYBBHqWWmWVq9
	 9u8BR4LQCPoaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A0F24A3DE;
	Mon, 16 Nov 2026 08:45:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] clk: sunxi-ng: h616: PLL output gate and GPU
 notifier order
Date: Mon, 16 Nov 2026 08:45:06 +0000
Message-Id: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RgKtRFX3sOwKNMBaoCSthAN4
 e4Cxp3Ll/z/3gKBveUAt2QBz7MN1g0bZKcEqNVDw2jNxpClmRJCSGyVUDh2HbopjlPERkdGKkx
 upJZpwQVs19FzbV+H9lF+OUzVkynurn3R2hCdfx/dWey7X+LyPzELFCipymuSRpG83pte2+5Mr
 odyXdcPKIhKecoAAAA=
X-Change-ID: 20261114-h616-pll-output-gate-c9d3d4a409e9
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818707; l=1465;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+gIGBxaGYrzlHRjrte48rjzJCH2FF1p8PLkVsm41dBE=;
 b=rVKKVnQpSRBwsSYWhSWt6F6Q9Vx2Sm9DefvBeZXvuKHQs5alkTfrfR2ty28MhZHTJumt9NjX/
 Jcfe2OMOMbeDgNtTPV1vs1lomIrwci6DsP8VvhzqKi84dy1EDxPKkNV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Patch 1 gates the H616 PLLs with their output enable bit instead of
powering them down. Patch 2 registers the GPU PLL notifier before the
mux notifier, as Ilya Titov's 0ec5e7572ddc did for the CPU.

No Cc: stable: the patch 1 crash needs out-of-tree H616 HDMI, and the
old GPU notifier order never failed here.

Tested on an Orange Pi Zero2 (7.3.4 with HDMI patches): v1 survived the
failing mode set 40 times. v2 was not re-run against the crash (our HDMI
no longer leaves pll-video0); it is a regression check: expected PLL
bits, 1434 random CPU and GPU OPP changes under load. Idle power not
measured.

Developed with Claude (Anthropic); I reviewed it.

---
Changes in v2:
- Patch 1: power up the PLLs in the existing loop and stop forcing bit
  27 there, instead of a second loop (Chen-Yu Tsai, Sashiko)
- New patch 2 (Sashiko)
- Rebased on sunxi/clk-for-7.5
- Link to v1: https://patch.msgid.link/20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com

---
Arun Iyengar (2):
      clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
      clk: sunxi-ng: h616: Register GPU PLL notifier before mux notifier

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)
---
base-commit: 63a29fbb4ecdadbaccd2693864616918698e1e58
change-id: 20261114-h616-pll-output-gate-c9d3d4a409e9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


