Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCA20E002
	for <linux-clk@vger.kernel.org>; Mon, 26 May 2025 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268419; cv=none; b=QHghgC05U0i0xjknl1OMlXcIlKFpzIJWmxdiOtvyne2R0mR0Qrfei0096uxOCA/cKuKs89U1neRNu3Wc6QhgcQUZBQzmeM7ufP9x90J0az64MRr7HN3+UelGfH89zNLTiPBAA3HKrz0H3VEB8z0zGQiq165mRedUSR6GGrKd+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268419; c=relaxed/simple;
	bh=QTeXWNX2iUXDBSxx5jGj9CcIe9hdPTaRCVCOms2e+b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjJvFhCmJWZduyzTYMEIt2zMGIoLUp7piUvpruxbsAeKn4nJ6LhG4s1otPOZaHJFHqDjT//+rdh3PEy5G0I5lqneSpzeQtn1OGd8AegkF6hTt7UeyRf0If7Gi1nN7LWlDJPAjoydGAzSkAPc41rAT5L8ekR4g9juvUIt0FMi5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NViilAsC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NViilAsC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36748920cso2349536f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 26 May 2025 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748268416; x=1748873216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUalJN5MUy3YAR3UhbDJtGyL6WBv2slh5mtlXFKO8b0=;
        b=NViilAsCn2xGDAq4FOPQ0O+rbmAKtR1y9M/EpUXRPhsLYuzOnc4Riy0hIuhq6t6l4A
         MVJiy9yv/Tbb/P6gBUY0AgLntktU9C83mf1QrpKce21ajCVDOwq56j4COXFgaN09dCo5
         +9QojH5rRaZ/3TA4K5UBIysnuAe+f4jkOUAPV6/WAdxHtv6EjPYZJPUfYw2e84qcu6yk
         VE3iErTgyIBThBWPVCQeb1PDqNKc1BfV/OGKXZeaA56HLtnjipmEh7LqoIu9Yh8Vpz7C
         n/FTweIowzD4V3cVmaFqDG627iheHLJkajisy2fjAA5QpnJ48+sMO2uCvCIip37F3jiJ
         nuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268416; x=1748873216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUalJN5MUy3YAR3UhbDJtGyL6WBv2slh5mtlXFKO8b0=;
        b=jS368/V+KFhCyu73APlSA+57JJd3yj+FYV3TF0ONq3B18m6xwf9ed8wzMcyKTtrN6V
         t2gS303JAQTBNE7/bIy7o4NXvXAHMYlHkrSB9X0WE9exs6pW8Ux2PW7nI8uQYlBwCqqe
         ThN0BuBkz8sFqskDRfCX2FWLxPpkTfeoA/aVzDMMtXQyvdsqMOKZLPalBYBpFVM/Eyy1
         2b189wIMktG5RsdWqhlMYnxvqplATZ0rFpTMybTYh6V8IiMrE4YRPfWyHvXOvSLGXRVI
         w7jYP+4DC7Zziigy/NO4wy2Vhs/vMvjCcq39fbA0k7R8GxKj4AQc7N96cG0wCM4zzz2O
         Atxg==
X-Forwarded-Encrypted: i=1; AJvYcCUlQrEE+e1aMmAnFWKA/DdZfN6EssSKnp5WW3IaaMp1wAjwR+jGomwyyS4j8hu1hqeMF0g24TsGnZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBmaMhJDrzBpb5Am/Tc0fBTkJv8RN2XJOnxOkUTjne5J1TbD0
	gIyVB/RlazTDhUqY8cTivz1oPgDzUbQWS/VR4fblHdvk8X/xBARDmfeCFrP/pV8LxuE=
X-Gm-Gg: ASbGncvo+9tG4zFy+txfVOqL8ejJ+mdA7D+q5wzYnjcml+8N0FKAGI/aSc0mWwocpE3
	cbmIBO80FbExpaxRSuejGgVvaWOylIXrNrlHno9qLpc77HEg9yNj5Gb+WEwc14630RT6QpjgK9o
	a+hguTncb/wQ336af3Yk41LWW5mDIQeeK1lcHMFy754LK3snvm7LQReO+YjXp2EVTw6lGszhFAf
	76ZrbdPRfGMpbIrtjFH0Tbmu+8CwUy1j6cRmaB+3xE+rNnpg8BUMU1smRtEF+SkUHUvjmR/f0+w
	Pygfdmu3J2eecM5QZ4zlv0zBdYFWyt38I1pGfNrHSqFL4GBkJGRY
X-Google-Smtp-Source: AGHT+IFn52fIeGag1IWUAYwZ0XrL+fmHEWUQ8gimnAH86GvLzi97W0zr1r99vIRe5MeCAnEzOnrUPA==
X-Received: by 2002:a05:6000:1886:b0:3a4:c909:ce2a with SMTP id ffacd0b85a97d-3a4cb489a8cmr7582347f8f.45.1748268415632;
        Mon, 26 May 2025 07:06:55 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4db284261sm2418574f8f.67.2025.05.26.07.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:06:55 -0700 (PDT)
Message-ID: <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
Date: Mon, 26 May 2025 16:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <aCIk40642nXZ3arz@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/2025 18:42, Andrea della Porta wrote:
> Hi Florian,
> 
> On 15:02 Mon 12 May     , Florian Fainelli wrote:
>> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta <andrea.porta@suse.com> wrote:
>>> Hi Florian, to accept the patches, what would work best for you?
>>>
>>> 1) Send only the relevant updated patches (maybe as an entirely new
>>> patchset with
>>>    only those specific patches)
>>
>> Only the updated patches work for me. I don't think there is that much coupling between the DT changes and the non-DT changes (other than without DT entries nothing is activated)
> 
> It's a little bit more involved than that:
> 
> - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
>    depends on 1 (clock binding header). Should be taken by Greg.

Greg gave an Acked-by so I think Florian is good to take that patch. Which 
leaves us to the clock patches (driver + dt-bindings).

> 
> - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
>    depends on 1 (clock binding header). Should be taken by Florian.
> 
> - Patch 4 (clock driver) depends on 1 (clock binding header) and
>    should be taken by Stephen.
> 

Steven reviewed the patches (driver + dt-binding) so he is waiting for a new 
version which addresses the review. He offered to either take them and provide a 
branch that Florian can merge into his branch or provide a Acked-by tag.

@Florian what would you prefer?

Regards,
Matthias

> So patches 6 and 1 are in common between Florian and Greg, while patch 1
> is in common between everyone in the pool.
> 
> If I uniquely assign the patches in common to one of you, the others
> won't be able to compile their own branch because they will be missing
> the dependent patch.
> 
> If, on the other hand, I duplicate common patches to each of you to
> make the kernel compile for veryone, you should remember that there
> will be conflicts due to duplicated patches among different trees
> down the merge path.
> 
> Any advice about how to proceed is appreciated.
> 
> Many thanks,
> Andrea
> 
>>
>> Florian

