Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzeQoJ3i"
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26438D75
	for <linux-clk@vger.kernel.org>; Fri, 17 Nov 2023 17:52:47 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso642585e9.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Nov 2023 17:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700272365; x=1700877165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=beQAaUooTYtJIw7OKCSz0TPZiTblJ6rroskHEToeWdg=;
        b=FzeQoJ3i/UcpE4ovQKbx7nR1OS6WMsQz4ZZ+j415Dm10OACrho7YPOIf4WvTgP7QrD
         /ZmmkVLcGhA1OYkypcnNnLjOSDj3J2lZSb5NI0CpBVg5YCrhQvX9p4EBD8p/NL2DX4i+
         sX0Fl8iTBjV1Hs8QDkIqiIHb9s8fGDG9OanaUs5TFjl7IGM4FHa8dGy1U2FfVY4awM6k
         lY/kQT+/BTUDADxP8kfbsy9PT1ypKdCXkQmGVI9GuuwyXAAu2kh42d17xR4iuCX5Mkmo
         SnOk9lpJmbeneJ71+4UTuFp5+t9axzAtQ15kH56AA8gWYPdmuQr3755q5+vvCuvmIkyQ
         +0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700272365; x=1700877165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beQAaUooTYtJIw7OKCSz0TPZiTblJ6rroskHEToeWdg=;
        b=lpt+eZlTn6q4sKfCKK42BZj7+Zz8+wOd3aJPaqWVKosm3wsTtM5ROq+zin/q2TCGH9
         gjflX2xzSJ+Ra8tsnZXlumjXFvcWEZSQ8yUHKXKVSRxQCdasnwRJ5+a1WOkjdt7mV4JD
         oICRoYlFPXEmZGUgdX6N+7l436T7rq+n4tVQL8i39/S/qbxa9mzP/KviX6NHtj4qaMRJ
         BI2BovWoGidaRgOZZ1/lDY+r1Ll6OxZJewnUTP/81ro7+gp3az10++bXEbVuLGXu/Rc2
         G51iBasYYB2Eo1ECsiH6DW/Saty6cbiYO5D5ern6hJRD8YrRvfGoeY3JX/KwomhZ8zjW
         zu2A==
X-Gm-Message-State: AOJu0YxmaAFFAm3nyrHzxTqG71rJ0tjLnrJvnnqIFaJTINYTC3OO+DMW
	DYHsVC6DTkjrpPKvxAQVhjZx/A==
X-Google-Smtp-Source: AGHT+IE2hLmsmCPrJJeC6nk/f6XEjguRcjWsG0tCK9xcAuWJh+kn1SuzhRE/UKucZPoHo/JnvZOQzA==
X-Received: by 2002:a05:600c:354a:b0:401:c338:ab94 with SMTP id i10-20020a05600c354a00b00401c338ab94mr727705wmq.29.1700272365546;
        Fri, 17 Nov 2023 17:52:45 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b0040644e699a0sm8836386wme.45.2023.11.17.17.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 17:52:44 -0800 (PST)
Message-ID: <c8cf229b-4d15-4eca-bc4b-61dc67d63e91@linaro.org>
Date: Sat, 18 Nov 2023 01:52:43 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] clk: qcom: Add Global Clock controller (GCC)
 driver for X1E80100
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: agross@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com,
 quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 abel.vesa@linaro.org, quic_tsoni@quicinc.com
References: <20231117092737.28362-1-quic_sibis@quicinc.com>
 <20231117092737.28362-3-quic_sibis@quicinc.com>
 <ec9d03f7-7158-4309-9a04-b08c69b89f39@linaro.org>
 <2e0d2c55-fb2f-4903-a555-f51019942c6e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2e0d2c55-fb2f-4903-a555-f51019942c6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2023 00:06, Konrad Dybcio wrote:
> On 17.11.2023 21:50, Bryan O'Donoghue wrote:
>> On 17/11/2023 09:27, Sibi Sankar wrote:
>>> * Use shared ops in the x1e80100 gcc driver [Bryan].
>>
>> This looks better to me now / more consistent with what we have in sc8280xp - where we do try to hit suspend and => retention/parking matters.
> Parking the clock is separate from putting the system to sleep.

Yes but several of our clocks want to be parked, not switched off.. 
which obviously does matter in suspend.

> IIUC we usually use shared ops on clocks that may have different users
> (e.g. not only controlled by Linux) and/or that are crucial to the
> functioning of hardware (like AXI clocks, which if gated would make
> the system crash on any access attempt, from any subsystem, unless
> turned on beforehand)

My question here for Sibi, is why sdcc2_apss_clk_src differs here from 
sc8280xp?

Is it wrong on sc8280xp or if correct sc8280xp then why is it not 
replicated here ?

https://lore.kernel.org/linux-arm-msm/e857c853-51ef-8314-2a21-fa6fd25162ca@quicinc.com/

Also @Sibi I realise alot of this code is autogenerated - it would be 
worthwhile finding/fixing the script that does the generation to plug in 
shared_ops instead of floor_ops if the input material has the necessary 
flags.

---
bod
