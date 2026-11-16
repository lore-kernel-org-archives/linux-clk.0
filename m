Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801655;
	b=4SUaMhsigZHpmFSopDRCGOxNpMG1lu3moMNzd99jBdXLfxInu6/zPotn+3w14Yn4eo4s
	 7QqOe1L7nkwR4UHzZvIxwyGDqWKBoAF53NDCmrcJ8F+AdGLs+oHOYssIU8H67Nx8mKbcD
	 AGvabktpNDDFqmZDKXIdUZPPQ0P3Y9vz/suCO+7vzoULDvDy01aZjjrx0jv7caPCbqq48
	 D0yXa7wiW5SRkgQry0VuFMcO3rHqRFYyS3wkaq3XJJ1DtYZLFjXBkb7lXSKtAVPC6z6rD
	 ZS2LyazdRi63mJOYb/WalHgyA4laKsPsbniCRX2d6SORc6VnwaumJnmuAYV8hysc51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801655;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=FpUz6VKa8cvlk6B0dGTvOD8cphJCOZqOzq+OFwLdeBs=;
	b=WZy52bHgMkw+B54+YhkXUfrh7q563FviPRAqUhdDihgjMK7X5NgDLgpXM/v0MUfNSggV
	 ndyqRlvKbUMDjMYmkFBKathmhryKVwJSwk0RizXGATS9VodMJVEPmJ35XNiqT3j3+Gl7D
	 p3AJmu7Fc4ezW8AtpGzUzisOGg3l1B+SmWAhQucFhrF8GnVHyYvXlXOk8VMw7t2mB71TH
	 ckgc7TeVyyhDP047IwU1wf3OG+IX9WWGDd0CmDtexxgg6rfa3zxEQ81F96G3jaycMeoxD
	 Xk2srs1hLuNNsOYeTDduhshVSPigVC5rPs/T1RmuYU29xMxYtvKsaFJ1l7WNrM6J52Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EzqouExK;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB5606A31C;
	Mon, 16 Nov 2026 04:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EzqouExK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FpUz6VKa8cvlk6B0dGTvOD8cphJCOZqOzq+OFwLdeBs=; b=E
	zqouExKnTvZUMVriMCOwD/uSYdsMP/czsL2DMfiu3JLeUS+3MZRXiGwWpx98Uf+d
	itu6wmCOwZusjspjo+JvlaPXSFRmtYsyQvwrQEYeUrJDQcjmiz5Ahj9cGNY/fbDW
	3hw0Pk3i/ffg5ErGR7V3nj/yP0CquYlMg9taPdK+/U=
Date: Mon, 16 Nov 2026 11:59:28 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Brian Masney" <masneyb@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Long Zhao" <longzhao@ambarella.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Subject: Re:Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <avReozTC_GEmfIxG@x1g10>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10> <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
X-NTES-SC: AL_Qu2SBvSbvk0t7iiZbOkdnUoTj+Y/XMK0uvwk1YdVc+MGpT/J9BIGcENYL0vb4v2JJgSKuzq3WhJU6vpweI9IrcCebcyksFrj0mpy8H3qeg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:lSgvCgBXl_egf_pqETJvAA--.5849W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gBh0mr6f6DTZgAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQnJpYW4sCgpBdCAyMDI2LTExLTExIDIwOjI1OjA3LCAiQnJpYW4gTWFzbmV5IiA8bWFzbmV5
YkBrZXJuZWwub3JnPiB3cm90ZToKPlNvIGhvdyBhYm91dCB0aGlzOgo+Cj4tIEhhdmUgTG9uZyBw
b3N0IGEgbmV3IHZlcnNpb24gdGhhdCBzcGxpdHMgb3V0IHRoZSBjcmVhdGlvbiBvZiB0aGUgbmV3
Cj4gIEtjb25maWcgc3ltYm9sIEFSQ0hfQU1CQVJFTExBIGludG8gaXQncyBvd24gcGF0Y2guIEkg
YXNzdW1lIEFybmQgY291bGQKPiAgcHJvdmlkZSBhbiBBQ0sgb24gdGhpcz8KPgo+LSBJIGNyZWF0
ZSBhbiBpbW11dGFibGUgYnJhbmNoIHRoYXQgY29udGFpbnMgdGhhdCB0aGUgdHdvIGR0LWJpbmRp
bmcKPiAgcGF0Y2hlcywgcGx1cyB0aGUgQVJDSF9BTUJBUkVMTEEgS2NvbmZpZyBwYXRjaC4KCkp1
c3QgY2hlY2tpbmcgaW4gLS0gdGhlcmUgaGFzbid0IGJlZW4gZnVydGhlciBmZWVkYmFjayBmcm9t
CkFybmQvS3J6eXN6dG9mIG9uIHRoZSBwbGFuIHlldC4KClNob3VsZCBJIGdvIGFoZWFkIGFuZCBw
cmVwYXJlIHRoYXQgc3BsaXQgZm9yIHYxMiwgb3IgaG9sZApvZmYgdW50aWwgQXJuZC9Lcnp5c3p0
b2YgY2hpbWUgaW4/CgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbw==
