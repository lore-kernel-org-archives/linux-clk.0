Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454020;
	b=nLoLYaK9La428XpGC8cNsjkPhOONArgJpPQSDndrqiluQX6WBlnYZ2gUh5SBMzlhIQBD
	 JGA+8AeUlsaVq2ufWeEuzTfqwZ/EtoeswFBXoN6WCKSbtGvt4EvzogNoT5z4Gzkp6YIfT
	 IAaKGepLu4oPV9QtmI09yseItqZJ0g0ZDLn7njDohLHLxFBg7sE5+ICnkc+UhLPUw99QV
	 a1sXaaze8qJgEZcotAXY6Q/c6CrvXoHBISmEyk/8YADhtYTB8BiEutgsaIrzoXgKmadJE
	 86NEt8bBG5axlvlGOzB5z9e6oh6lfzBSwZSfh87telBP/euB5r8o850Uy/hOO4YbEiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XMevZObTQrwIBZ4zVSD9xmRkiB19mESNAfv/miZL2Bk=;
	b=3knYhHvLckWSBsokfJwRfXtgcYhoOCeJ2OebWpUCRL71G1dvkHKzdj1zk296JwQSqq88
	 sB8UNy8rE/VXpO8Zl5GJLDHQBnRlrXbpm++UTfm6ndtHtScsNyxNGmIs1idviWK+wcyyV
	 D5jric7suNP5zsfLQvWLtNh3thg69AANOsWWJ1EIpgZIAdoeqti/QvCtxMdqVRqZRgLJ3
	 pSSA5Frgy88hjsbxOSX0GiaTVUodWcWMikYZyCcnEbSdC2h0psbJyP5bWM4UKLJ2t7shb
	 3QQxx5n5VV6TuFryPvflii2HueYEfgreFtuCdEOAxvw2qU9tHFzhrvAVf+Rvm6PVZYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFTi5Vzh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C66606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFTi5Vzh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135FD1F000C6;
	Mon, 23 Nov 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454020;
	bh=XMevZObTQrwIBZ4zVSD9xmRkiB19mESNAfv/miZL2Bk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PFTi5Vzh8CU1VM5Gw52Pi9F5T3xa2SFQfyq3ejVciUd6pn1a10lN9TK6VKxv8nsyY
	 jXGPPntRozmijgjOTaPmgIXvbsY/8ghiiUd+SBe64Tky0a4mccf2vcM84wne9gbbCu
	 gcR47xuE9xg69PfVvJGDWACz6RZq6uPTC+8MWavexIOm2MYB+aidFvDZQyE7NQtVqV
	 +h0pYClsx5SYL9VrymC150XGOh7Fh6CAnwSw+ifdK1CErD50FLg4SThbJPqh7Ey12R
	 ET2EM1xXq4IUt6GDpbVsb8IytOmYrcI1novJdllKt5AgBTMShJWAVdxNujmxCy7tt+
	 G48Fl15SQxNPg==
Message-ID: <sashiko-outbox-229709@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] clk: divider: Avoid division by zero in
 _div_round_closest()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-clk@vger.kernel.org
In-Reply-To: <20261123164834.3330320-6-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
 <20261123164834.3330320-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:13:39 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] clk: divider: 64-bit addition overflow in _div_round() and
  divider_get_val() [1]
--

commit 794cea87b2763d8416c120885c5c264136bf9dfd
Author: Lee Jones <lee@kernel.org>

clk: divider: Avoid division by zero in _div_round_closest()

This commit returns the minimum valid divisor from _div_round_closest()
when the requested rate is greater than or equal to parent_rate, avoiding
a zero divisor and subsequent division by zero.

> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3df..d05dc595ec4c7 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -244,6 +244,9 @@ static int _div_round_closest(const struct clk_div_ta=
ble *table,
>  	int up, down;
>  	unsigned long up_rate, down_rate;
> =20
> +	if (rate >=3D parent_rate)
> +		return table ? _round_up_table(table, 1) : 1;
> +
>  	up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
>  	down =3D parent_rate / rate;

[Severity: High]
This problem wasn't introduced by this patch, but can DIV_ROUND_UP_ULL()
still overflow 64-bit addition in _div_round_up() and divider_get_val()
[1]?

drivers/clk/clk-divider.c:_div_round_up() {
	int div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);

	if (flags & CLK_DIVIDER_POWER_OF_TWO)
		div =3D __roundup_pow_of_two(div);
	...
}

On 64-bit platforms, when rate > U64_MAX - parent_rate + 1 (for example,
via clk_round_rate(clk, ULONG_MAX) or when clk_divider_bestdiv() clamps an
overflowing target_parent_rate to ULONG_MAX), (u64)parent_rate + rate - 1
wraps around and DIV_ROUND_UP_ULL() evaluates to 0 instead of 1.  That
passes 0 to __roundup_pow_of_two() when CLK_DIVIDER_POWER_OF_TWO is set
(triggering an undefined shift) or underflows div - 1 in _get_val() when
called from divider_get_val().

[1] https://sashiko.dev/#/bug/linux-4e20dfb7-a4d5-4b44-bb0d-e7b8ced3408c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123164834.3330=
320-1-lee@kernel.org?part=3D5
