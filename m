Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4C3081D2
	for <linux-clk@vger.kernel.org>; Tue,  9 Sep 2025 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403653; cv=none; b=HM0gBCLhT3psVxDEwladUmEIAi984BP+mLFel7+NzGl0sf19basABzT3WO9oMSAtQh94LDiLEv7RYBSRzW1C33GYWywkVayoWLMwXVXqr+UFATVepqlArNMWfSGGv3tDMiNtObE5FeC/EWUijOW3UUthsJ/NPzKkRTY2uyI76I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403653; c=relaxed/simple;
	bh=cBoE0qksd44jmAzGa8NcuMq1v1eD8n8YuzGHl6Kf5f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVvZ0/t0pZ73kJ0gCq2oM1aCpU2qqDxjq9gAJXIbs3/XhTqUVN2bms4fD+MVVrufP0CIYaeE+YsJ5f9tnFwSW/wNxYJSUdIRi+VuWMuL4FFqjP9k600+An1Ru76Urtxf7KuzHmDvXrFXGBBa8Vyr9JwieuqsFvqYaCtk4gCc55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/h3q8FM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/h3q8FM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso506792f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Sep 2025 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757403649; x=1758008449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzwBi6UkD6Y6rINc23ZMPuX7niVMsVUOzFLoZ7Re/3w=;
        b=D/h3q8FMDcyYecBYuU95BFwqxcaGg8PUC7lwpfOKSIRCGKAAfHedakVn5vRPMIEvoC
         VhX6/yVrmNtJ/vjeaYNBKl5N7Wd/NkmiD3j7PAB5hPOj9MY6hTTQIYH+m+jX+uPYym7D
         aez0PhpVXR1QfBipJ8JE0xtpNnWP/E2n7HS8nbxZxYU/HQ4G6OdJObDQKVYW/H+B6z5k
         qM3qrX+XwEXWgSVih/wNEShyAFOYxIvJUXcvkzwfdBtuPuGMGEVoUY0MVgzWvZLjoC6I
         /nAnfAVXcyDooY4nmq4GkQyOLBYSeQAWaFnywDMV1pbS/v2qGT5bslVnBP6t4CRlodpE
         wdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403649; x=1758008449;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzwBi6UkD6Y6rINc23ZMPuX7niVMsVUOzFLoZ7Re/3w=;
        b=Iv7wfFaQSq4PnDEZODMPHp3Qf6O5cenCi4QFYORjN/vhVEBn4Glg8cyR0kgE4rVCqH
         8rEL0rGpqKRj4oUzpFQ7S8Hld2bXHr6ds55zYrrKNcP1699unFKyeXdRLc1VPOoVsyDg
         WRuvcflLSOUzMdCEXZs3sJGpiFlwrMsmWEATev/PbOWEaRReYTLatU9WkzU3VpeHJtK6
         sxYn3C8a1vD/Fom/KcGzh1qN+xwyklMdSJYFyJ7sqHq5knr4QyAMhjppTed29QT/wAil
         sifB/hu5HDp5nWKkTiEMNLbdeUXFQRt4iPjiRcZXzvza9eC5tgVfc/D9UjAS6nV1mYhB
         uiDw==
X-Gm-Message-State: AOJu0YzukWaH07w9IG9vwkjsaIeMcM0fuOxqXsssUUSGAvX55w8UWLzn
	GtPA+3GxL8jD9nAnpUURLEAXk5NBQiFM2iE/XRdPtc2KRvloL4ukAXKlxEttZ+F7OcI=
X-Gm-Gg: ASbGnctH7ibzxuf7RDhUtHqzN78hv3S1Iqmk0CIeI663+dTGRLvRohn/HdrGE5RPAni
	+T67aYW9ot/7alOrsjckNSQ+WKHYaKvUCh7n0FT4i5hJiEv5M1SSuu4n5eUHmmAgYy6fa6O7rdF
	1J9J9VQH8f8alCDiBLRGtH8s21pPV0lme9Epbsz1QH+1D5FEtPVl3JAAeNcVfphVn9jsVDbPxpO
	r9t5XNRqjbxaW7fP3L88ygc2PnC9M5ZblSCui2ZA3GmphNL9S10RD7K8uP7sBjLDxtFHiOclymT
	wXtv1gNC3ijhNyhUqMfU0RVqYANwFv05Z7rlTqshs4vowbTD8FKAEVY7NS/h4brFGPR1cgWGaKO
	p9zhXu8NEjM3L0BWZRaNeSJaRXaIqKDZZdUP8i3ha86w=
X-Google-Smtp-Source: AGHT+IFJm3HiPoLK/XM90g+fcHzlvHluwqtWos6ed9f3ymuequGjG8kSBPjHauj83Q1H3CcvFKyccA==
X-Received: by 2002:adf:a156:0:b0:3d7:c25d:46eb with SMTP id ffacd0b85a97d-3e643ff9668mr3001574f8f.11.1757403648994;
        Tue, 09 Sep 2025 00:40:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca22esm1554901f8f.18.2025.09.09.00.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:40:48 -0700 (PDT)
Message-ID: <24ff2663-a635-4848-a2a3-7e4d404e31a5@linaro.org>
Date: Tue, 9 Sep 2025 09:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
To: chuan.liu@amlogic.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
 <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 09:29, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add indices for video encoder, demodulator and CVBS clocks.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

What?

You received one tag at v1, you ignored it.
Then you received another at v2, you ignored it.

You added these now... but:
Then third maintainer acked it THIRD DAMN TIME and you ignored it.

Three maintainers had to look at this little patch and yet you still
cannot collect the tags. You waste our time.

Best regards,
Krzysztof
