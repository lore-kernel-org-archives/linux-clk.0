Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C413A252
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229318; cv=none; b=kdrU5Z253nTseqXIa9u+cnJkREK0V2WoSC6GKx2JeAPOVfepPC1TK+MhzY84Fi5LqW3EOQDYflRt5YJ0VmTiQXVgyCz3EMSunOKc4dDL4GkgH24qKN+UQ1BTLcQQ7BJcj2+OKOojrB3VRRrgfFgwO9F2JQTSDo3UCqyxs4GT5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229318; c=relaxed/simple;
	bh=C028/nFsGE40ydlmB9BxdAJi/8hIWgLolYvN+o5rEZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBRFwFmKUM4/40VFmuRUZNDCiP3aoeXxryKpu4dCaLKcAZCxAXTadTxYiPxvZ+aKEbHDljKGOuB6eUX8QoF6vn4foheW8mTclH1ev+Es8ORjLiZoiSQbjq2q0cIOqu5DrNW1X/wCsT00I5ikDDvd4gd6R73s+hdwlcK9UusY11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1M/szUJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1M/szUJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso2856475f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 04:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719229315; x=1719834115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+jjro0681AEOFwhkhNhmaTtx8v0fmEZR11zlZ878gA=;
        b=j1M/szUJ04JfmiXtzdUpbWOEGaymaHvffYUh0YgExeQe/9M5BcubEpewCPEuRVnJHy
         d4NKbBIZFZgxkllY1Ie/chYOeZ5I/9G1YhKZ65eInOnAlx+EI77AuDYC5EqV8Ux+TnlB
         /xyT5hHkn9nYwirYWVGZJQwikhxHQWkSBp0xaumLPdJjyxmfhHUnsecK6bEk+705gCcv
         d0gvnxECWQ8fwtRCjWnjwzFLL17ItksMD3VG8pLpDtJBv5+Pitd/M4/jqwgaAW8nClJb
         HAP9cNzgz8EROKUXAdwVpR6aKWusBVrH2qG/nK8ywxuDV2ZNTil55BWgf8Mah2lWHxVv
         +nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229315; x=1719834115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+jjro0681AEOFwhkhNhmaTtx8v0fmEZR11zlZ878gA=;
        b=MxVl6cORtBJJK/eM0AIQLpLg9iJCjJEXyyEu0cwuA7PGxf3szHTUosZ0STbi87VzJ5
         nvD5Qc/+o4bEJWPX9euY00aF8ui2eOhC9tJcsKC2psAH2GHxtUJBjZm6/0m3knB/XE4U
         RYweMqZaMDKyWs0ZfpDW2gODNfzJgYbcgv88MrCEML04AA/xuvzpHUOtnT64bysHc2wF
         /KtyM2N3h85Vw51NAKnv9i/yXIFHq1GeEOLlCCtU5gSEmeYqLSCloTyvFnbUXBPlYnfb
         RyOQA36z05XX8ILSs8M7zQeuoU8zaZKEUtDqyKolEsRZAsw/1vCzwbGugCY4dMk1NDEO
         pu4A==
X-Forwarded-Encrypted: i=1; AJvYcCXT41clZaVjk2wjxTZNfwBYSUoy8krq9GJHTIdkAwQAFIEfffh2wN7itC5YHYhug1O2n5szM2kidN2a56OhxTnQhQHEO9Qghn3M
X-Gm-Message-State: AOJu0YwYcNyRg6tvtqqnhV9hVeIP765MQJ5QdsD2SX9oLeB4lj6oaZCQ
	gUwyi+1rTnssOGLYjqh6bg4nonSrznu+pkmM82tOhudxSu6eolBKW3L2p1x2WzI=
X-Google-Smtp-Source: AGHT+IHoGgWxVHYl9o9oDPZVH7R7MNNhC1mYVS4z9J3EY4whsBbRpKDAVx2h9mKJ84IvNeAFF6eWqA==
X-Received: by 2002:a05:6000:1545:b0:366:e8cf:ef6d with SMTP id ffacd0b85a97d-366e8cff117mr4375611f8f.55.1719229315261;
        Mon, 24 Jun 2024 04:41:55 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3663a8c7c6esm9839416f8f.103.2024.06.24.04.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:41:54 -0700 (PDT)
Message-ID: <55bee27a-e4c8-4e4f-ac62-a581f46662ef@linaro.org>
Date: Mon, 24 Jun 2024 12:41:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
 <p6ooqgfwld7stzevozs7huztputc7vpc7652wx6rvg4cly5mj5@fwrzeu6alhgq>
 <ea57a3a1-1037-4d59-a384-50c98e1f9387@linaro.org>
 <mzcofsmnqkxgxarcbxh2gqtdusyzpxr4edjcpurerurzape7da@4dky45iy5iph>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <mzcofsmnqkxgxarcbxh2gqtdusyzpxr4edjcpurerurzape7da@4dky45iy5iph>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2024 12:22, Dmitry Baryshkov wrote:
> On Mon, Jun 24, 2024 at 12:11:08PM GMT, Srinivas Kandagatla wrote:
>>
>>
>> On 24/06/2024 12:08, Dmitry Baryshkov wrote:
>>> On Mon, Jun 24, 2024 at 11:55:29AM GMT, Srinivas Kandagatla wrote:
>>>> Soundwire resets are missing in the existing dts, add resets for all the 4
>>>> instances of Soundwire controllers (WSA, WSA2, RX, TX).
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> Could you please point out the driver changes?
>> If you mean, soundwire controller driver, it already has the reset support.
> 
> No, I was looking for audiocc drivers.

drivers/clk/qcom/lpasscc-sc8280xp.c needs no changes, other then the 
dt-bindings changes that i will fix in v2.

--srini
> 
