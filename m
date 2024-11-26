Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4901DFE08
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664725; cv=none; b=i+AneXCNIL3764Qd+U/B6N+7VSooKuo9f7OPIPpdRXUVA9HrD0d8ATmF9OlPQpXE/nqLMlgs9WU6QeBD/VEd046HcgEnaETAInnf9u1P76QLA4feFRGdExvLYnJrTyiX1tapHcGSwtXfKUCEfM+jUW/L0QX//vT3ZHmdY53ME24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664725; c=relaxed/simple;
	bh=VXT7wVN1rHLhIih/1QX0aBa8H8bgdCdyGTEgIzvjv84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8K5pcdGq2ugGvvPCWALA9A//+FushzDCtZZyHOMB9GmEipTUXpA/H7IRjbE4yS+sHnIdz2/2qlyZyNfd92+rTixoSSB8rE4qJuc8M3fxXEoWgrf4OLFX5xh2suF2VM3VEWXEFj8bxIeIS4XW/uz30MlWOEvctboSRUFkSLhvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUu5Kvny; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUu5Kvny"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4349fb56260so23004045e9.3
        for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 15:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664722; x=1733269522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cTIQDR6gO8Gy9gR3S1W7hO6fiHoSmnxEdBfKcw5IXcY=;
        b=IUu5KvnykpEN5he7ICWm0l3EJpE8/4nD46YhWU0Hfh7/i3UoASQzhD9I6WP04eJ3s6
         8GkfuZbXWL4D0fEm2HevL7C98r1pJUtdMn22kwuurNYeTO8qFFyEMrOS4e3Yl3Jm5L0K
         bEuzq6D42xrQ3tf7cR30sCh2SGRzydbQjQenLEgwKOtPU+PivgDDlrnJLAHdanQGx5Tt
         J/AhgvYc/AWUYFSSF3NsB7JtnWkn/nTaaLqpMba7mpxqB6oCCKZFMqS/VYJeaYALVAxu
         p9iQtFiVigKptAVFH/RpHhLXE6EcPlmU0EkS1Ai1wA9NaVfXbd82En+KdMRRCvebE+2+
         wkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664722; x=1733269522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTIQDR6gO8Gy9gR3S1W7hO6fiHoSmnxEdBfKcw5IXcY=;
        b=ZlPWDl/YwHYzEqtV+6JPyuUYyNpWttCyMn67KfhQJDdKw4khmWTozG7NmDHCR3FkJZ
         3WzBkj/vCVGkucQ8d7hugI4BByRdfz53jpypfVjo/nCu5/Xq2+PviSWs7B8HhPqEkXBw
         +kzSKdvpYmXi0DXscvkmZFucgOHre7uZjO7wZBI7q147qaRwNE/Cv9sGJjsgEsIqlpH0
         XucUDXa9FqQpPkf8vXYO8RScsDRsfggWJDdREEK16oRCb01U8yg+BKkAso3/3cfExh3e
         +bw1BrOORyQXHeNKw+VkHXwWHI0hfV20B4251pgq25f3XDnAMVKTaqbg9fSkHVSaqc30
         akJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdznlbW8VOwdzwndRuf2HYkUI5JgaFT2K35HzptHEloD5y8v9XPDH2P4XSk9xbxCIfA3Nm8p4azCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjihLQgvf1xsSstaoMffdndi57WnAYk6e19WvJ7o0lXzs5Ggi
	1B6lzNSynMzlc/L8/VNam7XDS1Eb7hVSgftN9BgYCtkympfw8pCYhLKpkasOV3w=
X-Gm-Gg: ASbGncvrebzLJ+Tn6a7CTUc8PKh4oBzwkSqWFsGZrENyaxDipg2FxroxKeyCJpidB+l
	e/KVfZSiF3JPzlzhBGKgS6ERUKFN26udKADvNbNYKIIZoZQN3CU/D6ta29tR4J0QYWb/BANGAGW
	nq9+8v+FB6hEevHMffeGrqz2SQHK4R6wPdEnVC6uqmc3NcoJ+49W5YtEiOWA15Zf6Ie6QQM3w38
	Kano/AiTi6gzmURrpKZKtn0fYNHPRDQTz0/0FLzjIR9tQw9Nvl1y417eInfXy8=
X-Google-Smtp-Source: AGHT+IGgTq9G93zWAnGOsfichoeaSKEevf+t6zRWeozKkzcjQJicK+VxCL2bOFNMReJ5cRUfsxifbA==
X-Received: by 2002:a05:6000:2c6:b0:382:4a69:ae0e with SMTP id ffacd0b85a97d-385c6eb697cmr583035f8f.14.1732664722646;
        Tue, 26 Nov 2024 15:45:22 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafeceesm14595766f8f.37.2024.11.26.15.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 15:45:22 -0800 (PST)
Message-ID: <faae3508-5dce-4c38-a344-1d35186e0909@linaro.org>
Date: Tue, 26 Nov 2024 23:45:21 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
 <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>
 <ava6dkmz5g725skafuqyb4rly3qna5z4bhfmrqgogcmdcubzf3@eu4odajw6e6d>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ava6dkmz5g725skafuqyb4rly3qna5z4bhfmrqgogcmdcubzf3@eu4odajw6e6d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2024 17:23, Bjorn Andersson wrote:
>> I'm finding with this patch reverted but, keeping the first patch that it
>> pretty much works as you'd want with the caveat that gdsc_register ->
>> gdsc_en -> gdsc_toggle fails the first time.
>>
> Can you clarify that call graph for me? 

Ah no my apologies, that wasn't the call graph I realised about 2 
seconds after sending the mail and never corrected the record.

Please see the v3 of this series instead.

https://lore.kernel.org/lkml/20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org/

---
bod


