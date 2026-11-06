Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993685;
	b=WiumytY2ZaHzIpZ5wO5CUxXU5EOjAeAUYyjZRVGn+TxP6ndV0tyMzxL4HEDgvasJNozN
	 thfgSl851+/DA7s0/Of5jsk0VwX3MMsqlNVltDRKlY58z2OYCA6Q43JK+UJqFsLQjnGpt
	 RvJ/q3D4uLNR1pwTrO0/uJBRAwrcQRyOK9PxffVCXPX0FckKjcyuHw2G+arsyzTeAGxbI
	 a6HGx8VR/5eQei/660QydhWJTNOl+BLrw/ZqiD3/DMdg0pXB/SJJKJt7yEaaugx7W0YWQ
	 EXaYA0TxI4xIYjjU1ZOInD7uy31Yq5NqRKJVec3yMjw76AXvo4UetM5PV2jHUuzO5Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
	b=27NR7mwTXgJz5JSD5IWLuckqe0pz/WcyyarHfMe1DRu28O99RLH6AUSohC8wu4Jn6Woh
	 4KMUdeFN6oD0Rc5dNl1Dn7oDosGst15dJc/q1UD7atPKV4xjN1fyP9IV/gw0hiH6YfCU9
	 F+05caerQFp9OL48hDr4PsTL8EbvzhT1sswMShucol8jHJ2Jrn6j3vz85wmy9qzxMGQHd
	 ROXcSc4onDhwlvB9LI15be2YuAFh8+oC78PzZy0f3M0z8d2RccwWm50Xkj6oGjjeBhCq2
	 sj2t25/yNpPh9R/H+wsgN7p856gzEbHCWk+wGWHV1zBsygbTl1sFCbnRm+28MLZVRpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ooWyyopr;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F37606D801
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 19:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F37606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ooWyyopr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so12246045e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793993682; x=1794598482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=ooWyyoprmnZ0Lw9epK4C81tNr7WPHUvU2iRl9eKcOqcl48P3TtFkkBdYtzLhq4iif0
         NoWKh0PN7dseQbETMek/S4C/5w7E0V0aDNcVP+gKSzrhF+c3EpL/uo9QQfvATmcqBc80
         vxq9QCmQ8dKphdadliHiddTcq4DMOMXuNk/1GXrE6LgfB7UQt/C5Xt/yRQXYghgl7E4O
         C3jqLvAZtqemGOlkrZXxMlhPDPI1/MYYHjBfDH0NoRWyxH4HYgzdDyfc+SEaSIPe7S9c
         7A0w+UG3bpfmwiS6RJ+uFwMX3Yd+RyTNDnl8oNKvEzt5hBROpYYf3VmMJNhL+37s8tL6
         kFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993682; x=1794598482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=EePqkcQfwUbGRKPI70JzIpKU/xJ84AtnsEXd56uwrVVdpwjXKoY7yuX3UN5FJ7EsxQ
         nRHkw7MrY/mLcRPGHieJvo0cVIqZ8j0Lxpb9rskAXRRYdc3y3Xpj0WLIaqPEygb77CQE
         a3oXthZdKRJnflHJGyMayEAtw7Bb0MhCUFkfjncpgStCv/Jx+Df5eGZyo5k2VWp16asq
         a0DnIe8jxhPRbndd8p5LRQysDL1uY7Md9fBCnCM1NOJ+CiSZZy3ycHOZAB4/AlQsgCXw
         DnbATfibA8Ot3sbk0AatJFp5H3m4/G2hElNJkZxPX9L0qFDm/+5yUh76GBfbicPHJBlA
         CEug==
X-Forwarded-Encrypted: i=1; AKwUvBzygxPBKk2ZKRvc2OnZxCQB/Y+a+hTU9TaVcJvLC/j9Yjhc2LeYmFHu+WHSoDq19lCyknPprOxPLxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9KL6u+AQmVzDUuu56R6ln0XKiXuwN+5/NZiMmnOzAMXIKum1Q
	rhfJBIY009Ut1wyF7H/l+RtHz0m6r9LILNNEYh9H/q/H1aIBz/RbQTShqblW59wXqGY=
X-Gm-Gg: AYBFou3GM8RJGeRCwwbLV4SGUAeajNOKlWsdJTEjw5oDHjCQi7OeQkfBeLmiuN0l18j
	E7BtTEptUf7ow+JNfoxwzJyaH8N5IxtjzjVbllRQiSPZ3WIJe29Lv9m1F/7Pw2R7H4M1cTpuFA2
	9vW9LgCrYN7SGq+EMCIdC9M2pcVZA1uzexRBlhpxzHalcT90VjtCG0MCWInT2qtEhWv00Dy9aK2
	5NdZmZxCozw9N/C3oqu1qGwBWOlRYJG5eBvjtQXCwOa7wlfWh7QOtWHwEIJYmQ9S+kzdVy5mFod
	uMwrUo4SEO760dSScDOHTDgPl+Y9/naUam9y7gaZAKZZ+T0XCOgvRW97La+skd1+J6+N3RJ0v9A
	XpU7y+w6k5plvlIkxmddcO/C+h2t7kGfplt8LIGpvuHey2YEaAn8jUMCyneyZqUwLtDBp0K7HaZ
	owyXypcUexSE/QJZQTg+rUt2Hc6veUpVhqqe8SD7aiVyk2h4LlsvxN4hJI5Tq2BeNlbwCfYnHyz
	8FI1yBTw4dp+FcGbBJ+YbMbBY3K8e6u7yA6AFWCxpV82LZsmbJxbQc9nirU2Ryqko//RpzvFSQZ
	Clwd6OOlj2utU0Ap60hCr7pDjh/M90RyYJJEOPpu+KJ5r6JsMdY0MpYu1fOGy4ZQSQbmj4DcITE
	BitNksAE3CT8qd/80F7M5fuk/x55jKbIUeg==
X-Received: by 2002:a05:600c:3e0e:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4b6dfba9199mr64477945e9.23.1793993682189;
        Fri, 06 Nov 2026 11:34:42 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm3329295e9.11.2026.11.06.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:34:41 -0800 (PST)
Date: Fri, 6 Nov 2026 20:34:37 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au4p0xYEFkgEU6T4@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-unwilling-preoccupy-156dbb310448@spud>

On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:

> > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@0 {
> > +            compatible = "amlogic,s7-peripherals-clkc";
> > +            reg = <0x0 0x0 0x0 0x49c>;
> 
> What's with the weird numbers in this example?
> 
> Examples don't have to be real, but when it looks like this the
> immediate thought is that the modelling of the device might be
> incorrec.t

The numbers are actually real, but the example simply lost their context
because I copied the node from the S7 dtsi (not yet submitted), where
the controller sits under the APB bus node (bus@fe000000) and the bus
ranges make the addresses relative to it.

		apb: bus@fe000000 {
			compatible = "simple-bus";
			reg = <0x0 0xfe000000 0x0 0x480000>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

			clkc_periphs: clock-controller@0 {
				compatible = "amlogic,s7-peripherals-clkc";
				reg = <0x0 0x0 0x0 0x49c>;
				#clock-cells = <1>;
				...

In V2 I'll use an absolute address for the sake of clarity (PLL has the
same issue).

Thanks,

--
Carlo Caione
