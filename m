Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362518;
	b=l7oC/WDJ+tI7tIAP30Q3ExjsWTiPdKa8rZGzIgzRzmZGdF8stZdeRScj+QAywTkQzr9h
	 EKp0V2fjHdSqWnDQyXR1e3nVmTR1RX+5I0tYW//eBnr9XAZw0hDY0T6evhVAVbfsKL8j3
	 ZdXOqccR90xpjyjXY8kjqfCK6LofmoFLPvy/9SYqn9HlVOPmHpky5a2tu7jBDrSBp3XHS
	 aPWEp1n5B4jLUOjHhYQUnlcD0cQ6HA02xMrB6cn3dFyI9H8ZNekydPURBv2Lz0LeEvmOU
	 al7g7r2/BQUBXhXgrwLNHTxO6MFKU1NlXg6dJMSPdPoTxGEEzkLeyGSXAQB0Wz9KkDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
	b=5c6UfN4RTFm62/Y7LKwbgeosHljOAdyF8443a6x+XOpRjiy+n7zmSoZW2AepZjryV3Wy
	 TQVZZdpdMNawFZgVm/VjqbdjbBgTv5f1tAue1ip+BA9MpOtR2pulc2NB+PUqwSpcDbl3D
	 nOz6x4+713QQA62TstimF6Y/MAPKj3wNT8Bz0xVMlUTjHfnvC01WhyzXo7XvDdvMBHIX9
	 A9gAUVjOsP6gIuzF6cS3LocINEweSK98Y9DumBH+Yv0n2IaIHQIycjmkefpQR+G7wC/Fx
	 wPAoqs+sNRu+u4YgVYXNHIWbyiNWVv5uz/AnESqONzELGolni6vSlnWEvI/1CbhzbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T8rODVA7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD10606A33A
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD10606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T8rODVA7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso21484755e9.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362516; x=1795967316; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=T8rODVA72roFxKJBCaacctLGEbghLgA/GVqVqHKVnUQy8rhTB3ZiOVUeTaLGepyBsG
         BqFSxGGQBV/vpj/pnNuwSgnyM6VLCFjZO/35mRNrhytEmjUyA659Te8klU7vuxGe2MC/
         GDQt8x4feyPEMCNqKc8bQHc1WxuQD88LS8xQd7LP6sFpXFGvD54BjGuGA71QPYjelpCK
         pmXSHnAo8KOalk+ZkMz/yVWa47n8ZJlAlhBlPxCDSPdm7dnaZq4ED6t+AKYK+XX6LHW7
         K9Lv+PnTwIUa2VjyTNbYRv++dQzLuZIf07RRWtZsse/LEN8GAzseAXDlpMXCA+2IrZfp
         jV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362516; x=1795967316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=C4eAJ4405mccjoDey4qks2918dV8KB7Xfs/ynQINbwFs74N3z6PkfFrIfc1dy+gN/M
         uU12GrFi6UuKNR1FrQls0Oj7pzQ/P5bwF4mGflso35HCIJBkmxN/ebFNG3/ghPETTx92
         BtJZahjVoYMfUrET2gFvXQOkfjo9d3QLFpEc1em3y1DhcAZn25y1CjqQxKc+GWaaBVwe
         GcgU8NGnlDGVEvyM4iEaWW2qspPWpal48qCo5pIDjZF8dkwhRUU2qGWjLDndihO3fxlT
         YR//JAGXSdgaVyX+nQrCv7wLafHZDioABU+1NJSddqYODswyG82ZqWl5QFqQTlZBT+lI
         NstQ==
X-Forwarded-Encrypted: i=1; AL+hErGKe2wYztO3QF2WETqG86/GllqOc8wiN6AqykkSyKZzqiGT0EyBzEaQyiarLqrFwFRICKhJMj+wSj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rUZGBpaiqp7N5UbV729nd3B8NwJyt1FQ3bjkmTAUqq3z2yiSw
	Par/egHG+05wc0DA674/3BM4hVoUkx8Y647x18GOIoT9TjFyZd0svnbfZJFJ2Nbrc04=
X-Gm-Gg: AZFdTZc9abPB9B75PxqiGp19BXhkJ/OKX5PHVMmtkDVBQjOFRyffbKj4YmuBQiYHD4t
	N6sXkXLC+yGrTz4Q3/UWdpcRnuAEk4JXmP8B0tdV+9LvKAgKEDEUCEoGP7uU0s/vb2RcokXY3ul
	voCI6bhSJONO35ABYfqg918wcLMjdP3XF0eIhwELHY5doAVX7m10nprwlcVkPtSKnWDcVLuHvQV
	65XmkNapo4TTCP+we081vNVkxpT2KxwPwOL3mLZo6rF/bdYC+4f3WuKkxg1Un9s+sDiKJnypYxb
	pNkn2qXv4zSwjmQ29gGvUdwYRR4xXnfWZmIBAP012xq90NNxuDMH6JowwyqQQogo9PvkAhX9uhM
	B0gTVx3rGD8stFectGwEY/G9JIZRJuuUJCd4SB5yvG1w4IbwCPsseHsNTJ8DuC8fp6fseZ7udZH
	m8DY05cp+jZAbTGnKwxVUYgqOKm7xz9Jczyna11r9XcOVHfVouP0/L7rLVEqBrK9dVqEb3IKT4p
	leHWbQiIIG6aDOiTmAsn9zbJKLyjJlE9kTS5vkCNCcPWXGhCVHmHeU4fSC1nTPrJs2NwNM5cHqy
	xzp/Bhpausu2ycoxwVngMurglTiQ6rCXWGdPVHqb5ujyJB2HW6ovA7RpF86pGcP4+60oEQ==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr185403945e9.6.1795362516062;
        Sun, 22 Nov 2026 07:48:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm279389115e9.2.2026.11.22.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:48:35 -0800 (PST)
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
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
 <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
Date: Sun, 22 Nov 2026 16:48:34 +0100
Message-Id: <179536251467.2728475.8360126735543701661.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9+DCtU9MB3l+ZbzrrTv3gmLnvQYjcC8cHeWP8Lnbruw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMfJdmLT80w3j7CVfpluD1enfZmBX0eRfuDfl8uJP74
 M9MaYO+jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkWj/DP7W3sXWdLHfn/NDL
 NtvF0qLyP8s15nGl26pply9aezMeY2T4nysx89QUrcK6c4nddko6jeZeS+aG/+MX7Ge6lfb53Bt
 pZgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-18 11:39:56+01:00, Philipp Zabel wrote:
> On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> 
> > The reset IDs exposed to consumers of the StarFive JHB100 reset
> > controllers do not map one-to-one to the hardware reset bits.
> > 
> > Add struct jh71x0_reset_info, which describes the number of resets, the
> > assert/status register offsets and, for such controllers, a table of
> > hardware reset lines indexed by reset ID. Add
> > reset_starfive_jh71x0_register_with_info() to register a controller
> > described this way.
> > 
> > If a map is provided, install a custom fwnode_xlate callback that
> > translates the reset ID of the reset specifier to the hardware reset
> > line. The translation is thus done once when a reset control is
> > requested, and the reset operations are left untouched since they only
> > ever see hardware reset lines.
> > 
> > Existing users of reset_starfive_jh71x0_register() are unaffected.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
> >  .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > index d410a5a0ded4..5c64d47fb530 100644
> > --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> 
> [...]
> 
> > @@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
> >  	return devm_reset_controller_register(dev, &data->rcdev);
> >  }
> >  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> > +
> > +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> > +					     void __iomem *assert, void __iomem *status,
> > +					     const u32 *asserted,
> > +					     const struct jh71x0_reset_info *info,
> > +					     struct module *owner)
> > +{
> > +	struct jh71x0_reset *data;
> > +	int ret;
> > +
> > +	data = devm_kzalloc_obj(dev, *data);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->rcdev.ops = &jh71x0_reset_ops;
> > +	data->rcdev.owner = owner;
> > +	data->rcdev.nr_resets = info->nr_resets;
> > +	data->rcdev.dev = dev;
> > +	data->rcdev.of_node = of_node;
> > +
> > +	if (info->map) {
> > +		data->map = info->map;
> > +		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
> > +		data->rcdev.fwnode_reset_n_cells = 1;
> > +	}
> > +
> > +	spin_lock_init(&data->lock);
> > +	data->assert = assert;
> > +	data->status = status;
> > +	data->asserted = asserted;
> > +
> > +	ret = devm_reset_controller_register(dev, &data->rcdev);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> > +
> > +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> 
> Does this really need to be this verbose? Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Hey Philipp,

With the comment above addressed, Is it Ok if we take the whole series through the clk tree ?

-- 
Jerome

