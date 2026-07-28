Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9B3AFCF8
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273950; cv=none; b=DkNZYAb2UOlIE+RkJtfZAGGaYFJX/GG+ps5R+LmRKt8O8YfVWp9+UF1/DcH9Yv8EVWbvuIm6DPm0PWG+T6BuApbCKMDzPDksJ/lyWP+9sUnQqdb46+3Dj7zVR4AqcSysg2dApSi3vI44yHe0J6uEBUNIWXsjfJ70IsQ0IxLOWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273950; c=relaxed/simple;
	bh=APWk0uOj8/6LVjgqEtJk1b6uSGlDci9M7cPzBIGfdF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c18S4rNYd28qPdgtiArhq9YZnU5adIA/PIS9FPlhr8ND+1uoaL7JTERa11UINzlMqX8/BAPphgV+rGICqnHKYmwHYYW5MSQEj3SZnxBpX11joIt7JegwiYjz9/HZH+wYxhlG/lSbY0etv670VIseepyTfjvXbOHTer28B9tnvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arhJvCiW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arhJvCiW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso1698185e9.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273947; x=1785878747; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=arhJvCiWsnMDShQuKi1qEpuiBNzclxRrA8COReiRG7NMiZgP02HqV4F5qmeeLr+Ivm
         STSv0UwU1RrxnHzaheLqxL0OR1C35VXJ2TqtmoDxjXls0jj6SXwFj0jyWzHPe1t99kKj
         WVYizW/FAREUzRqBgixpM5w1P9sK6TwjxEDFRMKDvbj2AKCrNmhU6gtpnLUmSr9N6ugV
         caRWujc6G4+6C//2ZTPtny8liIRtUtMEKxrGuIUfAJl+2jEstOvhD5yClHdqG25+9CLW
         aODyveF0zAqsvwzHi01LHUukSin1FbG8R8EHOZlPxhxmTQpiT5+rFEILKUJEPg7wGWGF
         sB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273947; x=1785878747;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=eXYTQFMgIkjSRn/aRMPoySicE19cyxrYA72riwkghT4s5269QoejvKQqbhk9RailhT
         dGpK2I484EW0SFr9FWWwKEkuG5ruOBxv7NARcEFQxAa83QfTa2Br0tvW8T2YSWNGSzSj
         E0gYl74Zo8WLojHbYLKWc4EtSDfGpFRx3Ex2JTJ8WLeUOLueDvjZ3eI+6hi0eqh8AXgX
         NSY+aLOA1jjzFKLZH8XKnuE7dzKx6ab6qtjfn6VDHyObnG6RCPNF6vvv/7VVhTlHGfhh
         iN+9i3v7q2oXQZ+ZgXaOv1MSg/jcJsjrICvYIXhMMqMX/vR10hXp0q4xM7FroKcinPYl
         m5tg==
X-Forwarded-Encrypted: i=1; AHgh+RoVkZVCKMkEMtgg+dNKKG2KAJtA+aYLTrXDvXykFyVGoEZMsPL/98CfPdxOQ5J88Zow0T44JIErEfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlL/qWbmqKzbCfk8/zj5XRGJB/kBseAwb7YwY3F2p/6gxQF6MD
	HlTnBI/U5RktLW52r5/P6hSrknRBAwQqEgreGvIGyOabjTUy5tgujVwr
X-Gm-Gg: AR+sD11U22Q2OcPwRygY3HcIofcuA8HhfkiMfUXWTi+OTZvv/ghd5s51tva/kMkzd44
	6HivsQBjVwpVNJ56YgMnIT2/NqWqcPZ0UWCGS2NN04MK0pHi+yXATofvo6Cv054pZC17/xDqddQ
	wI94aqku7Ov2R2AHkWxrFOJBVZIQalKc40xUY0oiV5rryONjXxC4waAgtsI5IOKEDHhPMkMhozl
	wlZood+2NxCJIy2AXpgFqcFk3ZrrYCQDIrRABa91161S80UptZs1d7id/6nUC8saMb5wbK/EkMj
	59v/bv1fauUhsNnQABpEorQySwaGK/KuEwME4lAZSRJ/EzVbabYr60pjdN3WDcB4/lg91g2YH0j
	MV4QsQooDsJrQQyldttjgkhXkxY3+eWE4uxuoGONTTRM6TwBzwfbFPUppIrJs2fUfdu987GdBsD
	IsVrKugBDysCwzeclD75k/CAyNXOyrV5Ioqgu1SHkQ1GzGnQAxg3tECy6KylEAbAIOam7c9GA=
X-Received: by 2002:a05:600d:844e:20b0:495:5375:2510 with SMTP id 5b1f17b1804b1-496c6568a37mr33118015e9.24.1785273946598;
        Tue, 28 Jul 2026 14:25:46 -0700 (PDT)
Received: from grey.localnet ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm103054375e9.7.2026.07.28.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:25:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com> <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartYxrm5NhARqO7C27MMFWz9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks for the review!

Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> Looking into the other patches. There's more mixing of the clk provider
> calling the clk consumer APIs here. It looks like this just takes a
> reference and holds them. Would moving to parent_data address this?

I think so. parent_data::fw_name is indeed something I have been looking for 
and didn't stumble across myself. And I suspect when you say "use 
parent_data", you don't mean "use parent_data.name everywhere".

But it raises the question of how to handle internal clocks, e.g. foo_gate-
>foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
found via fw_name, and only foo_gate is exported.

For the other clocks I currently rely on the string matching to resolve the 
parent named in the static init data to an actual registered clk_hw. The 
alternative I see is storing the struct clk_hw * in a table by index and pass 
it in parent_data.hw, but that'd require managing the extra indices. Or build 
a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
matching.

Am I missing something obvious? Is there a canonical implementation somewhere 
that implements modern best practices? I learned that looking at existing 
drivers isn't always a reliable guide.

Cheers,
Stefan
--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmppHk4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoirHYQAJP3CdwusoH3pkXKfPo4
IsHXR5HpSkcfs8UCWKbXUiLjzTOXi23M6YRSjmwFG3d1x7/tF3zuRiRB7UoTbPxi
Dpcjy4P38mBhhj5ViTMPZEDb1+yGlH/55A3Q13yyGUZAYrWBvjlF1+CeyejwGj3i
MVs7cQGfnjS5eKxnSlMeu6YES3/GMT1FEr87RSiK1tIR7l5Ly+ZlVUeFL6j/QR5c
0fRWrLVaRuf40Z+Br0mTqVYameqPi3Y2txNe/WB5/6G3h+Pwgr8fa18n7kss1CR4
PLy4xOCkdwBhFr3V1XAwmLR903mrts0OzyiU2WEgelU4aIvO0g+IY/QpVCb4Tc28
sIFnx1o9RB82nrHOGyZ+tE3Td9Z8jdagf7NCcynDF9OBNO8d2p2VHrytuTO05BU0
6WTcRZf3HNTRavdGicG0D+UZLTrVSeATG7Gn84xOtEcqnNQgqGw+7FFrbYL3uvnB
zJpQ0g3TxhaSjw9l5WYghaypuxgBUI3vsXsNBCFUi9/LHutvv7c2UFoB9pGMO+0F
agh+s3+qnrEIuyCa6gMNO0ARQMjjfVWPCMn+QO0W6LDHLm9V862PI8/fSAHIJtBw
8YniFVm03EcJNgSelHRlZO20sDNBbjjcJdMzKez23UwFsD+debYrdpQOo4Z1MVqr
o4X7ofieFY9lg1CnhuLk+OK+
=e+iT
-----END PGP SIGNATURE-----

--nextPartYxrm5NhARqO7C27MMFWz9g--



