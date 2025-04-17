Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E52566FF
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912487; cv=none; b=thAM4hsgyT8wzxHuLEUEdXYgLoPub4huDrzLTAP08zLfU29qUt48a5W3at01xZ8SgwRZfm+I7jue8iAI9HH+v11ebS0nnKIP8KU/8f7MSwT51scbKDclcv6rwH3RQZaJ2JAExtqHEY52LAqx36CRcUOPmGTH14jMY/gYLEd/+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912487; c=relaxed/simple;
	bh=xq9ZcUb87c6ZeHlcilupd/aVpGLaRaH6UoIUaOlxWVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2Z65Syi4ovhR6LaiatZxGjc2IbaS3EJcpxoXiANEkAXbgJUNOVbqgFEa4g3xeluNtFE9V7RoeYjesrZhj81sG7NlAr4YdYP0TKc3OpHQC59joZ6Pfm/Qsm9TGhiptbF9IWDpZ1QyHRWk+0LDlLwLRBdjmTIRFHqxSYafBdPUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RuYSb9wn; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RuYSb9wn"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7272f9b4132so821178a34.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744912485; x=1745517285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=og7k09noHtZfCJVyKsPNkxjxxAFKMtNjRhhBEMvppsk=;
        b=RuYSb9wn8R58RM54E1ssfyIBmgFvmbl3ofwFL8WwjO9mEN7TbbmutBT9tb0mUV3AJu
         70HrkV2r6JTvquh4X/PgoRq6UWR6d79Sq/IV22ru5VHpSYQylQMRuFmGd9m2Ylh2CaTC
         tBdLf3cxwgnSD+gHMrErYw3vr10fEH+Z3K4qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744912485; x=1745517285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og7k09noHtZfCJVyKsPNkxjxxAFKMtNjRhhBEMvppsk=;
        b=nPTqDOLBi33EKBePsYoU/PDkPTyCp0rnnP0ZpL2BSRp6UCkTsjGTIvYs4JUSrFAD6s
         jB7lKBY0TfBWQeG3jIAErIy3Z613Qg/pqa+/y2SfiUK0T++7l6o4Vn38bltEMx0Eltoa
         MUoViGSn69GVz49qMvZIh+7THSi9QjQzOWG5vDFB+V0LzXhMNQel8ZuycZ5waURt3Zvf
         KVWZ9xfqJ5raAJUkGlk9au7x/VV8DqjJWnGwoIKH7WIf+6o2VOWoaV9PtdPx1/8ie+tP
         8ihLzppdRnusDTX4DwlCY601u5NclKreiiHFfaPibZ09p477V99F/RxrX8ho9A0EW1lV
         nBUg==
X-Gm-Message-State: AOJu0Ywy2bOxqW7NJBK3cRoDyAGF2jsL07lXanAmzmUYuqwg5KJs0Oxn
	5hLz3XTybOTyKEO5EPDRfONr7udxlBqlofEpGmjVe4x8RQFGNeyB+2Va4TPcWg==
X-Gm-Gg: ASbGnctFmIg0vyaaguVKHZB3MNtDbRZ3al2WENCNQSUfyvhNiRJ7Zpp9g+iN0SGdf2N
	eIAPl/yoY3ltOCzmBUDnBacUp9oUbgTnxkCPIPp0kM+zDfun0phO+MC/zRuZ6oDFE9e+UuTp5Md
	+xiV181LlPxhdiAGO7j/PMXksmYFlY9XXfO0xWWY/8A930d6sQhRSUVyr7MgAo3yep5dXKRL07u
	iD6ODLWw2H5qWrLNkKMAkTHjVuT03/lcP9PEj3sNxdVA5R5j19uinyARwV7YBspSjTGvp9NL45v
	NAspPQGgIfFY0hAmVU2qvRk01I1gGD1SJZVxBTiDMqzC2w0GPdtl4N72TqKJ4VJZA9j/5VCG6S6
	8/kBy
X-Google-Smtp-Source: AGHT+IHc2QyMx7vxFWIH4oPxUzj4+ePDTI1XAQL3ZEdUDj5rUuKF8oPqdm3pGkJLivkIt+qNCRUv4g==
X-Received: by 2002:a05:6830:f95:b0:72b:a712:4b72 with SMTP id 46e09a7af769-72ec6bf43famr4298912a34.9.1744912484732;
        Thu, 17 Apr 2025 10:54:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047b6529sm34258a34.28.2025.04.17.10.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:54:43 -0700 (PDT)
Message-ID: <35f82d96-6c93-4036-8499-2cfd4cf00c45@broadcom.com>
Date: Thu, 17 Apr 2025 10:54:42 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Drop module alias
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com
References: <20250415185614.16292-1-wahrenst@gmx.net>
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
In-Reply-To: <20250415185614.16292-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 11:56, Stefan Wahren wrote:
> Since commit fbac2e7787ac ("clk: bcm: rpi: Allow the driver to
> be probed by DT") the module alias isn't necessary anymore. So
> we can drop it.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
