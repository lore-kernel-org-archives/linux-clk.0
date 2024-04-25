Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E73BBE9
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 05:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714022152; cv=none; b=jyz5GoKLdqZF12THIOmIXa9bfbMUWCqPAJ4xrRtGJIV86RkFGhm7OFLBOOWIjU/YaEbR5iX6zEYQbcux916z/6tjBGirNxIoPpPLvt5QcdSTx3Ix7EQN9n6x8PHcqt6y3mYZAqUqyxjpbI7RcfMlqDmBTeHZqbsi0uWEFfiGCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714022152; c=relaxed/simple;
	bh=h5XgYL+kTu62b7hNDSxzPP6u9jz8fudtRkl5iQVY9nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNlMVikK6gvBkLOAHVvwU5wlpaWBRU1lvS4RJfmQwY8vyTNLJcYpDOVNSbJ7ShDbclvWzXO5Q2aVMe+5Dsggz7jtJN7Sw67dF+NW78FtN8cqWWx+kGAYP1CYai21ZtZ7X+AX3zigPEPct44j4yfFG2ic0OW5iJjxTDlCjM3DycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jQ/CnkKo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jQ/CnkKo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-346359c8785so471990f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1714022148; x=1714626948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPwnOdBG2SaRdsMEeoWl+ELs4tjgPnIwN6XzuY1l5ZU=;
        b=jQ/CnkKogU/6223BHUnfsE6y5Dj1QduTXK1092wE230r0y0xleJtHEXby7pNfyc4gz
         9a8HAVTxVIkO+OBeJ9x/QEnaaH2kU2LSsp8N702gj0wR8Tz0eG6onE2kFWduVBVnyYav
         l4ip829tduprmDyIwqGBaCUgqix1bgAVzA2JJmXvPQTMXbHVsoRhWOw5NChPVYAm+5yB
         gyauJsObV/LKPV5romDwDN+shDCJb8lQpHFhjgGtKepix0D1W+xFiRaP4/1VqPQO0oSn
         rD9DQXUMC5HitYG8PZAd4KTjR+VFlmvepnC0laXoHa9v7eQsy1KPqKSeivUa8wPGC46p
         Z3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714022148; x=1714626948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPwnOdBG2SaRdsMEeoWl+ELs4tjgPnIwN6XzuY1l5ZU=;
        b=O02zGFdxVRK7Ce8jBXC0Zg/zyfRSbtHiswaCTkUASizaHQXVAywvidBlHoTEH8pNNi
         cZml9QS/8SGPNGOqJn1AsFBc9bvigd/munlra9N5hO/SJ4Gh5XbrgGa940zAn2MVaDsr
         cheyn6nAJarqBUHqfulktUXLDqa/Kj67DUiI2eX8yEtYEJSrHGC4lbsRKFvzIjCNPIwE
         6ZhswerZYXVwDGIuSCCqeDiIfQK65n+hHOOkwYtSNED+GbyB0lP7v2gLo4Ps8uNGVBRD
         PgCojbsJIo3JqOEF4gjMFMblzTImrxYFOxUSQVfZCklpCp1oiSVYmTgpApJAHkguVFHu
         KhNA==
X-Forwarded-Encrypted: i=1; AJvYcCVIlh3S/MXHjib/tWzRxkBBUZ9+v30RuD/ycJ5cXwofXbpIbqKiQ4HtCQRtRmdlj/Ab/K/pN2L6uJba600+P7CXfkBsiE0/4Ia3
X-Gm-Message-State: AOJu0YzgwxJqXmQEtENQUaRhlNYV8X4txcoNt0iuj+jkL6ebqZKhQfiW
	ODxTVhpNF3HnVLxhCe6O02qhDIgVYUJKJ8UmIksfvurce3VKNf+I3GL9gFhWly8=
X-Google-Smtp-Source: AGHT+IEeV6TDjrdXaQGoM3HJdzhpudTgWaxacCa4OufB47081/eSEaxVevEOehF0nvVymHPv9aCEUQ==
X-Received: by 2002:adf:f8c4:0:b0:34a:9afe:76f with SMTP id f4-20020adff8c4000000b0034a9afe076fmr2890742wrq.30.1714022148470;
        Wed, 24 Apr 2024 22:15:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b00418f7605249sm23885375wmq.24.2024.04.24.22.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 22:15:48 -0700 (PDT)
Message-ID: <067774d2-ad37-46ff-b90b-7a240473dd67@tuxon.dev>
Date: Thu, 25 Apr 2024 08:15:45 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to
 the reset subsystem
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
 <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
 <20240424-glazing-handsaw-4c303fef4f7e@spud>
 <46c9baab4b3a834c27949b99668a9c30.sboyd@kernel.org>
 <20240424-gander-alibi-87f6e1896381@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240424-gander-alibi-87f6e1896381@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25.04.2024 00:16, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 02:09:44PM -0700, Stephen Boyd wrote:
> 
>> Am I supposed to pick this patch up?
> 
> Eh, you'll probably save Claudiu a single patch PR if you do, there's
> nothing in the clk-microchip queue at the moment & I wasn't going to ask
> him to pick it up until you or Philipp were happy with it, given you two
> were the ones that suggested the change.
> I say go for it, 

Sounds good for me.

Thank you,
Claudiu Beznea

> unless you want me to respin for dev_get_platdata().
> 
> Thanks,
> Conor.
