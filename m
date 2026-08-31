Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6E3AF647;
	Mon, 31 Aug 2026 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147424; cv=none; b=aokYJhFCtiGaeI7NHtCzn4ILbSRzr2870IQpT7e+HrLMkOmPZdTJfLNU+oCB5KM09+vl6q04onodQwx5SXVM4tLsmFkXvWMxBw5eiGbJDsEF0BHDIVMBfbp95PpKI95bl5IAGH3i0XvkjZwSZrlQfj12KmSlAOAeuV4ZC+NPdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147424; c=relaxed/simple;
	bh=Xl4uFzJjRDntCw6uic9BUDs4gvRwdDkWQtmy8RQn3dM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h+D7LmXoM2TzdlDAdVtVRZhQX9U5owTx/LzDbG0U6fqaHnPFV4/k3YR98cpDgcnVBVM4GmPtl9SwiQEEHppWH7rwq/VjnvT+QLoSnGsgmAlrKS43rGOLppbd3W1DNWmUFxZzJgK/3rUFMDOQQrK3biNxtScIpSGkyfFKkufp65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=h+k1PRy3; arc=none smtp.client-ip=114.132.58.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="h+k1PRy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788147330;
	bh=4Ag+eBGxjlvyr4p4d0WObaNx01RwOILqzeqVymp/9b4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=h+k1PRy3crT1X33pV7dDEixS4TRK9luIgiizQnouNLjCOqrmziRBc6Zu3fnnap0Q/
	 HK+UcgoyTxdGlvmoT8dqfxLSG59PRh6iUs0y0Vlyq0IeiWPbpmx7P9nDAW9mv7ws/T
	 4DgCVB4oMMDN+3i0fmclq8ZhwlyENUD7v4v/GTmI=
X-QQ-mid: zesmtpsz7t1788147323t0b47cb68
X-QQ-Originating-IP: fUOo7hcQaPbbuMsE1XNEdyoU1mcnWWrqpFsAffsiK3c=
Received: from = ( [183.48.245.118])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 11:35:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14502604347659165387
EX-QQ-RecipientCnt: 11
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=45d152d964e3ce45e9edec9f59d9c6c3813f5a08c03ab9ecf98c15aa6b0c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 31 Aug 2026 10:56:14 +0800
Message-Id: <DL2SHOZFVMJ4.2KHXANB22AYT7@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, <stable@kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, <linux-kernel@vger.kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260830172925.3245444-1-aurelien@aurel32.net>
 <apRyccJsMjI8Qc4z@aurel32.net>
In-Reply-To: <apRyccJsMjI8Qc4z@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND/mBJD/7OR7PGkk69XmI1gaENmIVcowyJtXuJEzHHgg4YgDiCrFMhH6
	3hk/hi2zFeg6AU7KmIBxPA1BGZrzIxZzaC5Bqvvmlu0XShhglRj13LRoM3V9pQVaUp9Twtc
	MiToM343QKnj7o/YG1RvvKd1bJXAAJ1Ce5G4U4cVeAXHY1UKe2VQOUnnAkvdsF2GSAUhI27
	ou1miFzLdhHMrWK8jXRAi5EOL4jf6j4/MNX6ztOWfV41kHleC65qo+wEZaQkKc9E9FCTyvO
	QqXPFGiMYXTQf+nHpkMQ50XimcCDAmPT6pGt47nhZDvekRXiU2lILKZ8/kHH6lAe3qekwzg
	duELv1SHzCrBGYEE4fUT1Jpb16RXQp/YTi6XShZRYSnnaIIL1Ej+6y5HvsTZ600D4lL6HKD
	K4Skm/e9kCF7DGblLlyg36f+Wu3nvYbg+1WLCcYDj+EIX4ht06MjBh8UvhYLt0Lsm2jNcn1
	T3qzlg7VoLb3/lBZjMiI0+eMP6aXYwiGTmlkW2lh5SIniHUd8KQbNQShkHcpFs1OHi1GFvf
	KDQDfuX73mQ+PT+cZRpef8GgNbxKam24NdB3/oPsh8zcGccXXHvAqWyFGLDdjpzaQ6uodm0
	zUaIK3BLskxUq6Q/TnAjI1iGlz/awB8VG6cioFuOGfF2lgje+XuxVWe+esncyNDASXkrQi5
	yb2VEg93pKsI/H9L71gitWGqx4ZHGQ5R3YHtxadu7J7vxxx/5ZiUeqRHiPYpd99A5wJ+7KU
	47wdbDX394v/GEafZbPY9rY4UtqSNitowaAXrChabzs+33tjlS7BhO84tzqHdD0EMw22Gm9
	d8yh8oISSHEMcy3xbHpQjJ/1pLfoUSt00V5HJknGSsCSacrPzGXlggfFC27zhkt7btriQxz
	ObgU8cKjNWMBLeggidpj0JJ1KpWPo29gtWJ+3oL3Obur89wBSqeRVkX4qxRCGUnrPSpM+Yo
	/OONC9fT893KS/KTts8o6f8zOqLGB2ddMZhYbTxCZRgVHAfY8cK6WlJp9KaByU/kvD0dOCB
	8QjTiZ/jJH0SV61QYN/nFmFqjbCy8h0NR8cBKbo2t1uuEMLiaqtnRK9/d8qDi/gR9HU0IfU
	AxToKm07kBTzWbKP/bfWBTbvdjEl8VmSiJpqDVxdsjF8+hk3kYpQWk7nyNFYDsVFw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

--45d152d964e3ce45e9edec9f59d9c6c3813f5a08c03ab9ecf98c15aa6b0c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Aug 31, 2026 at 2:12 AM +08, Aurelien Jarno wrote:
> On 2026-08-30 19:28, Aurelien Jarno wrote:
>> Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
>> and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
>> PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
>> only the 2.2 GHz overclocking operating point. This causes the linux
>> kernel to hang at boot.
>>=20
>> Add the 2.0 GHz configuration in both tables to fix the issue. Tested
>> with both k3-br-v1.0.5 (X100 running at 2.2 GHz) and k3-br-v1.0.7 (X100
>> cores running at 2.0 GHz).
>>=20
>> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Cc: stable@kernel.org
>> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
>> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> ---
>>  drivers/clk/spacemit/ccu-k3.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> The related U-Boot change is available at:
>> https://github.com/spacemit-com/uboot-2022.10/commit/274f664150dade144df=
265baf7dc8e15dd9cce52
>
> FYI, this is the Sashiko review:
> https://lore.kernel.org/20260830173644.193B21F000E9@smtp.kernel.org
>
> While I agree we can fix the SpacemiT clock driver, we'll need to add=20
> this rate anyway, and it immediately fixes the issue. Fixing the clock=20
> driver is more work and this will take more time to fix.
This is indeed an issue that needs to be fixed, but not right now.

It isn't directly related to adding the frequency table either,
so I chose to submit the frequency table separately first to get it merged
as soon as possible.

--=20
Troy Mitchell


--45d152d964e3ce45e9edec9f59d9c6c3813f5a08c03ab9ecf98c15aa6b0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapTtTg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvufcBAJF5c7qhT5yZg7ivpkqICsTQ/HYT/aNRWc6ihuz9
X0eLAP9Kc1g/BDOzqVSIBpXH0rlWHaYlaGMBzoRaNeYKhFcMDg==
=x53U
-----END PGP SIGNATURE-----

--45d152d964e3ce45e9edec9f59d9c6c3813f5a08c03ab9ecf98c15aa6b0c--
