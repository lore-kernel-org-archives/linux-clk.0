Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3e8d76Q"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F36E1
	for <linux-clk@vger.kernel.org>; Fri, 17 Nov 2023 16:51:13 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9f282203d06so366201766b.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Nov 2023 16:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700268672; x=1700873472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkQFDUSjgWW+uNRlfQApC/QxGhsTFKT2t0xTRRH0asM=;
        b=w3e8d76QGQzdax5gyHXQE1vLWdqK04RC6R9lj26gx8/NikhVxZWANY9ZVcJcr7cOgU
         x1ZQoHmwawmvVnB786GZytvEwl82SN7CzPJoIxwLSHZyNERmyZp6SJHgTh50ssdXbCBU
         VGjZLoy/nJ05yw8MlTOz4CAwAMP17jG/2lqw3UR+4fULw1vs2ZmTg5zfTtsJjILCx+ew
         qt+gDOoc0ATqrC5v1GbMJ2eX/QYU8SYlwpYjYqwI8ffX/fdDm2zkwGMNsJxBzJKlLNTw
         ARf9zQb/ox3fZG3TZIMIEPemOqL9UkU4YFaDqntTFZ8vxiWMC7ncczRdgb7samolDOl0
         obpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700268672; x=1700873472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkQFDUSjgWW+uNRlfQApC/QxGhsTFKT2t0xTRRH0asM=;
        b=CsVlvpm21KOTmvgtPI66qicXBHMynB1p9idVAIu7TnxpucR4eljUhX0MEncDtI1ObC
         8g4ny0Panxly+5+iWyM+oziy+ahfpXwaz4pOQQlJUmHq/oVYLvQYJGIO4gSe6KRj1kNJ
         4JxCZ6W2gUIPaeh6b7U9ORL83i61t0KAlbqKUCIV8O6pa2ttVf294QtqVTLYVr+QMKru
         XT5GLCylI4tG29xPBHagiJtBg6m4efSiDQLNfdyHUVDlNdLnxWyo1bgizRVpeqbvAkwY
         /s0cYGPEgfCjMOGh1CbdU3kMnALR6JGz3v61aZGEFTiZmiCxG/xPuUr6oKamMrnkBu7x
         8p8Q==
X-Gm-Message-State: AOJu0Yxt3unyCmuBhTAo5LUbVMJEoSDq6fsO3Lqa3XwdEggeTMswO9O4
	T1MpMBLkQw/zo8GE4vU5TZvC2A==
X-Google-Smtp-Source: AGHT+IET83DijHTWtN5lzHCglHbTO1pZbQRbcUOVERi7k5OxILFZVKFItJpXx5iOUdN56TkjExvrfg==
X-Received: by 2002:a17:906:224d:b0:9bf:2f84:5de7 with SMTP id 13-20020a170906224d00b009bf2f845de7mr492003ejr.4.1700268671779;
        Fri, 17 Nov 2023 16:51:11 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id bo14-20020a170906d04e00b009c3f8f46c22sm1341061ejb.77.2023.11.17.16.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:51:11 -0800 (PST)
Message-ID: <e59569d3-cb49-4e11-8bd8-f814f369aaa7@linaro.org>
Date: Sat, 18 Nov 2023 01:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add sc8280xp CCI and CAMSS core dtsi
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, andersson@kernel.org,
 agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jonathan@marek.ca,
 quic_tdas@quicinc.com, vladimir.zapolskiy@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.10.2023 13:30, Bryan O'Donoghue wrote:
> V4:
> - Adds RB - Krzysztof
> - Drops indicated newline - Krzysztof
> - Moves "This patch depends-on" below the "---" - Krsysztof
Just a note for Bjorn, this series is likely on hold as we iron out the
driver details.. e.g. _src clocks were dropped since this submission.

Konrad
