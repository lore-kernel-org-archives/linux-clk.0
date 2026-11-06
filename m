Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963381;
	b=jSGRvnfoEml/bu45GnZcP/+lq1jTdKACGdQ0sCYkRZDdH6fBLBTvcckdO0Mryx4LhxD0
	 M1MbWp3jJ5ibC27s4APXdHspbr8L/I/Nsz0iZxeF0M5StNBpkZOQzYHxxIir4KZUUCSDz
	 LC3MpBGSRsano+weWqysa/FWTBLEVOAGQgP6ngwohMvbN6x3SaEEZJF4UGghi5WwHn867
	 BCN8Z/tITr4908WBK5QHnSuu4V/S6+zJrw5+QdjpXhv0VQaPkEwia9YsbDTrbjDq7VD9h
	 9y+341SwrdYbsvFtQeWOx2cr7U60ImjxiZP8l6u/nXnbsxxNnsPIz4+WIW4oNfZav4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
	b=G5ns5e/h0GuBWexiNeghCl25VExNVwEvc3HJVzaUha/uR6Wk5mRXoghS9WFKYUtwMQm8
	 uVr9lLQxdThQGLncLMx9BjV783u0lD1jp9C7zlIyRYlru8Dzkj1HbcWUhkcjP441hqKtT
	 oE5P1FtxEhTZD2jzFSGemzruODqNAPNNowRziGazC3j/OdkLu+pWcdpMovv2nNQ9hvjea
	 KnRO9uNmNhMQ/XBTJ6r7rKZlFNf3Gw+o0/Ykh9RJSoizXzKymBFSmNQFVA5IIbCJhAMhP
	 voWPFblBRNKmQ/Nfr4AO+YH1kJUrFiyE9jBtJAqqgi+SrfpMmnPOPQUzkdjVZkF0FAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0894B606A329
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0894B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so530405f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963379; x=1794568179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=DIl88d6nhmwOGknDnpQMw7CDUEcprSXVTAPuRqwC+aviu4k/vGuQALYjTSBcSCtDib
         A+O063FGBBxZSI4K4lMMq6PFNcG99PZP35ePyg+HwenKZPHBHiBPHcxuF+zuRfte1zOr
         WQ8Jgn2U0SWilYh+xF7PZ5bmOeBVb3P95PLFuVhKhy6OWmPK+yWFicrpRnEPLTyHUmZr
         7WU8uSJQ26KmrcpwBThcG1AeCk8uzvMrk0X1on+8fSFXeoX0eVFHpDprK5+Dva6bqySi
         0D9Dx13jA+Az5kGNfDHPQDwUSdxxmmQAECT+DVJGdOM8paiXQ6+gbYLKud+bdvkyUMVq
         39FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963379; x=1794568179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=RbYJMZuPtG8zBWtXjZpSuiA6jvA6LW6ZCtq8VVrKwOBDFL+8AVJY4E7iBDOfdtGaKx
         VAHsJjqJVD2fK0XS0jIOw7K96dgiN6So7kIFX0/RLfgrIBgvoFaW4G6DLhBN4KM/olJQ
         ++xE2FEH/Ezt4xW4kAdJrk64N6H651T9YVME0ziiR1hV8ZHPBGeD6TrqVa5g6gKKuXPk
         wafb1BF+8D0GfLPmo0DElGmNy5i8TwmRoOMyvUGgSwEtr9bghnlzdBiiZIWIw4B9x8nQ
         DRAtq8ecODPIsDCESbxbU1RGAoto/GVvHDoU1r3aXAI5Cf0fm06VthMpO7+PrrAWnyk8
         rwwQ==
X-Forwarded-Encrypted: i=1; AL+hErEr17Zceo3L4vyLjNzrHUglX2B+dI1SV8ri9bFnnSSzx4HGqCMcDxMpWvktxIrbbOJmpSClhd0t6/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rrQrV7IcMFeD2Xa6oothDH/NsH4oiJTn04CCuhPsgNo48V5Og
	pydZVEDr46BKg3s26TJxWN8wPpAmb5e6aP2kLQ9PkQCFs3D6OE3Vez3E
X-Gm-Gg: AYBFou0C3nSiaPx3cX3pn0vCe1xCasx7Zp8azoSajHSAPLMo2YQbJbxnjDCKQ55gjz5
	Q+3ezxsOosdkckhg/7QeLKo/1QNg/iTIB4Fnuo3ejoUIjF0Vyqz7a24t7gywsV4P6goO1/Dg24j
	Y6PxDZhM1ZG7vZEzID3zRE2hM8KmJcbCe8Qe2ZJGSJ9Iv5srOwYg22xqvUroiAaLrvd3rbCKWnq
	EAiJ1ULxLurWnOEsif0onEu7z9dZq9lhrToWmI+iOv4ztzvWwaSxO+pxpsUYzwcpUU6Std/7zg5
	SrMZl0hk+Ersg3WCsWKGoqbWASfxAqF+8LPfpaUk5D9ZRB97eeF4sSU+Jy7yOu4tbl81IErJKd9
	ZkhUmhsPV0nsTdmAYf/rUH2V2n98a+uDHhnjZgIq3nYRGmSF0GUfZNF3koylRkF76kUVS+/HSik
	OjWfJWq8hNpSM2U+a/W1ukRNletu7Y7XicOEvJRX9qHAaGOFoGZlrxvzTmttOTO66fLZ1D0zahr
	/PomMKbAVsLnuKLqYRVa2abtoHl1mOvvWvtK2CuvnmMRocowZFruqr4OVu8f/Jb8lAJRJAixXSk
	OqKiP36tkqMpDv1PMcD2F2bf9W6H2DcNNYWbSRGuZcexK+5rs7EUTb+Xy9sOF6xQYEogVqIbhSD
	h9LnLfC4WXz5GCUkRWI2KRABB/An4igzfvyM5KWZ8JHynznbHg+qp7JTaJVPLoSIhAr7XV/3Rcw
	==
X-Received: by 2002:a05:6000:4283:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-492781748d7mr4732531f8f.56.1793963379122;
        Fri, 06 Nov 2026 03:09:39 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:38 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Fri,  6 Nov 2026 11:09:21 +0000
Message-ID: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear in patch #1
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2 in patch #1
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear in patch #1
- Renamed ADC_ADRST_N to ADC_0_ADRST_N in patch #1
- Renamed adc_0_pclk to adc_pclk in patch #2
- Renamed adc_0_adclk to adc_adclk in patch #2

v0: https://lore.kernel.org/all/20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.56.0

