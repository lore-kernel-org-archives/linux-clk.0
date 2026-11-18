Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996083;
	b=5tfAzbkEzex8FqByZW0+o4Fk47Y/jpHzOe9YPNONIdDNZFJGJireR+e7um+6NaMXyFHR
	 MZODPuVr3E0gvmBsMhqbgtGowezuI0FRdKKo310lQxgAyds1DvsGt0HeSOlPAEZw0U6LX
	 MEV01QvxZFzQg0KT4r5P8YD40hXhzySpX9D5hecdkRslRALMKcYp+NuEOv3kvbQCUtM5X
	 5/JuPN17LkBW4WOJ8cLl4FpIlOXyoxgk4O31+XI3NLdFjSTut7KntQ3mrfpetPfOLzPX8
	 RTlO11rMycDH+eBSMelLFe3svEzxZ1a4DJPpyo70znkPhT5VpAQ4+ALnTu4oQ6+S1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
	b=dx3hIvDelmWHukpFVD2RUOVjKtKd+9p9qq4qC22xXI/gB899yhy0Fl4i5nqkY3wd4clB
	 6sQmf2XkJjcQNH6ZIackt2SUXTLtfTvL3iVmGkwG67n85K9UOz3PBzCRTyPevdWq/QAAl
	 +qcGEDyiIIv8sUB8Us3jgGDIV8F0fTId6/gpQwC8HbKu0VmPdpoNDSwxCn0t11RYQ3k1O
	 /eMziQCl+NbNhlPT844lotTOYDZHSxzbUB0hmuDe5olQfzIUZVGKxe10JdvDat3F5CR7u
	 z0KNXr1d1wD5Fs7VLQDUGHazsLpgICE4yu1Fcl0VHOHK+64LsJ8yzBgl2D1HlHlZRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD77B606A882
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD77B606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so586680f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996081; x=1795600881; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=pKp3pifZh7oPRMGIdtXhtVCIF9w7fsfK1OjN9ZPXwb6hqnHbkJ5QIO8yaqRaYGMofl
         GLVxSRH8TK4RR5BHl2jApdlJoal8KdDADynWdzAVg67RcrXeBBh65J4+2RrqB5sogJ+1
         1exnMUssiaPwgqKELu8a+21av9B9EhMuA3Vfwx6WC264T1y4rjQXUlv+ar0WmSnLHF86
         Eib9dybZnE36/WA1BukkZlVvOvA27avrYxdG6YYa/f3E7XWJwQq1nb9sSLoclVR7XSD+
         wm7rXHqyIT6BBdBVG9SNPXK6EUrWCHLMhtmFEpVn8ZhxlCS6wy+hfX+nAAHvPd3+7HDc
         Khxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996081; x=1795600881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=1BFQdvgh6YNExwnE8gZ8IHR0JhcSUCnSItx875DQQ9YQhvTx+m4GVFnnr6hQb8hKAl
         71koNjxPV6omHNZ3+lSwxUVsSZ29ekpL4Bo6N7DHYn6BMX4hHRvJf5PYVhR9vOVN/uBS
         EhgQCT0O3Ua8XdGt+xZ1Apn/IVYhLFROCCEllsTpzWtWU/ZLUxthD4aPZwHBJbPS7Gob
         7Xru2ARSV2bGLwJy+E+nwq+lrcQhCqVdSzEmLbEd05dTLgAtfaKX9ZVW40zFfRc2W2FT
         xMuppMyovjmA9Js064RbCMYuYOTRNM4FBSV0GcJgEkppqZzg0WA6d3LR4D9OcIh5Wzyw
         3Y6Q==
X-Forwarded-Encrypted: i=1; AL+hErGdXogtfjcOra6EXMiRDbp7u7MzkFo0wId6yyyub3FKKLpHcwG487bY6LW3uA0R38TBJZLmV2Mk6Kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9peCOx+S3I+p8rDiUTCma2oqARsXtovgvu+s41IEtAjBHsBq0r
	xIAGH2T+/oW1HkM5XZdA4iu6NT2uuMtZ0sQK6qqQVbApqyOcGqazm3PXLjLFoxvi6HA=
X-Gm-Gg: AZFdTZcGneq3n+lCPXDbmdl4bWPbnA/IqTqKjqt0Tae09fhaFw+jErmN13486OCe2Zl
	8RRlKnNoTJXJvvy1ZxN3V5G6a0FiCqRui2NzFK2tGTFHy2v43HjPwIulpar+34M9NkBAoM8Slgt
	rcCrcLtOyCbugrjmuR9vkKhavR5orMtkMHQ9TKiryCQBtoBHnWbOyBxDBgyZ1889/zePixhGkdn
	bJFGQj0EoeNCCaBvP+wB2D5WG7YMmsgY0uQic2sN3xuqQ5Zio3mz1lZR05qGDQMXy7/r3pSJBHh
	j9JbQ+TOYU63ymL8FPGvsUkj7eHvLbQZgRhM1cTluNgA0/aOufBkKUQLp7FJFhmshG/T6JzdLIN
	tD7U5Iul170yL32YC/ISaaBpae5SCXOXAUGsynX0Abf6xxGAc+4eulyRfu8S20gxZE20Je/u2ea
	ItQQuu5DONPFxMRrF0EK5At77b5eXImWsYAJlMDO5Pf9cQk3zNjlVaf7YikAhJxJAhBpIETbHZq
	/mJ7jPuyp+iLjuQVwi51y36n/wynfkCdeveD1C+rlNUrv4AQeSm0FBpgeeopN1MteXduFQMG005
	Mts8zxe876RcsbKwZi3IMEwigi7mQqWrXg==
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr4182620f8f.20.1794996081159;
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c257sm3680960f8f.13.2026.11.18.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:20 -0800 (PST)
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
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.16082664027719861712.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=429; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PtXjyJ2j06GU7bMSY1qzWJs0ZQx1vl5iBDW33+FUIt8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3M8boiXW+kLOhSXHZTU27xnp5PmcweXk7N8ZknuX
 1v0M+5xRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZSGcrwz2CTn+HNd5EWG9bu
 uVr/eSPv5Aat481OXnkbIqTyq5p/+DH8Uzpp5HBPWOtsl+SVHVlxdlVPN89t+rGZe5WDQ9zFwIm
 ijAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Fri, 06 Nov 2026 09:30:27 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
> 
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

