Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8F3BB117
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476757; cv=none; b=Ki0UnWChE/pZJ6N33LBnOQ1lsP3Kc6j9kzM78fNsgZoLuxGl9Uvi2zk+gQs7U6SYEcdRkjW4KkkcaFQgWPKSc4bGVIVv+HGFLoYV8zF97EpUyXksBX0UjmCPuJelwLtqX0oFc3jYeKshCqnhORduMRanbJHKes8coWCb2IQxWAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476757; c=relaxed/simple;
	bh=7t0Ob9QL+Lqj43veSyZ1VQ/kSUPHAcWqtSh+yfu47sM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Bwl+m3KV7EF0pK8PEz2skhiY/Q7IAM7pdKnijYu5SAwjcTpXElhuDj7jQDdxOfyScZxPnddQS5iBtv7KXEj99SwQrG4YpUWm5pTmh5xcFlENBxD2KSXz/RBs7OFJjODN+bF5enjKWQeFepHNGgOoWrp3ZBaHuiAyOhkkEpiejVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7Dr3foY; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7Dr3foY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso548728666b.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476753; x=1790081553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMhbkaK56jStijIJwruuJ1OSsbc7L9grsNYLwWglYKA=;
        b=e7Dr3foYNUiVKDtNfkO1Jjpqy75RXD9879XNYDTVRebzR6WkMxaGOlwjyLgXcrWwZL
         aIeaFiA/S+mE6Xfe+0SHz+u+x5rds7bFpOeQtjGyf+R7yMLXjA3zGwaR0lnYrBPbP5hl
         caQ52KaV1C/rThNHiU4JsApOPmvlR7YIPLnRRV/WJuN10dYimIqUvjzM3Fd33dDFT5RD
         Z3BXQrONJtWatFbNbilT3+o8MvyThqMdVsGQT9YFBWshwKf5zs24shvbyypTDZCOTbz6
         3PZEsTrF6y/iGb72h2XPfyEXgKSAjWIaq9x6ltdFRIXSVOGvW9j1UYly7fCw6aFFalYK
         g+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476753; x=1790081553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mMhbkaK56jStijIJwruuJ1OSsbc7L9grsNYLwWglYKA=;
        b=xqwSiIV1J51rR5XzcmiCynGrlg7prF3uds3duTPu/kvbpZWCo/WieLxd+3nz80ebXp
         OpwZZR0sOp45IOyYDGf2dNNAEyWO+J6bOoVkJO7tz0LenHd9Gt6XaEAhGJ0afnlxkUf8
         BxDh5kdOCxJYWLjZhij3L7TAk8CoUYqpf4BQnoaDTcRFA8Ca5kiM+Q4G8BWZcuAGW+6O
         K6jPggpaN289pf+wV9K/cbQgaZtxxkHirsT0AQkNekiFuacSb3ostJiafhchucgNxjNx
         jTKISHL5txW1c78s7bapDosnbU9fL5/3cOwnX61NBaMrjfgRP/u9NPn0K7GQCZnKeOLS
         A16g==
X-Forwarded-Encrypted: i=1; AKwUvByLxBnZxpTkJAsF7uuKSlz7AmQKnxAhaKcDZ80nDfcRg3LiQXoGMwLrpExkbdSAeYr/LOdUEERIfSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lWT58oGkIyPDVVh8viJwz1byEDuGmFKRcwGca2USHTGr92jxov
	MyKdVQBesbcxnKNHO46pjwnSNoQfrKMq7FmNMvhLZPkuevMaD+EYgN0K
X-Gm-Gg: AYBFou2VlUvlJRABl4uGhaJu3CrmacRBAXQmSb4hbhgy0FaPHbHTe1Cc6reUCz3GG6n
	9ha0zKGnxcY01tc4Wq4owAnBCywLWLCBSj5KS3hFIXjep+0sOiGjSdW8x8Nbm6u/wjPuasaXWCQ
	qLEHgV2v+pNWWLYDMEPcvE4Oy0pH1GKmRD1hMrak7VZzyLKyKGicXgiqEClRemPDM7QOMYn4Uo5
	/upDVOtGgFa6WPCxUf/09L08jPsLRTjPerBTOj5jnsg2SfFc2t22A6ozwHk8wjCnjxZz9+MzPnG
	eVXqtAzhLRtyOaH/0wH1wuBy8/nvoCRw7nNg34mOeMHiNjmtVu0FS7ILxUX6+NSClcGQ2xDMnOe
	T8iebHKK+FGNa6dYuzzCSYlpjdh49IoekCaxykwvU3XY39PAjofnMos6LqKuT4g23vc7k2F1Jev
	LK/BHk6lyTEVs/qL2GdsnCxPmdMRidcoW4quGEu8TWJ0Lqb24A43cJwegzFyS1he17GBm/LHbqd
	UIQ6K0z20AknRfkEj40oX7uCEXFF1eXaG38CAMNWIsg/Usy1aFH4JNv5TWlaGsn
X-Received: by 2002:a17:906:c103:b0:c29:4357:2321 with SMTP id a640c23a62f3a-c29b8600014mr462144366b.1.1789476752775;
        Tue, 15 Sep 2026 05:52:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c296605b9a6sm587969266b.25.2026.09.15.05.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:52:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
Date: Tue, 15 Sep 2026 14:52:22 +0200
Message-ID: <20260915125226.20579-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a split from the Airoha AN7581 USB PHY series [1].

[1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/

Changes v2:
- Rebase on top of linux-next
- Add review tag for Documentation patch

Changes v10 (from previous series):
- Rework if condition and reject #phy-cells for
  econet,en751221-scu compatible.

Christian Marangi (2):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  clk: en7523: Add support for selecting the Serdes port in SCU

 .../bindings/clock/airoha,en7523-scu.yaml     |  24 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 +++++++++++++++++-
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 4 files changed, 248 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

