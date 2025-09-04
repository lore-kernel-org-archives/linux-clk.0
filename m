Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F99343205
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010509; cv=none; b=lUG5fOAXW7qNoCuWsCFo05xxY6edNGoSbTlXuNnBYkU8cxiUZZI0azZUJWOr4L9tne8sflv3hMYpxl1XdN99K5FkKVXvIOUM2UhEWmDVYYUWRwAiMCH0atoSlV9juKZK7DRiUgaiBNOOj2DmUPR4NDQ7m4BOBBVGPookGaAjdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010509; c=relaxed/simple;
	bh=FIGB+7RU64J1zqu7rqAxJlLVLxSkkOaRHMjXZLDhXT4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EXU6TkiCD4/q7BZS6DP6GMy+RTNDqC+ya+y0pqW7fGFW3icx5nII8IsQsmWDrTKkeSPNy0IhPbAAYNMzXMGlhRMHUA7yXGE5PZrl2ONp+fdE51WzLSYOpKZrTckvycfNFdNiATwcYssp09NpfaQQDrxnFNdur7YW4+PXEkEQgaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=S4S8ysuh; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="S4S8ysuh"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-3f05a8fa19bso13978455ab.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010506; x=1757615306;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=vWwNTo0B3bsXNLQTV2Kx8xlkk6XZ6G5Ml4Drg5nC355gmdDkSPk2XVhNzn+BNyJbPQ
         Ah7u9j+tXdccJ2xJwrhjBHWS5u7747cr2pB3Z59u4hMTvY3RDbsLZwCA50r+oz2GTIFM
         5hKw+pdf/jDHzR2BAj+FAWY3SpkQq74IOhCFY3Q+T3SZSXdqtzu9j3XfbDkdvnPFdyq6
         FTKJviwS+ItK9z6PCd6Yavx1IIH2jeBxP8BjrW+xUtIwbhoQOasSD+mzSJfVRRbY9s2n
         81JVOj/GQ+TOpLTb7kw+ieB7AomdjXSMJ0rzydK3RPJsF3ZuRKJSt9OX1aN1W+pvcb7O
         3Cmg==
X-Gm-Message-State: AOJu0YzNSL9ukSkd+GB/VhUZ8ZAhE4b6BHfBJEhAFNm+FPfCnhGTk2bL
	XIA6+gubuRMGdRVf+t+K2D+LBOqeOZHD6Z7eyODtQADPd8ngk/iSOB1Ekq7TPgxduLj/hDPhic6
	RO6In2WpUPV/XoA6I1DHuIJjDtQ+ERNBMmvTWLZfflT5pfoi60Us5gnYoRmLIeNIjjAlms2642R
	S/THNZ6nVebzlTmL/iT/9n6ZjQ4uBHu0zBdJS5AezKI0zBeJCyuVZ8uiyoRHUJlTidMB94wRl24
	OKfM48S951rGSH1Nutv
X-Gm-Gg: ASbGncvocdOw/K2Ocu+FdzUfwENWexbf+6jhzr9o2dCjdTkll/wFESzDmQJr/MFg2LG
	FhmH0/ubjv2sAEkC78owjZcXbh4lJXR+dJfpgWYfgnDa7sP+H0SSlTLoASvrbfOyK2ckOLVuQts
	PJema9F5NuNhycpwfxxtfk+VJH8Bd4wmIpoycm1PQiUiLHF0KE/q3tAqsuW+3EJJadOII9SVavd
	n4Kr2H7DJi5NlnrKnLIRZxtcG0jaMSsvVXPlsl+4tsfLbL8Ihr1mTrNeNt7JLrqXCgaXJRf4bkP
	5+WAlFUQDC6YV1Akp+w4Onp8F2Pip+4A9yg7Ywu+/pazv7uhO/+LTbzCywpt8nC5VAzvjSrwZVU
	zYYplQ1XNTQWtl2XLPsMHD4Vc2EAutHX76NYWCADCx0eTnvmRcEByV3LErbvKbw5+iPPD4vw6QH
	foHq/vvqA=
X-Google-Smtp-Source: AGHT+IFtof6Hh9czOgn3ht0VfC9dfCH5phjebaWyqYy2ukFUWdhdRlE5urdCmgeCavKkYrNJ+BAUR6HZ1W6z
X-Received: by 2002:a05:6e02:1a4c:b0:3ed:eab:439a with SMTP id e9e14a558f8ab-3f400475d88mr350294765ab.12.1757010506103;
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3f65fefd9ffsm4066375ab.13.2025.09.04.11.28.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-729751964dcso16050036d6.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757010505; x=1757615305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=S4S8ysuhus5L4xpxqZyv4HanPBwu592KJ+jRAZii7U52/aheJIMdWCMeqySJOTQtsy
         t0fHef8/d+M8xjZjq9IUpnu3tvMGgMOoN8LyomwHLR+60StrYo9i/qk8XHhVm/Y8aB3j
         Lrl6X90cdPkUW7FkrBz3/jagxSD8MmCJl7fGo=
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113127176d6.52.1757010505083;
        Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113126596d6.52.1757010504453;
        Thu, 04 Sep 2025 11:28:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faa7sm51543216d6.66.2025.09.04.11.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:21 -0700 (PDT)
Message-ID: <e1af06e4-4583-45a9-8404-34a01103e92d@broadcom.com>
Date: Thu, 4 Sep 2025 11:28:17 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH 4/8] clk: rp1: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
 <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Language: en-US
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
In-Reply-To: <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/28/25 17:38, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied to drivers/next, thanks Brian!
-- 
Florian
