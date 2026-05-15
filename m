Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D433B8D48
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832447; cv=none; b=U7CIxvpeY8deBOWuFf0IdNyqwncJXbekevexbgcd1zwWwxmc1VU3+lQc2IQzsgYsi6oe6blSDlP4Jpi72BdI4JUN1y5Bn/scIDKGYhIBieOK4N/sHh0iaU/H/qKRjomSAsBHojbqHjv3jzqCgiVrnowmnPtox1A+ZCi30xIDBno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832447; c=relaxed/simple;
	bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqS8EjpTrYhn3prSoV78LnuO+08SOQPu5bCJ4l6Dmjvo5C8m6k9M04jkBJLhaiVPzwoiQT3wBCAc6ofTTQNcSmOJ78j2jL9zSgz2KMQU3EPMD7Y1DQCnob/sOzvGYRDSnFletLJZvAGXxTEFsSbGU6WAKbRp5L60nHnB1GEAfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gyufspwc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gyufspwc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so420186f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778832445; x=1779437245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=GyufspwcjQNRqQnWS5peKqpJq9HY2hgMsYqr+16b+YUYEhBJI773Tf52WJoLzKBdmo
         jS190mLk61q5433HhZlKQSdgvoHjG4pa8oLAGwbkuTDvMTnoGqrgM9EeWH7MFGWt8iGx
         5XKJk0WnCDVK/32mdjx43Up1QD/WFiJzi7TDMPTj2ZNIzyD7CTzQXu7QD1Fb7U/uV39N
         ZA4vQ3JLmOMCrkiqYzVa5F60coZ+UVLBBZfDi9aoLbdHyexYUoHLRXWUR5gfXvCdPqy+
         EXAaqsttEKtKrlx6QZPxH1+NekIUrQISM0W+XTtew7QbG5bY4QZC0oeAl14/WhFkmnDi
         Qt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832445; x=1779437245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=obfL4knCuY28UkJS4RaXiAVjV1RRJXWoZ63szckr6VrMkXFiMgkX24EUJJ5pUUoLCC
         lsZTqS97AYRzg2bJoTjo0CJt55QK61IXzmWlMgD9yuOEtjFPtL0afg6ITUSoJ9dD2fjF
         SfdPdGM2ljK4xoEZEoDUGeXT3D5HNCG2pjH9Rlx2xMgupufjucHOpRY3QYDScPQ+TXqY
         +gvk7mIhvU+djMKTYB2jxeoKaIXpWR5Xt/iUbhN6lfEWSGo2eDoZjWfYZKCmp7sM19zr
         DL70P5yrJbQf1YAMsfj4qWv3ajtXEY8cMIhyGBmADOwga77BZWZQ2JeMVHnIs+vo/ImG
         FwOg==
X-Forwarded-Encrypted: i=1; AFNElJ/zTBNCJPLj0uucgu0eIHu0WxU6v2A0TZafWZgDEoQyU+ypPFWGHwYPbr6hxkCqLnMdf7yPbUcRYmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAo9Fd69KjrYjWLz/ZB4kmrYR+51hxN/6Y5xLroFkCeE5BeAI8
	KNgRrUzu5E8Z8bGmHvvhN+0+tKihWAdq+SgR+sDvZfLyHgQT9FYhdEHq9aWFXZywAn4=
X-Gm-Gg: Acq92OEgSeOThN+eHi19OuY4iS5htlv9616T4pBMjAubsdWvejHdDEMz10evjpGp8ow
	HVq4aK3rvMollq6SfgdSn786QIBX4PD5U2CZN/Ga3cA4Rz2HLwvGOnXTcnlht2OoI0mINUOBPNB
	jB8fzpccRHeuBunV4XsuV4ym71BQHBm4q7SCpnsXhlUgqJZMi1sYcOwaKWf4uE/hLiQXuTOuxE9
	D3KBaqIPow71GPn8v60gIbPSi50lrfkkB2QGls6tkyX6sCwBzDe1MWTKuHZLeFGQTzy7KHaLsCe
	5uj7D08wZwNjSJOb9sMTN8FV++8BnN8S+y+9tvBi1whvPOPULlrHrJ5Q5vbq0wvi6+q1PztBE9S
	7YBjGSoOwElHUvlFv+Erb4T/2e4iuOg2vQyvmdlV984CLIyDu1dTkZ3KX1BFt2PEmhNXiaaoHkc
	sW3t/93tAE3PHTTsGK6BpBBfvmQck6XneaIWPmlKXMDLs=
X-Received: by 2002:a05:600c:5010:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48fe5388407mr35383865e9.12.1778832444691;
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm15226925e9.4.2026.05.15.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Message-ID: <cf52c805-a08d-4184-8520-4aa126360b6c@linaro.org>
Date: Fri, 15 May 2026 11:07:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm going to resend this as it seems sashiko couldn't apply it:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

Cheers,
ta

