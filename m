Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185195;
	b=xPm7+i8o/avonQaYYpcrtff5x5yFR/AuS6y5r469NlXqQlEcwWukZzos5ZnIGqlgp3hd
	 UHuJJiJvdgtoEO3ucPt66PMzFS7Mi0zJv0d+nl28Wc+bWsT0iQS63jGwxgwBV5vGqnFYp
	 kXyYrss8MVM4TtwrxkHcTPcqLBPSjausaDImiGmFYt5FomQvKw4+/Gg9cnGqS/pHUObA9
	 0+1nMqQzHeFNtnt4+hIeX4qtaqMFU8p7Eu71OHReYwqhnwuTZoTTQcUPjez6BcLcuueww
	 eb+K5ztSGsMS58PDBTS+Ch8RZRn32xs/S/3jvK6NisC0OqP7JwB0NcAqFrMWykDHapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=;
	b=29nip4MVKMQ6kEhp6PjIWOVsCpE4H4Tgphk4PLfLyzGskRf53CGKwPdMhyQXQeQNOZsQ
	 Q/kqR+nJCgmInfQvzwCT0jj44raVjD2H07Yy74q0QNWgNfft8VLZkKZtNb+A67s1w39FU
	 z9F5YB6IJz30GtV4KpNYSJ6a19G9yHSYN+PdGMgCQyQznxrn8KMWcWLXHxNpzIDcGR9yx
	 uXXPuCpUZnoq5NCy5J/yefw37megOyQCvTcEPTgMmV0UJA0ib9U/c4qoDooHZxOt8pIDT
	 vbFt0SVAwUpk5ptxmB3iAARhtWWYY0QZCdy9a9nKzZeVy2zWu1QbOpQaMuTrRX4FsFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="fVLeH/NA";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60867606A32C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60867606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fVLeH/NA
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a32576da88so542992f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795185193; x=1795789993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=;
        b=fVLeH/NA1t57W3/bCEZIZWhbOFBjWy0sHlhrpoG4Izfr9IGJew9nG3j42Rw6alippY
         BT0vIYEC5b2uFta9Ajxyvq4HLZxEk6248gD6bsXwocEB04kMqZ4iVDN+XhjDx7wYj2f6
         uRvILwXA3WGpDt+jghB/balcWGgm/XhfllCE5NU7WQYSOgIR2D7ZhZUwKnFGGT6d0eig
         b/JzF7ykNyFPqess44kwGAbKuEIt95T+yu/epovAsfSDyGaR6R7UBvrFEfadI+1dBacK
         vz3mktPikbpyKm7zBsyaRloECJHvgHavA5eOStrOxSwbRpMvHMV7WonZA+z5qaQHN/Vp
         Ae2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185193; x=1795789993;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92f6NRETdzojaigU8EyzxjI/4N0lXsB5qD5xAdIQvbI=;
        b=ioWoh2iKB5TkceaATETFoO+X4EZHYeOO6TGzwPGZZ68lMPawGHEjNx8ATpHCSNThTW
         P64xzWHFixuOpO5ptBT2Wkvuv68fmRPH3vOOIePw5gx6eH/7t49MAJLugNM85Ql0CMoh
         MdHE4QphF2z98SaN7L7qFhXBk9BNmnhYZRn/WDfjq5yX/LTcxCZ2whQ2EAEpO/42xjGi
         yC4lparFA4+Jfpb/+2SJh0UkQNIwpeSH1KozBdDvw+fEwGPH4F18I1mZpkH+gB2NqqbE
         pJq8OwNpMmzbjY54DIEveGz+1kzbDQK5fplw4SoBThjqzewVx2fm3q0Rlh5BnWrxkKpH
         kHmA==
X-Forwarded-Encrypted: i=1; AL+hErHuW10AUlH63VjThu7FytR/esBzxqobkbOg+4sNUtm344o4yWHA0UCpClVddElDKSGep6802a8iHXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XJthvLLErCr+tB31J/1ROCChh1fG6QFipTNoHPzh6UUEcPoN7
	YvLoSfqtyZxgKDGhz9xtH099v8bDBVny4jwibg9ZQPCN72x8cPlJ+LVRtNV1UbdYqOY=
X-Gm-Gg: AZFdTZeDs9QMAMaqOl/mIDyYMozorPxBDm7lGYqd/auX4b1Ate1QRRZaCPNNJxH0dZ1
	adH09lZ0R5rgV/jX5VG3i459IIT2Pyt2GBOii3new05FymU/0CzWoBDPSCaJpVns40Snv54VmCv
	c0b42E2ejemIvmNfx6VoUq49SMjkvdHxRpjYvAofRspkI3bAhvax4LhvOXCsGgJCBZ5uys2vrdo
	mXv6fV/M7PkUMK0jErpF5R5dR4FW90Ux9969wS+e+qvFxdDH/cEKjIYE5nBQSQ6qE5U4QKTuUOk
	tW2l/BfjZc04j6L7+mXwFZi0aJm1dqsLB4hJlA9JomU5Wx3nESuFxKUBeZVvoO3pzZZYY7AM/Nu
	TDtWwJ1v8bXR+OKGdR7iPLrmFLUGpwGMsdv3vCTCYKaQb868gZKWrHroO27hzWLJbmqUutxkrWr
	PNTL3UwxLd7PtT1kwqq5PVjeHj46/9rB228cbOSZBaL0WXcGE3UvC5odEB6ER0mq8NDPn7gSKlx
	Z5NDm1//ITc7qkspW9PohgwLc0jXqbktXN1SKLIDWv9fgXBc4Rd6nF6SUYiufHtgrGnIZwHO4SN
	FHCM6+mOPV8yM/w++BAS0fjct1MLxnDCRPSk0ki9S+y3Oj8sICC3qEjIQg==
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr6786554f8f.27.1795185192603;
        Fri, 20 Nov 2026 06:33:12 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm5978154f8f.40.2026.11.20.06.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:33:12 -0800 (PST)
Message-ID: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
Date: Fri, 20 Nov 2026 15:33:11 +0100
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
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Thank you for the rewording, it is clear

On 11/20/26 12:10 PM, Wolfram Sang wrote:
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This
> is a n:1-mapping of firmware IDs to our stable IDs.

Sure, that is part of firmware development.
I know several SDK versions exist, and supporting several of them is work for a vendor tree.
As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
Each SDK version can then have its own DT there.

> The support for <n> firmware versions got serious opposition from
> upstream. We concluded that supporting only the latest firmware will
> make most controversial discussion points vanish. So, we now have a
> 1:1-mapping of (the latest) firmware IDs to our stable IDs.

Agreed, supporting several numbering upstream for the same chip only brings confusion.
But then, why can't that one mapping be one DT?

> I guess this is what Geert means with IDs becoming "stable". <n>
> firmware versions might return <n> IDs, but supporting only one firmware
> we get the same "stable" ID from it.
> 
> Sadly, of course, with the next firmware update, we still might get a
> different ID all the time. So, not stable in that regard and we still
> need the mapping :(

When the firmware can be updated, I think an id change should be fixed there first.
That is what I would do in the open-source SCMI server firmware I am writing for this chip.

> Yes, this means the driver is then tied to a specific firmware version
> because it only has this mapping. Not nice for a user. But we didn't see
> another way moving things forward for now.
I think the DT is that other way.
With the SCMI ids in DT, only the DT is tied to a firmware version, not the drivers.
If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.

The hardware stays described
The CPG and MDLC belong to the SCMI server, so the DT should mark them status = "reserved", and the consumers use the SCMI clock, power domain and reset providers.

The Devicetree Specification v0.4 define "reserved" for this case (section 2.3.4, Table 2.4):
"Typically this is used for devices that are controlled by another software component, such as platform firmware."

Zephyr also uses SCMI on this chip, and it already keeps the SCMI ids in its X5H DT
Juno and STM32MP15 handle their firmware differences the same way, with separate -scmi DT variants that simply include the board DT and an SCMI .dtsi.
If the number of variants grows, tools such as Lopper, which I mentioned before, can help manage them.

Best regards,
Clément
