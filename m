Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510831;
	b=pP6PZREye3hf9Jg4uuk9jT8EjuRR3Rj1S3CS6K1ahSXslTTSEoBtrP1FFkAUwHkIGvMw
	 LThXmxouL2SYhwYwcZsrQOZUSww6P9jndMaTLmPXTBYAw3BWqux5N9EbHyu+JacaOAM5A
	 +fSWC/zNTC4MmqRAM37rNe3eEPAhEF9zGQudVLWUS6jFD18a82o8TdHVwrytbu9XRINFr
	 0yjubi5vdhr1CZg5xnf8HEH0CDFCardtyFnEAxBlmK89B9rh+fgCogYOWpHjSmA3QtvAV
	 H56mnKz9QEuzCTz4ERiYPFlKOJF95vUCwsAwTsYXJFD6eWMFN2nwOX894Q00z5yJfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510831;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
	b=M4nyFJPsAW8l8FkOc+4gB6r0FlT8DaABqVl0X7HDgVLfGiTNlGBZDZpmcQ82QJ+UDe+H
	 cFKU1aBYp+K8npwD1tEHmr5hVRNGd6lYk4LOwH9hUTs6T16Oub27JCU9jMX837I6IlOGG
	 4cohFcQsdC4gBXEJZ8Q/4srKwimGVeGF8dBhdTbBYlfFNx+h0DCkYYoUEOUTEwkT0Ycm7
	 ZgW04u17IXpnFUO0bO28+/G1OEKSpKqImsO2kqfuKMReA6lmFstKs9PnzIlKdk0adul1T
	 r+9z0vRd2Pjmo36qf06v1czXMl6+DWWgmZ8ENsxHo6boT9tCviJ+Wl4NpFhJY0SL2Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZX85BI2;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D221606A320
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 15:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D221606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZX85BI2
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1832201a12.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510830; x=1793115630;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=T9rQrLwj6D4JVDAD1vwpKMzscrU9hfxHQOyb2dMrN75kEIDtghbKcHG66foSpjWyzJ
         Kw/jEvQs3B3c+G/YsPPjfTxfmeeyDHYwJWoLuANgj/dgCEio5stYjHmypy83vKW0hlSL
         KUaHlMISmL53iUi5yey73tT+P4xvu3g/xKxlVcu0CYk/GutW/5LfLZ0eBUvLKY1JK84Q
         So99ZpLF3TMgCE9kR0Zr/5bUZLhy0jKwiYhRdz4/XrdVk3+/h6JvRdmGK/H/y8gt8Mv3
         7xV4m6aT/8LxhVBUOuSqxdEFS37yH1r+3NkQO9GpEgahmmIk4VmdaUdnGvoR09lODxY4
         qeOQ==
X-Gm-Message-State: AFq9FYLpTgZEnFKRn1L002X4/Cy6LpLA4pHsVpST7Oc5oP0uAlCEkY4u
	yVB4eIhJ4ua0599t/8RuIyuri/x4DXI70dHdfGP9SiX8APRrD9RmPu0HZiAtGyL4uMvxJPt1hwv
	Z8WQgLjiUdn9Wr/G1ltLbGeGS0R13Ppz2mVjfpxkPaSxZu1GTnC9BGP9YLTo6f5p5ocWGfSF1wE
	N1/gUR2bhttjp7S3tCY4z27PXsw2qVqmqdWanhFMWjFblBEQZjyiBKGKHlO0qX21dwiYdXKmsC7
	AOpwTTLDinpt/tJzoqT
X-Gm-Gg: AYBFou0Lc/qRnAaXzzvOFkbQ0tTtWWhpeNjtfSxZYE4VkWq/YLBLMV30Tw5acZHJsHN
	R6gLALFrrYhZvaUiyDCFYsYMw2e3N19ApN6PlSMYJeYCS/q7cqX8v4HhgD/84qABJ/23qsoOzRk
	tWftJdwmnR5Y7i/Qx6rQIc3DWwU58X/FOIOw9cdGOD8VB06ispCpdQtpJ+irBnKeQO5k5RXwvQD
	xicm6YbZ/vlrWwyHIPHAIYhVFaWFMMk2FAArJVm3jqMelkQLQcdYfs2v/r0iFw6VDO4bnEidcPJ
	Xs3wtvA+TemEfirT0kiSlaTqJJy5oSNaqGDQb7BLJiqXbrAWFgx+cGBO063QHVPq+85zGXyd68M
	YPHt12zzOXdF/T/RlvuGeS/VLTrN5vJBcDw9wo1ECC8ZPxGuxTkiCYooySoH5Tl6LQbbCoOSrAe
	bXyBDAYCNShtS8PMJnb4m5moGGWC6O/f2c8TPMg10enyc=
X-Received: by 2002:a17:90b:4d82:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3acee728a94mr10195576a91.8.1792510830376;
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3acd39acf57sm3779742a91.2.2026.10.20.08.40.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536466909b7so57484101cf.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510829; x=1793115629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=IZX85BI2CjOQVXf3MfJB93CEuOCp6S0brf/Vz4Ot2DhTAnD92sQDmF+XACFN/rv0Vq
         3zrQ4lASuAsEdx9ZrvWilN9ReCudYovzAfEGynw8sVAlVhS0So1Rz7q8lENdLcKNyHtC
         p0uDRWZeSYA0x12ppQwjIn4Y4TcOerm+bp8k0=
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164536611cf.74.1792510828730;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164535781cf.74.1792510828049;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm81961331cf.14.2026.10.20.08.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:27 -0700 (PDT)
Message-ID: <d31ed7f0-2b4e-46a8-9345-68173710dd0f@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:23 -0700
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
Subject: Re: [PATCH 2/3] clk: bcm2835: register the BCM2711 GISB clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The generator at CM offset 0x1d8 is not in any documentation I could
> find, but the firmware calls it gisb and runs it at 200 MHz off
> PLLD_PER with a 3.75 divider. GISB is the register bus of the STB
> peripherals, and on BCM2711 the GENET MDIO controller clocks its MDC
> from it. mdio-bcm-unimac wants that rate to work out the MDC period.
> 
> Mark it critical. The firmware enables it at boot and nothing in Linux
> owns it, so it must never be gated.
> 
> Checked on a Raspberry Pi CM4 by moving the divider at runtime, the
> MDIO busy time follows it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

> ---
>   drivers/clk/bcm/clk-bcm2835.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 118df86d717c6..bc1de20c7e00e 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -117,6 +117,8 @@
>   #define CM_EMMCDIV		0x1c4
>   #define CM_EMMC2CTL		0x1d0
>   #define CM_EMMC2DIV		0x1d4
> +#define CM_GISBCTL		0x1d8
> +#define CM_GISBDIV		0x1dc

Yes, those names are correct and accurate here.
-- 
Florian
