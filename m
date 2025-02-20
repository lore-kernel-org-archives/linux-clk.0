Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D5214811;
	Thu, 20 Feb 2025 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070384; cv=none; b=krcf+o2AHU52klAIUv8VSx9KG10QCxRG1F4MBpjKVxg85F9EdBbMcB3429hcvwIvZFP9T/rpsIy6mI+beI4wHkYeGaHfmHrAKSe7Ewl1VPo2DnHwDbZCNqGMYzNeEa6xeFt19onam4cQsTC77VcOjdpDdUyeba338WQL6OBBIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070384; c=relaxed/simple;
	bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZSesDWtywIzz/+65U1aVAxjzfpt5ZusZtGy6dBH9SLud14ncTL770tBNjQcqifap+q/a92nGFmYhQY+BEYwLiceqqnakx8T+6HCBZHh/hefrB9On71AbcPZTCfWTnOwXg+yfZ67P3vrsvOpgGNwY6qU3VnPOSUbfewKdqMrjrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnSa+DXd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnSa+DXd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f6475f747so501870f8f.3;
        Thu, 20 Feb 2025 08:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070381; x=1740675181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
        b=DnSa+DXd3Bgn8B0DVXfqIiG9BwrY8ZmNbnMt7q7nKj8JDN98zCM3EzWz44jVcFC/48
         bZ8UkOAfClVWTahrp5Rb8Jdb+TIEhPrIg2NopVaOBhElkASlQULYU4XjvVRbbnlN/CgU
         SNyOAfUj8rYignWeW7L8EPz8vcBZB1NEtFa/L1uT2Cz9SSvXjGoS6UtHa40lLj0qWCA3
         FxeaPZRx9UAfxNJPTxFvlZ/AgFqWpSgrwbljW++8VJ/r35/w8HaEp76tLAhZGKY1AjXm
         qnTX6ii9XHhaazguQhFTB64yYGhbgw/b28I7TZfXg+YX3AdU6nuMbt32cxZ5+DEY/QZI
         inbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070381; x=1740675181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
        b=V2u6Weh1snRsnOd9YPOGK/bPutgTvIisYbS6OOzFfyQPBqeKhYnnecGb2W/fX72Zv0
         H9eer2QUrxMaZvensaAuAg2/ork9mX9zH2FlHnpoVzCzHbkH00VWCS7egTaPJf734s97
         j0nXRfCKvl1bH90j4O4Y3MpGLCQspWeGFy8IjyCfiUcZHdoA+u24l+y9j3ReWDMzJex7
         IE0rEB+jkDa3IYfLc8IEcd7T6aME+07HAFL0+Z5x3ZCR/E+bdN0H4U6JJHO1fI4CEyNF
         zavt76avDTotA1a98mH8J1MO7YjxQovpNv2mIWw4svSjdWtaWNzGZHP4VxLgjcAVCSyA
         Wk/A==
X-Forwarded-Encrypted: i=1; AJvYcCWBxajUgABg9bFAOz8TYKxJyvZCBWon88Z1s4h0O8c9sJQ7aIwRB5+a0hla2WpMd3ocLwvUfmSN4rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzkIVgTemkiwGSkJMcPMv3wZwBL4Gp9gFtjMisLtGOREDAb6gH
	XO7l3CcJux1Kae4TVIdxBdEye4tdMsDxjfNAxBr803IgXCGXlUkK
X-Gm-Gg: ASbGnctQk4QKBLYmKmCm1YsXqEzJlR2gf07CdQLZkIUJ8b2H7y6L/OxV12w0/SuXmcj
	FagBl7etx25FEB7HWYE11AwjZhSC2iUO6UewXVCxOTcIc+sKqq0LBj13w5jmZKt2qoc4SvgNQ7Y
	mUv+SIVCWmtcqUdWy9V3MyjHBFSqcZxRjVKUuFBWIf/hThHCt6J6553HkAdpme/BZcQ+3yYw5uQ
	lau+PvfZs5fnfn8yz3eYrJzVGdmUAu5eQ8f5ycwvR7ndUaziZlHSD0040Np/OpFuMGlAizPTE1Q
	e/QVTyz8CFHIQpN2JrxnnHU8RSjxPk6c6TwEOIlKQtmRqtPkv5Cuw5StfqLooO7NJGU=
X-Google-Smtp-Source: AGHT+IF9R1J2b9pOHg2R8OpZtKAYl6/Xzs9od8AZO07R+//Ei/HImVgNSFfaHKn5WXnx0agt9g5MPg==
X-Received: by 2002:a05:6000:401f:b0:38f:3ee5:fd36 with SMTP id ffacd0b85a97d-38f65171413mr3374554f8f.53.1740070380661;
        Thu, 20 Feb 2025 08:53:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm20815789f8f.42.2025.02.20.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:53:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, samuel@sholland.org, wens@csie.org, sboyd@kernel.org,
 mturquette@baylibre.com, ryan@testtoast.com,
 Chris Morgan <macromorgan@hotmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH V2 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Date: Thu, 20 Feb 2025 17:52:59 +0100
Message-ID: <38669808.XM6RcZxFsP@jernej-laptop>
In-Reply-To: <20250213172248.158447-3-macroalpha82@gmail.com>
References:
 <20250213172248.158447-1-macroalpha82@gmail.com>
 <20250213172248.158447-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 13. februar 2025 ob 18:22:48 Srednjeevropski standardni =
=C4=8Das je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add the required clock and reset which is used for the LCD TCON. Please
> note that these clocks are exposed on the T507, H616, and H700; however
> the H616 does not expose an LCD controller for which these clocks are
> needed.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Actually, also LVDS reset is missing, but it can be introduced with follow
up patch.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


