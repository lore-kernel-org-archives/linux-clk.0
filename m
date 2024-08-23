Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE313D8B2
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398977; cv=none; b=tE1eFRFZ3B9ijmFLEymSwV3kXNi5f3QfLCMRJHSVBmM14UWm8nY9f7oH+Ey8Wv3qLvWUsfsxecUjWVJazRxnwebGAVGAh/jxnE47cyKrEpB4wzmTuA6OcLTYo7WPJrHaQPC8ZdNe2TTWzkloXngdiWGBzpGZHDxegnImK+Xk+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398977; c=relaxed/simple;
	bh=++WkiVdL9Z2PtHWazg09gCpk+JB86tmXtiiJMLg3oqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GWKVG4gqv7NrcCrSJ7keHT2avY8Tra9wTCEpeSsS6fkmnaWLdeFjhK5gypunfSKMvyYTsaTPXSx4TXOALHwTnfv8heJBNB6OUPLyiNl78uicki/1sRo0t2TZokpJqNsGqEJjHvQ0pRZXXr3OIhOP40cMepnQjpubfZVUSI6vEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1a7fTeB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1a7fTeB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280772333eso3009655e9.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398974; x=1725003774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLWiFtCjSL78CQ3UPXlCQZPCZIJyhrFFQBp5jT+5NwY=;
        b=S1a7fTeBBwlwL9Nq33ZjxImrGZD1SYd/QLGShOrejpleWDdkc0pbION7fmGv26FK0a
         /2hbQF7PDhm5oxYP/+C8Tr95q9L88bEgfgZlyYULXBU1Kcy9MtN7ldH4/vmqpHU7wrsy
         7QaFwUo33oHAbM9nwA45w+cXbHGSO/wE5qAJmXG6lnHaVLdOG0BLG4grVcyI9xpl2huk
         eXAxZwlQy8cFCpcaolN6rva1aikIm9ylMjTuWx7iAIFSDJL6qXtPfRxxpwzxNEW25FS0
         e8oHi1lZgFoIZ6HZGMWjZjUrcaBIMICkfQV+WEZN5DW7LRnbBi4uQw3bdamoPp7sKIgL
         8REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398974; x=1725003774;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLWiFtCjSL78CQ3UPXlCQZPCZIJyhrFFQBp5jT+5NwY=;
        b=JrcfKrn6fmuIH+mUqgYujGI+3kfwQg9sxrheaBZJiQO8EYBDxCtfCPc0Z/2QCFKacX
         Zo4bjmkBlt/GWbwkE9YZjqWoanDsqRUk27awq6n8T87ObGt46jvUvhjdqgH10rAQcXO3
         y7Hl6mHA55lIlNzgfDZadM9GUZNtQMwThJIBt1fcjyhXieLs9obO/kwglDJAarZvTRU3
         OTr3Rckn0pvzgbXDKibt1KgQUtUCWXc4tlzJxmhNyZdGnW+IDYuy4pGKKxNnVXxvLG9S
         S15f8HdCOQ819aV5ZQvTAbfXS/2aivN6EkV/7BJk2MMRsPCveIn6+40LRbWfB46cZiMd
         KHXg==
X-Forwarded-Encrypted: i=1; AJvYcCXKLFhaWq4MQC37uasYbj64g/sjBumlH7vRjF08i3Rfv7QSiOoFnIuAunsDAnczurlZa8KOex+Rz10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhG+oq+k+1TugSeIgzNv4S6qowBWMuUcAguu7Am0HlsfDUPF8K
	PEqUHWher11z8FenqA21A8Sy9I7c+E7Ho1x/48JpyT2YnKUihpGlSh0+x9tXeyg=
X-Google-Smtp-Source: AGHT+IER5+q0SoK0e092RXOa02/lekajxpcF4iEz1XnizK8El6GyVz/LwKVf0lppoubRCW7lDmvqDQ==
X-Received: by 2002:a05:600c:46d4:b0:424:8b08:26aa with SMTP id 5b1f17b1804b1-42acca01063mr8754545e9.3.1724398973564;
        Fri, 23 Aug 2024 00:42:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-4-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p27c080a6d52524b222428931697390aad@epcas2p2.samsung.com>
 <20240821232652.1077701-4-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 3/4] clk: samsung: clk-pll: Add support for
 pll_531x
Message-Id: <172439897209.16898.1400754032970597946.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:51 +0900, Sunyeal Hong wrote:
> pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
> pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120 MHz)
> 
> PLL531x
> FOUT = (MDIV x FIN)/(PDIV x 2^SDIV) for integer PLL
> FOUT = (MDIV + F/2^32-F[31]) x FIN/(PDIV x 2^SDIV) for fractional PLL
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: clk-pll: Add support for pll_531x
      https://git.kernel.org/krzk/linux/c/9224e288f2e1f9161cf0c54122ac9168b6b68877

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

