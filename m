Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867019CD0A
	for <linux-clk@vger.kernel.org>; Sat, 19 Sep 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828849; cv=none; b=EiZriHOXaHPt9vjvFYCWy8FSW7U9nCALSdLLYMvq9S6EuALkTN0/kt91KgHDNydzLQN1t9JeOtUkvo5w/qh6w0syZEz1w+IrvzL4/IGSk71YcSwcj/gI7ml2C6UC0VMC5sWrgfJf2azM8g6DSc89fAu93uQJvj4ZVVgyhabwwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828849; c=relaxed/simple;
	bh=4HF+6nYuBX2Y2b3IHAHrrAE8fZQwBLN3OIJieXuHQT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sw58swCumfRVJhAw40xhAxU6KWEKzC96zCsG5Z1tI0pTpA/fdB8KFnp/mI/tpho/BrwgRfeO+Ja2ipeSFG0xz1wjQ090ZpZcgQZQO4pglKlwEHx+DxnLO7x1t0ENvrVCzzZx/fRXX+Votn0zgSJlU23VN2/i5iRAeMX37qVzpiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H80uXjTH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H80uXjTH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so9193895e9.3
        for <linux-clk@vger.kernel.org>; Sat, 19 Sep 2026 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789828846; x=1790433646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwmdQqglUsHFWpk5iMe/ySqB2I3J+4h1U7l6JuJEn8M=;
        b=H80uXjTHNEFu/JlWtMzboPwkVXFSs42KkmRPiN4V+elIMYDwUFsQiH+I9vwaYS2jdB
         ofnJ563zDwtsgr9RTwS5cCOUEWJnKgR5D/WNb/t6PNpEJ99mW40G9YjmTb8k5OxHt+TP
         CbKMt4kGGotdQMQnws0HlYMQG2eTWV7mMhm0TprRi1le37KKa2Bk+M4FQwqIqVgOL0RO
         AZmycFNZaSmQntV2lUd6UPEonAicIHGfz0Ig5+yzRXYAO6VTpd66/OjnuzIWGWYbov97
         pfNj763ZtlD93uOo5X3jfYwasn3JsTXeR8+YdnTZ3gwwQJERBDNhRSbk6/M3ndgpAYQK
         ptEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828846; x=1790433646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwmdQqglUsHFWpk5iMe/ySqB2I3J+4h1U7l6JuJEn8M=;
        b=FbRpS9hxtRM/ZUL+CcwOQMV274MYDODIS7uU/Vwl29GQpbiJsriNBwaAxmlvSM3aoE
         n0/oILdQR+hLI+uyZR9mcT3Vnja04pz98dGpoDETlr3+oQNujLrM9S88Vp0JG0ltAs8b
         5c+eucV4+m9nohC4Wa6Xh/MoJeOyK3PHEaVr3U3N+MJBiaR6YkFmC1K6u0AqK8+/379W
         Yk6HI1lmmM/iSmSIZCFGCWXJTMHro6VY2d8+C/ANXMwtpzocGI5ajvofeJMnD6AS0LPr
         aC5zCFIHkPVvFGpm9msrukOubmF6zsKg9kosX9k7xNNVLWIaMkz/dJrPwKGR4Yatdhds
         GkYA==
X-Forwarded-Encrypted: i=1; AKwUvBx7Q1do64SHvNgl4F9Y7szbkqq1y+WF8DfkHkHP/GmGnSx+j7e/3LHzsIjSSBI9V/ddw9DSwGW6FMw=@vger.kernel.org
X-Gm-Message-State: AFuF++mCDP6Urc8oUzkR13a3fYNj1+kc5ot1/kyV8/jE9VJjpLzho6j+
	kbyS70kJt1p0CNTghCDKmFTn8XlQ8Ch3crrhaJhM6qHUPuFmjVCfmIDqVpRbLMpxl9M=
X-Gm-Gg: AYBFou1DqW0UybXfcBSk7BYZQhK4Xn6ldYGG99tAPODpt/tsHL6qogretS+LikmrI8B
	UDyEQw34R2zX3IUz5cIrBu6OGEPvQduM+AnRQgxLzuVENi5Bszjpzfx2I1byIrgJ4nOwLtUGHmX
	z8BhBUMmAPikeyWhfF7O7G+cJ/FZqJLjX+S/vYvmQ6HqiPSE2ucE3DI5Km5wHRd8+tBuOsLF9Ip
	3QVBxmfONsknLO7NGC6SxtDaa/BjTypOj4T5HUNjj2XZ9Kbp/K7n7/QBzhZEil6HVM6cLPYLPCr
	iRNNCHs28dq+BmGYSBrFBscBfgCxY1Wp8OkFtNb1sAZYZMIDma4hRwSiPbQi9kP8S7ZI1Fcf3I0
	kJ5nS0DTThA3M6q0DjVvtry8gsaND3J0ijy211Zlvc4LkWw4qHcMSYE1c6ZPy30XI0LH7sCL0OR
	D9O8beJzMUSC1U8bCuL2lOVQ3uJFiltaKqr/2Uj+WyGEcnqncljGbYLEf9fvQVoYmB4WBlh8o6d
	AyJqmEFL5zkIUmsY8mWt1D5rxt092l7qDpHbK1eOpwP0BmIqAvPRmA=
X-Received: by 2002:a05:600c:4ecb:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49fc5754e06mr75514935e9.26.1789828845928;
        Sat, 19 Sep 2026 07:40:45 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm67531315e9.4.2026.09.19.07.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:40:44 -0700 (PDT)
Message-ID: <be98fdf7-17d2-4b41-ba9f-df4c8bc276c6@tuxon.dev>
Date: Sat, 19 Sep 2026 17:40:42 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/26 15:44, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
