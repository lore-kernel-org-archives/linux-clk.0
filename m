Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448501;
	b=Uv32Yab/YM7ONGcV/HnblBZPCZonQfhEbbXVxZ1WTSxplN8QnseWNCZelB7o0fHrnLf9
	 G9C4hYCGYDWNgjo9mPKYg5eFeNWZD1lfaLE4kyUd+F+KwvZ5/nNgyoSDwW3t1Iy1ZX46v
	 OSD/JMqQZ9uDwq2ImmOXK4XYBYl4xlcaLTGvz4iIUDJYe7R8hxto5p/oRJFo2RfmGSQfL
	 3OA2bVLFwMyjC6pT2yoJu+pkSQxzDf+Oiu0I6uBDDdxb+FhScs+qr1LoMDLkZVbqz0EXt
	 cDyapeF524yjLarj3zIczkH1lOd12pUpA01FGq1zOlgeAz1puCXuatxKvE2JQFNcdQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448501;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dFeejFp+b6lfL7BUAUr19CJqBLSUo9uMnCRR5A9zrR4=;
	b=qxKJ18VdPX/X76RTJ7+QHgmcKs+3G11kjlhpu+5I67QB7WYNQ0cXe1NLdcbnTiASXwgc
	 AtW/5+wqMVNmoF+r4RXurNyLAwUmP85HBEr+1dIl83mO95ldqesbZ1fUvElf3fukfN9Yu
	 ljLiOFO0MKp+XRAFI8RdWS/3+nWle69Hf3MmbWCiz+iAn14hX8yxmEwAgFAMMjWTNLnEZ
	 lkKLSbJ2Ww27iCPwAqknCz7gFRGL1DhMNa9kAQAint2ZrUY7BLfehNZxUPB71AH8yrwC1
	 +Vrs7TPAyE8h0bpXuHI45uAhP7+X03eKrdforbkgGBYaKubOXKzIzHoFokIn2JColHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8d9D+gx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167A606A333;
	Mon, 23 Nov 2026 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8d9D+gx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40DE1F00A19;
	Mon, 23 Nov 2026 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448501;
	bh=dFeejFp+b6lfL7BUAUr19CJqBLSUo9uMnCRR5A9zrR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g8d9D+gx2a/3an3ASut3qGr5oEpHsivWwQ+UhHDR0If1A3yyPv/kY7+BfgFR+NqdN
	 ZilHQFqqtx5WVOsA+ayKiYVOpVN0DJ4xEqjQMQPZHlMIzEV111GVQAL12ViWVllJxE
	 uqwzndF29p437xSVCDrf7jtrYVdWIwGJvjPA5J4hSbeN46HM9EzluuidNMdzO24s3N
	 YWtgQBBPfU9Af9QzmP5IZAfKaXsoOnPaPPBVN0kxzbf0UtbpWqyhs9Q1Y7zGFQ1+wA
	 RdS/K8RPYtdzVeOcb9bMYsMb6vOIrvbe/Tu/BPBRs7gKLN/TLa2I8++UmaQPxRtGiU
	 YAEvmrqXg/xuA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
Subject: Re: [PATCH v3 0/4] Fix clk-divider rates above 4.29 GHz on 64-bit
Message-Id: <179544848919.209212.7567602584693765343.b4-ty@b4>
Date: Mon, 23 Nov 2026 10:41:29 -0500
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
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=KN50npO1UZYjwZAAlLSlkjQVocXNnwkgImXNgPQP4Vc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZ4tbkSSRmTry0Y8q+yQfFnz4L3XKXw1LQ4ydPe8JG2
 3aP34F9HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExkUxfDb1bFVccdeCKWead5
 qVot3mM2YdONgKrL4f8NdGb6VLgEezIybE/Y5XLwgu6fHyd6OZKsp699wX9lI6fmh/lGh/72Bhc
 VcwMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 19 Nov 2026 21:49:30 +0100, Carlo Caione wrote:
> Fix clk-divider rates above 4.29 GHz on 64-bit
> 
> On 64-bit platforms, the clk-divider truncates requested rates above
> 4.29 GHz when computing a divisor. Fix it and add KUnit tests.
> 
> Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
> new generic macro and were never applied. Patch 1 builds on his v1 and
> rounds up with (parent_rate - 1) / rate + 1, which does not overflow
> with clk_round_rate(clk, ULONG_MAX). Patch 2 fixes a division by zero
> found by the new tests. Patch 3 stops truncating divisors to int.
> 
> [...]

Applied, thanks!

[1/4] clk: divider: Fix the divisor for rates above 4.29 GHz
      https://git.kernel.org/clk/linux/c/485c1514fb97
[2/4] clk: divider: Fix round-closest for rates above the parent rate
      https://git.kernel.org/clk/linux/c/9964715d4729
[3/4] clk: divider: Don't truncate divisors to int
      https://git.kernel.org/clk/linux/c/e69c78b9782b
[4/4] clk: divider: test: Add tests for rates above 4.29 GHz
      https://git.kernel.org/clk/linux/c/7e4d9e345c64

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

