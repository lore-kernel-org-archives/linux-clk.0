Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541640;
	b=w6IaFaEGLrXIym0BLOzJwNQAGggLZVM21RrUyB5yHr9otXbhYqVCYsLvSDWlazquJ+jR
	 9Y38xI0L72MPAyublAmYmZiozEH1xdQ39rwSAsmvUJIoZPNBnKxuM4IH7KT9MtDFDkXGY
	 6Rdbg/wHvJ/A4NUZSR17JM7hHBCazH5AQpyvLKlMOTBgurmpkyO4KIMgAXhBVCp1amdeY
	 WwWxfXgMTjCvPHT/xz8upAe6fbks55B+H77PMkcoKmH2r3q+F3F58jzciXHRdeaFoDMgi
	 E9O1OsksK4IxK77kvKZnqsU0Djs362snoEBUM4xvL9eKT//vmle+uFqsuxdGdkyYzFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
	b=xc2SRTGZe6uDB04WqBV8ikJ1m1NaKYvSOs2W/3oka1e2psSimqdHNmqvR4QeCM8zsp4B
	 36bRP9CV7KJAo9PazxkUJ1WV0B/6glhaPLdUis5QUi3L6u6bEmkSiM9W7wOVqVxxU4RxP
	 mkZMA9oAUyTb2qNcvNSRL+su4ddUoB5rT419gXiNHhl7uqLjNEQwvfeyMWvAUAnRepv/3
	 58MR0K42V0cg6NhNUXfxW4MlMQFBLJ1umoUGNBFdp6FFWNc/+EMBfNkk6Q6i7CJMUBwok
	 meHDUQ04xGzvtEIiwBpIF/CTEsdByQjeWbBYDbwxRnVRxfX7AitCzbFLJd8TiV/lTRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA34606A331
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 17:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA34606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso5987946e87.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541638; x=1796146438; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=DWhauDVfAmirslFngHjTM1mnMVETNpzC4zCZN6Nu+H+EhFIW1EEv9E6qUNcbdXp5+1
         0iNlpLKUe1Guc0WO6iclRDlL2FbObdhb1InOgL2bK23VPErxebNUqb6vlIjJfrJhutuz
         fAp9WJJ6VP1QNvnXVlxV4KqDZRdNvCWldx1WpPDESL2wvxsBdPh1dEFhxFGPXBw4JfxT
         GDdJaiu+Rlk6h2EV+32PBMl8xTsqxq3qGvHW8OqCqyVyuSWcziRUT8LHfO7RXSFmTkE+
         f0jbOJOGFh9KJAtkYcn1jePsLEAldHTxiLK2g5SrnhAJ4l1QPfnR3f7FBPGl86NZ+hsN
         5S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541638; x=1796146438;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=aTKgX6MY8aLL+XFi9Q2SOvBvbYlbgAGw3MYilRx6n2wrg0BnjocDd95pztKEdroAPl
         ZnOEGD1bo5VELnIv5iLjjMVP3gvofyM8ePJvuSPgdCphXjTHLSrD2kNSZhi1z93v8wQO
         gKMrXitLVWGCz3B4E9mJXkhMsaNtJdIzbY4yaSVz/1ixoXKFw8ykysCqawzIhT4acwY8
         JJJufmbD6v6Qj8TnZzICpWn+Y0oV/x61jgAqNRmFHQkqm8FRX2CyRrL9O8uPCCk4H2eA
         M5Aj1LHlayA2q6B4tPYZyFbJGZOKHgQWTzzRoQA8+wMFp0+BG+TE2/lPgrYsyXNhgRYe
         N+2w==
X-Forwarded-Encrypted: i=1; AL+hErEG646WMMoaa1gCjWH9TNLXuyOq0RBPxZ53wn4qTQigQCAp5eXnGNnebQ3xmg+0f8gWYayEYi7w+B8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rnjy17TniqO2DAKqBkxsBZxucDCPpfDoBMNIwfGtmVwjm4hnH
	xR9qA1FrmPzHmi/sOzCN9gNv72wFn/NAbdScfkkxJ+ZcMgojRUSttRqA
X-Gm-Gg: AZFdTZcl3rgzcZ5oyAKeRxc7793vpI+4Pp8+ZGvFemt9HV+psQkCtVjdWY8SFPOX+ZO
	1hmIbmB9BHJqxa00QsTNB+vbMY5t2RCtByuC1chxKYswOUpGQOPxEfi4Ka+84eezAy7PzuC2mBf
	a3wZgwC81pLCXRleJJW2qo3nqk16GPVd25DBao5fYp2wwjC74aQHvO4E0gmGSjyfq0fZsAP2/Jl
	9yP4YcjtI5XYBW7L/KMLSDd9uiMGJIDN7o52tYm5JVMUDtzUznycbYb155yOo9OdIY95rj9BD1Y
	kr9oIwclBPxl8Q1mX5/b7a1LT8V9qhCl7UWyjAmaKgNQ62oMqFf6XXiB23Xe+9bnCbuZQTIAZZx
	ki+/B0cebBIx3PatSHhtNlAqLI3fVKx3hX9m6pjZojWjo880zme6UiXE136e9mO/hpubnM7FDZE
	ZMhyhgSL5JgrFxxrFx3ju/N9s9vRe5OlwGL3EbPAes67jEiU8piGIoZ/xjKZFv60gw4rijvPSGE
	boqDD5jc0rR/QHoSdjq99aWneYwLCXzgSVpcyR/k9lWwxvW/U38O2fmNQx9J7gymjfCofKsiyDo
	TVDN/SS67prWIVGiED3rD8E/DHBNliy1lvyCJMPXiCOc8FX0Uv8FEso=
X-Received: by 2002:ac2:4bd5:0:b0:5c1:ac33:5a45 with SMTP id 2adb3069b0e04-5c1b79fc8dfmr4560944e87.4.1795541638132;
        Tue, 24 Nov 2026 09:33:58 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm3990097e87.28.2026.11.24.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:57 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <awXFhjXhZ-e_QM_R@x1g10>
Date: Tue, 24 Nov 2026 20:33:35 +0300
Message-ID: <179554161506.57.3046327489415683188@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Brian,

I'll move the reset controller to drivers/reset/ and send the CS7542
clock changes together. That will put the strap-selected clocks and
the PCIe gates in the same series, with one binding for the global
register block. I'll fold in the remaining review before posting it.

Thanks,
Fil

