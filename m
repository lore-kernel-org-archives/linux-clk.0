Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510732;
	b=m/RPCmXACWFUrynV2Ab9pKjwXuaBE2+RueQrJ6AwcMCPv90NW85Det0i6Cc/dycOTsYZ
	 nkotCHdq2Q2fGzyYjevUyquqkIY4qR4pR8ppGoYoCSQXcjLJc0qJ9YuZjA6+/f1EZpm+B
	 uFrweLqAZV1FWH3QLfi5Nuy24Wtk4vkkPKLquPlxcMacyS4eML8hzSrwiIVTyFW1k5CMD
	 +s5P0kdMNh1XWs0gefqpmACYCvkAGoKu5HgjWtRUS9B6rYPQX01gbBpoJtpY6oh6RBbYu
	 hk4IQeQvbRv7hmWMO+dezyoVVIsR1DDAIXly0bGJ/A/pYHIqDxoYfpsFWR3dDonCJOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510732;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
	b=OPqa/BtKfi48B+6wqVJD3ApdwR1T4qcdRK/T9uVu+x6TVIArKQGYLSdX0DQAe39G5Rwt
	 sJj6Vlvlwj0n3UdaIDeWwcDOHma9WKoyVXRVpl0f3eGVlghtDdRQEgAmj7Ryq7HA4egc3
	 XtovaLWrVwEJPFPOKDmHD9/jyvrqL5p3c3LCxbZc+au4jDsjhaIBoW8nwEnTgxCLtU4iq
	 cq+1fpkUZ8+QgsAMLtw5GFk9w6NpxDlz/H9qJC6Njc0e+jGi7ODc4P+7Zv3TwBBn2dg/J
	 mrTiifq+SxniLK8z/cJBz6lod+8MKqiZvfgkYwPGt8fsfBCZm3MlAk13MhIFFl6GENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB406WtZ;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE060A3826
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CE060A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB406WtZ
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-9196d8543cbso31123146d6.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510731; x=1793115531;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=SlO0XAHYqOg27irvAzsll+opjSm3tkCk7JNjgxOLHS9dW38RmmhYPxqBkM83CYvMjn
         PLeumbSOMidFUguWwu0+eJO7qWE/Y7rDUQKxr30meekFLbwq6lSVf4ZK5KzuoxrMhBTx
         D5WzVkNMrrLxEijdjvV0jWN9gPaUQhqtaepr7mmsAD6frNL+ZrwNC66PAGmGw2RP1X0R
         qsk5RYuBdJFl5EZl1Bw4uOu9D8L4g2o6pB9sTyM+2U5Ly3MCZnAos8oP2KiqZdvJZaMZ
         bop55KtRRNErwgGlKoaB2q/pMfcN8xh8ahiAdHkfGM0Xs1TGr+LD8HcrpH4JUpPJfPVX
         0lbw==
X-Gm-Message-State: AFq9FYI+EHkXcGHNZsSOW3I+wKfZNa0Gf8RYIilAgijAU5Fm36HsIYTV
	wCOvA3lrlLtOzu96J9fGyGSbdYktDqhK4Cge2gSv6Ii0Q9I2fkZwqMUa3B1KwyHdUCoZDGJaXCe
	+2KFBj+F/hoZx1r9Ym+Mvq2oEpRBertHlxsof94Ne8Nmmv1jGy2KCaGgo89T4bd65Eio3HsmJ94
	OA5w36jtPutYd4YlXud8UeXQq0lLwc2Up0Kwi2aIMoTJH8tTB1ByY/DkNUaf+4TbMnF9+v+ElNI
	aITNJWaOcPJ+WUc8EGV
X-Gm-Gg: AYBFou1H6OQaEb3FloAXW15w/Ei29VW6/MXfSPYE3VFkZa76VejHLP7LMDyRyLzUW/4
	+tOdlt7iq0qsKBA1OYjYAyEPPnBVLvGDVsK0Tr5NzlOxDA0ED2wPMpJy2p5Mrvc6C3cBDsjHIP1
	dFi//xwgnWz5/BKKN0HxFBmV995n6dTSdA+3sB7mpdw0wpNeCgyr/b8azZwju7fBzLVGa8fRSrA
	jYA90N83fNKuPUM5R313vuVVTCSb0Kdfmw6ByE5gsPexiOcPcgWcy4dVf8HRiQjnv2ZJNxbTfi3
	wuV6jN3oZ9aRwXXX6XrjFB6JiUptfFL788kUj9xT8poxsEexu2usvymIO1GECaj+t44a9wMc3sz
	9CBypaUGClp9h3Eg4CUgUZKb2Z76vamf4U5M2QkBVJ8qDnttBH/hwHHu/EL2YPGJ07kgrpiNaTo
	i5AKKdseKjTe90mRwXn0NmIvCWBhhe
X-Received: by 2002:a05:6214:29e4:b0:914:39cd:e64d with SMTP id 6a1803df08f44-91bdf199a56mr199328526d6.44.1792510730798;
        Tue, 20 Oct 2026 08:38:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c10a27a1esm18126d6.2.2026.10.20.08.38.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363fa3d3e4so70465551cf.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510727; x=1793115527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=hB406WtZjY2t+GkizQ0ZRcE6vtxvs74q4nOMlULDaCo/8GxfqGGJIr4WRBt4tNG5HH
         L+ozJsZR/PMugdu/nqmc1eWWsRctvTyFq5CZCeHR/2ECiETp8fbJrF8xNBYA9smi6oLO
         Vxp6puHSVTtmQFvJsNQN5XQs5ORVbBhI87oOg=
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160757471cf.54.1792510727444;
        Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160756821cf.54.1792510726868;
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5367b3d1ccbsm36400461cf.0.2026.10.20.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Message-ID: <f918c40f-f073-4ba1-ac4b-7765c42a5cb2@broadcom.com>
Date: Tue, 20 Oct 2026 08:38:41 -0700
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
Subject: Re: [PATCH 1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB
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
 <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> BCM2711 has a clock generator for the GISB bus that the firmware sets
> up at 200 MHz. The GENET MDIO controller runs its MDC off it, so add an
> id for it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
