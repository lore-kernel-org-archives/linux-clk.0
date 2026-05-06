Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80A423A63
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068450; cv=none; b=jmhgfkuQ3U6y8Yd8SuPou4CNAdBVbEX7HFh2UqVf4qvxglIwhyH7pJmdxNcDIvkTnURm0bSvEC/sLfe/OdDBeqtH2UYoH2jvRob4uj6dLQ3S/5ihw4eCNryQLkJSDYrTspe1KIh1nguEJxjdeGfTlnPczFhur+lAyJQiVf8gx/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068450; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8VL290iZhlkprtI3nZC4Sp9ZjrluSHhIb1netQGT8d6Um1jDm9gaZyORO4lh0wiGR5GUmGoVCeVxTRrS58Gu4dX4mbjQJ2R3KBZM/WA+LXbJag7cdyF7K+xfQpor/KmvVJ2CIOdgKYQyZiDF0ul9ThbGethLdEHe3LvV+auwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vCDhER9Y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCDhER9Y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so71101095e9.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778068448; x=1778673248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=vCDhER9YWn7V6zQ7i4yxR+/yve7kiShNsDKsvail0HAUNIQlnv1sbmYPrwJqaLFnJf
         1ZVBVKjRGLF0EWrG+cqo0SY0ryrxgNiO5LHOaDd49ruBeBnrx46aSwCkXp9JT2z/xaCX
         IOkmKrCNTa0TYW9+w45jQ7cr0EG5YruABlonZx294FwWjg7vpwaIchDBEWBTkJSzMlLX
         aHn4hQnQsqj4w1XxZEmF29ftBoMMPUVQ/niXnhydVPJJFlo2duwyxVKWOS7eo8w55K3A
         fxK9OUci4fSsrFTc7KkfNCFPzAgHudDV+WbKgpfT0OG94SDV2WMK7Wwccz0WNJxioavI
         9DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068448; x=1778673248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=s+Kv8Ku+kVN9aD0cD/+oSCSXIUytqbZZFfUO0ggeZNrPbL+KO3b074IeprSH1tSzjm
         YIuh9yAT4xqMz9i5NtTsPGUOxx0d6Ek4gMXuPd+s3nJxe8V8OqesHKKyLRJyTqNqh+x6
         yhF5Zr1SroxCgWLLSGiI5nC8G3rhWmUyCv8SIiDBGOvOUdkziKYVO9DXdLHav7tHxPHZ
         yGubadI9jvbhMnDHuv1i4UuV8YGGgg6zomPabAuvPVu5Qo3f6yH0IDENCcN3b6V+Y3Uj
         3MnJXE+noOAKG4+WhgVyqlMMN/ShEW4LoIbkvPSf8BxEph8ugeWgbZza2/McKVYnYGVN
         yR4g==
X-Forwarded-Encrypted: i=1; AFNElJ9ITn/UeOaLvUxBJ6TLsls/hJ1rgbUxZeAIcYqZIk/hdVillYKylLC6CFcG9+DFL6W/teqJMTzZ2P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdrAjsCQdeq7Qxuo7KhQbN5BvSxdKvI6QZIm8ZdPLUZY//7ItS
	0GXvklYsLg7YwvXqAt6SXxBZK8EsO/K9ExHiKsqZSJroOK7SY2hbo72/3JJp+W2tzkM=
X-Gm-Gg: AeBDies5r2UD+Jr0H+t/NrnKCfNaNw63Z0TwYUr9WfUfHRx+8hQsMjIIN6pp557b1IV
	O+BDjKoExDfciyjAAnsKeylRXd93erpip7KIr/QWt4r8zXt7hgQGjngvP4mc2POGVzrHLtF56y5
	KNjyoycHCa8OEvJkWuabsspDeD79bO/cu30CdefMPSls1y4XjPX8tQqxl+kt4UFQLD1xNZI7S5O
	O4p1uiHFciybuALItHr7PPBoR2X/iRU97/qBsPgBOOd/6nbHYlNoWQiFHbYBx0JvWaoNEpG/frd
	nL/ET9Kw7ncuHJBzFxHLyYUOjFcRIqpIKMuk+3DUxM5wRNsnRuNFdPR+HF8VuOtYePMrksw4PvY
	CxW4H9xHfAE/G49luK+IOO9i1kSNFchssBL/HGC93fU9UVq7Py/AXSkzDFiOoarIQ6UgRb3J7m4
	mJ9HxHiBfFNsgb57eIzYgQN0oZNUlWuXAVBqBP6JXC65c=
X-Received: by 2002:a05:600c:8b8b:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48e51f4143fmr55989735e9.24.1778068448039;
        Wed, 06 May 2026 04:54:08 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm29851845e9.1.2026.05.06.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:54:07 -0700 (PDT)
Message-ID: <c38cec65-e8fe-45d8-98c2-c86c27dfa6c1@linaro.org>
Date: Wed, 6 May 2026 14:54:04 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in
 peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>, peter.griffin@linaro.org,
 krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: andre.draszik@linaro.org, alim.akhtar@samsung.com,
 semen.protsenko@linaro.org, wllee@google.com, hsuanting@google.com,
 marscheng@google.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@google.com
References: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
