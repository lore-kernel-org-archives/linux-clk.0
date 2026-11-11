Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398992;
	b=KIqpW5sl00xxv1iKZI8HlfBY9PBnGhxo3YCntPdIju3TELxyI6+ZX1jT49XLUIXoLCZQ
	 bZHRgq5ButoBk/+87fARggSx+t9s4O9/F51Cx3KXfGhzjRaZPOy/CQwQg9QYOaPpgMvux
	 bRFu9aPJ7yE3chX31UgFXEAcC7idudpmtmg21OA4eJ0DzRFQ2uAmZ4r40EEmK7zn6Jer2
	 WLPa7pV8BijvGZWb1tOv8ooh66nVxA2TDU9hPRqbeDCPOIk6eNhGOSYUnIUKJsd3S224X
	 OLOntx1I7sKtj3On8wrHUwgs1qDN/FLPGYTq+qW+auuzlgd6y4TjfhM3l3QOkNSgbUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
	b=O1bHHGkkemiXnSwxW8eTHXTtkcl0PPZXfdNADsdB4cbcSSvv9xHlQkARXaBd+AsyhWIh
	 VrwfKijUp2dnRoiwtOTknbmMZXDyehMNJtb6x6XAU/i2yjhhO2+wz0ltn9a0hOoFGCzK5
	 7wa9ytv5+VDQ4OD7Oy3oqlZ/xVSrNbZa6xsolhIAnojckYUFkO+YghZWuJjHjgB+4H++X
	 yMCZBg76mJNo2B83rGVdN5zUWoCW8UGuRWtvjD4ye9sFFwNKPha2AowQRQs1P0gfIv7ec
	 n7VZ4jMcaxftO7nH9ZuITBt3Wl3PoQQHpjZ0DoFeRDdFsMF4Ccp49kg6IcFOestH9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5TWTw6+;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5825606A88C
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5825606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5TWTw6+
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-539a57a0b1fso1188619b6e.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398991; x=1795003791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=k5TWTw6+QRchA1PQTS6oYaZ4PuODw3xmmgrU9JTcYXc6nGWjpHL8uSg68S7qe7XTz2
         oeqEBJrUspxe+o629HHec6dg4bPIG+7wI9+glwyPUFF/iYZxZjTqTO9QxjbzGSOjSONZ
         FEjhF/qIMBX10Evv376qVg5lfidCBavTyDN0E5tbzevNXotJVr33CrDxQ5FNkACBc/Y1
         YXS/V0hJ6xz/e7KW2Dh5fsxDh14z4P7rhUrBnYunE/EF2M3y3pNUwpbMvxh40VwgBsCH
         CoyQuMqM1hyxsDn9wzJFA0cbjJKL9dsJRW1fIKpN1mNhQvI9PpYTrdPdKe0qq2X+aJiX
         QzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398991; x=1795003791;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=MM7+tr3ddVlwTrFWn3WUwQEV0u7+JybtEJoffuujzdGSGCebm3MVLCBYSJxYBE69Ix
         hpoTL1vz4YcfP9B9st3jQjkJCfigCMCiU3tICKC8akDCmwq+gcZmaBwa8ZasBkrj4nuP
         Iq+CQcGcVtScSlsAzqU00JymsVq/S1d79d/J6U7yFgbvCyHOG5U7A1RqPYd6t+Z1DZyH
         IWaZNZxWI1CNLnApEZpGW/2gwIFrwX2CDz/liw00JNRONhi36j+um5LsKbr9kxleDAME
         RvJqryN3szqL13HeuMWKmwA6TsSX0f9cjq5fjGMqBnKjo3WM0GmeVez2sWBcpHW+jKXd
         i9/g==
X-Forwarded-Encrypted: i=1; AL+hErGICH6E3lTlTuZtkRR9HniUudYjrC8k7dksSR+4S9yTc15BFQDpcW+5Afem9w7VG9yNp5Dnst3vM3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQpYuft166q96XbDYjtRzU6Za3WuVkOTq6OemJBgxr69tijQc
	nS0naJgRJqbSZbI4ATp20vsS/YDjy0c629SiAFdkYBCNXIwFTZWDA9wOw5xfbdNT
X-Gm-Gg: AYBFou1HwpGnikWSshl6C74OqHICMOEKBb/RHkp+k30jisyncojN6V9d5tgXL7Jus0g
	10oQdawg4/dPJTiR0/A1975EVMvyErDocnTuOMmN1tjh79LfyknTN2PET8IFpVd/ao7f4YC/PLi
	Sf2kG/1+R7YbufiuMnfkiRioaC63ZAdBJ6uhAw3v198z9nYUlfp4VKeWGoXCIHilGn8PXUtvnra
	ZEJ6QcNwk5H7nwzaJHOGmDjL/i3W3rpj7UL2JkMrQ9vuxsS8QyfhjiJYpoVdac+4q7oNnMHCmNz
	LhfkTJfSqrihfB5slGZ4z8NV7db3Jt9cNuocUx8Mngsa1mWh76R/0Tk77woS7pPQ2ugKhCiLRgX
	qf6NRF5u+p+NI3ayeuy9YqUfnxaj0nofGxdGf36PWKs3Q6l5BNrdPZR9bkJTm3Q9g7J/1mNKtqP
	yxs24l0Ov8uyOVQP3v9U54l0+QbJc8uvFOcizNsgxK0/wKrh8AktZjRD6tb8jpex7F9rUZFhAAa
	tc3s7sQRhfdAqzh7kLBV8uBS9YdrkZKnynu29Zs1E0YdciN8KKe+LMKI8/sv558wZi5730WTWCC
	8P29XT7BH1l49Wh6fcAE6GMWNOGD9QoPffiLDt4EWFR/d8XIlm0MzaDyTrlDYO2U8ze/H4sqsUT
	AJfgY
X-Received: by 2002:a05:6808:244f:b0:53b:1d13:dffd with SMTP id 5614622812f47-56b92c464dcmr1457460b6e.7.1794398990670;
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm4958534b6e.3.2026.11.11.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Wed, 11 Nov 2026 07:09:48 -0500
Message-ID: <20261110-a733-fwclk-junhui-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech> <20261103-a733-ccu-v6-fw-clocks@gmail.com> <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

> I'd prefer not to mark these clocks as critical just for the vendor
> firmware. You can see my reply in v5:

I agree that native PSCI and a future OR100 Crust port are separate from
the vendor SCP on E902, and that future E902 remoteproc/mailbox drivers
should own these clocks. Vinicius's native-PSCI reboot report used locally
modified TF-A on A7Z [1]. Upstream TF-A still has no A733 target; its port
is under review [2]. The immediate problem is that the new CCU's
unused-clock cleanup breaks reboot with the firmware these boards ship.

On one Cubie A7S, RAM-booting v7.4-rc1 + CCU v6 + DT v3 and its dependencies
with vendor boot0/BL31/SCP/U-Boot and no clk_ignore_unused, the run without
critical flags stalled at reboot -f. With only bus-r-riscv and bus-r-msgbox
critical, two warm reboots returned to vendor Linux while r-timer0,
bus-r-timer and bus-msgbox0 were 0/0 (enable/prepare); five flags also passed
once.

> Since you've already submitted a separate patch adding these critical
> flags, I'll leave that to you.

I will narrow my separate patch [3] to bus-r-riscv and bus-r-msgbox.
Chen-Yu, Jernej, Samuel: would you take these two flags as a separate patch
until E902/mailbox drivers can own the clocks? There is precedent in A523
bus-r-cpucfg (1dba74abf3e2) and Meson AXG fclk_div3, kept critical for SCPI
firmware until the driver claims its clocks and a handoff exists
(drivers/clk/meson/axg.c).

I have not tested power-off, suspend, either flag alone on A7S, or other
boards or firmware; Vinicius found either flag alone insufficient on A7Z
with vendor BL31 [4].

[1] https://lore.kernel.org/r/20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200
[3] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[4] https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com

Thanks,
Enzo
