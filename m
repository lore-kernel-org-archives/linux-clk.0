Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167642;
	b=y9N+CMQg5oWtyXS806hP8M7z47B8vGRtzHFj/l8ABJGGXdiyDo3svTHuz1kAclOjAZKx
	 3tuiVvV1HKyuZdnhd9A4bf9aUUyBtKrOnaaFlvRNgR4eOSny4fQ6ow+Rkl2ZM6+UwsrvZ
	 ffH5c9H5qyPiWcF2Vq4FMQOW+uy1tD4+9P6KPJxdL+hqi/t67g8LpRWBiI3bzMvNjNDRO
	 AX0gXMXBE/QMU+OI86mmhKrU1sDFN47S1cfWZ3GE58Uy5VOSupCQdW7kw5uRsNeIE+gaB
	 fAFAcv09ydi8V0mpR5Qp+geOkUoRwiq5tS4S8PcdEheiZcWwKJf9CGYIB/I+eA1IE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167642;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=FYDZTGaxRQkg6ye2y37LBZ7R/w35GWMR5g7vC5sJq90=;
	b=C5rx5RIOgjOUEyo/8YS/XdozzY+1P55LoJBT24eq3KZgSraY6SFqZChpna5XRSomlRR6
	 s1MdPuK6KJVoyYwbvsk5/pXPwZlXk4whfLF1WEW/Up9GdL9SEpjC1pnvblBLMEHhhsISR
	 aTKAY1QGskhzAdDzzSjAmM/biS3XaJhhGKloI8SI4288oKJbgoKdzTDGcrNtUojg4ZfMV
	 cQGMroIgBvvAYF9ycnw95mceWEqlpsA6RB1xODdux52mOI5aRPwhC8gtrY7J7GBl9Xajc
	 50QI3gZJ+HKojFb8oWCWIT9FZonhl3Xm8iO+H+onSlOol5NvT2PqrA4Bdkuaj9KIBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=oSr97Ei1;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550CA606A331;
	Fri, 20 Nov 2026 09:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=oSr97Ei1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795167629; bh=FYDZTGaxRQkg6ye2y37LBZ7R/w35GWMR5g7vC5sJq90=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=oSr97Ei13la3XAwmDA99AgXnUonx56cczMhNiwcJUmlax4sLs6n5Nli6FvZyBONMo
	 SDXJuOfFuv9G2bMkib6dFSovX2cjgtsOe/e2LpqU3ZlER68u6rL5qpIw9Ei7jTblHU
	 2lR7DdiWTzWxG94lx8Hom7FylzG5gyLF6CdIMjzQ=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: M/BhhHt976mJlz9cj1QS+sHBoY4gKMr0HT9qk0Ju/X9qGHRJoxbU6sekW+/tRR
	 fX3NkO49H2B6nMWAn74Wn4yTGfbgZRlh5TTkgP3nKSyAU9VtmO14+11NkoGeuPp7I8lhDlXmuEMNT
	 zWC/h0LlvTefphW/1H1PjEf3OtJSMdtFj7XDEbnY5Y0CjJPPAzFLQR7O0Cv1HWri07qydg1YVoD6x
	 0bNdln+QIDRl9mWWNPAX4MdVtB8t3LkwvaqJVtWnmfvsWXaEsfSqOHk1XaxovE93MtRfN1xBqy9qA
	 XSComPs4Qu6WPs44lPo5jtS4EejhYCiFp5pUUpBlnuCwh+WOBITT0CoVP/UJKkS28lKDhjlQxJ2p1
	 nZwSOshkwULKNxiVkrupQr6FkYkutE6mkC8LXvHSV8Ap60E07P9lfbRtdeYseA3cDZ8irYMg9bVnP
	 bXOvZlg3iceF63haGYmvL39lJh/QJjWmcO0lWk9To7pJfFDyhnSEAajOP0dB+jypiBb8gGQyrZ7Zp
	 4OrE/kxgq4TEcoPlB2C5KQAbaVZTI0AtYbo9ZGI82VY3GGTZcqbIQsOkuhN+jHyhNL5UeSY/lgPYf
	 BFz5fjbl4IKQYvUgneTtbk1h8kPMP45nxhLZLFiJ1tJcH5fndHha1v+wN0zOKvRhrBAIbQQfvxpJL
	 aOWpd2EefD2VU+xSe4DGyGgs5SkiUz/kyw8wAEhvuVYciFB6q/JiZee1wnuoHPfmbyg4WEWY18ezd
	 bTvxk7mVV+h273bD2hlh/daw8xoW96T9A5bVa+xNC1CFot16kDeaKWD8qR/FJuHzigAeRdQXZFV2q
	 /YMw6K2ANZOV9qFI2256UZ+JrAWTd7K6xCf8aHDH7q7AHitbwGB/ikHRIDGVrqKWqgH+KxmfaP/VN
	 gjM6/c43x62rtF9tNxiwg673PILsZO3MrRZoqLr8VDjGDY8omhQgASYFsudH+ur0XCEeFDWGO8aLv
	 292L81594Kr+dPfvw5kJzPHwubBfZp/Qch9vrG/aER3L3R0awUSPYhIDnF72HdVk6DoffKwaXQSGq
	 ENFssGVkf6+H/feoNyidI1BByoIZm9gisfX1o
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?Sm9uYXMgS2FybG1hbg==?=" <jonas@kwiboo.se>
Cc: "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?QnJpYW4gTWFzbmV5?=" <bmasney+clk@redhat.com>, "=?utf-8?B?SmVyb21lIEJydW5ldA==?=" <jbrunet+clk@baylibre.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?UGhpbGlwcCBaYWJlbA==?=" <p.zabel@pengutronix.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?UmljaGFyZCBDb2NocmFu?=" <richardcochran@gmail.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, 
	"=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
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
Date: Fri, 20 Nov 2026 17:40:26 +0800
X-Priority: 3
Message-ID: <tencent_BB5901AB88D47E874D0E348B32A609A92308@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
 <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
	<34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
In-Reply-To: <34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
X-QQ-mid: xmsezb41-0t1795167626tagk7ay80

SGkgSm9uYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LgoKPiBbLi4uXQo+ID4gKyNk
ZWZpbmUgUENMS19ERFJfTU9OIDUyNwo+ID4gKwo+ID4gKy8qIFNlY3VyZSBjbG9ja3MgKi8K
PiA+ICsjZGVmaW5lIEFDTEtfQ0NJIDYwMAo+ID4gKyNkZWZpbmUgU0NMS19ERFIgNjAxCj4g
PiArI2RlZmluZSBDTEtfU1RJTUVSMF9ST09UIDYwMgo+ID4gKyNkZWZpbmUgUENMS19TRUNV
UkVfUyA2MDMKPiA+ICsjZGVmaW5lIEhDTEtfU0VDVVJFX1MgNjA0Cj4gPiArI2RlZmluZSBB
Q0xLX1NFQ1VSRV9TIDYwNQo+ID4gKyNkZWZpbmUgQ0xLX1BLQV9DUllQVE9fUyA2MDYKPiA+
ICsjZGVmaW5lIFBDTEtfS0xBRCA2MDcKPiA+ICsjZGVmaW5lIEhDTEtfQ1JZUFRPX1MgNjA4
Cj4gPiArI2RlZmluZSBIQ0xLX0tMQUQgNjA5Cj4gPiArI2RlZmluZSBBQ0xLX0NSWVBUT19T
IDYxMAo+ID4gKyNkZWZpbmUgUENMS19PVFBDX1MgNjExCj4gPiArI2RlZmluZSBDTEtfT1RQ
Q19TIDYxMgo+ID4gKyNkZWZpbmUgUENMS19XRFRfUyA2MTMKPiA+ICsjZGVmaW5lIFRDTEtf
V0RUX1MgNjE0Cj4gPiArI2RlZmluZSBIQ0xLX1RSTkdfUyA2MTUKPgo+IEFyZSB0aGVzZSBz
ZWN1cmUgY2xvY2tzIG1lYW50IHRvIGJlIHVzZWQgYXMgU0NNSSBjbG9jayBpZHM/IFdoeSBh
IGdhcCBmcm9tCj4gNTI3IHRvIDYwMD8gSWYgSSBhbSBub3QgbWlzdGFrZW4gU0NNSSBpZHMg
c2hvdWxkIHNpbWlsYXIgdG8gTGludXggY2xvY2sgaWRzCj4gc3RhcnQgYXQgMCBhbmQgYmUg
YSBjb25zZWN1dGl2ZSBzZXJpZXMuCgpZZXMsIHRoZXNlIGFyZSBTQ01JIGNsb2NrIElEcy4g
VGhlIENSVSBJRHMgZW5kIGF0IDUyNywgYnV0IHRoZSBTQ01JCklEcyBhcmUgYSBzZXBhcmF0
ZSBzZXQuIFRoZSB2ZW5kb3IgaGVhZGVyIFsxXSB1c2VzIDYwMC02MTUgZm9yIHRoaXMKZ3Jv
dXAsIG1hdGNoaW5nIHRoZSBJRHMgaW4gdGhlIHJlbGVhc2VkIFJLMzU3MiBCTDMxIGZpcm13
YXJlLgoKSSBoYXZlbid0IGZvdW5kIHRoZSBSSzM1NzIgQkwzMSBzb3VyY2Ugb24gR2l0SHVi
LCBzbyBJIGNhbid0IHJlYnVpbGQKdGhlIGZpcm13YXJlLiBUaGF0IGFsc28gbWVhbnMgSSBj
YW4ndCBjaGFuZ2UgdGhlIGNsb2NrIElEcyBpdCBleHBvc2VzCnZpYSBTQ01JLiBJZiBJIG51
bWJlcmVkIHRoaXMgZ3JvdXAgZnJvbSB6ZXJvIGluIHRoZSBiaW5kaW5nLCBMaW51eAp3b3Vs
ZCByZXF1ZXN0IElEIDEgZm9yIHRoZSBERFIgY2xvY2ssIGJ1dCB0aGUgZmlybXdhcmUgb24g
ZXhpc3RpbmcKYm9hcmRzIGV4cGVjdHMgNjAxLiBXaXRoIHRob3NlIElEcywgSSB3b3VsZG4n
dCBiZSBhYmxlIHRvIHJlYWQgdGhlCmNvcnJlY3QgY2xvY2sgZGF0YSBvbiBteSBib2FyZC4K
CkknbGwgYWRkIHRoZSBTQ01JXyBwcmVmaXggaW4gdGhlIG5leHQgdmVyc2lvbiBhbmQga2Vl
cCB0aGUgZmlybXdhcmUgSURzCnVuY2hhbmdlZC4KCj4gWy4uLl0KPiA+ICsvKiBDUlUtLT5T
T0ZUUlNUX0NPTjAxICovCj4gPiArI2RlZmluZSBTUlNUX0FSRVNFVE5fVE9QX0JJVSAgICAg
ICAgICAgICAgICAgICAgIDAKPiA+ICsjZGVmaW5lIFNSU1RfUFJFU0VUTl9UT1BfQklVICAg
ICAgICAgICAgICAgICAgICAgMQo+ID4gKyNkZWZpbmUgU1JTVF9BUkVTRVROX1RPUF9NSURf
QklVICAgICAgICAgICAgICAgICAyCj4gPiArI2RlZmluZSBTUlNUX0hSRVNFVE5fVE9QX0JJ
VSAgICAgICAgICAgICAgICAgICAgIDMKPgo+IFBsZWFzZSBkcm9wIHRoZSB1bm5lY2Vzc2Fy
eS9yZWR1bmRhbnQgUkVTRVROIGluIGFsbCBjb25zdGFudHMuIFRoZSBTUlNUCj4gcHJlZml4
IGlzIGFscmVhZHkgYSBzaG9ydCBmb3IgU29mdHdhcmUgUmVzZXQuCgpJJ2xsIGZpeCB0aGUg
bmFtZXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4gUGxlYXNlIHNlZSBbMV0gZm9yIHRoZSBo
ZWFkZXIgSSBwcmVwYXJlZCBmb3IgVS1Cb290IG1haW5saW5lIFJLMzU3MiBzdXBwb3J0LAo+
IGl0IHNob3VsZCBoYXZlIGFsbCB0aGVzZSBzeW1ib2xzIGNsZWFuZWQgdXAsIHRvIG1hdGNo
IG5hbWluZyBwYXR0ZXJucyB1c2VkCj4gZm9yIGFsbCBjdXJyZW50bHkgc3VwcG9ydGVkIFJv
Y2tjaGlwIFNvQ3MuCj4KPiBbMV0gaHR0cHM6Ly9naXQudS1ib290LXByb2plY3Qub3JnL3Ut
Ym9vdC9jb250cmlidXRvcnMva3dpYm9vL3UtYm9vdC8tL2Jsb2IvcmszNTYyL2luY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQvcm9ja2NoaXAlMkNyazM1NzItY3J1LmgKClRoYW5rcywgSSds
bCBmb2xsb3cgdGhlIG5hbWluZyBjb252ZW50aW9uIGluIHlvdXIgaGVhZGVyIGluIHRoZSBu
ZXh0CnJldmlzaW9uLiBJIGRpZCBub3RpY2UgdHdvIHBvc3NpYmxlIGlzc3VlcyB3aXRoIHRo
ZSByZXNldCBJRHM6CgpZb3VyIGhlYWRlciBza2lwcyA0MjEgYmV0d2VlbiBTUlNUX0xJTktT
WU1fSERNSVRYUEhZMCAoNDIwKSBhbmQKU1JTVF9QX1BIUFBIWV9DUlUgKDQyMikuIEkndmUg
Zml4ZWQgdGhpcyBnYXAgaW4gdGhlIGN1cnJlbnQgcGF0Y2guCgpZb3VyIGhlYWRlciBhbHNv
IGFzc2lnbnMgSUQgNDUzIHRvIGJvdGggU1JTVF9IX1BNVTFfQklVIGFuZApTUlNUX0hfUE1V
MV9GVywgYnV0IHRoZSBsb29rdXAgdGFibGUgWzJdIG1hcHMgdGhlbSB0byBiaXRzIDkgYW5k
IDEwCm9mIFBNVTEgU09GVFJTVF9DT04wMywgcmVzcGVjdGl2ZWx5LiBDb3VsZCB5b3UgY29u
ZmlybSB3aGV0aGVyIHRoZXNlCnR3byByZXNldCBsaW5lcyBhcmUgbWVhbnQgdG8gc2hhcmUg
YW4gSUQ/CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3JvY2tjaGlwLWxpbnV4L2tlcm5lbC9i
bG9iLzQ3MGY5ZGNjYmRjNDJlN2I4YTgyNGQwYTVjNTY0MGExMGU5NDU3ZDIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9yb2NrY2hpcCxyazM1NzItY3J1LmgjTDU0Mi1MNTYwClsyXSBo
dHRwczovL2dpdC51LWJvb3QtcHJvamVjdC5vcmcvdS1ib290L2NvbnRyaWJ1dG9ycy9rd2li
b28vdS1ib290Ly0vYmxvYi84NWFmYzk0MTI2NmFmMDhhYjMwYTg5N2RkZTc5NGY5NTIzMjEw
MjVhL2RyaXZlcnMvcmVzZXQvcnN0LXJrMzU3Mi5jI0w2MDUtNjA2CgpCZXN0IHJlZ2FyZHMs
CkN1bmhhbyBMdQoKcHctYm90OiBjcgo=

