Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61231B101;
	Mon, 31 Aug 2026 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147714; cv=none; b=bN4wmKxE9+2cDnn5aQqmfiMMEmrhTVT4ISOnco8sxqcjG0BJ74t5YeTq+LQJ8/LYKRMY2aeYuwidv53Pqd1L3rQekI12cSzYMRRUD0+qZz6FM1GbjJDj43GIt/7/WE2KFrHS/X81qXl46oQj4BtmzwYrdJhgc9AbtkA7vTOXExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147714; c=relaxed/simple;
	bh=BQqSfNw7698Sa/HXE9sQWxU1pHqkCDM/++aa3ehKA9Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=s8DUJ5FJT9upBzdnde3wTcyhi6VBghhP/uU9rHPf49VHoMJ6bai2wEHf6DTt+hJN1X1xKF4NeiqhNBKcuG/OO3jjCx/l+N+ZzZUYkb37s7Qy/I+RCTl3+/jN6PJrXF1sZ/Z0xS1nh/hKUuveJqIWo3kXwOUDm2Uc8gi24qYdeEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=yGkPIQmE; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="yGkPIQmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788147653;
	bh=NnwaB5ujAvJmVoXXw/A5RDLqLJgznXnQE/ZxtU6ybE0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=yGkPIQmExOaTkwbdhWCa6ATbsYK3mxUNchv46ryjHsKuGIc6m3fx09y3joCLe6l5G
	 Q8HaT/EDppW4pWio6h4j/5C438HyHiH9VZ4UE8UWoB9vP2KuL1/XXiV6ShUFb6ZWNF
	 mFKTpkxxwWAny9ggL3WNaAlRedONkFm02vAR5P48=
X-QQ-mid: esmtpsz16t1788147647t12fcc224
X-QQ-Originating-IP: r/8jVrT4i8gNmZxm/dFB1QWDjJiD0EoKNYpdcbUmelk=
Received: from = ( [183.48.245.118])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 11:40:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10785841376019705639
EX-QQ-RecipientCnt: 17
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 31 Aug 2026 11:06:00 +0800
Message-Id: <DL2SP646WOSO.2762R9GD5RXSI@linux.spacemit.com>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>, "Alex Elder"
 <elder@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>,
 <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Subject: Re: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com> <apRncBmtm7w0Emwf@aurel32.net>
In-Reply-To: <apRncBmtm7w0Emwf@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NDcdydrNm/XtFmDWDwG77Y3qnBeQf5lPsnF07Lnr7kH6dWJ3t470x8rg
	oZCmOoa35/xxf5nhi44yg4lsOPXKfHaZZXnU+Fujc32UG/EPR/PAfbv3f0xtYz7825myR+Y
	gSAmE2ko8K+yf94AflJPOcfioLMbxW3fpMiUsmTddQA14a7tENN0/sac2InpiLuXDeizCUC
	c+UpYMl6O4a+PIpFMz/weM6jUtiUQhhBLnWUp6LG6/tCGsl6d7yEqeeePcn3Aw1Z7UPsbvL
	J5SS9Z+cRXrDv1pnULHcHb2l7AOmdiAsofmXZ7eN48gAdHJWsTq+FyaEdPZtwpAbePK4DiW
	zs9GN5gQRyDsFMJOhtlTULyi6U6BFak6yTh6CQY+9YDPyL9FpttjRWO/D+Zok9jxTvDsp4N
	CFqfTRUNTN2Z7PVb+rTgiFA7yomxnX89gku0lH2e8OU7fIjmt3aRj0hiMgMuoMl/mR0fnnd
	eedhP48uQt6pEl+iW+dTRp8DO/0WqjcDLjAXgaQzTW74PtVtCEa2ZcR89WJD8a4FGxV2AVZ
	/yfvgA/MU6GH/6VtkGFPySVBAc0bPl9iVh4Gzi0vLJ934PfszngAEWFkTTGqJnPC+vFiI9x
	CA7W8mWT9qWKIDUS5i69Sl6OlKtc/duyEAPg/zFWxTIoCeB9A1yCLmEBhTaP3fpmveEyoTX
	klygI1Yu/8wzxgbUScIsbOmugieRnkk8ij3LS5PZbWAZ7+h454Mtp+FydCVnMpe9022PMy2
	WWG6iLePfPaEm0P3M5CFkeP1RpsCnXPaj+R+CYudx9hP3csY4veVQ9NK8NEfPS1w3a/Twtz
	I4QZGvrF9pyHiAfz1q40TFGp7ydAwWcCCpqt5t3POfmXiR12s1ZPwaA2K6uOW6q67psgxXc
	ODzegRiqxajATKwc4bIUGXXFb0OdsCFekjK2yZHVe0ykWKl/j8KbzJFLMX4sjVuvnQGvxMF
	EYshqQDLEDCtvbLkaDTkB8PvEFISjNwNY/7tfbOJ4yldGdtzYswjRZWmvH4srHgcTE2Ni7I
	mhsvgm6DhrtghH3EKVHluNHSJP1vK0GfK0mUM0xfs2Ow17ilpupYpQdYluT7EC+6UmI2+ky
	P4+GxWLX0RiYoASVdygvYBs3hQHhMPghP7bURwg00CHZSLYrZK0uKfQOb+c0+kw/vPKHm4Y
	y+VdV4e5IqKBM3VRJoR5PwkhuRg+PxS9hCxyQRotrx0tn674VnLsNIRawT9mFzkK/LW/
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Aug 31, 2026 at 1:25 AM +08, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-08-10 16:46, Troy Mitchell wrote:
>> K3 boot firmware configures the C2 and C3 CPU clock domains at
>> 1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
>> currently contain only the 2 GHz overclocking operating point.
>>=20
>> Add the nominal 1.8 GHz configuration as the first entry in both
>> tables. This lets determine_rate() and set_rate() select the firmware
>> operating point while retaining 2 GHz as a supported overclocking rate.
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> The related U-Boot change is available at:
>> https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b=
5a1b3e5cbbee223faf352
>> ---
>> Changes in v2:
>> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>>   will be handled in a separate series.
>> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>>   patch.
>> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
>> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-=
0-a3a75866ce32@linux.spacemit.com
>
> This make sense and looks good:
>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>
> I wonder if it should be backported to stable, as users will deploy=20
> newer firmware.
Yes. I'll Cc: stable@vger.kernel.org in the next version.

Thanks for your tags.

--=20
Troy Mitchell


--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapTvmA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvQDIA/3RL7VXwzHuHjnzdOwa1VtWuQpzXbNq9GItBdCdH
0H0gAQDz6KseX2X3tpAb+avR3WoWXHlYlpXdXrZQ7y29Mk+zCg==
=sgJs
-----END PGP SIGNATURE-----

--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71--
