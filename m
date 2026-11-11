Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371195;
	b=G1iUnIiin5gmUuo31l0J8U6NuXdMBpm0XOcDgXlZx1OTVQB0wufjAwrHTypzVkEfZ6tj
	 KgfnYfAAR7Dfb5+VFAsEIfkXwVwB00ZWhyEOqgDyahISIRkjLkKj055h1p5LC2Ew7gb38
	 SzCacAW1WFH1MjWaBZwRygv964SqJPtsx8MlUGNC4gvEM/h2zqZ9jUYMizfJDzvALQtM8
	 /0f/PqiMxkUj4L8AEcHqK7irtQ2fP+HYplnUjqzhixdsgqpIeon0BtQYFLboC67kyrM4v
	 Y7cRq7I8CBqL/OFEqRWIkL4kkQh1fZLGMghWaUQb/FBDWGdITsCg/IDcxLxDGsG+XzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
	b=0CuuViSSYkfYgZ892eg6IWaClP6C2cH9KXRXKbzlBzhUe9MjSc/32hbRwRQkM3BUIY1N
	 McY/hD8oP4XSeqpB+3wuMQfU2Iz6o2n2rRaPsbgtsFqn0aY81FzlydmvrdTPih0PS2o0J
	 SJl9MYBmNT6KvUNPhZZItA67IW5DVhFf4wPOeXGaFw+6EqeCLj661b+dH3kdxoxZRRE4K
	 rkOwUWAOMy+XJKWeIWgykT5Kd8b6DFKM39PD2Ruw0WCtqwjwEbMN8grD5KA+Gc4hru1dT
	 ig52E/Jds2NIjz3n014GUtbt20JXkarrPDHiYk6wxkcL8J90P8QxQqo07cBDqtahugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954260A261C
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 04:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E954260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so3312489eec.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371194; x=1794975994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=AbN1JFNZQgkGlWWEsrQ2VJ68U4G/Mq1OjtG8B+uBa1Wwy7ExbZjxHbLdw2+MmyO23v
         5xcRGu1cceZx47w59x/vnxflTSZ408f+CyLztp8uw8FlHXOhaHCLiEZUJdQwRtrQVj6z
         YK7BZ4XyvWBzqGSxlYtPxATNNFfjGdh2qTeNaoRRobnn6qYwDemc1qtUVLdJ0xUFBqRV
         3doAvCXPD4DwUSk4lokM2xjHybRczcN++AbtIEQ+3QwVdAPKdozvjpDA7G78wlkZCMay
         87i1fRUI5BIObbUORel11gYkqfe0wUU2phrXekf0HtRcrWvCUEmkw4Bfh3vAQj34y6bj
         tk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371194; x=1794975994;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=DcANDDIBfix4ORkybGNVLFrlKFzZSH/YXL/wHqwyGC88v43L8Rf9++mVu5tu9ZY8gu
         Tt7xvLuAkv19XIkWyAX37YMMJRDax+eHfhv6F1OpQdHo6qerbwphSXe2ZB8u2sPih3I/
         Zqw7kjTsxhix5A3HtmtBEsl/7upXAtPguUT2SozRN2BfNarC7zoo4cFwa7FvL7W54d9G
         /dZXzCbu4H5toGgGo8Lk2ojHNBxsHuC0C8nG7fLseaFaAtv0VPp9MCxZImbMsC8AUGsG
         AoMbVAvJpGcJNmQt40ma4u/l+QIJUM42IKWwwt0f2jB+WDl5DP5wmt3M1p0GY3fQf2XK
         hmdA==
X-Forwarded-Encrypted: i=1; AL+hErGCiYWUqr8ROQ0blq7ZBHOgcuBSIoei54nWNGgZSX1c3oo8CSxQ+MX6M+3CP5D+8+hPpSNt5KROzZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DixdAJ0UFncWQ1iKbc5caqz7I/0Km370YPl1rrKalRVf0+QXN
	z/urW4HKYOcYk7hVyzvOrLOyt9VJRlc4W212SWc4gpsJf3Se+nF18oKF
X-Gm-Gg: AYBFou0w1iHiuAc9lWFw2ZOFjpQoEVEt8w6NLemMBJOhNyOEzMURwsnX8UQfTmvCdG1
	9SadnhZkdFwqKMazx4pE4TypGmQClDZODklkOq2cKbCv3lad5VOY4JLBOHGJgMwUgfNBH4o4LgA
	jvOKrUR4az7Vdj7jknGcv2NLqW22wHEwn4hZl3UsDEmjtrDRVZesgvq7lIHC8c1fU75/I6gv/rd
	eA/ka1u7khD2p2vV61vJsop2NIxnpk8smCU8UttJaBm5hmJstACP7pmc5ZW8enuesaFc4CV3Tdf
	4gX07VdKtm6wciG0ak1oBdqHMUHQpYN+PkbxJKe5aldnAUkjXg2VVdpNMWdKRw+rUphkSJ0xTW9
	Yovp6b/Ylh9vuCTr/RFoTQqtUkueStRWoKOxLnZsS+IqLRQs4loSXdM8tDMOJNVqkUV0snewDdz
	PZSKbpMWbps1s8HYrNSttqOdtzHXbNpjhCANkZ2EODLD723AEjRkvOvCSEnUMHH+NHfnhCq/09z
	2+EmK64mLfNwARFuJ37234NAVYuM26ZwvhzDXRENZGiI+6yC+6m7Q0vxLNM7iqGsj/mLBkpNh9O
	xuo=
X-Received: by 2002:a05:7300:c382:b0:376:bcc4:774b with SMTP id 5a478bee46e88-376bcc479abmr1028837eec.23.1794371193980;
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm13018714eec.17.2026.11.10.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:26:28 +0800
Message-ID: <0d340a99e07dfba7ea1fba6d9529a1a6.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to
 the PHY PLL
In-Reply-To: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
 <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
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

Hi Jerome,

On Fri, 25 Sep 2026 16:43:46 +0200, Jerome Brunet wrote:
> On dim. 09 août 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:
[...]
> >  static const struct clk_parent_data edp0_pclk_parents[] = {
> >  	CCU_PARENT_HW(lcd_pxclk),
> > -	CCU_PARENT_NAME(external_clk),
> > +	CCU_PARENT_NAME(edp0_pll_pxclk),
>
> hidden behind this macro is a .fw_name. Basically these are your DT
> input names. You can't change them at will like that because your
> bindings are supposed to be stable.

Thanks for the review.

> You should not use placeholder name, ever. No need to make the
> name too specific either, from the beginning it should have been
> something like "pixel_pll" or whatever your doc refer it with.

Agreed. The new names follow the documentation: the K3 user manual
describes these two mux inputs as "pixclk from eDP0 PLL" and "pixclk
from eDP1 PLL" (PMU_LCD_EDP_CTRL, fields EDP0_PIXCLK_SEL and
EDP1_PIXCLK_SEL).

> "external_clk" is not declared in your bindings AFAICT, so at least it
> should be fine to remove it.

Right. It is in no binding and no device tree in the tree supplies it,
so nothing that follows the bindings changes.

> There need to be a dt-binding patch documenting the new name you need
> and then you can start using it in the driver.

Patch 04 of this series is that patch ("dt-bindings: soc: spacemit:
allow eDP/DP PHY PLL pixel clocks on K3 APMU"). It comes before this one.

I will change the commit message in v3 to better align with the logic you
described.

> In the future, please try to document all the inputs of your controller
> in the bindings. Even if you do not use them yet, they exist.

My read is that comment is more to the original commit where 'external_clk'
being commited, which is not from me. But yes, I agree with you.

Cody
