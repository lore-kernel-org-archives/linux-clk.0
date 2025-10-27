Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB12FE078
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578270; cv=none; b=UAfbZmIoKvWjkL+lR3pBrgai0qCLT3wFeqRkhIhFuAVwnQ9re+C/sYL6NOqjWt5jMFU6U+GAhYuEUo/dGe1m9SUwgHxl4jucloBRJCHvPNCURjiAwXhTfPOVX1OIHK4UjoZbDIkowShc9okd5stCED/IGKaDgxZ3jUlSDEtqHFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578270; c=relaxed/simple;
	bh=j7iaI6dMKBMwEA/p9J76DQJqd78/n7N+OXj7MgdoWU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5sEXUN2VWEwguWJYEv13Qyr8NLNV9xjaoHqgZvCAMp8RR+I4E4d5ClqhiWR4DOYZERvQJxo5tHhfgmeQrFe3tNNYo/2KYECIP6qKlwe1mQey3xT5kskTvda6en4w2p43cqxON22PfPJPuYjJbTICobSI+qIbk/ruimgsoIrSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYK+Lbqm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYK+Lbqm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1142248266b.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578266; x=1762183066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=hYK+Lbqm8F4EWCYEXc5zzo57bvJUDMeXeM8P2cem3hFG+dxv4es9Xdiz+m5WacCk9M
         dkZSNTBy7LtK7RNcsBbOd1pZI9KtdHdl1E+Af5oDgnPTaADYTALvQ7kN6Llrf02BlFdb
         5bpQ9m97qxwHxusgsaxqyLPuYiJRaX7KE9D30a3MbJR6CWhkpyI2B2oGogSZA7MhfaFt
         omsIv0LlnZLC0ycfKHT9SviJw8LJBWq3YHnCxY5+j/5tzgvSBZATaT8JkcH7OtXRbQNu
         llJOIbS9FEgLctmybGdtGA5ZjQJNm4tLowhEQhp2wqjqcQeEgHj0r2LLN2uGFp162Lkq
         Zz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578266; x=1762183066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=blWkyrML3Nz3sJaMYvGLI7jzbZ/TqjYw4LVXualbrJF7c88LO6yDRZMHne758im/VC
         gutxRxL9ViqB/bahJ3G8VAmB/3Txys4IWR3rU1a6kJ7DNoOLfhEfzL5E2PZcFnTpMecp
         Y7hf46etztwb2QJP7Cp3JdOQnX4s8ax26atbwctu908QlPwqG31J+8ogBqGe0qEuDAZJ
         LYYYM3WAYwqzj2ChbjRWjVlWchsNdYno6r0U6TijcAWzt3PG2kj+ves+WcnHNLet1hK1
         MzfXoAgPlXSmvXlni4PdGu0Q0vRfwlVsgYfCHdXAu97wT5oIknUyZaS72oZ7CW35jYEZ
         W91Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr5gi/LMGMbeUqUzzBHWFnHxCXH76aYxTf/3PqB90WEzNtbZBzHf1WeH0X6ZRzqxiWNvQaeWugV8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJM2WaCskINGCWkzyRSQbQABu580Ywt3Syz8RNkpSCc9559yG/
	9mf+RJ+y6IBAnd1hhOD5H1QU6puVmZC7T69twWL7bYmF+cvXiOQcqp4s
X-Gm-Gg: ASbGnctfOdZiRcKs5/ei2dw/UnCMuv6xtaG88FAfhu25V0ZVV6f65j9LihJyb87o401
	TWEjmPkxEmDrqwl34nJ950aklr7J2ctQuAetGND369zE+QOhWwp2fEch9sxH8P6gBwXxH225V0a
	IRN9Ta355Ngu5dgsc9mKxxe4CtgGq9KjAznXQ8WSUxsUlYKJX+d+Gus8NeSI5dYmVJfh5xJrJkA
	XcLQRoBfNopmqkxURjViBp6HDwa8ve0P4JvrzkYWF5uZAovamPz0YICjB51PEgooZzvMtWA4VZy
	QbENaNDyXalBwG6frT8YVUIMyfU8hE/36+5JcA+adsPEmMPWJBNKNicEm6Mc/n9fEqqs0BKIljo
	OlAvmJbJZ+zjjGkVrXplO6t3duYUAg31ISDHc1YLwd9fEMXD/lEbt8c6u1+2pjOm0UuETBTTeF1
	E0eTTQq81ucjrobroQJbaVc6gysN7mOg==
X-Google-Smtp-Source: AGHT+IFwRk45A3Ur3DKKqB7hUJTu/XpniiqiGgHDiWfPN2WS4tjYIiwIglRdwwwXDeEdp9t66AD1SA==
X-Received: by 2002:a17:907:97d6:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b6dba49c6d1mr31539266b.28.1761578265848;
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Received: from [10.25.208.2] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cb0sm809592766b.9.2025.10.27.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Message-ID: <feba1845-5f2f-4716-950c-9abc7c4594a9@gmail.com>
Date: Mon, 27 Oct 2025 08:17:40 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
 <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/22/2025 7:08 AM, Peng Fan wrote:
> Hi Laurentiu,
>
> On Fri, Oct 17, 2025 at 04:20:19AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8ulp-sim-lpav
> This block also contains QoS registers, General purpose registers, HIFI
> general purpose registers, and others.
>
> I am not sure whether need to add a syscon fallback here. dt maintainer may
> help comment.


syscon programming model is NOT compatible with this programming model.


If you need access to other registers (not covered by reset/MUX/clock APIs), you're going to have to either go

through a subsystem API or manually create a device link between SIM LPAV and your consumer and then use

something like dev_get_regmap().


Either way, you need to make sure that you're using the same lock for register access.


as for the interconnect QoS-related stuff: can't really comment on this as I haven't worked

with it, nor do I have an use case for it ATM. However, the binding does need to be complete so

suggestions in this regard would be much appreciated.


>
> Regards,
> Peng
