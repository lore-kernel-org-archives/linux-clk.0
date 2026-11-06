Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964756;
	b=PpOIMAM9ZcE1iKRHl6g/j7ZlntzkMP1WgbT6EUyJ2VEcwtV/Flu+esEMPjnRx19c31Xf
	 rzyUP2uuu7yxpjNwwsmgavV9xpLr3+BIkyXPO93shY+hkr5GqNwrwQLWhX7a/3UVezte6
	 LumGAm2+SOjqRWoDBIqKndjlG7qoe/JjOwsJFeeg+17gr4GDqGRGkF/sNBEqTpktHWwd3
	 rpoW0CpMNEY9/o/8hERKKvW7zgAla5ZkaKnYZ5MNJCi7MyWHwPWsYYSiq04L5OiCj7/NL
	 CwoOH784re1qp3Y8uED41WCJ8Kdz5lglUQzcBw+A3eUoln0sdLmccjCV+a33Wu5jOWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
	b=BPedp1AVzjCoVLGaxcFlAekWdeoNFGjFzTdtDBoTvkAKusD0yQfL/JwAVjDKPBjG+a2E
	 AkUPVPjeXD0BfNnaqPgZDyRv7OO1WhitINQZbp2Eidq0g23N7viHZE/97Q4lj5cMT6+/U
	 7jk03RLcyFrVfwBevr71gwKxuiPW9me4Dd2TwhIMq87PnUbr+FmIBOTrJV+KAx0X0XGXe
	 XhYJIakiKkT4xLtcgOjrHX/+ATUHkcAjabmFNiNJql+F6kAXtMel0WP+Lk8MB9XqD5BVP
	 DYc80HJtwWtSpPMtZuj225MRQRAJBTvqBtaby7yCh960UQNmCIGLuXSZ0Kmcm84+VUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/j/VoG0";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5A60A262A
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA5A60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/j/VoG0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so5411855e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964754; x=1794569554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
        b=o/j/VoG0Kz9bRK7eA6PJoiXwFDQJVm1yjK/TnARbK2bUS/WJqiaZJcqZ2lgUZiLW/Y
         HDyVieowf7v0kAUVRn/jPWCAxMF3jiZzQHeCuI9zONuIjAPNq65WqT5Dx/cqZNNfBHcp
         KvPrVqkIvi9yJAwwnW+AJKUxQuWoJZRtXZF9DSIonGIrZuym+mWLIwdbit8Az+kSJ008
         AD++GY50KCGdlo2ojwyZsVHPhbJCMaGkT6ELgVSutk+fnam43nYikYtu2M9/hXGomXXY
         IemweuIopL0dAAKctMSe9blRl5fFMjm4gjORpwzRAhJ29VW8DasindMbqK24/pCriPXm
         C2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964754; x=1794569554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
        b=0tLZpiu+C76iRDi+Tb9ionMavnRFITtVbXnuMwt/I/t6kEqiS7m0/rd61vl3Xf4G87
         yBrXMoO05I3dR8dMmC0mPrlblt77Z97A2zwHJitN1zfaka6lJPEWvUqs3PShTZFFuaPh
         qxHSFWR6SbcY7fUFNbIYtgTdcwD/NDiluNIZjz8WYccKSPPAS/HkU5k2mUx4LlNeM982
         CbY7dha9Qli4S7i2dfvHY0itREHqB4/f83GuPGocxC7UU+eab7T4fohafUDbG7Whv8Dy
         SNCcmXCWacuscKAf2irWwYYjG8F1crr9mncX6UQHuUafXoDGv4CiyDKqRSYYKcrv5xzZ
         9Dzw==
X-Forwarded-Encrypted: i=1; AKwUvBwuD8ubnKpnqSN0ujT+fWqjbjvdjUaHTfPDDmmTraO4pNxNuG4Lzh2Sd5HOyk8ifOP1rY99ZNhkFuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JAVUETYp0hnNysazuBQKZMAm/9kPHz0/LaQKOll1Irwk7jeDY
	mrRiyFeIicR2S4GMqn/5YSi810WdXkkAhRyn2We7r1Lp3ug0fa2whi8S
X-Gm-Gg: AYBFou0rrJDlvHJukdS60aTc3uCS6mydtu4vdf5G4H9kkw9VEZMi+hygk4oep3fZJTe
	PXWuPywcriyUcYzdYHqOc1aLl2AIMV7PO4eXwj2iMWgDLDbkgXZTKo+T8FXBItjHzsacs2T9caa
	6wwKXYWptV0QMwvfHZdnHf4CG3/MH+KCDvJauGHFO1bSrE3STUY+Ux/tXmC3e+xgJF5nE7JYGXd
	M/joMkOF4zjdV52j/7nRrOAx9pWIEo87CVPhtl6jnulp3BbdAVKBLnC9sDgnVMyJnHUc8J0XvvY
	X3sk4wMkQ39fkgPNkHqXTe5Avh3nHSoUZoKVdFvP2vJyeyBf0ZBQ+ChEYQAezF+hd4AJvQ7PMQt
	YQX/lHfYTN0gTZ6Rnyypdn+z+joorkeIUVT7It8+7kuYLp23jwlJlw5EjFcnBS65SA2Zq+1EQyG
	kzC9n1yfI4gBwRrr3bo4Lk/Rn6YG6qPQ0B9N/3g7rflBYWPAHHWhSO+m8fJs0KRoNq16wjrYQ2Q
	HI7oP2k/zulWkpSijVBDoBpqUPawpM5rf7i2CUKqWrnJ57Yy9LiorFdTM7MCSSr4FunpXxAT11e
	ejth9AFH9CLryxVfOTgKZJqAbmZey99GYVSQAUvCx40fLcKdlB8PORS6hceifv+0B8nU8E4KQR9
	eLmZgOdi99kS6Zq97cvTUy0XH58h/vr0+EA==
X-Received: by 2002:a05:600c:4e90:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4b6df21362dmr38701455e9.17.1793964754034;
        Fri, 06 Nov 2026 03:32:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm3254280f8f.29.2026.11.06.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Fri,  6 Nov 2026 12:32:23 +0100
Message-ID: <20261106113227.182324-1-ansuelsmth@gmail.com>
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 301 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 281 insertions(+), 20 deletions(-)

-- 
2.55.0

