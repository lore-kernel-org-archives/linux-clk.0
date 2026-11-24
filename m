Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514783;
	b=XzL62/RsfspoCEp4q+bNkCJfaQU+IwDhA580JpH2iiMgQA6A2ZjrqfKUyAzf1d+uB9kC
	 YzivqQPTUu9f8EhccDISw31PXSKqkRN+stQWMTcUZKuxyomc0AxA39Je7sEzOIpFQH7DB
	 8ld7P9O58BN1lBvrBFA4UoaCikRIWMWWgmpUVrgyZdmkAIGcSjiHYmiLzdffpkEouLr8z
	 wBxdxGpSZxQQoonn8DUkzeAfPTQZXfw/IprWJlr0774IsPQ3kcdOfRdYB031VbJ3wo/9R
	 cvw03oLyUOJdWcq8U42fsVZqBE+Kpie17RFiwP9yKd2+HFe10fxWNrbkE2wqURzszGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
	b=2TZIxY3LdZ0LVVLx1UQDgkhA3YvzKTfDi/lVj+aoaJ0eT0+6gDpkSJFe0srSYL54ZhKu
	 iBykUpTfNwR/ixknBvd/QhfNA6OZyWtvXXUh5maXabdTHENP/FFqRDDdODM5szI4tFGEl
	 xcaiN/h6/yP83NnUBnfsjeoDxHq5qwPRK9o44/dzD9kaRsFbfuNHuhv0kk7ymHlRbZMBA
	 +vmRanZDEx6226myoW+9tbJhfLE7U+RbXkbKW1tAVyjX+3e/kwbFT92B9bo/EV1NT9LUI
	 cW655fyDqOOv1BHA+CTAN3+LtK6oSfr+FR0n8PgrnR9XKs7XT4LH0fdTi02KK7Nb5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB0606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso37494501fa.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514781; x=1796119581; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=mZgY1IRutbfxoEyOQvSGmKLJUEp+Eu6JolB/hRdVFmprzU+N56r0kuBCzbaGeoC1Kr
         E1leuNmYvr9aamFFdNrVl9ezKqpJU81J+m1rFJ6zT4rJdddCoK3/67Z0jGxUEJmH+51I
         f+7qcGFjjCXKtibJaZulYEU8kCXqkEugCSd8o2tP4/Agdf4Sa4YLI4ylBQmucH4xI5q7
         RpxgVmlA2zyQZGwNTsUSlXWjx/AgqmY024OBMY3Ri/UOKpLBaBt6jA4iCpLda0RdjcwX
         i5czapbYLURJq+GvRGG85QrH4G42nkyth48LqTS74ywvIO3EdQKa4ZBRTMoB3CG2wyd3
         SRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=rqN/u2ghzK9Lr62+TC3kwRnkEnrpEks2wJ/8M0oSaafMyhG/sgRU4F0bjQBit3lTJK
         FrMwNSzbOVC4CQP5tJmVgEA6OSUVefcex1EnpL1oWBkRMfdEVk+PtWYlxuAuxjtAlYBQ
         2dtTwJQyWlTlAgjyE1Uz0svLAOHJWFFza+VG5YXelqat62BVsMoDoTKuaCaX6CplA/Qz
         J0/IuJhhq9LhsqOmtColajaickOStWGtbGVJo+LMJcihxgA7kOv6VIm1uNqOBOBX0Xun
         fAA7mb4fEWvpPSKHE5A7MVfuCsIwdf//P9qaZF5BLcqJJJPvcKvak1e666sRKmdon/DQ
         M8yw==
X-Forwarded-Encrypted: i=1; AL+hErFBWvi5A6QH1h/lyLLnIaZH7X0XAHNBb1J3loHS/kvrAsx2qDjz+DsJceMAkbZ8TtWHJKIY2lDKcvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z949OUfxDJp6J5p2cs3y/BEhc64qEAz7UKC4YmrosnAfDRXrpNI
	FW4VGycQBrL+8YYAZNgOti87QqiLzU1BY3YkTN2DEGbJX6DS208sTxpq
X-Gm-Gg: AZFdTZedqJocNlPJQylE3mvPsV2MzVYglWZOVuvEPXmn7l2nl9x+ML3/GgWf2sBcVie
	I6JW9bvlKKuk10F0lw25QFxv+jlE1M3A9bx58RSIdJuKnAkpZQQMU93Z9aXYURSCLiVWHW6Nb6p
	7DDMiDeU5eRluKuTWMY5qPyZE4R06V+rCyRMF8/G7hSULOABAL+PhOxdhNaD4np/ZOtw8SsE1qL
	qyIbebCRocJ7eEuH3H1YPxpB33AU+0BgpC5u4MICerrCTqlHwLSTSCX45y7bKNcYkiFwBYECO31
	bXOmo5XyWGH9k0jhGFOUV61Qf7Ge3cjqLO/VXn42klfxghJSLEQLDuke88RuutqAIrjEviTHOh4
	mNmmvH1DRzUlcOijQyPaQPv1YBV0ZR1WImuiILsys/v8ctIZtAPhYxc6sjfEtoXNuZ2MfF/JPzR
	OI36nIi0TIAXDKw7rr3eEZd/vufsyqvt/5IRmAwTJvIIPmnON4FVE/Wd0H4KywvpEGAOocEjRG7
	93v7TR59WtBxQRU8LO5Q4hSHpboQdgOZU4ScX4KyF5q1Ha7EnnUgIawJhYu2pLxLlHTU0hyejKV
	gEaUPVlWT1wHtaIx35Kv0g1pA//FKf4mSyW7uW7avsB+mk5aipxz0gk=
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr5731034e87.29.1795514780815;
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b423sm3627942e87.43.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:05:40 +0300
Message-ID: <179551474060.2.10541952676329766668@gmail.com>
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

Hi Philipp,

Yes, those are seven separately named bits in GLOBAL_BLOCK_RESET. I
haven't found a hardware requirement to change them in one write. The
vendor cs_ni_reset() toggles bits in a different register,
NI_TOP_NI_INTF_RST_CONFIG.

I grouped the lines for Ethernet teardown. QM can still own RX buffers
and DMA-LSO can still own TX descriptors. The driver checks that all
the blocks it owns are held in reset before freeing those buffers.
The -EIO for a mixed readback is how the current driver detects an
incomplete stop. The Almond+ tests exercised the grouped sequence.

I'll try exposing individual reset lines and checking each in the
Ethernet driver. If any assert or readback fails, it needs to keep the
DMA buffers. reset_control_bulk_assert() would deassert earlier lines
on error, so that helper is unsuitable for this teardown.

I'll also use regmap_test_bits() for the gate, drop the redundant ID
checks, and move the PCIe assert, deassert and delays into the host
driver. These reset bits stay asserted until software clears them.

Thanks,
Fil

