Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787464;
	b=oQQrxedujA/MEzDJrt22BkJLybNWV7yuhb9lyt70MChZvzNx+gyX8NgZzomAvTSKMM3y
	 fOdZQGEEypVP07Ejb/MmhfoHs3mlKGSYJtn5GHffbJqxKiZmpNvhqE3DOoaHo9EfkkNTs
	 Sjfu6cApP21yCO9rldGhIQ73VHtSYaE4hqX9v2rlKIowGcg8I5eNvIZ0IgYf00rs6IV0B
	 1VP5Ur6rHleMpLSxl5YuCJBp0tW642ScsXg7PIOmunXKPAX6ZktBZcBepsZnzfuaB7SJz
	 FiG36Fp2wK5x2BTbHV3V4y0Ve6MLTPc8YgSGmXiqazKC7JxfKNkkAFKYjOxnM7JDpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
	b=Xi+SqvIrogPiMWR2WkGKUNk3zwNU3VcZY2rXNQIN9SPgl5ITk+tS5olWTr3MKDLsaPqY
	 1tAHrHYNG8KdN+W49t6oN9Dt6bIc7w6IPowl3R0XAWjpERELBLF6RTENtTeC3aRRXIRSV
	 A9dZpYsDS8kMbb1GG/T+8b+TuH0h0utgeeE60x08z/zwmO0OZ1cP3ictONlQdw5vmKr6z
	 6LEvVwrm7qzGtc0xhNYyYfUd7DHynQPP28V8CjTULiwl6QiDw+RNSTmzgCuAmS+exKHLE
	 qRkKGt52trkVDd1MPDJXrNGyb/9F6OFjVFVig81hYdvNGuWm25HzLJn5nM7sawFq44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jOgHbxoj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC64606A328
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC64606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jOgHbxoj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4817655e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787462; x=1794392262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
        b=jOgHbxoj2iLWtbcGzwRxSE0ua0Kttx7nbiqAklxyKq9eijtUnRF7k+BwiNn3oEfVLz
         bVuDl8AJURHh7GhBaaCcfSNGtmGpngeZMcLzOd9mXmyACHDxXdY6uuZUDguikbQ4AgdM
         0wsmCxf/PppzCG581cuYvVYtvHSt8MGuAls8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787462; x=1794392262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
        b=d7qru6pjMmkIHp21nKtD9bn4enQ/Mb7+0gwZAZEEeBQbQpQh3XxpqBvG30R6UwxHTD
         QFNcbE4/+iQyIOlj/dtp/a0tYUdJTA0lhW7OPQLQkWChz2GzMyxfhj9pEQA93C2rmd66
         EpfFVpa0ATaYHGvmC8xXvv83oYu08fuMZ/qzSg4qtVufafgzgAFHyNUVBTu5LKPu+4mM
         wXDGwaYXRSRSaKFia1elzzDL3M68kTs74NM4rOzdiPWn5NiCVeg5IAwdwBtpH6hcj/Jq
         XGTglMiy0r10UPtgP8V47oE7o2T8KpVp+Gy1pyl81J1uFrcBz/xDPoTWDusN3uv1JFQ5
         YfqA==
X-Forwarded-Encrypted: i=1; AKwUvBylGsMOfdWdKLRdH4qqAsdkgTh5AZfTUHlC32i/8Hoe7Muw0m5dgcgEVrUkaQKLZaECTgYx0B+wCuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VGWoBoGFcdZqgHm3CgapMbwBpicRHoZV1p+MJRj3l36ySY/vI
	vRRntxO6j2ZPNsTHgDtyeupDbB1WRjfCXReSfP29iYyqQ1Dm0UA6OzVPdUef65DfEYY=
X-Gm-Gg: AYBFou2P39FLsvjoRz6Ofru4cjoodTZFQBVf3iJvwQA42v0RPR/co3XaQ20xHBsDaTi
	X3GGUNHpLx8TLLb303V45dliIi4GKDpWtTb6jJ+aRNtCEkQsmSF4bxxDykS2qoIEl+qgHOqj7Rb
	4/6g9WxA7rsUYbNQPQSxcbltfDyi6xjl81cinLAw5mrx5HdZlfU11LuT1/7QIvKprNwfFfdG8MU
	nnTfUkcNiX4IKk1Q9LQ9RL3Tvg1wbA+B+2/PcsankYyk2Seouar9rVO+1fQSeeR/2tw01eFGtph
	MJrTI5SjACbH+dY0b/YjRExP7im13ATtmV1nPCvk14yVawMLH260hYldi/b4TkbhwUDW00Xorp4
	PuzCDiumyyGwo0jtOjBN5FWG5y7gehcAhB5NJtfsCXn/XcjYGNpt5D6uBwcWr3lyW5spV7vuD1G
	XT+jDvZPIp6NU3L1EdfoJOCfdGZMEHphrKzAd7rKhB608aW8ojE3QOGZRTmJh8A9HhBF66GUSzS
	Nr3Xmai4NvUkMKU5VDUVC3nedbMfM2CRMRoAeYrUwO6n5xJrjl+tEHVOPXs6QfR+DDsqhMxU1Or
	01E3xEIVMCIIOco/h3GTZ7M9YhRSxVnOo23KFNIr/XbQLLX2X3sobGDHCYADDub8HY8OmcpANKs
	nLY2w1G5rZM2HsgLhEgAPEkQHPkteVhoFsQAHnvciSO3gXgm8fVDh
X-Received: by 2002:a05:600c:34d6:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4ac150b2192mr366110145e9.3.1793787462248;
        Wed, 04 Nov 2026 02:17:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Wed,  4 Nov 2026 11:16:54 +0100
Message-ID: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and
deprecates the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters, set through
the deprecated properties, assigned-clock-sscs or both. The dpll_disp_ck
SSC registers are programmed with the same values as before the series.

Changes in v4:
- Add Reviewed-by tag of Krzysztof Kozlowski
- Keep the reverse Christmas tree order for the variables list
- Check the range of the deprecated ti,ssc-deltam property
- Drop the checks already done by the clock framework
- Split the already applied check into the disabled and enabled cases
- Keep the reverse Christmas tree order for the variables list

Changes in v3:
- Deprecate the properties instead of dropping them
- Keep parsing the deprecated vendor specific properties
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  9 +-
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         | 21 +++-
 drivers/clk/ti/dpll3xxx.c                     | 96 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 112 insertions(+), 25 deletions(-)

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

