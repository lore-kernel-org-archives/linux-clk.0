Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510812;
	b=kgDW3VQrBrylRPHd9rizJBmqa1476/QrMDODRThNU4zInmpSSww/5eBpiumLon0P6/XC
	 VQs+bypaJqoQ2kddK+S61Ax4FGwESPa61piz82U28BEhzGOdtgowbb/A8AimYljKAysdA
	 V0nEaFJfvy48D303oTLYoCJbNncamW7qnA6dDhz/TwnOV2lBkIUF72aKgTh9FDS3qjZNO
	 PoWH93hDAfjxVONUOyTqVPNE8jftYUnPQLPrSuR6w5N77NzmsASBYWQnr5GeVN05DNFuW
	 N2+8CgQKidptuHyHEkHtaV9UF1xi2vVcj27S18r/8/VnS0TkJcw8xWDiiUC/7Bk61QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
	b=YEaOdhbiTFJDz1enMvAgkggiq96c0c5jPIfV7vBOv1LY7zLsXQ2wGD5NkPmAhEF3JPYD
	 SGP4o2WiXY/lcxCSz5LgEHXMGfWlKXC64Zd87MwvDPYSAXeNkdUBabbZ2gX/Q+eZ+K+sP
	 zSecwF2hKt7ymoCygCcYbUjK5U9j8Wkl9Xfy9Srl8M8IOKGVJEnct5XxXppvJaUVWPd/D
	 BtusJ99vhdXKZ36TpSv/WIliHW0h6HbZJvVpgmSuqYIRUFbG0FeAgfqtSNGCG5cWUvbFX
	 AHDsUW7rI/G534wQ0COyJy8b50qlqoF2R8TbZwGUJ28mLI6wfppEKgHqmsOqv8rgzCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68140606A32C
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 15:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68140606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e9cf928dc9so4606295ad.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510812; x=1793115612;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=dgWax/mOrGDTU2xC71L3Hcs3d7EbQ7Yp5386ASIWUOYScEsPnO+tHMJ5EzBCs+MZyw
         ByPpvE22ghSMcIh2ARUGrB5YZucCX63zfxJmbbR6ZAmf6cxBHCHLlHff7T0uR/xf+Hto
         oJtB/rBi90HPp4PTEJp5fEVFANrHMIxW0H14aQXv7P5txNTS6gOywg4nS6Fm//7K/D0i
         Fk3T69bf/8vIBESO1e7CkXgYkSamvjhcHpWILC10H0t9InO+pMm2axL0noewtpuxOtd7
         XZBFhj8SehMqYlooj7N/IivIh2tqzaPly1o57QFY1QzHSvDZ8eISFd7SvA7FToaJsXX4
         i4Fg==
X-Gm-Message-State: AFq9FYJOlJsEdRjytrMK+OIDkpbLutr+uySAR03v9jHq9ebbu/JTKcEI
	Y3B65MrerdKArRVOp0moR6GWf3UsRDGp1ZSix35moR9m2vvvGhT7SL5ShheBx8wz9bk4TuissAS
	QWkIj0pms1kBScAZS7YU5Ki8eDbYf6Sc9MleOvqF94nXh/7boxMzYZyKwcb1Iw/N4VIVn7MpSjo
	ZPp+OXRz4TVh7uHKZT1zT9M0/qFWB23gi9F1ZPXUZUuVC7I+dvAerNmbDo//zLELTkis5SItmX2
	0HdSe5+PZHqIU3gH0m1
X-Gm-Gg: AYBFou00+1EJOIICYwnbPYSIhDhSs5Wt1sDb4GyaYT0RBoObXRwFPgCCCh4Ei/7AfUf
	QjDjCyU4Qd/kTbUML/qk27XO19/V1LMb1GoLrZI4TUvb9iPzjfS5oFw1zg9HPpz0sEvxtTR/aT2
	n9qEcxdUBFaN3qWYzedG2n+9NjIDDifWPvKPCCJYBIS8LU5bijkhR2XVygX+rZfDnopJE/SXwUP
	yYQphIOtwwB+rNKRlpr0KNkHEWnMAo6atyxeevp8x3aD+QJjM8RtuI6JrkpH/XwnuWXgoIEILu4
	0Hk4pFuNWQ2G1sKmPH8eneSY1LlMw8hOff5x9lF7df5BBprHogtK0fN0Z88s7c6IdFnEf6RkXBA
	gUBXyXF+bFgn/BXocXg5aLH3dtrhPiOC1DqvZlrYG+x1lqMTOr4ylBzTD251XtiYtxEn6Ghios8
	meC+dlhDLqXsg1rW1I0RlpgjFBrOzACfDoRNwdu7CotIA=
X-Received: by 2002:a17:903:3803:b0:2e5:ff87:57f3 with SMTP id d9443c01a7336-2ea1dd568e3mr16502815ad.32.1792510811657;
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ea3b4368casm12225ad.32.2026.10.20.08.40.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b7e90fef1so17611236d6.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510810; x=1793115610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=aah81HL6gRqNXvrP5L7v6k5a+60qbmtQH03lk76ig8ZV9PVTj9aAnIIOxAMiAoXX2r
         Cq5Tca3pH1IhRpKTnSZiQSwfGeoRjVwrV30Wc/+8hlGstmMEsS4s1cUqGQiSjd38qH6N
         wFqdTQEXP10z3j1lhSmZVQLldfCr4BJWVXIP8=
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774711cf.27.1792510810341;
        Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774211cf.27.1792510809945;
        Tue, 20 Oct 2026 08:40:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5364de4d690sm92439221cf.3.2026.10.20.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:08 -0700 (PDT)
Message-ID: <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:05 -0700
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
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
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
