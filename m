Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267D62D131A
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769856788; cv=none; b=NnGMNRE7/v9XDZ1c7lkTzPnUv8B4vNzy2oM51yVmrxTm5b4aaqaIuiZ0fUbqgWZVnSb+bCGLbz2nl8KhXXfrbj2lFHD1f4jrBjkL6d4sK88lpfpFG3NF3/hXL58w/4VychHMMtCadMaTCyPch3KWbVZLeJ+rwD1zcJzqwK75KH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769856788; c=relaxed/simple;
	bh=MJ79I7oLnEvG8ektQPkdDHSUXZmgf75hmrzRg4wQ5tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQxgKcQeY8MwFD//elqD2pkdmHMTAEw2LkGz1/mOtiLAF60zfE1HvQak/nn7sZdiXyELALUcJUN5usM5HSIRpbujHFI1MaXRvUWWDJMPY7W/k80C66k5tFslVyxsA3RBXhy7vjSkhiawhEEeXbLIapY2S2RK6x24BUcKyWgKYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L6+Ifhey; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L6+Ifhey"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806bf39419so24194415e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856785; x=1770461585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvqefg16Rmvo4J9ek0jHyCbWNlZ8G7S12EAE3iMNgmA=;
        b=L6+Ifhey9CHMgAG38NkvNTlczkF1KYOO82McQZR+McInwmHus2hTSXGXv1b2HqQwGx
         lnTotyJMBxiIg0NML5BN1LgBKwFHOlhWxC1TU0WPvSUwLWNm5Abpc+XYxxnJ10CZXXDO
         W9l/XXWKoxSiG+JvPiCk7jpLeugSGpIBWHlOKpFSwDbjKAyZy4l3ro1UxJRagZIz3Hzi
         A4vgxIGErg0jUpGactkz9BD28q2jb08OjZjL42Y2hlBXAwnd44dqHnmWigTkRzGOycLx
         M3qw1eAV2BsHZNmevzNjpa+cLIuoRKt06UzPIp6aVdJ+3wg8NwNNehVawziHKkgM90DR
         +ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856785; x=1770461585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvqefg16Rmvo4J9ek0jHyCbWNlZ8G7S12EAE3iMNgmA=;
        b=e8+iZCNbVisFxxRLeIs/XEXcOsvywYfrGowTF5tH/DpQpK/rKxec6yP80ba/pFbVkf
         rq5xUsiQBsT8bXpME0aG1CyitKXrJADQnASNdfRAKRGjaMA+cNADSzisHg2yBzN28h4Z
         eYfCyka1tiAgNyzcfqItxn2iK5Xsr6pZ3Gct2LQjdxZUF998Rw3KgAVzLbTT2AI6/5pL
         eCvA6ZmWSoyWgoKWUNs59fLATLNxN6gvgLc98cJPK3sAh7jo40F9frq3hZE13k8P6Y6u
         46TNLNWX0gIIqi8oASsyOlONoeSItgaa3HDc3IhPBDuqQFXk4Vgvre+1oiUKp4WF9lEV
         0i2w==
X-Forwarded-Encrypted: i=1; AJvYcCW9CSzItq01sECfbKFXSbDwXmoPyY/yQqWV62Y9R2pvqAtOZbDtbDXDn/KPDDnjGpf1yzdzLubipdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQwTluPDnar2L0KeXQLPJTAMWVi1Hs8jMNGAo2lcfSu/xlpSX
	ce/rKO0QadduA+4x4bpxqYkCMzuAx0TkeznzO9LfN6J0pQMvCOB4soZscWafVUaBFORd0X3CGtU
	IfA0Z
X-Gm-Gg: AZuq6aIZ8NO0196fi9i/ivOGCcciQdvnPqNQfMXHTCgZag46NCqrh3NiSKG5rLAv9xS
	RyyCnbZ9dl9hvGizgjptjkOebplL5PYN2NarqAd9RiPdAepSjbj9nBEO6rKGoY1w0NHsP4HiclF
	3VRoB7HrfKMMB8nxYfyPHujGYycFuOqdmTMcPET5USX3sm6FIlpRoea5GHjj2SKmGD6/fX/0T05
	PdqxdDYkaL0fWJwCCL8U1lKOUnNjedBdAQfofj8jY3siCrXqY15p1pnhYFUS9ji+FGKjLTnX/6x
	5afEby1SKQ33+23T4NWmj6+6k5wABinRCPQZcf9z6lPcjRmaEoDfD8xNxIiq5BuIwfquAXe5tib
	zKt28G23ivHFWOcjzSREXNw9bi0bP+LK1WPSQnwgyuUuHVhc3LWpdYvaXtlyb0muqcGIfanSWDQ
	NMopOOZShjFoiKbqWf6lbJIMAc
X-Received: by 2002:a05:600c:3e07:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-482db25935fmr74451525e9.1.1769856785312;
        Sat, 31 Jan 2026 02:53:05 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm482329495e9.5.2026.01.31.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:53:04 -0800 (PST)
Message-ID: <a0da0295-f397-4f5f-929e-c95803aa5e5f@tuxon.dev>
Date: Sat, 31 Jan 2026 12:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/31] clk: at91: clk-h32mx: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <9f6f22bfd5ca47e4d1608282d13eb80a9c01865a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9f6f22bfd5ca47e4d1608282d13eb80a9c01865a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in h32mx clock driver.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-h32mx were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
