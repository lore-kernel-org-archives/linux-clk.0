Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63A13D638
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 00:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055817; cv=none; b=PO32ynSzxJHVFBncqIdKZjc8ARcu4TZJmB84KZNk8zX8cj7oTjdeRh2zDRMYIj7xXJjVMDi2A6xGI7zwaJvCNAgB7+hPmaD7eUvZ2nnJFIESC+Q8giHV8fx64cJN5nf4NCkOs4bmCBkCibLDI6T2+VLlJsrHn6DdK4pZ3oK0Lv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055817; c=relaxed/simple;
	bh=42Du2CLON1ecQ5mNngEuokBJCgYS/KHqsmqoyYaW7kE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cc5hJLlXUFK+aPeEbmun+7I9FXP3mMcZmbiFnjx1I7vRpwiW6Kv8epMhTXJEj7PccGcJANPGirZNO4sBqWulGXc5gW/vI6sPf+ZWDqfsAOZBga08ZeIg0wlQnmPEyslhheYQcq6yeFM94+oEVYG9yllsVS4Zt3SUiZM9jACmzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WBm0aAc2; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WBm0aAc2"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d7c38352so1069995685a.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 16:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055813; x=1767660613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=WBm0aAc2WOPomHLDHBQQK+pRUaq4wUn48KZX2+F4W37FcjAEfko/uaybV+8waLKcfW
         VJ5YjzpBPr/2rEn4/eTEUHGzMhnM9l1ouIOD0029CvJ2wjzNKyj14NmxNqK8MccaWHPN
         e110l+BIIbIC4hu9nz3qGu3HrLkhJots8NwNxTOU8G2exylB9ArPfKJN2Uzscr1cKTNS
         wFbEqsKry29vDnmYsRmJsWcc+SL7vv2b17VQvAaJC8KGiTC89FwXgWi95GkeonNUJ9wP
         J44AbsrpKwnCvbQpiL+nbabaxAs36auSWukZX16RnUhUemyViSBjpkUcAq+ieNEasT29
         UrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055813; x=1767660613;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=R+r4JjUHWEEQoH8vaVYtXNY7U+zpEKvd+0tX5ino+sU52eBHyutuyMiNxzjpFXOiFd
         5lJJ5n7l+loap3Ea+KydRRPwqKoQpfmPqsXU+TiFTy5P8gLdB6PEMXQaSAbjuXq+BHJf
         ZzTt1pfHeNOOBRs6D2uhKrl5o6DxnGvmAGVZcyqM3gZrxulbUc7JhIWjs7yRRkeyGKCW
         +j0sDawL4nedUrkfzkXREtvU7Gcj8gwVpqVKdGMqkJmH3/pHrFCABd1+q8Qwpd2BtRK5
         Bc1iueD8L8Z/mjKRNBxSHDj+Z6x+8pUIKxTri6WHRMBcXJTUHhf/cxszoJRNwx5Of5ZG
         Wymg==
X-Forwarded-Encrypted: i=1; AJvYcCVVSP2+ap8UKg0+WrEvstzISen2paVvqlBP4E/tJDkeoWsUYdGkFJahQXHPCm7AFJd5qr+kdA1KUSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcUVbfMVk3dx9h53iMYmRHNgSRMA766yJJFP5tF2mmbhz2oUz
	rDY4vcCiJArGCq2o/tkGxhVwY0cmCFSHvwrxRN+j9iOnHZnAp3cu5N2VzEnj/+h2qk4=
X-Gm-Gg: AY/fxX6uPuqLYlUrPimwBf8y2XnMVD1DgYx+AJarJa3WbQ6+LzFMNYl+jF5ImtCZMoK
	ogJGACilXVqMVR1A/A84BtSy9JVHrHpVyPx4b2jxBqbXJDPz8ftPnfCAg7Q+EXFw1ZAUmp3pq6D
	+L6UF6XMoyMC2QfPOUH0/y1OFIjMdwYedyW8O/RII3LZ9Ik0QlrMXV9Y0pr9wfh1qWJ3vbc+5Qt
	quLhc0oQ5f0Lmrpf84gz7f09btoMTcJBueb3b9qAyf8Cb8Usm1bJz/jnTIkztUxPMJhG8V8UaWe
	M9nY0rI/ayeRZA/jABMS9SEyu0AQtWqrmUMHyskLx1wtQ05w0/xQk2pIr4V8osy8x2Nb7TfPPgy
	82rqz9ItL3ZuKanYacuVv9l6YnaiHuE82bz/gpzHE72w5/TwCCf9iabwdUqAgLnJQ4ASorIgVAd
	Fw96asYu6dbFN9AzHco/9k+duh2CeEjg3QnpMC9qbOpDeNoTJjtXq+yr3c6yFNVA==
X-Google-Smtp-Source: AGHT+IHk1jnBQLry143qcwBHNuIgjGX/ECeDXUHHBnJflR5W+2APDyw+OrUHlSdhTu9nzhHG4A7//Q==
X-Received: by 2002:a05:620a:3f85:b0:8a2:595f:657 with SMTP id af79cd13be357-8bee76c8eb7mr5352874385a.21.1767055813193;
        Mon, 29 Dec 2025 16:50:13 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:12 -0800 (PST)
Message-ID: <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:11 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 12:55 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new SoC, extract common
> ccu header file, so it can be shared by all drivers.

You are moving the definition of the SpacemiT CCU auxiliary
device structure, plus the to_spacemit_ccu_adev() function,
into a new header file.  The reason you're doing this is
because these two things are generic, but they're defined
in the K1 SoC-specific header file "k1-syscon.h".  So you
are creating a new header file for this purpose.

These are things you should explain here, to help orient
reviewers and will inform anyone in the future looking at
commit history.

> Also introduce a reset name macro, so it can be both used in clock
> and reset subsystem, explicitly to make them match each other.

This should go in a separate patch, and should change the
code to use the macro so it builds and continues to function
with the new change place.

However I don't understand why you think it's necessary to
introduce the reset name macro.  Is it because you want to
incorporate an SoC identifier in the name?

Even if this is your reason, I still don't think you need
the macro.  I'll try to explain what I mean in the
next patch.

One more comment, below.

> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 13 +++----------
>   2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> new file mode 100644
> index 000000000000..84dcdecccc05
> --- /dev/null
> +++ b/include/soc/spacemit/ccu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_SPACEMIT_CCU_H__
> +#define __SOC_SPACEMIT_CCU_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 354751562c55..13efa7a30853 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,10 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> +#include "ccu.h"
>   
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +/* Reset name macro, should match in clock and reset */
> +#define _K_RST(_unit)			"k1-" #_unit "-reset"

The generic-sounding _K_RST() encodes "k1" in the name,
and it shouldn't.  Also, why do you use the underscore
prefix?

Anyway, I'll keep reading.

					-Alex

>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 

