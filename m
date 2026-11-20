Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185719;
	b=ATcM4AC5Qdq6casvZOnzosfNNkQTVAPb+69ZRBuWB1AMQeACK0KedAIctBwf3f2opVbB
	 dZxHAwFgFg3fDLA7fiAeJiOw6JyskFOWZtb8Jy5qfcAU0mA5SOfXqVjdAjL1jAhUhUhom
	 SubFMgGoDCviYmEoi5ZgzI7fIfk3WDpoiWOzR3q+3z6VDZ2qLQANlDPzSxMIM2cWK0kBd
	 cQH5m8MJ+S8le1WtUf9kjxI1gbWvGv9UGy0l92sBGNSSXTWw8bADIgT7Mhk2GZlst6OHa
	 CXLiw+VTlTmkTwmWTqNtJ4ApENGceiFwtp2h9EzxPg0/jAG60rH1Z2FcCtCUywVf6EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
	b=YWPyuzdcjN7fhRTGjHmCJslTUpBdxxFcubNG23cVwIluEym/m3WqdVK1HIq+oo3cDPux
	 AX3o5QnJJKmol3guj5RwnCryIh84wQC4rwCXYlR+FaV/St3ZusQEDWQzXsfJlqt/o4Zcq
	 d7IWAYpRPGr69P5bZrRLWru9GJ3lY9IcN2aNk5df+XprYPsh3IRNXesJGGZKJDqKna2qe
	 vpZ/xiSVhy22OBrvUZ5eUO2lnoghIW7QfwxiWjbZc16aOStfBcclYu0DB9ThREZsSIlzU
	 zhzGEdYGqe1pEjfEG6xkeojf3Humtg5pBGq1AnL6hMh8NZOw2zXmkMFTupKvl+t+C5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A349606A326
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A349606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d7791b00so8526035ad.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185719; x=1795790519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=HiASel8CxYyQ8aNgIRv1RIniEER6l7YpmzpLpGMLEl9BpNYU0y5PnV4kYvB432T7pJ
         9ECO334uzemuXBDQIcoE9CzqRJSCVI0HMRbWQBEOcz07Cn/C/ntMETzdl6RnLNpWICOk
         cZj0A//6vyjhPkBc8/HqNLVwQqG0DwhMP+b5FoCoi2HhYiuaavEzAhYMyN6VbOaV90sz
         J9i9meyDcm9UbygaK6Vi9jju5wTig4VWCUPkcyYYFKKdcKEpHQgN5jCNfgQo/cN/AFYS
         H+SyKHy2HziViLJrXBZ38ShNfupCeNWzw7ZkhqzGtxjO9z3ClpBsinxp9pZuy8NjmVZT
         fPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185719; x=1795790519;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=ofYm9nBNIxska6BpCKfYEAMq1xKnNaXvQgHIC48Iezr/r1J4JDxZTEIXHtY1/GXQQr
         vLkyhsZA/tNNHSXydnuLZdMss0Vq0gv0/Cp/S2N540PnKr4TmmYaw8Yjc1rqwri+QW+B
         qAPHfLbsrLSsf2NcLEMK54eR3qMbgMa0pqYcDyjYvoQDxE+rbigQ/jnIC09fxAeYZulZ
         kyi0aGktIQs7SC9Ejz/o9aoD8rx7y/QP77B6ZG35MXL3rsutLWi0FZArED08LrSs7M5K
         29kftlNgJJWnpFXSnkgAJru2s7lM4l0brXQn0oZncgohxA4yegIaR5UpR4lULwxVYU36
         8iBg==
X-Gm-Message-State: APuU4Z/+MYD8sSrDNIRdIHQeXtS7ybL1r/Vox83f+JH2TQMEwAP5Botx
	/SNYuN3koCwXoAUK1C5Ewz+7/aEwiJhCBVs5VZdZwirLNcc16Vlgaudz
X-Gm-Gg: AZFdTZd4ipftCcg+82QUW5oN5YYaIANBoEDiimJB2o9Z2rf59x7A7PLcCI1QUKK7lIj
	TqDsjJRCEwClrnDq0g3wSiq4TMhF16CvceLyft2Z9YLHYA/633YzBPnTJagSa7Jz0WEc6vp/Vdp
	ucnmtGkW/7t3Xol1oVGbW1vTRSXLJwh9bWU0oRb4eyJAhqv+oCdbJeAm9QPGtJ4nSRTGlrKtO4w
	2JDpsgWbl6XJKxSNr7TI80bQ7N1xismjHcjW8zqSnNN+uJvZ1DVh1mVUuPZWQ1iBtSWagyuuFjV
	kEL9tkN3SJQyQ2piB74atGnCGNS/85RQtAJrFlNkRC4Or/GeRjM2HIAO50GbrK1qdhq+wrwTv/w
	g0t+JGm5I+NWFyJpAEvmx/1KRtdxZFCdIdWubNCCGwQoQqqcD275RC1Ps+N9p66xWdZiaaXrZP6
	SHqfwSkaM9/RUH6tBM/4zFctdmQbd5EYjSMwopaZUcPoIX7baQgFwIIrZPlwE8w575F3NYU7k67
	V7FTyyxA8eJFuZ0qSOQQWTKr490WTzG/XRrvJP2AVVhniKScZ++IBYdLQAoo6SHEnUbSdU/GIQ2
	fAx5QPA4ukYxGhCmG2X5NEBbI/8YHWn3z+P/KA8x
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr33951835ad.46.1795185718476;
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] Add MT7629 RTC clock selection
Date: Fri, 20 Nov 2026 22:41:43 +0800
Message-Id: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/13NQQ6DIBCF4auQWTsNQ5WCq96jcQGISlK1AWJsj
 HdvcNn9e/93QPIx+AQtOyD6LaSwLtAyUTFwk1lGj6GHloHgQnItJNoa5/yQQmPMDh+1UoPRtSV
 joWLwiX4I+9V7dRUDa5JHG83iplJZ/J6xpIhIl/0UUl7j9+I3Kq9LIs7/pY2Qo28aeVeyHxTJ5
 zib8L65dYbuPM8f34Co78oAAAA=
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

First move the clock counts used by clk-mt7629.c out of the DT binding
header and into the driver. Then add clock IDs, the /1221 fixed-factor
clock and the RTC mux to allow selection of the approximately 32.76 kHz
source from device tree.

---
Changes in v2:
- Add a preparatory patch to move the TOP, INFRA, PERI and APMIXED
  clock counts from the DT binding header into clk-mt7629.c.
- Update CLK_TOP_NR_CLK in the driver patch instead of the binding patch.
- Rebase onto next-20261119.
- Link to v1: https://lore.kernel.org/r/20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com

---
Chuanhong Guo (3):
      clk: mediatek: mt7629: move clock counts out of DT bindings
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 12 ++++++++++++
 include/dt-bindings/clock/mt7629-clk.h |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

