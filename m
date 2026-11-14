Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627589;
	b=uFZunu4CfDMtCjQSeNBRfQZ1Fv3Re3CVOxNKpsXIeMikekPGL5BR1tdALLZO9iPY1LBn
	 3vV5oj5p1bag8RN8AYk/XPozv5aFJj1P2pYfzzud69ovUSPJHxo0f9eGb9TsphXANjBPw
	 u/f8UQ1ZZCFAoqBkO6bOPh8ZLoxW23LPGNvGHPxR7vL+R9kHwmkOVALdZtAVqXuHsiL6X
	 tX4V9ktaZeFwLzdD2zrve7H5KT9YUskw8lK231wyWobT4FL+/bbEGLFpWHwDhC67D3CBm
	 lkYutrPtGxVCpeJ+PdGxqfUC0msBIWH22CP12rLyAQjArncko6sx53Fh0WjONrlx5kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
	b=ghzYrwG3awU9B7KuBng2T+cXMB1nz88U1Xig7YpHIVxgopJIR8m7DDu6DhBfCScvCPbh
	 sgXniqjv18Ajv2RunaKthFaoLZ15o3svsByDujukg/okqipKZ4RKYPsNq2JKWbs7jK735
	 4op25F/fDbYtbnwoPLHpDzrYtpq+9OR48BOszKQQn+t8umF/fkuUts67dhbzni/3mjRrP
	 fDROufO03F0sjyCcpH0I8UOMoy5YFWx9gr8sQShKs/pmHxnf1hiYwE4+AQCtK4BPQQS+9
	 NsUkfNXHW+Aw2woZP+nP7PxjHsaEUkKATff71VW/uiAcF6tPwOPXWlhH4CsugC8Ha7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="SDFRs/j8";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B2606A332
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 03:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859B2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SDFRs/j8
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1456686a91.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627589; x=1795232389;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=x4pnVQqezhq/iopERm8OQ9tTirQNBKwbqk+lLIVyg0Nm6qJb3DFSh+fAfIj4VRNA8N
         1xhocoVVQ/dkPTNMInNwVihGr/Imtkdh3+RlrorAU+6XRvR1PS290kFxFcnCc54YOpum
         77N0U45jgaQ4t/4EhlLQd4AZkbE9IbN3M2GPJI1tt7wbfFBFKVVT1q8MGktgoUlC5P8h
         ZvO1jh0xKfsSXF9wTqNXkrT7oizTXmvKECN/lTbRdVErg+s5Z7ayS2mN0XhYs0nAxTdl
         3D0IRLnzW1mkPk1WziOkSQxrs5rQavr2UqezKD8elgMRbqBnTDQ3XiE90a2z3uJFeddA
         akSA==
X-Gm-Message-State: APuU4Z+8i27d6YLe2O+UorC9NxYDJufTBCUer/D9NzIVG/kVngOdSTuS
	Q7sFl6padlWo7UTsip32D4tVUxT5ODrDZ07idr0enjw7CYq3BhGOpGTdM6OnCTB2q2i53TGwYMH
	Se62VcWP1qGVi8MLMpQX8ymPYo9F5XCua5H4JyepFdNKB+ufn8tIhwoeVejAz8w4uWQKIzcxuZ2
	mDPixJYlpWiBWyAWwqug4kTx0jL1kN4NpX3GgSsJ98NbEqVDErZDrEU1YFC/17w+dSg1O7R/6Nd
	2ok11rq2BBA3GmkX1Mm
X-Gm-Gg: AYBFou2tNj64scUJnTRLZsEU1iZ8gJJx534VJ3eYHJzBTUdBDWxJBSL0pf+Quzvd3u2
	FGxaBYknLoekrXm30A0Vwuphs8YExFbfqfvnxJ1NFtHVw9Z52Y9Q75UQhYXxWlllBLXdrNlToV3
	5v+q5kLNagCMH+A/zsU33jzawmaC0A81iNI1gKPLuvoYzBs7Np0Y6TDLAynItop0yDvfPHKhagN
	6dyXQGJ1Od6ZniTb5am5zgqWeo0qI0otp55vIsTDU3+2zGJPbnFpt3jlwmvrMe7d5rE876gNscY
	4LEN20cIGa3eKnj9CPepXDarfouANQsBv1vcOldahF3WY01US4AHETLZ28MrYVnO2EZZqDaQTmu
	UNkJEJnlW2TlqkC4I03U2snRogLN7t/A4Fe32tEz3gHbnJKwvXwo7JLHkEyMI+Ckdd58O7tKdro
	CVZcgFdxT6s5NV6hfBrdwDu7jv6Ec3B0Drn0W2B8QF
X-Received: by 2002:a17:90b:1dc8:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1b0b5becemr2807471a91.8.1794627588879;
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm3095836a91.3.2026.11.13.19.39.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so1008396eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627586; x=1795232386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=SDFRs/j8g4/06YhWFLqs8QedRbXW2DtCqiGU7b62dfYehxGOBkoGNm0k1NhYXmxBwR
         Eyud54ZHdrV1F6CVpDOznznJ3vEHZ+0/7siXxTQdLJNUluOCCJ86hlai1MoVge1VcGcG
         s95ba3o4cFpRGrAM0uBLJQFQIip+xPkO1PpdQ=
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720449eec.12.1794627585770;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720422eec.12.1794627585050;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm12603206eec.23.2026.11.13.19.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:44 -0800 (PST)
Message-ID: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
Date: Fri, 13 Nov 2026 19:39:42 -0800
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
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
To: Brian Masney <masneyb@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
Content-Language: en-US
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
In-Reply-To: <179358503716.355577.9187303706042543606.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/1/2026 6:03 PM, Brian Masney wrote:
> 
> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>
>> The timestamped MDIO write series [1] needs the reference clock the
>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>> assumes the 250 MHz of the STB chips.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/af7994af5228
> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/ab94dbf30233

Brian, can you also take patch #3, or you would have create an immutable 
branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB 
constant being defined.

Thanks!
-- 
Florian

