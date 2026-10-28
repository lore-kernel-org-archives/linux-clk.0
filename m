Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191522;
	b=qGO4Od5rLw+4Gd4xHy1c1KSpUPU9VKhDQS1oPyE840Lhbmk9ESyJHXDpUPlFVd8bGvWe
	 JuCrTatf7QJJRgQtcwVEK5a8yk8zLmXwJVQJo++XQB/Fhre1NGhB/mDXZlETOUs+q0Df/
	 P0+gsCx7OmfXqUmHFn1WvH4pa1QW+sLsOcWtG/1ymQAFznE6cp4dTEJH+PD2XfYSLtHFx
	 an2heuSMJPPKR85fLtxI11lJssXYOUp5LstEsJv/WtpJCgoqUZ16ArsakqyccvjyZDb7N
	 sstTA+EDVElX6sSgHwQJ+zdgtLfp2Ed7yq27QfWbo/d41+CePAUDDkdLvbXl3jzoicg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
	b=pFVZj8zsxW58jLg6MDRbbRXvYlSQiAEkDiCFSDBO7lt0d4Ey343qfYg6+tOYyvfvC85D
	 2H+EGeC9nb2LxBMaYGG8Us9XMa6bYnwWEqvfYNPYvR8wiVCVkNyPpNCmsZGEZaXrf7iSA
	 +m5iQD9vBHaW/PBvOl+vm0tMxKnPd/4JIKdLn+t95OO5rRVYUiR8N7jz6OHELhckTwV3W
	 4AXupjDzpEDWC4bJn41CD0W2xFXxFdiMJvpdx9lxdRc6inuDkWeY27vnCB+KGy1IRIQdH
	 Qc+2d2+vtDteX1NF9rpVQ1+Ir9y4QzUKe2hO62YBpPXJfkLi1W0Am7+93dwLCO35b0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE14606A323
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 12:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE14606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so771878f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793191520; x=1793796320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=kSmYo2IApQsaZVeoI/lHS65DndOvyRY8lt50GRCZmz/jWWH8qe4s7wo/zr2/zMpq25
         +sjQr/YIemSHfu6uSz39sV8QOjFvoudUeuFCrPfNICLHczUoyPJM2MMP2ZzljZ7g4y9C
         e2zu+Bti1OHmJlatzf5eQK5sXxZ3i0qUYaH+sDqEm4IIQ4Nk+kHHbcDLgsKMAjNiyB+/
         XHCS25+GfCpZiPYLwRPoWKFHsIs3BMbU1i6dviNOqXSCye9VVbinYsSDEBX24Qp54NKy
         2ZE+Gf+jUmLFXKEj1XKHO4ETJGGRqh51DtS3Fk31LWhkvIQvA1aIATIPsXPkaoqVeUIU
         2+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191520; x=1793796320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=DTvh3AopsOVn5ta2dJrQ00P1j0OUDcJ8HwgdpKZnlvVX2w+7VMJ+udHafVrlGribWo
         gVQEJ70sRaXZcJh2+syKGK6o/3cxgRI8GruGQvnfZ+6ferWNRJS2WaHEZcFyqbIKEEJ0
         xPNLQQDnDmOoCxC3EvltWD4VzaAMz4ezoB5YlCJMrxuRhO0RU/rJ/BEfNCEB/SaRviuz
         RbK26/GtE15HS7XgOMTFxoS1sBx1flbk/9nJZgqcqEMku8xn2/RPxJlj+i2j27mkaxUa
         CfhbKvwSuGwCrdTkLorTpJyVT33se2WujLeBDzdwEHZRTSceEyhHaUsKnzqrzNQxBNRs
         ydjA==
X-Forwarded-Encrypted: i=1; AKwUvBz5WI4Mbz2RmEpHSL4LRgDkpR2fLZEJXWNFctRXEtyczOA04LRF6k6AQhXZN1s3D/cw/V0QFpCHY+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4xlx49QJVT5+uk46YB/6dzw4w4uhJHwI0utF/RajWtCNfn4I3
	6nNBFcRxYub5tt+hrACRtT5YUYEtltEL5EG/J1wfa6vfOc8PeLGy386fJ93IFj8n5mk=
X-Gm-Gg: AYBFou0ZElTSyhYNkPu4YYo2dydRrszqh2vXyldF6iyfbh3EI3zMGU5ahTCLg/yxHEk
	uvfX0JiuCY4+sztFYh5xov/RAkH67dK55rw6ol2MXSzicewd0j36kUYjcoMAUeF6Im/LQVRqoWi
	3vCYWlDqCZBM0NnQDZDk7j22XBqSZQzI8eBshbG7jdRQb/z4oG8KGs3Pgil4dd7qpl2/dd00ly3
	90t60hiHB3SMImqEOrdKl6jOn/4JFwhxfOuU6DKQ5zcaeSP/5eHmSSSjsQGcv9e3W7VuqpUQgFW
	9yhiMmYzvx2vpoQXTUU4PRd7wEc0zUvoQrLM3w9U98P2ignmmPF42xr517XM8OJ1FZJeHXEBvul
	+LTBtDH++Z6RqJeahoKOePPx/AeqghAvF2t4BYfD+P70FPEe8IFdksOE/gwrFmSF/kPMd6mo2+t
	z1LqCrvq5n9m++dItpuSuBff5eU25niYlDar9u7NBnJQ2cvvYBZoYEfrXoujilXgftPQ1nDImwR
	cq33G44HnDTG//L69heRQPluMZCECriMII2ZLA+RaQ3NvVGfQ6trGxbNDDvCad+S++MEdhxgfsS
	C1Rz1OiFbJx4LfAqEWuqaFBH54QmuQQeddqTmw==
X-Received: by 2002:a05:600c:3510:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a96667dd75mr44218195e9.11.1793191519063;
        Wed, 28 Oct 2026 05:45:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm29772912f8f.28.2026.10.28.05.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <0602847f-4fef-49b6-a1eb-3240d7c1ecbc@tuxon.dev>
Date: Wed, 28 Oct 2026 14:45:15 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain
 in the restart handler
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
 <20241015164732.4085249-5-claudiu.beznea.uj@bp.renesas.com>
 <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/26 16:54, Andy Shevchenko wrote:
> On Tue, Oct 15, 2024 at 07:47:32PM +0300, Claudiu wrote:
>>
>> On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
>> this case, the watchdog device need to be powered on in
>> struct watchdog_ops::restart API. This can be done though
>> pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
>> device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
>> with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
>> watchdog device though pm_runtime_irq_safe().
>>
>> Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") pm_runtime_get_sync() was used in watchdog restart handler
>> (which is similar to pm_runtime_resume_and_get() except the later one
>> handles the runtime resume errors).
>>
>> Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") dropped the pm_runtime_get_sync() and replaced it with
>> clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
>> in genpd_runtime_resume() being called from atomic context. But
>> clk_prepare_enable() doesn't fit for this either (as reported by
>> Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
>> wait context warning as it is not written for this).
> 
>> Because the watchdog device is marked now as IRQ safe (though this patch)
> 
> ...which is complete hack and has to be avoided.
> 
> Can it be solved differently?

Can't tell ATM. This solution was suggested by Ulf.

> (Note, OMAP, for example, got patches in the past
> and become pm_runtime_irq_safe()-free.)

I'll look through it.

Thank you,
Claudiu

> 
>> the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
>> 1 for devices not registering an IRQ safe PM domain for watchdog (as the
>> watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
>> always-on), this being the case for RZ/G3S with old device trees and
>> the rest of the SoCs that use this driver, we can now drop also the
>> clk_prepare_enable() calls in restart handler and rely on
>> pm_runtime_resume_and_get().
> 
>> Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
>> watchdog restart handler.
> 

