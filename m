Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142189;
	b=s2Zw4fA6h6YyJ0l7VA3b3KZxnh5uu9sZE8SNtvz4fB4S4aCSFgMrcx96ExcdaU/lTplG
	 bMOYiHEqFB/Q6pz+1/1F+yH828RlM2hB5dqlLuU5dTrVz20KzOhMclXcvjqbdfTbtxpd/
	 faW1VHQUf31ksSh17UL72Z6QUESk+/1itazPRzN/u3vfJdfKIKOb4cPig+Izs8KsHs8lz
	 /UOVolyabf3kyyzJDzvKIJs6BRVzThzn+PTi6FLxujpTQkyghRGnFAPgS+HTngpLgOUqX
	 +gyQRo392FdBeYZRQqAE0UpU8JmlOPl/7Z9HoPleY9yi/OZg4aNVhMJMugnGahgB1oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
	b=m9bvbu01Ghj3kvTsqkRnhIOsnh4Wkaychg+561eq4e7M1ZM6YjsoS62dCeHmxJXxmYxd
	 TxRVS9exg2xdINl/8+msKUcLEMuOA9gMCaL4AoVwfe0lslegYWAfIeWFzrJ6st0lxJlT3
	 5Ti6TWuyAwUVWdUzy/tiogv1favpeOAqTLHqMKynzqbizeajIri8d47qepWU71RPZpH53
	 i4YI4y3MNvFU+4uQOUMBGXUQo2phx7ojVBWHvA9LXa5W5YGfVWhF2z9p+TcfVM3d0NpsL
	 xzJNRgnXcaRiIukJyQV39DIxnH1WUgrZWSL2n0rZBeB+fg28DDdTGGJYJcwJ0yUDBXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=foql3SGB;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5B606A326
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=foql3SGB
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862df509d48so285154a34.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 18:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795142188; x=1795746988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
        b=foql3SGBe3Rq9oCsFUkdTTucFdgN3jVrImSDrUxdIZUh/drXxU4ErM5hUkGjKT9WPC
         rz8mDme6UPlFmmraq8LBhslHXuhVymCqZWyO+BlKGXrXxGyBqFO21agxbpbb50I175N3
         NJl2XCkC2L4tqB8rmwnKwltKLqVliUbO3+Kz8uEIqw7g3sShAe4Z++/lubjj74J6fO1H
         JglAuz9pLIEEWelptb4EAdGV7xdriEqLVWUL7FQvQiIpS/X07iErdrdctYQ22rs4SGHD
         1R4slVaPokh9fwr3dOcNiQ7gdYba8xBP0LMNQ5zblaK0mj3gw4LGmLbpPHnTcNCVgi+H
         bUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142188; x=1795746988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
        b=B3gtDa40+DKyUupc6mpFHAQvYkMGVsLXSEcKElSl/8rlWBtFLLuyp19DxA8MJ8syAk
         CsEehVd4lN56ZkA2RXaLbRmyuWRLcKc/42zRshlj4zCGUPgXnlMCpc45o6yvkECmIuUU
         kE/roSXbKkWGoci+xTn60aAB4CdEm1+UZJuuk7NnrsDtgu6aIrLHWGCql+E7mAbHwz1Y
         RqUzQkn2DAtTbAi2wg0lbNl5AIz3z5+xLXvZsTWD7/MfwyZ+1wojtlZX75Zr+GubqBq2
         CiJIGjQfZv/FEsQXm5acsdiLQDNIz7O8LyeRp6Ew/Ciqm9zdKLuY2mW4VXyuqIMfidiE
         H1gw==
X-Forwarded-Encrypted: i=1; AL+hErHSwTT/FXIJmCmKFb0vELdn5yadNT6wec5AZFhnPrWTTFOZnUSS4VG3B0AusyPaRlgXfFGnQgU8xmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/saYK32wSlpElsUC9qg74iIN0pECEFLGarMeX/Xt9J5yI9skcJ
	BXknzELvYsJ5UZM+AaOUVlyW/i51YXjnbhwhhJRkfnvTy49/+SOPTMOwgboR+IJ/ybg=
X-Gm-Gg: AYBFou0ZYHQb0ir5SM/FnfaKX8P0//isZB0alpr7mGX2RMrZK8Kuw7AhzbAOZsKHGzm
	qSifMkwoRePu2Y/JiwImzedXa5rZifmlqqy2OvjIr+woX2b388t4pOt56vsLGBIIsAzCNeo0G3R
	zMFhFsO6PAGGYWmr8VePCO9DaBox8Jehfaa+IclcKc6tGp3e1RdmBi+53odD/AgGEW5zxlprkfC
	aMmovn1Quaa3V/pL8ppfKfu+0n2J6oI+jsoFi3pbyf5pDGhp81IP59zwtJSHdaX+UPW79jg/ZrO
	x69VOVRd9cF0sb2RCAGVemZZ3+f0o8qgz6xSLz9KShqRs1G+8U/v64LtfPapJ2Gd0GrLAo+tK4y
	RbcRoNKTwEEyRV+vujic900VUVvqO0UlOs5fHhplUkAKvnihktWrv/ecJRp+4UaucrNL7ELS4j7
	qVg5jTRq2lkZYefTf4iw9YEP8SToMyFPz2cJfMHlc/iUib8ehByGhVyYl6vc0clYoR4q/xDSzQT
	3cz9nGgGFw6PhRRPepSymZvQIsuLlbzhpVVe4U0TB4VdUlARjeC0sMEYxNdG62SaSleA9rZ3Jet
	/qzCNrYeGLUa9zTHvMrqqgpXuhoLbnvVHdyTxUlfmhI94OEv9Kc=
X-Received: by 2002:a05:6830:4109:b0:861:5d56:bd27 with SMTP id 46e09a7af769-863155f228dmr1753162a34.7.1795142188164;
        Thu, 19 Nov 2026 18:36:28 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm1127151a34.0.2026.11.19.18.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:36:27 -0800 (PST)
Message-ID: <9066bc1a-3b92-4608-b925-e362847dd1c9@riscstar.com>
Date: Thu, 19 Nov 2026 20:36:26 -0600
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:43 PM, Alex Elder wrote:
> This series is comprised of some code that was previously sent
> separately.  It now incorporates a new system controller driver
> that advertises clock and reset functionality, as well as regmap
> access to its address range.  This combination is being treated
> as a new series.  (Details of previous versions are below.)
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC.
> 
> The system controller driver adds the clock and reset devices
> using the mfd_add_devices() interface.  The clocks and resets
> are implemented by drivers included in this series.

Krzysztof Kozlowski questioned the use of the syscon for this
chip, and after some offline discussion I agreed to go without
it.  This means Conor's ack won't be included, and I won't be
doing anything I said I would that was related to the syscon.

The clock and reset drivers can each stand alone, without
using a shared regmap.

Each of these drivers uses two registers.  But in both cases,
the two registers are discontiguous:
   clock:  0x1004 and 0x100c
   reset:  0x1008 and 0x1010

It has been suggested before that separating the reset and
clock drivers has advantages, but I think in this case, the
simplicity of the combined driver (especially because of the
interleaved registers) is the better option.

For that reason, I intend to *combine* these two drivers into
a single clock controller driver that provides both clocks
and resets.  The source code will reside under drivers/clk.
The combined device will have a single DTS node, defined by
a single devicetree binding, and will use a single contiguous
address range:
   clock+reset:  base 0x1004, size 0x10

The next version of this series would have no syscon, and
with the clock and reset support combined, it will basically
be a new series.  I'll provide links back to this and older
code, but the next iteration will consist of:
- A single devicetree binding for the clock+reset combined.
- A header file defining clock and reset IDs, here:
     include/dt-bindings/clock/toshiba,tc9564.h
- A single source file, drivers/clk/clk-tc9564.c (plus
   updates for Kconfig and Makefile)

					-Alex
> 
> 					-Alex
> 
> The system controller, along with its devicetree binding are new.
> My hope is that this new model addresses concerns that Krzysztof
> Kozlowski has expressed in prior versions of the clock and reset
> code ("fold into the parent").
> 
> The clock controller driver was last posted as version 3, and all
> feedback from prior versions has been addressed.  This driver has
> essentially been completely rewritten.  There are now three clock
> types (PLL, fixed factor, and gate), and each defined clock has
> a parent, and the is_enabled callback is implemented for the gate
> clocks.
> 
> The last version of the clock driver is here:
>    https://lore.kernel.org/lkml/20261012152408.3729237-1-elder@riscstar.com/
> 
> The reset controller driver was last posted as version 1.  All
> feedback received on that version has been addressed, and it's
> a bit simpler than before.
> 
> The last version of the reset driver is here:
>    https://lore.kernel.org/lkml/20261012164354.3872326-1-elder@riscstar.com/
> 
> Alex Elder (4):
>    dt-bindings: soc: introduce toshiba,tc9564-config-syscon.yaml
>    soc: toshiba: tc9564: add a new syscon driver
>    clk: toshiba: introduce a TC9564 SoC clock driver
>    reset: toshiba: introduce a TC9564 SoC reset driver
> 
>   .../toshiba/toshiba,tc9564-config-syscon.yaml |  68 +++++
>   MAINTAINERS                                   |  23 ++
>   drivers/clk/Kconfig                           |  12 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 288 ++++++++++++++++++
>   drivers/reset/Kconfig                         |  12 +
>   drivers/reset/Makefile                        |   1 +
>   drivers/reset/reset-tc9564.c                  | 135 ++++++++
>   drivers/soc/Kconfig                           |   1 +
>   drivers/soc/Makefile                          |   1 +
>   drivers/soc/toshiba/Kconfig                   |  12 +
>   drivers/soc/toshiba/Makefile                  |   3 +
>   drivers/soc/toshiba/tc9564-syscon.c           |  42 +++
>   include/dt-bindings/soc/toshiba,tc9564.h      |  46 +++
>   14 files changed, 645 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 drivers/reset/reset-tc9564.c
>   create mode 100644 drivers/soc/toshiba/Kconfig
>   create mode 100644 drivers/soc/toshiba/Makefile
>   create mode 100644 drivers/soc/toshiba/tc9564-syscon.c
>   create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

