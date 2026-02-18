Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315F344DAE
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771442895; cv=none; b=SlciE741Z13JkFh/NAcuNPqWgjT/w7JfrMR25tvddH/FYmHmT5EozPolVmKMLcJiW2vTXJ5i+aVu8bE5Pd/xlanxo+k03L0TzAIYEkKLalRsUkxAsTEx89NG8LN3NRIzkVY7OpMwsuqnUsN0bh0BdEfMknCFBfnmWdZqRoVf5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771442895; c=relaxed/simple;
	bh=KCT7Tp+ZxXSkoxqSjXqGupm3sDHuPZyckCR4M53Ap7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K8oZnwCT1uMzx1rhycsSqIw/DpL/THDIWpwg1vYnPdDtqaEjUQT8Dq8hdRZ15W5HbW+gEAchagA09CmZcMogCNjD4Uvggx+/a2JY+VB3iylv8h6ecjnB+nS6aVQNP94utPXzen43nQSlTveAiAmOeRpvRrIJTO5HA8qVrGw7DIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K03eMUDd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K03eMUDd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso1741815e9.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771442892; x=1772047692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FCYIJj0Xz3DNfT5NA4cBOMj1BDhbRNIp0uYNdaHJvk=;
        b=K03eMUDdvjFUXgFMgCFjCpBJwP5TI8/qDvlJIXHJ4hOWcEH83/f0e2+YQjpfautoh3
         RexqRuhf44rheQbatfLg0O+iTNTaz6h+OWeuDqi5oDEqyX/aClHJ94EpcRJSvTbWoQpd
         hiDK1EJlYEuICPB7Gbr0lNxGo0ZmJHtuITHExlaR95ZxEM71ZK/xwG8+LLqKs5SXwnXT
         wGeufIcVKxY4y28HPs8IegE/cZc08gcHRNS6tHHKaRJC6a03uFxmJPfWbbc8cVKhHgBp
         W62YJ07JTCfADkSKu1QbAX4hPdvHrl5KRyM4suyI8eC4eTGGQEZGwPZ/QOUdBrobHF/w
         NWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771442892; x=1772047692;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FCYIJj0Xz3DNfT5NA4cBOMj1BDhbRNIp0uYNdaHJvk=;
        b=T7q9cCIdBT0U/Sm72HEWwLgN/5zcqUyPsfwwk38hainTlmbEGnHvZJ+JemcUWg5j1I
         oKpjeGyEmmAjXAdBuiTnnNBiaZzpUNlcDyW+4h9hf87v/0L6LHGhRfBO91SIXiwNPxiS
         38jL5sqHlw9nHU32wz8HAq2v2WP+XnoY+CyPYoQL7sYaAIwjTAHsdEqkG/LwDXbI0laQ
         QvE4r4Yj1GFVgLLHuOy8aXv3Y8POAIbqJgWulnIoTCtlEMzYJvDxdmQIZWKw8yrEn+dz
         4e057QuVe6Ah1tgPjNiejD0yDWV2/oZrndVN6M8oxS5qnQuIaB6XcUchgrnk7Saa7ZsU
         KVSA==
X-Forwarded-Encrypted: i=1; AJvYcCX/OmA8oEM7nPuJa9fQvdNghL118r6yeAwCixQ+Zikf7oLE6oSP3eQ+xDGd9u3brM6tTZsJug8S9cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycoFEpB/O9OgAmdXG4Eupep1gCxS9U5UdkiUguZmCfAZzt684V
	Eu6xn+8gzD1m3RD6VenMNKtbkI234N/GgMBUdUbjZ3riLURL8jN37+SUdIEKKScPaq0JPzSUaRN
	0HFgk
X-Gm-Gg: AZuq6aLCiv1TdpgMixIjXyUWDxnz+jq/4e7VmwOns9p6sYlzp/wOLNCxJm/V6HdpUAu
	/QcHGfXHAW4IwQT162WYKbj4ZB6hP69LiYWBT+KUIoajxtV3UytiQ7IDkDHvfHWbdZmCU3aGsCL
	WaGkCS1cb7Fr5/VGgc9ogvSuKxBHra1ECwiXEj0+iBEFMESQluh4H0pSUTccryZlPQVg3wAS68I
	aTb3FLzXP/XpCoN2DRF2oVMwcP+h1ZvYsbiy1enk1WgIFTxZxg0jPMrGNWlpbyYF4v0cgQXbWPz
	i+NWZuZUDTtLHnx+EwTCQHKjSwqRTIvoeBCBjGlM99wygzXyTyYhltWA2vZ1AwzqiWlHBw6kYFG
	WHJQi8LM8QBtqJjfk7wM69T3qbYfvguBzU/zu0ul3DvCCqQ0CrFF0OJ0dhUPdc8ZW1MAoY7ssyC
	wRobdK+TKAg7jqiiFktRKnng==
X-Received: by 2002:a05:600c:3b13:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48398af1ef9mr53949695e9.37.1771442891970;
        Wed, 18 Feb 2026 11:28:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4839e7f9d1asm818125e9.3.2026.02.18.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:28:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
  linux-amlogic@lists.infradead.org,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org> (Krzysztof
	Kozlowski's message of "Wed, 18 Feb 2026 20:17:53 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105611.36216-1-linux-kernel-dev@aliel.fr>
	<594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 20:28:10 +0100
Message-ID: <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 18 f=C3=A9vr. 2026 at 20:17, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:

> On 18/02/2026 11:56, Ronald Claveau wrote:
>> Add PLL for the clock controller of the Amlogic T7 SoC family.
>>=20
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>
> So you ignored my comments?
>
> And that's v2, not v1. You sent v1 and GOT the comments.

I think this was still v1 and if you look at timestamps, Patch 1 was sent
before your first reply, then there is lot of time between the different
patches - probably done manually  ... at patch 6 (the one you've
commented fist) was sent twice.

I think there is no malice here, just first time contribution with a few
mistakes ;)

>
> Best regards,
> Krzysztof
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
