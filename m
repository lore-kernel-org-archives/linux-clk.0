Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047638E8B4;
	Sat, 17 Oct 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228148; cv=none; b=qf/et2b+UYnXhpA8NuXJR+520pXQq4tr0q6+1VvoKVitKrqtJPiXGgClI5pb+ai5trBFdKm54zOSWmG3MQXnAwGNxzHlbzqsZHgIP73coWEi6qHr+mWRsmcCis3sLk9Nwpg2LWF1lXKKridtEmzCHS48R+8i4yR/ZmLVfe1EvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228148; c=relaxed/simple;
	bh=h2xvXwXpH3oNPZ0br7VdFtxgQD2uo52DIxsxCJg5a5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uPDmHnZ/S6QnqG4AL0A/m9oWO9qKUqA4Mqq5koBqyEYDpY+96oDf35lvO3nRbAkLtAznAwFeCgZuarJH42aB9iAhnPIF5O5828u1I7wkZndajuEJlYpxwJv6LXoIvsFvyAK6/9r17TdaScDcPBbfAgff3ItFwFgbwVQBFUDQTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=OoDMX8fk; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="OoDMX8fk"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H98SSP0010786, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792228108; bh=h2xvXwXpH3oNPZ0br7VdFtxgQD2uo52DIxsxCJg5a5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OoDMX8fkWLzWJ4wWmtty6sXe9G2rAIVXsndHn56/PRbXrAhalQQMNtnQT7ujN78fB
	 n8CAY4YagfiqCf32S+1y34K5C4DOkIKIc8ayLbI8n63nIYU3PFlYNqkvZvTvVw2amv
	 f518eVlFNSJBYcZYQ8p6j+f8uTt9YclhWyb/jX8I+9oMahtFITBHDnVR86B5MLQ0Pq
	 L0vG/LW2hH4PHbETsFbpzQf1ZKg+LE0dHJgqUBZaORy6Q9VKhPCEU3ZieKeP8CSxRx
	 Qgh4qIePb/wzK20H9oLt6amks1CUzZ1mTG/eubCYYu3SyguISEMZyjdSV6DtU+TK75
	 FtcXP/p/JtpIQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H98SSP0010786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:08:27 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdUkHDeyAIvxzC6kidLKM4l0r/f7b1DaSAgAx7uAA=
Date: Sat, 17 Oct 2026 09:08:27 +0000
Message-ID: <cef1d6ec8329461dbf98e86e9594f103@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
 <179157057524.266328.2343186062671086748.b4-review@b4>
In-Reply-To: <179157057524.266328.2343186062671086748.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgY2xrX2dwdV9wYXJl
bnRzW10gPSB7InBsbF9ncHUiLCAiY2xrX3N5cyJ9Ow0KPiA+ICtzdGF0aWMgUlRLX0NMS19SRUdN
QVBfTVVYKGNsa19ncHUsIGNsa19ncHVfcGFyZW50cywNCj4gQ0xLX1NFVF9SQVRFX1BBUkVOVCB8
IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAw
eDI4LCAxMiwgMHgxKTsgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+ICtjbGtfdmVfcGFy
ZW50c1tdID0geyJwbGxfdm9kbWEiLCAiY2xrX3N5c2giLCAicGxsX3ZlMSIsICJwbGxfdmUyIn07
DQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX3ZlMSwgY2xrX3ZlX3BhcmVudHMs
DQo+IENMS19TRVRfUkFURV9QQVJFTlQgfCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgMHg0YywgMCwgMHgzKTsgc3RhdGljDQo+ID4gK1JUS19D
TEtfUkVHTUFQX01VWChjbGtfdmUyLCBjbGtfdmVfcGFyZW50cywgQ0xLX1NFVF9SQVRFX1BBUkVO
VA0KPiB8IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAweDRjLCAzLCAweDMpOyBzdGF0aWMNCj4gPiArUlRLX0NMS19SRUdNQVBfTVVYKGNsa192
ZTQsIGNsa192ZV9wYXJlbnRzLCBDTEtfU0VUX1JBVEVfUEFSRU5UDQo+IHwgQ0xLX1NFVF9SQVRF
X05PX1JFUEFSRU5ULA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4NGMsIDYsIDB4Myk7
IHN0YXRpYw0KPiA+ICtSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9taXNjLCAiY2xrX3N5cyIs
IENMS19JU19DUklUSUNBTCwgMHg1MCwgMCwNCj4gPiArMSk7DQo+IA0KPiBZb3UgYXJlIHVzaW5n
IHRoZSB1c2luZyB0aGUgb2xkIGdsb2JhbCBuYW1lcyBidXQgdGhlcmUgZG9lcyBub3Qgc2VlbSB0
byBiZSBhDQo+IGdvb2QgcmVhc29uIGZvciB0aGlzLiBZb3VyIGRyaXZlciBpcyBlbnRpcmVseSBz
dGF0aWMgc28gdGhlIGh3IGFyZSBrbm93biBhdA0KPiBjb21waWxlIHRpbWUgYW5kIHlvdSBjYW4g
dXNlIHRoZW0uIFVzZSAucGFyZW50X2h3cyBvciBwYXJlbnRfZGF0YSB3aGVuDQo+IGFwcHJvcHJp
YXRlLiBOb3QgcGFyZW50X25hbWVzIHBsZWFzZS4NCg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4N
Cg0KV2Ugd2lsbCByZW1vdmUgdGhlIG9sZCAnUlRLX0NMS19SRUdNQVBfR0FURSgpJyBhbmQgJ1JU
S19DTEtfUkVHTUFQX01VWCgpJw0KbWFjcm9zIGFuZCBpbnRyb2R1Y2UgbWFjcm9zLCB3aGljaCB1
c2UgJ0NMS19IV19JTklUX0hXKCknIHRvDQpkaXJlY3RseSByZWZlcmVuY2UgJy5wYXJlbnRfaHdz
JyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gc3RyaW5nIG5hbWVzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZ
dS1DaHVuDQo+IA0KPiAtLQ0KPiBKZXJvbWUNCg==
