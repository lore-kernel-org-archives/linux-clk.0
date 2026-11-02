Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653656;
	b=W0iYR54XyOzslrvL7YjViSOUtt06k2vtkXiqadaU/nMjpmo28E6ZI8LaTOdHJ1iM3MQ9
	 L7FMsR6Z7Z0Wbl0C8esxzmrd1Uaf6i/i0drINQiTvkUddCtVO7IU+QGj6ArutTzhR/bKh
	 1+J855YII54QOE5HIYeYCSufpOiJ5d8JCMM2XjN53S1indk3rrzb/PXmneVot0884ZHPG
	 hNuwrAsar/zG0wsoz+KLaiG4BB/vPGTE1MmtTRySvksnqmXp6pTk1B9VQBWY4JE3tfvEN
	 6fb4O0CjuQL2JNnClKSYcPjzLQYRyiV7/Wtg/QbsQAHE2jxLyM0nuDSuDLQ5ft8hW6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
	b=2kxxlcIEN/h1ekn4CkUiuWcXbgQ5mLWLzyI74zsNiv4i6LHSFjA14drALsOdAWuGXfyK
	 +06PLEnHRWskplaZX6u3UPENa9H2vlqk5XZM7SJkmx/850VUGSYReDqObs1fnri6MlTo1
	 bOYnhvFKWymCA9XD6quk3uwyfcU5mVcF2n8rtrKeGJLJRR+kcWKefo/MNqPNBuSnDcxMM
	 qctWUI4U+qJ8eqHXcFu2xwQCLszYHOz6AFW33EE7LHNSTcgHC1zUF94KIU9PsU91OWQaR
	 bHHlkQHAWiRZD1gX6zJ8FFGWCFvYecFQmUPVXWW+ZamE2mkrusBTDbTuuhl0ikCLM/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J95iuE1e;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA37606A324
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA37606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J95iuE1e
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2795244f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653653; x=1794258453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
        b=J95iuE1emN4u67AhxNrJ+MCVmsKuzIrXYeEv3Wa877KjUoe+996S3nBs9dUqHMaPfB
         KTBLowvPiSgDYDMUWynCYxaslvP4szcoaYDTCUoV33GMZ29iarRkkFWpAQC46fARh5jE
         0F+FVIPzGfQqP9qWmFI/ZdSNsoAQF1NQGg37Mtcm7gAdEsRyT5BrQXnk869p44jQCrPc
         5G66BLQu/WZZd9rCyf8iHVfTE1WW8S+5nVVCbwoWfp4wjBnnB4S+JphXe4q4V9+LE6dm
         fsx2XGECKokho+XUwB8g3vphxpgCF3l+lEqcPT22fZOLW91s10TJCS3UX1LRSPwfwOFR
         5AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653653; x=1794258453;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b2vLF9RcVkN6cfLMLh4ULuVTknCF3Xevt20oONWX7/g=;
        b=12yhsQGp2k4h7K9S38Fstb17chYYGkaDwx+DlsWaVtVIFAi9zQ+7Ig/7Hg/D4vz2JT
         yk8PARNyvROhMJEaoWDpmicO22WNolc6SpxFomxJ6nfzDs7HhQQJ6ZLPqsIkrqKxglF+
         VxKBfQrD0C8f3OwnRz7Ck/0YZ1MKJAXIaE5qeuOAp3zlQEK1g8JmrUBVOmVM1JERHiMa
         qzO1MTqu0hAiyixRcOzwAr61pGl8/Q2WMpuSUNNZy/pVFcWBVCgHt9rRhQ6tQ1sAPIz3
         2LcvtrziRKsLGj2aOSFwvGaqr+owU5++11zNSregxvtaLrB0NMaX4mHkG7D4faAKDeTu
         1GuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdt1tU7jJY2j8XGOJGoaqvJiRJW/LD1ZhtoafFSVyCiWEIZMAkpFne97jZn0KeupprLBaGBC4o6Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P9gXTj5razedNO4WzRz10GzwUxBR4vRnGPew3sAZV9MEvFDdf
	58/Uvny7pkCIXykRINV8SrfP1e6rOC3kIRaqV2k6yD8Kq9bX+qvEDAtn8Md4JLutXJQ=
X-Gm-Gg: AYBFou3f8I+pCSdhCFxMGAjx+YmNfLAz/9pAf6e4G7HU/28f0BVkqFILjhYDJoiE0e1
	ok6gAH2Y9B1BeAE829CXyZjW0GjwCbJN99t8Mdgz50qP/43HNsZJMC147MDVtslg6zFbtO/awf1
	72wEhIeumS6r5HRLvE6mmslHKtetoaEqVvftLGWmnyYg4MjZ92wtQDkTUwx/1TrAQoYePIt6v4o
	QwIr6YcopAEuKWxYTxT2uc4JVumMWQiLtDdgLIExKhDIil5RqDOyGfGaGMlOHPNyymeInhJKxHP
	obzhgT73YYwlLwN1sZ61c3X+3+7+XQUutE1oWYTVPLN2m+4PTQG5q15Av2/wUSNNuDs3xBRtP2N
	WbCjaekCXuzfBAsNUz+8x6QWTAtalcwQHh8CqQI0fHUyv0nqEpphYQuKRxk7vLEMSXuUtT+4MsU
	dO2DRhhjJp6YjZYKxCQRSnMytgMNQrUC3KWqvksR27Y/69VC/E6apGEG18KpqeYujDP3HrfQM5T
	mIEwniOVDuivkxZlu1iGtl7XFflipBqEqz74Fev8bvLalFDh3N1hJPd5pj/LR36tP7asbk25mai
	frgSUsuR+si8D3FkBvjAtsIDhrSn87IAbhjH2TKB1gtldbtIutDXBOLn4+90zDcRm4INEqMVjq/
	vNztf+eV0A4cKaW8TzQ==
X-Received: by 2002:a05:6000:41c3:b0:48c:4658:602b with SMTP id ffacd0b85a97d-48e6e4f5605mr24195118f8f.10.1793653653017;
        Mon, 02 Nov 2026 13:07:33 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:31 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Mon, 02 Nov 2026 22:07:19 +0100
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJraSgVzEsajvqAGIzU4gJ4
 e5WXX7Jy/82UBImhXO1gdDKyq+5wBwqCA8/3wk5FoOtrTOmtrgkzUL+iWEaMfLKkQQnL2UpPpN
 i19rGtZ1r6HiCkklCN37/Li7937pcBwr524V9/wB4Qm7hhAAAAA==
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 resends his v1 with a
new commit message. It uses the existing DIV64_U64_ROUND_UP(), as
Stephen asked for then [2]. On 32-bit, the rate fits in 32 bits, so
div64_u64() does the same 64/32 division as today [3].

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/
[2] https://lore.kernel.org/linux-clk/5e9e776db6628d02d7081292b81ab102.sboyd@kernel.org/
[3] https://lore.kernel.org/linux-clk/1b74d2ea2c3a458694c4c74f2381fcab@AcuMS.aculab.com/

---
Carlo Caione (1):
      clk: divider: test: Add tests for rates above 4.29 GHz

Sebastian Reichel (1):
      clk: divider: Fix the divisor for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |   6 +--
 drivers/clk/clk-divider_test.c | 117 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 5 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

