Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9E2931F7
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588279; cv=none; b=cbPecQVxPZlE3v6+glH4yVN9TwIU+xLHUqJ9PMu9GQLJT/I7KtKNPcybYpzZpzi3G7tjcSvC35gNu25u2Q/AqVTQqmcb7W2dks3RwlrfmYMWUjmSPBHkhJyY/Eru3aq8r8mKuwg+tDyPk7eS2SdXAXFadT7nHn6AXuNGXbG9MTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588279; c=relaxed/simple;
	bh=GpMN8OWiZn3sJAsGNS9/bLw2tptGS/TrOfXXHgVTzYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ+GCmwdZBGZ9O7TJRCdanaZcps8Diue3511pQhzDfeUMyBgox/8bdF2nghcMGw/hVqXJ3pXlJwH3qxm33CvIkVddhg6sEby2q+AHeMudPHaok/sguGMGStC1SN2k51DXktNWLC9xt0jlOsuDeCobw5T/CXb3gs6eUHkHJ6Q8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nf7FeNaf; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nf7FeNaf"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4106739a91.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588278; x=1788193078;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vukv72t/akVqDOEqgANR7/sL2U4vCxpeqPG5zNuCp5E=;
        b=brQQqc7DSTqA44WRX+ieSje57ROxXp8AVG0GH+f4KsrH+7eb6sWCPl23q94ziJd+cZ
         ffr7HtB6rJxm99vy5RVNsgVsCHJ53k2JVcwtuux0TrjQ19dCZVCLSk8p5v9raahXrhp0
         nWUYC7vatQdaki6QguvWJiwjFW3hdv4lmXmo+bUS8SSuoXW/aBo7W5arulJVoDgVuaqU
         frojx5Z3mRYk0Aq0wOJ6V2AQtuDqwD1pEjejzccHp4oSf/v2sV/jyp0HANk6ZVSr8XFq
         JiAr1CRlPxr0qnr5VtH2fjsCx7DemFrMtyInt73FCGkqUV9j1f5xPeqcqvq5acGPSZkM
         C78w==
X-Forwarded-Encrypted: i=1; AHgh+RoG8lrDvhlKNd6TU5WYB/DtJ0Q7mxMZWogEZU3UOXRb1nQOra9DqvpVF+blM/7iDy/Cp2qv2qAddaw=@vger.kernel.org
X-Gm-Message-State: AFuF++nsz738wwixdY0qARBDSHU+z3UhBwTWPGwZF8Oisu0uZckPTdCU
	S5pf1QlVFbCiz48nn2VngkJnKHt43xiIPjzYvhUrjWDiewcioFO3Fiv3osqBLLziPo8URu9cDXI
	Pkb7iLSOsBEHlPVgGSlxbhXd20ILfrp/K3MnT50Xsi+G91hIbnLyiqP7b3/MZ6pSmSvkOm0KSrB
	BtOgezI6TpYR7UuZ7dXaXFdKkI0Qd45rgkmJ4MfdouOD/DSmWHLf1vE0k/iNbKTO5sjJxLGkcu2
	qU73bWobkuVM1IQ3bya
X-Gm-Gg: AR+sD13Uuw/gogDB7sf0NeZOcSlhaPwEHFUxXEcE4pt2XNSV39kxoBRisJnx2IdobK5
	VUdoDxCEwr3g2ihdYWR7sslYedZc7zya0/r71LmGTRF+c+tn9rFgqkV3+GAZBft0Cj3MyNDhWBC
	w5trJ6c/YwUhxMfsNQxSHGIp3z3xuckrQ14KoGUYVnR1mHIAGY80Now1C7o4ZGqzTfldSBYRaCY
	oL9p93i3NDIq5Ymktq+Eo1c1pUyjerryWoSgfbQ125oCNwpM5Us/HVmAk6bp1tkvbQGdko4bbjp
	q4HvLYOO9xUZFk6hZWuFERgJuEaoxDIOfUTEHpg8BW8OYme0qNdDR04JAJeFIbs/3ZYdf7hdcSP
	/vMmG9S9A+Fe7TYx6p5iK2pmlKYYhTP+s7RHJIpH0W7rUxlTmipaOJWS2UWDvfYSC6CmOLTZWF2
	qC2eZa1KgdH6cj30wUOhHcsJ7JhZGfnmpcvbc27jhY
X-Received: by 2002:a17:90b:4a:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-395c352f984mr54520819a91.11.1787588277702;
        Mon, 24 Aug 2026 09:17:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3964255c33esm29791a91.4.2026.08.24.09.17.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:17:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so48310361cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787588276; x=1788193076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vukv72t/akVqDOEqgANR7/sL2U4vCxpeqPG5zNuCp5E=;
        b=Nf7FeNaf+DcQohXwknp+/4RnDUkxLoTYakA0u44SZz42SCG1sqgVa8YTDl9OhSjPU0
         NjU3+K3iGydXpyVQ7DIfrCpVivS1/nupPy/qfj8q4oOLvZPMme7W5fzfEoN+UF24gC/4
         V+F1FyJy/L5bzNA5e3iPmICBIr/J5CM0T0fN8=
X-Forwarded-Encrypted: i=1; AHgh+RrL7B7eH5jOnXuJ1bxP/DDOR6aoeDqehL+nMemXQfsAzXaUVEdYAoXiYuyEUNoujxVBhJqHn+54WBc=@vger.kernel.org
X-Received: by 2002:a05:620a:458b:b0:92e:745c:6c5a with SMTP id af79cd13be357-9373958fc89mr2486759685a.14.1787588271539;
        Mon, 24 Aug 2026 09:17:51 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:92e:745c:6c5a with SMTP id af79cd13be357-9373958fc89mr2486483185a.14.1787588252430;
        Mon, 24 Aug 2026 09:17:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abec47sm528148485a.1.2026.08.24.09.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:17:31 -0700 (PDT)
Message-ID: <d54a01dc-f04b-4db3-9899-8321b3a12015@broadcom.com>
Date: Mon, 24 Aug 2026 09:17:30 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: bcm2835: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org
References: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
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
In-Reply-To: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/21/26 03:03, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
