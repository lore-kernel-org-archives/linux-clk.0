Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2909D2F90E0
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855070; cv=none; b=Sc6NkHYn0xcXvjX/qu5/iqpRxw9+eVdFPmVGxk4ZyWRTjjyFqSMckRTVa1mo2v4bOZ/cP6SoA/T6FduK6nrCFxbFEDX8+WTVXHni7U8C9b6YTplOcB7kuaN27yWmUhsBWuhi4CNS5cPLTGPfAmCYqf8DJxQbgHD3P+hinkw9L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855070; c=relaxed/simple;
	bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NWCZpIxfrij51CH7VKfvNpQ0jEaPNfGK5Nnydh/2Vg8+9nSxIkMDavGsmJWs/6GAn4mFaDbbbmjCbbG0krqFZl52VOA41N5k/lgMk63n9kwb/5zv1M3FrjFxXFpBuln6OCR90k/9tCJ+2X+mwycg08eSa1UFGc7xxHJPO4MaUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDnvbdt8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDnvbdt8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477775d3728so23154815e9.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762855066; x=1763459866; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=;
        b=BDnvbdt8iSYN6bxwCsU4EDmY1GHOAcYRVvz+U3H9jx3pABSMYfbGSx7e4UTi4huSV/
         9XAS5nzciGxhzKRcbEKMWqY5DRPjDJUgwdvYRLN7M9ysHRP5T0ne+Jt4qsaI1dnrQQQs
         C5bxL+UhfluxUWO+LOFXeJd8VX/plVfE9j1wkoezNcGqES3aGHlM5411aSH8u+lufGZe
         mEtoYElGp1glT+iVVOZ1hg+VERPjRBvSZ6sEwmhrgA4EkAen0N3m8wYOCnqTHvXuzr12
         XvHmxn2I45PzjZCems0cO1lnWf/UPp9ZVusRwI33NHkEJ8s79DkDJyj0XDDop8sjtWUr
         gyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762855066; x=1763459866;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=;
        b=C3lrVgBnwy01K1LqU9g6TIQDVXNfmsgdSAqYaR+1awfUOPfOVXbWqjekpI1U7aj7gF
         lUWhE2rKBjFV1Sdx8iA7X05C/OsKXUFUcis+Kh3uJUFvWs8+X+Nq3ikZiN/tZVntWFIC
         7ICDvtesrJAf/btljgZYdaNyyYJxmjWWWo0BrxfkOkJ4WZojJKyS1EKQHRqMzSYYZF4y
         0sbbvQEp0BkzvgwSrz+b11yCy5o5p2EBC/i214sijWazgzg0vYfOhV97H/mZk9Cp56GO
         u/5l9nV+HwsR3DRlCceIDP5SS4uE07EDulBdYPZcrnu4rl+DMNtINAaU6ZCbeO5Nbijb
         BqUw==
X-Forwarded-Encrypted: i=1; AJvYcCUAG0feOTCcdj+b0GBG/BEqbfdxIEiXVmDcb+uZ+gjusww2bwAnliyWeg8nNSZ81G+gMrFgvuDv8fM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC71sHzOZBNiAGgjCGQkO1QkWO96ff+5WcW2bsxj3YPMoiE3A/
	xA0AcFxbXD1beMTZEf0PB46E483sY5upw33SwThWyil3+Rb5qfOppu/EnHbXeHsTWa8=
X-Gm-Gg: ASbGncsl5cZv7fRDHbi8KuvqBXBgjf8viS5PFa+AvRwTWU1lWcQyJ9FxBEX6/+xASqR
	KCVs5EPN4GQ5AvJE6ISxO7TFuu+L9DmqY3V2p4qWxUe9OfqGN3BggSeff2j502LZ7bSZxoIy0S2
	jCayv3SXLd738r0af6GzipIcpGx5agMeWxnn86fjZsfHC7/nuCsviJaiUUEwBFHR+/gosTGvNlH
	Q3XZIxSRWk5n6D6nnYdn+3fhl9dV6eqZAYVp1Cm2mPzilMc03aLsdbP5zn0NlXG28au/4ZzU6kT
	4mh5Tzmrb1TMjptdLDCrawCmYhEZK2qY4UzTi7HgPPAXVlyo2EPYSjqdP9JWZ01PWHt9uE21iR6
	ErtWLgpyjhRXQTjKZD20n11dg4JkRv/HnHN2cY+3tNMounczF55FEsVaDZgreNO4H6to3C1SWsC
	MgBvTFeQ==
X-Google-Smtp-Source: AGHT+IFx1tQhYEcMAjmeDGusVpDAcsUi3ywSe54TVsoxYy0zvPtJEA10WARNrOByXA/spkwUzB6jqA==
X-Received: by 2002:a05:600c:1c08:b0:475:df91:de03 with SMTP id 5b1f17b1804b1-47773289066mr81723875e9.39.1762855066460;
        Tue, 11 Nov 2025 01:57:46 -0800 (PST)
Received: from draszik.lan ([212.129.83.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce211d8sm380577775e9.11.2025.11.11.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:57:45 -0800 (PST)
Message-ID: <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
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
Date: Tue, 11 Nov 2025 09:57:42 +0000
In-Reply-To: <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
		 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
	 <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI1LTExLTExIGF0IDA5OjU0ICswMDAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToK
PiBIaSBQZXRlciwKPiAKPiBPbiBNb24sIDIwMjUtMTEtMTAgYXQgMTQ6MjEgKzAwMDAsIFBldGVy
IEdyaWZmaW4gd3JvdGU6Cj4gPiBbLi4uXQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4g
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9nb29nbGUsZ3MxMDEt
Cj4gPiBjbG9jay55YW1sCj4gPiBpbmRleCAzMWUxMDZlZjkxM2RlYWQ5YTAzOGIzYjZkOGI0M2I5
NTA1ODdmNmFhLi41Y2U1YmE1MjMxMTBhZjNhMmE3NzQwYjhiYTI4ZTIyNzFjNzZiZGRiIDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2ds
ZSxnczEwMS1jbG9jay55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiA+IEBAIC01Miw2ICs1MiwxMSBA
QCBwcm9wZXJ0aWVzOgo+ID4gwqDCoCByZWc6Cj4gPiDCoMKgwqDCoCBtYXhJdGVtczogMQo+ID4g
wqAKPiA+ICvCoCBzYW1zdW5nLHN5c3JlZzoKPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiA+
ICvCoMKgwqDCoMKgIFBoYW5kbGUgdG8gc3lzdGVtIHJlZ2lzdGVycyBpbnRlcmZhY2UuCj4gPiAr
Cj4gPiDCoHJlcXVpcmVkOgo+ID4gwqDCoCAtIGNvbXBhdGlibGUKPiA+IMKgwqAgLSAiI2Nsb2Nr
LWNlbGxzIgo+ID4gQEAgLTE2Niw2ICsxNzEsMjIgQEAgYWxsT2Y6Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBjb25zdDogYnVzCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBj
b25zdDogaXAKPiA+IMKgCj4gPiArwqAgLSBpZjoKPiA+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6
Cj4gPiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGFpbnM6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1hcG0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtbWlzYwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWhzaTAKPiAKPiBTaG91bGRuJ3QgdGhpcyBi
ZSBnb29nbGUsZ3MxMDEtY211LWhzaTA/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBnb29nbGUsZ3MxMDEtY211LWhzaTIKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGdvb2dsZSxnczEwMS1jbXUtcGVyaWMwCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmljMQo+ID4gKwo+ID4gK8KgwqDCoCB0aGVuOgo+ID4g
K8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gPiArwqDCoMKgwqDCoMKgwqAgLSBzYW1zdW5nLHN5c3Jl
Zwo+IAo+IFRoZSBhYm92ZSBzdGlsbCBhbGxvd3MgKGJ1dCBkb2Vzbid0IGVuZm9yY2UpIHNhbXN1
bmcsc3lzcmVnIG9uIGNtdS10b3AuCj4gCj4gTWF5YmUgaXQnZCBiZSBiZXR0ZXIgdG8gaW52ZXJ0
IHRoZSB0ZXN0LCBhcyBjbXUtdG9wIGlzIHRoZSBvbmx5Cj4gb3V0bGllciwgYW5kIHRoZW4gdGhl
IGJpbmRpbmcgZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb3JlCj4gQ01VcyBhcmUg
YWRkZWQgKHVudGVzdGVkKToKPiAKPiDCoCAtIGlmOgo+IMKgwqDCoMKgwqAgcHJvcGVydGllczoK
PiDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiBnb29nbGUsZ3MxMDEtY211LXRvcAo+
IAo+IMKgwqDCoCB0aGVuOgo+IMKgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gwqDCoMKgwqDCoMKgwqAg
LSBzYW1zdW5nLHN5c3JlZwo+IAo+IMKgwqDCoCBlbHNlOgo+IMKgwqDCoMKgwqAgcHJvcGVydGll
czoKPiDCoMKgwqDCoMKgwqDCoCBzYW1zdW5nLHN5c3JlZzogZmFsc2UKCm9idmlvdXNseSB0aGVu
OiBhbmQgZWxzZTogY2FzZXMgc2hvdWxkIGJlIHN3YXBwZWQuCgpBLgo=

