Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3698C7E1
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742515563; cv=none; b=RwqSV0IV5Q3xxlfDcM2zKho37bXhTAnU8fAqQ0S4o0DSAm6nXG631vHumXBPZjFC/zfWasiYCk7+yYJ4Fu0BgrUjn6zGqF1DWLjfcrZGbIWxw67XY66v9riFFI07SmASa20QYbOEsGe5r5tf0xQ1YHEKSGh8y1TRBmxbfnaiB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742515563; c=relaxed/simple;
	bh=4f49NoS6Ua2AtL9jlFnIAyhaoPKsxkb9yMLM+0JPwKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcxmkyIUMHFUVutRVddgNunE+7pzhIWu+OZbjhdVTNBZ+lT3bALlNmP4tGAg/CjjyUXHX5S/1ybs/TyGdKQUAKyK8j8it+9uo0fCHOUj/Xfe12dIRpKvjZFeCsEVSTR946Pk/05d3uk0Ya+a9zjP6ePYccX7C0qey9zNVwaEvME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eJ+33smC; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eJ+33smC"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85db7a3da71so99173039f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742515559; x=1743120359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4TfadqjZ0j6MqAFYL1jRZZ+rK1DG5WpxhhztW2TPnw=;
        b=eJ+33smCVGN/OpGikNX/kc3IWU+asSq1neNaQ6GSnLCKBTlDiHhVPbzALfv892qyUh
         1jgcfqMO01t5Qzc7Qf8loUM8gWIleHUdxWuleLkb3tmtw5Sx45gUIoczFgrxeIFyhgRO
         8l+8VPVzZhqTjoskLXEpNQFSRWwVgkLTLMRtiMrzvelnLMZwnOJv90X84Yg3xleRoxSL
         89tFwZVGT80mCR8wUeGPoQ0WewS5RDc3ECKYAmdXssGq/ySPSoYAXQcfa1zv5HBckEbY
         uy3OpD3xDg7ZxBA+fLG/jcu15HFzLCuVndzqS4O9EAEcdKW1DI1bm82QI/ozWiwO1gKJ
         1JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742515559; x=1743120359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4TfadqjZ0j6MqAFYL1jRZZ+rK1DG5WpxhhztW2TPnw=;
        b=wDUFUuopDTI/dN+jNEocvgzkL4/kWJnlVGFaC+6PyXKpABr6NA/6Hzy49T50spickL
         AF9epHW8XMgBb7XGRphs9N4Y/jaMOUoolFxJ+LAElYpdP/Mbn1FlkmPgNkZYBgNYnCKs
         0e8x4/fpCD4jVesGArk/tyti88OjeXR5KP5OgYoMBhhDDoS/s0y7fNBzM5rGjpBGi2rk
         KXgOGYRNOrKr/3MMP+G0xfsgVOOJmNF+ULgFmEyqb5Mg6fiDYkXslbZmuB2njoXRtZF0
         TwdQkK0R3iLbTPL/oUJEJlAYisBHUY4K715QEHapQWAy9qegH0r8EoIvSYs3GTAXj+Nf
         73CA==
X-Forwarded-Encrypted: i=1; AJvYcCUAjASH2CxFdEkD5D6+v9FJ+1kwKqUbAUmzfTGJvseVDGXiBau6vInNgpU4kEHWLCgVsD3Im3IQWVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgITk0hNX5U1L+7RS5gnEtLk+xD7inKxm0CXH2XMabzz+OuVA3
	MGaj2vCi/eVVvq3g5lH4gQQdWLcbYDjfpr1PSAHCgY7eq8U76jAeKXOB4857u2Y=
X-Gm-Gg: ASbGnct0+kye7BHmc18VlRVyApmgV2QaVd++UsTWtKZwrJ65S7CH8rek6HwjaX0RJ5m
	OleZOtu6hSPS7XKLN8lz6s8xBU0yOayixN6VgRCK+VnyAkyU396rg8FkpMD1gREtgObh/2FOIAs
	TmejWH0M4lbe2oJVKeJA06Z5dN1q7gB0FiNkqVFR9Dyoxcbaolbop20Dcd2sYvromLOwH5xib3U
	YPeNd85HI8cRBolQZ3HMbXCYwUnCd/7P7YNrgQLalv4AojoEYXrYQCaO8ewAh1sTHnauGprR3zB
	AlJVxPI4BIsGlOZSja1ll4VG5fKBYzJjJ/HSJAoqtVN5iHryIu/0+sJG///URwOq30oYQYZpeWa
	aKeocDRBmM0dmDss7h4/pRlgQqrgi
X-Google-Smtp-Source: AGHT+IGzFnEpgZCQdgtfV3+fVi3PtzjOuuJwDIrbNxEcjYjLjI8xkEowRotMUucCu+Yti4QqnIOtrA==
X-Received: by 2002:a05:6602:3f08:b0:85d:a5d3:618c with SMTP id ca18e2360f4ac-85e2cb59310mr109252739f.11.1742515559239;
        Thu, 20 Mar 2025 17:05:59 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbeb21b0sm167895173.115.2025.03.20.17.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 17:05:58 -0700 (PDT)
Message-ID: <fe26de4f-5593-4f34-a752-5fb051972c31@riscstar.com>
Date: Thu, 20 Mar 2025 19:05:57 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: spacemit: add K1 reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250320194449.510569-1-elder@riscstar.com>
 <20250320232128-GYA10498@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250320232128-GYA10498@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 6:21 PM, Yixun Lan wrote:
> Hi Alex:
> 
> Thanks for sending this patch series
> 
> Can you also CC spacemit mailing list: spacemit@lists.linux.dev
> it should be handled automaticlly in next 6.15-rc1 version as the
> MAINTAINERS file updated
> https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=4a0c4e723c94

Sorry about that.  I will copy it on my next version.

Are you asking me to RESEND this series with that addition?

					-Alex

> On 14:44 Thu 20 Mar     , Alex Elder wrote:
>> This series adds reset controller support for the SpacemiT K1 SoC.
>> It is based on Linux v6.14-rc1.
>>
>> It is built upon the clock controller driver that Haylen Chu
>> currently has out for review (currently at v5):
>>    https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/
>>
>> It also depends on two commits that will land in v6.15: 5728c92ae1123
>> ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
>> and 7ff4faba63571 ("pinctrl: spacemit: enable config option").
>>
> you can use b4 to handle patch dependency, and currently you may got
> linux.riscv.bot complaint, but may fix later
> https://github.com/linux-riscv/github-ci/issues/24
> 
>> The first patch adds three more system controller CCU nodes to those
>> implemented by the SpacemiT K1.  The second updates the existing clock
>> driver with a structure used for OF match data, allowing both clocks
>> and resets to be specified.  The third provides code that implements
>> reset functionality.  The fourth defines groups of reset controls
>> implemented by the CCUs that have alraady been defined.  The fifth
>> makes it possible for a CCU to be defined with resets but no clocks.
>> The sixth defines three new CCUs which define only resets.  And the
>> last patch defines these additional syscon nodes in "k1.dtsi".
>>
>> All of these patches are available here:
>>    https://github.com/riscstar/linux/tree/outgoing/reset-v1
>>
>> 					-Alex
>>
>> Alex Elder (7):
>>    dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>>    clk: spacemit: define struct k1_ccu_data
>>    clk: spacemit: add reset controller support
>>    clk: spacemit: define existing syscon resets
>>    clk: spacemit: make clocks optional
>>    clk: spacemit: define new syscons with only resets
>>    riscv: dts: spacemit: add reset support for the K1 SoC
>>
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>>   arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
>>   drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
>>   include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
>>   4 files changed, 539 insertions(+), 19 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> 

