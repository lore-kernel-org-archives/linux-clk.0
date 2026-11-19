Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121413;
	b=DMNYgVdncfxvTA7wPHzP0KOG5Ifz28wOG+fk28pHgDVEnvNCN81/B+jiCGY0hg05ac4A
	 dG4vGVJOBjqhl+6/ZG4ZiVy8R0xclnMI4f3maOPY7u4ZYZG+gBQhTYy4+S/L5YO4hKaMN
	 NCp5cmzBBJ+zBbVG0Q/GpvZ+xG6FFlI4XJDvAr3AcrDJqSKyGgdkwvtVQCV8CkfwErpEQ
	 THBd8aUj4cZWXedUDSAalUuJ4qhrxMaJZwqOr15Bz3juthb3a3Mmoe3aT/ofhEi7/s7wm
	 d3FiPs2vAl2b6yo3JohvhfduKn+eBhZyl/DcOFNbKVkPuXFUJ+jzsXQPLNSTQl+raVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
	b=lEcaqVepE6Zmwc9+C6opeEeNtKPPIE1CDLMuONh5xqDVQlM7oJphDNtkdF3xthlNQxL0
	 cCp8cpdlkielJ7zSA0j16zmbuUEA4mSnrWiZCki2vE1UeD0fNze9dXg8s9Qs0QXtskh1b
	 RzPhkvaSm2iZgWN2aqilhZHeRuPh+2eNqpP8NTW+HoWFy0qMXTIbouS1VizwoqKRasD4f
	 nc53pSf0enQowqsNtK8/de3gCDXDLPNpcepQw2qi92n+Dbw4brIVy8nDB/IzF+vpJxEeQ
	 v5QDG/k3nD4bri/opPIHUxW+kbZkVXnUz12m22/BOddsf9a7GJ8Daq/QZjMBNY3/Dsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HRhHZgt9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D4606A337
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HRhHZgt9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso114693f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121411; x=1795726211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
        b=HRhHZgt9049/cfpCUDey63TTQ8U4Cv27ADHsdIdF7wWcRekVVgbr52c8y3LovUE4kj
         Xgy+S8pHzfKrQikmk5NOT2HfU9ltsTWO3rq0Jt7IbyrksODBTYIypIgvvlZe4eljRTIk
         jbuvkPnmfcNcmu9BYE0v2N3/pj3QorPTtikK4or2U8scRjsnGYdnenEvBCCWwvXe0F3t
         Kkh5fp9r/9tZULUV5fhXy/VSXw6xI3DFrR5mwt2ozUuZoMzJFB9tgcQXrXrOOc6T0IM5
         S928niZuj0e0T76/d/iKyCwqczIlNR7BdjVYMO4vSdKtHruGh1KNCDZBNyCxBFIPCUsF
         aj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121411; x=1795726211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
        b=rttq9TxfgCdk4A/E+l4hZhPPzYhGrwfK0Ihm+YxmKr2kxNkGgNLO9BhzGcQWHTKFcP
         Vz3Q451EG/SpBEtW9oGvWy1AYJ9re8kL5JkkzXQBaCH/Awr6YDly7PgZqXEWi6IRxl4A
         UdOs9zVwKdbAC5x4iRjKk7cwuOBPjLyMJybqR4eYeqPQxAQmbbSVjmqs8tc+PROSB9Ka
         rfWkqRrCgV2Wln5/bCnTfEc9G08/f/wrVptAwInvVCfwCMio+QkBHqXORdVvo8Xvyt2l
         V+j/AP8rm9+UxDBHG5i25GiAIjxYaO01ZC730SvxyeeCoOL4SPkm70bUxOAGdBQGJLDa
         eA2Q==
X-Forwarded-Encrypted: i=1; AL+hErEMJJxa6uOeP5UZ9sqQZDFHdQNuZWtEO4nn9AGELxUqnRR+aPpiMGnGflWWAcojZ9gSG55M99tKOJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7n5xHTckR+nmRLtINUzNS1cK0rJ4NoXqayEW+rAJW4LbMQUtK
	t1tL7qDImEGxdBMIFLPD14gOlIAlz+WYD0YAMxc442I88VvLS9DQP+CLw/UHHeRPJDo=
X-Gm-Gg: AZFdTZfMF49aZwQNMsmjtOsSnQsA1eIqcZoK9QFJkvRXGkMpTvtvIr2CYHbhqkP4ONc
	sZXeNtajVO6ncw/URHb+jpSC3Idl4Mt2EcnDuLligFsgEJreKlum25w5Feq3ln0yuxMsFzb3H0Q
	MnHHDF6i5Y5uc6VEMC5bCwWi+TfXRd0t+phqHytO4TdDRhRPik2aPdu6Xd1kEbWcUwZFaSu4EJS
	0EdhsxAI/i4BUs2Bh2G/mlgH8jh2SnmTXsCrPRKu+fUpzcB+qx704oFFT2EXhr1AjQTauu2CPzs
	glkEKM18ovAJzEPKXRHLAq2jXbJUTtlZUBUNSdP/WpI1pQ2HqwiS6uEjLgsQccXeomfweD+B/1c
	zx782hstpX3NMJ8P0V19GKUSxvfttUwHoecYhaLICT4uFZpQjH+HGwFiqQcqvzKAfu6Ts+I5trw
	CB+MyLOqX653B/3oYKlbeUxJD8vo60G/qdVHDsi4mgnB7MCOkKCC++6iPuVKjA7FFv80tB9EPuw
	8jLJEEXs+c8ZhdU01dyDk651vfTgJ37Q8nAzfQy0eCKE6LEKaw6KlpTiibK+m9j4G/tZuCK01xp
	z+jX9ws3PHpxOHISJXRi59eDWg83ahVyw5ZgZlYoyI1LGBa4zdmmlYNObzxAabvbic2z+TSnGwA
	FugJ5sQzZw8YyuONKOg==
X-Received: by 2002:a05:6000:4812:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-4abb57f6e95mr1093403f8f.49.1795121410672;
        Thu, 19 Nov 2026 12:50:10 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:09 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v3 0/4] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Thu, 19 Nov 2026 21:49:30 +0100
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOOw7CMBAFrxK5xsgfSAwV90AUtrMhC/lpnVggl
 LvjQIOooBzpaeY9WABCCGyfPRhBxIB9l0CvMuZr252BY5mYKaFyKYXi0xBGAtty31x5iRFLIN5
 YSkuyIwRuCrXJC5NvQO9Y0gwEFd5eiePpzWFyF/Dj4l0WNYaxp/vrQ5TL7o9clFxwcLIQeusqW
 6qDs/cGHcHa9y1bilF9OOUvTpWc0lTaOWOME/7LOc/zE8X0Nyg5AQAA
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 builds on his v1 and
rounds up with (parent_rate - 1) / rate + 1, which does not overflow
with clk_round_rate(clk, ULONG_MAX). Patch 2 fixes a division by zero
found by the new tests. Patch 3 stops truncating divisors to int.

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/

---
Changes in v3:
- Add review tags to patches 1 and 2
- New patch 3: don't truncate divisors to int (Brian, Jerome)
- Patch 4: also test divisors above INT_MAX
- Patch 4: round with clk_round_rate(), clk_hw_round_rate() needs the
  prepare lock (Brian)
- Patch 4: run the power-of-two ULONG_MAX test on 32-bit too (Brian)
- Link to v2: https://patch.msgid.link/20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com

Changes in v2:
- Patch 1: round up with (parent_rate - 1) / rate + 1, as
  DIV64_U64_ROUND_UP() overflows with clk_round_rate(clk, ULONG_MAX)
  (Jerome, David)
- New patch 2: fix a division by zero in round-closest dividers
- Patch 3: also test the maximum rate (Brian) and rates above the parent
- Link to v1: https://patch.msgid.link/20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com

---
Carlo Caione (4):
      clk: divider: Fix the divisor for rates above 4.29 GHz
      clk: divider: Fix round-closest for rates above the parent rate
      clk: divider: Don't truncate divisors to int
      clk: divider: test: Add tests for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |  93 ++++++----
 drivers/clk/clk-divider_test.c | 394 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 449 insertions(+), 38 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

