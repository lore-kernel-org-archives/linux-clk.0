Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1533288511
	for <linux-clk@vger.kernel.org>; Fri,  6 Jun 2025 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211798; cv=none; b=psnmgpMRlPrAW+bXfNNV/a96GUd+FWpGiW5rRnVewE3ifRbPvUKNNG3aWNZ+V6rkDAK2WhfI0EhbxpDtklEuVnQLatI2ALfzE0ENGOXRtnqJ4aPhhTkmTGzIf68C8yHq9qKqc+S9AxVHdsZ/mobeXjmBerI0m9c8hhzSMTRjkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211798; c=relaxed/simple;
	bh=k+TPf9LxMZ0D5A0zH/EF697ym/GMgEs15jvE9cO/4F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zo9K3JPFZ1UcWHESSuZIIaX3lPV42JJL8B0M/reM9GPPta4Y2cRsbwr8T/vSIXaF+n3lMgVO6vc2QDAmVgCxaT9pRST5dRyNsrGj0xoUTmB63mKM67s0argkUmj6kxlfFGVPwDxryG9hKuTlwgOeXNou8Z5CUNQTT/BW3iYkwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fXgWHc8+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fXgWHc8+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso3417842a12.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Jun 2025 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749211795; x=1749816595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oseNslf9Y7EQEruK9NPY2cEIOzo1yyAZtDjzotnVGTM=;
        b=fXgWHc8+1wjmCVEr43bROJp3VVoPkVEEioQt8mDviPwrsFnparjji0o012NKtjnulf
         /Raxf3BlN74VEXb5wiPxxqxx+gtMXlFxbfAZZrEQ67AsFMBLLHMGZKlQWtDCMRjBV8E4
         T3dcPEA3qlRuCoDdbY9x68HCzTpqirc0De+dF0Js6Vio8Tqtz6awJpA5mhzjWaoflRO8
         p9DDJmPumaIx4+jTbpLIph7in8F4dRg1RB4+K4REk8TiP6e4yUbKuPQvWDjqyfrn5ttc
         +iTufdlnISscSXOUU2vjxZiEf/n3Bj6gVBPWF9rLYuJ0HWNg5y2JLsoNyE46Z2D5Ofo0
         liVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211795; x=1749816595;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oseNslf9Y7EQEruK9NPY2cEIOzo1yyAZtDjzotnVGTM=;
        b=EYhB1dvc0b3iTskH00GqGqkjwhhM3tDNSmYJr8g6MiXL7xjMmhrZwXyDws1tleE/dr
         t01LsMjyoli1ijGKk0WJWapPa9WbfSdetpD0bAe4Aoqb0vd1bIyLfh0kGCQMThTCaT+V
         q9N5F0HdP0I/ULe94eo5EQl3VgauYPvkLhcHeznQ8aVyFkLQ5+UJ4SdHVUaDRmnt+pfz
         yD1oz4srWKq5QRJV6W1jDBM344wsqCsxwmgF+HEZIU4gLXnAIqjj3CVIdg53SWoDUiCv
         YhXHHLc/DkBbTVuIG2yUK814R548GnCA9JxhHXKN73VY3guZyT6uV7aYLQ490SyrfFsU
         GoXg==
X-Forwarded-Encrypted: i=1; AJvYcCXhEj9q79PjfsJxkspUY8sF8M/20uvOD1q86z33rjSh1U2WfFxzfLR5KpMcIEcgCtJXKPQ3/mHIL6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSuxDUP7TwILQPX+i2ujuPEC3lfq4cSwuXRVBY3/WMs/ctpi/F
	l1w/gAc4u+cnc9x0xfzuyVeaO/xc3kEVls2H89mugGAi2pXPDvrgAjvUy1sNy3E9WGM=
X-Gm-Gg: ASbGncv0kBtE6POxUW3iGZsv5Rb6xFEB6eIfpjq9DMG3dn+Teovuw9V6/+OYiIdALUQ
	Lf8nEjLxC35TZedPCF7muJ8Um8Fcxd+KmNQqRrJ/fCXfb+TRI9rPr9lRcDo9JYj4Lr71MGG2V9B
	g3XmtblZZvz4RJT6YlLnDLmCgFuH+kSdEoRXZk/iFPxsfhwQ42NyKmqLdpY62yO2NONZJEGSNU1
	W/9KuGzX9EQz6uWdWOCHNg4KBxco+S6buKUS7/gSlpdvoKA84MUBpMHPnyZr04ssMIYgVqWFvWr
	qi0rO27odUIAhE/1r/juHmSnGPudeUih3n3BJD/nrNVvJuN638LW/kp1QXn4
X-Google-Smtp-Source: AGHT+IH3hNQ3m3x7yWyp9YoT5yQkAmNl6auoawMQKJM7FHzSoZ5r/4GUCilFu5xy1KEAYBRQ/sKeUw==
X-Received: by 2002:a17:906:4fca:b0:ad8:9a3b:b274 with SMTP id a640c23a62f3a-ade1aaff72bmr278171366b.52.1749211794857;
        Fri, 06 Jun 2025 05:09:54 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3837asm106811566b.126.2025.06.06.05.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:09:54 -0700 (PDT)
Message-ID: <9f4312cd-3d1d-44e8-9915-994dc712183b@tuxon.dev>
Date: Fri, 6 Jun 2025 15:09:53 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: renesas: rzg2l: Rename mstp_clock to mod_clock
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <53b3a730a784650762cdb27fdbde7a45b0c20db8.1749119264.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <53b3a730a784650762cdb27fdbde7a45b0c20db8.1749119264.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.06.2025 13:28, Geert Uytterhoeven wrote:
> The mstp_clock structure really represents a module clock (cfr. the
> various rzg2l_mod_clock_*() functions and the to_mod_clock() helper),
> and is not directly related to the "Module stop state".
> Rename it to "mod_clock", and replace "mstp_clock" by "mod_clock".
> to avoid confusion with the mstop registers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

