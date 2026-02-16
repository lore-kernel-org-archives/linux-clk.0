Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E02690C0
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244333; cv=none; b=EjgCitXUCt1iaEan4aJ2hMddMNZDKppnHKv3VrTioMCHX8qJ+qSaCOXiavQPGj1ChcqgIG0GsPF46LohubdbF6G/pef/T7dLvJTsAP1DHOdqEg4ooTidXxU+n/e3G219rduXsfjGJbKCDvA0LN4tssNxNfy3Ab77Jgni6BtojHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244333; c=relaxed/simple;
	bh=NDIKOIT4sSt9XuIcL4/MRBIm6pbBEzWUJvadpY+UFW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOTEpqcpC0VCzFSr2dSjAZgNq270FGTM8H6G+o7efYHe51F0eETgHt8Ztg7jhFiItcWQUzH6glgQqTcworagZzX7NfBkK1SdG0Rb+NO1m/3jKf791DjrUD+JXnKd0zplFii/BLH9rODRaKXaQLvXwBW5h1KwPtjSv1ckdTvskmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kPBIMA/s; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kPBIMA/s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C2NvsMxoWNVuUqRhdvvQV3f9iNA9+S0f6QJVA/XX1tA=; b=kPBIMA/sRAOsa3jwN6/PZ5Tk0O
	2dxAzeWhKqPER+8aVa5N4vM08Mr9G5ewBkId/zezYtybBPS+oF0SKGSXy1NUsRPQRcj7JiUTZO95E
	He2I40ZGS9BSoK8uDOkAoQyUKC1LxbaWFECwDaQuhSCANE3i6tXufhgx+VB08EI+LX/7oWdDlprXg
	lJoFvUliz6A+5eu+oWPFSGx4XhVIrjep86hp8ZocGod9b62hIaPwUBhGPcTiqPz2/ZgAya8FbcCWR
	4NBufBjqivKo/z3djmIh6vZWL8KaK3X+e13CZNSRgQEbko2ySfEy3K8bv1RA/Rq5PpJ5J5OXWVTqO
	IAPvLL8A==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vrxYl-001Hhw-My; Mon, 16 Feb 2026 13:18:39 +0100
Message-ID: <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>
Date: Mon, 16 Feb 2026 09:18:31 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
 <20260216-brave-ara-of-typhoon-cf90ba@houat>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260216-brave-ara-of-typhoon-cf90ba@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 16/02/26 07:53, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 13, 2026 at 03:52:56PM -0300, Maíra Canal wrote:
>> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
>> HSM initialization, which would result in a bus lockup. However, those
>> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
>> respectively), which means that they can be enabled/disabled by the
>> drivers.
>>
>> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
>> drivers when appropriate.
>>
>> Acked-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> It looks like sync_state would be a better candidate to handle this?

I have the impression that CLK_IGNORE_UNUSED is still a better fit here.

First, the clock framework has no sync_state integration. The only use
of sync_state in clock drivers is done by Qualcomm's clock controllers,
which uses icc_sync_state for the interconnect framework. From my
understanding, CLK_IGNORE_UNUSED is the idiomatic mechanism for "don't
disable this clock during clk_disable_unused() and allow drivers to 
manage it", which is exactly what we are looking for.

Apart from that, if we decide to use sync_state, I'm not sure we could
handle granularity. sync_state is a per-device mechanism, not per-clock,
and clk-raspberrypi provides multiple clocks (consumed by different
drivers). With CLK_IGNORE_UNUSED, the protection is per-clock: once a
driver calls clk_prepare_enable/unprepare() it manages that clock,
regardless of what other consumers of other clocks are doing.

Best regards,
- Maíra

> 
> Maxime

