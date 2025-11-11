Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D332FD1CB
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854892; cv=none; b=Y+DSiy4ivhSKn/ki0hQeVmDs1db2qdqbk5tokC5BvU4zoViWQmVuuAgIt+Rh1R00qFiiLtQRa1SKxbPXsZ/RZEnUCksbyxWebQJyhE1YsoscBDS7VhMTDTuxcrWh4WJP7KOTUdLeGwrLjyvVxxVLk67th7TyWYzhEa1w+wEPr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854892; c=relaxed/simple;
	bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiYJ9Jz4zw9gsJVSa2RvjYtgRwJGiJsZbbV1iKKBbTr1m8x6P6tjPZN0lE+JYAERUBwD82y4wn45XiI4yvqCUdlJpewQyPeflumzcpxAmQImXfV2jhW1FMyttwCPf8rDW6cNAnZ7bidsTjLTjxYNhtSbmKKfTeuJ3l+jkOIXfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ym8KapOs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ym8KapOs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b38de7940so1244608f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762854887; x=1763459687; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=ym8KapOsVxHOLEIhlQzSr7f9elIfVvtPF+8AvCZ9w+ClT/2RG3GqjRLjkcxVyHzJkB
         +ccC971wbyYcxhP3zBfHKoRjqPH/Jk7AmgQwFDwoaeqb6dTcMCJLbLVa+up872mMU2Cn
         cFMt+YJj+mDhuQz/SesSddZx71D0QvYUrZrktPuSy/kKbJmFtJsUJT9/Jq0/jRvTTTQ4
         jAUrLv8OPesW0TUeYqd55zZ9LJuddwYexg825eQPqZVSoz3QOPf+8WqDB3ipPIzrA2Ek
         LVn+o7tULAk8W6+9Avw4fbq5YFGTBvcZ6DwcVvCvQ8oprYSeWifcN11CVfunks9bvLrv
         +D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854887; x=1763459687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=PotLHEYlSIwUDSLKt01UCAGUfA47MiQjqLQfgFIAhbV/IBX0Vdslh30w06HwFbV+8y
         BuVgq+GNaRUwt7X6ZGeaY+Pc/bx+YKI7L9xWILZiA+P3J2dmOMuh/vZBjUjhneGxUuXK
         LnOmM5rGUxxnB+bFICV1pfDFRAXKwlcBCGv9rzZCdUfpo7vlCzCgMwHBqMG/dZn5rz7i
         2ZEO7FjWspTwPo90GJLle94Vr/p85+hjExt/qhS/BeoT/vAEpJyKHO8SmvMt9Cg2ORFH
         1Gzf9WU0KAGtPSjiJ12uALSt+lhEvkACkj9raQULyKFMwhEmdSQw3bpotDRg69jEed49
         gMLw==
X-Forwarded-Encrypted: i=1; AJvYcCXpxTM7SZEAY3Tmds7vRubIx/tX/NGMmd+IriTPCieE2MJ3GTxjPFdj2t0x7xO41mPNz7A1d++p8Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7gJSjQoMU4glEXIkQBoz3KwNhtZeb/kihn6RBTB3zWvlhOg6Q
	uoc72nN101BSj7S4J3JRUijihiDTDn+fdt6jCMn2XQfqIQ2/5WHbi3yKsaJNDvuLJAs=
X-Gm-Gg: ASbGnct4SJRaYvsGYGgUIzMfC6gOSKRTzKoqvn8WTVufshKTBXKZC20JAHwA4LVKGO/
	N117iJEidjwWZHHOljvVKwcGpNBzRsLbML3jBMeA6d3aFdaYSTzMF1IpSp57CJ1AyvOIkd852Pg
	e0oxBZ2ssLuh8d91CnmUXL3GO9f88L+EIq/VdrMG/wkNZ6Fbxopc7eoJKi06NpwmjMQgd0zauM7
	deSz2Y9GHb7ib2oA9V8v0xHZCe0qmSl4P/qK0qnUe0JBX6xEnJ4WIFjBKXlSyfOfn8f7T7sn8U3
	FIFGT8rRYFFFX8SuntqJmUp5G22HvxEUCXzJCUeeE9xud3EUNjCfi/woMolm3TTRrr4Zi9DL6bb
	UjprTqwEZHpNLC8C31/VMAy0XJNj4YZHQFfo9f/JVApV4EkxT51JVJU5mdwxYVXOpCgQzRUGS/S
	aHv9aj5D/L6Ajjpw3RkoFgbkLxpUE=
X-Google-Smtp-Source: AGHT+IHvLNA4fOeh9HdXCHeE6agVf5WRmWl1BvXGsAPsjjhtMFCdo+PVgS0jTmWpuz3ipwTVliR8Gw==
X-Received: by 2002:a05:6000:2211:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42b4081cff2mr3938949f8f.35.1762854887062;
        Tue, 11 Nov 2025 01:54:47 -0800 (PST)
Received: from draszik.lan ([212.129.83.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm28207462f8f.46.2025.11.11.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:54:46 -0800 (PST)
Message-ID: <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Tue, 11 Nov 2025 09:54:42 +0000
In-Reply-To: <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
	 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgUGV0ZXIsCgpPbiBNb24sIDIwMjUtMTEtMTAgYXQgMTQ6MjEgKzAwMDAsIFBldGVyIEdyaWZm
aW4gd3JvdGU6Cj4gWy4uLl0KPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS0KPiBjbG9jay55YW1sCj4g
aW5kZXggMzFlMTA2ZWY5MTNkZWFkOWEwMzhiM2I2ZDhiNDNiOTUwNTg3ZjZhYS4uNWNlNWJhNTIz
MTEwYWYzYTJhNzc0MGI4YmEyOGUyMjcxYzc2YmRkYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAx
LWNsb2NrLnlhbWwKPiBAQCAtNTIsNiArNTIsMTEgQEAgcHJvcGVydGllczoKPiDCoMKgIHJlZzoK
PiDCoMKgwqDCoCBtYXhJdGVtczogMQo+IMKgCj4gK8KgIHNhbXN1bmcsc3lzcmVnOgo+ICvCoMKg
wqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ICvCoMKg
wqAgZGVzY3JpcHRpb246Cj4gK8KgwqDCoMKgwqAgUGhhbmRsZSB0byBzeXN0ZW0gcmVnaXN0ZXJz
IGludGVyZmFjZS4KPiArCj4gwqByZXF1aXJlZDoKPiDCoMKgIC0gY29tcGF0aWJsZQo+IMKgwqAg
LSAiI2Nsb2NrLWNlbGxzIgo+IEBAIC0xNjYsNiArMTcxLDIyIEBAIGFsbE9mOgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBidXMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBjb25zdDogaXAKPiDCoAo+ICvCoCAtIGlmOgo+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4g
K8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtYXBtCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1taXNjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZ29vZ2xlLGdzMTAxLWhzaTAKClNob3VsZG4ndCB0aGlzIGJlIGdvb2dsZSxnczEwMS1jbXUt
aHNpMD8KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1o
c2kyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1wZXJp
YzAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmlj
MQo+ICsKPiArwqDCoMKgIHRoZW46Cj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gK8KgwqDCoMKg
wqDCoMKgIC0gc2Ftc3VuZyxzeXNyZWcKClRoZSBhYm92ZSBzdGlsbCBhbGxvd3MgKGJ1dCBkb2Vz
bid0IGVuZm9yY2UpIHNhbXN1bmcsc3lzcmVnIG9uIGNtdS10b3AuCgpNYXliZSBpdCdkIGJlIGJl
dHRlciB0byBpbnZlcnQgdGhlIHRlc3QsIGFzIGNtdS10b3AgaXMgdGhlIG9ubHkKb3V0bGllciwg
YW5kIHRoZW4gdGhlIGJpbmRpbmcgZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb3Jl
CkNNVXMgYXJlIGFkZGVkICh1bnRlc3RlZCk6CgogIC0gaWY6CiAgICAgIHByb3BlcnRpZXM6CiAg
ICAgICAgY29tcGF0aWJsZToKICAgICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICBjb25zdDog
Z29vZ2xlLGdzMTAxLWNtdS10b3AKCiAgICB0aGVuOgogICAgICByZXF1aXJlZDoKICAgICAgICAt
IHNhbXN1bmcsc3lzcmVnCgogICAgZWxzZToKICAgICAgcHJvcGVydGllczoKICAgICAgICBzYW1z
dW5nLHN5c3JlZzogZmFsc2UKCgpDaGVlcnMsCkFuZHJlJwo=

