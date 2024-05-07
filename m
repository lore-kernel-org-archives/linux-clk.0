Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE208150991
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075345; cv=none; b=YbCSKmd7EsruJlkObzQNydtKblRMHcUN5H0Mfkwfetdpzpv/e62HAwtukBqJxFhNp7oP5h8+QJqJfkawF/Qe2gCNVVUW2K2qs9dljYZXwZq17nsA+lwx5fpHb4HS4pgSb/zst97I408tlDIOAWDQbqKLwF5ZhYhBMqmU6iOV2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075345; c=relaxed/simple;
	bh=lxtT+tCI4jL059QQESghZnrZukScDPtHohLDdzuOYBk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NeVA0Q0QGRP3vGWyp31fHgDAImUk+ffZntG/1x4rctotg4br9rKpMiJ31mYkicjqaGAOYWXsRpE1vBqQU+4ur6PJ0a17iTRoLhSwIifOQXIOP+9jx/czCnpOIF1Duko1+wpic0kDSCk/LdAJEiWgyA8vO9Nr98owfSnKXy7In+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFaB42SJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFaB42SJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59ece5e18bso124644966b.2
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715075342; x=1715680142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Bgg3zxtJYPnqt4NHW+d4WaRnGJUInrGr8+3LGqkJRo=;
        b=SFaB42SJ4ZJqe83LnbntsQDR92mPyFHmciMGVa5r7emtZGLiBkt4Ije/ejct4OhpTm
         e5eq0ngoPxw5nBvIsKnF7RwbgFF2Gdq0eWe+/OcvPtugrXCdLPLfn1hvcsGbSa1gOujw
         aNrGY2LtDi77eWs4aM+l//8mG1Oes6lSwtHFJjyYDSauGIkxZIyUZ5xMzUxXyBisii09
         AGODvaBHucq4vKeHgTwy7MLjFuqB7OXvbdfMSC0TrIOHd5vax9RGJZNHLbAu/o8oypOg
         lUXEpYbjs/Dhcb/4seX1rl35hiLHYEt5NxF+7GdLqa7AmPpKzQNWz2EfDs6ekIdLG/9R
         AWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715075342; x=1715680142;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Bgg3zxtJYPnqt4NHW+d4WaRnGJUInrGr8+3LGqkJRo=;
        b=WiJ5FUuYOWNhxvqzWFAZLWUL2M4BRpnjr1oIdR/F6YMm/K9tlMfsS6XtxlV6eiBffI
         B0cj+aj2mzuleE41y6hL+IQUkCJB9UB0tr4x2snP7HxCpfh+a8LGyrX1OZ31Vp9rUF2P
         qFONudAcZvHeJMEcs2ukmE89/8OLS3zzZPSELgzXnFkwHzSspChM/w9ScSi8GJx9ocp1
         wZAKYBvPyTy0Ysh1MR6cmSKFG0jTEh8/kUdZk0khHirNDSMGybyfaJV2p93v1of90AeP
         gcJSIsxA571vZ36bhzU0D5kLP4mdWNNYgYGFcwrULzAh2M0ifTf36z+TzSpSGdCBonuM
         DAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVygutSQtx8s5k78AYo9XQPLRbHn+1YNAF0I75I5YntHveARfu2y5+A7jbNBlDFIFntY66fRQCr6OhOQBC7o5janGOU9+XpMZme
X-Gm-Message-State: AOJu0YxW23XPrZO5ARYkU0GwRPphisFs9BCTYWFL9ZecxrH4wTa/UdNs
	avhkmd8Hd/Nwqh3EkGJipkprBmF72vRQoNkEOrVlrhGfsX8YiA/KtzFgDGCOgDQ=
X-Google-Smtp-Source: AGHT+IFmHeE3lcBLmnxClRQs4AEPEUnXv/IqNkBVg2rMNk4slmqta8jMmXGP+5KJreMBtiic3HfGHg==
X-Received: by 2002:a17:906:b7c2:b0:a58:7c50:84e4 with SMTP id fy2-20020a170906b7c200b00a587c5084e4mr11565763ejb.2.1715075342136;
        Tue, 07 May 2024 02:49:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id gh5-20020a170906e08500b00a59a9ffeea6sm3910824ejb.96.2024.05.07.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 02:49:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
References: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: drop unused HSI2 clock parent
 data
Message-Id: <171507534100.608425.10238086621749823821.b4-ty@linaro.org>
Date: Tue, 07 May 2024 11:49:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 07 May 2024 07:59:48 +0200, Krzysztof Kozlowski wrote:
> Drop static const arrays with HSI2 clocks parent data which are not
> referenced by any clock.  This might cause -Werror=unused-const-variable
> warnings.
> 
> 

Applied, thanks!

[1/1] clk: samsung: gs101: drop unused HSI2 clock parent data
      https://git.kernel.org/krzk/linux/c/7c18b0a5aa46cc7e5d3a7ef3f9f8e3aa91bb780f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

