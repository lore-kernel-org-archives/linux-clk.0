Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D3255E26
	for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685508; cv=none; b=M9jRhuyWpLI2hO9u8PL3DY5PwtoTobFlpszUEJnKNstasl+z/5nq8DjQgN+MHn6vDUL79aBF8GzMGT80ry1pTPZjFiSEI12r/2rqu5PGCsrVfwVGUR3TOiHan97pDpdRxdOcXQo6/hpP2AexCjfYGtrV3/aw8ydgc1k2QqV1d50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685508; c=relaxed/simple;
	bh=eeI965bZjLro05LN9x1g2IrBacFgY7A1LEArY7+ur64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhYxIltaoo6VTYRwN6ZWrX2vFNXQpsCAb5HDHaV6hJIqN7lAlTlkrsQ+KW3DkE5UYG9AU8ehmWq634YAcTOD+VVQxiScWWGuE73aJSC+t3qodCfSUT5cI/rxyu0jwVQu2hWWgwHoQC2l8C6BgKe01DIt57gUyB8sDcwYyl6apMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EiPUkA+W; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EiPUkA+W"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36748920cso3226737f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=EiPUkA+WDAXeRWNUdlerVUk095LN56mFQ77UzQrwtEmfyQLf29XuTNONjW77WoBd4a
         Nn2wWVO1rv2/OPDVUsq6o/KV9trPUtd3Q39T1BzMrdzoIG2Sgz94s4GKysx6uZ7GwLth
         yCOrdhvfBz6RWftkHWwhZvS5FpTxUA4r3wZco9/ckVh/AXSE0NSlzZCTENCEmZqp3HLK
         iEUBy+g2EzVEFmbfHZ+SGNeYPjatGnelUnzBQ6ZNELINhqWqWkAVtmdHmptprby1AKan
         JpqIcU9ONv2T4SJIPZcZfKVkNnrpgrG1eiqpTYldNyFLY6icFIAVrRoxoLy4bQR4oXNa
         2HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=AnunCokoN2XaySMOkBwtkfzXmvdFrTYUdOkiPklsupP0+WM8A7FweQVyPEjXZSdqmx
         MEvN4vzZWv5xX5aZQpTqNiwxHs4oRJWTMW2GHEa3Oqyk0B9BJhzTT5CIk76Db3SUr9Zp
         EnRDI1GnVCTsB5P449Mv4JuxewyjsR6M7CmotZ7TlqzwImyFp7SEBp41+gZnGDnrzdJ+
         JPiTk0Kie7Jwgwp0C18TFKyBQ5bz3cFlgn233FReinQHaJOOy6ouZosW/5spIAwLxdqd
         dTt2guTFiCaJJcIUKvxQZSxMuH3hLPCHrPkFwY7Qir2U76Ls2SoUaTLEUhCNzJ8TtkTD
         2j0w==
X-Forwarded-Encrypted: i=1; AJvYcCUKNmT4D+fFG/A2rbJrMgSu4sphnEETrNhzrkwfJ5txeE9An4W6dVqKx5hqeBTHGguke3VLOPRXz3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAEDjzCwmBf0g7j5/JqbCaMvtAuSnusYlV2xklmvwu2Qz8vxgI
	xdoR7bBZ1fTU7jVF5Asky5V/nV6lHfku0TM9ipzYhVq5ZgAAIj+v2+QHttr3fvPRmFU=
X-Gm-Gg: ASbGncvarTvPXmK+0QxdpQxzRBEQRrXNiY8Q3byBgV9HoyHdf9N5ppxb5TP5OvH1qfa
	vvkslIrpjDaa8U8gyjDUAFgEFzvWDvpjiCZ2PcRQmVEdGlSCioWI/pj+1+gOZ3aoF3K8GS9W/Bu
	tUUooI6eprHilw70YLnMEAOniwQfIJKelIU1G0194YvMuqh8PmqZkSmDKekmGglc6PTspeypAJg
	1zZUz0rvnVFVULxQw6MNrN/GmuzzntGlF+QOL6F+HHlyCwE3QXWdLyyxaFhrjjrRtv7++XEdCKL
	hu8KOO8fFiMLiah+pIO2XmBV3pkH4/7ktPY+thC3z8EE9CNKOCVMNFtB/vAgH1X4
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome
