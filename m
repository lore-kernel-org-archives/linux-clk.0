Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306D3515FD
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050116; cv=none; b=EU8IotUAJbJbnxHIKrrfWoZK9HnVrKk9Lk7JrnlUNjpdEPq+X/kCbNw1UEVkvtZ00AnUtsSO4Q8Yjj/xaYrqaB/a3jolrm4YIrbbkmk4maJhYE+jff6lUu3ImN8hamjfr+hTtJ6GQjEnkpeU87aeAua1m1l4XKSLtVaf5kwu9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050116; c=relaxed/simple;
	bh=xdNcRtr3Q1H8R8s6BA/OoSzY7Cs3ETsOgR+Zgda24Lc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=NXfeDPaMNRqMsQiucLed+dcRWGyI0cgFAEQDdG7Z4odPDOv8jVQ+O9P/oz5GdCo++rpbOrNSFojhOPG0QwitV1NqsCgWYAJE3ZWYkfgq5pGdB1mzTDreJ2wUvXsLupq7wkF3qj1rUuXI7tm1OlICCJZZAMoT/g2UzQTDAzBvflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KTN31E0L; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KTN31E0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789050006;
	bh=3nZLJvFkotIH0hkZxh4gNEbBhFHsxNJJz5gCcWVLrcQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KTN31E0LzJqJ5+n6sdnQ3saxk21R5q3x8bRi4eaOvbKPNfj0ij7i1LCyn37otAv2z
	 ptYKJ8ojNky2OY505bbcz0sK5mjUtnBtgRfm3pjYWLyEAX6L6ZNWtUZ5qpb0bm8lVC
	 v15smPAg+Wx+zyJ3epWSUqIndOgYjVr5jSe92fGQ=
X-QQ-mid: zesmtpgz7t1789049999t835cac00
X-QQ-Originating-IP: LvFWhnr8GQtHVtD5AxbXjVM2HEzA8EvNtZbuG/ISU7U=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:19:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14213851598178055219
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 10 Sep 2026 22:19:54 +0800
Message-Id: <DLBPALH9J84H.6CTB8GOVYSZ@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Yao Zi" <me@ziyao.cc>
Subject: Re: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>, "Inochi
 Amaoto" <inochiama@outlook.com>, "Haylen Chu" <heylenay@4d2.org>
In-Reply-To: <aqKqKkXbTkcS-pnY@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
	<20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
	<aqKqKkXbTkcS-pnY@pie>
Content-Transfer-Encoding: 8bit
X-Unsent: 1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzr9mYlDMBxYvGYaH25O3d4qbQeIVx9zCjRu1bKRQCQPQYr
	9ThwbJ+HvmAa6+6QdJSCYZlE3A0Vw/IqS7JGGSDIDm0K0coYKWJy+xHRKmChsnJHWMY+7/x
	vrl+V+YvkOjsd7lSIQtsBaB12FwJo4xB+283/kqP+3Zub1l0VFR2HZHVMdj9PJfZ1kV+DRW
	XD3Q1f8Zs2lxtIjIh2C+zMb+snzW8OfbH9soHjShJ5/N3F5X6sntm3FW3kVQ2pCHkokBNad
	wwvFe07YHxecDTIiTTBAj3OtVrXJ6be3eivV32C8rGqj7PTUJzBHmXVQ95PLKRTH+XdgqO5
	BX3qVAoz/5+QGl9cEHk7oMIyv23CNPSa8ocmeqgCqKw9DAGkhgn4LZJpz6ENby7tLuhUzX4
	nhNXrVzMGBBcQSOWbhLEDhQkra/SGTgoBzarMBEi1fzsDkzDdEaA1F+sQu2wCph5zs6d6xB
	4vtgSdraQNI+oB7HC0heXTlnOWdetGfKjaTdkSJ+FWvTHIQPdd5KnwzYhpWFX1QRXgsYats
	h8bywgGre1aks4Pya2pWDKeJ+r8CV1O8mfVh1X0ZUhH8lBCAfFhpCxEjyWClEGe7FRJpzuh
	lRVG6vmqyJu8l5QKz3Tx/BAfRe9dUDPN8mggEILq3w4VIdSuRQz+3+x76SxHMdL3xvDV9uu
	mzd6aOiSgMhu7sEQtaqgGNfvTfdT5R3JLbVxJ3L07kzHtreKObfusuFqTSFJ7WKafEFHeXe
	kGTmTXx6W2z0rpxZIXQnlgTiRUTTnpDZDz8SBQEbJIqCq1CKUTsu2iBBLYjKWVdheq9EPuf
	m9KqrZ8gUbrv1XxmNlujbRqELUCQDK1TEtf2cVP+sfD72p/vsVNXcGGX21Y41O7GanwpT6R
	mHkQAKxSUvJUzGRWgECmfBzqKXHDeKSLUUh9dfJzJKyX74Hqhk66JyMtSt15L4Tmpdi2hmC
	+GFV6JK+lOfY1ZsacL2Pt6YIfEcke6IlhkJJ34isheh06xxc0WTInU48jRdAzGI/5E0Eqsm
	qIxUULVab5U1XrXshKACUatSqIA+wDO0WenEMpFg22CJAzm8+86Z2Pyl1YSND1rxJRFxsXG
	PGw6F/iXUfWl1isEGEQbT8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2026 at 01:01:30PM +0000, Yao Zi wrote:
> [...]
>
> > @@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigne=
d long rate,
> >  	struct ccu_mix *mix =3D hw_to_ccu_mix(hw);
> >  	unsigned int parent_num =3D clk_hw_get_num_parents(hw);
> >  	struct ccu_div_config *div =3D &mix->div;
> > -	u32 div_max =3D 1 << div->width;
> >  	unsigned long best_rate =3D 0;
> > +	unsigned long best_delta =3D ULONG_MAX;
> > =20
> >  	for (int i =3D 0; i < parent_num; i++) {
> >  		struct clk_hw *parent =3D clk_hw_get_parent_by_index(hw, i);
> >  		unsigned long parent_rate;
> > +		u32 div_max =3D 1 << div->width;
>
> div_max should be invariant across iterations. Is there a reason moving
> it inside the loop?

It is invariant in this patch. Moving the declaration was preparation
for patch 3, which makes the limit depend on the parent being considered:

    u32 div_max =3D div->bypass & BIT(i) ? 1 : 1 << div->width;

K3 bypasses the divider for some parents, so those parents must only be
considered with a divisor of one.

I will keep the declaration outside the loop in patch 2 and move it
inside when introducing the bypass handling in patch 3. This does not
change the final code.

                                            - Troy

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqK8ig0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv5x4A/RFh51fufb9FcP636XKBGlniVIj2vsG1LHuvGbJC
puCPAQDyBV2iTGZVCeXgQSOrvUYtmMpWmDu+kDhEiAGV7O8ZCQ==
=jX00
-----END PGP SIGNATURE-----

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee--
