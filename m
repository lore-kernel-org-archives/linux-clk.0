Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9C1E1DE9
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407979; cv=none; b=GbNrjywHdzPvd5jPP+2vT4HIM+PxLnfKjEWukA2k+iS8PMpCgyyUpq8GWN3AyCdg4lfj/+XZ4MkvxfzKBq4KROdHSITBuP1Y6S/RUpH2aqlJIHSkQ7lzLNButQjmSqT0KeF9Dgh55Ege2//NYTxOpoLTDjNBaMj4bsSlt4m1sH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407979; c=relaxed/simple;
	bh=gWDZ43Rjlx+lGDh9laRgaHGRgYZo7wIwLr/e4VG29SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y28tqHmgntlTh6ON+ogb0aVaPjtBkvBQRnbm9tg9c4T2vJYDtaS/NIDflWlL9hOEl2pQKCrq2M3lmjLpS93rrAHAMqjgzTkmLLHAVTMJ27afP8elAKfLiKxLNm+FHGZvHXxi4uwm0EaClEvumEBPCxF2eKHOKJ8wV9bSynjr7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PVoZgEg/; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PVoZgEg/"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso35565735e9.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771407977; x=1772012777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgMFw9CbkCbyZeqBEbdpmF8quD3DTGf1fp/leo9IH/Q=;
        b=PVoZgEg/rUYblUsoHk6Aws/0yOOW9cbbwHia2dDFGWTXHiElUQt7RtaD7vU5cHKRfZ
         qmtP8qZJIVANEQ6VXhqyX08CXoe8XKbKX37S7L+rgc/6P/oFTe2nGHCvDFJRKgIyXlm5
         QoIk2rZSZEX3Iq/nkadh2NOQpe+dlu7S+xPL2hri2S0ZUgklzQUt6b0U6xTPrtGH7zyM
         kxgmPOBCRAnWxYCUCDxawuYlyPKgQgekOgnzl2Fr7bHovs1iINCXweVrzKArTaogrDiY
         2VrOFIwBNRyrEFGmqNpC23mOUFTEkTNxU7SbAriLi8c0Vxa1BHSfNiZ6rT241Je8qctm
         +Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407977; x=1772012777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgMFw9CbkCbyZeqBEbdpmF8quD3DTGf1fp/leo9IH/Q=;
        b=UQJYxg9WhGj4y84IMfkxEfCWc2DqFxIgF9+WszEM7Ldm5CvzRFAANSOzstdh/WYCpn
         yH9Tn7CBAo3LV+/PUeyNt8Xlvii/FcwTpTiQI59QJTVBWho9SBWk2Hq/T0EuVJDP6EKQ
         +DuM4MpikAV5hPuI5lGHfh6NLGacUY9gR7ZoqtG62OeYFUUb7G18SdWFs0nysavPjbUq
         br5VPJdrC8NmFh5nkw1EaH/lc7Pf4ei9fMkapXZaVyvJEzFPUvcj7/SHBZ4AYgRBkkkf
         lEEK9F0C3prsRZhtnX6pJ5IaQjNjqbUXarTQ6mjmIsnHVaqI7cPokRHPAUdqqyKmjmSr
         Mj2A==
X-Forwarded-Encrypted: i=1; AJvYcCWkg7FMpMaxhZwcyNWhEdRCnOuxwZLRWMhwzPFS1J42oypy4ecJW0aWJJi8hhCrS8MWZzBPVlcNAwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqTujDJwkWV57VpX6MpBciNP2ExnbFYAsuTBuVS7ZdrXnenhl
	iHuKS7nR+6RQD+B2fMvbK6sqDAjQv3kIsThDqL3WyszylTnGjpKyeWFbRv0NU5YnhMQ=
X-Gm-Gg: AZuq6aL0Z3avSsRhu00YgMVK9TOxgSDN8ltvU7ZolU45fp0ypsZtBhHAtQcJix73FRB
	+yQWfBn8a0iFG4haLGoP8uk9zcG0l88/ApBUyIuc9K6nongWxMOxlKTxGRHHNfxJwbGssgEImQU
	BrBZUrWueweG6ax+SVPHv/d5/sSKSgwn3e6o4a/KUc/WJB4HqGtP9KL3qvxFRe1Pym1CUnmanJJ
	wm2VFo4vv4gWPC+MYeRwR1j0CNWJUUy0KLazkIhkqGFnK2YO30twFXoHeQNsyVZJDRAhsm11+BL
	z43lc4sg0xNeBZPuCMzjKS6UWIc8bBBdbtoKoHD7Eu65jlS8d78OOAwxyi12LhdxPjqUQnwnyNo
	+I8uLj+hbdvkCHa4o0rSnLufB4B1LkAsxB/QUPce+66rxwGs8d785+QVBNuAJsV08D6YzPxvPVV
	gjCLFaEDW/eCWWcCBuPe3IhY5kxud5rQ==
X-Received: by 2002:a05:600c:3f14:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-48398a433abmr22897275e9.4.1771407976815;
        Wed, 18 Feb 2026 01:46:16 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48398244e83sm27919345e9.2.2026.02.18.01.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:46:16 -0800 (PST)
Message-ID: <79a8a0d9-ea8d-4c07-bc02-95d145b831a3@tuxon.dev>
Date: Wed, 18 Feb 2026 11:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] PCI: rzg3s-host: Reorder reset assertion during
 suspend
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
 <20260210113041.138430-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260210113041.138430-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 2/10/26 13:30, John Madieu wrote:
> Reorder the reset assertion sequence during suspend from
> power_resets -> cfg_resets to cfg_resets -> power_resets.
> This change ensures the suspend sequence follows the reverse order
> of the probe/init sequence, where power_resets are deasserted first
> followed by cfg_resets.
> 
> Additionally, this ordering is required for RZ/G3E support where
> cfg resets are controlled through PCIe AXI registers (offset 0x310h).
> According to the RZ/G3E hardware manual (Rev.1.15, section 6.6.6.1.1
> "Changing the Initial Values of the Registers"), AXI register access
> requires ARESETn to be de-asserted and the clock to be supplied.
> Since ARESETn is part of power_resets, cfg_resets must be asserted
> before power_resets, otherwise the AXI registers become inaccessible.
> 
> For RZ/G3S, both reset types are CPG-controlled, so the order change
> has no functional impact.

Even though we currently see no functional issues with this I still think this 
deserves a fixes tag as we need to follow reverse order of operation in suspend 
compared with probe. And the patch would have to be moved before any feature, 
preparation patches, to be backportable.

The rest LGTM.

Thank you,
Claudiu
