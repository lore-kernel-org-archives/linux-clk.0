Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194791B1D4C
	for <linux-clk@vger.kernel.org>; Mon,  9 Sep 2024 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871836; cv=none; b=s1J756ZnGQYVX2YQvYP09QR5gV4No03LZKtuU//SpDp8K6TeE8s/+xYHXziSGZfc5PqQGI+Zeo/QWRujl9AkMVLqa3489NZA3VI9i9nlpzzX+rd78n1OvMGuLasas663HbD0KAQGTZHUl/gnw9O6SeEKV8wP5bw0nwlI9KJ4tzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871836; c=relaxed/simple;
	bh=VZJQioiDG6vZFQVLT3tLwBSGJZWN/LfrxwoKZ9E2niA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eCicAkCTFed8M6LI67pP4ItLuXlDIckqrH1NYDPkGSLheTmocbETlG2rxdSLv0kHMEf2pOP54YldQnHFeDAt7NncsinaelKjuTbTnokltiUXX6w/TveiyzBHhpM2pUdK6gN2ZOHB0M/um/0KpdYwfQ9QLCyXMYc30u3VBUwKyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wqShyPQa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wqShyPQa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so2360145e9.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2024 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725871832; x=1726476632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZJQioiDG6vZFQVLT3tLwBSGJZWN/LfrxwoKZ9E2niA=;
        b=wqShyPQastcLvBRUP1V8H9BZQq1SoHCObSTOOJKOW+UMteg9cUDSAQ233RGajlyp+5
         CtVTS7pnqQU67lpk6CrQWbTnl8zDVWcf0UTygRTPgm7ZJs2S349H9nwPqwQkJGZRTt8B
         TXyFqE+4TEYSu6TpE7A9IxwT/2DxxSJBOxwwiammRwKUaZ/gUBQvK78KXDjqRt3g7ecg
         /K53zXt5ZU4ocge/mkEPX8hFwNYgYK2fLKYl/kNQQqKVmMpPpPWVEXQlGbtqQrSdRg38
         E5E3HVdTzfZxERoKezImfKfbOs8FoYsxD1eO6muVeW4Wkzfd16BLb5O15Wvf0NhAStxC
         oHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871832; x=1726476632;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZJQioiDG6vZFQVLT3tLwBSGJZWN/LfrxwoKZ9E2niA=;
        b=sUEaOsvwOuQDn/51pW7lawcLW9uQzgwvSATlynLcQejHv0xdl8jIVhv5H6/LOCa/a+
         XbqU2xqLC0kwTs9s9GwkMfih1aJ51E8G4zQtjnwK/7tKEs6h1zHRrmJAIN4ydDawdPR0
         d4eMc8OALr5l+lWjiyO3pOuUCIbQ4KgrUW8znYMVfE7naMce7Y8PXhrfTNKnX7jFLsln
         mjSPwF59UWxpReSUl7NxaOmAVs9TvpXUdSXt2OLf+H5pnxbsE7drLz2GNDBZBpDSZYgu
         08j7lnJv6A8qV5sHWtZPDfrc9cLfiffz+/dE2K2/bPxMu2ZZrW2emGjxZbmf78F+fypY
         B7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWDc94r9HyF68ol5SfoL82Li9qRRfxp7As0HbWJyfLvOG6EsvfiqYfxbvuJIPigkE/eZ30l8kgdSd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hZOwF1ZI3VFAfLWA+aEaVC0rrHqN3vXqOx5Wc4GjH1sjeDQ/
	jkQ5vdTz8pXfAszm+hNrHCADkPj4YwgaOt+/ouA7uOleJqE+iHyRzPSI/DaQh8o=
X-Google-Smtp-Source: AGHT+IEYu8WPZODx8ejAn+tDdBcHP1mOYbzIHeP/oTcvUPyjQNTIqE3O72WiYNlPU07xjDbs+OC6BA==
X-Received: by 2002:a5d:69cf:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-378895ca1a2mr7244471f8f.16.1725871831557;
        Mon, 09 Sep 2024 01:50:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956655f1sm5437292f8f.46.2024.09.09.01.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <a84c8ffb-8eda-434a-834c-a023563ac8cd@amlogic.com> (Chuan Liu's
	message of "Mon, 9 Sep 2024 16:46:35 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
	<1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
	<46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com>
	<1jmskhtgv1.fsf@starbuckisacylon.baylibre.com>
	<a84c8ffb-8eda-434a-834c-a023563ac8cd@amlogic.com>
Date: Mon, 09 Sep 2024 10:50:30 +0200
Message-ID: <1jikv5tdm1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uIDA5IFNlcCAyMDI0IGF0IDE2OjQ2LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6DQoNCj4gSGksIEplcm9tZToNCj4NCj4gwqDCoMKgIMKgwqDCoCBUaGFuayB5
b3UgZm9yIHlvdXIgbWV0aWN1bG91cyBleHBsYW5hdGlvbi4NCj4NCj4NCj4gT24gMjAyNC85Lzkg
MTU6NDAsIEplcm9tZSBCcnVuZXQgd3JvdGU6DQo+PiBbIEVYVEVSTkFMIEVNQUlMIF0NCj4+DQo+
PiBPbiBNb24gMDkgU2VwIDIwMjQgYXQgMDk6NTUsIENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9n
aWMuY29tPiB3cm90ZToNCj4+DQo+Pj4gU29ycnksIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB0
aGlzIG9uZS4gSXMgaXQgYmVjYXVzZSB5b3Ugc3VnZ2VzdCBrZWVwaW5nDQo+Pj4NCj4+PiAiKDEg
PDwgcGxsLT5mcmFjX21heCkiIGhlcmUsIGZvbGxvd2VkIGJ5ICJpZiIgdG8gZGV0ZXJtaW5lIHdo
ZXRoZXIgdG8gYXNzaWduDQo+Pj4NCj4+PiAicGxsLT5mcmFjX21heCI/DQo+Pj4NCj4+Pg0KPj4+
ICJ1bmxpa2VseSIgaXMgdXNlZCBoZXJlLiBNeSBpZGVhIGlzIHRoYXQgaXQgd2lsbCBiZSBwb3Nz
aWJsZSB0byBkZXRlcm1pbmUNCj4+PiB0aGUgdmFsdWUNCj4+Pg0KPj4+IG9mICJmcmFjX21heCIg
YXQgY29tcGlsZSB0aW1lLCB3aGljaCB3aWxsIHJlc3VsdCBpbiBvbmUgbGVzcyAiaWYiIGp1ZGdt
ZW50DQo+Pj4gYW5kDQo+Pj4NCj4+PiBzbGlnaHRseSBpbXByb3ZlIGRyaXZlIHBlcmZvcm1hbmNl
Lg0KPj4gSSdsbCByZXBocmFzZS4NCj4+DQo+PiBQbGVhc2UgZHJvcCB0aGUgJ3VubGlrZWx5KCkn
IGNhbGwuDQo+Pg0KPj4gWW91IG1heSBhZGQgdGhhdCA6DQo+PiAgICogaW4gYSBzZXBhcmF0ZSBj
aGFuZ2UNCj4+ICAgKiBpZiB5b3UgcmVhbGx5IHJlYWxseSB3aXNoIHRvDQo+PiAgICogaWYgeW91
IHByb3ZpZGUgcHJvZmlsaW5nIG51bWJlcnMgZm9yIHRoZSBkaWZmZXJlbnQgc3VwcG9ydGVkDQo+
PiAgICAgcGxhdGZvcm1zIGFuZCBQTExzLCBub3QganVzdCB0aGUgb25lIHRhcmdldGVkIGJ5IHRo
aXMgcGF0Y2hzZXQuDQo+DQo+DQo+IE9rYXksIFVuZGVyc3Rvb2QuIFNvIHlvdSBzdWdnZXN0IGxp
a2UgdGhpcz8NCg0KTm8uIGRyb3AgdGhlIGNhbGwgdG8gdW5saWtlbHkoKS4gS2VlcCB0aGUgcmVz
dC4gVGhhdCdzIGl0Lg0KDQo+DQo+IHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fcGxsX3BhcmFtc190
b19yYXRlKHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsKQ0KPiDCoHsNCj4gwqDCoMKgwqDC
oMKgwqAgdTY0IHJhdGUgPSAodTY0KXBhcmVudF9yYXRlICogbTsNCj4gK8KgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgZnJhY19tYXggPSAoMSA8PCBwbGwtPmZyYWMud2lkdGgpOw0KPg0KPiDCoMKg
wqDCoMKgwqDCoCBpZiAoZnJhYyAmJiBNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+ZnJhYykp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBmcmFjX3JhdGUgPSAodTY0
KXBhcmVudF9yYXRlICogZnJhYzsNCj4NCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmF0ZSArPSBESVZfUk9VTkRfVVBfVUxMKGZyYWNfcmF0ZSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoMSA8PCBwbGwtPmZyYWMud2lkdGgpKTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHBsbC0+ZnJhY19tYXgpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmcmFjX21heCA9IHBsbC0+ZnJhY19tYXg7DQo+ICsNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmF0ZSArPSBESVZfUk9VTkRfVVBfVUxMKGZyYWNfcmF0
ZSwgZnJhY19tYXgpOw0KPg0KPg0KPiBJbiBteSBvcGluaW9uLCB0aGlzIGNoYW5nZSBzZWVtcyBt
b3JlIGxvZ2ljYWwsIGJ1dCB0aGUgYW1vdW50IG9mDQo+DQo+IGNoYW5nZSBpcyBsYXJnZXI/8J+Y
rg0KDQotLSANCkplcm9tZQ0K
