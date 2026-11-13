Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595425;
	b=PP0slriCTzlSGutKAy6PQMEH4kfv7cTmfqIqbWxQRqqptV+JaZCzJmXb9Uu+TyTP0MBx
	 yva5U8c4lH264RQPptej6ZT6wrwx8BWwIFMYiT06v+zYkeAkG9M8W6U0fLV2oKM/jWc/4
	 /8Hw4XIAPr2qEoQrGb57S0LtJ3rMYPO0aI5PnHlxH/kBvd+qXTGY8yul9BK4jwa0OTTbb
	 gBF5nRwdbbO8UbOktUqz1IF/bd3M2Y6QnFZSvxwcT8pQUXvcl+tHqamZML4EbVvCqZtp3
	 mSNNUpuAeWt/ElZwHl1ah3/iTyZlN/QefX82GIa8w/mvPboZ9A08B5esCh0CqON/xLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
	b=aO9PAyacBu4x/0MYIGR/ur0/qz31yCZy1kkQa+YP4hh8sBmc+B9andvsLxOBil4TeaRG
	 wwOUAZPnATQiBxgTHayzYzLbyVK1E49mcn4dKAk4aO9LI+LnDMIa4L5GJVkU6uwDddtQT
	 LUj5ZWibsGrIpDKpPnkSJ8HRV7jEYbHLaaO+sBWphC39CkwxTghJ+2huolAhmRt+OjTWu
	 3ixR9nBU/G4jwCPLUTrClB9fhr5n7vCC2+qPEYcQ5rCA7JorWaYjv80jleXz4a6qe+aPM
	 DqFPvOvxg41x+cYGBrLEQ/AWms67oF9uDfff3nBh4Kn/DbnDqr3vPNLNU2EksOh0/KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3F606BDEF
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF3F606BDEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e98798cbddso10596415ad.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595424; x=1795200224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=Kh7xgRb1QUKSAPrSkw9d5aIlc54rk65xgTssxlagqncf3mHLtIOy7FPS6tpXwVWRvO
         gB1XmzJJGAAGel5n9T7NXeEghD7gyFuku9yHizAKTRxYh4sP0nmem6wLMKIEnz/lL5C5
         T4/gTHkLlihdIp79czjJvLAeRhGS0IcU9scyERSXKhW3/U4yjaY2BBkhPy1wfI3+0Vkq
         XazFTO2s0RHn3w7AYA30fStEBSnw9lUt2y4DpoB68zDydqvkZ/ZdB0WJnxTOA4aF/XzB
         kABVT1/rwXQv6HzqOVVIpu/WW5CGmG2YWz/MMh4105NBKhGMHeG/zl3rkPJ7+oyxCMMP
         4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595424; x=1795200224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=dJC8PFjr2QHWksym2H2R9EQE9CAf42ssQbUa0WZ5lIByRbg2Ql9IM0RxtKl1g5HtQ9
         EcE756aLN45ihrt1rGmmkb+HotX4YN9vVklhGD8YvGygZ5KLG5EafRb2c/98xVdYckZx
         IBMGnzNl9RSJ46Nk0MIAuXZoXIMXToXBZBzZhbpL0ngL6qN+1uMq5tzXq99ycgZuF197
         f18zZPHkAbwOdIcsYHNKNEFyonZk8W43hTQf7Kb6b0PRaHbk9Yci++levA5u0BcDOl7c
         2vAU1FtnQOFHgXHw+KZhxloSVMl0VuVdxPG0lH5a1JaUokFcurRrZtm4s1t63rAmtcwC
         +vAg==
X-Forwarded-Encrypted: i=1; AL+hErEuUso4aUDEDmugzLhCgAGb7vCO9YRGNNkfZsqITlJQHHA8ivn7N0b08pKQ69lyBhoWpJ6mc+YMpII=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aqPyPOmr4zpUlSDTSwkkOgKG4Ma4WLOQLlIUnobzXLZ4V05Xi
	K3mTpTjBPwpsYOJCQaogiUoHlLt6SxQFlveNokSL13vYPNeM/BvblbdM
X-Gm-Gg: AYBFou0gvCQZv13UHRK8q3wBm/BEhFFjGeX53paIUrWY+wOcNBnP9Z1+b20P7LsGzqa
	pB/6yD4fL2JmOJnP/iKemO1EQZJ8mS+GbZyq9tgk2Om0CzA1NlJ/MGBwWzWT3b7Dus+NU91//A5
	S57xt0EBR/jHbqRHDx4bH53xMOuPUHSBl6pLFxQXYZFhqBvYZuysNeAC9mDdQNw/xZLThftxdmT
	r2aGyT045mvTieAnBNuSL6LImQCJCuhy+xsDzOctfuM8kmqNTdplgSbRZT9iBSzxSPnuSFyd8kB
	mN111LDuI/e6nsVoWN+r3PDy1al9Vln0pX/RbXFeVai1QcuwbkBkjCgXLVKtGjQO8lxu1B5961F
	9MrIYVNUBmet5kWDH3n1Uhmge1MAuhQGDtC0hX2alcsL4lpb+glpiQVBuJtP0qDPYcUBo/+nDkV
	798l/tij+NrIcME8DuSIFNZzHFWtydshbptEUlLMtN0aGPQFDt0bWCPRUn9cXqdB3Q34lFdowff
	0GoGuOBHRRVcWSlN6r2BG/50MbBs7JF22l1eECPRIbbb+2AQeM8QWbgzYRGSikuxO+qgWiBoALx
	BvO24B3Pn6tbvXlFLw4UEnIt93GvyZMWcl0kxPtnNYsXpWcIgDbx9fd8
X-Received: by 2002:a17:903:3d0d:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ee0de41b52mr35325395ad.15.1794595424503;
        Fri, 13 Nov 2026 10:43:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa14f7esm13391505ad.70.2026.11.13.10.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:43:43 -0800 (PST)
Message-ID: <e068c222-eec8-4dcc-bf7e-d91ae2ef175b@gmail.com>
Date: Fri, 13 Nov 2026 10:43:42 -0800
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
Subject: Re: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific
 callbacks
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113184210.470320-1-f.fainelli@gmail.com>
 <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:42, Florian Fainelli wrote:
> A generic MIPS kernel can select a platform SMP backend with direct IPI
> callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
> mailboxes, so generic IPI allocation would find no domain and BUG when
> more than one CPU is present.
> 
> Skip generic IPI initialization when neither selected send callback uses
> the generic implementation. Keep initialization when either callback
> uses generic IRQ IPIs, and retain the existing single-CPU shortcut.
> 
> Sashiko AI reported the XBurst integration issue; Codex assisted with
> the change and extracted-function/build checks.

Argh sorry I missed adding my Signed-off-by tag here..
-- 
Florian
