Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F73F9F2E
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725615; cv=none; b=HQhtvkDlv3L79pMTzp8R84wpU5Jgso6hHDfUCncY/c+YXt0rDjxNrmpQ5WMY9FP502ky/hRqC7tolpgO7CwgTfJcTCR68tzNA7bFLtLCEjBAMz0bbx/AyBUGJAHD2fJ9FQCKPbT60zMvbUfMuOfWoeDAm1t8zF3P+SHTrUAoHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725615; c=relaxed/simple;
	bh=/R88zq7r2VvYaiOH9CDJymccIC+wfi5JMSmk3Vidz8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gfiu23veHJFeErKw3R3P0tr+ZS+N3c/isJgZS4ZXQ8egZnz2K2BT5s21YF1klmtn0jd3yZg847OdkFsfG6cPnPd9bdJwD32rQ4PeVTi11WtbNuwLuzYb9zlUi2lpRN6N1/1qREopoHa0iMlfsP06ZRqWj8QXNX2pVYXBqJBWJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N53vB51q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N53vB51q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4745492ed3aso295656f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782725610; x=1783330410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=N53vB51qKc6+02HN2GjHNwAPUdNAob0eLR3CX/pnY26gfvBDCN/SNjptmu0G/EWNYD
         ME6WPGoiag6l2zu8nrLfs/vZ0CS/rioTsyH1nsNP987YT1kgwf4XyBaFjkhkltMef9lr
         p8LFvRyyDsMZ0fSzg/efjKse0xvk5lDL1CLhtX7jSsQMwj0El8ktjaudoCc3sl2iL2YZ
         2124sWN1Dfln1yk1zwzXDJIb+/ynTHqZI5WMyPujgeju7qHAwkjCSXIZQsm/UdHaVWUd
         Dm+CMbfD56ENROT82VZ7zktHpiPR528fGfsMDnFi1idGvKq2sg3gK7QHaRJtw3+o4bHs
         ToSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725610; x=1783330410;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=ILxD+G4z22IhsiI+sr73ghyr/u5cGLVnGz1Umy7uQt0iRQXVJNj2vG69f2Q88la5fh
         upzMR3rAkx6F+ytwdvBZ/KyGTmA0F5K7HGnuJvsSi/5DfVh3clICcnbOWHCty4krlUs7
         hqgC85SIWssLgw/9cZNJrrjE1Cm3LmPA6i6581w5paA3oWasU5yg+sB/J50FD3KgLFOW
         hx8VpwnfBSj/gkxsw+1eJPu3+mYKvcyMsO7yDZLypLMqRDU560d4rKb+YsIfIrhOAU9F
         49l+sF8ge6uDhjjk+58ZnXV9m9I4jPE2Kb+Mrt6vTJzQ4ooAg6EC5rd78xBCg52vRoNM
         xKOw==
X-Forwarded-Encrypted: i=1; AHgh+RpQX1C8B/zD6tN8GUkIZVF8bOQmAZLheRK/W53g4MEYq53SPlYhn39SR+V1aYSAuq/PN13p5UJ6Tmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPh5zOMtmbsNBkXh3rpQ4NT0+ctfyVHQWOIs/XfOTmsrBydDC
	o9Th5b5cSJ1Ui+dWJj4b+rcPino0f4OgLgBpzrZcoSvbdLD+NTJhGgInpedDGPMhvZ0=
X-Gm-Gg: AfdE7cnfy7MIePd4WfZXdEHM7Oj/ogizfqm/FIH7JdCUFqnQmMs6mOfT1cTd80/lVRA
	Npoz3ybZ6UIdkwT0Kc5lNy+2Xk2SxC8DAPK9EaK923YVk4ud82AuQHxBP1J6oSTsm+nMocyn3Ke
	5mfCqNhNGw+Unk5//FYLD3tsq/fNDNn92LMGbTzwB++CApkdrUIsPSqAuwhIjySelGUuvzR7ZqV
	+u7Gmu9B4670p1xjs0sXf15Wdx3yBq/+YXk8ixnqUer0kI4a7lIdfBwaBpsV80hZbwL7QmDqE1A
	fgElOOSmDXAnMbIcWz9zmX68W3xXT+sDscKkpdRinHHAXN2o2rErcGSKvLRHr6amW6JqVAVt6Lk
	jOmp6pMdj6f0Ytu+Bew8Esbd8MWxDuW0H/nkNIq2QIGmS3TTK4ybkz8K+h2L1LylAsfZOkec+8F
	in62u1kxzzbPY=
X-Received: by 2002:a05:6000:46c7:b0:46e:5c5d:b2cc with SMTP id ffacd0b85a97d-46e5c5db779mr19780582f8f.23.1782725609875;
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46cf775a4f0sm39251229f8f.17.2026.06.29.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>, 
 stable@vger.kernel.org
In-Reply-To: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
References: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
Message-Id: <178272560746.2490611.124390800107278004.b4-ty@b4>
Date: Mon, 29 Jun 2026 11:33:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
      https://github.com/BayLibre/clk-meson/commit/628b6fee9fca

Best regards,
--
Jerome

