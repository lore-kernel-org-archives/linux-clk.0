Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372124;
	b=liUwp2NLEH0XDAD+cT+JZQI5OToWA/Vc/Qd3C22UsvkiF1/SIC6A8G0qlwV/T28D8oNL
	 lzM9JwF1C4O9DIroQwu+BdQ3AQefMMhIUllbxDGJzUassyEDI1+4GQYsQCGLL4febWVtC
	 2qDEWHpQb6jL0B501NVE172Xl75dBRgr8UWRxybNzIoPJfzasuhznGkuTAQdFKcA6aXjm
	 9k4ttZeQmgSDL/LaeDBKWsb5BhK7zDA/f0N3uDBpbdKsKuevAFPoCJLoSB87Wcdv0ummo
	 IwW7WGxejEGD9WRgjDoe2I8EKPW32Zotovaq+R31YfwWW1MdMGcsyHHDLzdFPs1lX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
	b=QRB0PxToQadN4QeKpWPvoKW08jPs53dKsE8p8qcO2GszwQPb/BHQ/KmdHNXtdDv0sMME
	 maD19vctb9vtioEIDCiAW4C+FozjMb0iVFutYLmfiWaFRobfdsmMbPxSoiYVqzjwgpayb
	 lkVlAVLdur5NtsHFCuNn9vOcAv0dUufMLAxm8rY/itrM9YHLwnapSdpA2yp0gKlKxKvSr
	 9TcvAImLVAlEBF9cbjfykc4sEEz9ruA/AurkSRKDhZKKC3lr+AIA8398kYHRStnH0ogvm
	 Lw6ybVxKv+fa7rseK/6clZfiy2EJKjNIqBr8sa9YPiZG1X2tkjLTBVvOcDgov2Wwp8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C9606A327
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 04:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso20931eec.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372123; x=1794976923; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=Tb8EYn5UL5TPN4jrj25I2JBolJE+4LfY73wyOfqANHUNWQ//ZRgSlRYHUVN+LIB2we
         MfjhZtYgorMdYNUUdWxpYmku5O5oKZ5DXLNNPmZoqDaFMmvNL4HwqCrDmRa5DFYFoTwJ
         Q63GoZ/tv02pI42Ch0YDvkYx/G0C8eJzTUJPlQfYc6h6Cdhj/Z2lNDN33mqpZalTb7sI
         zFgSrDJbeHJ25XyiK3oz7d+AXggzRSfVZT+wwmfeRA6sKT7+AOMlNUl0NKXAb/8A/jyh
         Px8hGxqnssvWdlULG6GGl+pi7O/1Am0iOHjypP8QT4Hg1vzoe7dAX04wln+YCX5neXAg
         RqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372123; x=1794976923;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=1AogmxsrT4f7LwZJrAlbvw+GqK4g6ul0jnDhN/6g7Ab8JZqJUOq/RuWODqrFX8bpHk
         2NfKRLbHwFjgG4a9uiPMEjCSUvJ+IIRGp8eUmBcL/CYd69iVuXCTAribA6ObrLZ6rH/t
         x5ZjyD07CGbVvcsKKwyoTjwzi3WUKA0kasbnBj+AI2MS+fNr8IXRS9O7b4sDZwXHfCuJ
         E3LeOGImcferdUg8oxLJ4Wi2d0HKPctDL6+GrO74ZVvX+WlA1R1yUPmviAKg6J1uBxXp
         LU/WRO5DZvdiQqwxxeGbnPaa/q90SO97qkrdj37oJIGLeNzjAxhomsOjHjurjVt5LI5F
         16Tw==
X-Forwarded-Encrypted: i=1; AL+hErFMgXWsl6biw102+njNJPCf9bJKjCbAF6W5nGFp/jZ3I1sMnHZR56EPvlqDAbzl/LYymsdVEix9aLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3avQzmnHQn7cbMomwpUUPY2j0yQ1YEReI4vQS1X+iGv3GB+GD
	lZuEP8TX8In0FD3kM0/A1cp1vKKIx2/ZBFEDDm39VK6D8d9uUna97gYe
X-Gm-Gg: AYBFou3SYodswmssfyYSHJGz0TOg3t4PGhlN4yaWmwWiDarSvQWR4v6YBdL7Et8Z64k
	vV7kyrNFc2WlloWwr0fDSpFyURl63wI4ysKmbsxZhw2+swFbPOCClqahAFDlmFXXDWG6HvIfp3I
	z2dWpF7qsQsi4yV2PIr2LviIDfh6zpw3cRsJwxBx5+XieblvXYzT3tdZGeDxD9GmmEmsRyRoM5U
	i7V4239tPR2ZCGmtU3yjsK9yyt7X2S2Ms7TKXo2PmYm1tjxGnr4hf0a5/SQGYaEytrenFRQh6+W
	HjlyMRNglm9ivXyM/qIka6FNGtKSz3X69R9oAcXnoraKdKcWsEVTuS3tAj5mWg8BZgvBSyhZe+b
	khc0DsMVaimCh76TSvKKP8YjteGStRdak4oAWKr6HBqBj7mZ8l8A+E7DplHPZeT3ZHUVfZAUlJc
	G+A/XynMKho+RzYBkKw2jbM33/Z6GOLviUqQWiC3lX+nDtSrcOKyIR0EDVtd/DeMwh9VGVtcYKJ
	DhTAZOLJ6wti7NNcx0OwJNvFAntAsrVUMfIsHDjDi5xyX7lxNwOTXddPE5oDoj3PlF1NtQwkQvQ
	Ktnk7J8D09pDKs5n1wzqGCZY
X-Received: by 2002:a05:7301:4184:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-37685d753c3mr2904495eec.20.1794372122835;
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm11023535eec.12.2026.11.10.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:41:58 +0800
Message-ID: <531e628a379b6733632a25d998337d77.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlan@kernel.org, docular.xu@gmail.com, dri-devel@lists.freedesktop.org,
 heylenay@4d2.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 me@ziyao.cc, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 spacemit@lists.linux.dev, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Sarah,

On Tue, 10 Nov 2026 18:02:42 +0100, Sarah Emery wrote:
[...]
> I'm sending this here in the hope that it will be useful for a future 
> revision.
> Is there a v3 in preparation?

Thank you for the fix, and yes, a v3 is on the way. I am working on it
with a friend, and it may be posted by him rather than by me.

I am glad you brought this up here on the list. I had already noticed
your work: the series, with your two fixes on top, has been running in
the Ubuntu 26.10 release on the SpacemiT K3 boards.

I would be honoured to have your Tested-by once v3 is out. Thanks
again, and thanks to the Canonical team.

Cody
