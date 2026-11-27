Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770731;
	b=qIotyKD978JErUbDPoC0IaiySwnAzSojxJ0NNpJ0TplA2DFayv+KuC0y7mjm0d21VhgS
	 yfDbpNHnzrX8MJhb6toh1D5hTfYS1+TGFwL9qKyxIfU2dxmhobrDa70q2Qv98GOvxZuwE
	 Sh2SDU0+Id2CnMSB/vH1RtKX8P3Oxb+U+LOL21jkUQIFCzr4+050oKI2RL+ngiGdCPV9t
	 XrK2Mzks9qBl6WHtPMxwUqT812BgHR8fD47357fAjxCI9dRvZsBK6iQ5pgNmqbSnXEm5k
	 dFsD4KuQxM3xxxIe2eaKusx9fx8w0rYPWey+5C1Bkezkf2/bB76dBvflTOLPfPHeQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
	b=09r3w/m16V5Cnx8nOBwWgboHnv+dJGFt4AfYuvaIOg7kw64l3yH/bLHSXNCnoMQMkzax
	 dWKbBdn4+EJ7RNo0VIJQuiI1pkuEDqVzifWMgnb7DQ20b5jwsC6V6/7gVc3qvAK0kZ1V8
	 KAyv+KDuysErox/pdd7WHYaCPpKGjcNfLaDBM8V17mXvLv0Q4vmFkS/oSUgVcRxIme6pv
	 /vj/13LLfNJMYMG+aqQnfvgtFlUkc4lDm6aNT9ftpXwywhmiPSQJ+fTjo3PBNeU1MR95s
	 4x/EFbiMGb8EKZmIf1kEwGZsXR+TmCLF03OCDCrCpezgzbCZtC045TqbqDhuwJ5GsUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=oUQtFPfH;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBE606A330
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EBE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=oUQtFPfH
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso9396518a12.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795770729; x=1796375529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=oUQtFPfHi1S6G+Lki3MzTQU86GQHUmr/a7X4kCX27BKxweK2JCwd1auoyJbq2h0HbQ
         3X39h5pwxHW+tWps2o0RFgepURXxk1OguFJljOt010jDjXDrOO1KYqKijW6maJ4sEbev
         tUnLjv2oaxOPj3/4XJIxCN0BsmJHLBj3y498UFTgEG+GUR1NLsWSZv1YE2jdesVVwF2X
         tcMiitjnx+V+w25x/IEB2KldSyjntkjyw5NTnEXwkCcJzqLKfdDj+NAhE7Drx6lWOcw3
         ySVBQGUMXO/Ai3k88g/5bXwZVH8M+9vRrj+4D6Ai4t+p1be1gvN2P7nhEJebNOBW/HX0
         0cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770729; x=1796375529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=e7QAk261iK7TiSQjItwGR10ZctqCxEu9sD8fGhn/TmAhOtssrSQ4MyHlZgYHYfQWAF
         EOZ0oWkFXswrVa0Dyh2HhLi6PutEo0ngPm0Y/gmnQN1PVQASZ92lBKLlYvYmRpEOP4x+
         Pz2rPJ6AnV6YpGDUJijG4AX5l51xVS/urQu1HYHfiNoGvCWgtteAk7d1bOlfKIOE3Odk
         DDbxqasujQV9hGsPHHANdJymUi3YSQjF6gTjGT2vJ9dngCTsczYionl3S0tDKo3+jP1q
         c1BA1TA2Gf6vu0rkzpbKQDF2dgYbfh17AzWz/Rz5pRHVlOOrbFyGzXAAAtRbg3HUG2ch
         UZLw==
X-Forwarded-Encrypted: i=1; AL+hErH6IEWYepPY+F2RnjxxxK2a3NobucnatqhBfEdDp92Ei9YAuNBozfYTStuFNywenErXNN15vKCg6N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z93lgfMMae7NifH2sZhZGw3bsLTe8dT/cXNNsUmEPPp3600Okhx
	bv+xfHG/ffiaG+v12tJhgTB1IxCHz8S71iq2LDc55FS9Ou6xuXVeNPo/Xc5hBHtYm/s=
X-Gm-Gg: AZFdTZeHmYGmoPSR+PGztB7IZ6CIgGQCjTov8UIHHhIDu837GBLaEiSTQQMUgab+SPx
	+nTRRedAURgZ91QzsFV+iyA5o7UgWaS3Ht4KqztoBpme8JGX9QefwXiRIDpYNPI+0IrCjS2PR+g
	mqvfKEM3BtNhw7NQlU5JmXl+J+ak/xHSCl2ZwzRfihA27BpiEPF1RX+sz+ZWb+1vpyrWFTA/0R5
	4TgonVjzz41TKA3ZxFlkD4PGm+Re18e6VfXx8WFd58gqc6MfjfNniLgw7HM25OYvMydR5z9jxTB
	DZVXRtXEWA1C215PdgXg6bQF0lZ0yrh+ZbTaPLc0hU8pD0FKz4IaL8teQPEBEE64z2Md5YaKon9
	2JcLjcXjGVHH00Cp6b7gLCKr4zy05M87jed8hd12PunLozFw/p8OGNlXhcEIs3t+7/cqqoeyKZE
	9hKJnO66TiXdoopQZUShL8x0bb1wnOe639xVhwKK9lP4oXYGlx3ExI845Iy0UcNBpBev5nkmlaS
	0Q/A8wI0oDxksp2EQsGGGIzMMc14aqJQ8l/zZ4lXn16E8dS0SXX7kGESF0tC9qgdE6YOFT43d1N
	vUF19pIfid40BoRnIlGU5dW2lBQ5vQI8EeGm
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr15740801a12.17.1795770728948;
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm43017556f8f.18.2026.11.27.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Message-ID: <bd8014fe-6a77-445d-b73d-e87404638593@tuxon.dev>
Date: Fri, 27 Nov 2026 11:12:06 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] i3c: renesas: Fix zero I2C SCL rate on pure I3C
 buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
> 
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - Substituted if/else with ternary operator
>   - Picked up R-b from Wolfram Sang
> ---
>   drivers/i3c/master/renesas-i3c.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 8b264f72e55c..78d0a2c4a19e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,15 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>   	if (!i3c->rate)
>   		return -EINVAL;
>   
> -	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	/*
> +	 * A pure I3C bus has no I2C devices, so the I3C core leaves
> +	 * scl_rate.i2c at zero if not explicitly defined in DT. The
> +	 * open-drain SCL fields of STDBR, which are used for the DAA
> +	 * pending read, are derived from it though, so fall back to
> +	 * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +	 */
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate,
> +				       bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);

The manual (at lest the RZ/G3S, Rev.1.30) mentions on the documentation of 
BFCTL.FMPE bit:

Set this bit to 1 when using the transmission rate within a range up to 1 Mbps 
(Fast-mode Plus [Fm+]) of the I3C-bus specification. Set this bit to 0 when 
using the transmission rate at other rates (up to 100 kbps [Sm], up to 400 kbps
[Fm]).

In case the i2c_total_ticks = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE should the 
BFCTL.FMPE bit also be set for the operation you mentioned? If so, maybe set the 
default to I3C_BUS_I2C_FM_SCL_MAX_RATE to avoid any further changes?

Thank you,
Claudiu
