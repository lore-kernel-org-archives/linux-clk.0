Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530137;
	b=QI4soZSE0rKRh+4kLjl3kwdZTnolPnt231BK/GZ/O+2hQ79/9V2i/R/9xJE/mAHJHqVp
	 nmKpfhOgo87b3agCZ+Dg+Cd3sjAE9fSFX2ODCGNNmr8429PUIxEFYktshUFExBPsb2cA3
	 KSlSUYDzxuyprvelOKOxnGS/rvMURCfdYkFbBcjP3utJR9nVOoIjRrYffUvzItFhK0xeu
	 mTJAntUdcNDoqWRm7ZFQW5BEaAPi8ihqnG+xMesW3zXGf4MsfMVR7sb8R/m9LFuogmlZq
	 sv5jjGO8310U9sNAtxZKJL84gwYvFeAlnEHr+Hof6p+LGmJ83XhbMenvuvzw2qhIC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
	b=35EZN3AGwd0mVr0Kn+xW8EQ/GyQsBu6MbGuhk04jgqUC3fvaeUnYsA/wxR6zOMA61ZGk
	 EtyPk6tl8km4Cn6xyMRkGsRjyN10Kqf4B7Vvsj7fSAQBIMaNA0rAgJxaB3P4s2d8LqCwg
	 6OpdPBakF7KltbkbsVyOmz7DGoSPBd8yibncig912W+LrBrjqUoBY9Y/M7aYW5s7y1sQ2
	 LyRJoeLT68A3LHz1JwMA4xHCu4dBr1dhyqd+0FiyfYHPTjrsu0glA2WWZ8fKNCivlHYLv
	 e0PphdPDkg5v7ySRV3fezqqyLh6XutQ5ztCXLREcB2biyto6fCDPe5cAyv4981rH8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJl0+cgB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951A606A323
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7951A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJl0+cgB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so6195175e9.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530135; x=1795134935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=MJl0+cgBMiL8RasXMldE4RmIMeOq6phlZFaQrRYv4QmofPXycKDBLd+ZAAxdt+dsaF
         OAJJyxbd4oDmtdfzK6qpO14YXfE1ZVUFNU/mbvri/HbQZ64juUFNW3bKb6DXjfLCCTlW
         pXDM+ohyzs/MW+8puI6G0cmPMi7HPpKaGAHhTAq42aN88OFADBYzkY9Tuxn9kqBRyROx
         2TRFPnL1ev997JF4h+4M0c86paqgLWbgSKjInUk0ttZ1G+F4UL4s8FIS7hmsZmI4EUqa
         11uExOjjRI/9vMkA531lOwHHwG4UdGxLCCI4U4y/PZKn2S8jo4eQyWE6wRllqjklWcq7
         owVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530135; x=1795134935;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=01e4Ty6H+ggIj7wAo2aRYAX3JIDOFYzo7X3+3SDHuSz5c4JDylyow97NqD6KLAHsqd
         PEdd+5CS0ymZFxEJzaGNDPuv58MY/afjlYnWDWuflgKcJzgwKwDue1aTTrvCqoHEabun
         Jk3EpKvCWvIhj9dw7uzTVS3S09lF4f4nFe3QUlLpC5cXKXxVxZxd2xn60t23MUncaTVu
         xpxaiaocxwidV95IMjVvU+T8bDOtKHOShldoQBOIZNkCqJjBY50046V2zOvQ6Q9nNqQR
         NdvE79+x86xO38XX2Fe/kAz9oPDphze1Hw04qtxDpX54c+VISvLfsZnqSmpzzXXwZibY
         ZZqg==
X-Forwarded-Encrypted: i=1; AL+hErH2sy26kqenPCNZCYiGwNRgd8bQvOqTdyoWIJvIo0g3521w4cXHALwIDU+yT1nIo0WnGz8v8EZhJ8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HgKnkIf5SqYOmN1RLhLBA6TO1AQbJBzMh/Xe4nKgq4DIwgS3S
	hsU5xMNHZZSC1dYfzwBlIM0ZJkw37wceLh0lSjJ0NBubff4A+zI30pMS
X-Gm-Gg: AYBFou3LPVrf4WP7eFPG10tZJEZGo5Ug16VE09bA6VWXWFcnQjnCGgJmGNOgxeVSwjt
	qKd0bcGz59q37Pyr0ncfeNsDsi5qn3EqY2bgni2sRFfXPNeARJGpJn/M4JUbIbL7y4zHAIJIUVh
	B1qEft4amV9I+yLDprIwVDZFN9sI2DQc7N+ioUECf/0oRj9Dlm1502GZ6yGUace5poQa8uDeynB
	nlEuN3jOwtxK8gV0P+jDWZV54XwdVCJuBAwlEwn3AFzJ889agFKpAA0ORgmldz6TE2Ru51Dwt5H
	P0TVhozS33HW4yVC5SvDxYf6qD73GQeFZD6D9MMQ3XzbaBQuU+QC7mVD33JdNIOvHfBNNoj2AuH
	1Tz5P2xulbhke9T6HMw8l3TVGEyst6LeJudFtsLcFYRmAlZjIA+UJrPInUD9DU0J3kfaGnqcBPy
	uiqX4STi3LvafthSVH1u/Tupb9oxNqWOAjelL7Y3hkB7BdpcHzekFN0OdkxT1epsHcJj79bVOZv
	PskhH/wbpcKifxS7xNd6anT3KN1pxd5AW6f+FzIrkR7+1WIEjHJK5bLIzKH3YXSCsnv5Q7L4BfY
	tQ/V8HjqqA1il6vEmq51s2L7WxsqPCBU322+qOf+mGR9w+sBGvjGvzhaMqGVfT3JJyHGAVNGu3L
	Nrh1p7fAuWaWQNis7BrKdxX4ZAO8K3PdEpYiyUIynGtfv7N0LEbGtCJahk9ecpCvOEK4VMEgXHS
	LL7FxnjOoP1HTSlvqf
X-Received: by 2002:a05:6000:1606:b0:492:820d:107e with SMTP id ffacd0b85a97d-49c72f7b036mr1416827f8f.47.1794530134927;
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm1703515f8f.20.2026.11.12.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:35:33 +0000
Message-ID: <20261113003533.3660311-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
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

Hi Stefan,

Stefan Dösinger wrote:
> The comments I sent for v1 still apply to v2 I think.

You are right. In my reply on the RFC I wrote that your points were
done in v2, and for the clock driver that was wrong. It still had its
own PLL code, direct MMIO and its own lock, and the resets were still
in drivers/clk.

> Please try to reuse the infrastructure in place for zx29. Ideally clk-
> zx279128s.c should be just static data and a minimalistic _probe function that
> invokes zx_clk_common_probe().

That is how the next version will do it, on v7.4-rc1, with static data
for the regmap clocks and pll-zx.c, a short probe that calls
zx_clk_common_probe() and the resets in a separate reset driver. My
question about the MFD and reset layout is in my reply to the cover
letter.

Best regards,
Navid
