Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F983B3884
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092260; cv=none; b=SNKWX0T31XYZSkLQwBb1rgAp/IBrZO4psLd27gFNTdjBJt3u/7Psnd7nOKbPAadDey7dkQ8LldCRe3rF5qWYOOYjF1WAiJsW7Ebw/dVqlID6TWaOuuxHRgB5dht5Mq2SsRTbTEnewqph37dno/9uFQJKbZPOOwOXvw2dzYRk2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092260; c=relaxed/simple;
	bh=p4+ap8iN4dSSeNIC2F+epq8WIYVdpPuH33P0vIVK/GU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=q8p9XaLu72kK90bZ+urdkY23TpQ3qRYDJh3PJIuRb3rWIARvrIHMedbWaH9oil56hw2XyXpkODrphfhDsNeQeLnXfR4WWhRv4cCvvJUXRK7+J7SshFSol3UoLnCHp3EXeERP0CFuuvzeHMcfG8C53EJHE+NJy2Xo0cSL27I7vkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ciCR84JG; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ciCR84JG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789092180;
	bh=p4+ap8iN4dSSeNIC2F+epq8WIYVdpPuH33P0vIVK/GU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ciCR84JG8J45yBUMsDQsuJUMc6ABdMe+Z2YL6pHg+/rt9iwLkcOBEnQ++YAoT8y90
	 TVyUMKVYB80dNJLA9W/ZVz46y6lV5uoehYp2uCwYx+9B/g4N9U4o9826wF3uUb4igI
	 KMhiDlJ0VKJDgnRJJj+xcTzBRMLJ36BOuSVRfSOs=
X-QQ-mid: esmtpsz19t1789092172t4f8b07e9
X-QQ-Originating-IP: aSvGHA2+aoIKS3fHxwTlfYEZdf0xYuWX7HM/PfxhtbM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 10:02:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10264822679062085663
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 10:02:47 +0800
Message-Id: <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Yixun Lan" <dlan@kernel.org>, "Alex Elder"
 <elder@riscstar.com>, "Inochi Amaoto" <inochiama@outlook.com>, "Haylen Chu"
 <heylenay@4d2.org>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com> <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com> <aqKxMmgpFLE3CmQ8@pie>
In-Reply-To: <aqKxMmgpFLE3CmQ8@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrAUXRIQvKYrDAXR9xjCPK2SxrDkBOF/Ht8IhQa4fdQXo5
	siNFl6sCpD4Cnn7FqEYx8IacMqqy26AJrkNM2hMaoH1URoLv46oyJYlo/JtxHQ4zT48UXaw
	o6+6Wc6TwK+SZrxKTnG5LQw6oTRn9SiuhMpsA5bT6dnNOxMZLPDR1tZMIO8PLNeKm7rQB1A
	Bea/gsjFkFeDoQqcYaymbudKKXnpL488FCdo/BqHBzH43kzPv2DeBgSKkmVDQ+ZwTQo5fAu
	D0z76ghwqxsKdvf5eprwylYrnObBBQ93vRKJFFtjpGbKqRxRSyD003LhPubrhDjtKAjeACj
	EJ4QXfL2RZH0gbBkw2tr68zTzfHa4EkaaGNpYR1tTBVQ1fJkDP0dzl51Eb6Z2ljo+TTzio/
	2C7crv0vxaG5T7xtWOL2DhfSkch4JglXeZK2uZpEBeHB7u2BBwmEOhkygXledXvSwG6wvGk
	KZVy20AafBQ/2+GHQK+jDcZ8NoAmZmLu5QWJ4KSXUS3pbzSw0a+9pXulN4cUqQO4tm5ogx+
	jIQIg7tz/LXOW0Grq4lbwASWrtZIb9I4FohidJXd096q9s3bQzpms9+pd4ylJpnvbtI9xf9
	S6JirXSa1uN3riJFxMqru7lIVAEjNcDUKXMEKAF7JrBHxiRzxo5zl3Rql4K96ZEMbgyVgFy
	B3nOGaU6ccxpwISJMt6wNyUeSKUAxOx+UkgYfbUaD7vFTrhnMvMztlfY6c+XBCgygpe1LJC
	pfoplvrxti0sqLro5HFCNBUghn7JSbRM/VvblNpJ27DrbBOY0UCu5dM8oOTKrbjQHqvpOCT
	F+ApYaqBIM6BCkOxh1Kx39N0zM0NHeOmdxoF9e50xq9POgTHalifb2gZu+VJ5iQ5+MeS4ah
	esXFaXh6WasB1LivaAImsXrfAriehAZwcnwLMTrKPP9wAPfaWGPEuhcxIHHTCNjJlpBnM0g
	lwQxfP4R36xKBFiB3u1umhVTeIgiA3xR27o+gLzOGpowxaDFLWf3WW53Bq3/ZMaVVZTNycp
	jlK55kkRPNIebTzd4bXGRZbYw6PYaLoVNC7lEYAFKpveAhZ2D5id8rn2c6gl0=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 10, 2026 at 9:31 PM +08, Yao Zi wrote:
> On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
>> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
>> running by firmware can have a zero prepare count, so this flag alone
>> cannot prevent set_rate() from reprogramming a live PLL.
>
> Would it be a better idea to simply turn off the PLL before reprogramming=
,
> since protected by CLK_SET_RATE_GATE, re-programming never happens when
> the PLL is required by downstream? This also seems to be simpler.
Then assigned-clock-rates on the PLL provider node? I tested this
on K3: .set_rate() was called during provider registration, with PLL3's
prepare count still zero while the CPUs were running on it. Disabling
PLL3 hung the board. CLK_SET_RATE_GATE therefore does not protect users
that CCF has not yet accounted for.


--=20
Troy Mitchell


--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqNhRw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFiQA/1yR1e1N5dqm/JjKEw3dfM8yjqKmhTeY4evjauQO
6r/JAQC+EVD4ZL95QJzBkQT+HKp2w5tll5d/gI8NIB1sW9JeDg==
=Z8ol
-----END PGP SIGNATURE-----

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e--
