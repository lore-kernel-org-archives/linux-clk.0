Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475755;
	b=BBg/ctVRrgvEblkaeWVQGsFAOWwI4dxso/teFj+LcY6F8ZIW2RCeuyWIcKSim33ZAWBy
	 TBJdFIs0NqWku4f8Koh1Fd4E6RkDivpk+DObREv9AmquTqtYd16dJ8PLb6TorLazz0LKk
	 KoBglZRCuLaWK764fv2+rLxkDoOiFxR11gJ+9g/R3JlK3FgxwGQuzE0jk2fcmO2OgzYnC
	 3gQ7JeU24T/09+0epS05Hhtqn5LcFdAv/ogNIp0cRzTaHweipX1bhTVpL/tB9L0nfQxoB
	 2buc+VnTEYdBih64hWui2WaLZwjXesCpGG57oDghcErEiKT17d0LKRW5a3YNMFhon3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
	b=pRSUUqZdECgIK3HlHijohPoCbVgL4jDn7g5fJvWjvni83iZ9t5XABRMyWSeiEA5+yN2z
	 8BHmDQMG9EV22VROMsD2SYKmqfsTfKd7bVYPclzbBn4z+erHHwxsZ22fW+Kfei8ICFMjv
	 Y5B7KABrliNUHhQVZ5oaF/+jHJrqjqwhSBmS+Wis0MGA0lAOaJMrmaJxxBU+y1iXbR2Vb
	 5ilkPSoS67GGAtyh9S0spel0pKUcX0GqZE246Q6+MJg68xSTFfqnB9aV8xisCZn5Si7b8
	 3Q8K9nVUmqEfXSeTeAomEyTuXt+DsUaqUmU3tv+3CDlwU3+4KP6KXEOdqJcLDXS3m1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE59606A322
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE59606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so41028025e9.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475754; x=1796080554; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=wPVV0trpVGtHbB/97bjQWfk2GYqAhNe4E8Kv4EAegMEy9E7FLZuTqBdH1ZjCVch56k
         2vt1WbcahQHEbrkN2AofgMYByjZ9FZ7lQRs1JJ2us4wY3e2t+lne8Yn8U+OTSkhEvN2c
         DWPIo9V+4MCO594r/DqmBqXX6qPeHNVbl4uWNRS5lakbIJ7VahPHlvPCk5gurmHScvZo
         QzLCeW9PLmdvNUZIeC9WBXHwBfn3S4fiKQymdPRLhp2yiuSzbw243y6S3rTATicHq7/Z
         fGSUPFFfYHSt0BNmil0SceTSOBreYF9YF4VwIjsTMHL+LatSuJwxCtTdL7w1wtYrMWnH
         mY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475754; x=1796080554;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=fqPWK5k8qqNTSKPAo58lp1hMD6HOmj4XEEKCaMuUNlkio/OQrWLj+QW0kkw4eG4QEA
         Bv67BdpTS2isgFtNaBRP8ezdt+7M/KJUw33e9tBOS3wSPSIi0rKOV2Wokbwzju6hrZb1
         leb6Ohg8BPMGCxNlAnZZHSMl9P6Wlo59bQxmi/6S10uFCFJTxTpep7sgW4Hit9Gxh0pQ
         UXFWi7D7M3+SUoaVGEwgDFyXThsbw/SyEQTvz3Xw9LBN7SNtJSwoi1M1zhRFW1b5jdvH
         zkbINu+JpMHeiQDiXa63qd1XB4hc+JzK19ZU689WV/sbV9rqXFasZYoNYNb3tbq4s+1+
         0N5A==
X-Forwarded-Encrypted: i=1; AL+hErFtXjHAQ2ZdBvmUc6U6Kv1aDhoQN9A2fRQd9i6LS7GCPZ9f4Vk4vVa852m86qLev0gauz+/7hp2bDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+jclAcvXB5athbcnXCroxMGo1/NL4iOQClNBtrH6K8uS7L5KN
	O+neKeIvgfdBWu2zSblizYysyw2yke3a5PamL/bK6V3+9eVqSzftbAD4
X-Gm-Gg: AZFdTZfYco2p77cqV/aByVhVqCMXuwtyps49lwpgCx86y1UvngSb73VHfXsKRyuwFy5
	cHh4LzZTdY1D56ywnmBAE/+BP8h83a7Cd+JU0TmNV7cEqU/vt0B+itId7E2jDyKunxaVHySmFYj
	VQ3WTRmw3ivkNnI6tb+LXm/mwQ7CyS0xRWRQKjsA0H78w9MeNJV1Yk3mSqN+K4LuFD+KzqIApkJ
	pwSbixQzM5HAPbZktlwg0jn1KGuY8sjgcw80MpkbtzbYY7MW8UOM0d8r8MosvX5KjqiA6CaZBsj
	d3QnGLI7Ojn1mw6uRBzVYNsgzk3BEv5snW7P89z4VEHuh2ZtLQYDspk5fmJQbjgdPueagN8ruER
	T3CX238/OqWqb1+232fYuligkq+hfHY3+U0nYHHREm3WY+sRKBmZZ5p9kleIj9mEuGocY1k43JC
	WFtigRQdWpGyIpOQbkGysr1fbQ43Yyc1hnTJ2hTHte9T9g4HRUP6cswAJaPMvz6WSIHYdeKnsxk
	58u2J4cIQiGD2Dr3oMd+zsas46N4EpGjT+DIxPKsqR7f2ydaY8PZy6NyfyineG/vLrpiBpm85II
	Ylsc8MjQLeH/AVxqDUNEpyionmM4DYVV6/AivA9Ysmji7PErhH8WFNk=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr269607585e9.24.1795475753577;
        Mon, 23 Nov 2026 15:15:53 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm214620235e9.1.2026.11.23.15.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:15:52 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] soc: cortina: Add CS7542 PCIe control, SerDes and
  host support
Date: Mon, 23 Nov 2026 23:15:46 +0000
Message-ID: <179547574633.3.10816077515932240445@gmail.com>
In-Reply-To: <20261123225447.GA1119216@bhelgaas>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123225447.GA1119216@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Understood, sorry for the rapid reroll. I will wait a few days between
PCIe revisions and collect the review before sending the next version.
I will use the meantime to address your comments and test the changes
on Almond+.

Thanks,
Fil
