Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E33B5303
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198470; cv=none; b=RUvU+kyDaq4GzjagyFs9pC6+34AY3b8daZkbpGaYIBev6OsZjKs5cHAB5K5wQhrY0ZuXV04xaAgVXLcYlZeHF9EdSRP235b9WXBQYrlbTRgOaDH48uRsSn121bEkDOCv2iFn/fw3wIVKol4mrARqaThYC2qiPRTizCsHd7mcLzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198470; c=relaxed/simple;
	bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCgdTlbTawR97yhNGBWpgiT+X8rmOWY3axreFYRNw3RWu107LL9IuPEdVd+GNF38PfnKY5kKkKjPicpvsuymA+NBlf+LRmmurY4IC2XM6yh1364dCWInx7XJxp4FdmH6m13jxhpvVeI5uluYHSf8BZDO63Cfwwgr8GvjVAj0Ey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1u6HIcY; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1u6HIcY"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf49dc298bso4932975ad.0
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198469; x=1786803269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=a1u6HIcY2Wpl4Y1MBPzBCKHFNov6ku0Olxfof/HP7Y/X1UuY0R1PydDJQnEBwBRdww
         wfHpfyLOxIz/wVyUBYa7vrKWE7fIEdMOJoIsK+lNFFTLH+6HvF+HpVX0CgRP/rZgB7a6
         uvasRkRS2is/q79NatMBfqOawY2FwwLhed+2AMRc0fN+vdo5pNo/uwi4+BxAviVZmIoN
         2ahwJAkkYrMPcfggsNtq/d3dmyO5gagCO7VrvRrB2dZZvSSRPy0xB8y3pM3Zs/BwSBPg
         gF2h8iP1Ginu0UWgDZhrtkqsRi6Yp3e4KOmTAcx2FuvPu07D7GDy07mfVGdB9Fm+hR4D
         HLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198469; x=1786803269;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=RfgHByTO99O46mifh1CiwKi0xA2st4Mkb4v8o96Pm/qs9oJX2vEGgMaLqleoLpjXqU
         XZuPAYX3Ekn5DwikqlfvMNtgwsWK+OY5IpWZCtCXFgYoGAxpx6b3dVP1B+5r9SXwKXP3
         FJRjH128uaFGR0k6tO0stz4ZQos3MDFlGbtLyfTWobCrQ5OkmBu45LMkWNWRfxZmGTI9
         q8vAaV5RURltgvKBsubxgQfbnKV6hNAv8WP6+U2BhkfQHR74osJ2zdQMNw3xqnzN3fDM
         JfRFXmNK0tyklMV2USlEcGFiE++gjtB5kY7GXvfDNylNkMxauB2gxMNA5A2H1vDrI7Em
         /aew==
X-Forwarded-Encrypted: i=1; AHgh+RqidQD4nseWKwKBzcNRTtHlM55Z1Nnexoos0QR1sDYDW/Gisd2WfVSduUCl20L0gCaXDnZ/N9bPWNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sIb2QCd/gmks71idWqYOXyFUzKUUfagTqDai0VnHrj37HvP1
	4MsgbScPVYAEjGAmZEKkQ7ESnE0vny2fLSqVZBOqDnXVTwmgSiKfdBiG
X-Gm-Gg: AR+sD13yzuBgSqbQeVc7hm/i9K9oeL1ONiSFC0ZNrKgzvljJ/XTV5nenqGOab2gNUUM
	ku4UrvxkCmx2deDCqoknkvqo9wPg++1zJXtO4MM+DwAn+8c0JMipOm0alGCGfV/2QUARfAUgofL
	lhO08rKXOSRCEKowZv7dzkLTXn+bzZXHKVijFrQ0rmOHmggIPP1ns49zAzWqeYF2mcpvFD6uzvs
	lPzIacQoFp4QfPsX2x7e4MpDfqFWUKYg5ShK1uHS/v+eeqGUDKjtlzc2N9iuuled5Bal5gXF12d
	BsmjEiepsLr9ryOjWgEt4yM0InxQkqe6hNgLIm5Rk5UdWVjywmAcSTAMlDqjcV//VIWwnBwTS6O
	2B3LKRYkdqe0cRCYk8cka8+PMdGdYavPeeMGa4o2UV8ZyoL3nGgxIA1LNK7d5pOgeDn04N+P05c
	n9nvlZ8ZSq5kVrrVGoV/EFU5mQR3XU9zSbZpeJpYU=
X-Received: by 2002:a17:903:f90:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d294c225a1mr141926765ad.11.1786198469018;
        Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaa7bsm19180265ad.41.2026.08.08.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:14:28 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:14:25 +0800
Message-ID: <16421007bf6b2a251ccf51cbb5bf3694.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: 
 Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
In-Reply-To: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
 <amnzTxDYtSBojHdY@monoceros>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Uwe,

On Wed, 29 Jul 2026 14:36:31 +0200, Uwe Kleine-König wrote:
> Hello,
>
> On Sat, Jul 25, 2026 at 12:51:14AM -0400, Cody Kang via B4 Relay wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already makes sure that of_device_id
> is available and <linux/mod_devicetable.h> will go away soon.
>
> So please drop the latter #include.

Thanks for the review. Will do in v2.

Cody
