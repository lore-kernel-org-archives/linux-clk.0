Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799061;
	b=wQLUTf8uLJom4ea7rL3RTdhVoi1+WNTGuzOHS3Pqn+0cYorFVdeBr95qkueOwwoDR05Q
	 Mb7N44G8nV8LjWCW+TRuez4fNiPGxT4985u/9PTZogMnkpvpQ0ja0crcbqIJmBzoMmmcC
	 kZeTwQNygj1QodtgM508F5R5dU3RT8Is3de91xotlZbWny/e6qli20FiexLQLlebhY8CC
	 t6azqnaIOmfvNWEEAqx/DuETT8C3yljleRTu4DzCBvYqlw40cCZwj4w9BxQX0dotCn02R
	 kWBdwEK0kgbJ8WgW0ktO73iFpJ/QS4y7ZJcAENYzi8jk4CqhWFqRyYZjyrt6pdfByWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799061;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=1Ydo/JFA5qxzni2gYLker+DXlrCuegpZ91spzV6zZE8=;
	b=vNTwCM6zgN93sir5lZOMPyhPpeFXgj6yVSy0GvJZ+US/yxv5mGF4XvrtxEqgjex9tk96
	 dd6v99UgLBd1Gir49GVtqINkmLgBQZbnrjeWbihQx3G0NswQR39P5hoj9CbbYQSzwlAEz
	 ZY1U8mlGXLjijd2FM8py2mbzdhkZeHfg4w5zcpv6Ab714GD2neyO/zgBoQCKFq9miCv8J
	 9QG1g7XcdJ0uniCkt6yBSzMsGn6sDUidyIBb7pVROJ0GACg/nVN84v8ixV474H9ylJfta
	 3fV4r4bGJX2XMBkgSYBPWE1Whi/K06IlXb3uKPqmGqAOyPfAf5Jw1Sf4AmT3R5wQFHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=w02h4Hdr;
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9C606A321;
	Mon, 16 Nov 2026 03:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=w02h4Hdr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794799054; bh=1Ydo/JFA5qxzni2gYLker+DXlrCuegpZ91spzV6zZE8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=w02h4HdrJ+UvGTrWnAfHNpRHXfyHVvt2WhihDVP869fYIb564lqenOtPJj7C6E5yB
	 QK+JMPZQA0Cw63M3c4KRJjkyciOqV0kS1xPKdspBc5qHGKFRGNSIslmJHaWEXUslhD
	 Pi6XdJLVMBq3mgSWXWlGv9z3K8Ca0vy5uSs636lA=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: OTkXlZHit/HD2ECOkNMUpes8JgqTDIrnl70ocTF10oUnzcXJddXHB8IPNghF2M
	 JHs400WfCpZeUssfdsYQd/c7h3L3LYYfnCRPV+X3YuVS/8S8eFX4wH/7S6tN2GZnKkaGo1tMKcA3e
	 NyGFphqRO+5RnMyHR29RtGVG8ST4RQgBvG4i8puzNz3i8tYEapvB24rIQhDyDUTMCs3GV4R4LD7cw
	 yTuq9t9T2CuV/VlV8vW/Vme/E4o7hDt6J+6HnmAPthlrC40NMLgV3Epr/IGGtiegRziuQmsNEsspl
	 Ze1CVKptd66VdpVLqDsMG6qotZNllafFC0EHsqaOKrlJl9cRbWUNgShd0oMSqu5p0SpBkuQyA1+P1
	 vuVY/OFE+p66Yv0px9wRlTy35WuuF/zAovV5TqyBlieIO63c36U/Q35TLmajQfcX/SkfT+8m9zfaC
	 vMOyC8DZnMvHNwAoOCWpwCUL5V5VKq2+KYLdZsSZCKkOhgrNVqQCbSEDE4WeNPGcCnp1RsAQkJb8J
	 vHHEGcNyAoVUc3w3y/i8iqFCwdhaeaPCQ9P9jyZztKpyR5MJTmKhagE60xs9Y+VlpwMMLicVefZmH
	 L/nXwsWP1JLFpblgK+HXuY9C/b4AsSuitvZXzNd5COYv6XCmEpNrdDPUYq8iAxLC2KA+is7TUJ5ck
	 cjLKdbl6YAjwGbYUBt1yAkGoH6owstvDJZm5I4dKDSBy9sAMenvlnSoXN0ukIl4cUTnK85iBV1O5z
	 bOxAkjBJvBoW2xVRsheWR9CbcyEjBJreUQOiRSn23BeypNvKC1cdJskR4IP5fcqFuDT6A0ZGS3o8s
	 EZaG+Clu38feonPN0W+0RQvFD+DkJ9drTX40ba0Bg+GWlO67W+1M61OlL/ej/Q1cnvRK2MAv9ejQB
	 vFrtr0K+wOyf2EnqPZ6EqAVz6OO+isn2wcEiL8Advqkq87CfkAIYYF8IqrQegaLsVMAOcos0CwsNY
	 60UC+MDUER7PAV1HHHxhJia4HxOHywop8LuEGyvEvhqm/M4xtQLvmq9pkopQsZe5wK8bPcXvWYtBo
	 MYgHtPwsT9u3NKQNFX8sqzsj9RFsanT56AQAzQBbXCJinzWE=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?UmljaGFyZCBDb2NocmFu?=" <richardcochran@gmail.com>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?UGhpbGlwcCBaYWJlbA==?=" <p.zabel@pengutronix.de>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?SmVyb21lIEJydW5ldA==?=" <jbrunet+clk@baylibre.com>, "=?utf-8?B?QnJpYW4gTWFzbmV5?=" <bmasney+clk@redhat.com>, "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, 
	"=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] clk: rockchip: Add internal support for 24-bit fractional dividers
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
Date: Mon, 16 Nov 2026 11:17:32 +0800
X-Priority: 3
Message-ID: <tencent_A76502128C463402C8115BFD549A4E69CE09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com>
 <20261030-add-board-ok3572-c-clk-v5-2-9a43403cb149@qq.com>
	<Yf6NfRPFTxKjDagKAm6hpw@sntech.de>
In-Reply-To: <Yf6NfRPFTxKjDagKAm6hpw@sntech.de>
X-QQ-mid: xmsezb41-0t1794799052treparxye

SGksCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJldmlldy4KCj4gPiBBZGQgYW4g
aW50ZXJuYWwgUm9ja2NoaXAgZnJhY3Rpb25hbC1kaXZpZGVyIGhlbHBlciBhbmQgY2xvY2sg
YnJhbmNoIHR5cGUKPiA+IGZvciB0aGlzIHJlZ2lzdGVyIGxheW91dC4gVGhpcyBwcm92aWRl
cyB0aGUgc3VwcG9ydCBuZWVkZWQgYnkgdGhlIFJLMzU3Mgo+ID4gYXVkaW8gZnJhY3Rpb25h
bCBjbG9ja3MuCj4KPiBQbGVhc2UgYWRkIGEgcGFyYWdyYXBoIGFib3V0IHRoZSAidjIiIG5h
bWluZy4KPiBJIGFzc3VtZSB0aGUgdjIgaXMgYSBSb2NrY2hpcCBuYW1pbmcsIGJlY2F1c2Ug
djEgd2FzIHRoZSBvdGhlciBvbmUgdGhhdAo+IGNvdWxkIHN0aWxsIGZpdCB0aGUgcmVndWxh
ciBmcmFuY3Rpb25hbCBkaXZpZGVyLgo+Cj4gPiArc3RhdGljIGlubGluZSB1MzIgY2xrX2Zk
X3YyX3JlYWRsKHN0cnVjdCBjbGtfZnJhY3Rpb25hbF9kaXZpZGVyX3YyICpmZCwKPiA+ICsg
ICB2b2lkIF9faW9tZW0gKnJlZykKPiA+ICt7Cj4gPiArIHJldHVybiByZWFkbChyZWcpOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgY2xrX2ZkX3YyX3dyaXRlbChz
dHJ1Y3QgY2xrX2ZyYWN0aW9uYWxfZGl2aWRlcl92MiAqZmQsCj4gPiArICAgICB2b2lkIF9f
aW9tZW0gKnJlZywgdTMyIHZhbCkKPiA+ICt7Cj4gPiArIHdyaXRlbCh2YWwsIHJlZyk7Cj4g
PiArfQo+Cj4gd2h5IGRvIHdlIGhhdmUgdGhvc2U/IFRoZXkgZG8gbm90IHNlcnZlIGFueSBw
dXJwb3NlIEkgY2FuIHNlZS4KPiBTbyBwbGVhc2UganVzdCB1c2UgcmVhZGwgYW5kIHdyaXRl
bCBkaXJlY3RseSBhdCB0aGUgYXBwcm9wcmlhdGUgcGxhY2VzLgo+Cj4gWy4uLl0KPgo+ID4g
KyBpZiAoZmQtPmZsYWdzICYgQ0xLX0ZSQUNfRElWSURFUl9aRVJPX0JBU0VEKSB7Cj4gPiAr
ICgqbSktLTsKPiA+ICsgKCpuKS0tOwo+ID4gKyB9Cj4KPiAuLi4gYmxhbmsgbGluZSBwbGVh
c2UgLi4uCj4KPiA+ICsgaWYgKCEqbSAmJiAhKGZkLT5mbGFncyAmIENMS19GUkFDX0RJVklE
RVJfWkVST19CQVNFRCkpCj4gPiArIHJldHVybiBjbGtfZmRfdjJfZ2V0X2xvd19yYXRlX2Rp
dmlkZXIoZmQsIHJhdGUsIHBhcmVudF9yYXRlLCBtLCBuKTsKPgo+IC4uLiBibGFuayBsaW5l
IHBsZWFzZSAuLi4KPgo+IFsuLi5dCj4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19v
cHMgY2xrX2ZyYWN0aW9uYWxfZGl2aWRlcl9vcHNfdjIgPSB7Cj4gPiArIC5yZWNhbGNfcmF0
ZSA9IGNsa19mZF92Ml9yZWNhbGNfcmF0ZSwKPiA+ICsgLmRldGVybWluZV9yYXRlID0gY2xr
X2ZkX3YyX2RldGVybWluZV9yYXRlLAo+ID4gKyAuc2V0X3JhdGUgPSBjbGtfZmRfdjJfc2V0
X3JhdGUsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IGNsa19odyAqY2xrX2h3
X3JlZ2lzdGVyX2ZyYWN0aW9uYWxfZGl2aWRlcl92MihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4K
PiBtYXliZSBhZGFwdCB0aGUgZnVuY3Rpb24gbmFtZS4KPiBGdW5jdGlvbiBhYm92ZSBhYmJy
ZXZpYXRlZCB0aGluZ3MgdG8KPgo+IGNsa19mZF92Ml9zb21ldGhpbmcsIHNvIG5hbWluZyB0
aGlzIGNsa19od19yZWdpc3Rlcl9mZF92MigpCj4gbWlnaHQgbWFrZSB0aGF0IGxpbmUgbGVz
cyB1bndpZWxkeT8KCkkgd2lsbCBmaXggdGhlc2UgaXNzdWVzIGluIHY2LgoKQmVzdCByZWdh
cmRzLApDdW5oYW8gTHUKCnB3LWJvdDogY3IK

