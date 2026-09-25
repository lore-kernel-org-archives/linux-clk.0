Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19C4A0130
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342005; cv=none; b=ebHY1TyokGnI/DBas/IYVsCnj8bqqAivU8S6kad6Hn0ZGgLED9seV2Ehi+k3x5TjaO1XOINUtdEsH4xCPn9a5v75lgXU5F9Cu+qF0FdFzB97ThI0jKua0/IWCHFvOktKY7JOppCV8F3RoI1jDmGyno3lJ2bcUWZWABzXNa32fHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342005; c=relaxed/simple;
	bh=vclxjWw5pbNHxPmb6u3gWWTE705WGvUQLYcSKKFPpoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ude41znLA2zHiOwzE/i1dImw+JXqIVtExKGdPg6UjFpZHsBXOJPNpYEU2vE20SaW3pFliDruGHq1n1LMJYngFl9fbW2TFS7uPDhiuaZ0HzvMUP+KlOE0O8yoaWcUcjBrxQHklPlmZKP8NqV1P99mQvLcmxvMNp5rZtnoGSR/Mok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GnLyPyVk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GnLyPyVk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so3629185e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790341998; x=1790946798; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=GnLyPyVk10Us4MEw4c9C+59163Ve3w9N6+ye9hfy5luNgaJJsDC2R3tffCLl9kiAz9
         L/o9Jeks9zUwRea+kRpp4EME5pZJUJkuTrl6Y++aYnStu4dowOqLL2KnAqB6pAByR2Ig
         EyNE/8mSM7V1bfr4VxbWMwn+/NiXht9rBiKYHK0Q9lGpvBub12PFCfAJA/Y5HsM/+zqW
         URGbos/EFVS4q1ycy5+ca6Dbpx4w/2vVK3qbNDsEJTZCmvXaIgRxXxXtWmv2Bo3xeiwR
         d4564942M0GQkXUNro50Bpd+k+jlHq6WMpTqFt6CbVMNXjbgrIOs0OiJ3Kn33KbbgDfW
         BLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341998; x=1790946798;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=T+izC57oaHFLi3WUBYkJICmSjnqoVqxTLdBK8Ew692zD9mmRIqSm5FuGPflLosXG4j
         JwWF9BBftTU4lD9XmlskUd/HQ3PA+k0zl8Az8NxsJI1k7psoRAcgDZYDDz4pSrxE4V68
         YbIUHXfWHFGXI+Tl3Z0EgrNsWJOfhS0MJZm2Ikj9ijx7+irT1Lf5VsUt+d63PxrVfFOS
         A8N0jhE8P5gXX87sKMbzC8r9ojE/OTZovz5uV6LySAs5k5we9LaZ3sNAI+G8ycUyhF+p
         HJWa4ag/YVnH8Nh4YSm3jTvKVc9vT/7hwmoYZgEDG2xbktrA4Kp2iyjBDW7FC2vxom3z
         JOWw==
X-Gm-Message-State: AFuF++liFi0fcHZmfGNgB2JeUD7QV7+NE2OYW1G0Bv4/rZgxpE+KJ5bZ
	4pf/fQfNvB6NEq95wfoVyNZG6o+tVFCNQ9IF4UjEfyB3vCvMUsRsKSueefQwlwxtvnY=
X-Gm-Gg: AYBFou1F0ZxmefgBlJuE2oM97pGcR0RIwJuITM/+f3hF36wdFR8ccO+zwqnEeJ6HtVd
	Rb02/Ac/Pqb0pwCIrK8RXFxIopTm8M7LYRGPH4dWlEfrGoL0lABOnFRJdrYe1Krt/zxWxYtLjpN
	5SxJ13eTzr2kCT05ZnP0vY4lfDxSCceICmlNuZUNeqOi7qzR/EeB9C5arneFokpKdjf8p6gNh0A
	C3JF3RgQICfsaw4s88hhhdCt559PxIJkZQvx0G4CHJrj0hRsthxTBZeGmxm2pGT4SOksHbDKBs9
	AJ54RX31hSOdIfCnCfNeQDeWqhtqf8fMClo9Flop3cu54its/dzfVZbvhWnOM8DCf0r+m6WWbtZ
	+nq3ZTAGOSrtSG1itWPaGN0VQeyvPlewrtPrFILwBBN0pDwQ/nA6BR7OjsdVVz91fdYf5TCbRnd
	8/lutmpwbISZg8Hcym0SW3pau3V+53c4uwhhFHIP21sIKljO0rh2fmlVffaS7m/DUwuddvUGyeF
	+Vu+QakjwWcdd9FaQ==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr99559755e9.4.1790341998059;
        Fri, 25 Sep 2026 06:13:18 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm86924765e9.4.2026.09.25.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:13:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Fri, 25 Sep 2026 15:13:00 +0200
Message-ID: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 9/12/26 08:40, Ryan Brue wrote:
>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>> 
>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>> 
>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>> this one is untested.
>> 
>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Angelo,

Will you collect the MTK changes yourself and send us a PR or should
we collect the changes you've reviewed for this cycle ?

Cheers

>

-- 
Jerome
