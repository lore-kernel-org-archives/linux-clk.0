Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675759;
	b=j/IgQyFbkzTVSw/3kvS6rHR8E9EGL5LVOMKKh4AJMf2gAVaryeEFxBGQA+LsBuj8S8hZ
	 12Qu0I4BcZSWdQq5XgKtJCprKmUL8dErxVZLm/ELuHLd6oZCyD7UDEXzYE3R1qqCnUwQm
	 zM6Fs9JaeiVUf2LCf7fW45cD0M9W3E6rTQV0GNNSPaSTcwV9V+Q3mKScGsZIaQLrFSOpZ
	 FoKJurgrf5J3py0CnIb3PGhP7/XUEza1aZoX/qyW9v8sDFxycnX+/KI0ab8+qm/4i4OJX
	 DzaaV+sK7bmt1DQXrhaQif9K6ApygLCR60qBbgaQhmlUug+5wR3wSy+UTM2vO96ISjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675759;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ALDZI9zzoGK/EGXlQh9cjJVsMiJ6Nq8NocmOtDE4lVY=;
	b=QN6Vsq/kJSpKv5r34z4WxCSiFDUFAFIJ8uLuTvGedD5+a/BZylnWIoBUPF+LoBNN5Lp7
	 mK44wpNxKxsDKM2c7A1bNDYBJKdOzhEkj2vw7/HjYmcJ6IZzR8Nc9rErYOp8jb3jFPVm1
	 VClexBWQM/n0AJhm4aDTZIwtYT0+Yepm2qJmunjh+uR1rp08nJgEfkoStVMqLPUcdc+3u
	 empBvqnAuX+8FoGsGR9uoP0XQEnj46fzFvetlsV0BS+uQjhOSUalWNNP0reNn7BnC5oYY
	 cx9bNfIwUmnBGtoCve4tLj8PBCqN0X2EXaAFrzeC4bwe72yriNp61F5IE9pHe1gu4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TABOzGOx;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF4606A339;
	Thu, 26 Nov 2026 06:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAF4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TABOzGOx
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2FEC3403EF;
	Thu, 26 Nov 2026 17:49:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALDZI9zzoGK/EGXlQh9cjJVsMiJ6Nq8NocmOtDE4lVY=;
	b=TABOzGOxi1J6AGOAfDZT/+WS29Uy6C2yZftVVmKrm7PTlSkOHLK5XDikYwiChl5+NtFTB0
	mt0gXWk/t4zEQNHNWaVInTVHmJl3QW1DO9vFAGNlYe+OHLoSt5CnH6DUmOapf4kZwqZN32
	OQ7A5rQ7qg9cdrnDajTtt2U8pF9kFby03TKdzdcVeFZdkIGrYOEkfqGyoBtk/EBsijjNbH
	3GKgc8UFZntRHQ6DXwfGwE+kuJD5mUzP+eMacK91Unn975VSCFCkKCse2QzBC7lQLIOxEk
	LcwirsXbizh3PCuS5ug6Cw3hTcqfnf1a2GYvF5pXoA7XFfKRRGVoxZc93wMlNA==
X-GPT-Reason: This is a legitimate personal/technical correspondence
	regarding a Linux kernel patch or hardware driver update. The
	message is sent from a known personal domain (alastair@d-silva.org)
	to a recipient in a technical context, and the content specifically
	discusses hardware clock frequencies (26 MHz crystal, OrangePi
	4 Pro, DTS files) which aligns perfectly with the subject line.
	There are no phishing indicators, no unsolicited marketing, and
	no suspicious links; the conversation is a standard developer follow-up.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu, 26 Nov 2026 17:48:50 +1100
Message-ID: <20261126064909.2584729-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech> <20261125122452.3966873-1-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

Good catch — I confirmed the OrangePi 4 Pro has a 26 MHz crystal on
board, and my DTS had declared 24 MHz for hosc.

Updating &hosc to 26000000 Hz fixes the rate calculation:

  2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1500000) is a 16550A

ttyS0 now boots cleanly to shell with your v7 CCU series. Sorry for the
noise, and I'll send a v2 of my OrangePi 4 Pro DTS series with 26 MHz.

Thanks,
Alastair
