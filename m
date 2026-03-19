Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90738B145
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897652; cv=none; b=V9JQvm4yYILAP5nzZENVjflffWulP7LbxV/zCMx5YtCQ5kVVbB7wnY/LFHb921vZPk5KkY0KNIiH4eNP7aPspeI6oYc39ywdpBUYa0Wo2VNk5bXw6olN7JjIQfJdo/a6KMu3AP2DHfMuiMiaesq87SOlY2V1uYu9zKyaOZ6R3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897652; c=relaxed/simple;
	bh=l9Ghg1lKC5KBtvHd3ReD9qqDmQaFSG1U2lkL8FMJZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT5+kTzI4hVNAHzm10EXsvVpnOsaUSpY5ASO16IcEFztE5ImrtLw4kHDaOdOWAvZjm1AyA7HWBbT7qijp2kKAMPtTIFwb3pSZE0iF8cdvL9IMjdMrDigfhxkJNjPn0EdXGZCVLzCdjg8LbQWVsZJ8/STxNSB5bmkDJcG0P5vylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FoR3pa8B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FoR3pa8B"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48541edecf9so6028035e9.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 22:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773897649; x=1774502449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6m4wPVx0RUZL7feW+5IYMoR5otTJB2gZZIBBvDsNZf4=;
        b=FoR3pa8BV5AqYg+CYAPMa1VT+Vr14Q/341j0BuxyLyo4O3i8TwMhMLOVryYH6MUVrn
         N8nI44dCiCYjP2FttSMtOGRiwV597ZGGBmngqtR/B6QyDvCyemdEEKytZInDmhD9neSo
         h9ZtN+3ZCCg3bRkkwH+EyR8Planw1PjKk8W+1iSFfxa/CzLnwG5wsQGEuIYJl4NI+QmL
         drjodO5dqbcYJ1td8shKwZlyKYA6Kj9Kvv4kiybI4mBJ7OzRz5R6g7Ri+1rykc5DNMRL
         yahpw/dkYyyeUDswo7Pw2x8TRGaEao+94RoU7EWVo0qQrjd/yCYVtf7Pk2IQaHqRZYet
         JRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897649; x=1774502449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m4wPVx0RUZL7feW+5IYMoR5otTJB2gZZIBBvDsNZf4=;
        b=CF4OxQxTSEX0f0Blps20dkxsRL04uAp1XGQwpMfDC+yY5MRrxA7iYJJ2tUrsaci2D9
         7efTmeD05WpjJCFDnn2NgIRZsm5D1Q8nEtLwTAQJkpUg3wZ0favgpQ3mqo/1RCWPhbp8
         kzL6PG+4kMqYqLpxVYkasTXkR3gFzN5p5zZjuA1CliaHd3oiwh/yVgR9dCz/IZ316XGX
         DJOr7CEVExlZIQ7uEQYh2iwcCj2Gk9O2LJtBWm9wdhm7JmgrcGUNkfw0O7mYT6mWZvay
         8PMwdpRLe3Fh7SQ6oR8ZBffMfvk4jD7Lhsz2CTslmcv7OoK3oMC3gYbZrbAiO+1L0iAk
         9AEg==
X-Forwarded-Encrypted: i=1; AJvYcCX0y7Rya03UfmKevIMzTKYX+aDRbx0RR/wAj54mvCjTh+mDWp8gEQs0koco1Vm7FAiWiGgJuIL2iaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxywjw4A6dupvXu1Gof8MNJMEa7Aog7EQGwYmc+dM+cWfI133R5
	HzxyMb51HRZ+hhu2sVMIHSsxBoPnPzN/QasdoIx8L5I3/zCDUfamD+ZWj9SeFBdWlZ8=
X-Gm-Gg: ATEYQzzCu3cdKlN7C91zA/XqSRaHv/RDOF+XJmykyHeHPFCv4r+DWci5I7p0aPoi68J
	zxlP7u79auutSSwJfd1NBRmEzuEkH81soc+cl5YbbVWS5L5R9RdgI8nHcpnCVNX8CHU95ZpbSxc
	HloXhiZYlKMADwYPbJFXcjnfohHZzcph02cnEIpZCmKKPm/etwpvoJloFsMstY3zg0Of8kgpwv9
	BZux1EtKUH6sv5VRACORzuZY/Ve4re2AutSXWmrUrm9jwlJ7PF3L0v4Dp7IIyF7XWZU9NrKYw+B
	eFi5L6kCcfOjZrRBYJahTN//Zd7kZcP19SSiNdHaDyqQD7hu4fzQ2Me5PmU+f6wVb1MmVI10SSP
	cQyg167AwQF4Le+5DLjLVHEF+TxmmewbMwbgj1BQ3ZFEK7Ao0SkiFDT7oBExtK+sKcNadNEWxH8
	5gUfDD3cM0gXErU1d+cdg08hVJW4yQgg==
X-Received: by 2002:a05:600c:c163:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-486f441bbfcmr105559845e9.4.1773897648298;
        Wed, 18 Mar 2026 22:20:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4a74sm39975085e9.12.2026.03.18.22.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:20:47 -0700 (PDT)
Message-ID: <6270d271-066e-47d4-8e2f-eda119b69fbe@tuxon.dev>
Date: Thu, 19 Mar 2026 07:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/26 13:15, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add clocks and reset entries for the PCIe controller.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
