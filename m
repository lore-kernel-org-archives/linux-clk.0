Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099542DA753
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246943; cv=none; b=g4PSMIkPlcy/bfpwTLRrOXDtupbRChwAIndmuvQDpGfDne4Wp6xrLoD2YyfHTZQDE2jRMRqm/GZ6HzG1HehmunO0xMeOJCziN/q3z0WR/qRFCSgraeGQJIGO7+R62WbFwSjX2GOIRAn019f4oKhd7d20cXrzxg5C2rHhoOv3O1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246943; c=relaxed/simple;
	bh=Bqx7nYXPk7+x8RpONNnSG7vtyH7Y7MIyIgUrVtpA5Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZyg98OWO4Dk6hu55KTjfCQV6Z6ktKV/zBvaOTIBYwtsCn1Meki1XovfAJ0mq5ydnCp3dLhry8svFVq0Y91fUZIe8BNSc4Bxa+L3DsqbqOEO7Di5ZghMZOjQ/ATfxkBfH4+wyX+1r9eQpyYJ7XNExPmdfnapXHlqGdZEgG3n8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JgLjXdRv; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JgLjXdRv"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-875b52a09d1so152836739f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750246939; x=1750851739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=JgLjXdRvX24KVUIZOipvw3RiFGWCroYgATTFQU+u9keWi+oCec16z5kIi4aG+wl19b
         Jm7LRBDdcMHDIB7/krJmjP7ePerbhyP1jUWOvryEc9iflfLUqmd44GRhkFuqxZiynYP9
         fwh9wXH6RZ9OfKljjsZDr/5jNLSW06u+qw7MmbxQBao0R1ZTBpedH93jHACKxuFhOE4X
         l2OI1/i1c9YBEOhgSBq+CBhmhzgLVgNhgLBA/37tignahxFK2S1oh3IyGZXBRgllg52+
         uGlSXWXSxOtYb5m/fptPFpcYbPK06WlFrOMJP+P8NMX2naOgY7YgUNHFShJqqrTYsCZ6
         UP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246939; x=1750851739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=mSlV3unlxiOR4rYg6jd4kX/PebcdF7cnqx3fQpEuuKMQUUIakASFTOKgfEaGZ4/L41
         mfZSliUWjejIhN9oyG4hP/edH2ozy9sMm0bJKAu8/nDEfv2JYzDOL+8ffJAg8l174h4N
         BZq0jWSR5RQAF+K9pehjrvks7aooYaTT5WxTlS19vcbrREju48GoIDqxaUYwWHxOxKg1
         EpPBivGDgZ/U7+DhkBFahDHfVbePExO+FVoM4Mqhjk62OvizYKt9iou8fVRXM27PxKFM
         +pv5JaG9jOhKrQD/xhk6MZjrh0T2ccaxedy17WfDnofaBzISUL/+mg0Dga+ROpvMN/Fr
         ewHw==
X-Forwarded-Encrypted: i=1; AJvYcCWM/xWHJGjf3Vy1WUJuNgSoLvDd8Y7TRewvjcvpCALR/rkecFWAqpp9tH6L+c9oJnjOouiwG8ZWgaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzinbEeYmFti7uCLkbtBQNdQ3HcdJhTPUuhh273fXd7+wVXVzku
	56M2DHJdD82N3iDfQpkZc0dbwCHFM6wUkJ0llCkI08gI3lwyK684u4Vm19EENx71iQ0=
X-Gm-Gg: ASbGncszFe9G2xEu+7TVAbuGTx1QmbiC9sN/WJftqtPWwxS31p5GMvCRGxanRegorWM
	lIZuZnfmiHbvTlqk12Ooe1ehEPD95Z1IZXuF4hUeiYLiVf2V8fkfOk0nkws4ZPozNaDuqiedL/7
	hbD/lyaPn8Nr4d3oStqdeDbm+a2raIXE2GcMRBS5P0KHXq5QfFvaC5/DpkWmVvC/XW3VOBeB2JV
	Jc9vDMEZtrg4H6SMJBTV7yZgjqflEsLchaLhOQz6BBUySO+ub6BQkeqEZHXJeqJt4nlv1nEpjAZ
	9XSupS1Pc3FqJxTjf+WK46WgusHlJgNd57LduI006IdzHAXGGPUoYrUn7PXgmNxz4HK/bzyR2eE
	kOYR/59i0Xsqraiw1fsk9ZYahHQ==
X-Google-Smtp-Source: AGHT+IGZEcu6gwBAOkwxavLZ+RywP72ic1e+8WKzjWeayufFiBzYjvq43wkZd9VQN5U2/4NY0wJZaQ==
X-Received: by 2002:a05:6e02:2493:b0:3dd:ebb5:6382 with SMTP id e9e14a558f8ab-3de07c40cf8mr191072635ab.4.1750246939145;
        Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b9d9b0sm2675217173.38.2025.06.18.04.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:42:18 -0700 (PDT)
Message-ID: <5be51d5f-67cf-4e47-9bdd-e1e5956e184a@riscstar.com>
Date: Wed, 18 Jun 2025 06:42:17 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
 <20250618111935-GYA156140@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250618111935-GYA156140@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 6:19 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 21:44 Sat 14 Jun     , Alex Elder wrote:
>> On 6/12/25 8:11 PM, Alex Elder wrote:
>>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>>> device is an auxiliary device associated with a clock controller (CCU).
>>>
>>> This patch defines the reset controllers for the MPMU, APBC, and MPMU
>>> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
>>> and ACPB2 CCUs, which only define resets.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> v11: Redefined combined reset definitions into individual ones
>>
>> After I sent this, I realized the clocks use a different
>> naming convention for two of the PCIe symbols.  I think
>> reset should follow the same convention.
>>
>> Yixun if you accept this series, would you mind updating
>> these?
>>
>>     RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>>     RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
>>
>> (And similar changes for PCIE1 and PCIE2.)
>>
> sure, done, check here (let me know if I did wrong)
>   https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

Looks good to me.  Thank you.	-Alex

> 
>> Thank you.
>>
>> 					-Alex

