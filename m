Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF651B142D;
	Wed, 23 Sep 2026 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142146; cv=none; b=tJoTRGDpvaOOekeSMPxPhfWWYjEj3s992mENokpK50uHBHWJy6czs7s4UMhIX79z2bwtEPOnVCqS/8ZvWwcovz6+sTrxbOjlpbtaXp4nfuI3/b96oS+WK5EFD8MreftmZ29XQkW1/Ovy+dp0Avo4xUiRxtYUA2apwp1qEzJ0TnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142146; c=relaxed/simple;
	bh=O7vLiErv27RUD70UUHBrWpEb96rWFJU+SsC9JHBfrLA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SwDK78O58Cw19CJ+qpDIQyKY5vLKuj554zPyz6DczwmBqLm+YUsgHvXVz4+Ua+xonHgjuWnn72kuBc3LHYMsh0Enzfx2Cpy0v6EU7Ne1wH/33UmItE0hV4MhPU9iRGpx6znoOv/yOkxo10uaVVq2nBgwesXox6UPDKiWoC62V70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=igGYhJC3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="igGYhJC3"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5g1P71095606, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142121; bh=O7vLiErv27RUD70UUHBrWpEb96rWFJU+SsC9JHBfrLA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=igGYhJC3fnM9NpG2Kyy7h4x/0diJcoDPsGqeRBJHlO6Dd8aprufTDtu5SQt8zpjN6
	 F06eWfjo/c7jnhtBejksv52s7dkgtm2KJUkCuaO/0zf3d5KnqNOX/HRqkfIagqwSzy
	 b8YpP7uxY8dnTSh9teYDt3WcxnsKxCek5TlBbmeDRo3K0XMYW5xLW2D9P4muiF3e4u
	 LXWMMH/X7KKyS9GpVeyQvD8l89GagWgFsjak/KnUj45YA/4mcHETZzoL0sO8t01zKW
	 PrnehLf/Epzy/UKKPtl55GR+4SP0xWBfAZsA8eIrdiNlpO7OaOXMHHSHhXOCTZq40F
	 bhKbNvRuTSyjQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5g1P71095606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:42:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:42:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:42:01 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
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
Subject: RE: [PATCH v14 07/11] clk: realtek: Add support for mux clock
Thread-Topic: [PATCH v14 07/11] clk: realtek: Add support for mux clock
Thread-Index: AQHdOeL/g/aJu9pvt06W4ewBENBGWbbPKKcAgAyf0hA=
Date: Wed, 23 Sep 2026 05:42:01 +0000
Message-ID: <0b1dd932101848b7ba18aba6ea2d5080@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-8-eleanor.lin@realtek.com>
 <178947683646.448573.8652586338644531668.b4-reply@b4>
In-Reply-To: <178947683646.448573.8652586338644531668.b4-reply@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyB1OCBydGtfY2xrX3JlZ21hcF9tdXhfZ2V0X3BhcmVu
dChzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsgICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9t
dXggKmNsa20gPSB0b19ydGtfY2xrX3JlZ21hcF9tdXgoaHcpOw0KPiA+ICsgICAgIHVuc2lnbmVk
IGludCBudW1fcGFyZW50cyA9IGNsa19od19nZXRfbnVtX3BhcmVudHMoaHcpOw0KPiA+ICsgICAg
IHUzMiB2YWw7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gcmVn
bWFwX3JlYWQoY2xrbS0+Y2xrci5yZWdtYXAsIGNsa20tPm11eF9vZnMsICZ2YWwpOw0KPiA+ICsg
ICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMHhmZjsNCj4gPiArDQo+ID4g
KyAgICAgdmFsID0gKHZhbCA+PiBjbGttLT5zaGlmdCkgJiBjbGttLT5tYXNrOw0KPiA+ICsNCj4g
PiArICAgICByZXR1cm4gdmFsID49IG51bV9wYXJlbnRzID8gMHhmZiA6IHZhbDsNCj4gDQo+IFRo
aXMgaXMgbm90IHJlYWxseSB1c2VmdWwsIHRoZSBjb3JlIGFscmVhZHkgcmVqZWN0cyB2YWwgPj0g
bnVtX3BhcmVudC4NCj4gU28gcmV0dXJuaW5nIGEgaGlnaGVyIG51bWJlciBjaGFuZ2VzIG5vdGhp
bmcgYXMgaXQgc3RhbmRzDQo+IA0KDQpXaWxsIGNoYW5nZSBpdCB0byAncmV0dXJuIHZhbDsnDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==
