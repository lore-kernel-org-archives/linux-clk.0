Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447613D64
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988632; cv=none; b=JKdfwMfPVlTqs6oJ4rV+f57eNtiesblF3+nEohK1GvxhaaGjx+zYJymJ3/L0x2D/55S9XMsJhPra5fV+cg1aM5l007bYom5HO+2vgOS82FxCZbHyDJ2IbVrwJE7pEz4GteKp+pZI1PqZorzCjG/CQW24j+ugQDbEm+G0itAcZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988632; c=relaxed/simple;
	bh=V8U3uWMoTBpz84xCteNBmdNyAPu+B+T+tW18jdXjSWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Osw7jGsKMf0Ocab/I6u9L+SPT5yI/iCvQTW+qeMY/KZSuzj+Teg9Q0jtajsjGLrqX0B/oQ8Q5UPaGfmDPjkCtxBRzgN1UTmyTzfUlP+qaCe1B/boGRNJEA72/SI5yQV8XIJUakmrbDqlhl/e/1Fsv2mnGQpDPjFMMLaoT/cIRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XtLSBLQL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtLSBLQL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385d7fe2732so482990f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737988628; x=1738593428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Mgmvx7qMUfxppC0GnNZyd9TXM/c1npLJP/jRYaybk0=;
        b=XtLSBLQLFi+N6yIgTbNHPJ5xue6ZbxNFnrOrEreH6ES/HSTG2lqEozST8/nZUHHGs7
         G2gb+47VmuYuiaAp5hNU5FLSOPKMy06Ug2lM2lSOozNFnXkA4uZcnWMxV51m8O4/1fMM
         tOqGj3VQm0HbF7RxS25UTjIGgKDPP3c+OfLkIUQkToTCiew9p1eL9EGPZA9xeTgHWlIA
         rxaAjCSpU3DP1ADPHx0GSf3vOSx6CnU4QBwtj6AiTnmxFh5Ug5AuN7N6VZkRvcswJh9/
         PZyrnYYO9p/sYaJhjpEbzxgCWy88gIGvLHOXCtgZRrMDUdDF7dDWUp8O3TYbU/Pzl5iY
         HdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988628; x=1738593428;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Mgmvx7qMUfxppC0GnNZyd9TXM/c1npLJP/jRYaybk0=;
        b=tAblILDH4q7QpfCLxP9123V/xEMCwZZSWdahiCTpX59Uox367sl5rgL91crvt6s0i7
         Xx0emqZKSpp2KarhOHd+6GjcJaE7QabMXI9rDv0E0FBkB1KjxTMXY+iKnCV8lEopZ7Xw
         8Y065uB1Q6lGe56112m9/Htj6v9j8lT1fc0S/eJ067pPiGw4oK7aGrsmXqVBvF8XHr1Z
         jZAGNHk5aJZ5veadqU/52ZVeFj6u0+JBv9Eigq1CcNzkFT+4JsuvzklIv98ibYjTnY56
         U2cJ9D1slJpVSSMxNxOXk4JK4xMhAPc/cKXpmrvT2PstcZo5oUUHBm9DtsrfujSjTW96
         eTmA==
X-Forwarded-Encrypted: i=1; AJvYcCVz/waGzKgD/I/1HE4JeiNlCjZIit16wMheghfCxKP3pAJxjtNEMdhlLvIWA1U2wqMQJFwlrlbd5hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznfhVZ63dKtZorcSbxXkLpVJH+GeNaXAoGVpH8nF8TBZE+6lME
	BQRmHL52zqLS9SxTLiC4zGCR9tMhLDijxX+wzrPywXV/pS8imUmUTr7Ht6VES+M=
X-Gm-Gg: ASbGnctgZcgMyP/XeFpIA0wB2pz3DbiqBIOTHAVO2xOQH2JMircR46ZTYEWOWmdEwjU
	1ZBx7/8BpJQkSA0Vx4PSzpKcD+mRjAIocei9+J10+v36LQGryfpNfmbiACmrS+bQOQTgntxJTM3
	94w4j2gcr0eQbdxKkJmv1ok0HhshSKJlSrIDrezUmKbRz/il/6OOCwqItp/NYl+IkrNfjuexYi4
	H4kt4Q+RMM9neXgKslCLcuIkP8y0xpsndNYWbWNvyzzKLoIMU340E7D/FEJ68Z/iVhF8hegg0TK
	ge42UaJkLP2SMjPEO8BD1x8uvLz2D9erRA==
X-Google-Smtp-Source: AGHT+IENuP2Rt5tOjWZU4PEZeGsfKlhVaK+H06dVS97mfTD04yvo4YEOsPpfj4rxnyHPSjUgjLDcew==
X-Received: by 2002:a5d:588a:0:b0:385:edb7:69cc with SMTP id ffacd0b85a97d-38bf57bf3efmr14586098f8f.12.1737988628534;
        Mon, 27 Jan 2025 06:37:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm11036310f8f.1.2025.01.27.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:37:08 -0800 (PST)
Message-ID: <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>
Date: Mon, 27 Jan 2025 15:37:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2025 14:56, Dmitry Baryshkov wrote:
> On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
>> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
>> two clocks.  The respective clock ID is used by drivers and DTS, so it
>> should be documented as explicit ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch for Display tree, although with Ack from clock.
>> ---
>>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
>>  MAINTAINERS                                              | 1 +
>>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
>>  3 files changed, 12 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
>>
> 
>> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
>> new file mode 100644
>> index 000000000000..ab94d58377a1
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> 
> I think this should be dt-bindings/phy/qcom,foo.h


Both options - clock or phy - work for me, although with slight
preference of keeping foo constants only in foo (so clock -> clock)
because then clock maintainer sees it as well. Also because I would
judge by type of constants (so again clock constants -> clock
directory), not type of device. We have several MFD devices, like PMICs,
which have a clock, so bindings should go to mfd? But mfd is not a real
device, but Linux subsystem.

For many other archs, e.g Mediatek, pretty often even for the same
device, the binding headers are split between clock and reset. I know
that Qualcomm GCC has it in one file, with exceptions (ipq, qca8k). Also
these other archs have bindings file in e.g. soc or arm, but the header
in respective subsystem

With exceptions of am654 and pisatchio-usb headers, we don't store clock
constants in phy.

Unless someone insists or there is existing qcom convention, then I
rather prefer to keep it in clock.

Best regards,
Krzysztof
