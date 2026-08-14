Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3493515F8;
	Fri, 14 Aug 2026 05:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786686018; cv=none; b=czR0mbahlo0iTa/wexdM8gdrvZxtyUnrevQEhOpoeI4uHPJVzMmCLl/TetiBKSGbouGv7d/0Lms0MMAdPkIVFbgG7BX4fgNoh7t3ZFuwXCqAtuV/yx7qEHSw8cN0BsaPDOZud6xHtULHXpovrADntmTcPrJMd7koTj4N+/FYZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786686018; c=relaxed/simple;
	bh=C1ftxzoPZMNoIvQLta2zjTHKkcE/VlHevAxZ9gKbOoI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NV0LkqcnhKoWtVKE9tbuwoegb3iNOqaTysuuR7+NE+caCBlZJXYlrkb8Rxy7QeZDa5G8+qSuGqb88HUwe10rjPUCgXyX1dgJbeE154+WrRBw2qQ9eaK6rNnrQXX4wty1AeNNeixUvkd62uQKY0lwtyB24gtRy9Fs/FtKbjxa1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU04+E0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU04+E0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6671F000E9;
	Fri, 14 Aug 2026 05:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786686017;
	bh=C1ftxzoPZMNoIvQLta2zjTHKkcE/VlHevAxZ9gKbOoI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=EU04+E0cXBbhIO9XB+uca1ZiIpCrkuKUJz0JxZ9QNdkvnxF9PRWjyvzxnlDEmiZ7/
	 WFQs4o3SNt/qhyK0K6fB6ZDbb5bjqoQ+ouOnkU3VKohAFLMOJwZSnJ36GsE/bhtZ2V
	 sjLgWFupzDpTBUNAbMEPQ+jK521qXe0fw8evLJi95e46A9row7wwLWxJFvhrIZv48u
	 w/fYRLLXlS1G/bEo9sMlvy4TwpxXFN/7Xad01r/lNTERavP0D/M3VGdb63lng5VvGo
	 qBUEFz5XQwA4ggkIDDXZdFFu6VbOcRKIFYKDdNY7BZEkbhxKTmlNYo4sj2n93OE09I
	 yC8o4JkXYxbtg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260801111637.304590-1-work@onurozkan.dev>
References: <20260801111637.304590-1-work@onurozkan.dev>
Subject: Re: [PATCH v1] clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, bmasney@redhat.com, daniel.almeida@collabora.com, Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>
To: Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 13 Aug 2026 22:40:15 -0700
Message-ID: <178668601557.5897.11262008307765555513@lazor>
User-Agent: alot/0.12

Quoting Onur =C3=96zkan (2026-08-01 04:16:34)
> devm_clk_get_optional_enabled_with_rate() registers its cleanup action
> before setting the clock rate. If setting the rate fails, it attempts to
> disable and unprepare a clock that was never enabled. This issue was
> spotted while reviewing "rust: clk: add devres-managed clks" [1].
>=20
> Register the cleanup action only after successfully preparing and enabling
> the clock.
>=20
> [1]: https://lore.kernel.org/rust-for-linux/20260706-clk-type-state-v5-3-=
67c5f326a16c@collabora.com
>=20
> Fixes: 9934a1bd45b2 ("clk: provide devm_clk_get_optional_enabled_with_rat=
e()")
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---

Applied to clk-next
