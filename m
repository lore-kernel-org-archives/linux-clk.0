Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73627221738
	for <linux-clk@vger.kernel.org>; Sat, 22 Mar 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742653657; cv=none; b=TxT1pWh7P4CzqN1C+TCqnnN6+s/iTYmShiJSZPs1iuT7UtsQJPgBe5tVf4+bYkmUapVyDhPFjfScznOOgAUwBAffHfSodAg5tx3e+MLHzPFsKjR7FWVDeniGZqjfh5nSbCngtkn7pfUnEBVFFVkVexrMrFVsqfsPpXbM1ZTq6tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742653657; c=relaxed/simple;
	bh=wpCm+hqOG2wsbtPLPSsueiJdiduXYzbm2JN6/V7qei4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KA6+uf7P3MMc12sKihG6XLVmdMKY4KSdHglt5ky/Y1DODeaN2R81I/W0UjK0bOOj8PBsyWe46CAFfR1s1l7liVG/IBV/dDaR4Nv41VB8Eqsc8kdFk1VE9s75Qxq6VjB5vtMA7M03XgIR5Zk7pxuxH6wodY8g3np7nN0uRVyrnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kEHuW3fP; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kEHuW3fP"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so9607675ab.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Mar 2025 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742653654; x=1743258454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxLNYJpvB/TXLfXAqOdKhmy/q9FPbJFzYq67r8P8xbE=;
        b=kEHuW3fPfu726en3O8HTTUvD7b2bnYxF/E6T2FNNhZEAQqq986sLpeCS8/waNy+3zG
         i8iYZ2PYNQ9Hjh2I+ELvrGFjPj0IFPeajwjcn0HOCZKXnztsMyNGuUfW8ehxjjD9f4aT
         Cs1AlxPFtF/C4kOhyNl6zDvjeLKqmw+AjcybgoAJrXSM6vbNh68oTvND+XAjI4OuKnHQ
         6VIFiVJ/z0Hrq75nE72h7c/ePE/2+4XiSSfjanKyT1b7uV8QcHX7E5r27eXCXGEESv1/
         sKEuctf/5Dqj0Q7/lYfUTH7FKD1nqhQTBwaAN4ZUygR+BTE3LzJxrkdZPt4SF37nfGfz
         zwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742653654; x=1743258454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxLNYJpvB/TXLfXAqOdKhmy/q9FPbJFzYq67r8P8xbE=;
        b=D+RdKiv3mbbheytF9VUzniSmfUIGzrHvI566vZJRQQIhL7lFnJq0g3xo+WuWcdLMX3
         us/idHwwXxBwjsPwrcq0URiVwD3p+75BO87IepzTm4DOoUfJEsyEA85KHdylsLPD/WBy
         NvpaFOur1D/QkPmje4oKmRNQAD+0wJ08TyrAM/hrjrnoTnhd/GN9+VPKla4Yeb7kbXtM
         mGfRPagK8SKFFhaLOSeJceBmNtZHt2SIFDMN8jKMYvgYq+t3MxedHKDVyia5YHM6qTHO
         BsYR/iZ5HFUY9BNCF8Dl6kDVUk5kjqRRyJhVZM9UWuyxQTeqN6LKDkBB5Yxets0AYGQe
         XVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwdCDUpUyfAZYH7brkV9t14Tiie2qRTB9LJyr2bv9Ob+scaVMNTy0VGAqxfN17DdUPb2D5sxNOjus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8oWrav+cgaWavd6CCX5Xy0IL9GfCNuACfZ+JdqiDhAwwNVEI2
	W/nf2YcQp6QiHLA7ZW6cI0b0wU1aFRLXSwOO8SGM4SniySAiR6hSilSW5PB1SA3+zJET83z6PFA
	r33gEEQ==
X-Gm-Gg: ASbGnctUgl9nK9KErVjDO2S24Bg3I9tP0VexflM0pX+YxTsF9T4oIlkNJqUzLVAFs6C
	JvYWaEfTCUgX1VMvnAFvw7s9Ly8/UbFsLII02/0uGvBV3evkBUFnWNIoMT7JsfehIeJ6Quc//V0
	JYPww5YsqXboQcD3U2w7LHq1dqxaiuJKkOQzJNx7WARj/PhZ60fP3suI719ujvYMkfg5wbSLmd7
	Vx/syTJh5tOxM7D0GnVbaY9jpUrqKSr/CsqAIkYBoszuF0m26b5k6V0DIWfIVUlCyMcBHMoe6gE
	BnbH00YvSEcmlg4S1EdYLWhotbdr8OPyD0wLJBjA5ut433uFWt4DchDyi+VISuWvVYz/An/Y4G6
	BD/hE+i1O1Ou9DQJlJg==
X-Google-Smtp-Source: AGHT+IHxH2JRqswkpmkABiwFlVLWGLbm4QGv8PyCPkc/LYC5FudrlksXf1TKCySAHhTc+btPlG9CLg==
X-Received: by 2002:a05:6e02:2585:b0:3d0:235b:4810 with SMTP id e9e14a558f8ab-3d5960bf9b9mr82023985ab.2.1742653654335;
        Sat, 22 Mar 2025 07:27:34 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbecb453sm908223173.142.2025.03.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Mar 2025 07:27:33 -0700 (PDT)
Message-ID: <1d79fb7e-4501-4c62-8379-f00515dec3e4@riscstar.com>
Date: Sat, 22 Mar 2025 09:27:32 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-2-elder@riscstar.com> <20250321222546-GYA11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250321222546-GYA11633@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 5:25 PM, Yixun Lan wrote:
> hi Alex:
> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> There are additional SpacemiT syscon CCUs whose registers control both
>> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
>> previously, these will initially support only resets.  They do not
>> incorporate power domain functionality.
>>
>> Define the index values for resets associated with all SpacemiT K1
>> syscon nodes, including those with clocks already defined, as well as
>> the new ones (without clocks).
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>>   include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
>>   2 files changed, 143 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> index 07a6728e6f864..333c28e075b6c 100644
>> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> @@ -19,6 +19,9 @@ properties:
>>         - spacemit,k1-syscon-apbc
>>         - spacemit,k1-syscon-apmu
>>         - spacemit,k1-syscon-mpmu
>> +      - spacemit,k1-syscon-rcpu
>> +      - spacemit,k1-syscon-rcpu2
>> +      - spacemit,k1-syscon-apbc2
>>   
>>     reg:
>>       maxItems: 1

. . .

32
>> @@ -180,6 +184,60 @@
>>   #define CLK_TSEN_BUS		98
>>   #define CLK_IPC_AP2AUD_BUS	99
>>   
>> +/*	APBC resets	*/
>> +
> I'd also suggest to drop above blank line, keep style consistent
> with others in this file, some same below that I won't comment

OK, I'll fix the weird extra line and will drop these blank
lines as you suggest in v2.  I'll post another version after
Sunday.  I recognize the merge window means I can't expect
reviews during that time, but this code is waiting for the
clock code to get accepted anyway.

Thanks a lot.

					-Alex

>> +#define RST_UART0		0
>> +#define RST_UART2		1
>> +#define RST_UART3		2
>> +#define RST_UART4		3
>> +#define RST_UART5		4

. . .
