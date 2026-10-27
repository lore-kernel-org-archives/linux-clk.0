Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093248;
	b=lE0J8y7CMqiO3ZRr/UkBoTLNyEmxPOTUN9nAB9IGUzSxT5Jhme92wNjbSaC3Rinm0Yoy
	 m9jjSG2tKwAx8zEXbLCzyX1g7pSboKrQ5OX/ovnM/o9mFOQEODO0D2YXM1qejMoT2jmCo
	 1QafloATAm0AjzGqUNfws3aVB23kQDzAl6uaJNLR4hfFefxdXad7nM/z4zMhNmBwT4nX4
	 UACg5yBpOGiRjRlHttUTzgDUr+i+/TWV6pznGPtQtMtYcy/BijzT1L6yBI9cfCqqGGLYQ
	 FST5uwjG6l4eJkWrpsbjoo7h09SDbuMZx3wt5Lj464cv+aCdfypXZO0uzlYeAOueFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093248;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=riRj9RNrEy36BMxYlIOblwyBMW3s8IB91b8YQH9nCGU=;
	b=IWog7p0rOIhxnZvWqBy3j/DoefwLOBL/K68WzptgkeZ/cOq4JLsS2fj9DaTcWxJs6uUv
	 Xjdl89lpS5jpWFgm1G/d4e3FUzOOJ0HMZW/QR5oR+wci9AuF5oNUuu4CY366JnGFDfC4i
	 KKkVQK0qBBLyf2S+NGJCSFxa/9XGhoGFf+rtnHdZCnb5RuF7Gd/6ubGnddAZCFR9DUCaV
	 pN1ji0sxc/UHvs/4baF1Njfrdcd6fgbMV6sUqQalLAzlsORSFm8ft++ZFvQhl323xNoYf
	 Vg1ursVe0pFZaKi14Jjz2+jwhtoF9hldH07PNveavaO2nJ/+mZObDdo82i9ashoF6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=WqHaomUo;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FF606A330;
	Tue, 27 Oct 2026 09:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=WqHaomUo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793093242; bh=riRj9RNrEy36BMxYlIOblwyBMW3s8IB91b8YQH9nCGU=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=WqHaomUodamgpz7CyNNqD5vWQSLoTFQ+hX+M/JwNZw76uPaG8/IdaHQoLY7U2jAFB
	 z1dMZTvZvRHgu0M9khEt4DAG1dqbzeuk0zLQvDK6vHoY4jjn3ztReBWylQtH4F4aIC
	 FddMqfjC/QTi5YMeRQzpxSnbMGAZoO+18IZ+sbIE=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: MhgqsjsLyB9l9aOgt3vLBDm18n6n2brjY2Y6HQyYauMOflh7664EfFtmOeW2a9
	 Vpgrm6QXFa+tokpwpqre81Cx9f7l/DNWWD6HvfmSrhhcNbMRaE0+N9XznKOjsIyiO91T1/cVRiXJb
	 03lHUUnGAQL/7qH9uoyLfDB3B8fjJP4zew87jcnw0jkSYn7UOc0DfnFcj8n7hcOUj1Z26MBOVW0Xa
	 LpKgmh9alj0I3lIyrKwH1tWEJfwE1dvk3YB+qVFDGN5DJdp/e/Fc85hWbR65ER5IhhAfbSF2QwuA9
	 tmvgd6Wsl2DwmH9kRg0RWM0pR4ViMAh7DmPMIYsxrx6WilWbXAWLtURr1ySrW8ADYdeyKQCd9P+tM
	 2v0znIq06HBVY8ybdjJwDNIAgLMr3lgp4Fh1rq7eWSIBrIVHzqmCBFmhjzywqcm2Hk49NuqLBhSPV
	 xXrirXOc1Jd17FrHF/xG81jesdCPK0jAnR+xERTk8ZBchTqr151s9lQELGDoKehiXdwczdsCmYRr0
	 j2JsU8unxfjYx+FZuK48xwJK/AP0NoMqYVVBlR9VrakRTLBKvrTYUmUE4Q2xrNgtimJi4IOTq/+vv
	 rj+nbMsSr1vDtGNGT8zDLX/mYDBzcLIjEkj5v/T1pIOYVrJ8WRxukZ7izPjRv5mczAnlfBZXgnHNf
	 0qbJl37m02CM4+g8mq7xAnaHWI/CvKkVFuHxye/d19CqulVr6w7+8v4Axrupn/m7SPTy/cDX4x047
	 jwy8Clxn7pcPzuIKZ0PfWHIwdHVNI3SfP96NYzzza8H75AuD8VMFeZSVPfBu+Num908/g5PpclYYz
	 ij4Gkp9/PO/OImWC3Ql1cynGXuxtSEogySQ+GsmE8QLpK6jnDRKaiwPxN+2rLJjY9xQJpzaz9mGCU
	 MqdD11E3Q8XlluEc8yYFyt4QkcngmBN9vdqzbDnsgYVrNFAoRNClIJu3XeD26Np59gj0naWL7i38+
	 0lg1lfJVv976XYP7NZd4tngZUyEu5L9dTC3VVbuE5AUbUGbtTieXmbb2V/NEI0VdzfW0IrLHXHBqE
	 5SCEg5iNAINx5BoSp0K13EBEz16sNy/qFHEmtQqKws5nGbHg=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] clk: rockchip: Add internal support for 24-bit fractional dividers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 27 Oct 2026 17:27:20 +0800
X-Priority: 3
Message-ID: <tencent_02AEA981E64BA6264172642F200DD1CA0F05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <20261026-add-board-ok3572-c-clk-v3-2-dbabfa39d692@qq.com>
	<sashiko-outbox-186174@kernel.org>
In-Reply-To: <sashiko-outbox-186174@kernel.org>
X-QQ-mid: xmsezb41-0t1793093240tk4b7lyee

SGksCgo+IHdyb25nIG1hc2sgaW4gY2xrX2ZkX3YyX3NldF9yYXRlKCkgYW5kIHNoaWZ0IGlu
IHJlY2FsY19yYXRlKCkKClRoZSByZWdpc3RyYXRpb24gd3JhcHBlciBmaXhlcyBuc2hpZnQg
dG8gMCBhbmQgdXNlcyB0aGUgc2FtZSBsb3ctZmllbGQKd2lkdGggZm9yIGJvdGggdGhlIG51
bWVyYXRvciBhbmQgZGVub21pbmF0b3IuIEFsbCB0aHJlZSBSSzM1NzIgdXNlcnMKc3BlY2lm
eSAxNi1iaXQgbG93IGZpZWxkcyBhbmQgOC1iaXQgaGlnaCBmaWVsZHMuCgpDb25zZXF1ZW50
bHksIGZkLT5ubWFzayBpcyAweGZmZmYsIHNvIGJvdGggbG93LWZpZWxkIGV4dHJhY3Rpb25z
IHByb2R1Y2UKdGhlIGludGVuZGVkIHZhbHVlcy4gVGhlIGZpeGVkIHNoaWZ0IG9mIDE2IGlu
IHJlY2FsY19yYXRlKCkgYWxzbyBtYXRjaGVzCnRoaXMgbGF5b3V0LiBUaGUgcmVwb3J0ZWQg
aW5jb25zaXN0ZW5jaWVzIHdvdWxkIG1hdHRlciBmb3Igb3RoZXIgbGF5b3V0cywKd2hpY2gg
YXJlIG5vdCBjdXJyZW50bHkgdXNlZC4KCj4gYnJva2VuIHplcm8tYmFzZWQgY29tcGVuc2F0
aW9uIGluIGNsa19mZF92Ml9nZXRfZGl2aWRlcigpCgpJIGFncmVlIHRoYXQgc2NhbGluZyB0
aGUgYWxyZWFkeSBlbmNvZGVkIHZhbHVlcyB3b3VsZCBub3QgcHJlc2VydmUgdGhlCmRpdmlk
ZXIgcmF0aW8gd2l0aCBDTEtfRlJBQ19ESVZJREVSX1pFUk9fQkFTRUQgZW5hYmxlZC4gSG93
ZXZlciwgYWxsIHRocmVlCmN1cnJlbnQgdXNlcnMgcGFzcyBkaXZpZGVyIGZsYWdzIG9mIDAs
IHNvIG5laXRoZXIgdGhlIGRlY3JlbWVudCBub3IgdGhlCmNvcnJlc3BvbmRpbmcgaW5jcmVt
ZW50IGlzIGV4ZWN1dGVkLgoKVGhlcmUgYXJlIG5vIG90aGVyIGNhbGxlcnMgaW4gdGhpcyB0
cmVlLiBUaHVzLCBuZWl0aGVyIHJlcG9ydGVkIGlzc3VlIGlzCnRyaWdnZXJlZCBieSB0aGUg
ZXhpc3RpbmcgdXNlcnMgaW4gdGhpcyBzZXJpZXMuCgpUaGVyZWZvcmUsIEkgZG8gbm90IHBs
YW4gdG8gZml4IHRoZXNlIGlzc3VlcyBpbiB0aGlzIHBhdGNoIHNlcmllcy4KClRoYW5rcy4=

