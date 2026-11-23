Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428033;
	b=nmI/VovGlhbt1hNZVbkf5coIxfXOtWuh/tC/pNfhpw52PNV1jRwjhvIgneSnwRgAMH/Z
	 1Y32Gx7I+hRmPJxXQyh7XTJIOTExkxs/joff8N5D9jM1yCdQVLX8TInSWsm02t0Wzam5S
	 hh37bZHVwECS7Se4BISIV1Cw24qvVIBCSNUTDmbtP2XROuPhC0bKR8EvHK5xs0HpsWV3x
	 IbbipjZEqxsr4W+QlqZW4GQOtRzNiiIRWLpHe0WDRgzTq53nAP6vkMf8EVt3LI08ETgfq
	 hmy7AFtmSHhg/osG0q3JSatan6dQF+fW7MhaL828Zi1eX9Z1bWRWVo8O3lW3R/Ip5pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
	b=sEcQIN/+0npgpkV5V5EXJqbK4uWCVWV6r8yO0lJ6L/tiBqGNcTfBE/edGjqmYhp255hl
	 2oT6KzTcVLTWpeSEQvJxU4izLwZ58IdFcVlY6otPhrfCf6ShtDMHu05CzaoQ0Xqa4+cR+
	 A2wijEekDuxNvJESDgzVlA57CPiV8t/Ei41gs3x4yjgg9yu+bAH2aiZmEM7AZhXTYvj76
	 Fo1PPoF+FlID3ZDbBkmKHQiziZqhj6RkmeSLzhhp6YxYHJqneJAaNhguyFfcYvp07AyXR
	 3Wnjq342TDxQOY25HAhsO27roCU4VMJmoJRk1UK168Qv8iv2anTZSPIHnsS5cgqP3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F74D606A332
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 10:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F74D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso29103161fa.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795428031; x=1796032831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=T+WOyYceTAVbFlKECWT6WhONtRWVbafedKvFNN5EVsU19bdSBMmz1TLlii4nzDlrmE
         FoXvTiD4ZC6w1MC+mR8s1lwnzh9+ch96qkXZ5crHLMwdX/TrcHcWSH1IKMHbzd1x/+6F
         bXMOZS9bjkwE9knSNyffUMCeaZYte7F3GHuF6DdXnnrKw50mzxsUR9KMSsR3xHyPaKkt
         Xt1eHCfYpAP47AAR5tptR3WbXXWh3silLdfMPpfX4pUPawaXmWdXxG6uYX4EEASVn++/
         NhurnIgfMb1MwJd8vB1fbTwJey0V0CCWf4BrOg3MsEKL1gZ+9Qr1+XZytChByQZtdhK7
         +QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428031; x=1796032831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=HTKfFye3KbAyPr5RFg02i7Ik8pVc5bYxLofiCBZwT1jAiPH4sva8+vuDIJii1nJ5DZ
         popts12t8kURBx2oIIrmtnlvdwujiEOZBfe6rOHWvPAbXcxdPSoGhdFxhf+WUcUc9+Uw
         /160d0kjjBzkm3At6En9KuXl+G8ED5mVhPHJ7K3+z2hi5KJS874Zm3+Bgpj35VmYBEGq
         6/279I7p5s7YBjJ9DzUvvnrWqPUEWuaB8ApabQtC6qu5UqeLawpcYsZyaEpDB+Vw3cjw
         iNqx/zFyAzX7fDFcvluKxAfHzn+GJPZNw+iAjwKX6VdPy8F5w8XIZFZ5Sazzo9nHUweM
         i2EA==
X-Forwarded-Encrypted: i=1; AL+hErG3O1MEeRygx7OsAskDn9dxgwy61Jxhl/KR3VSDqDJdXy+WorKfk9us5rJLxY/MW7Qs4Ze8GplCcK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VUaGtP3vdvqirOLUHwtZgvakXbYDp0pxJhs+i+1zBpSYEXhm+
	9r3Je6NqGi8jnIy4IS/d1DlQ4Z+YD1lKWy8wwAEuSE+rSueImfLiXJICQDZyg2w+HCw=
X-Gm-Gg: AZFdTZfJ107EdJvKng/fdbb2X10nxs0pGYktRY90EOWspNKSV2LJ5wVlF42XB5uECl1
	oVdyPqfyAPJOEoCUOn8JRa8Fh5S4yp67aREChKhmkn7JQcH7qmKJl21Bp0E7bns8+Ki466L+pcz
	RRo2vtloIzmWyu+y6a8hQ4M8DCvHQ/qqb5bXNwPlAgfhtyNIjwfAxLqDreumE/Xq/I/Nblp3E/M
	zMi207Fb/StJ6I27okP7Cy/tw62uy5vFp636LLWddQqkUuA3RgGCXAkpqvCsDOBEtYZWPQf0+H5
	100EWbSDh6Wa6w3SdpoAx0/8BXCvxBBhhRrpTZcCElLS48IPO8gBgowi8wRrdWw7SOx3qhITd1h
	WVZ5Agi9Y4mU0e4QprWfc9HdWfzFStEaHVDd3VOjHe6zDa57SFNSGCyRjD8/vHZoqvk5lwANGbj
	cVw7EAT6Vg8w7hIHgkksVE0fqlUOAthb21m94jqq6+3Y8qOfFH82Dq6yfpC6neHqpJSnvAbsCrH
	2fc2mRXsCsQp4qUY4V5Hg5jYDQjcOXVNLsW7n99gVgvOHHzKyN1FbpHLrBn7TkW8ZRNKZTV6IuA
	ZIuZKRmLlEh7Yg0mUI96so0UyL1eBx3JAHA/zwc=
X-Received: by 2002:a2e:a886:0:b0:3a9:79d6:c792 with SMTP id 38308e7fff4ca-3ae7f9a0f16mr31993241fa.5.1795428031182;
        Mon, 23 Nov 2026 02:00:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8052992esm31044491fa.24.2026.11.23.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:00:30 -0800 (PST)
Message-ID: <d1fbf535-62e3-49af-8eea-eaa5649f8977@tuxon.dev>
Date: Mon, 23 Nov 2026 12:00:27 +0200
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
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
 "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
 <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 11/23/26 11:46, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: 23 November 2026 08:07
>> Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and critical resets for
>> s2idle
>>
>> Hi, Geert,
>>
>> Gentle ping.
>>
>> Thank you,
>> Claudiu
>>
>> On 10/19/26 15:25, Claudiu Beznea wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> When the system suspends to s2idle, any of the IP blocks may be in the
>>> wakeup path. For a device in the wakeup path, the generic PM domain
>>> (genpd) does not disable/enable its clocks across suspend/resume.
>>> Re-initializing the MSTOP bits for such a device leads to synchronous
>>> aborts when its registers are accessed for the first time after resume.
>>>
>>> In a suspend mode that is not controlled by firmware, power to the SoC
>>> is not lost, so the MSTOP and critical reset state is retained and
>>> does not need re-initialization in the first place. Skip it when
>>> pm_suspend_via_firmware() reports such a mode.
> 
> 
> Looks like a bug in clk driver. MSTOP is controlled by clk reference count.
> If clk ref count is 0, then MSTOP turned off.

Have you read the patch description? Here it is:

When the system suspends to s2idle, any of the IP blocks may be in the
wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
does not disable/enable its clocks across suspend/resume. Re-initializing
the MSTOP bits for such a device leads to synchronous aborts when its
registers are accessed for the first time after resume.

> 
> Suspend to idle. Critical clk is on, so there is no way critical clk ref count is 0
> and corresponding MSTOP is always in stand by state.

Didn't we already had this discussion here: 
https://lore.kernel.org/all/TY3PR01MB113460224F0225E29A7C5097C86982@TY3PR01MB11346.jpnprd01.prod.outlook.com/ 
?

Thank you,
Claudiu
