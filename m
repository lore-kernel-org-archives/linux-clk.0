Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA483090D5
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762503628; cv=none; b=ZsGWFs8dNnmZskO3uYcPnun3KPDVGJNZYG72hfcBGUEcj0TZfrZawHf5iv+5I8mOfMJZyxiqsAa955VfGcYoj3yK1elePqB1V7ENd4pROkJO/OEVRTEU07vRh37AWkXDU4gCRkbly3e5FSw4ITSBTp4zWQTkwtEv8Kl4GubiLKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762503628; c=relaxed/simple;
	bh=gI7Fuup8i1amPEK0YbxklMM9F668JXoIpmY3C3wbz1w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQTgwgX3c3qvtOe/93/MaXLSdRQWXG4D/aY7gkZYBuLkPkxGXf8AzCu6uX7ZYdx3b79TIIsAl4fw7f8g+dpe1rHRAvFAXjmvMSnpSip0sE941NnPjyejlh2I8hQxoVjwhHj4nQBnPwMr7sRIwsnFCkD6W39BvrITRD61ZREYdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN+jDjtG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN+jDjtG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711b95226dso4172815e9.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503625; x=1763108425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vk1MffHR0aoVhf3k27Pk0Lpr77G2pGMlsaZ4lNRFHLQ=;
        b=KN+jDjtGpuSjebdC9tHtkw4+Fs+1jV1c+sZAHsBRfBt++dKygtma4OmUoNDqTWw8Jr
         kmKLmzGAr7Ap94QTl8WFlpphN8zi/+UhYMWkw7TAWmTVIZQmjVbweZm5deb037Dnud1P
         IZ+uB3fWsowVUaVKClU+cxi2BuLjG6+7d+9u75bumiCeV9ck5502uZnODbfzx1FlfKhT
         BuZjArNZTOPUdI1u7e/YTMIM+vCqcPeXPqQrzLwL/Rqc57KnE5ADme1es0aMVViPbKQt
         Kv6KTpMgffAqu+KvwLukU+h7HU16jUj0jroqQ5IjnWv+lHyfsG10XIm9P7G2l8QqSvOq
         luHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503625; x=1763108425;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk1MffHR0aoVhf3k27Pk0Lpr77G2pGMlsaZ4lNRFHLQ=;
        b=laLhNwkRkRUNQ1gvZGzdryzQbWEjYhLHiZVud9U8OL9qh8ctxDTcWeiG4AMGAhquru
         GNgyCbo0arP2lTXv/2klEAaOB24Zj0fjgLUsH6vMfYt0eeeJkisdnSW54kisGpSphBD0
         bALVOiCuiDOkrqiz/CKe+SKTqKgyyywBBePH3kPcAtmTU9NJyvaK77dJk53uPo/DMMgP
         89C8vJMnJSlXFhduoNUqBRH+pGM7fx+qkwty9hUMC7bHhCuTX3eUrs9f/oj6wKTQQlsB
         zKew469dvtVc+lDvBW99BbeSu4cBvsASsRKddE9qB42nGrrGSQ8ZscAzgpXxvH06RWwk
         W91w==
X-Forwarded-Encrypted: i=1; AJvYcCWcqEd84wRUpvwDy3Gz16YRf1bxK/n5LXdBgfXQ9/1a7NkhaNUwUqFkSv9wrJPe2CnfDnvOOgXSRFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVj0uY+grNTZhQndVm6OMSXHpH5Ewt5ZishoqGJIew62qD0UR
	NT5W2xNJykx3Gi4OKHpVDFXD0f++3iYdOco61u8aaM3CszLerQhIMESU
X-Gm-Gg: ASbGncs4NxjmFoaWSN53+l0GDDXCZ9Qg6MG/29HEhwy1lPe8Bs1pQI6f6sT7WPtKjWy
	nPBSukUDf5NlpCJtRhDjJcq5uxLeVeuNNVu5ml6Mx94zDmvSpmGXw/HVSJP2+Kc51wfpPBajGad
	O/pDqwtuPI7DkeNg/diz2ODtZMKR229X1PrM18yPjfA8l7dGrUFwhkJvBVt9sYiLYY7djHnqxb5
	HA1468TVhah8uQDyDzz4Tb/Y0pTtxO0LGPyPJ9yPM4LlEmV//DPQWGlK/zvoymwXB05JCnhNQTw
	Jzehzj3xDRof7TD3KPF4qD2U8hgrUmjjgYHntApvYoOU9QVp6GjQG/DVceECXUrbpJPmMHmorX4
	UyYSYw0Ks7rBzKYjcoCjG3/W17yRDYB55Vao72iD4xzSTdJN596BzbVUhF8wJzfunVs7eTb5qZv
	MsF2TZ4dSBI0mWDvtc5eiXTZpcHFyutn2NSc7d6Ds=
X-Google-Smtp-Source: AGHT+IEVLaEMFOvPeZc0Oi0rUOFMOQBnNHP+rsaefCysI5BwrUTSziTcZsuRefMyYxTThj9ZiHILoA==
X-Received: by 2002:a05:600c:4ba2:b0:477:4345:7c59 with SMTP id 5b1f17b1804b1-4776bcc9886mr12696425e9.40.1762503624631;
        Fri, 07 Nov 2025 00:20:24 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47767749916sm70627205e9.4.2025.11.07.00.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:20:24 -0800 (PST)
Message-ID: <690dabc8.7b0a0220.35db7d.1d97@mx.google.com>
X-Google-Original-Message-ID: <aQ2rxvM3JXcFbuaF@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 09:20:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
 <20251106195935.1767696-5-ansuelsmth@gmail.com>
 <20251107-fancy-premium-lynx-dc9bbd@kuoka>
 <690da391.5d0a0220.33eed5.80b7@mx.google.com>
 <ab520621-b11d-4763-a7b7-fe7dfafdca6c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab520621-b11d-4763-a7b7-fe7dfafdca6c@kernel.org>

On Fri, Nov 07, 2025 at 09:12:48AM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 08:45, Christian Marangi wrote:
> > On Fri, Nov 07, 2025 at 08:42:15AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Nov 06, 2025 at 08:59:31PM +0100, Christian Marangi wrote:
> >>> Document support for Airoha AN7583 clock based on the EN7523
> >>> clock schema.
> >>>
> >>> Add additional binding for additional clock and reset lines.
> >>>
> >>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> >>> ---
> >>>  .../bindings/clock/airoha,en7523-scu.yaml     |  5 +-
> >>>  include/dt-bindings/clock/en7523-clk.h        |  3 +
> >>>  .../dt-bindings/reset/airoha,an7583-reset.h   | 62 +++++++++++++++++++
> >>>  3 files changed, 69 insertions(+), 1 deletion(-)
> >>>  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> >>> index fe2c5c1baf43..2d53b96356c5 100644
> >>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> >>> @@ -30,6 +30,7 @@ properties:
> >>>    compatible:
> >>>      items:
> >>>        - enum:
> >>> +          - airoha,an7583-scu
> >>
> >> That's random order. Keep it sorted.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Hi Krzysztof,
> > 
> > I was also not cetrain on the correct order.
> 
> Why? The rule was expressed on mailing list many, many times and only
> Sunxi or maybe one more SoC does it differently.
> 
> > 
> > We have En7523 and en7581 and then An7583.
> > 
> > So should I put it at last following the number order or the
> > alphabetical order?
> All such lists or enumerations are ordered alphanumerically.
>

Ok so I think the proposed order follows alphanumerically order.

           - airoha,An7583-scu
           - airoha,En7523-scu
           - airoha,En7581-scu

Maybe the A vs E was confusing?

The confusion was if I should have ordered for the number

so

- en7523
- en7581
- an7583

or the normaly way

- an7583
- en7523
- en7581

But since it's alphanumerically, it should be correct.

-- 
	Ansuel
