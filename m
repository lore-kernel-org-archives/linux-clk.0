Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1402472A6
	for <linux-clk@vger.kernel.org>; Sat, 30 Aug 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756553362; cv=none; b=gvV0d5/LcDBDcwrIPGqCGEjunfStVL7+CLttUdqIl3QgQSjR2imO4T8i/gxXk8Pe5LkJ8G//MEei7jod4JZPuEY8g17PXKpgie/vO3fAybcGIEmQbBcXmwio5c/o6PfbmS3xdOkbB+oXlnSCiBRiEqQBfchcNlblZefYVYVQZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756553362; c=relaxed/simple;
	bh=MEIKQClUViPg7Ze3mAk4LZ/4ncPdqmvZTMfe39UVozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+zDZ6o5OtWehze53Flkr5zPSDipJOIAQc7BO9r/9F8F5RSRE1pkWtQlUbKHOsBOPMtvMuSO7ESJ4xNBK7lU32RKHuOUPZJ8D5UGbxylspAI+inO+w4uCwbhM41ubTuDrlUigSpuUwv+jJSKobzTrA7cysZpUgendEil4AFgcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RyNjVKTn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RyNjVKTn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so6281245e9.0
        for <linux-clk@vger.kernel.org>; Sat, 30 Aug 2025 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756553359; x=1757158159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=RyNjVKTnnGL7uMc1i7QELhx7LXQnAa8swQMUZ5vakbxuDcmV7qQ2opUnApGP+KwiwH
         jUGv50dALnWI8Cz2EwFYTOZjyjkatadOEMYJUDKo3myedezXbWIatgdmkvo7eEJLr7mh
         CpwbYkMTpqiCQiU74d1KOrSbx1fxRj8iMAEzIASn12G3wApJh3KmQkcDcuYxOYL26Ai7
         Rx5Vb9gLmxXYeAvcFNYNGfO5eAaHd2e8mVXPXxOwgpeWyW7KFC3atD1nXiH6p9iM26X3
         kAW9HfatLRe2a/S6yU0DVMOEN3j6MY7MhduCtBSW4WsQ+Gn4ukV8UInp/3CZs0qKGNSe
         Js+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553359; x=1757158159;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=v/TLc7F1w7M/HwLPwMDmliVRH5vnu64s+xU0+E9ro4+p4ttn4V9/rOQVlv5RIH26ZZ
         AHEgOilHyNbuQjNWXKe3qzSJZqbap8YhWCnoJg6CVVdqv2bJEVlkbaWeJyd1z4NXaT5F
         XRMGNT8NSrUQi7t3yEnJjTU8XylCAzewLdSBhGwi/JciASHLphMF76Z75+LrRODjw+b+
         ihz9ZZ5SuiTSWndon1HjoKiBUidrp0SXswreiOQ2sixO1mg0pineFoarQHDdzXz0e+4n
         rqFlr83eiiIBBmiyhVxvu7TnEEoLxfO/pM8dN9HYZNmEvVVCXxQoL/fSxRQL8SRa237c
         x9jA==
X-Forwarded-Encrypted: i=1; AJvYcCUKWgi3DGqjH3EIwJ/goHXXq+yh29iIBd5kItzt+TO7bwphBjLVyxXWtPds0mJ0ncYp0Knk01IJGUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMOF4cCnWkPIUnoBXBT5xkCRo+QJBFIM18Bpihf6GHRFrjnRP
	gjs/jqan1shGXJ1Sf65mgg7OR61O9hIgN8REDcA4uA255L3DLNA9syz+0H1qiZ6Hvcg=
X-Gm-Gg: ASbGncvTrnz5dLE4CQzVwVXaJJz+8wcxUUHSZd57LEMOLveMSaFt6fvNr5ZIHe+2wuJ
	Vm0y5DH/lSZEg1PVr2/2aFhARrAMPBW+bQnObYBXuCL6k9AJXNuPo5qOdnOPJroC0FrzbEcRtaC
	omajc5iRrKaMfHwXIjVezFT2fJcp+Nd1T7Vpe7co6T5LHlQZl6EypzGgXUUIhrOECcDG8/XQWOo
	iU3ZnPTN7aQNWat8dgpEI5n+NjaYrw0Y8Nq4RvuqfBXQvxMsepawE9HGolsZneulvVT7PaFUjld
	va7KhwDnpKpeU3BCFw5AtxaH0tQuHU4ejBXROrx4Xj0tZcjjxjuyKqfEodiVzyDwpYZQLhdPmcJ
	p4cz0fx9uNWPuFa+GfCq8dQBmINOo/qc=
X-Google-Smtp-Source: AGHT+IH7PPaiMEqmOZP6nRGeQaHOVjXxgYPNKD9nk3y6xLqZS0hlG/uTqTLFCXog9cpjfTh7D6DADA==
X-Received: by 2002:a05:600c:a59c:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b8556a7b7mr7706855e9.12.1756553358753;
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm81613565e9.5.2025.08.30.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Message-ID: <785d826f-232c-482f-a54c-e6baad39f502@tuxon.dev>
Date: Sat, 30 Aug 2025 14:29:16 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1> <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aK2gE0CysSWisFwB@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 26.08.2025 14:52, Brian Masney wrote:
> Hi Claudiu,
> 
> On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
>> On 8/25/25 20:05, Brian Masney wrote:
>>> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> This series disables clocks that remain unused after resume.
>>>> This is necessary when the resume process is done with the help of the
>>>> bootloader, as the bootloader enables various clocks when returning from
>>>> resume.
>>>>
>>>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>>>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>>>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>>>
>>>> Testing was done on the RZ/G3S SMARC Carrier II board.
>>>
>>> Do you think that other boards would also benefit from this change? If
>>> so, what do you think about putting the call to register_pm_notifier()
>>> inside an __init block in clk.c so that this same change doesn't have to
>>> be implemented across various clk drivers?
>>
>> Yes, that was my other approach I was thinking about. I wanted to see how
>> other people consider this version.
>>
>>>
>>> Alternatively, if this is board specific, could this be fixed in the
>>> boot loader so that the clock that's not used by Linus is properly shut
>>> down on resume?
>>
>> As a result of your request I did some more investigations on my side, I can
>> say that, yes, in theory that could be also handled by bootloader.
>>
>> I can drop this and try to do it in bootloader, if any. Please let me know
>> if you still consider this (or the variant that implements it in a generic
>> way) necessary.
> 
> Personally I would go the route of fixing this in the bootloader for
> this particular platform.
> 
> If this issue affects other platforms, particularly across multiple
> SoC vendors, then I think it would be worthwhile to have a discussion
> about adding this functionality to the clk core.
> 

Could you please let us know if you prefer a mechanism like
clk_disable_unused() in Linux for resume path?

Thank you,
Claudiu
