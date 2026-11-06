Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925262;
	b=t+bA3NS7ptfKSq7Z04vnWEu4U+7IYIWjt51BUNVyhyDYPfTTuPYiRKljXu8el6X+B9bj
	 uujd/Si1OsAERg0OuZXVZoFHecbUTXMtATbNv4LXCBRzZ8IcBrXnVWYMwly/d1r11VD80
	 kgm+bDC0mbTOd0J62Zk5KQ3Qvf6H+ptiu+xMlqeRR1UxRHmRYXTC0xUXQHFDTJfu7s8gh
	 B4jHj4iyQe/ylTVAL82PakgRvl/cb9jcvFaoFwoQ9lNMCq8trzr1NdnYqJ0rdkTjPwRkU
	 aAW9XYt0KxWDPuIpR7JZUdqb1nsI3VPaQZkN9WT/K6LrAEgGD7XSEUKaQr4Pz/Nowuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925262;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
	b=kf85dqHco1NtpgtmVcEbytjmcn7DWaDXGbgepvkGb1TfMk9Hg2PmH/2KBQs/Ql6vtMXN
	 mrU73z0gp506wif2XmBPvnjFcGFepHECWlzy59DRq2L8xxGn6a2ijPr4x5t5ZJXlMvh02
	 SJkeOS1uKh7EAghQna03NIcuU+9sWPAR45qse66bApdn6MectEkyb6JrpXZlliZuHlUNl
	 yaG3BwO3hojLNseYkNKgWVsnZHUQwuwSX5ES6ImiPEmPXsIoCY67DESotA7idhwZAFSJa
	 +khiSnTsmWmU5yWUSMW5Q6Z2hCgbx8cBxKaVQ4lTO7FMCM51ig9EcNTa7tIStPWvVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9B606A330
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 00:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C9B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so35894a12.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 16:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925261; x=1794530061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
        b=iOxV0KhbunY6EjGCBOvHJBUqHu4B0Pim/pbBOl6AeIMEAhMjwivzrqygGyy1UGwCsg
         xbNhXZMgZ1gkQq0OD/c0MTONiUfelSlap47ourrew6gFJR8kf6KG1/J/IPnB6JB/VB6R
         GkZX0feaosRWZgPdSpuNJhe/SF9DVRynsnEJDa8nAE7ENukO8O3d/JCpHZyrnNdwzJWj
         mlpWpg3l/rhOzBhOlq+SgC7iJptonAVKRHPwyucpKQ1ereE4avdM8i0qZ7jqeagII4XF
         Zk9d74qHd7l/ckKZDsqrhl/ti4zxO8UvY/iHVdi7MONjVYQGCFxOH1BTuh2+LtYbwVF1
         S6Hw==
X-Forwarded-Encrypted: i=1; AKwUvBy+8HD2wWfFDdGmltCFe2D6S2YPOBXFwONnT87YnIGfv7nqu9pxLnGeYW2FH60n5tlWwbDb43BmJjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UtHCvqz85p6+/qHznsCrrtDnYo0M1kw6QYi93GNkBucfv4ava
	4VGDzj8MIEAXftMHt7qBripfR2qLPXXBbmP7kJ9A0MikED4v3Rkgzzelg8I+xtYH
X-Gm-Gg: AYBFou1ZMSz4WOnw5IAlvbXwX78fQq2mN59F6B8fv/HYiyIDo1DD4Y4MFJ5kgAfcWyH
	R50X71QJGdF2rSDKKtSWYaAyPa/rYo7zndr2X74XGEddalnOwY2ewJVAe/QsTPmHsaDyQfMKvTb
	q+UvEWHj3vjuAvdGPGTpTpPZVmbx/oHwlnq8UIYT9os1xJ4OZ6jTmYF45ZjHy+8jFxNuBbeY35i
	tWoGtfJXDUTLmJPwXVFtiDMs3QUOARc9r/MwfNAAVeGPXa9FUCjbvPlRgo8GWHHxuS3dYIZWveh
	lOU6DKh4c3/liJjDXhzy8Jym7L/CGSJFBP49WUQnaBKRmiHAGpRnjVi7lV3/Vbh6CwFZrvIyDNz
	YZaqS4ZfDnAdE3ZCbVpNQln4YDbrFeibfZ2Pup+eJEqNRa/JbCif9txXjVhzBYKHDpr63netu7H
	l3RQXvPsEa09N24+BgSBsg+lnRSnnySwjQs66DmgJak7PMpV3hzmBlYnAU2BxHx5vI8Aa7GGgra
	M5bE1Ay2v/0uh84M6rcrYA1RzkQl4ddV00JJzwPqzOQNlNb+EA1azwN42MKXZ1eAhlobTWJukts
	IdDC6V2tJK1vFlfShCfBKzJWBs9A2NZRxVjDmQhiEmMqeBmqxAA9SdvJd/JLLz40k1lTPHL+u2M
	OyMsnct5vnq4DgqCQ+S0KrVfKKu4v6kDCB3WdgdMmATM=
X-Received: by 2002:a17:90b:2c90:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b0db711211mr731138a91.54.1793925260731;
        Thu, 05 Nov 2026 16:34:20 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d78b0a8bsm1045692a91.2.2026.11.05.16.34.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:34:19 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so121835eec.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 16:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwz2bk8J3XLdrjPhzyJeVP+RNM22Uv3977fmCoPTki1zRLq7yQvFFsxZb3zJpEk4Q1bf6LIqb8l8nA=@vger.kernel.org
X-Received: by 2002:a05:693c:68c6:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36f75443f92mr1048026eec.11.1793925258726; Thu, 05 Nov 2026
 16:34:18 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261105-upload-golf-40927e20b7b9@spud>
In-Reply-To: <20261105-upload-golf-40927e20b7b9@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:34:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
X-Gm-Features: AclHuK-ZB6vwHbkhfZNFAAIsLQdK0ZMK7LE0zya9GH_XZ9poNQEbizkJmf2GZbE
Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I think you should put these in a binding header file, rather than just
> put them in a description like this.
> I think you really need one for the clocks too, since you've got things
> like

Thanks, v2 will add include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h,
naming the clocks and resets of each manager, and the driver and the dts
will use it.
