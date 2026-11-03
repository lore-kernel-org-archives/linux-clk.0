Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707933;
	b=LC9oR5k3sXPmZgY9xS5uTxSyFyGGw2gKbgB+AT2cbKOubTWiJoMKRCVCLSDZrAUvv3of
	 ork6K4rdGgBOBKSpEO+o1oXAItmWCHGAqukdfiJEjpuawZNPdtbtBXAnNBD5kPA6vvbs/
	 GEpSxGzPaK5VUjuJw0nYMYWOvtlfBHaiNYWOitwlE9swZt22GZDCPRt0Lfemzq4AtpCxj
	 5Pz0UQhGQkzfoZqVlyMbIg5HHfJiY+EF5JMCo/hhpyHxw6rXB1X4VgiRzccHMdqZgUOd2
	 fa6cjWr77dqIh7MUrrN2qCyp5nhsJYdqXBYprhVWY173dlR6EnS8T6NldSRIDXvYCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
	b=TWyl7cb8dLOOr2Dx8GvIZlmDPEZfRT7EvHg/93SLvGgtipUSYoMSBjJxIvbPj4k3tRp3
	 V2eFh1ckWxIiYjBXZgky7rCbTvUQ49Yf0FQwU8XtC23ZqbLeIsptROES+r4dkvQQSLuen
	 KTlK+TjUNvW27Cp6e+Zl3GSLB/spRNZ4OjPig9EoSiQ71HccK+02VQUPa1jUFnNzgwy5e
	 nZzfP2+PJEZpPsooZfsIZsoIkP211IJHboVl5L0sI7yte0Dy4mr2tJhXfTVxxC9d7POt2
	 QpPxBlchsiEWf5QANjML/tYPq91Of+f1ZV3Ngwek7pFQ97+fxAzFkQFGRFQX4UPdVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99D606A326
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE99D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so3301596e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707932; x=1794312732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=DGkxPCLX5GXvmx7M8dJnArR00vt8VtdGbHun9M0TeHbmz4k8r8YkOtmJx2Ok4rPPHu
         +IyyaebAkT0PCI9hcq6wWzwfa4+Ir39EyF1hBUB/YTm2aqp/Od1kw10j98TRkpxAOopA
         /YpE4umx9UMpsxEa3EJScBaoG7kCMx9RaFx0J50OYl0Ug5qm1Iu3MyvpXCjT70amlUX2
         eF8iQyRRquy4+y3XIOlPL8Ompve33U3UDw4XHE5tjYNsw/J9X0bTDrlWIohLLzjCeAvk
         g2lrhjn6EqumWcrGC/u0MrminOOvZ+mrLuaBfCngZZajxspfBocPmHuNRO1M1AD2OptY
         aUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707932; x=1794312732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=MqjNyheChchMB8BoY7F+AHf0DZG7fAgKp0zg6RtpWskgXSbaTVgQuy8mDeaZLNd6No
         U7p6VyW7VTlWVBx892riiJWQr979pzV67qexdKmFu6M6gMddUwANMbNcrX17aLwbJhE9
         KAqq+OUuB52k4CD7E+bEqcErUAmuMWHyxJyqx6AKxioJaGJrQyPLLeTCBARmnNXg3X9m
         079XONld4W2yf295OFGnyg4DzhifB/nAs2CS3akOVW7xYchTUph2pnxpFdnaOqfii2gB
         LrO6rp30pAADiBCAk50y1uGb3NeViN2+q5QUuPHD4ugXnEa5JqkQzP6WL92Mtn6kx25a
         /Auw==
X-Forwarded-Encrypted: i=1; AKwUvBxJr5A2w19uXE88YeFaUP+KSb6G2ggKq99/4r0efdxsTZJsGQ/lY0LnKUBKG5xZEsG//+N/9aBDvdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gqH7I/CkDgxdAM2syGTWdQAejcP4/5FvHqFtwY+7c8uMnJ4r+
	bGSC0EM5kP3Y544W/5hZBbO2FLufZbFmPvosemjMCG8fZZ0Tpfa4zggb
X-Gm-Gg: AYBFou3w3zLINToJjw6a8c3bYHplscGWI6aTNg5FfMQ1S3mFiRLfcWz9vHiJRh1GVpo
	oFIEH4HyoT4r32emQ+7iE+uHNfzt4odVYbtLNGWxlCrhbz0bjmQ6ANMZ/Oh/0u0S1y55AqmBssk
	k9HuuzgrxJGkwM4m3a+PqLDJ+lIyUyhsezJRznR+6GaPR2U+VYwtSYF7iEcSUeL88Rdy1abCgT6
	AsgOKNAlS/FBghIuu9+WT9Mej5+G4wyqo4A9xahDVCmLO6RvtssZ4DLDkiGZMeG+yHtcOC9wdCx
	ZrJmk/+3bxKjLR4Fke8uyBn22ChvlA+n+3/uqeAcvSI2r/v5s4NZPhYP71ShDI70e7/0Lxq1YH3
	sX9Di8LhA3YiuDfvM57opQAqz7L5fc8aNnOetbvKWxVmULR8GMehlDPEdDX62uhlVVOfpDtLXYQ
	PfXxOBOtRLK9K7k5MBZLweb8q7jmzyp1zh0qhvhVIbp8kS/QIv/JceFVG1lKpadjnejBtlt2Lfy
	bAsB3LoitcVdndB6828q5VmjBmESXAVyE9k/eYab/j5wx+6X5HSHtOMJQJIQdHs9NnnXTXCLgQw
	71gmHcqESpNfZYfCKlwVXgmn47WCrcQc1gpXDlAs3w+hVZ1njpoVCY0jC9gsQiSEfq94zYc2Tkr
	Ytxs4XaIYCoyvn/sAQJD7w7cJ1Dk4TdUeI1tx
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5461054137.16.1793707931886;
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm12606282137.6.2026.11.03.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Tue,  3 Nov 2026 09:11:49 -0300
Message-ID: <20261103121149.33238-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech> <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
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

Hi Andre,

On 11/2/26 16:32, Andre Przywara wrote:
[...]
> > +static const struct clk_parent_data usb01_ref_parents[] = {
> > +	{ .hw = &sys_24M_clk.hw },
> > +	{ .fw_name = "hosc" },
> > +};
> > +static SUNXI_CCU_MUX_DATA(usb01_ref_clk, "usb01-ref", usb01_ref_parents, 0x1340, 24, 3, 0);
> > +
> > +static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
>
> Don't these two clocks miss the gate at bit 31? So it should be
> SUNXI_CCU_MUX_DATA_WITH_GATE instead?

Yes, both have the gate at bit 31 in the manual, and the vendor CCU
models 0x1340 with it too. usb2-u2-ref resets to off, which is the one
I hit on my board. usb01-ref resets to on, so nothing breaks today.

With the gate added, clk_disable_unused would switch usb01-ref off
unless something claims it, and in my local DT nothing does (the
USB0/USB1 PHYs take osc24M like the A523 ones). On my Cubie A7Z,
clearing bit 31 of 0x1340 at runtime stops the USB1 Wi-Fi traffic, and
after rebinding EHCI1/OHCI1 the device no longer enumerates (error -62),
4 out of 4, while it enumerates again with the bit set. So at least USB1
will need CLK_USB01_REF kept enabled once the gate is added, likely
through a consumer in the USB controller or PHY, as suggested by the
vendor DT. I only tested USB1, by writing the register, not the gated
CCU itself.

Thanks also for your guidance throughout these discussions.

Thanks,
Vinicius
