Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210981;
	b=sTU4qkPplwAluUsDwTsA44Dd0GSsghA6LPKt3HtaqsBmV+iOUrfOyd6G05qvwG6MxYnV
	 L3LuKNLvgOCW9NwZtuN3em+Rx8Lyfy1wf8xeRSvPy06OVY7AivQmOw96gVtqS3m+dah3d
	 YqDdNUoT1UbB2p4yxpc+KUMmj4ItkuCRaphl6xbkQI74lj7fu9McJp9c3Bmu3uj1pubHl
	 sCeosDwpEHXMR5aNu2TQF7Ry6mYAJr0c6bM26VdbiliWEASWKGc8ZSHyyI1VTShNP6Fkz
	 /LCDmQOmLlea4HUhWxCsAVcm4pq0qZDWdbaVJdintrGyGQ4EObbXE6cQ4tWnKQCszmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
	b=tcyqj9nV7SYbAHfLrzO3jU2ylYUtKd2ZwImXpdkXn20jze9GaEHIoepW7c/907sNkSeL
	 SsAm0JM+Iicn3QENYOoCx6cH4W2+NMAcciXNonV9rdJ3BjH55tEGOf21H2ayfRxjPhh28
	 /uaOmo/qrOs5CLcBVaPF0Q2Rpv+GW+dn4BxFM0jh4XnHxvzSYV4FEo5gSYqIp0pCyYgw9
	 MYhgsQdWpkKDr6MM0bSXRY1/ljXTNgvXFEW+2djikKcK1RG6tte/OkCkrU5aaPOjGDnfQ
	 wGBLAZYgBv0lRp01IXjMY3TyEtz+NZsaLmXhQJ3rq52oWYkqLjKSZZvVnAu29NKZ48w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oO/N+9o9";
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB060A2616
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EB060A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oO/N+9o9
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so1992882e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210980; x=1793815780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=oO/N+9o9E5hgInbizIBpOnxStfoV5gGix/Yl4+3PJyrj2wRmmMS9vx40Wz6tDznvUw
         5poZVaJplkm9BsnUAsJFZsxt6uppIywlfhhhrpDD9CvQXQP+iGAHNKb7vCxY0w9ZRO9G
         YgVJ8LsKzrWBk+3goN+BdRPhMQdfn6bp+pf3PQ+kGN2cU6Qs6wW45LQ/aXK2MAKZTcjF
         0OfomYLIz9k5rwvRhzR6c21eO0sJ2sKX5Tla6tLBNoQEA1MztD3SWGKWHWR276v9KxdL
         DcQi/L38s21/8iyspPNZjAQuT+cMCKQ5IEDI6HHh7jeh90fhGq0f+Q9UYRxC3wYs5/oX
         R/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210980; x=1793815780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=swz0UtpX4Vr9Jp2/xl1UbP8MMuRW0OmGT2jS4Rbsa991Eq/EFfQxunIB5hNd3EMaZA
         WEaP8jUCYOUI4BZapMAPy5P37ah2RTstUnnMsXJ0KFYjsP1kQYVVpr3hfTYD5sx20nwF
         if59ZE2lWN0XNSHnadGzPOU/5vbtt0Zc+GhabfF5uecyB5ue4TU3iKjqhE+n0J3v7NSd
         bYX4VbNNCnB3f0H2j6GtTcC0v5Db8rPEgH1DrQ5CC9MofU06aB9PJJhnLIkgpwOhLLDW
         F6miyxnpDW3Z3a55JYdqnq3mGwR8U+QDWrrZSzNjTag0xcnnA1KUxh7/IJ6knPKNsV1R
         PDYA==
X-Forwarded-Encrypted: i=1; AKwUvBxy7a4frubM9CTsnRzJBxmM7LuuVCHSJ0Y+OK9fhCGLglwFNZU0cY+k/fmI+TuSNBrI1oVuD+39q30=@vger.kernel.org
X-Gm-Message-State: AFq9FYIen4RzzpJypyjVdRheyUioZ7lR56TUmtclYsYTO114V2DJTcvp
	h9UwmfCN8NOKEESCBjCmSfzWR+NM6P1lR0sKwSmZKsexiHWfeZOUV8bw
X-Gm-Gg: AYBFou143eLHTZRBWl0voJMI3Ts3sL0J9tj5XLKFdTgKswDd+aR8HAwlW0+uMp0xBe0
	gV33CR94qNWsrKwroYJzlyctUxI32z9FkHnf/uxDc3KJ0IKqk6Oh4L2FGaP/exRGYWh9wksE7cr
	ztrvUGFHa81SzB2pWacbUnvLzkk9Xy+wfGuqqWUn5KfZbhFPIjsOtBvQG/e6yGIsTq3vZsf0q3J
	QSCN6R7bnagCwX7+Wi8STG0ZukoQ30XsxaFNmhY3bh0482tQtHoaV3vU7XW1UN3z1GDn0JGhXZ2
	2QB2mymRYF/ttNUwf/1P1aMbCAhkGBib4aNEtTJLWdoS7wSfpy7wgOoNqtHQLxrGcujB6i+MpDa
	KQCfwPpRcHp8B4CPdoKxAY407+PgpsGiIruq42vzaA9rZJsaxVI01LAC7NbY1ptMX22317u1gD7
	nLLFNp3ryLTL/mdSLM7zUi3i18aCN37smT/iylNZfYy2hs3a6zUxi6P8g74lINV8WHcOpY/SJkw
	zpbpj1jCQa7MY/AFjKQc+jSzXaN7KhQmVxtj6GZovGYzGEhcNeme+j9fEDiEfTiIU8C9X9L0ko/
	3QAvfVbQInscZPYEicm5qLgXWLl/VZNga7OiqA3KIhcySyL5RF8qYolHuaHiZ2aL1biDw1Lh/wF
	ASnk6S35lJFtOuhjzaz4ZKY+eNdugPLDxZUNK
X-Received: by 2002:a05:6122:2652:b0:5ec:2394:fdc5 with SMTP id 71dfb90a1353d-5ec587d8fa4mr78307e0c.20.1793210979685;
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f93a492sm2588887e0c.11.2026.10.28.11.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Wed, 28 Oct 2026 15:09:13 -0300
Message-ID: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual
has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
driver can't enable it.

-static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
+static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents,
+                                    0x1348, 24, 3, BIT(31), 0);

I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
and the USB2 PHY driver for that port are local, not posted):

- v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
  (-110), 4/4 boots, one of them cold.
- same kernel, only bit 31 set from U-Boot: the host works, 3/3.
- with the change above: works, 3/3.

Same DTB and initramfs in every run. The SerDes gates were also the
same, so I haven't checked whether they matter on their own.

My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
know what the vendor one does.

Thanks,
Vinicius
