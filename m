Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1B12B14A
	for <linux-clk@vger.kernel.org>; Wed, 15 May 2024 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715778823; cv=none; b=XdwwxNau6xfmVntPs0ewTsvzmXL6aoIkMeER4ZIfOgtmpjHwiPXRmLyLgvqv35v4d3g/ffCimBncIR0bRYlczK73074nXJorHYHef3w+2X77nTh8g15qvGZkUC0AiuTthK5NdQTjE2cnfsAdWV4eWuzd5vLg2lhyLo2XyC3Gu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715778823; c=relaxed/simple;
	bh=t1GL/VLTmYGsAxw6mUtAF631CxA1tvSVOImVMs6ckaQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=bs1QgMteyUM6L1iCHt0b4b9lYG3xKirWNNFkCie6hpWGmtXR102NvJmw8ePzEYdzSoW62smROoW+gtqhC/CTHngq5QYVnyAwunsCF/am9ZmT4WH+172kOBFfoxjOkfa33IAlBs21wTLS/NTr4n7yAci7HE9AInqmNq8mMXOlnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v+12ub72; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v+12ub72"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41ffad242c8so36785185e9.3
        for <linux-clk@vger.kernel.org>; Wed, 15 May 2024 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715778820; x=1716383620; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=M91H+nHHqkLBLg1QqXRG3fezduhANXnoUy1GZJinJLM=;
        b=v+12ub72VVs+HLnmCjwXLVOm4QNJ+vIQGJbxKnI+CIv/3UgDf8KEaMYg2Zw10RQANg
         dbdoK44j3YA6VB0uX8B4fCZDIjTM3MkkuLeXBXJCk66hmWmVRIA933aPMmR66CC8gual
         PqPlepbZhzO5Hu1J7J4qhxjO3uumAmeV/zQnnFXDQJ0Q/W7CU+a4JdKCF64WJbni0NKA
         agyHdHjCcoAoTQPK81BEqxI9sUdemjYEQG1GPrLnRHEsz3CkJV6MQ+hga2bAvu/gX5mO
         HNcO3FPdueoINsncm4lK2xChJm8BgXcB3F3rtBjYfi89MDpKg8K83xfUwK3HWuOnxhsd
         iNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778820; x=1716383620;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M91H+nHHqkLBLg1QqXRG3fezduhANXnoUy1GZJinJLM=;
        b=YCwwgTphnlDdQOT2/j8cyAJxKHW6W4jHkzWq8U1ergLrDV68nrjrYPWK3QpTX0+ERO
         ZJc/j4DaDZIlsXU/Gt+qrEEkQ7eiuENxjxxtyAGG+gdcoavpSj/RkE5nutef19ZEJ6ZU
         veUgyqI5kbbbCJ72HogxXzODyDttV+mlrA97z7nMib4mR3jl2O1bSC3QKlIknTjWE2ai
         7JSWperxRxMTv+Kcy+J2pCY+Z516kHecGqEmgF0iOYOTlmOnYd2KAJAXpH6WCXJm6SfM
         ecs2jZ/BJrEVD1ZvBw00fc0RPPSDG3OhcRz8TEL1GRwLokl+xLuoy8xBPZm085Pubm/c
         +qow==
X-Forwarded-Encrypted: i=1; AJvYcCWK8GrxrkXQoKbcun8lvKdTB7hIZjD6l0Lv8HPEM2YIuQf60CbWFeTYVaXHjSuz3HB2GR32S6Jao7w67hm+rkc9936ZCZO2l1CP
X-Gm-Message-State: AOJu0YwjfowEipCwTsxDEIFhsS8kAEODvV5TiUBBE+OeXi2okaztGigw
	Mszq93l6BVrQt0qR1UEQAiMYnffJdXMO+hg25Wvt777mERxnijT26zfntNvJ9sA=
X-Google-Smtp-Source: AGHT+IFGKx5BSWfW3mhzW8qqzYmSwVybzwb9nvOAxYK14fvZAmTCWSio0KnxCN2xyBvzkP9/4QqX4Q==
X-Received: by 2002:a05:600c:1c9f:b0:41f:aef0:9349 with SMTP id 5b1f17b1804b1-41feac556f1mr169219155e9.25.1715778818567;
        Wed, 15 May 2024 06:13:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2893:1a8f:5988:776a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110fedsm270535765e9.31.2024.05.15.06.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:13:38 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-2-ddrokosov@salutedevices.com>
 <1jfrulzxms.fsf@starbuckisacylon.baylibre.com>
 <20240513214728.g4isbfisifxalqxy@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] clk: meson: introduce 'INIT_ONCE' flag to
 eliminate init for enabled PLL
Date: Wed, 15 May 2024 15:12:02 +0200
In-reply-to: <20240513214728.g4isbfisifxalqxy@CAB-WSD-L081021>
Message-ID: <1jle4bxloe.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 14 May 2024 at 00:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

>> 
>> I agree that currently that carefully reading the code clears that up
>> but it is misleading
>> 
>> CLK_MESON_PLL_EN_NOINIT ?
>>                         
>
> I have been considering this name and its derivatives, such as:
>
>     CLK_MESON_PLL_SKIP_ENABLED

>     CLK_MESON_PLL_NOINIT_ENABLED

That one accurately describes what you do.
Use this one please
