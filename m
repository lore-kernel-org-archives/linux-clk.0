Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966343;
	b=tD4WVEl2NhTLSyyTDQ/2NZnlk9kTv4xEu1QaLhv+whkNZuCwvOKUbNpfJ06WonrHeV3j
	 3EjJwH+LC0FyFZDeyTw6LKhIQq6g00axTQy9uZnyqjL6om/EsTDObrTQwrecGN1YmCIGp
	 NfQ8j0BzLZvuKYDcpuF3QazCa37q1b/O0ejyxB9I4LLkFtPF0TIllq5268fK0YqV0zIcB
	 cwvghBiCSqOmTMS7fFPEJavijbPCNp1RSmhGVLINRCdpG3qiAcyL2ifmp7IdqKlgWjK1w
	 /8YZxMTrV+j/PNxVHx+vaqFCvBB00bs8ljQyWvDZcNLzYNq1zB/Ze2evTgtMUQtCV7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
	b=2S2KcHeu0uGmSPupOqwOs5sxv0X+zQAC3ApVdRMYy+L48YOU37eryxOYDB7Wu7gmLsCu
	 WSiIZYCRgKJJlQEQSaNiyzAz+aXTXgqw6drLa8jUDDzKarVT6OHVGxAV0cgeFjUrZADC+
	 4/Vr6Rf/NPdUKg0uEgdFe3DrH3lnahpfgBe1RwpW7xON1z1BICxoaL8P1Of5PHFccINEu
	 gj3SE2K2mdMf1Yg9bXimA4TxnC+QdOe7JK+Ja/U9HruCAeRY0IkzPjKZewIYPhE58zwIn
	 VufXOcQr1WKwRbe32Jyd1jpIVY0UVM85e8fWSBW6KEYbTIlmWGzZYR3LDXEa8HpL90A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCK3UEEe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304E606A329
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D304E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCK3UEEe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4182475e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966341; x=1794571141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
        b=GCK3UEEe/FYa/4rJTX21W6ULCaJr7nJyTCzMxvEnzbugtDfZ+uceqF4ozasO6cG1mK
         tEbDfrP/b9FfLVdlfl/FwYf+uo3XtVDqOypHbExWyX4wDs8y3OtIJTT8kfy72WBAgW+T
         jS8MbDwiSkfbhMMneD6AisdFkv7qN6DxESIEoo1KWVzBnG34B/OIa7R/5qVRngG9lDgn
         amFbx4Lwk7RzWj48FuYoGZ11vj9PAJ9Ib/0LnFJms1BqCR/wiH0+6tR2phIuYWv9om+i
         dPjSDinWFTOH4CFCN09lOBgoav+H/xtMy2cHUkVWguiFHX8GEH48ivJaWXjIUzVkKhxi
         AL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966341; x=1794571141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
        b=Vbn53GNZpQH1ICw9D7yNcy+lr+Uvx+RRTtjCT2+UM1xj+v10VsHd3GujyNNkV1jfFV
         BJ3AYprTrY6ndL9afNzcwRdh4y1Rpvppa00YO59HR2oi5GZGnetS+4Zw4vWOKmeMhMY1
         RAV+wyfsJG8HLMjntx+DufW3xhWTvrXpOyOUzzc/ck1kHVZlOYJPSRNXgn51uxMYaRkg
         mUGySj2K2Bk/Ez5/C48ZLEaHf+o2QjB27ebfO37zZZ4O/8QNs9MnsfFY+42PJ9P5/Wbv
         sO32meT7cdKLp5w4Xlf8n0qtAARLeQe/MuyWIyV4z6ge3S0cCo62pgvzNiVvkGeRiLj4
         fUcw==
X-Forwarded-Encrypted: i=1; AKwUvBw/tCmvqRttzmxTy6TcEEsYfN/Snur2IW2DnbiRLq3OQrjuvuMFh9UW0JAvWIaG4kl1Ldo7YXAaaxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z80+XSDPqC1YGt4m8HOUmHdQ5h0u0yjj3vBhCOINtY0NM4LlP4V
	Em9DQebM16jfEIJM+hnkAgeoftWsMHM/ITDguyNbdV4psF0tNz/ongDX
X-Gm-Gg: AYBFou1iBedD8pabUiDNwQCBD9ZFdEkv2s0ZX5poqojtbyQM4JMN8yviaQBzi4ouOZu
	WziBdpfwBg1foKlMQZIDrf7IqjrZ0ISVPPh3aTdwKKLPfwJYbE6FQLn601SmP5jKfMX0eD8xwNq
	EPSsCLCUK5B+DLwsvgrschk0zq76zophDzge3A01OTIGrAVi2FVst9nLwSH0nGBsrn7UUHUJzE9
	V4Pgjv50GjbRpFLz4J6U020watjjDERRzAwKscPwAXOHa5ksnKSB+hUabno/j3oHtQjF1tSndsH
	iO1+32Qxe0xVGqKwyLkndJ+fR9QCL1dqwIL/srGGu0GgDOyhAH7Pa2S2OaOgDuo42KwCp9gY98L
	W78Sn1e0aX/MErFzLUbmrG8+SvHO/YE/O8PqciMtqp0P2Fs4f4/hD8gJJ8jq3zlolLtoE+bMYJ3
	+tCqwP0Cy8icAMwFt/GBMFOZTMR9K4CDCHA4F7LOgJzBXQ1Rw7o9V8dNw8FW87beAGt+Jo1fSCI
	HWtyoKiKLiPZbFjMmRiiUycPOE99j0dpWJdtGbURdibjjuGkjvNRSIR+V/jpMsznWSdVBupx/uc
	UcUPxAHbh/VseVAoOpfF0wUz+cMYwCp1KrDOOzjd/dqUL/b+MT88YQmOvFrAWHJJqHUYrhuIUjq
	VwzGOgxpL05ncLyrS2r5hmkWayMw6XEpITjiHVkiCK+V4tLY0VH/Sieo=
X-Received: by 2002:a05:600c:6095:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4b6dfd98684mr32795175e9.30.1793966341140;
        Fri, 06 Nov 2026 03:59:01 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 0/5] clk: add support for Airoha AN7583 clock
Date: Fri,  6 Nov 2026 12:58:45 +0100
Message-ID: <20261106115852.189098-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 352 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 437 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

