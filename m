Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ADD1A08BC
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 22:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970347; cv=none; b=dO3yNO/i4hK9JhbgA4U74A0XfQd9UweblyFBoYDtuHzmmU5DA7SQu8qRZfLnxFIM1ZYGEpteMUEIhD4k9+VBEMZ2z7J9fNOhSpRD2iI+e6N6BHnFs43dEH7nMwz+Oh/qeos5Wa8qrODgExrhMdzPAYImrfjuBjqr6CHDzw8d46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970347; c=relaxed/simple;
	bh=ZdXm3iVe/pHNYaMtoEOpHIfW69+kJg3c731+QVPRDrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZzZZ4ASU2auSBaDIsUjUiPoSnjiT5yowwP29mgJWRnjaa0P5wWadA+38UJqW91EWswxSrAlc2QK5RuzLpxl2x8XT8Ij0t2vUBH5hAJ2L7HsXQLRSle7dSU/AbQC3rVJAS6qAa+iWKLlQXsfHhWQw4cbexoL+Ua1NegllpF5EfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O2SML3F0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O2SML3F0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3822ec43fb0so2637397f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 14:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970344; x=1732575144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQZ1H7BLVJlHjVImlFPAn8pO0c0uma6JbIMH8fW7XIk=;
        b=O2SML3F0n/cV6xRkSM+M770ZzpSBgOsUysjLsZEf8jD5N5igqp7FPr3NwPnduG+kLS
         HjfZZL42cNf6AB3/sqALDwJjwgiNeSrcSHoHNy0InWAuMcZLJ7jhz1FpM7+gJ/SZsckd
         ei3WeEhHX8MpeHe2W8OzXFe3qm8zleXJyDKwqSzzFAcU0vzIbfPw7mVxw3kEENE3aP3B
         uApBG3lWVz0lHQ9dI0jHQlXGRh6BOkPKA/zrFskayzaqWw/XqLN49ZvWdNhn9r3iBsTv
         9x4YVftZgwpCyrzzlWpAnNgzY9/0Fzrpe1A+z7UExTei5DT0k4gednYQLh8MUsTPcQoD
         EtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970344; x=1732575144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQZ1H7BLVJlHjVImlFPAn8pO0c0uma6JbIMH8fW7XIk=;
        b=Kh3Y44sPLq8pkHn6DutabNl6rEVb0k1EfTOH2hSqoMZRtBBXAoTkxpJB5KMYgb1JHY
         hlrTRr2kvm2SlCjNZYn7FWcQ3e6QS9AbCN6zlYy9WNZiUoDAhdGqmQLFEsb74mSjdFAy
         NR4YrtNFxDD6YGrdmtUmlLAYRGPNM/uw2G35wn/1VtDOoLA4EmWcXoYjR0zqCsENUFFz
         6p8bagoxT0wKxZ7WSop2dIu27A6VSSk5s6gqTcsIKeUfRttSyMui8whmybh4qCUNvPq6
         5NzyGdoTdwNYEmDNj7jEHN0qmyC2tOsxvIuSMdY/U0I188Fx2jk3EAboZ5ofrFFcT6+6
         F8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Zp3N1nSTqYO6724fwzlInrpV1kyOVcfzh1QD0RsvPcbcseXJBT9y6kAAzIpEHDiQgViOnBe9zCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuF5PbXFpLOUM5AZAIGlqld3UoUAKjeCaxY3cEA01yuQKi029
	oaTxlBG4dEjcJjA5kCc+EpAG1LgNKlkI+KC6bTOssD1OT5XXW5Xdh84a3RRzyv0=
X-Google-Smtp-Source: AGHT+IEpllqNeXrLFAJ6hV+Vn+2k7uE4VkD/xEA3WWU8D/eic5WliEwLRK82P9EcMjRhkP5rXePrFw==
X-Received: by 2002:a5d:6d02:0:b0:382:4b63:96b5 with SMTP id ffacd0b85a97d-3824b6398ffmr1759861f8f.57.1731970343837;
        Mon, 18 Nov 2024 14:52:23 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382435f6986sm5752267f8f.42.2024.11.18.14.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:52:23 -0800 (PST)
Message-ID: <79fcefae-ef01-4499-9532-fbb87ef8f0eb@linaro.org>
Date: Mon, 18 Nov 2024 22:52:22 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/11/2024 22:17, Vladimir Zapolskiy wrote:
>      ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>      if (ret < 0 && ret != -EEXIST)
>          return ret;
> 
> That's it. No need to introduce a new function, not saying about 20 LoC 
> off.
> 
> Next, you have to call dev_pm_domain_detach_list() in your version of the
> change on the error paths etc., fortunately this can be easily avoided,
> if the resource management flavour of the same function is in use.

 From memory I _thought_ I concluded this was necessary

+    /* Only one power-domain platform framework will hook it up */
+    if (dev->pm_domain)
+        return 0;

=> for clocks which have a single power-domain the core framework will 
already have setup the linkage by the time we get to this point in the code.

But, I'll check again to make sure.

---
bod
