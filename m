Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475646;
	b=2V+PmnS9nunIGBT8ForwYx6CjtuyP0DTtPfbKo+cefseUjKzeELe9yS6vIsV2xPAuESC
	 jTQCwHRDzBybLSGZh906hcWA7Xj7nr5g0HGHQVuMbEZ1al8ewfwAk/2U3xdEwMr/kgA+h
	 dzhVtUHJz3Bn5npyypWgNHmZgL575CM+ZS7BqTpDV4BMQ5FgRuLJ3LJZq9PcN54II6SiG
	 +wj0kA31paCY2OULws5uriTS6IfwmlIjMjvRZ4JGgsCpgBAsmj11y5eRI1/uaTL9fG8Ct
	 JeaVzgEJRSrBfsY17HhdmgR+AvkyhMyIzth9O1tY1dC9Y/+PLdSyIXEB3SkpcbIw3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
	b=j6rCNM30jhyGT8o6QP+gkjPQ6inmB2mCaYljnHFbCAsgsywxyv9p1nsbLEwcjMrc5bpM
	 EBZOsmtCKnA5HTVikyYhkbtXFPxA2HkKEhYhjbylVkyzuKE3tIOfBf/v0iy+/px4n1JZi
	 3mh14xlt6tm0oabI+8ZJ2vprM/7pvkUBcUpBNPs5JhAVhZUGX75YQnxJwjtAOg07oFiyb
	 OHL3i/65HjvkbWAylvFLdXNmSrrFKeTTt6sdIoAWMR9yj4rZkeKVzWaDKPkoQAp3LZIkq
	 g36MgIj9spxTHnA0aSpqriyxTf69xjA1jZeAJPZfPxFjytEiJsfDygiFpjWE+HV/98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC7606A337
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AEC7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0481b35c9so21444745ad.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475646; x=1796080446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=cIpCEZ88w+pQmk+ulKPNTfEnMuAxP6vai3E0cBlxkiM2J/XApn/czsHdbN/aKXPTpP
         bWvDeKqOnD7/e/v0nI+KHfUJKLse1HTOLUiwbQYh3iKGbqlsAmPiyUcyKKppy3od8g5D
         OKhjK1wl3q21YovfcKjuBmTpRWD5BBncvPZNU4/nIcQUo8DsWSQJiz6d0R86DXloYb+8
         cI0W47HT8buqyOzp3R7fy88QRAPjDyIU0Mqp6RI0vXG5nhoWc+6rLInWYNmkdjywMrYc
         yyoGJqEkURA8VOIvXYIx7n6qeySHwi6sVNFmcRHwlAwJjpjFcl6qiXD5Lr25g4XeJ6ZV
         AqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475646; x=1796080446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=iTbk3d9BH4JnxJ+9Jl8itiiGdluYFJYG6gR7lIbRoBUG/VMjcxVVXBdsysPSqlyEtq
         LSEvlfLLqRPqUl1VgnGaMfazA+SkD9q9WGhDcIXOcFqibILNbGnPBD5OvH7wmYvkuvIi
         PdbR0mdBYUtuvL06P4qkeQSKgdbzYE2yVsCe9yNSt1c/h3V7GoLRQhE+Nk2wiZf2aN9H
         Bx7vlTNBKA/mvjikU7/U7K4x9frCfuRZmdAFCmEwecHWz9zjA46SCh0G5Pwj11XZsAPz
         HgjltxggvXWZJHDhIvzdytfwqVKGANM3rgOVZC8AVTREYzK5sxHerWpdPcBeVjPWsyaK
         TOUQ==
X-Forwarded-Encrypted: i=1; AL+hErE9zrQ4qL/CopElTfCNWyV2bmEUUjYcH+m7UCZmQhu9fV4wQchHDLXj6qmXgij1hbzYgnjl2ha0U4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ZnFnWoASXedrqNW+8VIHvxqwVwld7kxQ1utGYQ65xwVuzjcx
	lvtVvUmY2MWEzQTWRi7L0kta4IY/CM7vR57IbAGN5YGy4GI02LKaK1Cs
X-Gm-Gg: AZFdTZfvQyCk8NQGUdvpxYjj3ugPmcpwwzz2zAYDbFpupo9yBBhH/SwDGCzogeLISYS
	ier429P+szw2uEXipAXq8Wo9PeiAUsCTHAFRdyzSj9Y49KKSJp4PEBnuKwauqe+00LO8MPYm6ho
	qIcB8Xy5HvTFt7by3vHmjyQ3hQQbdJqG5pHjkJVGM3tBkRgz1MCbEjlkN7fb2kD0XU5Lx28wJWa
	PW0kwm4PE0gT8mnVKp+/jMhB8IaSYmERSTWAdhoOAbKohXFTSL/HHp9ARrSbHthopSh6iKR4+YK
	kHPsB0MgLkpTE6DCNswaoR5RnMa2wmK3EZy/tVZtrj2HA/IH7KSyROy9SaXn+zqkxo1pTYzUguM
	TFIG09qn0Eg7mv4WSGBFDB7LTT2vemOp70uj1LOnXIwktzRPETGePRHpRMQfB2Te1toa+6WA3V/
	t+TbhSjRZEiLgSQy/Nu90ByQgGDJZV8dM6gY5WCWtCFumJj5UxxZGv8LEnoeLkWAs1rsbazasZk
	tmTNyE6DZxe0L/nrPt4x6GmlMDc5i7b9TQCv+pCb+CSRoyR4aNLtTxNnD2jY2Vhhq/ZeC5uMjOU
	f18LEXCleJ8M9GgSRvIPdGDDkdd9Vc6l/z0yf2li6C+vhEMf2cejsVEjynSG
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr111523555ad.3.1795475645821;
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
Received: from X870E-AORUS-MASTER.kkp-group.com ([2400:4053:d960:1a00:9970:cbea:9dbf:d448])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm58140215ad.33.2026.11.23.15.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
From: Shigeaki Asai <asai.6265@gmail.com>
To: krzk@kernel.org,
	m.szyprowski@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain attach
Date: Tue, 24 Nov 2026 08:13:53 +0900
Message-ID: <20261123231353.3288426-1-asai.6265@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
References: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, I missed Marek's series. I didn't check linux-next and the
fixes-clk branch before sending.

I'm withdrawing this RFC.

Thank you for letting me know, Marek.

Shigeaki

