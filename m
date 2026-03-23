Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769473ACF03
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273950; cv=none; b=kczIn/UZ4Xe4x3ZgiLU1Oz47ea53v7jqhTL84uREmhLpAh4oY5pGihHoOWm1rW/qsXyn1Q8/B4SGjedaa4nfDESTMW/GihFsgNmDgRp4yzINniXCstJ2eXK1awZwx70HdPYjFEnLe67lnrk58f13SUklkU9j80Jp8bsdxZhITLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273950; c=relaxed/simple;
	bh=V9zYOFpxU8rawRpfv/BFGFNrqy6ZmN0G2ccZ7JYxBHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6uaspq+j1ErDhPihxk3T29GdVZTvM9gIdqYq4uali2MvZtFvP8hoKt4OC4RzIvpcK18RLjTvL2HpFtblz/C+3ciIjXmmVhLGfkYSYu3HxfS+H6QGFbrR5QDimnd5gM1+z0t8S7trgFNsOeE9/KHUSXjiaNhds0YqhsN6dxjTws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCE42txG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCE42txG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so23922665e9.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273948; x=1774878748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQnsLjDmafPYI4Y+8OWgwJoOxkQ/JQ7/o5WC1Fd1bcM=;
        b=SCE42txGUf1VEYKGd6A39Ut65Ow0vpxtZ4qkFq1ttwY8SAuh4RxTH5ug/ZZvL46RB+
         h3teegLKHjMAEqaUF2zAqGP09S9oHLqkM02aiOcIU+1MGM/ajH+UOq77w1b8x2DtjL8F
         ByrWVXvFZ3BEQMQnJvnsubi2+aDgYXVcMge1cjBZHfJfBGUBYW1rKUEqSEZ2jCSHDFAa
         9hZfAEub8cOI1Xyq9zu8bpKtYxna2YTLtsWddXYnQYOVq5DGTbNzwvKKoynieLHqZwgy
         0j86kijU34TdbxFIHE1a32v759d+qepH2X348B9vr1fkHRUluKjCg51VCt/uZiQngCVD
         ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273948; x=1774878748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQnsLjDmafPYI4Y+8OWgwJoOxkQ/JQ7/o5WC1Fd1bcM=;
        b=IP9jWm5MJ1jtd5rJ6qp6xZ7LP1/vM0ZPCA0HnAkAndeZSay7JwKsnDDPe5gOy0O9Yd
         z4lI6dvx7iiykJccfANVKtETtk4lH7pj+UQ6aVSqC8FB6KWrjYG8CZR64Qv0sI8V5xJY
         pBGineVHQwfL5OYMfg8MXiM5243K0bxrsyNtNmCuOA1NTNYtk3kdQWYUsljsQT7GlR9v
         VqqFrzyH/GMj04lx4qX3vjnkDWKn+9Q+B8ihIK4idvSDC4s6KvkASggb8xM24jz1w7/Y
         IkxssLjYwoY8clp8jTHDmmAnRSCTyepgrjOg4ftxc/Krz/P1ylzeRnDPgFGpA/jYXv98
         x7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLcOt1E+Lp0hRqKc0NPh74ge0acv+9AwUkA2ha7zyBina6MlkInpYsxkWm54GyLJME6TWvopR597o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcIKb+ZefGVT8M5AZ+Rf4WN//8B+cuECPYAMxHYsEVdq08jxe1
	BhMXEEbKMS5VWkCS1iyP4x/GWhu0qcppx7gqSQmdc4C94gRcHkRmUJBa5ZVQQDipPXo=
X-Gm-Gg: ATEYQzyBhre3pQ5FMjPpxzOqjKCYUgBDFxZy3hGalFEsbj39vsdFEjM5S0ihVLn/JDo
	fU6IskHh4tLybGCWm3bl/uwvrcU1939zmbQnQdo65HGBhJe/TjytdLxzU1bl4dO7I3O0i4lO/Cn
	mFa7DpBaY2jj2Y14NCvf8QmhwKGewPTmh25MaatKxezysJwYLD7c1mifnPAYgQjZzR8vDncvKmg
	aNyn3+ycpQ5rEwXVmbJBOrvpfR8ky1WyLHlQuq2RuqKzlGk+lRyTpPq47hh5ofPePrqRYfSv6j/
	wKJVN7IcPdekv9L99Zm3t4alwmseaQyq6i38BIszEdK0JH1P7IP6kA+sUkQ0AJzNcMTjcjoqTv9
	ZTp7ei9T2kYD5ZlN6DiHhTS7J1R8LJgjUgjlQjROh4AzcZlo1/fbvFRvuPLxStA6EuRsc8rNE64
	tUaNerb0DLtYShM6qlgOWlIJXJplH/H6u1hn2H6haRBQ==
X-Received: by 2002:a05:600c:3d97:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-486febb5989mr171871435e9.4.1774273947572;
        Mon, 23 Mar 2026 06:52:27 -0700 (PDT)
Received: from [10.40.217.234] ([31.171.155.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7dc4a2sm318980305e9.5.2026.03.23.06.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:52:26 -0700 (PDT)
Message-ID: <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
Date: Mon, 23 Mar 2026 14:52:21 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260319-yearly-wrongful-883f7fd86a69@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.03.2026 17:50, Conor Dooley wrote:

>> I described a use case in my cover letter (PATCH 0). Perhaps our approach to
>> tackle the issue is not correct in the first place. The term "virtual clock
>> controller guard" is something we named it, but it's literally just a clock
>> provider which combines several other clocks and input GPIO signals in order
>> for the consumers to check whether they are allowed to probe already or have
>> to wait until the input clocks are enabled.
> 
> Can you explain how this is different to gpio-gate-clock? AFAICT, you're
> trying to support clocks that are enabled by a gpio, and that's what it
> is for.
> 
It partially covers the similar use case, but differs in the sense that 
gpio-gate-clock controls the clock via GPIO (enable/disable), the 
clock-controller-guard gets the GPIO status signals whether the clock 
_was_ enabled externally because a CPU has no direct access to the 
clock. So perhaps the terminology I came up with is not so 
self-explanatory, that's why I posted it for review and other opinions.
