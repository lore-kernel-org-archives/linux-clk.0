Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69332A3FE
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651865; cv=none; b=jvRMdjpSy9XGTnbOGkMHPj4s6ns/whktCDfEVmaFjH1e8akilnzB5gnTAeQbbj6HZJ+/22M8eleW0lmXWgS9iWMwex0TtGoOXpIMWgN2TdwD9j2L0Vr2iM8/FYqkN8wZY8lk0kgc9p4Sk6Rx1yy4GWPNqbgedR3Ve+SlgaT4d5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651865; c=relaxed/simple;
	bh=VjhcrRyFSt0TCIckPnHWQoGZD1/E2QgBBydfNjacV3g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OI1pWLeENX4dYY8n5PpVHAoRvfQ+ng02G4bEnSNwjU+Fw/2b/b2FvPb3c7kcBBeuXCogLOrj4wUmkV0vAoQ0+Z3Vc9jvVcZAHBRWfg/6kctwrjMw+hJ+ioc5s1S9GM4nQT+WtpuQxLkXXaO+vbSktyG/wdqAi9aI9UWmXOxQFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BB9vVBnQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BB9vVBnQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49550ec592cso16622715e9.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651861; x=1785256661; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=40bhvWuLcQuZkugmJitkPWKbQ2rZP6fOMYhTW7vzOYE=;
        b=BB9vVBnQFYh83f1LRepXies7Uiyv9v1dH8oHj6IVNi6bjNOQ+2XHgdtYrvteumKCB/
         YXcJNKRc6KUabik3YqdJUy0O6ZVfrXfsRJauTdbbeOvF24ijEP4H31w4jK3ocTZo832P
         het5rYEUeND+lHPKnehzcPqFFoeD77yAcETV0nwIy6P3pLx3xvaHqgsGrfdIvY776RPO
         LvwJFd6dZZShknDB4nsBbuKpRxGS0daK/9lnOkOCfdxBJK50BzNIYbVYZzVOopKl+uHG
         JG6rWPOhY2AGfh2O1yz+3tDLn0vnZlSdwyyyyRKkwRK0lgU2QeayYSJGugBjvo/4Syrf
         +0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651861; x=1785256661;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40bhvWuLcQuZkugmJitkPWKbQ2rZP6fOMYhTW7vzOYE=;
        b=NN57Lr9f9g02eSCiUs4isMun13Rb23Wn8GatT3KdgQSkBliW7andMH0wue+b+6hRqW
         elAPIfx6z61UwWKnFXYtlxfBw2X4DWMLVaW/D20SWvXBKMFNjF/va13UixvrTGxn7oG2
         oBEz+B3hUN09XmpyFyQ+gYVOcfHbiZiTRnojOI+rKwIMn9Z1VGmQ22jF+kXRKqqMuut0
         BIIUlSLmL3K/kUazzVe5dL7pCNxaBZSwEgTB6nbB1At9bm5WyPGWbJzt8D+K4OFDA/zW
         xizGIwbr4/NH433uQswna9B7MIjnLvwSbCzm1wH8NacUfXokO/NeReslqHR9ogbHiw8M
         EAXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqdM+vumS/HzScou6m5VQrDh6My6Vz1PgND0fbrdBksoK525F4/VpUIZecJ1B+RpJva5aR5GsH7ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlB+eVqn1IoiRODvj1ONquejfppo0XclS/U9Bqr9qmc9R40Zp
	hmaWlrKDjLhI8X4E08306WVCJEOQNOfWdehleqiMWmUXdWQsBVSCxpCbWcmNh+Mm1jQ=
X-Gm-Gg: AfdE7ckLMAcOfAV9zibyyB/cZXkIm0wAISStvE83c40dn/uQj4kuL/fRLP8EmQAmqXG
	Jh2q/H1bHhOvo2pGzs5U+CC+HAhBXqReiSYWDYt5pA9cVj/ulYT88Wx5X5cmWBg6z1Y7d+PI5Fe
	HdBQZCR/E/kjMJ8YgdWZToeIRIO0mpLDXBAi02VsARPxU8JdlC85rBGMbyYFIIO0KolJBmeMRVJ
	Y3KolpDMi7BJZ6vDyQM5v76jhi5fXOK6spKLiECwu86ED/0BH4UcjFRB587MeMBwCx1VJWTFsgZ
	Mu1qv+5o2YgX0GBbjMtFDQ97Gt9lcRGHXWskcEG/gL8p77LyIoPLMqIJqoeYTgHwAia4677EucX
	FKFSm3C6rf40IRAI7z5etkSytxpkDC1yS25HQn0Z72L00Z4BXJ5XDEuG1PznO9nScv/9iOm+B6y
	F+goavbkHljXW1hGGq/GJYW8XiYkP1D9g1q0F2OxhUNg==
X-Received: by 2002:a05:600c:4f52:b0:495:3c6f:7c18 with SMTP id 5b1f17b1804b1-4956a4e5a97mr4023405e9.3.1784651860712;
        Tue, 21 Jul 2026 09:37:40 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm5630075e9.0.2026.07.21.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/3] clk: nuvoton: ma35d1: fix ignored div_u64
 return values in PLL freq calculation
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260721021356.288506-2-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-2-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:37:33 +0200
Message-Id: <178465185379.2337945.12880705771823574527.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=512; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VjhcrRyFSt0TCIckPnHWQoGZD1/E2QgBBydfNjacV3g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX6BRL8ADPhNE7seqx/Nl8A9UxAuhtpaz1L2br
 txXpv/EUGOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+gUQAKCRArRkmdfjHU
 RTx3EAC42MZzcbWJpEFwTSKiCFHwt4gjkRkZgRUQxWAsDk2tWsQ97GVcI8KqxA+ylS1j9XSzqW+
 05CFk8TgChSQv6wtzI16rw6KN4wmcry1MriTqZQfJHOiu+qXKksY+PUSJ9O+fypgf6Gkqpv4WKa
 mliPSO42H9qUMojFukGZhtF9i19UTAy47MbU+LUemgur7aD39DfTHLHFwj2Zd70G9Z9q/jAf684
 nY1l83yP/iIO6Vj56eUu37kEMZu77xZhFmZiHquG15aU8a7IgbKIaUPZl5iT81LFE2ofiesiyeb
 Zyb9u5zjOkJE35qg6D5k700ntoBF09W9YqkN4O12hbnL6y0S9cxpAjgiFpUd08eAKVspHpz8pfs
 6kB3zDqD58BCUBRyOxYdksjT57ougOxiJ2oK5sMt3jQOkoUJmc41Py2T6JSaUizvoCwX0O8nMZu
 CiIx8WPTJxy+mgACTJbHWsYkaq9uU4aK2HDsUKLmOo3zPpLFiQN7Q968uYu27tLWfUJwyWsrTS7
 d15p0mhBv2/dC7qbW2wPz/sXydM5ob4XYK0zv6p0vLJrPy+DZIH87IkTT8gJS5qLPb977A8JGC0
 lqiPQCc4RH6XssmdZVjSdMKhs8fsSCufgNufyJ9jpmeRKu3G8pasKqVXiC3LzcRb1ijP08uwTqA
 kRS/W2MzC3k7f/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 10:13:54 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> div_u64() does not modify its argument in place; the return value must
> be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
> called div_u64() and discarded the result, leaving pll_freq holding the
> undivided product and thus returning a frequency orders of magnitude too
> high.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
